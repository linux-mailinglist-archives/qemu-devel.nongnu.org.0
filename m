Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AF84ECFCD
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 00:47:46 +0200 (CEST)
Received: from localhost ([::1]:36224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZh6P-0004zm-Ds
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 18:47:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nZh3Z-0002an-Gx
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 18:44:49 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:37528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nZh3V-000710-Qj
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 18:44:48 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22ULCI3k032352; 
 Wed, 30 Mar 2022 22:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=ORebXXlD+BQyDTgAO+r80VrZuyy52RW1BJ+eY7kut6I=;
 b=JbPYnSqhFVGsHjJFr/1ySgiIkIQ2WqcsZOeQmC1S0CifcxEAkD9/pfz2Q9dCURX2gyFG
 gjEqlBf1SwaN9pwtjBOWYR4FRCKU4/pg0VJ0LrsK+zCgqPqTFU103l4E1sJABeTKBa2O
 Zlw++BUI+Js+A6oEAwQR1Yx4I8LoC2WQoOeN5h2M4spS39qm+9T8VJpiSB4svGPXS5Tg
 05dt7WVzSsO14+95XxK+vthBczqtOnnbTeQIBsuYZPGSN23kqyVTWPTz0CanEFcfStgS
 Vdm3JD0VQzDVFKF5DB9wdCH6WgdkQLHYEtqpthqW7oWU/SiREAddR303G6SiwWULllWZ hg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f1uctu10u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 22:44:39 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 22UMgVEj028399; Wed, 30 Mar 2022 22:44:37 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2041.outbound.protection.outlook.com [104.47.74.41])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3f1s94qjcf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 22:44:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KYvqZkFgbrslnFePgtTjftJQL5XxVq1/uCG0UdJZNT7ECnaHem/3uKbJUVsUiZqhKo5WUGGaikh1USnKXnR0aEqhjDE55eNGJZ9DloWH6u/4S+j/DARU92XrMlqKavimYfAd6UU99Y6V3Wmp2kdOXCzSWHeu3pLghuRBzhrecSNu3S2DToPjL2uh3iSCpemJtL61XYgt2B7BE9zgXq2r7/m1M0Fucf7Zvai2X8HyKLgTnLyx2Kqlw85Wuo5vaHjxLebZRjsqzb+j6ja8zOIQKOSEWqqTBJf+rF54qcgVyKQvR0O7fwuDrDYvBD68LyLBtGl4FjqLbEcCWdAJklbuhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ORebXXlD+BQyDTgAO+r80VrZuyy52RW1BJ+eY7kut6I=;
 b=joJZDyrRDVcCbvg4xkOBlBd0++ij8TZ1PsM0EhgDPSyDZKuHmiI+sZ6RaYJaY7KeZfXd53NLHyGvnauBv5YR8R6GM5griMyL7XH1jq5B/JuWPco1YpRTEtMF+V1yrHFfcopHA5Pcz4XviU3+l8+mny6OtEyvCLiv7FitWYdtTSpaItHkAeebyW5xSdzh7pwzrR0czwyo1qnGs7kzLhMYlnHkpzrOFvSLttsaAiyyyr9ZrdDy9YN14UTiFJvgVIxLtoFx/1EVF2g82NzfOH14FcNbvi/rPX/WuIUZk0RrZGub7tmWmUGEYsdhH5tpuz+igD3X5q+gqJwlfS0svIQkPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORebXXlD+BQyDTgAO+r80VrZuyy52RW1BJ+eY7kut6I=;
 b=jybbqYU9Nud1u4xgPgxSKdRi4DpD6Ul+GmvFMpidELOFEkyGETQ9fx+sx69u8qAVKWdPAqKEUjDj7fACHhSeidOoP6+DOOD1IFHXQQb6wAx8qeu4tCJ8TLaNmjJxx0vd4s/epR0hassNWP1eFF2cVYDI6Q1Pfm9j6WlqHQz8z34=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by BLAPR10MB5314.namprd10.prod.outlook.com (2603:10b6:208:325::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.18; Wed, 30 Mar
 2022 22:44:36 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::e478:4b5e:50a8:7f96]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::e478:4b5e:50a8:7f96%6]) with mapi id 15.20.5102.023; Wed, 30 Mar 2022
 22:44:36 +0000
