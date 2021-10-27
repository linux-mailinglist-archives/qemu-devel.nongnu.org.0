Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C734343C9A6
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 14:28:35 +0200 (CEST)
Received: from localhost ([::1]:50332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfi2k-0008NH-Pa
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 08:28:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mfi0E-0006LE-VQ
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 08:25:59 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:46990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mfi0C-0004ui-EQ
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 08:25:58 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19RCCVOb022567; 
 Wed, 27 Oct 2021 12:25:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=VQyhWG5HHQxVNh6iPyqLog6KZI4urs4A1FQLMymZ4Mk=;
 b=G5EP4Ef2sImTN6VH1+e4H/VcyDdQ7p962ZZW2BIYtP/Vf0Z0P89Uty2XkFa2H6JYsYl5
 z1ZQne9LkuEBPykyCgg9crx1WRE4qQP1S73oP9yVjUPFYmEuH0Zl9a54Pa42PEcQ3G9h
 TI2ZEEjQBZxTOx5CJi8UyoHgzkR3EGbTUcStZdCLOprcMjXbwiZaylgR3NJCR2Oogqgh
 H5IE2BQznPNOnykcnv2IwUh4wy3XMjwdpY2yRLvhXZgc/+kqZrAlq13dQsoNmDPmxwls
 kN2pvwrPyDq7Zu0aciq7RASAJ7pPQDxPj5rFgcBfB+9t8GtP0+Ks8zMP9+q+jO2bsdmt uA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bx4fjjv81-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 12:25:32 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19RCBYuC116958;
 Wed, 27 Oct 2021 12:25:31 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
 by aserp3020.oracle.com with ESMTP id 3bx4gcm7mq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 12:25:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jRtKAV7QgmWbGB8L5NAcWQxQcYIEI6SC92VHcJvIR0T1bb2u9PYGzznGynY/G/BYwwdTOatkqnbB4flYNBiTWGZsHkGTlvjHbol+dc3gvLVV4JPNAEquEVy+NKJFAZuKXlMrGKl+/JlRPfuoVsOEQ8FacTa+FS0C/igTRqy8gmETuH4MnAC+dP4DbORPLO7n1zoHSPeeB4lJDhrB2MMLtY3hKw6wIk07rkIoea6TBDIqgkhlcC9xp3lf+sloiCG4n7NQTwMS/nI7Kc29/w8HQyyCrHGQocVoimKAJVGfx/+fyIjwVkVYxirrFphIDuMVTZasFYSU3szq15uD1+24yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQyhWG5HHQxVNh6iPyqLog6KZI4urs4A1FQLMymZ4Mk=;
 b=gTF2WGXotp9HPPjPleuPieJK7W4OG8KwgbzliRPIoKLvounIOGmd8NogIa8sSptGAJQfeVTAt11I+bmVZWCgDBSOUomadqRC7RyFsDyxnZ7IpzB9TTxz/O7jANoDkKCva/7wRaWnh3qis5lfJTNC+ovCGN0Yptzy53B7KkuZrBl0Ve/VFLQ0wsVxr/xiBgVyTY+n6xCruhuESuPb21e5wN9UStp2lAZIP1fuRg3HvTXd+7AIc34u9EVCISpZyZgmorg/v71rb9H8+YIHZx93iDTvQP49VDbePXyYgFLEfXbe7TiFCPpFY5rCoXhXu3zcftr8fY/mRNrmvr3FIKeBTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQyhWG5HHQxVNh6iPyqLog6KZI4urs4A1FQLMymZ4Mk=;
 b=lWA2SmkmdiPdG+xIYCXYa5zlqZIkZbnrCMggQEzWQc+QjgAOmVat74tKYjW6qPDD22ts5BcLsGRSM8+OTAVguw1+h+EDXj607FTvWikyDsgiGpSV/K96nUYgd/yBLNm6ICzP+NDzi1gZmmyYuBqR6WgGIdelFk5pPCGi3usdxEE=
Authentication-Results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (20.179.156.209) by
 BY5PR10MB4242.namprd10.prod.outlook.com (52.135.55.73) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14; Wed, 27 Oct 2021 12:25:29 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::b8d3:402a:4d8:139e]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::b8d3:402a:4d8:139e%3]) with mapi id 15.20.4649.014; Wed, 27 Oct 2021
 12:25:29 +0000
