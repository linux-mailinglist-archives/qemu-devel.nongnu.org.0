Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E550051C608
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 19:25:45 +0200 (CEST)
Received: from localhost ([::1]:52018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmfEW-0002th-Ue
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 13:25:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf0j-00063C-JT
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:11:34 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:7178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf0e-0002Br-RA
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:11:27 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 245FnNPo013665
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=vgJTM+6/t7u+pXKc3NHsWJe1Vv8p8k3alDYFcnH/pDI=;
 b=o2exDFH+7E7TveSfSeBbbxSNcoX/EbzUKIHoNHEpkLxCDEutThq0cYvH73BB8UBhoF4C
 zpkEb+Dvhsy9njLybwjYCpL0eJ09wIcnF3iA0AEycR93NmfI7FmQNCpMphdoL5MGZodR
 hvshy+0j2sQOUi0qs1RDytI6/hxEM7e1CdtrYDU94eA/MN+HtbuQFWOdxoBp3spbpqaf
 0sVQfZtnSHD6hf4aYzluCB3KmnSKv1GcR/7xprA7rwaAfQUv2hE2qX2eDy3+krFbs54C
 C93N9pxSv91W4fNO3l2mjkXoQEwDfomG5bssStn4NHAOq7oIvREPGLpjTwLfJc0xD1mb tA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3frvqsm1gd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:22 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 245H1PHY001942
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:22 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fs1a7amqq-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QSx/afDmkzSxL/5AdFxNBG3Bo94QSa5Mbt2fbOz7waRQyELEetQWsdzO7rCjGvOsxAGP3162tqYsPTUqLwbG9t82mOKCfpSEK30cJYxSM0O7kAzktamqWsVIGXeFCktFxE6Th6cKTK5ZmA4YAn9xYZVLBFO4d/f2WTHcVhbZV1Ik5+0DIydkBbwHnqdh1GRLcumINyloQCHQy1Yzqba+gzzXgC9LnfHkno16amzOPQokZ/hunsfxIkyiEsP533aKC1GOuME8vqrPf+lbQpi9Dy5MAl7RitsLzT1g2mRzF8+eH9t/mX888RE338cVe6gw4T3bsfGkStYcnUiR9bJNZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vgJTM+6/t7u+pXKc3NHsWJe1Vv8p8k3alDYFcnH/pDI=;
 b=mZSB7Zegp+Ii9ptH8qgizBr3nlAKzCAaSuzJd0VJv6q+CX63mDiqJzoIMDXZUDYkErkPXGCuIjnpsoEi/RalEric5A/sm6f/I0+fc5T9n60mqcDl+KmGa9HbQL84KXZdNGkYCkmJ6o/P58riJgf47P5ENNMyWWD1hK2T7iV5lOMInBp5/H7cACFqhM+d6SiaDdJlEXmOGnosv5qJv/I03taShbaYplCjIfs7iCyYVJ07NvxQ5gixfaAXA/P/V5wQnhf/su9JaE1SLkuE1dwH7u3P6wEV0+Vefr+sFoYL+CBbV/NieB45+Rkbs8vp6MOPUZbjhDDpvfr6H7CYw6PtkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vgJTM+6/t7u+pXKc3NHsWJe1Vv8p8k3alDYFcnH/pDI=;
 b=VQ/oqCIWrr8TIXTkgCYgqDq81wrkQNlgzZc32XXaFJMpQiINjCxCFRU0ZwdkTQkZNFP9bPFrvp2dpVWe54Ei/TUJnpPP7CX3U0lsMpWSsUPW1PunlkmpSwuZIoUyzRGmd42h+zDf8DwZ27pygP4WTp9m2N+nODvL+I4lcZu0bd8=
Received: from BYAPR10MB3255.namprd10.prod.outlook.com (2603:10b6:a03:156::22)
 by DM5PR10MB1867.namprd10.prod.outlook.com (2603:10b6:3:10b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 17:11:19 +0000
Received: from BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::cce6:1c15:c6bd:dd05]) by BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::cce6:1c15:c6bd:dd05%7]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 17:11:19 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v5 08/23] vfio-user: define socket receive functions
Date: Thu,  5 May 2022 10:19:51 -0700
Message-Id: <13284a1a153e6791dc6afba2f4edf2ddf18c8d69.1651709440.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1651709440.git.john.g.johnson@oracle.com>
References: <cover.1651709440.git.john.g.johnson@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR06CA0048.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::25) To BYAPR10MB3255.namprd10.prod.outlook.com
 (2603:10b6:a03:156::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 061cfecf-c91c-4c59-0cb5-08da2eba44d3
X-MS-TrafficTypeDiagnostic: DM5PR10MB1867:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB1867BFDE4E4FDC8FEAC08397B6C29@DM5PR10MB1867.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BcbmPST/M5oEg0nqP1efZ99k19G9eybXp101x0SyhYkeIseDlRgo50xxzPq3ZT/MepwLycYWpejPLArnmxwUtEc7vXkLubJJTlzD6I5u4PUmTdR3gX+6D9v9nvIPSwlR5Aerld9qwe7RPdTwDGZZ64rhGS4pK9CNzUQF9ZsmdRClfItqt6IWFAfz8ms6wY+Pq4UUlUGezEvTMRfWXA/8NbEcydpp3BQdC9lUlGSrkCXEXlslgyDtmy6MCFV4lXtZRow1UNmjARAqjZdGMZvxZYnV2h09YABfk+7rb6JifpVog522QTcQ4hPb0MRz35rec1cWn+NdXuxeZdT7oOV0XX+acM9d1F2gtMZ1PcjUrhBYmtE+q2uM5Hl/xQIM5oYX4F2e+tY8IvPw4LT9HpzTGC0C9ZvrhIXFm3peZ8OtPuUeeGSW6JDTYqrZlqrbpRVM2nfF6GjIJzxuvQPSOho4p06F6rkCgpr3louLQA2wZZQ15pKMpPozeCP9YL+ILlYZLdR7Z43VK7WCAjvnP68o1x76m+7PNNMyTv0ClATjDa/p1O/NQlzHohiOmdWTtG0nvC8DsUeuGHi9ShGpXNAsy/LPVJspKjpsqPicv2qOsTHntZKzWBZVw6wrfEBZnmx7VSDfPUUSnSM9TbZGqR8kURfJ1tfRPU5nYiQx4lUNT+frz8jPGSd+VRLrQ2i8BGtGdkABmOKO6NyLz1UMkZ/4uQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3255.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(52116002)(6666004)(8676002)(66556008)(66946007)(66476007)(8936002)(38100700002)(38350700002)(5660300002)(86362001)(508600001)(6486002)(316002)(6506007)(186003)(83380400001)(36756003)(30864003)(2616005)(2906002)(26005)(6512007)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHByakxQRDRZRDlxbTFDL0tOWmVFRVhrc1Zxd0lPUTN4Y3Jzek1SVzhrb3po?=
 =?utf-8?B?ZDV2QXBJMXlPVFBXZ2lKa2VFTnByd3BsdUdmTW85cDdFVXpIMW5sYjJ1bHVD?=
 =?utf-8?B?QWdiVkRNMVRGdjdIaFA2TzFmejBJbWltaDRGbmlYUHBPY0xoeHBJYWNUMHVL?=
 =?utf-8?B?NFJLeVo1S2lrcUNOaEhmcUdwNTZFQlVVeVphS09odTdFMW9FckYvTVh6ZW5n?=
 =?utf-8?B?VzRaODVXc2hLeWhpcEZiQjFqcXB2WFJDVkxiMW9MU2Z6RnFtRUJoS2Q3Y1h0?=
 =?utf-8?B?YU1ESHpiaEMzdjdjeEI4YkZ4d2UrbU9nOEQ5Nk9UaFduNnZia3NEeWxoSXFm?=
 =?utf-8?B?M0RHai9zcHJvRFFPLzNaN0lFMzFlOU5PWVNZam9FOExoYVIxSEpnNkQ0N3Vp?=
 =?utf-8?B?eVY4NXNFZHpFQmpadmIvZmVLRmJhL0JEWWNKWENLTW1xY2RYM2VxVG9VSHJ0?=
 =?utf-8?B?eXRtMHhXaEZpL3Jyb2pyemt4ajN2SWJpWTRHU1lNRitKNEVqaW1Ed1A0YVZn?=
 =?utf-8?B?cU9EV3BsdTZNcHhnMTFDVlBXZ2NCdFVpcHNVUmtJbng5YUVRRnA5citna3A1?=
 =?utf-8?B?aTlPWFNseXpsWEh3WU85RGlOTS90dW5hN1pPWjN0V2l1NlNQWEZqdHdmNWJv?=
 =?utf-8?B?WndDRDZlcVBwSDhMbis1TEpZMVppQThoeVBFc0F1NVBZYUc5aUxvallEeHda?=
 =?utf-8?B?bm5seUhnditRUkJjSHhrRDN4MmcwZTB0TjhMdm9Obi9HcVBCeWlET2hLU0JN?=
 =?utf-8?B?Z0lKSkxJWUtEbUhoMU9YMGdvejFYd0dFSEtLV2xwaDJoTVI5Y3pjQktRaTJo?=
 =?utf-8?B?eEl1aVhEdTVkK1ZxeUtaTEprZkV5c2UxaERBM093WWY0RWZWdGVmNXhFVGE2?=
 =?utf-8?B?S3JITTNWQ09wWnovZnBDZDduUzVFUGxIV2NrUi8zdG01M3FxUzVxdXhEVzhK?=
 =?utf-8?B?Q3FjaE9pOXZCbVJEby9ZM0xyR3RoNHQzaTZVK0JkdXN6cXlTcTY5UVd6SFRP?=
 =?utf-8?B?a2p6c0xSMTNVODQ4Z3M3dnJTT09LaSthZXlVSStBcHhoT1RyOHNITGNIZ0ZL?=
 =?utf-8?B?LzRtNkdneEhsODVtV1JwNklMeTdyNWFnenZoeEpFNHRHN1hGdkEvbFJWR3Y5?=
 =?utf-8?B?RXp2a3dQbnZISnhTNE5nUFN6amxNOElDQWJrMVlNQXdOdkdqUERjZnBGZFd1?=
 =?utf-8?B?UGlSZm9vbGYxb2F0VjdLYUREek1XTW1OZHRPQVpYR0tndWsvMDB2TG9vWTAy?=
 =?utf-8?B?RWxPeW41RzNEQW9aNG9XQVNtQXBML1JKUDFwdWE3NndmcDFEcDkyTHgwWC9O?=
 =?utf-8?B?ZXZYTnVzTWdrVjU4V0EvK2k5ZHlxNUlwTFdBWDdwc2pWYllsdFJtTGZvNFc5?=
 =?utf-8?B?WDFVSkU3Nms0NEpUbTVzdjhnNDEwRWRabm0rQkR0RzFOajBSVlIxMWRCZlVs?=
 =?utf-8?B?a2dhbEZSZWY0ZDZXTnRnd2s5R2M4bEhETzdyaXhMQ241UHlLL2lybjFiTSsr?=
 =?utf-8?B?S2xDYm9YdTlLeFZCZ3A1SXByQ21hcEoxK2lOdjNTMWJ2NUJYYVNLdWlzZTdK?=
 =?utf-8?B?ZG56ZVZncnpLWWZYczVJclp4ZUNibUorZ0ZQMXdjdnI3SU4vV0laR0MzS3Yx?=
 =?utf-8?B?N2FJeXAzeTc5dWlrZUdJSWRlaHRJa1VYZFBuRzZReGM2eXpiaDZEa1hzY2V6?=
 =?utf-8?B?emZjTldGV2Q4M1BPWkRCM0JZcFRqSFJKeGV4eVB3dlJNTU1JSjBoa3dSMkZW?=
 =?utf-8?B?aGRldWk2SHBoNXhubEJEZSt1MlNpR0ViSXlhdnBVN2pDeHNtaXZtNUxNZTE1?=
 =?utf-8?B?R2x4VTdHSWMxUVFIOExLZlFuZ050U0w2NHprSFUxMzI3Zmc5OVdhbjl5dk94?=
 =?utf-8?B?MEs3cXAwTlZhZjNvanJDWERMS0ZHUk5mUW9xUFU4NHo2eGZsL3h0Y2FQbWph?=
 =?utf-8?B?MGNuMDdhcXpZWjVCUkVaWnB1MHhhR3c2Yk51T2V1ajNFWUg0UGV5cEU4R0Rx?=
 =?utf-8?B?SmR3Smp6ekwrKzFwaloveFJnbThvS1Jka0FacktUb2JZa2VvWG0wVHlwZVJZ?=
 =?utf-8?B?dW5VU2pFNkhqRk1EL296VWJ5YWFLdXVJbFFZcVc4S1UrZWpJUFpkdnVRS1JL?=
 =?utf-8?B?UkM4bk5Lc3pVc2JLWmNvaWZJRE5adEVZcG04ZGlIMTlyVXNqRVJUaVFrc0Qv?=
 =?utf-8?B?N0lKTVhMTHNXUVRwQzBlTnIrcjd3bkRYWmkxQ09UOFlMYWhYc2Y1TDlKWTFy?=
 =?utf-8?B?WVdMQXJQWi9DY0hNSElPc0x0UmdaTGJZOWpqNmRBSnVvNEhjblVlcnl2OWhp?=
 =?utf-8?B?anlUSE1sbzVOZHRKbHNCelA5dm5sVDVBYkpkNG5uN2VDcFRnQ1Q3RCtLdmFK?=
 =?utf-8?Q?Ya7nsPAiI4vwp+/s=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 061cfecf-c91c-4c59-0cb5-08da2eba44d3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 17:11:18.0916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aX2HuHQ/yq1qUiK2rht0YzDyayMaw+gKJmJmG5H88/KZgzOxiQ6Zc7oGg9rylBZugm8w1fgQjifeRdIrMKa3kfqRvt1drb+79TuEwDFmuvQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1867
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-05_06:2022-05-05,
 2022-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205050118
X-Proofpoint-GUID: eo7M_APFv2pnP5LqbJq6iZClG2uLZmjF
X-Proofpoint-ORIG-GUID: eo7M_APFv2pnP5LqbJq6iZClG2uLZmjF
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add infrastructure needed to receive incoming messages

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/user-protocol.h |  54 +++++++
 hw/vfio/user.h          |   8 +
 hw/vfio/pci.c           |   6 +
 hw/vfio/user.c          | 404 ++++++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS             |   1 +
 5 files changed, 473 insertions(+)
 create mode 100644 hw/vfio/user-protocol.h

diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
new file mode 100644
index 0000000..d23877c
--- /dev/null
+++ b/hw/vfio/user-protocol.h
@@ -0,0 +1,54 @@
+#ifndef VFIO_USER_PROTOCOL_H
+#define VFIO_USER_PROTOCOL_H
+
+/*
+ * vfio protocol over a UNIX socket.
+ *
+ * Copyright © 2018, 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Each message has a standard header that describes the command
+ * being sent, which is almost always a VFIO ioctl().
+ *
+ * The header may be followed by command-specific data, such as the
+ * region and offset info for read and write commands.
+ */
+
+typedef struct {
+    uint16_t id;
+    uint16_t command;
+    uint32_t size;
+    uint32_t flags;
+    uint32_t error_reply;
+} VFIOUserHdr;
+
+/* VFIOUserHdr commands */
+enum vfio_user_command {
+    VFIO_USER_VERSION                   = 1,
+    VFIO_USER_DMA_MAP                   = 2,
+    VFIO_USER_DMA_UNMAP                 = 3,
+    VFIO_USER_DEVICE_GET_INFO           = 4,
+    VFIO_USER_DEVICE_GET_REGION_INFO    = 5,
+    VFIO_USER_DEVICE_GET_REGION_IO_FDS  = 6,
+    VFIO_USER_DEVICE_GET_IRQ_INFO       = 7,
+    VFIO_USER_DEVICE_SET_IRQS           = 8,
+    VFIO_USER_REGION_READ               = 9,
+    VFIO_USER_REGION_WRITE              = 10,
+    VFIO_USER_DMA_READ                  = 11,
+    VFIO_USER_DMA_WRITE                 = 12,
+    VFIO_USER_DEVICE_RESET              = 13,
+    VFIO_USER_DIRTY_PAGES               = 14,
+    VFIO_USER_MAX,
+};
+
+/* VFIOUserHdr flags */
+#define VFIO_USER_REQUEST       0x0
+#define VFIO_USER_REPLY         0x1
+#define VFIO_USER_TYPE          0xF
+
+#define VFIO_USER_NO_REPLY      0x10
+#define VFIO_USER_ERROR         0x20
+
+#endif /* VFIO_USER_PROTOCOL_H */
diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index da92862..68a1080 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -11,6 +11,8 @@
  *
  */
 
+#include "user-protocol.h"
+
 typedef struct {
     int send_fds;
     int recv_fds;
@@ -27,6 +29,7 @@ enum msg_type {
 
 typedef struct VFIOUserMsg {
     QTAILQ_ENTRY(VFIOUserMsg) next;
+    VFIOUserHdr *hdr;
     VFIOUserFDs *fds;
     uint32_t rsize;
     uint32_t id;
@@ -66,6 +69,8 @@ typedef struct VFIOProxy {
     VFIOUserMsgQ incoming;
     VFIOUserMsgQ outgoing;
     VFIOUserMsg *last_nowait;
+    VFIOUserMsg *part_recv;
+    size_t recv_left;
     enum proxy_state state;
 } VFIOProxy;
 
@@ -74,5 +79,8 @@ typedef struct VFIOProxy {
 
 VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp);
 void vfio_user_disconnect(VFIOProxy *proxy);
+void vfio_user_set_handler(VFIODevice *vbasedev,
+                           void (*handler)(void *opaque, VFIOUserMsg *msg),
+                           void *reqarg);
 
 #endif /* VFIO_USER_H */
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 8f65074..7ef11c0 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3387,6 +3387,11 @@ type_init(register_vfio_pci_dev_type)
  * vfio-user routines.
  */
 
+static void vfio_user_pci_process_req(void *opaque, VFIOUserMsg *msg)
+{
+
+}
+
 /*
  * Emulated devices don't use host hot reset
  */
@@ -3433,6 +3438,7 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
         return;
     }
     vbasedev->proxy = proxy;
+    vfio_user_set_handler(vbasedev, vfio_user_pci_process_req, vdev);
 
     vbasedev->name = g_strdup_printf("VFIO user <%s>", udev->sock_name);
     vbasedev->dev = DEVICE(vdev);
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index c843f90..16b37cb 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -25,10 +25,26 @@
 #include "sysemu/iothread.h"
 #include "user.h"
 
+static uint64_t max_xfer_size;
 static IOThread *vfio_user_iothread;
 
 static void vfio_user_shutdown(VFIOProxy *proxy);
+static VFIOUserMsg *vfio_user_getmsg(VFIOProxy *proxy, VFIOUserHdr *hdr,
+                                     VFIOUserFDs *fds);
+static VFIOUserFDs *vfio_user_getfds(int numfds);
+static void vfio_user_recycle(VFIOProxy *proxy, VFIOUserMsg *msg);
 
+static void vfio_user_recv(void *opaque);
+static int vfio_user_recv_one(VFIOProxy *proxy);
+static void vfio_user_cb(void *opaque);
+
+static void vfio_user_request(void *opaque);
+
+static inline void vfio_user_set_error(VFIOUserHdr *hdr, uint32_t err)
+{
+    hdr->flags |= VFIO_USER_ERROR;
+    hdr->error_reply = err;
+}
 
 /*
  * Functions called by main, CPU, or iothread threads
@@ -40,10 +56,338 @@ static void vfio_user_shutdown(VFIOProxy *proxy)
     qio_channel_set_aio_fd_handler(proxy->ioc, proxy->ctx, NULL, NULL, NULL);
 }
 
+static VFIOUserMsg *vfio_user_getmsg(VFIOProxy *proxy, VFIOUserHdr *hdr,
+                                     VFIOUserFDs *fds)
+{
+    VFIOUserMsg *msg;
+
+    msg = QTAILQ_FIRST(&proxy->free);
+    if (msg != NULL) {
+        QTAILQ_REMOVE(&proxy->free, msg, next);
+    } else {
+        msg = g_malloc0(sizeof(*msg));
+        qemu_cond_init(&msg->cv);
+    }
+
+    msg->hdr = hdr;
+    msg->fds = fds;
+    return msg;
+}
+
+/*
+ * Recycle a message list entry to the free list.
+ */
+static void vfio_user_recycle(VFIOProxy *proxy, VFIOUserMsg *msg)
+{
+    if (msg->type == VFIO_MSG_NONE) {
+        error_printf("vfio_user_recycle - freeing free msg\n");
+        return;
+    }
+
+    /* free msg buffer if no one is waiting to consume the reply */
+    if (msg->type == VFIO_MSG_NOWAIT || msg->type == VFIO_MSG_ASYNC) {
+        g_free(msg->hdr);
+        if (msg->fds != NULL) {
+            g_free(msg->fds);
+        }
+    }
+
+    msg->type = VFIO_MSG_NONE;
+    msg->hdr = NULL;
+    msg->fds = NULL;
+    msg->complete = false;
+    QTAILQ_INSERT_HEAD(&proxy->free, msg, next);
+}
+
+static VFIOUserFDs *vfio_user_getfds(int numfds)
+{
+    VFIOUserFDs *fds = g_malloc0(sizeof(*fds) + (numfds * sizeof(int)));
+
+    fds->fds = (int *)((char *)fds + sizeof(*fds));
+
+    return fds;
+}
+
 /*
  * Functions only called by iothread
  */
 
+/*
+ * Process a received message.
+ */
+static void vfio_user_process(VFIOProxy *proxy, VFIOUserMsg *msg, bool isreply)
+{
+
+    /*
+     * Replies signal a waiter, if none just check for errors
+     * and free the message buffer.
+     *
+     * Requests get queued for the BH.
+     */
+    if (isreply) {
+        msg->complete = true;
+        if (msg->type == VFIO_MSG_WAIT) {
+            qemu_cond_signal(&msg->cv);
+        } else {
+            if (msg->hdr->flags & VFIO_USER_ERROR) {
+                error_printf("vfio_user_rcv:  error reply on async request ");
+                error_printf("command %x error %s\n", msg->hdr->command,
+                             strerror(msg->hdr->error_reply));
+            }
+            /* youngest nowait msg has been ack'd */
+            if (proxy->last_nowait == msg) {
+                proxy->last_nowait = NULL;
+            }
+            vfio_user_recycle(proxy, msg);
+        }
+    } else {
+        QTAILQ_INSERT_TAIL(&proxy->incoming, msg, next);
+        qemu_bh_schedule(proxy->req_bh);
+    }
+}
+
+/*
+ * Complete a partial message read
+ */
+static int vfio_user_complete(VFIOProxy *proxy, Error **errp)
+{
+    VFIOUserMsg *msg = proxy->part_recv;
+    size_t msgleft = proxy->recv_left;
+    bool isreply;
+    char *data;
+    int ret;
+
+    data = (char *)msg->hdr + (msg->hdr->size - msgleft);
+    while (msgleft > 0) {
+        ret = qio_channel_read(proxy->ioc, data, msgleft, errp);
+
+        /* error or would block */
+        if (ret <= 0) {
+            /* try for rest on next iternation */
+            if (ret == QIO_CHANNEL_ERR_BLOCK) {
+                proxy->recv_left = msgleft;
+            }
+            return ret;
+        }
+
+        msgleft -= ret;
+        data += ret;
+    }
+
+    /*
+     * Read complete message, process it.
+     */
+    proxy->part_recv = NULL;
+    proxy->recv_left = 0;
+    isreply = (msg->hdr->flags & VFIO_USER_TYPE) == VFIO_USER_REPLY;
+    vfio_user_process(proxy, msg, isreply);
+
+    /* return positive value */
+    return 1;
+}
+
+static void vfio_user_recv(void *opaque)
+{
+    VFIOProxy *proxy = opaque;
+
+    QEMU_LOCK_GUARD(&proxy->lock);
+
+    if (proxy->state == VFIO_PROXY_CONNECTED) {
+        while (vfio_user_recv_one(proxy) == 0) {
+            ;
+        }
+    }
+}
+
+/*
+ * Receive and process one incoming message.
+ *
+ * For replies, find matching outgoing request and wake any waiters.
+ * For requests, queue in incoming list and run request BH.
+ */
+static int vfio_user_recv_one(VFIOProxy *proxy)
+{
+    VFIOUserMsg *msg = NULL;
+    g_autofree int *fdp = NULL;
+    VFIOUserFDs *reqfds;
+    VFIOUserHdr hdr;
+    struct iovec iov = {
+        .iov_base = &hdr,
+        .iov_len = sizeof(hdr),
+    };
+    bool isreply = false;
+    int i, ret;
+    size_t msgleft, numfds = 0;
+    char *data = NULL;
+    char *buf = NULL;
+    Error *local_err = NULL;
+
+    /*
+     * Complete any partial reads
+     */
+    if (proxy->part_recv != NULL) {
+        ret = vfio_user_complete(proxy, &local_err);
+
+        /* still not complete, try later */
+        if (ret == QIO_CHANNEL_ERR_BLOCK) {
+            return ret;
+        }
+
+        if (ret <= 0) {
+            goto fatal;
+        }
+        /* else fall into reading another msg */
+    }
+
+    /*
+     * Read header
+     */
+    ret = qio_channel_readv_full(proxy->ioc, &iov, 1, &fdp, &numfds,
+                                 &local_err);
+    if (ret == QIO_CHANNEL_ERR_BLOCK) {
+        return ret;
+    }
+
+    /* read error or other side closed connection */
+    if (ret <= 0) {
+        goto fatal;
+    }
+
+    if (ret < sizeof(msg)) {
+        error_setg(&local_err, "short read of header");
+        goto fatal;
+    }
+
+    /*
+     * Validate header
+     */
+    if (hdr.size < sizeof(VFIOUserHdr)) {
+        error_setg(&local_err, "bad header size");
+        goto fatal;
+    }
+    switch (hdr.flags & VFIO_USER_TYPE) {
+    case VFIO_USER_REQUEST:
+        isreply = false;
+        break;
+    case VFIO_USER_REPLY:
+        isreply = true;
+        break;
+    default:
+        error_setg(&local_err, "unknown message type");
+        goto fatal;
+    }
+
+    /*
+     * For replies, find the matching pending request.
+     * For requests, reap incoming FDs.
+     */
+    if (isreply) {
+        QTAILQ_FOREACH(msg, &proxy->pending, next) {
+            if (hdr.id == msg->id) {
+                break;
+            }
+        }
+        if (msg == NULL) {
+            error_setg(&local_err, "unexpected reply");
+            goto err;
+        }
+        QTAILQ_REMOVE(&proxy->pending, msg, next);
+
+        /*
+         * Process any received FDs
+         */
+        if (numfds != 0) {
+            if (msg->fds == NULL || msg->fds->recv_fds < numfds) {
+                error_setg(&local_err, "unexpected FDs");
+                goto err;
+            }
+            msg->fds->recv_fds = numfds;
+            memcpy(msg->fds->fds, fdp, numfds * sizeof(int));
+        }
+    } else {
+        if (numfds != 0) {
+            reqfds = vfio_user_getfds(numfds);
+            memcpy(reqfds->fds, fdp, numfds * sizeof(int));
+        } else {
+            reqfds = NULL;
+        }
+    }
+
+    /*
+     * Put the whole message into a single buffer.
+     */
+    if (isreply) {
+        if (hdr.size > msg->rsize) {
+            error_setg(&local_err, "reply larger than recv buffer");
+            goto err;
+        }
+        *msg->hdr = hdr;
+        data = (char *)msg->hdr + sizeof(hdr);
+    } else {
+        if (hdr.size > max_xfer_size) {
+            error_setg(&local_err, "vfio_user_recv request larger than max");
+            goto err;
+        }
+        buf = g_malloc0(hdr.size);
+        memcpy(buf, &hdr, sizeof(hdr));
+        data = buf + sizeof(hdr);
+        msg = vfio_user_getmsg(proxy, (VFIOUserHdr *)buf, reqfds);
+        msg->type = VFIO_MSG_REQ;
+    }
+
+    /*
+     * Read rest of message.
+     */
+    msgleft = hdr.size - sizeof(hdr);
+    while (msgleft > 0) {
+        ret = qio_channel_read(proxy->ioc, data, msgleft, &local_err);
+
+        /* prepare to complete read on next iternation */
+        if (ret == QIO_CHANNEL_ERR_BLOCK) {
+            proxy->part_recv = msg;
+            proxy->recv_left = msgleft;
+            return ret;
+        }
+
+        if (ret <= 0) {
+            goto fatal;
+        }
+
+        msgleft -= ret;
+        data += ret;
+    }
+
+    vfio_user_process(proxy, msg, isreply);
+    return 0;
+
+    /*
+     * fatal means the other side closed or we don't trust the stream
+     * err means this message is corrupt
+     */
+fatal:
+    vfio_user_shutdown(proxy);
+    proxy->state = VFIO_PROXY_ERROR;
+
+    /* set error if server side closed */
+    if (ret == 0) {
+        error_setg(&local_err, "server closed socket");
+    }
+
+err:
+    for (i = 0; i < numfds; i++) {
+        close(fdp[i]);
+    }
+    if (isreply && msg != NULL) {
+        /* force an error to keep sending thread from hanging */
+        vfio_user_set_error(msg->hdr, EINVAL);
+        msg->complete = true;
+        qemu_cond_signal(&msg->cv);
+    }
+    error_prepend(&local_err, "vfio_user_recv: ");
+    error_report_err(local_err);
+    return -1;
+}
+
 static void vfio_user_cb(void *opaque)
 {
     VFIOProxy *proxy = opaque;
@@ -59,6 +403,51 @@ static void vfio_user_cb(void *opaque)
  * Functions called by main or CPU threads
  */
 
+/*
+ * Process incoming requests.
+ *
+ * The bus-specific callback has the form:
+ *    request(opaque, msg)
+ * where 'opaque' was specified in vfio_user_set_handler
+ * and 'msg' is the inbound message.
+ *
+ * The callback is responsible for disposing of the message buffer,
+ * usually by re-using it when calling vfio_send_reply or vfio_send_error,
+ * both of which free their message buffer when the reply is sent.
+ *
+ * If the callback uses a new buffer, it needs to free the old one.
+ */
+static void vfio_user_request(void *opaque)
+{
+    VFIOProxy *proxy = opaque;
+    VFIOUserMsgQ new, free;
+    VFIOUserMsg *msg, *m1;
+
+    /* reap all incoming */
+    QTAILQ_INIT(&new);
+    WITH_QEMU_LOCK_GUARD(&proxy->lock) {
+        QTAILQ_FOREACH_SAFE(msg, &proxy->incoming, next, m1) {
+            QTAILQ_REMOVE(&proxy->pending, msg, next);
+            QTAILQ_INSERT_TAIL(&new, msg, next);
+        }
+    }
+
+    /* process list */
+    QTAILQ_INIT(&free);
+    QTAILQ_FOREACH_SAFE(msg, &new, next, m1) {
+        QTAILQ_REMOVE(&new, msg, next);
+        proxy->request(proxy->req_arg, msg);
+        QTAILQ_INSERT_HEAD(&free, msg, next);
+    }
+
+    /* free list */
+    WITH_QEMU_LOCK_GUARD(&proxy->lock) {
+        QTAILQ_FOREACH_SAFE(msg, &free, next, m1) {
+            vfio_user_recycle(proxy, msg);
+        }
+    }
+}
+
 static QLIST_HEAD(, VFIOProxy) vfio_user_sockets =
     QLIST_HEAD_INITIALIZER(vfio_user_sockets);
 
@@ -97,6 +486,7 @@ VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp)
     }
 
     proxy->ctx = iothread_get_aio_context(vfio_user_iothread);
+    proxy->req_bh = qemu_bh_new(vfio_user_request, proxy);
 
     QTAILQ_INIT(&proxy->outgoing);
     QTAILQ_INIT(&proxy->incoming);
@@ -107,6 +497,18 @@ VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp)
     return proxy;
 }
 
