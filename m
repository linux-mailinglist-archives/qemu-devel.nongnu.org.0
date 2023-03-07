Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8353E6AD775
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 07:36:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZQu2-0007Er-A1; Tue, 07 Mar 2023 01:34:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1pZQtz-0007BE-Cy
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 01:34:23 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1pZQtw-0008Bc-Lz
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 01:34:22 -0500
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 326Nxh02030240; Tue, 7 Mar 2023 06:34:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=PdwHSqWheU1mrDHzFe8fg2Qupuv9nn/od6ys21Di9UU=;
 b=bLjkcHsUp1kFf2EIeuZdGvcnMcL4NwZ1kT8dGQ6jIXvWmdp/ppWsWpRZ/ugNCOz+ztJz
 FGR/BUyZ3Bd1syymzU91Qli5FippGiMYMKubVuY61f3Xpa2/QpjRo1P/azxk9SeU3suA
 UwNNvaY6nFY7JGfdH2QCCAXHswbUVVqM7MjGvuBhpyzn8KDTtMw4R1QkhQjm66SOBZgx
 WxJa2TombANnjUmN3HYHcV14g54wDkF2iozlwLiNNuYtUcTQt3lZB/NarYRCRdzJjUoR
 RTZxeIW48+OU3kbEcmzUNMVX6SVIzj70RSFdY4olQXHrk9A5hPybRKBxNdG2GyY7+jMP FQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p418xvs17-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 06:34:13 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 3275cwLf025196; Tue, 7 Mar 2023 06:34:12 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4ttjj1x4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 06:34:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HsNQB1kZ4yFHUgo9L2EdYSoPTUi5ofhqmairn+MRYptxHvlGPcXVLTzeqwsPA6mrZdnrP7hJBR+xXHxeQx2mJJPkrTfHEly/l1DB2zQexXcVTiZY3m4A83KLIKNZTcGhquWQxFskZA2RYosAx7P8k76A2NP/x7ffzJfRKTWnrBMqWnm2ZIGN5n/qh/da1s4HYPLqXysWpikn9uMEt/pubH9R1DnqmMb4r5vOgNl5WKNh4fd8Wc6IvLvwXXCAgdkl3EQTvVp2yCSXX9j2iOjai8x7IVfWGJhlB50cXkm1TqbzxEroUkLe+/XcVxJmL3e2JLDbZmIYlnYPw9pb2IIumA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PdwHSqWheU1mrDHzFe8fg2Qupuv9nn/od6ys21Di9UU=;
 b=cEez/h7dqnjh611n4AOILB2DbS1FdVGdN7hvr0+CZpDBGNpSKJf+GQoilorKILYKeZw7o9kAv7ttIuxgmVcTA6A2vzyIx8jlJr+ohMldY8jF9PSkVWj99DUh2DXIJ/tJAIQMBrK8HPZ0snXcmScbqGghpnBs16xM2foFrZRIIMUFFy3rIT67i0k6FP4H/NFFzXV2ggTNNcGjsgZNFLdlMBZhSbrZU84zqZ4uMGP8D/TFVx4MBsdmr4s8XTHf+vOED8f+YMZdV3uIJb19ACbnVtlRhhZDq46/IJ1whkhlJTZe4UuMo4jJcMjo+3iax8359Og2bi0whWa3G22U6tAHDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdwHSqWheU1mrDHzFe8fg2Qupuv9nn/od6ys21Di9UU=;
 b=XTb8bnXRnIcswdsuP+hTc7KmNxKcHnYr1PPOGryL2Yj+u7DXiIGESwItyVjfmUDSvUdnzI0GP1ni7+xUL8/NJwrBnPGFofLXdj785EUWoHFhEeezTVwoZ538bx9XAD8ktpdsNkX2NE6KKQQ+hszM3PV+MlM/Gs8DSVaayQ1fIvM=
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by SA1PR10MB6319.namprd10.prod.outlook.com (2603:10b6:806:252::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Tue, 7 Mar
 2023 06:34:09 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::d3a9:5199:9c2:e8fe]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::d3a9:5199:9c2:e8fe%7]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 06:34:09 +0000