Message-ID: <dc8ed123-ee68-b7f9-ec37-f02b052f126f@oracle.com>
Date: Wed, 30 Mar 2022 15:44:31 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 7/7] vhost-vdpa: backend feature should set only once
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
References: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
 <1648621997-22416-8-git-send-email-si-wei.liu@oracle.com>
 <20220330162406.62cnedwmn4zn6ars@sgarzare-redhat>
 <eaac0521-949d-6f8e-63e0-cebecd9a33b9@oracle.com>
 <20220330173209.2rj43622nfa46s7p@sgarzare-redhat>
 <CAJaqyWdm5PwZVQX2g+VRVYEkgkzRHfGdEO0fnr_uPFbG0J2i5Q@mail.gmail.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CAJaqyWdm5PwZVQX2g+VRVYEkgkzRHfGdEO0fnr_uPFbG0J2i5Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN4PR0501CA0142.namprd05.prod.outlook.com
 (2603:10b6:803:2c::20) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 859f4819-3733-4531-3d8b-08da129eddb9
X-MS-TrafficTypeDiagnostic: BLAPR10MB5314:EE_
X-Microsoft-Antispam-PRVS: <BLAPR10MB5314E211EC9CE1818793DB68B11F9@BLAPR10MB5314.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N+eKcf82FnTdiEDPIczqBA7R15FMSt6jD7qajh40HTmyQpQpzqmwzf/ve+boigXsOvBfcmLuVCDYeF5ICvmEE7gF4qpwVA9nu95GhikNPaDF1OAV1D413EzcTpA91Zr2a7dt7bxrB9q6wjfvQ7WGmcLggvijbQpmBB45icyxv9cMMTS8IShd0s9UK9vHcu+C0YrIXSOfB+G1DBH2W6ph6dzwH6el8pREUBgoQDAApgTmmlCp0o00QYX2g8cPJ7Jq4AJgpDlC7K8XEkY7kXKBANeatebgvB8aA2xBFviqv/h9hiqz3KP+r0kblDHVCdQ0eELHWy6yG0YPH4D2fga9DSjEXnXd/rfm91zbTjCZkIdzKty8/kqm2s4a2FvUm+vU98N018gQICLOZ3PNA+9Ke+CUME4JsOQX5RxVY7vHk9rj5sAPkOHxZ9uzQ8lIMrZ3gS4z8dm4BZQyY3ZTeeOMcqT5TqiLgVbVxrq36g8TWR8xUNKovEZVbzo/RkVZ+Q/cPPFUyf36Lyo11fH68M+DoHsnSmWQOhjYK/iot9hRsKQvgADsvVLckVGCM1gqh72WCpG4FVWSyAN7uHPwx2NC7CWAFqAuoLQaVOSX/1gy8JD/iRAw7u52HI/m7hfvsBOGkkkjn4CmLJOBMzbAeVvfqfQ2gYSt2/bVv06t6/KSQRQGAR7HXgeeNVEHvCPCm2UrUL4Ii50U6qR5yUuk6QW96PJEyRJyOTQNJFfZS0f4LoFu9Koyh5NLAZ5qSQzgpXd7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31686004)(8936002)(38100700002)(508600001)(26005)(2616005)(186003)(36756003)(110136005)(5660300002)(36916002)(66556008)(66476007)(6512007)(66946007)(86362001)(31696002)(54906003)(6666004)(6486002)(4326008)(8676002)(53546011)(316002)(2906002)(6506007)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3IzM2ZaNDJ6TnVTU1dOMnJZNk5RamMwYWg5TzJsM0hXbXdYb1lXdVR6VzQv?=
 =?utf-8?B?elhQQjVTQklBcHIvUkFoc0Q3Q0pCdFFaMFlxRVI2NmpFWXAwUnc5WDYwN0dF?=
 =?utf-8?B?UWt0UGpia2l3ako0ckdGOVBMTHJuMGxNQndXYWxwdzRhaHpEbzFjUmR3dThJ?=
 =?utf-8?B?aW9nNW4vR011alFiQmdSekNUZDY4ME5Nb0ZLdXROcnpRemt0VXFERHZrWk5t?=
 =?utf-8?B?UXBCSEN4azBlZHFIN2M2Y2VWWkpuaS9DQ1FoT2hLb2xVSS9tc1Y2eDJiNnhD?=
 =?utf-8?B?L05uQjJyTHppSGpTK21LdU0xMG95R0JNYWozVHBUbHBUN2JDd0FCMWJJU0Rn?=
 =?utf-8?B?TE5GbUF0L1J3SXRNS1ZqaEg2NHVuOFN3QnRkNTNlS3I5dEhuRlVsd2tnQjVm?=
 =?utf-8?B?TTBSTkgrRk5xdU41M3pWWVA3YjZnMm96cW9xL2RRTms1eW5KRnZGY3ltYVpx?=
 =?utf-8?B?TkZtNmM5aVVSdndBNWY2UlJ3VCtxYnJ3NVRSMlpvbzhrTHNyUTZaSDVPYkN2?=
 =?utf-8?B?ZmU5TmpkQTd4NVcvV0ZZUklQVElDSUthUWExVUV1d1NKQzJpNWZWaUxCVW9w?=
 =?utf-8?B?ZkYxSmdablFoc2lmaWZ1U3ZxVVdOQVF1bktBQk9VZWpuZmxCOWdEeUxHWXRW?=
 =?utf-8?B?eHhZN3lSVHJ4d0VWOGk5d2FFQ0hIWGhyN1JTZGVWN2Rra1VaNG1zMzdwVEJN?=
 =?utf-8?B?REhpQnZUdEZsRXUzK2NqYnFQRytNY25CZDZ1N1BXUlRueEZ3WWNtblNnMU00?=
 =?utf-8?B?THJoU2V0c3pIZy9FTVdNc2FSUlQzeWxaQnBXcyttUHN2K0YyK2FyME52Yll4?=
 =?utf-8?B?UHp4eGplelpzclJEYjdQRWRNeW5WUm5VQWkzNUVFblF2Nk9lNDQ3dmdyZE1W?=
 =?utf-8?B?aHlXNXFod2ExQjhrMHd3SDA4Q0k4WVc3MGlQRGN6aWhaMEpJU1dLWm1oQWRC?=
 =?utf-8?B?K2JQRGpLcjluWXpZSENMZEMvQVN6VklqZzIraDVUK2d3UzFST2VpTktKWUNL?=
 =?utf-8?B?MU9MUlo0YzdBLzNvb0o4K0JoR2cxV1llOFROeWhKT1FYcWl1U3RGYjNRamhK?=
 =?utf-8?B?Qk5wU2ZWQ25UWFlLcWY4Um5UMlNSUHVVamhKNWIrYjU2NWdKNDI5Wm9TREx0?=
 =?utf-8?B?aXo0RTVQenJJc2g4ZCtrOGVMZ0kyVlBBSC9MY2Ryc2FPU2Qxdml0WFhiT1d5?=
 =?utf-8?B?d013cm00NkZONGNFSjVOdHlOa1VqWFA4NTh2VjBVR2NVWjVzcFpKQWxoNHcw?=
 =?utf-8?B?OUhDMzZWNzZySGNkYmJEbk1pTUpuVVQ1TkRmN29jRWF2a1pMUTZoUVVxdmJZ?=
 =?utf-8?B?cXBNRUdZZjRQQTk3NHNRZGI0LzcwMG00TThJOVdnZjFpYU9aV0x6S3duV0J1?=
 =?utf-8?B?T2ZqQ1JMbHFyczJlcEsvSzBKZG9JSS9xZDYxM2lDNmt4ZndiZldHYUh0Z1pr?=
 =?utf-8?B?M0t3Wk5nL0xrOG9HWGIxSWZLYi90ZDQ5RUJLVnFPRzVGdldhOVJ1VFNQS2tS?=
 =?utf-8?B?N25xbTAxSTZsZ1JxSTd1SnNlK29SdjREcThmL3Rrb0c5UVFDbUpOb1A5cTJp?=
 =?utf-8?B?aUFtUERBVlNaekdQSnV4cmkvMDlNZmlyUktNbzhVek5mVFYzRVNXdHNJaTNV?=
 =?utf-8?B?cDAyT3Nmc080OXZnWXIyYmNsQ3FCQzZ1azlmKy9VTDc5dVJFMUN2YlAwcm9v?=
 =?utf-8?B?dmRJWU9yalFqOWFyczByakRWQUpiM1RhVnZmdGJSKzEwY0VFQzVaUTFyRkhU?=
 =?utf-8?B?RFdPRHpNQ0pDZmQ1TmU1MzhiYVNidTBhNUM3VHZQRVJwMjNGeWxuUk90bWlr?=
 =?utf-8?B?bGxQbmhUUW1Oa1NGNWtsRlNXcVMrSnFMM1lIK2syNlMrQm1KbzdTRXJ2QlpZ?=
 =?utf-8?B?TmdzMUkyNnRyc3ppREcxaURhanhqVVJtc2NTRVhlVUVUMU9QTkJRNE9mdEhz?=
 =?utf-8?B?NHZweFA1SlI1WUtxb3AzQVRGYXQyN1FyZDZwUlJpMUUrSU9aY0NQejVVZ2Nw?=
 =?utf-8?B?VGR4MEdXcTdRZzBWNldIVUM2eWlsR2hNZC94VlgvMmlpajRPWlk0eTRpZnFD?=
 =?utf-8?B?Ty9CejN5TlBoOElaQStPUVd1YVJTR25RVWpNejhVWEcwZTFscCtsRXpwWTBS?=
 =?utf-8?B?YjNOT1NiNjJjbEQ5cm5nbWFmcS8rZU9TL0JVMkgwTWlaU01mWnlsNlZvb1Av?=
 =?utf-8?B?QUlQTnJ3WmFtWUMvWXVvaVNLcVBlaDk0SWd6ZzgvSEl0M3B6ZlBTSzArVmJk?=
 =?utf-8?B?bStzcGYyeURGS2dhZVdOOWtsNlBLNzVydnJnb21LM2lzREppdE9RcW82RURy?=
 =?utf-8?B?c1paV3gyOU05elVRNS9zaUI5T3hTa2l4UTBTUW5ZZEJaUUpFZ1JkdXluaWpZ?=
 =?utf-8?Q?0O5pPrZl6v3GGR3k=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 859f4819-3733-4531-3d8b-08da129eddb9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 22:44:36.1633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YeRGDxex/GRfauFfYpgd/D9vRDkGd9EQx0AYB70IGNgD1YZvnqhNOr2SApB48Mi4EfM9LXzj63ygKG4TZg+hiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5314
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-03-30_06:2022-03-29,
 2022-03-30 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203300109
