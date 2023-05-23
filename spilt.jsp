import React, {useState} from "react";
import TableCustom from "@/components/TableList/TableCustom";
import {Col, Form, Input, Row, Popconfirm, message, Modal, Tag, DatePicker, Select, ConfigProvider, Button} from "antd";
import {api} from "@/services/services";
import {POST} from "@/utils/request";
import AuthorityControl from "@/components/AuthorityControl";

const Index = () => {
    //判断入口
    const {href} = window.location;
    const isList = href.search('List') !== -1 ? true : false;

    // 搜索区域
    const renderSimpleForm = (form, handleSearch, handleReset) => {
        return (
            <Form className="ant-advanced-search-form">
                <Row gutter={24}>
                    <Col span={4}>
                        <Form.Item label="pd">
                            {form.getFieldDecorator('pd')(<Input placeholder="请输入"/>)}
                        </Form.Item>
                    </Col>
                </Row>
            </Form>
        )
    };


    // 列表需要显示的字段
    const columns = [
        {
            title: 'pd',
            dataIndex: 'pd',
            width: 50,
        },
        {
            title: 'pdnum',
            dataIndex: 'pdnum',
            width: 50,
        },
        {
            title: 'isprocess',
            dataIndex: 'isprocess',
            width: 100,
        },];

    const startSplit = ()=>{
        POST(api.data.split.start,{}).then(data => {
            if (data) {
                return;
            }
        })
    };

    const startQhai = ()=>{
        POST(api.data.split.startQhai,{}).then(data => {
            if (data) {
                return;
            }
        })
    };

    // 表头自定义按钮
    const button = () => (
        <>
            <Button onClick={() => startSplit()} icon="plus" type="primary"
                    style={{marginLeft: 10}}>无法定位</Button>
            <Button onClick={() => startQhai()} icon="plus" type="primary"
                    style={{marginLeft: 10}}>取出青海</Button>
        </>
    );

    return (
        <TableCustom
            title={button}
            rowKey="pd"
            search={renderSimpleForm}
            api={api.data.split.indexList}
            nodeName="indexList"
            columns={columns}
        />
    );
};

export default Form.create()(Index);

