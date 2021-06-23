Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1960A3B174A
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 11:53:13 +0200 (CEST)
Received: from localhost ([::1]:54718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvzZI-0008UK-5T
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 05:53:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1lvzYN-0007o4-MU
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 05:52:15 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:11762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1lvzYJ-0003Jt-JC
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 05:52:15 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15N9ljCv025246; Wed, 23 Jun 2021 09:52:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=mWjz+uHQpvUPOpZPnpe9P5zd+2lhZ4uGqEn3LXVByPY=;
 b=ZogNIm3mLL1HIYY1+Ea7ihlVbK1b7klYmYcYNet+d7OtQyrZSiE8JAg4/k+Jnffa5Nx5
 rGqqDDuGybU0XzzjWBMYf77ZbU466eqeYUya19KreG3zyPS97i000nFM4k6Z8z2WpCtQ
 UDEMdq8jzaZD6uLEbhLA0RSwrBvSbPY1+exlCqs2unzBtN1japjdjIDH6N5W51VbgMHW
 mm879ydaV+h5GE6TfPs/lleHt9d/ZxOdkohJw/Pp3zB4nh2Ot4oXcZWz5/SSOkTaNsUp
 /n9qh2R/7SxQmVt84rgsE+NaoytiVctpCWxvhrvbxtucjVfY1SnYUxpauGc/eqCtg4zI Mg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39ap66ngw4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Jun 2021 09:52:07 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15N9jUbH157178;
 Wed, 23 Jun 2021 09:52:07 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 by aserp3020.oracle.com with ESMTP id 3998d8w497-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Jun 2021 09:52:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fHvWM5ob3Nvuad38cL2B7H5A4ljs80znm3GjF6VEM240GzHl7RlFkzaDZZ+SmSQFcQga8BWGxXBj0m20qhaM8etf2FqwnX1qHkhCn2xV18TxWevp/zgiEAergq3B3qyVwQtGTi3bwApwtC6jMEvtn/3Hd2uj+pYrLgyXgBzRXCr5+SlQAnUm6kKo8qIAiKMKUzKuZzaCe6g5m1Xuv4wfAmixSQgx7teUZxvNfT630ePoETV8TqtDm4v8B9JBdRDcNKyq5E0W/7g9hwjMmySKm3kdiukpReIrm3c807O6TpIzMQRZvmCcJ6B4Yj+rGua6ADBz5JkHdOJPbmcAOiaB7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWjz+uHQpvUPOpZPnpe9P5zd+2lhZ4uGqEn3LXVByPY=;
 b=Yq0DGm+e+ijnMDTSSeGn8cE4wYN9YxK5SzFBz3iBrQGwcdVSQl1kMvnXP0o9K+nwNDsTTQ+H+qpMWwJ05bo7L8INndxsKW2qjGNUE+PtPZvNF05DDO7axBZPl035S1YvgZ2Vw2Mi4tX4ngrNMS6xurDAUgJ4xNkMAHWkNY7INmemvAQtkycFwJQjYmQqmty/mcAaCAcgPwWJSkH3ije8HWKOGuAMf3MsPAN+nJV2cQ0Mou/I2y81YPotZV2xy8zf9K8bNbgBeUs7WIZjJHFGPDf6mUOVho1IWJYP3ensHHCLLaatM3rZvGkH0hC4AubOhDQFdO4u19rC2y0S5qFZpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWjz+uHQpvUPOpZPnpe9P5zd+2lhZ4uGqEn3LXVByPY=;
 b=A7lndQvKQjOGBF6RechMW5U0r5h9pPSpmpD8ab0NUyuP1sKLf2QVSpFeJH+YeWx7tijPIMgQycgTPhTUgh/kL+9o/Ocg52I94Y1mL/b2P7K3Q7FbFaI0S0doNY8voN1VGxaa4dRLl22FyTci6pMQwi1ugsSsiVutYNp+eA6FIAo=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BLAPR10MB5281.namprd10.prod.outlook.com (2603:10b6:208:30f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Wed, 23 Jun
 2021 09:52:05 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d875:3dd7:c053:6582]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d875:3dd7:c053:6582%5]) with mapi id 15.20.4264.018; Wed, 23 Jun 2021
 09:52:05 +0000
