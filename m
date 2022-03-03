Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5254CC267
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 17:14:58 +0100 (CET)
Received: from localhost ([::1]:42970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPo6T-0006zH-Lv
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 11:14:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1nPnoi-0007nN-2J
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:56:36 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:55456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1nPnof-0005pU-5V
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:56:34 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 223F00ti028799; 
 Thu, 3 Mar 2022 15:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=ddOh3AWSIwoxIrpKR9usJom/eI4t1iJTz3VFM0n8sT8=;
 b=hbGcYgdsDkeMJcvbq+/c5YjAGDKIFOzcEaGfV7u/1G2MGIj5eNRs4NjWlqHPF7l1sVTn
 a5kT3UrtnHE1Y7Yzii8BjA3wjGbZw7pXgrQu0XqEuaa+QJWOIsS8ZsoeVV+jO5jbUNYD
 xQELLKRz2wmfgTLnurZR/eOB+YiS1DGeUCFTl/bcpvWd5SEsnmSR9M4ltV0FvxiFTvKf
 ZdWgCQRweveM3k5C7XL69LJiiynxulGzenYFMpFJ/sgo837dVvoUVyM/GvXrA4VPi+Q3
 +HCKUu/DDBZqnihPChN08WI3+7u2g4sy5Hyg7hC6P5m0yOgKGIcPi1BSeiMpEkG6eYKW Ug== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3eh14c19k0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Mar 2022 15:56:24 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 223Fow3n050427;
 Thu, 3 Mar 2022 15:56:23 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2169.outbound.protection.outlook.com [104.47.73.169])
 by aserp3020.oracle.com with ESMTP id 3efc18wxns-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Mar 2022 15:56:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dkYVOjrmDTgbFpuzZIHGJXEAK4fplsvPkxhwWzZ2XBukC48xQqUK0TwNFmdxScKr54BMNANz1zt8/d3nAlWTuXcY8xCgXb7MY5wwXvIkMbi3UKD1g6h0hyKQi8IXJ7bS39m+RTmsDQdmniZTuUliNDCBq3C2oK1VgYsFbwULbPb5+yYVFxisr7WdeduLPa+2wsbhAipxmMgBmDd9wFZ8B1sVLqx/12JomcLdTzH0ViiOs5D6/Q4I+CHN2Yfffbj+XGWIhJo9X4ArUG57wyXAFP63CRVw09u8ZyjzVM/iV20adSLRJRSKy9nzW7c0obwbyTb9elvPhb0GlZA/x5pYBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ddOh3AWSIwoxIrpKR9usJom/eI4t1iJTz3VFM0n8sT8=;
 b=aXwc2hY8QpBeOMjy0nF/hRezgOWhYBJup2pxIZch02u58VTNEFLbnB5oGqrk+KZ7CztXM/ndSTmc7ltNLfLwdH9d72OeSxDm2kfQdKmuJForQpUIJQyXm3Be6ri2bHWJAwgNambinDUHBgXLjoCDg60pNRoWIadL1djVHYxw3uhLdJP/zIuDHRPLL4e/MgPR5aTRc+RJRHzXXtTRGdLSSKde+x1e3wzQVMkdyErMy4yi4SalaYSuIXz4uuNCjeBty95xYqhX8sBHqfd94v/Fse9uVzxzyGk5xZ2f4WrDAZhvyyLfKEgXt8RivGSVFp3uaFHGm/Vm9NM285HC9Gtjsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ddOh3AWSIwoxIrpKR9usJom/eI4t1iJTz3VFM0n8sT8=;
 b=BnXgqk/DF4Emn+Z4vxcuDsOpkUcKzGV9WoMG7OtkBa0JFFOJVtNdDi7FbcSKjBnExSx14q/mBlEs+n4/yViEocQe3qPV23L8rYJtnHC6JPjVSws1A/7majRHAnaV7tjOLOOk+ueKMAWr/aTmci3wtXmSqGE0rnU27wu9FE/msSA=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by MN2PR10MB3309.namprd10.prod.outlook.com (2603:10b6:208:123::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 15:56:20 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6005:8b9:1b00:b0da]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6005:8b9:1b00:b0da%6]) with mapi id 15.20.5038.016; Thu, 3 Mar 2022
 15:56:20 +0000
