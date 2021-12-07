Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4627E46B4B0
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 08:53:04 +0100 (CET)
Received: from localhost ([::1]:50804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muVHb-0008Sq-BH
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 02:53:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1muVEI-0005Nw-1M
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 02:49:38 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:44322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1muVEF-0005hc-Rs
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 02:49:37 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B74Yhlh019273; 
 Tue, 7 Dec 2021 07:49:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=PhoygmAXkNcUAqN9pVdYnobXZeQ6QsiktTxrv+UEfiM=;
 b=s+AEzSgVNr8ryR6ASOI9iVZqqk5u0g/TKdy9JmmXT55RpXFiu+q/9o/ZPnLHEHzfuxT/
 LQ7RTbZrKO+cL4U+Lzu7CEot4jaJorj7MtrR+6dHRMfmfJvpemGT7ERLp4Ksw2DVsdl5
 mGx1kUNIOzfrk5WwsUmhx6jkY7kttsTFKaEZblCqMBBRJM3Hz1fLz+4qUihJ0+uwyEkr
 mVdPvtQwn4ODOw6R0ZAhBI+clLwCoRaPZciKb09oBUIHh2e+ylE5rt1bplpWjAXjk+7C
 ZIT8Ara6ZVUtJXFfjK7eOkPiv586iizFAIUaAEswOAQbD5vgIyxn30woYErysYg3S5fK Qg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3csbbqmwh7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Dec 2021 07:49:26 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B77fFEo179442;
 Tue, 7 Dec 2021 07:49:26 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
 by aserp3030.oracle.com with ESMTP id 3csc4swy4k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Dec 2021 07:49:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SblStWlexBTc0JOj0+TcBhGwkc5CNK+1WDLz7rTAaBIsk+wJbdWSiurGyfuWLaPzTHnKW2K+dk0rYtAjW0cAN6nWPZ3dH6vlLTkClkRQa747eS7QOq93hRe+G0XLTIhxsYtk7lSZs83PrLKn3lzkA34BckJKfzcjPTWcUMKbWpsMwMW05gsQWTKuJyKo4yEe57CYLvw45zZuyJLPiIEO4YLgB/Mc+w4uTN3DRjSPCvYKY+aA/XbDyIKD/shkMKsdVq/H9PKdPgCYUtFBYkK0Go3UFEUIjDCXAIiXbHq3gAbx/H4tr+QGfZsLBBULW1OD2O/0sQZeHpiaaBIPxrKkJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PhoygmAXkNcUAqN9pVdYnobXZeQ6QsiktTxrv+UEfiM=;
 b=VtaFCX9RZMMB5aS8lhFBHf0PTPOreUBVWjoABrEViH3hQI7YJVJW3FJE0jQCNsEy6FdanlAbdgZE13g3dxCY7PSck4lDq4+ARg56PIHRW10u+CLK/pI5EIMTI6RvhVz2pbyC6Ko5DUCNPmWexvLctyJnIZUa7OQYaGJuHHu3DK3vKECnogrGpjCPAz3xADCgUaCFQuO9KfviDWj6bhdPuJiCC52Kg6ziMOz91Nac2hFbhI6MWvPw6YfL+zTCoVc/QkKZvFy4kRi5UjKALcy4iqf5yx8Z+jY5wV0+O+dkUug3+E9gTUhVbxIf7VyLSLI1CCM9YBxTjrq4mya4VjJmrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PhoygmAXkNcUAqN9pVdYnobXZeQ6QsiktTxrv+UEfiM=;
 b=bOuqHIerA4XmpMcRD6eVJ/4yt9btYYsLp+xkfHhuzUPx8jabzGT0488mk/w/a93wJ8WGAYBoGSBsrbIMLjboNZgpJbwW69Ck5SxiNMUi/gBG1CnGiSW/2O2VO54QqE50Y4xzOg6Rqu9mUtH9cpBnoDdlHRuy6zx7r2waT5yzL5U=
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com (2603:10b6:a03:2d7::23)
 by BY5PR10MB4225.namprd10.prod.outlook.com (2603:10b6:a03:20f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Tue, 7 Dec
 2021 07:49:24 +0000
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::3c06:36a6:bab9:fffd]) by SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::3c06:36a6:bab9:fffd%2]) with mapi id 15.20.4755.022; Tue, 7 Dec 2021
 07:49:24 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [RFC v3 06/19] vfio-user: Define type vfio_user_pci_dev_info