X-Proofpoint-ORIG-GUID: 3-N0hT-mdSzrR_nY7tkgsZZXRBqMltJF
X-Proofpoint-GUID: 3-N0hT-mdSzrR_nY7tkgsZZXRBqMltJF
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: Jason Wang <jasowang@redhat.com>, Michael Tsirkin <mst@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Eli Cohen <eli@mellanox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/30/2022 11:27 AM, Eugenio Perez Martin wrote:
> On Wed, Mar 30, 2022 at 7:32 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
>> On Wed, Mar 30, 2022 at 10:12:42AM -0700, Si-Wei Liu wrote:
>>>
>>> On 3/30/2022 9:24 AM, Stefano Garzarella wrote:
>>>> On Tue, Mar 29, 2022 at 11:33:17PM -0700, Si-Wei Liu wrote:
>>>>> The vhost_vdpa_one_time_request() branch in
>>>>> vhost_vdpa_set_backend_cap() incorrectly sends down
>>>>> iotls on vhost_dev with non-zero index. This may
>>>> Little typo s/iotls/ioctls
>>> Thanks! Will correct it in v2.
>>>
>>>>> end up with multiple VHOST_SET_BACKEND_FEATURES
>>>>> ioctl calls sent down on the vhost-vdpa fd that is
>>>>> shared between all these vhost_dev's.
>>>>>
>>>>> To fix it, send down ioctl only once via the first
>>>>> vhost_dev with index 0. Toggle the polarity of the
>>>>> vhost_vdpa_one_time_request() test would do the trick.
>>>>>
>>>>> Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
>>>>> ---
>>>>> hw/virtio/vhost-vdpa.c | 2 +-
>>>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>>>>> index c5ed7a3..27ea706 100644
>>>>> --- a/hw/virtio/vhost-vdpa.c
>>>>> +++ b/hw/virtio/vhost-vdpa.c
>>>>> @@ -665,7 +665,7 @@ static int vhost_vdpa_set_backend_cap(struct
>>>>> vhost_dev *dev)
>>>>>
>>>>>     features &= f;
>>>>>
>>>>> -    if (vhost_vdpa_one_time_request(dev)) {
>>>>> +    if (!vhost_vdpa_one_time_request(dev)) {
>>>>>         r = vhost_vdpa_call(dev, VHOST_SET_BACKEND_FEATURES, &features);
>>>>>         if (r) {
>>>>>             return -EFAULT;
>>>>> --
>>>>> 1.8.3.1
>>>>>
>>>>>
>>>> With that:
>>>>
>>>> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
>>>>
>>>>
>>>>
>>>> Unrelated to this patch, but the name vhost_vdpa_one_time_request()
>>>> is confusing IMHO.
>>> Coincidentally I got the same feeling and wanted to rename it to
>>> something else, too.
>>>
>>>> Not that I'm good with names, but how about we change it to
>>>> vhost_vdpa_skip_one_time_request()?
>>> How about vhost_vdpa_request_already_applied()? seems to be more
>>> readable in the context.
>> That's fine too, except you can't discern that it's a single request per
>> device, so maybe I'd add "dev," but I don't know if it gets too long:
>>
>> vhost_vdpa_dev_request_already_applied()
>>
>> And I would also add a comment to the function to explain that we use
>> that function for requests that only need to be applied once, regardless
>> of the number of queues.
>>
> In my opinion it should express what it checks: vhost_vdpa_first, or
> vhost_vdpa_first_dev, vhost_vdpa_first_queue...
Indeed, the same name ever came to my mind that is to reflect what it 
actually checks. It is just that I have to flip the polarity of the 
vhost_vdpa_one_time_request() function that made me adopt another name. 
What matches best for the current code would be something similar to 
vhost_vdpa_dev_other_than_the_first(), though why bother using another 
function rather than write the check as-is in place is another question.

>   and to add a comment
> like the one you propose.
Will do.
>   I think the context of the caller gives
> enough information.
>
> I would add that the use is for requests that only need / must be
> applied once *and before setting up queues*, *at the beginning of
> operation*, or similar, because we do a similar check with
> dev->vq_index_end and these are not exchangeable.
Nods. Exactly.

-Siwei
>
> Thanks!
>
>> Thanks,
>> Stefano
>>


