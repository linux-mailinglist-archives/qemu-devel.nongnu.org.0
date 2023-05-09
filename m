Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 229E76FCD16
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 19:59:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwRbp-0006bI-HH; Tue, 09 May 2023 13:58:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pwRbn-0006bA-1k
 for qemu-devel@nongnu.org; Tue, 09 May 2023 13:58:43 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pwRbk-0000RF-EE
 for qemu-devel@nongnu.org; Tue, 09 May 2023 13:58:42 -0400
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 349E6u0B005657; Tue, 9 May 2023 17:58:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=VOmdurh69dYygWSho/wmxVPz/Y/WZdw3/CIi3pNq70U=;
 b=PS0SQXvH1IunkO8WlHLCJBTjrlJOJMEDmKjWKxV5+SRDiBuKBZShDtlscq6BQh0QjKvU
 G1+HWlYzbWc3x78W9MxVS5IS1gEdme+k3WLk65sqk7Jr5ohhIkOq1+zhJ+Kwk/3fRNLe
 cdeFfdHsaqsvfgSLiRXBkcCGgiBofInOW7V29yqcbbzYwkBLQzb9decVKGiC7VHkZdOr
 h0O5lOEfi2uznf2lv0h9tgA7UOgsJ68sK0bDQvPrqDcGHALPdBeCuPUwzEdJYyiwm/TN
 W//jWNgLoTBsI5vhj4pjmvgYn9CMi0+AOsXegWO5ndITtsZ3ggMji2Q1GxQVU6dxc1rh BA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3qf7752hsc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 May 2023 17:58:35 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 349GIw2t002131; Tue, 9 May 2023 17:58:34 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3qf81erfcy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 May 2023 17:58:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cv80eSqjJLOZ9PAYVyDyh53/UQOufJ7vQHYYEc1nhmdkZiXXP4SoOrqgYoaO6GQzVbjsBvFi1eO1xpjWXxxXeeSnkxNutg9R8waUtIp7JjmeYsu60fxNQb2O+S9Olb+vGDGadbNWuVnU3bEr2zyz/d2Jp93/T3VkUc1Qf6/kuYImhITTwhs4jmF3uQarprlSURKTPqXF/ujy5Ht4vayq24dNrjiP2rl5Nx3ANrPuwiOLb+7PNP/fUPYoZ8L1XqIw0S5EMhgQq5mACue5WlGv2nHKY1KmjCEOZ8gCBnwQi3wsjeB5qkZDFEDvCUormHjYWsyZNLDPgwQOWNIe03TR0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VOmdurh69dYygWSho/wmxVPz/Y/WZdw3/CIi3pNq70U=;
 b=Sn1ciO+Zwfevv45KKrQOvrn+OQxiTOhhRZi/iNShvEqVu53vxT5hMjAJJkcaPUvj0H8kybQvJt6R7EF+8IrYkZpKQ7lORMNOIN8boqOIDbPB0Y1Im6zlc33YHQvN2oOn0AhZhzs8ZxUVJfdgPNN0PwXY6uvbbzwQT9jLxQLrARGBae+GuCtOS29sRNuWCYMWQnX12e3nrGMCjImm+V67PqiiWt9TeLqGcd3ySdVIsTSxMgXOKIXLiqb3TUU3Q8zKKf6ScwdEQHPAwnSrfA3y1psWOeGcY5YT+6EfqvI7/H7C3g1VZSwxOejyFYQSaSmyN0Mknyb4sWyIfvcg+T7OzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VOmdurh69dYygWSho/wmxVPz/Y/WZdw3/CIi3pNq70U=;
 b=S0gjj9n1jqHubdOIq9YfQbz9itmXJ1Dn0yrYID0RscMHSEVCieqzo94xU0OvKU9sy9vrMa6MqZWr1qEbvqlA52ah+bq1jgRkT8V71VmLv8k3nqeU8WCNRyCEC0ZnC6xO1YRKhvL/PKZCR1erPHXdKghf/h/Nbs1Mo4P4eYVeeCM=
