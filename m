Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9404EB2ED
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 19:51:01 +0200 (CEST)
Received: from localhost ([::1]:37180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZFzf-0000Db-ML
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 13:50:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1nZFtK-0005Ku-Jt
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 13:44:27 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:40658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1nZFtG-0005l8-Q0
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 13:44:26 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22TFwrQq005800; 
 Tue, 29 Mar 2022 17:44:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=9JlZfR0YhHXPPnt1+aS5snP7548eGUIgCvIM4/RgFy8=;
 b=jVr3/h7hV7YDldIz0B3B7qr8RQk5rgtSJ422i90vONof0k8qMJSURvweZe/kJdUAm/H1
 2bFBuhwYDI0nhCNEac2DWvMQgtQcItgtoRm0GTs5rBiIBgmzdlYlm+uOimxqE7gQHoem
 2zUSOkYcOSYcbdiJacsoXlemU5Evv6jJeYcbL1fIWHkFzCZuVEn/CWyY71n77QnQDju5
 UBlpWtPfW8LCIIr/t1WGN6lxNCMrCJdltCbVcRxsJN2rVJKs0vXqYSl2ZtTCFgi6E7j4
 wHxngAgoDslgIQCmSeqRbSjNBspSkNcW2nFt+RVdoqoPtBCiP9ccabuGgqN123Y/N0DD 8w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f1sm2fcab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Mar 2022 17:44:08 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22THb5mo026874;
 Tue, 29 Mar 2022 17:44:07 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
 by userp3020.oracle.com with ESMTP id 3f1v9fhedv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Mar 2022 17:44:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f72S6panF5SrKG4wC/7Gcd4YET11N7ggS34RWluRfHt1bYKOb6vrvXyc4G4sQA83RbYRAYXZqlESWCL/WNGsBTTan+mGP+1WjF2g2XOXPiMno1AO8QmHmVpH6IcnKfSvrfnxUb2bBFrKJhgGbIvhHOAiKQEVEnj+cF5JYAxoyw/gVIx+/p8y7xU3NP4eb7JgWZHJY30Vrt0/Goo0cjmbYiubFWy5Sk7y4cvSU0RYs8JF/xo710sqNa6rdUmPHsePp+848HiGH9Ed4+QmFJ/BcYv1uMQTRtgeB8DUZvSrsG12tP5K3CD86jKBHbU70bFAk/Py2J022BgmerdYgZnGSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9JlZfR0YhHXPPnt1+aS5snP7548eGUIgCvIM4/RgFy8=;
 b=J+wewjj4CpmmloikGz6rbI7ujj397wP8F9EemQq+8/EvBqUPvSxX8ArBhiQ8TSxBeiR6XxoPFR4ba5GgCSHNWqfosM/13D+XiK5pLWSUi/py5U63+8dKXcFSjsMM5brkeJaSTE1819zbquSOnUfXeQGV1kmz/6R5GW4rzpdx+Y/SKuM3vk20XUjjTRz1oB/OsRWOeRuFbd6EcS9ZX/AjvBoDmJNrjQ3RNm3yDK46M1GWkD7lZ5KSIcmld93ZLR25phk0VR/lfMfsjf3BNz4LjEeI9M2/2F2bCAjgfYvIFNGzwVh8O4xwiAbq4WjPdK4zlD7RfPyiLFuU2aNNP6EWhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9JlZfR0YhHXPPnt1+aS5snP7548eGUIgCvIM4/RgFy8=;
 b=apNDqjMbOV1N7kQmRq+uUMH7C5b9QUWTcoWBMgEu4lsiRhx9JMmEiw7MvNMITCH7VezsdeishWPjXZaYhaKDWbvqTE54aSwvj05Lu5w7nhEuVYPayOLV4VqgLmMTe+PCJ0Ge8Qja69oShHSNHn98fF49FvKbimH4xlkltdVadM8=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BN6PR10MB1827.namprd10.prod.outlook.com (2603:10b6:404:108::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Tue, 29 Mar
 2022 17:44:04 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::1dd3:6f2b:97c7:a939]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::1dd3:6f2b:97c7:a939%7]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 17:44:03 +0000