Message-ID: <cb82092a-722c-17d4-f572-92e6976ca464@oracle.com>
Date: Thu, 3 Mar 2022 10:56:16 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH V7 10/29] machine: memfd-alloc option
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-11-git-send-email-steven.sistare@oracle.com>
 <YhfG1jp+XYFfCVSa@work-vm>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <YhfG1jp+XYFfCVSa@work-vm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0112.namprd04.prod.outlook.com
 (2603:10b6:806:122::27) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a5e66bf-76e6-48cd-75e4-08d9fd2e5c0a
X-MS-TrafficTypeDiagnostic: MN2PR10MB3309:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB3309139B44991D0F2611F624F9049@MN2PR10MB3309.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F4P7WCXlH4PMvrq8w/jpr5fnPffgF+hd9TH4jX70th4r/2YumfYf8/yrptSXuLM2PslVT1msvOFyfG5gNuEZ47wSfULkJa53m9JjNCbZrZj5gwf5a0lrWoPA6YcQy+Igo2bfDOZMY4JKAeOszqEd1uEWTg+Dkevds7ePDu2VXHiwoV5uxPuFPnGY4DyM9F0hEGTDWbu+oTdpMvL4Ho/rEg3irmQkc3X07hOm7B1GWp1U8xPgR4Lt/GO7YcLTcXVKWSwtJz1qCw7N3ulZkKWF48kGJk0BmKXN1SirrIMxeDyJyytBxIeBHxeQJmx98STqOtul8jv3PkJPdY7aSDHZwj2vzX7HcqbDXZAH0nWZTZDWtkziIkBbSD/TGbldcLA8+g6ZkHhttEGR34OC3l+CJZf9u9cwNx1fLS+/sK1fZyJ4RT1r+Ib/4KYYYtB8zNSe998MP750orn48RnO6nnzksCAycqDOZ5CaqfxABqe2ORaFMW1HcTBP6P4npOWUtPBbI0y674w2mwItwC1ewduHI9OTA+gPh6mtN6p00++cmb+9GwgN3ViORqRbJUX3KSua3ZgIM1ffdi8ZrsiT6Haw1gzhNOFLvX4vehVavCCPv1PeBbptzeAdf0ixfKt78JPbLXcX02Bz9w5I83lb7lOMBtxOGfS/KXPGZG5u/PfzQps3w04sXLRSUin1pCvBCTOxq6HdGPPaC9F8hVFfjzhCIDr9cabKvVuPyRq8yhX5xA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6916009)(54906003)(2906002)(36916002)(38100700002)(53546011)(6506007)(5660300002)(7416002)(44832011)(8936002)(4326008)(8676002)(66946007)(66476007)(66556008)(6666004)(107886003)(26005)(316002)(2616005)(31696002)(6512007)(31686004)(36756003)(508600001)(6486002)(83380400001)(186003)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWg0aHVKVEl0UVZ1ZFV5SHVpODBqUVlURkpLTERWbjQ0L0pqU0NIQ1U0S3F3?=
 =?utf-8?B?REIvWHJsbkp2TXZTcFQ1OXdsOWFBNnNjK091OGhSNWhKekpaWEhvNUVqUjl4?=
 =?utf-8?B?QWpaVERLWW1EMnRGY3R0MURMTXY1UmNFYUtjNUZwWUtpaUh5MWw3LzNtUjJN?=
 =?utf-8?B?bEJYaDc2cFNlWnlab21ESnFJWFpYanFTaHd0aTMrdzNKb1pMOU5NY3hkcFhR?=
 =?utf-8?B?VFVXYTZqUFloSFNNdlJBSHFtWW9uRzdVTnBCMnovOUJIYy9SR2lmZW1GNDdm?=
 =?utf-8?B?VXNoKzJENHBmbGEwaTRsRVhxWmhGeFRTUzh6RFl0eStkOWgxV2U3ZFIxTzB4?=
 =?utf-8?B?SVpSK3NOYkVBQ0pYZk1XMWc2eE55NDZzRENpS3VrL0NWQkdCOTl1SHVTeGxl?=
 =?utf-8?B?Wm9lemJNMXFQTFV1Y1hiclUxemJkbEJpSkF6QktFNGo2cjIxcHRFQzJoelJk?=
 =?utf-8?B?YVAzeEd3RWw5aFFzOHBvN2N4YzlTRDhwd0tVc08vWXhxWnh0MTBPZTRjdWh5?=
 =?utf-8?B?VFN6VWtFU0FIS2JyYXdWMXB4U2FZTkRQSGtoamdRZHFIZVR3dGxLMnZRV1Rv?=
 =?utf-8?B?YXV4aW85OWRWU1N4RnRtN0lTMms2SmJHS1UyUGgycXV0ODk5NGVSWG0xeUlu?=
 =?utf-8?B?aCtQMjcyM282WDFXdlE5TzNNanU5d1BQTG9kWjB6T1JLcUh4V0dyM1FqK2sy?=
 =?utf-8?B?WFErNXhWaVczSWYvYlZGbWxBc0xBYlZEK1h1aUYwZ3lxZ21BOXZSRW5udUJr?=
 =?utf-8?B?MDVTME9SN2ptemVQZ2szbW8rZlZUZ2M3TUVEcEdSenllZ29aTzk1V2MyVi9o?=
 =?utf-8?B?d3cwWlUzT3FiZ25CYkIzdWJRQ1dQa2RoM2Raak8rNGo1SUpMakVselNmMUxv?=
 =?utf-8?B?WlF5UkJzLzE3Y1lERTZZT0d6TDllZCtzZlpyL1FyeTMzT3hvK2hHNi9NUXZF?=
 =?utf-8?B?dXREVW5yZWhsUjYwNHNrbXBqS1BlRThmZFdWd3BXN21ManVrdm1JdHROb0E1?=
 =?utf-8?B?dC9PL3R5eWZDait1Q0xuNlN3alp1STdvL2tRVVVSWWxBZmEwSmlVck5hWVVX?=
 =?utf-8?B?b2xIL0htMFExQjk1dkpFYWx5U2ovUUFVZTNYS1g5T3RnNUVVaFJqczhxNldX?=
 =?utf-8?B?b3duV1BXZ2sxSWFIbjBXQk1ma0Rmb2tYUU84TFBLcHlRYW50VkZML0Q3MVJS?=
 =?utf-8?B?NW1OL2cvTHZpR2twUkgyQUExVXdQN0MvTDdaZzJwMmFXQVQyM09wWUNBdm9D?=
 =?utf-8?B?WU1CeUloOHM3MVQwdVVrZzJCQWV2MFVKcndoaFdQQVVpY1pwSjU1T281L2hy?=
 =?utf-8?B?OXE5ZVdaNVBrWExWYlRZb0FVaDJQWFlRbU1MdTZwSisvZ0tWSXhMNjJxbk9y?=
 =?utf-8?B?UUFLVmpoOVM2UmtWVTJ0N25JWExJUVljaWtwQjdoamVtNVpNOWFLTVlJNVlm?=
 =?utf-8?B?RS9yRTdseG5sVjRSREJuMUZsU2puNWZ2S1FxUWFFQzZaaHhMbHljUU1xa2dV?=
 =?utf-8?B?MnpHbEo4Vk9mb0diWDR0bk91R041bFdabEljWDV0VXNKNDdERkVjelkrdlQ2?=
 =?utf-8?B?ejJ2QWJLTHA2YUJqK2F5ME5oWTY0N29LYVZneVB2WWpZV3RXSlZ5cFN4bVBV?=
 =?utf-8?B?UjJhb1FUUS9hMXFBSi95YXMvbEhPSU9hVUwrL2lqUTkwWUhDcTFGY0pxU2xH?=
 =?utf-8?B?bzBkTEQ4SDVweEM3VnV5ano0VTlNcXpxd21CMngwWjUvK1lDQkppd3YwN3My?=
 =?utf-8?B?TmdrSEJYMHRERG42Zmord2phZUNrSWVWMlBqTXp2ZUN2a2NkU3V6QlB1d3RE?=
 =?utf-8?B?alJzRWxDblJ6M090SEF5cit2ZlNEUGJqNzloK2NHaUZKU0ZKU1lIS2EvSk5P?=
 =?utf-8?B?SjBCNVc0VkFvYmFZZ1ZCZU50cjZSWXI1YVArdFdHUDRLS01sNndZVEZJYjk3?=
 =?utf-8?B?WEYyWk4wOXN5OWZUUXB0bnliRkthOW8wMDFVMEhiN2hFT01Va01UdmJmNVpJ?=
 =?utf-8?B?Y2NLWlVjdlhmelkwUzlwc05qaTBVVkZwQlAyZE9kaXZVWXErS0VVcVVkRXVO?=
 =?utf-8?B?dWpXZ0p0RnBUSlZDZ0k5VjBET1pPbU52TWc2YmhVRS8wYXNhN3M3MGtZSHcx?=
 =?utf-8?B?eE1qRmVFcWUwaXJCT0dLRTk2d2pFKzJVVUlIU0N6U0ZMVitSK29xVUUvM3V3?=
 =?utf-8?B?WmI0VjZHdUNBYUpxaVJ4TU0yaTgwN1NtTUNLYlJ4Yi9DT1VGSmgvT0w1c0lD?=
 =?utf-8?B?Sk51VVZaY0tQVU8waXBOQ2NWUVZRPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a5e66bf-76e6-48cd-75e4-08d9fd2e5c0a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 15:56:20.5398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8kKhgPooumGomZ42PdL5L0FjotDwHP+YjGB7uKglC/7edF4W/Xs95omQ/J/m8FLkD13MSL/zqPjskvX4f1H9aXvxEvWcMJbORKqzemcnMgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3309
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10275
 signatures=686983
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2203030076
X-Proofpoint-GUID: miwmdjXJswx_CRtxVWDR5yHtaX79VESh
X-Proofpoint-ORIG-GUID: miwmdjXJswx_CRtxVWDR5yHtaX79VESh
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/2022 12:56 PM, Dr. David Alan Gilbert wrote:
> * Steve Sistare (steven.sistare@oracle.com) wrote:
>> Allocate anonymous memory using memfd_create if the memfd-alloc machine
>> option is set.
>>
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> 
> So other than the minor error nit that Guoyi spotted, I think this is
> pretty good,  one other comment below:
> 
>> ---
>>  hw/core/machine.c   | 19 +++++++++++++++++++
>>  include/hw/boards.h |  1 +
>>  qemu-options.hx     |  6 ++++++
>>  softmmu/physmem.c   | 47 ++++++++++++++++++++++++++++++++++++++---------
>>  softmmu/vl.c        |  1 +
>>  trace-events        |  1 +
>>  util/qemu-config.c  |  4 ++++
>>  7 files changed, 70 insertions(+), 9 deletions(-)
>>
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index 53a99ab..7739d88 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -392,6 +392,20 @@ static void machine_set_mem_merge(Object *obj, bool value, Error **errp)
>>      ms->mem_merge = value;
>>  }
>>  
>> +static bool machine_get_memfd_alloc(Object *obj, Error **errp)
>> +{
>> +    MachineState *ms = MACHINE(obj);
>> +
>> +    return ms->memfd_alloc;
>> +}
>> +
>> +static void machine_set_memfd_alloc(Object *obj, bool value, Error **errp)
>> +{
>> +    MachineState *ms = MACHINE(obj);
>> +
>> +    ms->memfd_alloc = value;
>> +}
>> +
>>  static bool machine_get_usb(Object *obj, Error **errp)
>>  {
>>      MachineState *ms = MACHINE(obj);
>> @@ -829,6 +843,11 @@ static void machine_class_init(ObjectClass *oc, void *data)
>>      object_class_property_set_description(oc, "mem-merge",
>>          "Enable/disable memory merge support");
>>  
>> +    object_class_property_add_bool(oc, "memfd-alloc",
>> +        machine_get_memfd_alloc, machine_set_memfd_alloc);
>> +    object_class_property_set_description(oc, "memfd-alloc",
>> +        "Enable/disable allocating anonymous memory using memfd_create");
>> +
>>      object_class_property_add_bool(oc, "usb",
>>          machine_get_usb, machine_set_usb);
>>      object_class_property_set_description(oc, "usb",
>> diff --git a/include/hw/boards.h b/include/hw/boards.h
>> index 9c1c190..a57d7a0 100644
>> --- a/include/hw/boards.h
>> +++ b/include/hw/boards.h
>> @@ -327,6 +327,7 @@ struct MachineState {
>>      char *dt_compatible;
>>      bool dump_guest_core;
>>      bool mem_merge;
>> +    bool memfd_alloc;
>>      bool usb;
>>      bool usb_disabled;
>>      char *firmware;
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index 7d47510..33c8173 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -30,6 +30,7 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
>>      "                vmport=on|off|auto controls emulation of vmport (default: auto)\n"
>>      "                dump-guest-core=on|off include guest memory in a core dump (default=on)\n"
>>      "                mem-merge=on|off controls memory merge support (default: on)\n"
>> +    "                memfd-alloc=on|off controls allocating anonymous guest RAM using memfd_create (default: off)\n"
>>      "                aes-key-wrap=on|off controls support for AES key wrapping (default=on)\n"
>>      "                dea-key-wrap=on|off controls support for DEA key wrapping (default=on)\n"
>>      "                suppress-vmdesc=on|off disables self-describing migration (default=off)\n"
>> @@ -76,6 +77,11 @@ SRST
>>          supported by the host, de-duplicates identical memory pages
>>          among VMs instances (enabled by default).
>>  
>> +    ``memfd-alloc=on|off``
>> +        Enables or disables allocation of anonymous guest RAM using
>> +        memfd_create.  Any associated memory-backend objects are created with
>> +        share=on.  The memfd-alloc default is off.
>> +
>>      ``aes-key-wrap=on|off``
>>          Enables or disables AES key wrapping support on s390-ccw hosts.
>>          This feature controls whether AES wrapping keys will be created
>> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
>> index 3524c04..95e2b49 100644
>> --- a/softmmu/physmem.c
>> +++ b/softmmu/physmem.c
>> @@ -41,6 +41,7 @@
>>  #include "qemu/config-file.h"
>>  #include "qemu/error-report.h"
>>  #include "qemu/qemu-print.h"
>> +#include "qemu/memfd.h"
>>  #include "exec/memory.h"
>>  #include "exec/ioport.h"
>>  #include "sysemu/dma.h"
>> @@ -1964,35 +1965,63 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
>>      const bool shared = qemu_ram_is_shared(new_block);
>>      RAMBlock *block;
>>      RAMBlock *last_block = NULL;
>> +    struct MemoryRegion *mr = new_block->mr;
>>      ram_addr_t old_ram_size, new_ram_size;
>>      Error *err = NULL;
>> +    const char *name;
>> +    void *addr = 0;
>> +    size_t maxlen;
> 
> You could move some of these down to the top of the block you're using
> them.

Will do.

One question:  I added this to shorten lines and make my code additions more readable:

    size_t maxlen;
    maxlen = new_block->max_length;

However, I did not change new_block->max_length to maxlen in the second half of the
function which I did not modify, to avoid noise in the patch that is unrelated to cpr.
Making those changes would shorten a few multi-liners.  What is your preference -- 
make those changes or not?

- Steve

>> +    MachineState *ms = MACHINE(qdev_get_machine());
>>  
>>      old_ram_size = last_ram_page();
>>  
>>      qemu_mutex_lock_ramlist();
>> -    new_block->offset = find_ram_offset(new_block->max_length);
>> +    maxlen = new_block->max_length;
>> +    new_block->offset = find_ram_offset(maxlen);
>>  
>>      if (!new_block->host) {
>>          if (xen_enabled()) {
>> -            xen_ram_alloc(new_block->offset, new_block->max_length,
>> -                          new_block->mr, &err);
>> +            xen_ram_alloc(new_block->offset, maxlen, new_block->mr, &err);
>>              if (err) {
>>                  error_propagate(errp, err);
>>                  qemu_mutex_unlock_ramlist();
>>                  return;
>>              }
>>          } else {
>> -            new_block->host = qemu_anon_ram_alloc(new_block->max_length,
>> -                                                  &new_block->mr->align,
>> -                                                  shared, noreserve);
>> -            if (!new_block->host) {
>> +            name = memory_region_name(mr);
>> +            if (ms->memfd_alloc) {
>> +                Object *parent = &mr->parent_obj;
>> +                int mfd = -1;          /* placeholder until next patch */
>> +                mr->align = QEMU_VMALLOC_ALIGN;
>> +                if (mfd < 0) {
>> +                    mfd = qemu_memfd_create(name, maxlen + mr->align,
>> +                                            0, 0, 0, &err);
>> +                    if (mfd < 0) {
>> +                        return;
>> +                    }
>> +                }
>> +                qemu_set_cloexec(mfd);
>> +                /* The memory backend already set its desired flags. */
>> +                if (!object_dynamic_cast(parent, TYPE_MEMORY_BACKEND)) {
>> +                    new_block->flags |= RAM_SHARED;
>> +                }
>> +                addr = file_ram_alloc(new_block, maxlen, mfd,
>> +                                      false, false, 0, errp);
>> +                trace_anon_memfd_alloc(name, maxlen, addr, mfd);
>> +            } else {
>> +                addr = qemu_anon_ram_alloc(maxlen, &mr->align,
>> +                                           shared, noreserve);
>> +            }
>> +
>> +            if (!addr) {
>>                  error_setg_errno(errp, errno,
>>                                   "cannot set up guest memory '%s'",
>> -                                 memory_region_name(new_block->mr));
>> +                                 name);
>>                  qemu_mutex_unlock_ramlist();
>>                  return;
>>              }
>> -            memory_try_enable_merging(new_block->host, new_block->max_length);
>> +            memory_try_enable_merging(addr, maxlen);
>> +            new_block->host = addr;
>>          }
>>      }
>>  
>> diff --git a/softmmu/vl.c b/softmmu/vl.c
>> index 620a1f1..ab3648a 100644
>> --- a/softmmu/vl.c
>> +++ b/softmmu/vl.c
>> @@ -2440,6 +2440,7 @@ static void create_default_memdev(MachineState *ms, const char *path)
>>          object_property_set_str(obj, "mem-path", path, &error_fatal);
>>      }
>>      object_property_set_int(obj, "size", ms->ram_size, &error_fatal);
>> +    object_property_set_bool(obj, "share", ms->memfd_alloc, &error_fatal);
>>      object_property_add_child(object_get_objects_root(), mc->default_ram_id,
>>                                obj);
>>      /* Ensure backend's memory region name is equal to mc->default_ram_id */
>> diff --git a/trace-events b/trace-events
>> index a637a61..770a9ac 100644
>> --- a/trace-events
>> +++ b/trace-events
>> @@ -45,6 +45,7 @@ ram_block_discard_range(const char *rbname, void *hva, size_t length, bool need_
>>  # accel/tcg/cputlb.c
>>  memory_notdirty_write_access(uint64_t vaddr, uint64_t ram_addr, unsigned size) "0x%" PRIx64 " ram_addr 0x%" PRIx64 " size %u"
>>  memory_notdirty_set_dirty(uint64_t vaddr) "0x%" PRIx64
>> +anon_memfd_alloc(const char *name, size_t size, void *ptr, int fd) "%s size %zu ptr %p fd %d"
>>  
>>  # gdbstub.c
>>  gdbstub_op_start(const char *device) "Starting gdbstub using device %s"
>> diff --git a/util/qemu-config.c b/util/qemu-config.c
>> index 436ab63..3606e5c 100644
>> --- a/util/qemu-config.c
>> +++ b/util/qemu-config.c
>> @@ -207,6 +207,10 @@ static QemuOptsList machine_opts = {
>>              .type = QEMU_OPT_BOOL,
>>              .help = "enable/disable memory merge support",
>>          },{
>> +            .name = "memfd-alloc",
>> +            .type = QEMU_OPT_BOOL,
>> +            .help = "enable/disable memfd_create for anonymous memory",
>> +        },{
>>              .name = "usb",
>>              .type = QEMU_OPT_BOOL,
>>              .help = "Set on/off to enable/disable usb",
>> -- 
>> 1.8.3.1
>>