Message-ID: <9074c52d-0918-57c3-dc95-e4742830ff7d@oracle.com>
Date: Wed, 27 Oct 2021 08:25:22 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH V6 00/27] Live Update
Content-Language: en-US
To: Zheng Chuan <zhengchuan@huawei.com>, qemu-devel@nongnu.org
References: <1628286241-217457-1-git-send-email-steven.sistare@oracle.com>
 <6d048286-eef4-0f6a-58da-7fc7369dccf7@huawei.com>
 <5e5821eb-ce92-f429-0ec8-985e714a171a@oracle.com>
 <83231acb-bbb5-f590-d58b-e664880c41f8@huawei.com>
 <24e53925-ea78-b31e-2c73-0c52943c1106@oracle.com>
 <9219c81d-ade6-76d8-60ee-b6188d5dedde@huawei.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <9219c81d-ade6-76d8-60ee-b6188d5dedde@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN4PR0501CA0086.namprd05.prod.outlook.com
 (2603:10b6:803:22::24) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
Received: from [10.39.199.91] (138.3.201.27) by
 SN4PR0501CA0086.namprd05.prod.outlook.com (2603:10b6:803:22::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.4 via Frontend
 Transport; Wed, 27 Oct 2021 12:25:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08e052c3-69d2-434d-d926-08d99944dccb
X-MS-TrafficTypeDiagnostic: BY5PR10MB4242:
X-Microsoft-Antispam-PRVS: <BY5PR10MB42429857A2265D669F8294E0F9859@BY5PR10MB4242.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YBjA+K7J1vEQXY/7x4794MaitG/17XAOQIEHQb9sy02lLaovFeVXNcjvPdstPp2t0h1EcSq21eX4XorJxk2hdXc77pHo50Ygw9YaRx/xpnw+e+zc45E86lcy9Sz4oGQpYQxm32oOKU4JMF5ReKt5F8aY65gwbPqRCkAsLpJvi5il2YlFOu5GFJXZimTKPRS+AuKZRRAEKU4GxB9t1Xng5yKhejb1ZPjn4rmPdY3n3jWPfAebs7l0BQY1Yuq/IFwtHqVq/wUUzlGS/b9WviHV5sK1ed82IFiBUo9fx4UA5eSz8GhI2dMhS5BMdI1TudRMVXHo2x6tr8OWii3j6FtMXl4jWmNi7hsqzJazrHal4/sGDJ7AP+J9ilZeVyBDu2ijqCzPMcRHOjdrFrNdgvWMrVwvdPA85lLt89wP6DiADiF2n7lcxp7/l7HJfNYYl37MXkzy36ko+j8e9Y2LY/YSs0bOoVz0n4mgAw9nGMLe3xIb1RRQVxlI3XK+nvNjp7Znsz5whidRdahUlriBVmH+cDQ0EEfNHOVuVYU1ixzwXylII3OoXTvqmOYHcBIeshDm3AsoQTxp2c7bwrZ6880cQm4TyvPVpBlysO+JFDnWsTAX6ZpiFpAiyl3wQW7x1nAvWJsLUifHTeh6AqApRKO8wM42yw36GQ6YxWG+RCG+iHe7lUBSTM5hS4Ri6g7SN68C8oEhxC+7CPjOIF0s83ZeZn7bYy0fq29kiUxxMFJz7Zo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(956004)(508600001)(4326008)(15650500001)(5660300002)(53546011)(8936002)(7416002)(83380400001)(6486002)(2906002)(31696002)(8676002)(36916002)(66556008)(186003)(16576012)(31686004)(66946007)(54906003)(66476007)(558084003)(86362001)(36756003)(6666004)(2616005)(26005)(44832011)(38100700002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUo2ZmM3TUw4cG0rQkdjZnpZOUtndHgyWmRVWnZFZkdPTkZUdnlrc3ZxT2k0?=
 =?utf-8?B?bkhmNEhVa1RSZ05VOUhTdE5GS3ZFTXYyQjQ0U0NIdWJVZjN3dVdmeC8yTzJp?=
 =?utf-8?B?elhCelZqZWY4Q2NJVzd6UlNWcVNtS3Y4NnF0QVBGN2o2R0VFbEQ2dU1QMVlw?=
 =?utf-8?B?SGh3eFVnWDFFbTBmd284NmlPTFJUL1VRRzIxRGFMWkZGQmFsdjNkNjdxRGZl?=
 =?utf-8?B?bzZiY1hla2Y3MnJYcDhoOG5WV0V6d29vUlpyYkpYbWxwck94clc3aXFZdjND?=
 =?utf-8?B?VU81VVJOdlZBa0tWVXY0WDUrc2ZHRlpoODhMTE1tc29ZL0hoaXdqYXQ1VVZK?=
 =?utf-8?B?K2o3SEdSQXdwc042b2JzeUc0NitPdlRDMlp4YjhSMjl3VUJOcEQwMCs1eTJu?=
 =?utf-8?B?SmNLNzdUZHZZV1ltVkRGRXdrU2tPckV4RkpXa3FYNjBUWEIxUy81TURBOVZq?=
 =?utf-8?B?L2s5TGc4UVRYNFk1Qk45bFgxZmlFSzNoeFhIVEQ2WHFucWpxK3ZiSk9FL1hP?=
 =?utf-8?B?WTZTZWJ1d1NFSnQwN29xd2cyT05abW4rZ1U2WkNiVVhUZ1ZIR2kvRUozaG5j?=
 =?utf-8?B?SWkyd2FUWU4xL2VTYk1zMzVhN3cyM2FjbTFyZVRZQUx1ODE4aEdhZHhTWDJa?=
 =?utf-8?B?MWVjQytwZmk4aEMxUExaNlZTb1RuenFIeld0S2hNQmY0K0crdTh4dkk3dlIy?=
 =?utf-8?B?RC96ZjFlZlVGM1ZEUUxQaUhsNWNkQWlpR0xVV1VTNzhNU3JEVWxkMlNNK2g3?=
 =?utf-8?B?UGVzUU5RUnp3blI5cDlSN2ovbVNLRHQ5THZabHJOeTRUa0FUUGNKVDluVHFT?=
 =?utf-8?B?czhTcDl1RnRIYkJ1Z2lObkQ1SVhWajdHRFAveFZZdmRwVVdQZUVpanVWYWRi?=
 =?utf-8?B?eDhjTWdnUEMvQllsNzNhMlg4Z2diWnFEWTFkczdkQlYrL2RSSWpIcFIyOEFx?=
 =?utf-8?B?aHQ1MzFSUEVuaDE3UjZ0bHRDNkRmODdmS3pSa0NGZzhoOElma3JGZjh0dXF0?=
 =?utf-8?B?Szk3cXUyRXFjL3Yya2licE84c28xdzNITGtHYzJPaUwrUGlXb0c3bEFlTzE4?=
 =?utf-8?B?S1ptN0E4dGw2RU14KzBJTDRRdnc5cVlIdlVRNkZRdmovWS9UZGlzdUtZakJk?=
 =?utf-8?B?MUcvL1p6WkpWV2g5WmsxT0o4YTlSMEdVWGFYR0RMTGRLV3VNS3pFOXNzenNY?=
 =?utf-8?B?U2w1MmV0TWF3RSttRE1xUzRuRE9PTmgvUTFCUGZrQlJYS3hsYkdwY0dPZFg0?=
 =?utf-8?B?VitNM1ovK2g4ckFLWXdSbFhlRWpTT1RsdEx0MGtZZG5ZSmlaWEVDK2dyZHNJ?=
 =?utf-8?B?S3I3eXhBZitLcjVGTWFmR2NDS3lYdTE5MktRSGNNOVpqaWJSQVR4em9PUkNQ?=
 =?utf-8?B?S1lXU2Q4eEF4SnBkL3hqbkJHWmtFTFh1bDBvTEJhZEx2T1hpT2tqbHBwd0NV?=
 =?utf-8?B?NHdwcElSam9TYlBxbHplYjhzcWlhU21QMEw4Y3RCMmh5RjZMaDU5ai9hWHdi?=
 =?utf-8?B?eWJrKzZ3ZDlTMTYvb1RnZ0ZzUEJkRHRCVjgxMXBoMXBjN3NxTjcyQ1B1VUM4?=
 =?utf-8?B?SkFCL2Z2SEY5ZnJVRGxqUHhsc0NFSWdqNjlNa3dtYU5BbXRtWThIQldKaG51?=
 =?utf-8?B?VER0Umh2VnMwUEFmN0loTW9HZ2xWSi80U25BbmpvOTNsTVVqQXo3NzNkTTZU?=
 =?utf-8?B?ZWhleUNvQkx3MWRtekEvT2ZKRE1JR3Rjbi9PMGNST2szcmxYN0NGdnV0UlZG?=
 =?utf-8?B?eTlHSWs4SG4wR0NOOWZPYUFDTVhZUC8wSWxOSXdUekIvdWxTcldNWTJCbW10?=
 =?utf-8?B?N2ZYemJYdnYzdXFuRWZIc1hYWjNYKzNPaEpxc2ZER280NkFHUlNMKzF6TitX?=
 =?utf-8?B?dU1WVlF0Qmt1b1IxZ1ZQL2N3ZTFscGU1NCtESG9yK3lXdnBtM2VRQ0VQSDVv?=
 =?utf-8?B?SHRDR1RwTDF3LzY4aHVrYWszRER4TEdnR0YxNFhVTG13OW5lbG41dVFzcG5G?=
 =?utf-8?B?QUh5VmRBcDZ0UzhQRkEwZldDclhOcTZTTWVCcFdxU3lqYkVUZGRHYmdrcGJB?=
 =?utf-8?B?c29BcXVQMW9CYXVZQXZONlJpazViRG0xeTNBZm5ZMHA0S2ZORDdOUEdmRStr?=
 =?utf-8?B?UDFjc3FjdytxRDZUK3FQSk12TXBnOEJhRHBhZ1pPM2VacWlmY1lwbHgxV29L?=
 =?utf-8?B?T2xpakZHa3JmZHdNR2cyQW1mZ0IzSGkrSjhTbVZCdmdQRndDaXVxRnMrK2tH?=
 =?utf-8?B?enpRL3pxYlBiL09GUHBVWDhYR21RPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08e052c3-69d2-434d-d926-08d99944dccb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 12:25:29.3427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ohZ9jJNvLrv/lPfOIuUIwC+O7DwW2eMBO9VYXDNBxOmK4b9qKHqm6Vqzmk3dbwBe21xF68w1VWRQjufFw2K0qzRUcdGPXOZwmThmNdlBTZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4242
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10149
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 bulkscore=0 phishscore=0 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110270075
X-Proofpoint-GUID: vy2uSZjvRo73Xw6zaAVNSugJBZWy2LtL
X-Proofpoint-ORIG-GUID: vy2uSZjvRo73Xw6zaAVNSugJBZWy2LtL
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.847, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Xiexiangyou <xiexiangyou@huawei.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Soon.  I'll aim for next week.  Thanks for your continued interest!

- Steve

On 10/27/2021 2:16 AM, Zheng Chuan wrote:
> Hi, Steve.
> Any updates for this series?