Message-ID: <28418185-e4b4-3c69-6d37-22001350e1ee@oracle.com>
Date: Tue, 29 Mar 2022 13:43:59 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V7 10/29] machine: memfd-alloc option
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-11-git-send-email-steven.sistare@oracle.com>
 <20220303121534-mutt-send-email-mst@kernel.org>
 <20220304114124.6fe97646@redhat.com>
 <c42748ca-3e06-d57e-dcfb-a2a97006d2fc@oracle.com>
 <20220307184045-mutt-send-email-mst@kernel.org>
 <20220308082048.1783adbc@redhat.com>
 <3e0803ef-392a-b863-3474-3f76dcd27ae1@oracle.com>
 <20220310170025.33b9f6f0@redhat.com>
 <d62b16fc-f01a-586d-9fcf-d44abc100cb2@oracle.com>
 <88be3aa0-0d7f-08c5-8278-07a3c5b701c8@oracle.com>
 <20220311104252.548c5fb4@redhat.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20220311104252.548c5fb4@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR18CA0008.namprd18.prod.outlook.com
 (2603:10b6:806:f3::32) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00c7b0d2-e128-47ee-85d9-08da11abb6db
X-MS-TrafficTypeDiagnostic: BN6PR10MB1827:EE_
X-Microsoft-Antispam-PRVS: <BN6PR10MB182773E8C1CB32EB7DF5C4EAF91E9@BN6PR10MB1827.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nMapVX8kqCD7bt4RLNIaK4I9zYjCQ6PlDpwsWJ1XFAiBf1p7k6TWBkuB1X/U8f6a2dKl/1Gyq9Sp84UXC2/nh/mn1HuNZMviRjMOiYD5bWEUboIw0hpAwIRqEGFfE8oNmIlAoFiWIoUa3srAzv5jweGK3rqC/tZYp5MzA8YUsN1LzIU3sXcnNFpl1rfBgyPfpj+528STbKw1jlFIRLPXlziVE3Hr9NTevZzwvhzQ/tmF1moGE5ZDXcHHWvs9facLOxNg1d8bZByEFxfDRX7i2mmLNhNsiIc7B4bCBTcdmhWFSKqFd0ad1LGn0QBdJBRALZBNluNT14OZR+TXqQ8iY4ADL66u/dJzEB1xSuHkGZWbRTjj3P5gQUpc4sVhMag+lbeAwJ8NonjdpGFQSzn9BJHAN8kic7H8h1FOcCaqU7/Z665Xyd2V4QiXK7k840M/mxHmVuOjhWsRWRY7pwJg2HcHS4miFxWSnBj2g0+RvLpDZ57cc0TYs0NaTPNJWHsrDVWbmJpDIIowJg209uvHu8v1wrS2jZB6qnZ3bdvMvP5Nc87wfa3q2C8OLni1TAIRp252XKT7sTB8e+ruTG9JgQigygki7HMYlDttrE0LqnR+rNXIWk453Q6zhYHf5yyzgJW3Bau5DKxa9XvLcsUl/VZH+Ic5SE2I0SiFOr8kumYk1At2XUEyKkNkdeyZDj6DdVmonXWErOEtRO/UOj7+UrQ3rl8FwL/5MjMGmM57c1roF4jvzalaaVUHTQkSZT3/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(66556008)(83380400001)(6506007)(316002)(54906003)(36756003)(31686004)(66476007)(8676002)(4326008)(6916009)(66946007)(186003)(86362001)(53546011)(36916002)(6512007)(2906002)(8936002)(508600001)(5660300002)(7416002)(31696002)(6486002)(2616005)(6666004)(44832011)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGxLK0l0Vm92ZmhIYTA4ekloRjc4QVUvSDAwbHl6SllDUlZ4U0drNEp4OHQv?=
 =?utf-8?B?aW5LelVVUWJBYjlwMGlnb0FMblcyK1locDRXbkptTFEzQnlmQkxNRlpWTTBI?=
 =?utf-8?B?aTNKNkxEbWlhQlhTOGhpWVVCTU9DUzJyNzBjbmt6citTOVBsdlVHYWM1R21U?=
 =?utf-8?B?bnZKUzZJeWFLTTIrclNjbkdpM0tQVk9aWGhoNlRQYVlFd2tMN3RtMHpESnlU?=
 =?utf-8?B?OWhaWnN4cnluQTZjVE8xQmFMSkxwOERqb21ZdHJjakQvTVJhOUFqc3BNaGZk?=
 =?utf-8?B?QlQzaTJmUHJzVWNQUjlFcEtidmNvNlNkSlQra0NZdkNXSHpvMS94SDFHSWZN?=
 =?utf-8?B?M28xK1VXdXlJWkpjQ1pDS05ZRTdWaWdZdmc5YkVjS2tCRDVoQW1WbDhRcmtx?=
 =?utf-8?B?Y2tQVGl3bmxlaklDaDdjL3grcU9YK0h2MENGbGh6SlhBRHhkaHg1cHlzTDNB?=
 =?utf-8?B?dWluRUNkR2lJSmhKK0pFQzBOa0tjMG1ybHM2aHVCQTFYdytPZWhvZGFJK2s5?=
 =?utf-8?B?YVBmbm9HUlByK3VQNXVuTFZ1TlA2cWtwaDFDYm5wbVQ3VlZYbVdITTBSLzNW?=
 =?utf-8?B?am5YYVoyMmlFa216MzlwenJ3L0Q3VGY0MEd3V25ON2UzSW9UOUNkSmtpbW1Y?=
 =?utf-8?B?SUtVYXZZMGk4QnQ5endORVdYZVdiSVgvM3JpK1RISFVZTitwQk02S0xpMkMy?=
 =?utf-8?B?cWFLNk5za2s5aDNSWVk0NFlDb09NWXJ1RlEwc1Nub3Z2U1BsMThpTEVJUnBj?=
 =?utf-8?B?SEdQNXZsSnl2MEh0L2Rhc0pkZi8ycllxc1V2UVQ5Y2RJUEtBS3ZKZzVrQW5U?=
 =?utf-8?B?RmlUbnc3Sm10YkQxTDMvV2dIWlAvVitMN0VvekwxV2NCbVpIWllURDQ2SlZU?=
 =?utf-8?B?b2U3bzBqYStWTXNBNmxTT1Fraytnc1BacFRmY0pGV3VzcWJOTGlLTFR5aHds?=
 =?utf-8?B?azAva2xSalJvemRJYkkyZVhaSXVOT3dGVVZHR0xtWXAzRkRqTW5RTzhGbnZ5?=
 =?utf-8?B?aFFIcDVsR1ZhZmRKYXhPRy8zUXprdzE5RS95eUtXRXM0NURWQlNhSnE5Q2ZJ?=
 =?utf-8?B?anE3VmcxYUNyUjNzK0kvdFdiYVRabEhGR0ZydDhCdmZjQmZ5SUEwWFBSQm9p?=
 =?utf-8?B?eDVjQnE5SDUzUDVCMTlYVUxtcitWb1NUSTBNYk43d0lCWU90ZEptdTdQTXVz?=
 =?utf-8?B?S0N2aGRvNmEyTjVpWElPa1prMnNDQXpIbFgrbzZOUVYrTWtEaVdtK0VoSmJn?=
 =?utf-8?B?R2VuUDdwSmFpZm9jY2hYR2dGMHJYRmRRQVhtUkNGRDFIU28wckNQUjRmWm1p?=
 =?utf-8?B?Nyttc2U1TjhrdGpFT21TUTk2YmhXSGRpdmVyZU1ibzAweHBSMzZjNFI2ek14?=
 =?utf-8?B?TzA3UTQ1T0J5SVEyZlRSNVRmSWxlcTRhOVJteHVxcG42SGRTdU00MDUydWhy?=
 =?utf-8?B?VFZZUWQxajM1Uk5jb0VOeGxmZnJFbDdYbGs1U293dDcvSG9qNUpNRkpWYllW?=
 =?utf-8?B?T1FuZTZBa2xoakErdVNUK1ROQW1Pa080TGtWcnorOWRXUGtteDltejV5Rm5k?=
 =?utf-8?B?Y3d0ZU9QdEt4bFdGT2sva3FwNmhTMHBpOWt1SThBVnE3NTNIak15dEJFdlJY?=
 =?utf-8?B?QXdodS9EUWs2TWNBSnpLU1FMRXFQWVg1d2hkZCtRYjhDcEVuREcxOC9CRklO?=
 =?utf-8?B?WUh0eWc3ZEpPZ2RQVHNGcDZPeVJiZGdDeVAvRWNnak9mNjZXdyt0aUxKb3ZK?=
 =?utf-8?B?RGV5K0hhSWJXSEpxZ1VnbnlmenZ3amZwZytzMmIxSE5XN1RFSmdSYjJKbytl?=
 =?utf-8?B?THZqVXQvUlJKS1FnUGdGQzJobVp5NDhJMVBnSlRYYzZqcWYwQS9Wck5IYUI4?=
 =?utf-8?B?UytUNXgvQUxFL01OV3dOQ3lhc29SdDVEWGx4R05RWERYbFVjWFk1MVB4ekZo?=
 =?utf-8?B?a1kxZ2JpWFIwM1FSMm1zY25La3h0c0tnUE5SL3BDTHZYTHRGdjJyNFN3MlhF?=
 =?utf-8?B?KzgzWGVCN3RMUjRpdTFYZzF1aHdIeHZTREhEbnpmS1k2RGtMc0xSenBNcVZi?=
 =?utf-8?B?SktUdkoxODlVeXJkNXNKUDczSy80cUNzZlVXenJPbmpGOFZMSEIyNWp3ZXBK?=
 =?utf-8?B?MFRjWlJ0a3NwRzhxZWMrYXl6ZGxjNStpdnRJSDB0cmlMVndjZm92aEZDMytK?=
 =?utf-8?B?MjhBT2JJaG5BWmVjVHdXZnVxM1NCb3djNUJEK0FCVXl3alVodXY2dWZPT0hM?=
 =?utf-8?B?TGJYRWo1SlFobU8vY2dZQi9oRkxRT29oMjJQUm1TMCtlM2xkQkRDWlRrNnBZ?=
 =?utf-8?B?NUN5eE5Eek42cVhOa0psUVFSam90ekM4WDV4Z1laZ3ppamNhd2lIemMwL2Vy?=
 =?utf-8?Q?2GY0x/UDBgC367kw=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00c7b0d2-e128-47ee-85d9-08da11abb6db
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 17:44:03.2984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WlCpfJf2Ychgm6qJG7hi/PnRzua+2SqcYFfxKH8EjwxEeZIUT2USYHRaWTwiUSgEgh7UnC8PMDgle9FOB7xG264mDLKH3Zsa6ffDUNyU6+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1827
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10301
 signatures=695566
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 spamscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203290100
X-Proofpoint-ORIG-GUID: ZyidKgHgUXVt7Eo-pcd9rXFPO3w7xbRL
X-Proofpoint-GUID: ZyidKgHgUXVt7Eo-pcd9rXFPO3w7xbRL
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/2022 4:42 AM, Igor Mammedov wrote:
> On Thu, 10 Mar 2022 13:18:35 -0500
> Steven Sistare <steven.sistare@oracle.com> wrote:
> 
>> On 3/10/2022 12:28 PM, Steven Sistare wrote:
>>> On 3/10/2022 11:00 AM, Igor Mammedov wrote:  
>>>> On Thu, 10 Mar 2022 10:36:08 -0500
>>>> Steven Sistare <steven.sistare@oracle.com> wrote:
>>>>  
>>>>> On 3/8/2022 2:20 AM, Igor Mammedov wrote:  
>>>>>> On Tue, 8 Mar 2022 01:50:11 -0500
>>>>>> "Michael S. Tsirkin" <mst@redhat.com> wrote:
>>>>>>     
>>>>>>> On Mon, Mar 07, 2022 at 09:41:44AM -0500, Steven Sistare wrote:    
>>>>>>>> On 3/4/2022 5:41 AM, Igor Mammedov wrote:      
>>>>>>>>> On Thu, 3 Mar 2022 12:21:15 -0500
>>>>>>>>> "Michael S. Tsirkin" <mst@redhat.com> wrote:
>>>>>>>>>       
>>>>>>>>>> On Wed, Dec 22, 2021 at 11:05:15AM -0800, Steve Sistare wrote:      
>>>>>>>>>>> Allocate anonymous memory using memfd_create if the memfd-alloc machine
>>>>>>>>>>> option is set.
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>>>>>>>>>>> ---
>>>>>>>>>>>  hw/core/machine.c   | 19 +++++++++++++++++++
>>>>>>>>>>>  include/hw/boards.h |  1 +
>>>>>>>>>>>  qemu-options.hx     |  6 ++++++
>>>>>>>>>>>  softmmu/physmem.c   | 47 ++++++++++++++++++++++++++++++++++++++---------
>>>>>>>>>>>  softmmu/vl.c        |  1 +
>>>>>>>>>>>  trace-events        |  1 +
>>>>>>>>>>>  util/qemu-config.c  |  4 ++++
>>>>>>>>>>>  7 files changed, 70 insertions(+), 9 deletions(-)
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>>>>>>>>>>> index 53a99ab..7739d88 100644
>>>>>>>>>>> --- a/hw/core/machine.c
>>>>>>>>>>> +++ b/hw/core/machine.c
>>>>>>>>>>> @@ -392,6 +392,20 @@ static void machine_set_mem_merge(Object *obj, bool value, Error **errp)
>>>>>>>>>>>      ms->mem_merge = value;
>>>>>>>>>>>  }
>>>>>>>>>>>  
>>>>>>>>>>> +static bool machine_get_memfd_alloc(Object *obj, Error **errp)
>>>>>>>>>>> +{
>>>>>>>>>>> +    MachineState *ms = MACHINE(obj);
>>>>>>>>>>> +
>>>>>>>>>>> +    return ms->memfd_alloc;
>>>>>>>>>>> +}
>>>>>>>>>>> +
>>>>>>>>>>> +static void machine_set_memfd_alloc(Object *obj, bool value, Error **errp)
>>>>>>>>>>> +{
>>>>>>>>>>> +    MachineState *ms = MACHINE(obj);
>>>>>>>>>>> +
>>>>>>>>>>> +    ms->memfd_alloc = value;
>>>>>>>>>>> +}
>>>>>>>>>>> +
>>>>>>>>>>>  static bool machine_get_usb(Object *obj, Error **errp)
>>>>>>>>>>>  {
>>>>>>>>>>>      MachineState *ms = MACHINE(obj);
>>>>>>>>>>> @@ -829,6 +843,11 @@ static void machine_class_init(ObjectClass *oc, void *data)
>>>>>>>>>>>      object_class_property_set_description(oc, "mem-merge",
>>>>>>>>>>>          "Enable/disable memory merge support");
>>>>>>>>>>>  
>>>>>>>>>>> +    object_class_property_add_bool(oc, "memfd-alloc",
>>>>>>>>>>> +        machine_get_memfd_alloc, machine_set_memfd_alloc);
>>>>>>>>>>> +    object_class_property_set_description(oc, "memfd-alloc",
>>>>>>>>>>> +        "Enable/disable allocating anonymous memory using memfd_create");
>>>>>>>>>>> +
>>>>>>>>>>>      object_class_property_add_bool(oc, "usb",
>>>>>>>>>>>          machine_get_usb, machine_set_usb);
>>>>>>>>>>>      object_class_property_set_description(oc, "usb",
>>>>>>>>>>> diff --git a/include/hw/boards.h b/include/hw/boards.h
>>>>>>>>>>> index 9c1c190..a57d7a0 100644
>>>>>>>>>>> --- a/include/hw/boards.h
>>>>>>>>>>> +++ b/include/hw/boards.h
>>>>>>>>>>> @@ -327,6 +327,7 @@ struct MachineState {
>>>>>>>>>>>      char *dt_compatible;
>>>>>>>>>>>      bool dump_guest_core;
>>>>>>>>>>>      bool mem_merge;
>>>>>>>>>>> +    bool memfd_alloc;
>>>>>>>>>>>      bool usb;
>>>>>>>>>>>      bool usb_disabled;
>>>>>>>>>>>      char *firmware;
>>>>>>>>>>> diff --git a/qemu-options.hx b/qemu-options.hx
>>>>>>>>>>> index 7d47510..33c8173 100644
>>>>>>>>>>> --- a/qemu-options.hx
>>>>>>>>>>> +++ b/qemu-options.hx
>>>>>>>>>>> @@ -30,6 +30,7 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
>>>>>>>>>>>      "                vmport=on|off|auto controls emulation of vmport (default: auto)\n"
>>>>>>>>>>>      "                dump-guest-core=on|off include guest memory in a core dump (default=on)\n"
>>>>>>>>>>>      "                mem-merge=on|off controls memory merge support (default: on)\n"
>>>>>>>>>>> +    "                memfd-alloc=on|off controls allocating anonymous guest RAM using memfd_create (default: off)\n"        
>>>>>>>>>>
>>>>>>>>>> Question: are there any disadvantages associated with using
>>>>>>>>>> memfd_create? I guess we are using up an fd, but that seems minor.  Any
>>>>>>>>>> reason not to set to on by default? maybe with a fallback option to
>>>>>>>>>> disable that?      
>>>>>>>>
>>>>>>>> Old Linux host kernels, circa 4.1, do not support huge pages for shared memory.
>>>>>>>> Also, the tunable to enable huge pages for share memory is different than for
>>>>>>>> anon memory, so there could be performance loss if it is not set correctly.
>>>>>>>>     /sys/kernel/mm/transparent_hugepage/enabled
>>>>>>>>     vs
>>>>>>>>     /sys/kernel/mm/transparent_hugepage/shmem_enabled      
>>>>>>>
>>>>>>> I guess we can test this when launching the VM, and select
>>>>>>> a good default.
>>>>>>>    
>>>>>>>> It might make sense to use memfd_create by default for the secondary segments.      
>>>>>>>
>>>>>>> Well there's also KSM now you mention it.    
>>>>>>
>>>>>> then another quest, is there downside to always using memfd_create
>>>>>> without any knobs being involved?    
>>>>>
>>>>> Lower performance if small pages are used (but Michael suggests qemu could 
>>>>> automatically check the tunable and use anon memory instead)
>>>>>
>>>>> KSM (same page merging) is not supported for shared memory, so ram_block_add ->
>>>>> memory_try_enable_merging will not enable it.
>>>>>
>>>>> In both cases, I expect the degradation would be negligible if memfd_create is
>>>>> only automatically applied to the secondary segments, which are typically small.
>>>>> But, someone's secondary segment could be larger, and it is time consuming to
>>>>> prove innocence when someone claims your change caused their performance regression.  
>>>>
>>>> Adding David as memory subsystem maintainer, maybe he will a better
>>>> idea instead of introducing global knob that would also magically alter 
>>>> backends' behavior despite of its their configured settings.  
>>>
>>> OK, in ram_block_add I can set the RAM_SHARED flag based on the memory-backend object's
>>> shared flag.  I already set the latter in create_default_memdev when memfd-alloc is
>>> specified.  With that change, we do not override configured settings.  Users can no longer
>>> use memory-backend-ram for CPR, and must change all memory-backend-ram to memory-backend-memfd
>>> in the command-line arguments.  That is fine.
>>>
>>> With that change, are you OK with this patch?  
>>
>> Sorry, I mis-read my own code in ram_block_add.  The existing code is correct and does 
>> not alter any backend's behavior.   It only sets the shared flag when the ram is *not* 
>> being allocated for a backend:
>>
>>                 if (!object_dynamic_cast(parent, TYPE_MEMORY_BACKEND)) {
>>                     new_block->flags |= RAM_SHARED;
>>                 }
>>
> 
> ok, maybe instead of introducing a generic option, introduce the high level
> feature one that turns this and other necessary quirks for it to work (i.e.
> something like live-update=on|off).
> That will not make QEMU internals any better but at least it will hide obscure
> memfd-alloc from users.

That occurred to me, but during this review, a few folks have said it would be useful
to expose memfd-alloc directly.  And, I don't think that hiding memfd-alloc under
another flag is helpful, as some users will still want to understand how enabling cpr 
affects the VM environment.  I would still be documenting the memfd behavior for the
hypothetical new flag.

I currently document memfd-alloc in the following places.  If you think this is 
confusing or incomplete, please let me know:

qemu-options.hx

@item memfd-alloc=on|off
Enables or disables allocation of anonymous guest RAM using
memfd_create.  Any associated memory-backend objects are created with
share=on.  The memfd-alloc default is off.

hmp-commands.hx

@item cpr-save @var{filename} @var{mode}
...
If @var{mode} is 'restart', the checkpoint remains valid after restarting qemu
using a subsequent cpr-exec.  All guest RAM objects must be shared.  The
share=on property is required for memory created with an explicit -object
option, and the memfd-alloc machine property is required for memory that is
implicitly created. 

And this error message in a few places for the only-cpr-capable command line option:

"only-cpr-capable requires -machine memfd-alloc=on"

> Is there a patch that makes QEMU error out if backend without
> shared=on is used?

No.  I will add that check, thanks.

> Also, can you answer question below, pls
> or point to a patch in series that takes care of that invariant?
> 
> [...]
> 
>>>>>>>> There is currently no way to specify memory backends for the secondary memory
>>>>>>>> segments (vram, roms, etc), and IMO it would be onerous to specify a backend for
>>>>>>>> each of them.  On x86_64, these include pc.bios, vga.vram, pc.rom, vga.rom,
>>>>>>>> /rom@etc/acpi/tables, /rom@etc/table-loader, /rom@etc/acpi/rsdp.  
>>>>
>>>> MemoryRegion is not the only place where state is stored.
>>>> If we only talk about fwcfg entries state, it can also reference
>>>> plain malloced memory allocated elsewhere or make a deep copy internally.
>>>> Similarly devices also may store state outside of RamBlock framework.
>>>>
>>>> How are you dealing with that?

Sorry, I missed this before.
fwcfg defines vmstate handlers that save and restore all state to a file across the cpr
operation, similar to live migration.  In general, if it works for live migration, then
it works for cpr.  If you find a counter-example, please let me know.

- Steve