+void vfio_user_set_handler(VFIODevice *vbasedev,
+                           void (*handler)(void *opaque, VFIOUserMsg *msg),
+                           void *req_arg)
+{
+    VFIOProxy *proxy = vbasedev->proxy;
+
+    proxy->request = handler;
+    proxy->req_arg = req_arg;
+    qio_channel_set_aio_fd_handler(proxy->ioc, proxy->ctx,
+                                   vfio_user_recv, NULL, proxy);
+}
+
 void vfio_user_disconnect(VFIOProxy *proxy)
 {
     VFIOUserMsg *r1, *r2;
@@ -122,6 +524,8 @@ void vfio_user_disconnect(VFIOProxy *proxy)
     }
     object_unref(OBJECT(proxy->ioc));
     proxy->ioc = NULL;
+    qemu_bh_delete(proxy->req_bh);
+    proxy->req_bh = NULL;
 
     proxy->state = VFIO_PROXY_CLOSING;
     QTAILQ_FOREACH_SAFE(r1, &proxy->outgoing, next, r2) {
diff --git a/MAINTAINERS b/MAINTAINERS
index cd44f91..c81f8b6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1964,6 +1964,7 @@ S: Supported
 F: docs/devel/vfio-user.rst
 F: hw/vfio/user.c
 F: hw/vfio/user.h
+F: hw/vfio/user-protocol.h
 
 vhost
 M: Michael S. Tsirkin <mst@redhat.com>
-- 
1.8.3.1