Received: from SA2PR10MB4684.namprd10.prod.outlook.com (2603:10b6:806:119::14)
 by SJ0PR10MB4479.namprd10.prod.outlook.com (2603:10b6:a03:2af::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Tue, 9 May
 2023 17:58:31 +0000
Received: from SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::7361:8416:8d4c:7733]) by SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::7361:8416:8d4c:7733%9]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 17:58:31 +0000
Message-ID: <5fa2859e-df65-2300-25a9-66c9c3c8689e@oracle.com>
Date: Tue, 9 May 2023 13:58:28 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] make: clean after distclean deletes source files
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Thomas Huth <thuth@redhat.com>
References: <1681909700-94095-1-git-send-email-steven.sistare@oracle.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <1681909700-94095-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR10CA0033.namprd10.prod.outlook.com
 (2603:10b6:5:60::46) To SA2PR10MB4684.namprd10.prod.outlook.com
 (2603:10b6:806:119::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR10MB4684:EE_|SJ0PR10MB4479:EE_
X-MS-Office365-Filtering-Correlation-Id: 050d4843-e6c9-4ec4-7351-08db50b6fff5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K6F3iZDLNhDIh+MGw9+gZbx+lR9UrnouHGIAks6ELZ7nr/lvkEVAUxv0OUe+3Qcolnxkap7BHzo5z6xqd5DZXKEP85fGHsgdy4TAia6BhWiwQ5CeXmi7GyYEBVnrG6AiJtQGUYvBGQdnvVHkNT9B88QfYw7B2BOFiLrSzwYJVFurub04fJIL9fyxLOMhA0RkouLRmsJBOV4b1Op7m6UuzzwqhYLltt+VZqRRnxnIfm8Lse6wYVqMloKbGHLKqTRUi/JAhcD4dATn+C4mTF4XA3jD28nNXOCA0q0hAhD+Cz5/Wzp8OHwsWIXzglr0x4uD/yGOD02V8hGt11OPXKfcj+wzWEFUSxf/PwBmW8zbY2FqxDeOlh1dONIq9jmX9xG78ds05wS7hY5I/pxC4eyjkq87IziNYyXiwfRuhFW+FuclnNWzc7GNqYCax+OaV6MRs+llBhb50451elk/6bik6ZUmP4blJH/lxl2J70tMuNOFebLDl8ux7XAuYZ3fMJvXs+Cn8Oe4rpEWFz1dgfIku9zq1XQ42Y4Tx6MEBCsT2NSe1Ok9xPgCiefak1fVbiPUND77ungizeFKekRqny21lf68k7GgW5uati7SHpxtSHWRBbR7rAAiqdaShsnlebT4TY1jUHrlUSCLoc8dc460wQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR10MB4684.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(366004)(396003)(346002)(39860400002)(451199021)(31686004)(4326008)(2906002)(8936002)(478600001)(316002)(5660300002)(66556008)(6916009)(8676002)(66476007)(54906003)(41300700001)(19627235002)(6666004)(44832011)(66946007)(36916002)(6486002)(6512007)(53546011)(6506007)(26005)(186003)(83380400001)(36756003)(2616005)(38100700002)(86362001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmFEZ2xkTi9ZeGNXRzd4T0wzdXVvY1ZZTVRSKythN3JMTnQyQmdHSTF4S1Bq?=
 =?utf-8?B?bC9waUxibUlDdG1YbTFENXhCTDd0Y2xQQU9aK2lOM1JzZkhGNTRQa0pFVlVS?=
 =?utf-8?B?SUxXU2lqWVpYTUFmSVJWMFFFL0xuWFN3SW1lSjhRelVpZWhqblBTaEE5a2dj?=
 =?utf-8?B?RXhlclFwWkVtYmxXVGFUWUpxME00Y3hBYU1nU1kycGtrRnhIc29LcTVJakJh?=
 =?utf-8?B?MXZhNzJZcjgwTGVNVC91blFuYTZYWjhnZkxESTVRRmYvcERVWkM0R2lua3BL?=
 =?utf-8?B?QkN1cnJRK1U4VzR5a1o5eEJWVWR2OElhSk53MTl1VlY1YUE0YzJaSGVWck00?=
 =?utf-8?B?SkU2c3RaQXRxRVplajczSWRaNEVRbCszdXB4K2hiRkNlV21YcThsdHVqVkRM?=
 =?utf-8?B?c21maEE4M0pmNkMrT0w5VllBTDlmZk8rUk9NSUw0WjdkYlRzTWI0Q3lUTTJO?=
 =?utf-8?B?M2JxMDFGclBtdmkzNXVmZ1ZCV0hpMW1wMkpENUNvNmNHM2xjUENvUjR6U3FV?=
 =?utf-8?B?UnZ0SUlBai8wUUkrYXFsdnRBbVNjejlKYmZGc3IrSndCOFJvWm9BYWFnRDk4?=
 =?utf-8?B?K1F3SEk5TDdtZUNLYm9Yc3hGR1NuL1FKbmQrRi9rY0FGSTVUQ0VyemlNK1Vo?=
 =?utf-8?B?eFh2UkhXNkJWbmdzRVZwenNmWHQxcFI4bllZV1NFdzFyeWlIRHhpait1SGsv?=
 =?utf-8?B?ZEd4R1RsNjErYlI4bUswRExRWC91M2tKNk11cllvRFJidiswL2RsWnl2NmUv?=
 =?utf-8?B?YjkvOXQ3RFg3cHJEU2xSY2hSdktOd2R3MHE5dDQ3YWFrNk5OOC9HRU1vakVN?=
 =?utf-8?B?UmJlOG90L0phYXRLYzZPai9sdzV4eFpqL3YrQWsxMDJSV3pNTVlVMDVsR01m?=
 =?utf-8?B?a2VYRE9wODdNZmtOdWlQbEZEZDJtYzdVQmljWmJmaG90c1grdlljUWNHbnll?=
 =?utf-8?B?Z2U1ZCt6YzF6aVpiSGtkeklpWFdMclF6VHoreVpwakRWOXFNYTloQ3hTeXNv?=
 =?utf-8?B?Mkw4RFU5eWdSMmxPMldjZXpYU2V1SWtydTdqSWdWcmVZRU1Xc1d6Tm1laEE3?=
 =?utf-8?B?SGY5VHFyNnpIOEgrV2F5NVJLTk9ERWppY1gyQVVhWUZGUTJ3Q2lSdmFjSzB4?=
 =?utf-8?B?SCt1WG5EdFg5dkhwNStQN2hKdGVtL1RWNmFqUmluTG80TXRJL1VNUlhMRVRx?=
 =?utf-8?B?S25nMTBneWhrbjdWM3VIaUpmR01nNjRMc3FORFhKN1lDam4wM2o1Nm14VXR0?=
 =?utf-8?B?WTE2ZkVJaGlVT1VleFRJOWg1TWRaSjFDUG9zT1R1bjRpdk56RDcvb2ZETXpS?=
 =?utf-8?B?bXM2aytzYXNKSEt6eFlNOUM5Z290Rm5ydWt3YXB1OW5NK0xmcXpxWFhMVngw?=
 =?utf-8?B?UW1pLzZtWlJVUXlhVkhBdU1hNVhMWm9BQ3VCMGVnd2xHVXUvcVI5SXRNMFJo?=
 =?utf-8?B?QTl2c3c4Rm9jSTgwdHIwcDdwbGgybWJJZXVsWmFIemU2amhSUlM4S3llYWdr?=
 =?utf-8?B?WmQ2SFJkWDdWWFgvYXRGaXduT0JsQ1JhcWlrKzg4K0VqRDBmblhjKzN6eWZs?=
 =?utf-8?B?ZjlaTUhvc2lyNkxMN0pxa2JSQ3ZaR2tBdXVuS2FJbUJ1bmhWVHUzL0pOYU41?=
 =?utf-8?B?RG15cUpobnB6dTRZUEtHMm44VVFqZ3pNRkl0b2RKcmMzWFFHREoyb0RGam9L?=
 =?utf-8?B?b2UyUUtNbTVtTFdYd1grY2c2TFFud2ZmUzd6bU5GL0V3WnAxSmtIZEU5OG9P?=
 =?utf-8?B?RlVWc0JsWUs1c1RKUmN6L3puUWpJeEVJMC8xMmx0Zm1ycndrWkJRTm1vRTQ2?=
 =?utf-8?B?WkdsdjNWSDZVdnRtUHd5TEs4REVaTkoySUFWdkRucXpYZWtQalZnenJycUxO?=
 =?utf-8?B?Q2FOdC9iL3RmRmRWZ2ozZmIzc3prMjBWa2VhcEo0RzB4UW5oYmc4cmpFWDVn?=
 =?utf-8?B?cS9uRnBhNXFuRVBqRXhWd3ZEbm9wanFDLzMwV2hkclQrMzFEaS9GOS80bFdE?=
 =?utf-8?B?YUU2UGVpOWo5ZnNaSEJpOE1ublhpOTltWThyTzVxMUhQL1VyWXZHTHNrRkxV?=
 =?utf-8?B?Z2JhVTQxNmVMVVhSMi8rNzhiU29OSWdFcEtyQUJTb3RxbE53VXhKUW80NW9Q?=
 =?utf-8?B?MzM1TzdWVEdzSHhUc25NZ0xFODhxNTJNelNoSUxsbEpJTHh3NHhsSTJLY1Fi?=
 =?utf-8?B?VlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: xOU66Fl6xycuQo/S8YTQa9jNl6VJ/r+Eut1fjgKPA39L/umpq5z1dRQs6ggpqnY05JliUA1j+7Vbjyorw5aWQtYZwlA0ryXXxyKdbC0V2Nhnk+woXN1ZvV5wQoFP/jBAjNBm54RCsDIxNdqCo+ojAUz8s0J0T6CcwWarMDjHH82vKX+UkZEhu176TLQRt/bTqiL6HbuIYbOAh/PZPq6plOhZOyR6kTS7SjAoOTUj8zAOha+bu8+CLRBaxSR6iqcmUGIjLet1fDtuLJ0RghSfwfEMpZqDgQeV6NfoydKNLqMpoueKlonLrgCmt37sE+GKP6Fv+FCrBhG0bSYecy7HQtMXCbI9cPWSi6Vmk9ESG0eQFnW8e6Wcn2NgtTcm204nq6JFR6wl8EcjkpnjkyWSn1X0aRoS0MkKxA85SSMauGrSdC5gLsY5VZqS7oQI2VERaP9LcrR+x5kCcLqnbaPA+PC7zQ5Kp/r4zQHS6P4Pyuq3hSL0pOKpOyQ0fdd3xr/VQzWuiMTsFefTWicVILV47CL5ejwoX1gMoAZug9ErURmmC9ZEy2R2bP5Dsmdta80pQnYAoP+OnsTBnkDhZfYNHySmepqs63TpsuphhpyANWTScU8rKo2k3CJcOurOleK/zFePsPNMrk/lL2K1kQpFk8oduqgo+UWwfSnw6VxSD6AoY6s5NQnDmZ6yC9vw1d9zdgWvNDOw0JIkvor0+VPO3SLIqEvwtnHzCkiXXjrA2EYfdR7Kj/kmE4f4eF+DiiyunCXJfLyPBaKYOMROUfbNKw6uZoEEWc1i5tx1aRsu9ML5+YNFEWSHaH+e6VChUKTy
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 050d4843-e6c9-4ec4-7351-08db50b6fff5
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4684.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 17:58:31.3411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zY0wvCTms+zuHmK6CxDvNVjATqOrkn/pC2/rwyZs9WYgEw9Pbgn+umpYs78WCuM/8nm/bVQf6cG1xlyRo0EQDOYuMUYUbh6vE51s1JuSRSE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4479
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_11,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305090149
X-Proofpoint-GUID: 9c_GgIuDId6doO0Jn3Kojv_COpCfmE7L
X-Proofpoint-ORIG-GUID: 9c_GgIuDId6doO0Jn3Kojv_COpCfmE7L
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Any takers?  I believe this patch is correct and clean.
Examples, run in the top level of a git tree:

$ configure ...
$ make clean
... cleans ...

$ make clean
... cleans ...

$ make distclean
... cleans ...

$ make distclean
Makefile:180: *** Please call configure before running make.  Stop.

$ make clean
Makefile:180: *** Please call configure before running make.  Stop.

# unchecked goals still work
$ make cscope
cscope  Remove old cscope files
cscope  Create file list
cscope  Re-index .

$ configure ...
$ make clean
... cleans ...

- Steve

On 4/19/2023 9:08 AM, Steve Sistare wrote:
> Run 'make distclean' in a tree, and GNUmakefile is removed.
> But, GNUmakefile is where we change directory to build.
> Run 'make distclean' or 'make clean' again, and Makefile applies
> the clean actions, such as this one, at the top level of the tree.
> For example, it removes the .d source files in 'meson/test cases/d/*/*.d'.
> 
>     find . \( -name '*.so' -o -name '*.dll' -o \
>           -name '*.[oda]' -o -name '*.gcno' \) -type f \
>         ! -path ./roms/edk2/ArmPkg/Library/GccLto/liblto-aarch64.a \
>         ! -path ./roms/edk2/ArmPkg/Library/GccLto/liblto-arm.a \
>         -exec rm {} +
> 
> To fix, remove clean and distclean from UNCHECKED_GOALS, so those targets
> are "checked", meaning that configure must be run before make.  However,
> the check action does not trigger, because clean does not depend on
> config-host.mak, so change the action to simply throw an error.
> 
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  Makefile | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index e421f8a..30d61f8 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -26,7 +26,7 @@ quiet-command-run = $(if $(V),,$(if $2,printf "  %-7s %s\n" $2 $3 && ))$1
>  quiet-@ = $(if $(V),,@)
>  quiet-command = $(quiet-@)$(call quiet-command-run,$1,$2,$3)
>  
> -UNCHECKED_GOALS := %clean TAGS cscope ctags dist \
> +UNCHECKED_GOALS := TAGS cscope ctags dist \
>      help check-help print-% \
>      docker docker-% vm-help vm-test vm-build-%
>  
> @@ -176,10 +176,8 @@ plugins:
>  endif # $(CONFIG_PLUGIN)
>  
>  else # config-host.mak does not exist
> -config-host.mak:
>  ifneq ($(filter-out $(UNCHECKED_GOALS),$(MAKECMDGOALS)),$(if $(MAKECMDGOALS),,fail))
> -	@echo "Please call configure before running make!"
> -	@exit 1
> +$(error Please call configure before running make)
>  endif
>  endif # config-host.mak does not exist
>  