Message-ID: <96fee5ab-1210-4e72-1aed-9618ea344023@oracle.com>
Date: Mon, 6 Mar 2023 22:36:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/1] hw/core/cpu: always print cpu index with cpu state
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, richard.henderson@linaro.org, pbonzini@redhat.com,
 joe.jin@oracle.com, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, alistair23@gmail.com
References: <20230206234220.8414-1-dongli.zhang@oracle.com>
Content-Language: en-US
In-Reply-To: <20230206234220.8414-1-dongli.zhang@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR21CA0022.namprd21.prod.outlook.com
 (2603:10b6:5:174::32) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB2663:EE_|SA1PR10MB6319:EE_
X-MS-Office365-Filtering-Correlation-Id: 18ecf3e2-c96a-4848-05b2-08db1ed5f554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OWVpxN2LXNNLlaBpShJTORGMPez+PuTY8SU3Niw+oNcdjSSH0F+C1kBzrPEV7q9nVHzH2lxfR9sfPi8zB3gVn3rnVnUtMn2FJwNflkrBF5cFag1bXskUez8kxUUtEVXOzc4VW6vaCkQ0eg3+6yszWqogs2Cg26OycRPmChJTn1Vv27y/fd5NIT+mTwPpqN7JYEGN8ALlnBdqFXoh/I5lzr2cXIYrOtTLGXvpdFtFpVZpHvn5E50A02nW9DLZ52tkYnm+xY8fqicTB03LJrSakl0CoYAUzpDIQr3mxSS99xVRJ5ixbdzLWJpxW0+oKwckjClNRh1Zm+neGhWvOa2i0YCcqIcL2uGSyFYOpcWVwTXngc6XpqyhrpKCyNWmHOqb4v8vS6ad7SB6pDDN6yJX42dwdO72MON7bhoBzBySdn97Z7g6aHxx/h0kSt4CK1UMIZqK23XzfVEyYAY/eUv5FrSBiYf9EzmOFbxyfXtvovgIJwHKtEiKxlsQFOrXgUidCUqnvKB+UYhIgQyUK66lbJXsirYv/e9VlXukovKYOjTBmgUhARv4u8yEaYhW+c2gV47wnDa+NlKLX/3diTh75XL2z4v0pb+CotwIly4NSQJ4MJzT4fQM1LXg9ZdptIWTTU3Koarzx0S7PyDEnTdHxfzDxl4Q6bIP2hrCSSmVq/cCBJfF07Qn+NDC96jctWFEJR75bUvK508o5feWdEg5ZSor8gcE2hZeG4NV6KkoN0s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(366004)(136003)(39860400002)(346002)(451199018)(6506007)(6512007)(53546011)(6486002)(6666004)(36756003)(83380400001)(31696002)(86362001)(38100700002)(186003)(2616005)(41300700001)(66946007)(66556008)(66476007)(6916009)(4326008)(8676002)(2906002)(44832011)(31686004)(8936002)(5660300002)(478600001)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEhORW9tR3RIUFFDbUhmZ2RMbC9GZC9GRVNQMnF4VzhWVDRxZUt4S0hSTDNo?=
 =?utf-8?B?c0NXcmJQQk9Dc25SM3hqMnBEQy9hd2hjaDZFWk5PRVNOKzNCWHVKY3BJVUlK?=
 =?utf-8?B?UXpxYjVCR3ZobUp4VDlzV3hNTWJOVSs5VzFIZXJtK3ZvNUUvdmZJMWtVUDlv?=
 =?utf-8?B?SThjUW1JMVd4VjllVEphaHA4N0pXRFE5VG1yYVNEZUNPa3FoWGgzbnVlUHRQ?=
 =?utf-8?B?eGFnNUs3akFCRGxidGNSNDVHNUJoL0xNdmh6YWF6RS9SR3Y3cTdJdmJqRHhy?=
 =?utf-8?B?RjBMUjVNaXk0bDFtWS9FcGVtNHpTZlFPNlF2VlN1ZkFzYnp3aDc5a2g3NHRk?=
 =?utf-8?B?TTZUTWtBQkJ1YUwxUjVmUUlNaUlLVDJKbUlMRDFmbEJWdTJsQkFRczhvcHFB?=
 =?utf-8?B?NjBlUFdRc041SU4yc00rNXZMT2FQZG1jQUFyRWthY2kvTVVLNzgvcWh6cUxG?=
 =?utf-8?B?QWU1YUZ5RERNRVlEd1pzTWlVV21HZSt6N01hMEJxcEE0ZlFtV05ET1l3eVB4?=
 =?utf-8?B?c1haSEhyNGRESlJzNHl4cHV4YmtNbjFYQ252c1RCc2h3dXRTVDBjWTlsUHpW?=
 =?utf-8?B?bmNWRFVRZ3lwQ3pzaUdxQit1KzUwMlB4SVg3bCtJWXJuYjFiNXVJMDdUZ2or?=
 =?utf-8?B?TTBWdG04eEMybkM1NFZpYlU0MnJnQy9Jc1YxWk5aU3RNdnNNYkh5SEkzemRT?=
 =?utf-8?B?ZHRYdzE0SnFNYXlBMC9pV2hRWTFER29jZ1JZV3BMUUJyVTBueisya0duMmt6?=
 =?utf-8?B?NWR4c3V5U1JhTVRpaW9Ua1B5Rkpldkl3YllUSVdqb2hBWEUva20wNklsa1M1?=
 =?utf-8?B?Y3BRMGt2aWpzeC9IUzY3b0RsRUswc29CaTQ2U0IyM2sxSmtzZHVpZEdOVFNs?=
 =?utf-8?B?K2RDb3BieU54S0psdVNmWFdITDZvQW96VEZqRVoyM01JMWFDRWI0YmNnMVBW?=
 =?utf-8?B?bUpBSWtXMFhsQlVlZUFTdmtTMU93aXJmRS9mTFJoRFl2MXNudWVLa2hmKzNW?=
 =?utf-8?B?QUZ2bGM3bStFZE5Cei9DSnZ4WFZVLzVJTGUyZzFiZkpBSm1FVkd5RzlEd1Rw?=
 =?utf-8?B?T1JaQTNkWFVZdGhxS0wzeUYzcERnQ0dkWGxXeVd3djBwYzJqaTZjMWNtSkdN?=
 =?utf-8?B?U25jazd3L3NGUTdxWjZrSktkMGNhVnVXODUwQ2YyckN4TkMyNnRiZlV2cWNV?=
 =?utf-8?B?YXFXN1Nhc3Y4cDl1MGxiekNvaXVTd25WZDJtWitUSFlveFA5ZllGSXh3MllX?=
 =?utf-8?B?V3BBUkZHUTRGYjR2WnVmR2dWRmRieE1NZGF6Y0xFU3BONGsyN2RtaVVKV1pO?=
 =?utf-8?B?NEhNc1lnS1hHV0hXTWI0OFZieXFFc1htaGdTWVlENnJkVStrWlNGVUtGTCs0?=
 =?utf-8?B?WHlnb0pSVUJZaGpjWHB3THZGNFlnejZBcUtiYWRQTkg2d2tyQ1VKcUxSZ1di?=
 =?utf-8?B?Vzc4WS9Ubzgxek1uVHc3K2ZUbUxjTXA4aHJtY1lLdnBWaE1ldTg3ZW5ERU93?=
 =?utf-8?B?UFg5NjgrdGoweXJBK1VTNEhZZVFMQ3VNaHZNR1RhMkVXMmxJQUViVzZnaWtr?=
 =?utf-8?B?VDJ5UUFCOTdSMWpCR3RwT1pVRmFQazUrYnZBQ0FEWWlrOFhZTHdwUlk3NkZK?=
 =?utf-8?B?SVlYYUpwa1Z3RVUvQy9mZEVYQVlvR1o2SDlyU2l2TWIwOCsyNWxNMUt3azlm?=
 =?utf-8?B?YXV4ZlpCcVB3UHRJU1BwMGJWZTVtZTRubmY2TG40VkFnbDE2alNHRE5DMmNj?=
 =?utf-8?B?Y013Qm5iQWZzbm1Ja05WQkNid3Z5clhVaGwxamxXOHMveG5zMzlqRkFkNUhU?=
 =?utf-8?B?dXVrOXBxOXIvdUgveDFPb3ZoRmNjU2JvY01laVc2Uzl5YmJhZFIwTDFpMXdK?=
 =?utf-8?B?RmlxMW1PNThsTGQ0NWF2ZFhKTEhGMER1TVpNRDJlcm1aczNUKy9jc1pFckYw?=
 =?utf-8?B?ZlNzN0tieC91WGFQUEtrckFBOVdpV3d0YkI1Qm5tV2dpMG1XRUNtTEg4bWs0?=
 =?utf-8?B?WHNkNzNtRlVId0RFUXkvcmllc2FxcGhjYm1yRm1GVzBjRG5ZSWY1SFB0VWkw?=
 =?utf-8?B?TUh5SVFWZW9tVWh0eFB1UHpzemtUb1M2TEJ5bitHMVM0R1N1M01ZaVhzTzBI?=
 =?utf-8?B?K2prL0xuZXJLZnY5WHJKVW5jcjNSVWpBdHNERFgvQ3V4bWh2NWc0eElib1pH?=
 =?utf-8?Q?sTISVfP2BGvpURA/Yj4mqTM=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: eosLcS8hLqZVXGtF0OINgy0si5daYtfFW7iC7mc7Kgj7yhcpqtMQ/5FWHEJsfmXJ7rRxc/6NFlZPtYCmt9AWKdLErgJ9O4oswLotoEINignLFyKyTluuaZvZkHThHpUvrZos3A6tBQbiMUvJqoyRonvxyAw/dl6AASIb8DwEIII78lwlg3Y0reQ7ZIl8RPFcrt4VOph0zD2cI0Ijb2An4hhdhdNavFL/IfoXlLqegc6cQLBTj35kF427GSgoT1sCohWOcQVreYKg4JUPcmy22gvZbzJIgAtwGUnjb0AGmV8+XPZh3DM02bfIHNL8XiJj15FpHG5rUhKF6nV6T1BBW3hBsvSeGrC0YAeQykUiD+nOJ8E63JI/YgNi+Wg3Er7AA1WGaBQSi1qQnBt+JRRGwOsB0NXsUKm/RfZGfb2vbILoiXlpbS+bwFDcnpdBGZA34X4w7LPF54zoES7MSEHIT0BNNX2sFzfQOcy+oEJeGOR3LJHkTKExGYSr4OoDZzUMxSubdFFlknnRv75cbQXsZdf0ZA4Kve1dJEq5JXKkjn+UGPGYzXRh02RQFlK8pciSIbi+d9+xZnup+46THjrLBqDpNJxdsMrZCOFfZ/uxrESIOqWFJ1oOv5KJ9VLpg4AnilXqtLxcnoLk0+gERXa8MRgsp5PddDr025fGYyjIS2hsRoGwtbnNFjyxfX4YsvM2euQ5Z+vo8hT3DvfJ/0VCxHA/Icp7ABK328vQGsFeA+uv1adx9eYewdeD+Q63PzD995COPAYx0Z/6gCrlh9pQ8tMk/He8DGDiH51twg4uRnGNqN+MoEDd4qBITqdXP6ARxgP0VcGgHCiwGH7s8pHORQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18ecf3e2-c96a-4848-05b2-08db1ed5f554
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 06:34:09.7723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RDv9hx/40VMpyekLRAsiBZYjeJvjWxMnXAF3ZuCwpBgizs7HeC4GRloPN7kuRE9mLjLcPsIVIJP288TSZTTtdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6319
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-07_01,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303070057
X-Proofpoint-GUID: YyCzosIS-UVcouyv_-yY7YfwVaoQ958F
X-Proofpoint-ORIG-GUID: YyCzosIS-UVcouyv_-yY7YfwVaoQ958F
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Ping?