Thread-Topic: [RFC v3 06/19] vfio-user: Define type vfio_user_pci_dev_info
Thread-Index: AQHX0botEjsuxOiEy0+bw9HYoYKWZKwLifoAgBtQeQA=
Date: Tue, 7 Dec 2021 07:49:24 +0000
Message-ID: <9C04F6B6-AABF-4222-B556-2E4A87DA0C01@oracle.com>
References: <cover.1636057885.git.john.g.johnson@oracle.com>
 <28d95a317e70c418dc054a59db307d9c49411ca6.1636057885.git.john.g.johnson@oracle.com>
 <20211119154222.525dfb71.alex.williamson@redhat.com>
In-Reply-To: <20211119154222.525dfb71.alex.williamson@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 118e29c9-16c4-4639-8cbe-08d9b956166b
x-ms-traffictypediagnostic: BY5PR10MB4225:EE_
x-microsoft-antispam-prvs: <BY5PR10MB42258935B7725DC981549C58B66E9@BY5PR10MB4225.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +ICFoqUVX7lFOP2rcvbcYpgnorI6KxE7FCmm4razL9ZCXXbnn9F+X+W5EiY+E5QdRIUIKPd225WHRsr0cTg4dlSjmxH+XxtGGuoURo+8zryvNGZybRxAEJx9rrTSEoB23ODlVHSgjydrmrjvdAbTithryfzzG8seyrpOIa+i6i+K4BGfRkFZ/v9tP0WuxTOYSA/Sfq9WG+h6fVEC3F2jfwGXsYuYsxbZ9I8ZVClSWlPyysCu6vpxxvRaNvjIvnaGN0X6kgX+szby8U8PBNwmA8vuQSAbpNMoHNHNl09UthpluotsiIuYGo6zX5rkG3mVS2HOXzxr/ttS4aZMHH4vUNIBCO0DLi67RvD34JNa1ZGrLvloTp8xZmbuUORdb8vbrWdCO310buhq5EFfdAajjC2hp6T5jhkO3LfTzLUP0WFFl3nyjL0n6yCilW5X+mLZkvIGzu10JzNSuBYnbpsXq5cHNpoj7ywJ29PdVE7NaZEr3I5yU6K79NthTP1qtNbbB7P63Wu9mJzTDFDhHS/DguCKLoXaeTxEdEt8E4vrEDT/fGeL+UOCdaSa5GU5wPxzF0S9yyNRWH81UnfiZN99DWpEHP9qsbnPSeF9Gl5AYy5PeNOsIGnAgLgFR/JgNu8PEYXqvaHrqdq3038On+3X9oWklprBkwqf4Cqhgm5m6Uw2/iv3nPThvqwvXQpolvD6P34QxGarqVcqMUOeVwrZOnPdTJwPeCzKjOPioS/PXTRXgZnhyY3Qtnqc0xuaxTbI
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4686.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38070700005)(71200400001)(6512007)(8676002)(66556008)(66476007)(64756008)(66946007)(316002)(33656002)(6916009)(66446008)(53546011)(6486002)(186003)(83380400001)(38100700002)(76116006)(5660300002)(2616005)(36756003)(4326008)(8936002)(26005)(122000001)(6506007)(508600001)(2906002)(86362001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Sms5WVRxbU40N1JEOHdBUHZSVFMwSlR5MTc2Q2VBOTEyQzB6WFpDYkk3cHVh?=
 =?utf-8?B?aWpQTjAvRDlNSG9lNy9sWE9ISG15cTVzd0cvSFJJcWpFRkxKSHRsbUwvYndt?=
 =?utf-8?B?WS91MlhCK0QweFBMdUNIUG1NdHEyZnpmSkhSRmFhOEREUFc3UFZDbHo5cU9r?=
 =?utf-8?B?WGNPRENRUUtuSFlmQTNjeS9ORnB3ZWdYUXhJZGlxUkk1MFNyWkFmK2EvNHYy?=
 =?utf-8?B?czZxREppMGxLR05MSzFxeDNPQmdqOGtJUk1EWldRblpZdmFEUjRGVkZvbmI0?=
 =?utf-8?B?OFVYb1ZFdzJRNUhJaDhqWWxOREtzS3pEUDF1bXdtSHFWNTlQT1RwZEJua0hr?=
 =?utf-8?B?QXF1VWJVS2VCSW4vMktaclJwYkR6MlVSS3hwK3R1b0NBZmgrNDdoYzZ3NTBi?=
 =?utf-8?B?bEFVdmFUVUlHanQ2akYzeFB1ZnFwOU43YzRzeDZZTDFQVTg1ejM3dU5qMG9V?=
 =?utf-8?B?bzBzV2FqdllnVndyVE5BOTVnWHN6bUxHeUpzRFNHV0hGRW5ObXYwSEFJVjZF?=
 =?utf-8?B?Z05IeUR2cERUTEl3MXE5anlCaWVWdHFrYVJCdExZV2gvTHNmYys3WTB1cTJi?=
 =?utf-8?B?dTZuNjBWVSsrazVZTXB5SzY1LzdFUFA4Vkw0ZGZ5MTcxaHlpTVV1anc2Wmk4?=
 =?utf-8?B?OGhiVGZ5QWthd0ZSTkRQSTNITGhDeW9KZzUzbDFabjVIQTF3K2dYVWlvc2lI?=
 =?utf-8?B?T0N5anNSQVpRMWJ4bUdBM2VBaFYxQTRIbVU4UXJyUU5oa0lrRVRKQnlmSVR2?=
 =?utf-8?B?ZE9EYmw4a0ZZcS9FMFp2MjR3U1dsbWpjWUpYSmFWNmpHWncyMGNDSTl4dzEv?=
 =?utf-8?B?SVhsak01S2wzMENtWGx0ZGl5b3kvWkhhY2c2dWpLeWFCeU83M1NvWW5JREpr?=
 =?utf-8?B?KzNkT2hiais3b3ZlQ0tmbysxNGRaeEtRWXorYUw5TVRaRHZaYXpMUHh0YUV6?=
 =?utf-8?B?NU5ZTHp1OUJrZ1BqS3BRd2tISnJqUGY2VWp6b0dCY1NmZ2EwODh4ZVdSNlkv?=
 =?utf-8?B?cU5WS2dIREZyeXlPZFd5dXNKMW9XOWNLeGxraVk0eTR0aklTUVJiTVZNTFRk?=
 =?utf-8?B?Yit1dTRLbnRlMFZIRThSUUM1V1BNVXlTNWU4anFDMnhMS1lrT3Q0NkZPekVq?=
 =?utf-8?B?QjQ1dWluWmZXSjc1Q1k3WGs5TmhFbW1NQ2dPM0FGVEhncXdETURUSm4yaElZ?=
 =?utf-8?B?S0pFVjZ0VnAzSFlRekNadytIUVBPaDl0T1JYSFl3NmlHaDhsS2gwZFhoQ2hP?=
 =?utf-8?B?V2ExL3J1V1ZYZE8yN2NHR1BYQS9xblBJQUpJc3lEQ3p3UVFyS0xXL0FtdVY0?=
 =?utf-8?B?OWpOWWlleG16a2oyS3JnOFQ3RUgvbkx4RFVxZVdleFpXSm9yQnBCd1Jsa2t4?=
 =?utf-8?B?YzRVZFY3K01lcTR4ZWtYcjQwRmgvcWNHMTJoZDBVYmFHbWtyNnhkdTZWTC80?=
 =?utf-8?B?TmJkRkxyRm94bWNFajBqdUdFWDlyVDVJZEZ3NkRuOVBObnRCbDJXdDNvNGJC?=
 =?utf-8?B?cERocnRQVll6cEEzRTZmR2RhT3Ryc01RRmx5T1NHRWNHOE8xV2JLTGFEaTYz?=
 =?utf-8?B?Z29TbUF2K0s0c2NJTEYvR21nRGdzWmZGZ3BhMUVUaGVIdzVwU3krRndWRUVh?=
 =?utf-8?B?bXFQYlZSOGo4RVhBQzJRQnZ6T0tUMjE0VXd6emlhSmNJSDFkd2dIVmI1KzQz?=
 =?utf-8?B?eHVpZjA2T25lSkJKbVY1QVRQaEtWWTk3Q0k2UFdGOUtWQ3A5TExNaFdoRWxp?=
 =?utf-8?B?ZFB0NlkrVmNYK0ZqaVZSeDlUallCTXd4QXNSc2tYQW5pNFhNd2QrQlRxUkRj?=
 =?utf-8?B?bnZhVEw4Qmh6NEhEZS9XYUlLS1JXYm5FTzk2b1h6bmoxMmQzbTN0NzhtaFdT?=
 =?utf-8?B?ZmQybE5aeEJQK0lsclNUamF3WE96YzRnSmdENXNIV09Kc1ZVaDFxVEtWRWlZ?=
 =?utf-8?B?T0hjVFJveVVQNXRSWXNNWmVOc3p2UFRzSzUyRkRLOEVWenB2RFN0aVNQR3NU?=
 =?utf-8?B?MnAxTmc5R2l6VWpySWxiQzhWRnppQUg0clQxb3BObE1MbnFlUHlsVG1idjlh?=
 =?utf-8?B?L3R2RUJieGo3L0wvcEpJckZMTUwyTXlLaktTN282UXZYd3JURVhmTzZSeDRB?=
 =?utf-8?B?TmFhaWpyZy9XMGRsL21NOTV1SW9DZ3pPdVh3V0RYT2p6eHZubWdMRkM3OFVn?=
 =?utf-8?B?c3NmZXVGOCtYMXNwZUlZQnpKMkVSeXFzWXAySEdOWXpUOWZ6aTlubE5xSHhT?=
 =?utf-8?Q?x5BalBYifbbMgNIXQiiLo5jDUznTQnbKRmAEgXUaco=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D3FED4A4BB6B584781085D3FFDAEA164@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4686.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 118e29c9-16c4-4639-8cbe-08d9b956166b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2021 07:49:24.3171 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rGL1GvG0k1v8OhXQJnwwYnFRPY8PAcAo+lc9Mq1MwoMoKAFoJY+UG9boJoxAyFMpBUFfX43Cd9nKF5jnfk434zE68HwK1oeGNYeeD9F0VAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4225
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10190
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112070044
X-Proofpoint-GUID: 0M-lXRYyuU6MRWlYgW2S-wKQm3Y3XxtW
X-Proofpoint-ORIG-GUID: 0M-lXRYyuU6MRWlYgW2S-wKQm3Y3XxtW
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Devel Mailing List <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gTm92IDE5LCAyMDIxLCBhdCAyOjQyIFBNLCBBbGV4IFdpbGxpYW1zb24gPGFsZXgu
d2lsbGlhbXNvbkByZWRoYXQuY29tPiB3cm90ZToNCj4gDQo+IE9uIE1vbiwgIDggTm92IDIwMjEg
MTY6NDY6MzQgLTA4MDANCj4gSm9obiBKb2huc29uIDxqb2huLmcuam9obnNvbkBvcmFjbGUuY29t
PiB3cm90ZToNCj4gDQo+PiBOZXcgY2xhc3MgZm9yIHZmaW8tdXNlciB3aXRoIGl0cyBjbGFzcyBh
bmQgaW5zdGFuY2UNCj4+IGNvbnN0cnVjdG9ycyBhbmQgZGVzdHJ1Y3RvcnMsIGFuZCBpdHMgcGNp
IG9wcy4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogRWxlbmEgVWZpbXRzZXZhIDxlbGVuYS51Zmlt
dHNldmFAb3JhY2xlLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IEpvaG4gRyBKb2huc29uIDxqb2hu
Lmcuam9obnNvbkBvcmFjbGUuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogSmFnYW5uYXRoYW4gUmFt
YW4gPGphZy5yYW1hbkBvcmFjbGUuY29tPg0KPj4gLS0tDQo+PiBody92ZmlvL3BjaS5oICAgfCAg
OSArKysrKysNCj4+IGh3L3ZmaW8vcGNpLmMgICB8IDk3ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4gaHcvdmZpby9LY29uZmlnIHwg
MTAgKysrKysrDQo+PiAzIGZpbGVzIGNoYW5nZWQsIDExNiBpbnNlcnRpb25zKCspDQo+PiANCj4+
IGRpZmYgLS1naXQgYS9ody92ZmlvL3BjaS5oIGIvaHcvdmZpby9wY2kuaA0KPj4gaW5kZXggYmJj
NzhhYS4uMDhhYzY0NyAxMDA2NDQNCj4+IC0tLSBhL2h3L3ZmaW8vcGNpLmgNCj4+ICsrKyBiL2h3
L3ZmaW8vcGNpLmgNCj4+IEBAIC0xODcsNiArMTg3LDE1IEBAIHN0cnVjdCBWRklPS2VyblBDSURl
dmljZSB7DQo+PiAgICAgVkZJT1BDSURldmljZSBkZXZpY2U7DQo+PiB9Ow0KPj4gDQo+PiArI2Rl
ZmluZSBUWVBFX1ZGSU9fVVNFUl9QQ0kgInZmaW8tdXNlci1wY2kiDQo+PiArT0JKRUNUX0RFQ0xB
UkVfU0lNUExFX1RZUEUoVkZJT1VzZXJQQ0lEZXZpY2UsIFZGSU9fVVNFUl9QQ0kpDQo+PiArDQo+
PiArc3RydWN0IFZGSU9Vc2VyUENJRGV2aWNlIHsNCj4+ICsgICAgVkZJT1BDSURldmljZSBkZXZp
Y2U7DQo+PiArICAgIGNoYXIgKnNvY2tfbmFtZTsNCj4+ICsgICAgYm9vbCBzZWN1cmVfZG1hOyAv
KiBkaXNhYmxlIHNoYXJlZCBtZW0gZm9yIERNQSAqLw0KPj4gK307DQo+PiArDQo+PiAvKiBVc2Ug
dWluMzJfdCBmb3IgdmVuZG9yICYgZGV2aWNlIHNvIFBDSV9BTllfSUQgZXhwYW5kcyBhbmQgY2Fu
bm90IG1hdGNoIGh3ICovDQo+PiBzdGF0aWMgaW5saW5lIGJvb2wgdmZpb19wY2lfaXMoVkZJT1BD
SURldmljZSAqdmRldiwgdWludDMyX3QgdmVuZG9yLCB1aW50MzJfdCBkZXZpY2UpDQo+PiB7DQo+
PiBkaWZmIC0tZ2l0IGEvaHcvdmZpby9wY2kuYyBiL2h3L3ZmaW8vcGNpLmMNCj4+IGluZGV4IDZl
MmNlMzUuLmZhM2UwMjggMTAwNjQ0DQo+PiAtLS0gYS9ody92ZmlvL3BjaS5jDQo+PiArKysgYi9o
dy92ZmlvL3BjaS5jDQo+PiBAQCAtMTksNiArMTksNyBAQA0KPj4gICovDQo+PiANCj4+ICNpbmNs
dWRlICJxZW11L29zZGVwLmgiDQo+PiArI2luY2x1ZGUgQ09ORklHX0RFVklDRVMNCj4+ICNpbmNs
dWRlIDxsaW51eC92ZmlvLmg+DQo+PiAjaW5jbHVkZSA8c3lzL2lvY3RsLmg+DQo+PiANCj4+IEBA
IC0zNDM4LDMgKzM0MzksOTkgQEAgc3RydWN0IFZGSU9WYWxpZE9wcyB2ZmlvX3BjaV92YWxpZF9v
cHMgPSB7DQo+PiAgICAgLnZhbGlkYXRlX2dldF9yZWdpb25faW5mbyA9IHZmaW9fcGNpX3ZhbGlk
X3JlZ2lvbl9pbmZvLA0KPj4gICAgIC52YWxpZGF0ZV9nZXRfaXJxX2luZm8gPSB2ZmlvX3BjaV92
YWxpZF9pcnFfaW5mbywNCj4+IH07DQo+PiArDQo+PiArDQo+PiArI2lmZGVmIENPTkZJR19WRklP
X1VTRVJfUENJDQo+PiArDQo+PiArLyoNCj4+ICsgKiB2ZmlvLXVzZXIgcm91dGluZXMuDQo+PiAr
ICovDQo+PiArDQo+PiArLyoNCj4+ICsgKiBFbXVsYXRlZCBkZXZpY2VzIGRvbid0IHVzZSBob3N0
IGhvdCByZXNldA0KPj4gKyAqLw0KPj4gK3N0YXRpYyBpbnQgdmZpb191c2VyX3BjaV9ub19yZXNl
dChWRklPRGV2aWNlICp2YmFzZWRldikNCj4+ICt7DQo+PiArICAgIGVycm9yX3ByaW50ZigidmZp
by11c2VyIC0gbm8gaG90IHJlc2V0XG4iKTsNCj4+ICsgICAgcmV0dXJuIDA7DQo+PiArfQ0KPj4g
Kw0KPj4gK3N0YXRpYyB2b2lkIHZmaW9fdXNlcl9wY2lfbm90X25lZWRlZChWRklPRGV2aWNlICp2
YmFzZWRldikNCj4+ICt7DQo+PiArICAgIHZiYXNlZGV2LT5uZWVkc19yZXNldCA9IGZhbHNlOw0K
Pj4gK30NCj4gDQo+IFNlZW1zIGxpa2Ugd2Ugc2hvdWxkIG1ha2Ugc29tZSBvZiB0aGVzZSBvcHRp
b25hbCByYXRoZXIgdGhhbiBzdHViYmluZw0KPiBkdW1teSBmdW5jdGlvbnMuDQo+IA0KDQoJb2sN
Cg0KPj4gKw0KPj4gK3N0YXRpYyBWRklPRGV2aWNlT3BzIHZmaW9fdXNlcl9wY2lfb3BzID0gew0K
Pj4gKyAgICAudmZpb19jb21wdXRlX25lZWRzX3Jlc2V0ID0gdmZpb191c2VyX3BjaV9ub3RfbmVl
ZGVkLA0KPj4gKyAgICAudmZpb19ob3RfcmVzZXRfbXVsdGkgPSB2ZmlvX3VzZXJfcGNpX25vX3Jl
c2V0LA0KPj4gKyAgICAudmZpb19lb2kgPSB2ZmlvX2ludHhfZW9pLA0KPj4gKyAgICAudmZpb19n
ZXRfb2JqZWN0ID0gdmZpb19wY2lfZ2V0X29iamVjdCwNCj4+ICsgICAgLnZmaW9fc2F2ZV9jb25m
aWcgPSB2ZmlvX3BjaV9zYXZlX2NvbmZpZywNCj4+ICsgICAgLnZmaW9fbG9hZF9jb25maWcgPSB2
ZmlvX3BjaV9sb2FkX2NvbmZpZywNCj4+ICt9Ow0KPj4gKw0KPj4gK3N0YXRpYyB2b2lkIHZmaW9f
dXNlcl9wY2lfcmVhbGl6ZShQQ0lEZXZpY2UgKnBkZXYsIEVycm9yICoqZXJycCkNCj4+ICt7DQo+
PiArICAgIEVSUlBfR1VBUkQoKTsNCj4+ICsgICAgVkZJT1VzZXJQQ0lEZXZpY2UgKnVkZXYgPSBW
RklPX1VTRVJfUENJKHBkZXYpOw0KPj4gKyAgICBWRklPUENJRGV2aWNlICp2ZGV2ID0gVkZJT19Q
Q0lfQkFTRShwZGV2KTsNCj4+ICsgICAgVkZJT0RldmljZSAqdmJhc2VkZXYgPSAmdmRldi0+dmJh
c2VkZXY7DQo+PiArDQo+PiArICAgIC8qDQo+PiArICAgICAqIFRPRE86IG1ha2Ugb3B0aW9uIHBh
cnNlciB1bmRlcnN0YW5kIFNvY2tldEFkZHJlc3MNCj4+ICsgICAgICogYW5kIHVzZSB0aGF0IGlu
c3RlYWQgb2YgaGF2aW5nIHNjYWxhciBvcHRpb25zDQo+PiArICAgICAqIGZvciBlYWNoIHNvY2tl
dCB0eXBlLg0KPj4gKyAgICAgKi8NCj4+ICsgICAgaWYgKCF1ZGV2LT5zb2NrX25hbWUpIHsNCj4+
ICsgICAgICAgIGVycm9yX3NldGcoZXJycCwgIk5vIHNvY2tldCBzcGVjaWZpZWQiKTsNCj4+ICsg
ICAgICAgIGVycm9yX2FwcGVuZF9oaW50KGVycnAsICJVc2UgLWRldmljZSB2ZmlvLXVzZXItcGNp
LHNvY2tldD08bmFtZT5cbiIpOw0KPj4gKyAgICAgICAgcmV0dXJuOw0KPj4gKyAgICB9DQo+PiAr
DQo+PiArICAgIHZiYXNlZGV2LT5uYW1lID0gZ19zdHJkdXBfcHJpbnRmKCJWRklPIHVzZXIgPCVz
PiIsIHVkZXYtPnNvY2tfbmFtZSk7DQo+PiArICAgIHZiYXNlZGV2LT5kZXYgPSBERVZJQ0UodmRl
dik7DQo+PiArICAgIHZiYXNlZGV2LT5mZCA9IC0xOw0KPj4gKyAgICB2YmFzZWRldi0+dHlwZSA9
IFZGSU9fREVWSUNFX1RZUEVfUENJOw0KPj4gKyAgICB2YmFzZWRldi0+bm9fbW1hcCA9IGZhbHNl
Ow0KPiANCj4gV2h5IGhhcmQgY29kZWQgcmF0aGVyIHRoYW4gYSBwcm9wZXJ0eT8gIFRoaXMgaXMg
YSB1c2VmdWwgZGVidWdnaW5nDQo+IGZlYXR1cmUgdG8gYmUgYWJsZSB0byB0cmFwIGFsbCBkZXZp
Y2UgYWNjZXNzZXMuICBUaGUgZGV2aWNlIHNob3VsZCB3b3JrDQo+IGVpdGhlciB3YXkuDQo+IA0K
DQoJQXMgSSBzYWlkIGluIHRoZSBlYXJsaWVyIHByb3BlcnR5IHJlcGx5LCBJIHRob3VnaHQgdGhl
c2Ugd2VyZQ0KSFcgd29ya2Fyb3VuZHMuDQoNCg0KDQo+PiArICAgIHZiYXNlZGV2LT5vcHMgPSAm
dmZpb191c2VyX3BjaV9vcHM7DQo+PiArICAgIHZiYXNlZGV2LT52YWxpZF9vcHMgPSAmdmZpb19w
Y2lfdmFsaWRfb3BzOw0KPj4gKw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgdm9pZCB2ZmlvX3Vz
ZXJfaW5zdGFuY2VfZmluYWxpemUoT2JqZWN0ICpvYmopDQo+PiArew0KPj4gK30NCj4+ICsNCj4+
ICtzdGF0aWMgUHJvcGVydHkgdmZpb191c2VyX3BjaV9kZXZfcHJvcGVydGllc1tdID0gew0KPj4g
KyAgICBERUZJTkVfUFJPUF9TVFJJTkcoInNvY2tldCIsIFZGSU9Vc2VyUENJRGV2aWNlLCBzb2Nr
X25hbWUpLA0KPj4gKyAgICBERUZJTkVfUFJPUF9CT09MKCJzZWN1cmUtZG1hIiwgVkZJT1VzZXJQ
Q0lEZXZpY2UsIHNlY3VyZV9kbWEsIGZhbHNlKSwNCj4gDQo+IEFkZCB0aGlzIHdoZW4gaXQgbWVh
bnMgc29tZXRoaW5nLiAgVGhhbmtzLA0KPiANCg0KCVRoaXMgY2FuIGJlIG1vdmVkIHRvIHRoZSBw
YXRoIHRoYXQgdXNlcyDigJlzZWN1cmVfZG1h4oCdDQoNCgkJCQkJCUpKDQoNCg0K