Subject: Re: [PATCH RFC 1/6] i386/pc: Account IOVA reserved ranges above 4G
 boundary
To: Igor Mammedov <imammedo@redhat.com>
References: <20210622154905.30858-1-joao.m.martins@oracle.com>
 <20210622154905.30858-2-joao.m.martins@oracle.com>
 <20210623110341.0ceca1b4@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
Message-ID: <21f86eb7-e9db-b7ac-9014-2baa9fd44741@oracle.com>
Date: Wed, 23 Jun 2021 10:51:59 +0100
In-Reply-To: <20210623110341.0ceca1b4@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [94.61.1.144]
X-ClientProxiedBy: LO2P265CA0054.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::18) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.67] (94.61.1.144) by
 LO2P265CA0054.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:60::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Wed, 23 Jun 2021 09:52:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5092d534-9f43-477a-ada7-08d9362c8eb7
X-MS-TrafficTypeDiagnostic: BLAPR10MB5281:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BLAPR10MB5281732CABDC06935B59AA23BB089@BLAPR10MB5281.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YoeXqtovWsxROqnh718RaFMlFhHFiOuk464OLNxeENURFDx8txJ7hliPaI1yyHUE7Luj/QT86Kn7foPU7c4ZbuzO1T7qTJm2rjMy9sJyH5zXf5P8VqpammVjnh91m/nla1anI6vWQLt51kbqxFushnR4hl7abZCL/QymrWLas9FOXlT+LdTQmyIK6Jl/XciS0xGItOthOrJOkXYzD4bSfMEOeGnxcQ4a0uIkaZbF5VT0aBxjZutFvjlsu/U6yq8niXhmMHFDQTOiQa8tKvymLybIQaSGhG6x6FlE0l9HBmNtNh0vCez4Jatac54xGpVrPr4iPndcSDX9P25d/VN+0tk3awKY11R5V77IQ4fmJIrdmOD24ZE7fIS15ALi8IsTJgpwlDjHJiFzXlG1mo0tTBS+oJGm59pqs2m/OdrVtlHumEnJdS8DbHJu+FzZelO+BPy53CnOTSIoo5tdOKbEJR4utUgSF1EgSoKd1+KBxeU9v0XV9d+s5Oi5LNOQnsL3PNdl66GuEA8GWgOjorPIFILUJ123igNXqzjmcthv65xN4U8MJNZqPvLmzWeuDcxQczK48PDMvwA4CBFSbsORxJfNMWk42JyzBYFhK9aFjKCv4ZH1fHYFPcH9knAgyhmAO6rdcHsZLFVVzGGOd188yFbC/51YhnL8vOvnJiShCj8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(136003)(376002)(366004)(396003)(346002)(53546011)(6666004)(31696002)(16526019)(26005)(4326008)(86362001)(8936002)(83380400001)(186003)(66476007)(8676002)(66556008)(38100700002)(36756003)(66946007)(31686004)(6916009)(6486002)(5660300002)(15650500001)(478600001)(16576012)(54906003)(316002)(2906002)(2616005)(956004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFNvZ2pNMEZnZ2IzMHd0VEFUWWNWNWYzWG04QVcydG9wb1hSaHNSSGpLTW45?=
 =?utf-8?B?V0JmOUw4bTZlL2F6dytPR2dTWmlqekpsRU43U0R1cEFoYWNzT1ZuZ3R0Z2xU?=
 =?utf-8?B?WXdtSlZpcnJueFJQaFFlYWJSSG5UdXQvanB6dDBYQTl1VnVrc3hCRTAwcjZS?=
 =?utf-8?B?SFlLV24yczVVZW1DQkJpdHVaUUVkdlhGRzN1TmxJTWdjaUVPdmxFZlBENHVD?=
 =?utf-8?B?SlVPTm5iUnI1MmJjUFNxclhEV2x1MXQ3U1U3dUFnRnZlUmF3ajR6clZVMTdB?=
 =?utf-8?B?NnJSdktZSXhjTEgvVUw3Y2o2Y1Boak5jYTlqcm5udVpQdkNKM1ROTFdZckR6?=
 =?utf-8?B?cy94NUdjaEVZRG0xdmhLanJVUUJDT3VHUzJaL2V2aHFkQ0JmeXNBUGNIdGZx?=
 =?utf-8?B?Uk4xcU9uRW9tT1RZb1BNR0tTWlhwK1BPMTBEWHhaTUM0aHhheTVsQWRHcFkv?=
 =?utf-8?B?NmFPRHlLaTdJTi9RWVRwYmk0bnppcWhoNlNPZk5NZ0FPUmc3Z0p5R1MwKzZX?=
 =?utf-8?B?b2ExNHJSTVFVdVlvN1g3N3puQmpDai9YNDd2LzhqZWpsVUNEdlZwQzU4TFRy?=
 =?utf-8?B?eE1TUlZvNXRmU091T3EwYnJqZDVFcUdRd1V6dXkyVHQvTE9XSlRsRlBxSHA5?=
 =?utf-8?B?SlY1b1pFUVF5NWFoYUtrazJZdGZzclJYcTRPT3dmVnM4WlVOeVVHUkFZQmNy?=
 =?utf-8?B?OGt5NkNwZE5lbkp1L29vZTUyd1hSZkJxQUJacEtHK1h3NTFWSktSdTNXaFpL?=
 =?utf-8?B?SWc5eWh4MnVEeEdJNS9INUs1U1lLUHhHbGZVNkt4RU55a0dWWEk2MG5IdlhU?=
 =?utf-8?B?QXRDekd6Y3FPVmxGakF2dEhubk0vN09Pb25zbzlMWFM2QlhiNGxxa2dPa1hv?=
 =?utf-8?B?Qk1jdHh6QmhUak03ZUlMY1ZCUWk2Mm5ZeHJ3ZDVoL2ZKUGdzNFhiTHg4TG5z?=
 =?utf-8?B?WVM1WVE5V0MrbWRxUVM4STVNWlBNZ0RDdStmSmNLS1dEN28vaWUvaUV3WWlI?=
 =?utf-8?B?eSs0UVhKSU13WGYzSFhCSVZtUHdhbHZKN0gyaFAvaFh2bDhVbk00OVIrek82?=
 =?utf-8?B?SjAwVzYxd0Z1R1pqcXkza3FzWkZuWm1CMTFDd2xub3d0bVdmeVBiWVhYSlYx?=
 =?utf-8?B?YjlUV2xib0dxS25DbTVTQXdRMUl0cjRoQkwxSDZDMGJrRmgvbFRVejJJd1N5?=
 =?utf-8?B?QW0zd0VvWnRtZ1g3OCtRdFdEUFdPRlJEdUxVcDlTT01Fa1J6MHNNcFhaWXFL?=
 =?utf-8?B?dzVLMEVJNFNiRmVUcTQ4Zk1yaS9PSzBFaC82S3hMSjJXR3Z4WU1FS2dJQndW?=
 =?utf-8?B?K0NKdzRTMk5qYk5GTmJZZXU3K3MzL0JGMTVSYktqN2pITms3WFQrejBmZHgx?=
 =?utf-8?B?NFU4NU1aR0tnVnJ5L2pNd0NsMS9hTWNBdzFrcjdOQi8xMzNkZ29ZdWRCZTRF?=
 =?utf-8?B?Zmc3c25FdVdGL01HWlROWlVucjFxRHdzNTlMNEF4ZERicElwTWxyV3FFc3Mr?=
 =?utf-8?B?NmJaVG5QS2ZGelJqQlF0OUhoMTBDVm9CZEVpNXhGTndXT2ZWSUxQQU9wQWN1?=
 =?utf-8?B?K0lYajJTbTA3WkhVM1NTbkJHeFhDQzlJbGhJK0tDT0tKQ05wM1ZhSnRyWmxr?=
 =?utf-8?B?WEZUUUx5SDc4aG5Gb1R5WmdNRmZJOEZwaUhYTjg2QTUycjZiV21RdlZRNU9L?=
 =?utf-8?B?NGxVdjJLL2E3cjRPYzhuT283NHd3aDBkYmxHZ0p3YWhQVC8wdTVGRkxpYXlM?=
 =?utf-8?Q?mN9McEVbZaRcSuqSd1+aA7B8XrBilzBudOQcP0K?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5092d534-9f43-477a-ada7-08d9362c8eb7
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2021 09:52:05.1624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iM/zvdcImW+x24JSprDj5ICehNhC+B+9AMyJeCC9bNCW20c+kooMPyPth5Oa76lIGYXEGNiXyMGnASK9hoGR101LWvFLiHCNrZHlAIArQTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5281
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10023
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106230057
X-Proofpoint-ORIG-GUID: f1eQ-d1edFDOwk5EqRjcZM2hOeI_KgXq
X-Proofpoint-GUID: f1eQ-d1edFDOwk5EqRjcZM2hOeI_KgXq
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/23/21 10:03 AM, Igor Mammedov wrote:
> On Tue, 22 Jun 2021 16:49:00 +0100
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> It is assumed that the whole GPA space is available to be
>> DMA addressable, within a given address space limit. Since
>> v5.4 based that is not true, and VFIO will validate whether
>> the selected IOVA is indeed valid i.e. not reserved by IOMMU
>> on behalf of some specific devices or platform-defined.
>>
>> AMD systems with an IOMMU are examples of such platforms and
>> particularly may export only these ranges as allowed:
>>
>> 	0000000000000000 - 00000000fedfffff (0      .. 3.982G)
>> 	00000000fef00000 - 000000fcffffffff (3.983G .. 1011.9G)
>> 	0000010000000000 - ffffffffffffffff (1Tb    .. 16Pb)
>>
>> We already know of accounting for the 4G hole, albeit if the
>> guest is big enough we will fail to allocate a >1010G given
>> the ~12G hole at the 1Tb boundary, reserved for HyperTransport.
>>
>> When creating the region above 4G, take into account what
>> IOVAs are allowed by defining the known allowed ranges
>> and search for the next free IOVA ranges. When finding a
>> invalid IOVA we mark them as reserved and proceed to the
>> next allowed IOVA region.
>>
>> After accounting for the 1Tb hole on AMD hosts, mtree should
>> look like:
>>
>> 0000000100000000-000000fcffffffff (prio 0, i/o):
>> 	alias ram-above-4g @pc.ram 0000000080000000-000000fc7fffffff
>> 0000010000000000-000001037fffffff (prio 0, i/o):
>> 	alias ram-above-1t @pc.ram 000000fc80000000-000000ffffffffff
> 
> You are talking here about GPA which is guest specific thing
> and then somehow it becomes tied to host. For bystanders it's
> not clear from above commit message how both are related.
> I'd add here an explicit explanation how AMD host is related GPAs
> and clarify where you are talking about guest/host side.
> 
OK, makes sense.

Perhaps using IOVA makes it easier to understand. I said GPA because
there's an 1:1 mapping between GPA and IOVA (if you're not using vIOMMU).

> also what about usecases:
>  * start QEMU with Intel cpu model on AMD host with intel's iommu

In principle it would be less likely to occur. But you would still need
to mark the same range as reserved. The limitation is on DMA occuring
on those IOVAs (host or guest) coinciding with that range, so you would
want to inform the guest that at least those should be avoided.

>  * start QEMU with AMD cpu model and AMD's iommu on Intel host

Here you would probably only mark the range, solely for honoring how hardware
is usually represented. But really, on Intel, nothing stops you from exposing the
aforementioned range as RAM.

>  * start QEMU in TCG mode on AMD host (mostly form qtest point ot view)
> 
This one is tricky. Because you can hotplug a VFIO device later on,
I opted for always marking the reserved range. If you don't use VFIO you're good, but
otherwise you would still need reserved. But I am not sure how qtest is used
today for testing huge guests.