The patch already got the Reviewed-by from Philippe Mathieu-Daudé and Alistair
Francis.

The current log does not provide much information when (1) multiple CPUs are
involved in the bug, and (2) when the "info registers -a" is not used to collect
the context from all CPUs for comparison.

We may wait for very long timer until the bug filer can reproduce the error again.

To print the cpu index helps a lot.

Thank you very much!

Dongli Zhang

On 2/6/23 15:42, Dongli Zhang wrote:
> The cpu_dump_state() does not print the cpu index. When the
> cpu_dump_state() is invoked due to the KVM failure, we are not able to tell
> from which CPU the state is. The below is an example.
> 
> KVM internal error. Suberror: 764064
> RAX=0000000000000002 RBX=ffff8a9e57c38400 RCX=00000000ffffffff RDX=ffff8a9cc00ba8a0
> RSI=0000000000000003 RDI=ffff8a9e57c38400 RBP=ffffb6120c5b3c50 RSP=ffffb6120c5b3c40
> R8 =0000000000000000 R9 =ffff8a9cc00ba8a0 R10=ffffffff8e467350 R11=0000000000000007
> R12=000000000000000a R13=ffffffff8f987e25 R14=ffffffff8f988a01 R15=0000000000000000
> RIP=ffffffff8e51bb04 RFL=00010046 [---Z-P-] CPL=0 II=0 A20=1 SMM=0 HLT=0
> ES =0000 0000000000000000 ffffffff 00c00000
> CS =0010 0000000000000000 ffffffff 00a09b00 DPL=0 CS64 [-RA]
> SS =0000 0000000000000000 ffffffff 00c00000
> DS =0000 0000000000000000 ffffffff 00c00000
> FS =0000 0000000000000000 ffffffff 00c00000
> GS =0000 ffff8ac27fcc0000 ffffffff 00c00000
> LDT=0000 0000000000000000 ffffffff 00c00000
> TR =0040 fffffe0000096000 0000206f 00008b00 DPL=0 TSS64-busy
> GDT=     fffffe0000094000 0000007f
> IDT=     fffffe0000000000 00000fff
> CR0=80050033 CR2=0000000000000000 CR3=00000010ca40a001 CR4=003606e0
> DR0=0000000000000000 DR1=0000000000000000 DR2=0000000000000000 DR3=0000000000000000
> DR6=00000000fffe0ff0 DR7=0000000000000400
> EFER=0000000000000d01
> Code=0f 1f ... ...
> 
> Print the cpu->cpu_index in cpu_dump_state() and remove it from the caller.
> 
> Cc: Joe Jin <joe.jin@oracle.com>
> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
> ---
>  hw/core/cpu-common.c      | 1 +
>  monitor/hmp-cmds-target.c | 2 --
>  softmmu/cpus.c            | 1 -
>  3 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
> index 5ccc3837b6..d2503f2d09 100644
> --- a/hw/core/cpu-common.c
> +++ b/hw/core/cpu-common.c
> @@ -105,6 +105,7 @@ void cpu_dump_state(CPUState *cpu, FILE *f, int flags)
>  
>      if (cc->dump_state) {
>          cpu_synchronize_state(cpu);
> +        qemu_fprintf(f, "\nCPU#%d\n", cpu->cpu_index);
>          cc->dump_state(cpu, f, flags);
>      }
>  }
> diff --git a/monitor/hmp-cmds-target.c b/monitor/hmp-cmds-target.c
> index 0d3e84d960..f7dd354d2a 100644
> --- a/monitor/hmp-cmds-target.c
> +++ b/monitor/hmp-cmds-target.c
> @@ -99,7 +99,6 @@ void hmp_info_registers(Monitor *mon, const QDict *qdict)
>  
>      if (all_cpus) {
>          CPU_FOREACH(cs) {
> -            monitor_printf(mon, "\nCPU#%d\n", cs->cpu_index);
>              cpu_dump_state(cs, NULL, CPU_DUMP_FPU);
>          }
>      } else {
> @@ -114,7 +113,6 @@ void hmp_info_registers(Monitor *mon, const QDict *qdict)
>              return;
>          }
>  
> -        monitor_printf(mon, "\nCPU#%d\n", cs->cpu_index);
>          cpu_dump_state(cs, NULL, CPU_DUMP_FPU);
>      }
>  }
> diff --git a/softmmu/cpus.c b/softmmu/cpus.c
> index 9cbc8172b5..f69bbe6abc 100644
> --- a/softmmu/cpus.c
> +++ b/softmmu/cpus.c
> @@ -122,7 +122,6 @@ void hw_error(const char *fmt, ...)
>      vfprintf(stderr, fmt, ap);
>      fprintf(stderr, "\n");
>      CPU_FOREACH(cpu) {
> -        fprintf(stderr, "CPU #%d:\n", cpu->cpu_index);
>          cpu_dump_state(cpu, stderr, CPU_DUMP_FPU);
>      }
>      va_end(ap);

