Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E185E567E
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 01:03:46 +0200 (CEST)
Received: from localhost ([::1]:49078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob8kq-0005sz-EY
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 19:03:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1ob8ii-0004VQ-Ku
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 19:01:33 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:22328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1ob8ic-0006Bs-SA
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 19:01:30 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28LMxFfS016189;
 Wed, 21 Sep 2022 23:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=xY4+lau3LsQ7Q5kjQWP8XqS6It3w0hNt0FTIGYOqSBg=;
 b=cyGXSZNDXgPwnSRngLILYAL/OEMapOdnvI1bRvzAx3c56sPPqxdikYOdl5shZKL6kj46
 1Tns4S1o2EFKZx3oC34UVrq+XmDZnMfN4T3R+wfJRJxcI1i4qpEbpstF5DgKyJQh4HIg
 hr4c4iGYwN2zm9XOVpIbKj1Nr1WywxTbTk575ja9BYLnI6BSTn70Cb9zkMXjaKmLC6RE
 Tp0jjfQj3arQeCGJbPBewiaLha9lIU2D/IPmZ/mKrVnFo5x7t8AvjArpe5OPR72Pk3dC
 05rfI+1fXYoDzc4xU2VmxpriG3199fQzkV/U5g23aeMKZqxmlHt6WHAEM9uZVyRLHd8M 0w== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jn688kctm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Sep 2022 23:01:08 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 28LLciqj034210; Wed, 21 Sep 2022 23:01:07 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3jp39fcn7t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Sep 2022 23:01:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GrJXRKX9F8BKvDxRTmyfPp3tvO68JqQScrfcSozjwXi0DjBZeNeJah4PDNM664UWv1mMjvhU7eYLGzwrExuk3dZMZUCsJ8zTbrj9jMbv+w/lAZ7abZuTEm+DlFiGZwlf936mP6gsHQ1YLCrhaN3OL4RXHK/IUabpVtR1HkUjRsmZioSyWIrev1/UYo/7f4bdUx7+v1uoF0xLCxLB9GIorIvBxr7PSxzVJUCRGo2PZMxo4bYVqj45x57lfnOkQ5HCYcxK7SoRSGq8IR85ob0rlkiqKxb61sp1inj5wOh7BwCtTSyB35vgzcWaaxemfdsJmjQMJ3EZLDyM7G01SIs+5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xY4+lau3LsQ7Q5kjQWP8XqS6It3w0hNt0FTIGYOqSBg=;
 b=gk0Y//jC8WX7ZZmogRj9LMz8L1VPeT/3z6iql6iPe1eZdorYXs/KMU3YjGcL6xrZKG/ZNL1z8+vkF4cPTA+rIwmY/z0TVyCo/dYIgo11AUOb0OzlUAPmQ5UOoqC0x+SViwipxit/SzJsKFZB1UTRY0rJ07U4zAWHJKaUBXCSc65MHXxoiP+MzhOC+Fu5wYMLHVQTi+BzKPfyKSVnQpzyQPULp7//rS655yQxpyWpT2YqmuaLE9CJxAkQKWC4cZCwI0aE5XEVWwydSrwVxO+oIwEcUZfrpAZ4vg29cD+LtbTWbU0CDR2hmloeond7E393HsP5cgN+ICxbfTVOHm3OIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xY4+lau3LsQ7Q5kjQWP8XqS6It3w0hNt0FTIGYOqSBg=;
 b=S2uy3kWoElZQx6y/gX2dM96voeGOXfZ27T2irYtiTDQbSxxeGijKOcSlvPQjdW1AdUQQxmEIs7OsXuPEQJ2MiPzMA+/1UShxOK1ov5ubnY2BOO5TjPv0RmrCi7rO8lDwcrwrOaRGz1+bLmwQ/G14lEU+DgvqZelix6vdUTFDPvY=
Received: from MW4PR10MB6535.namprd10.prod.outlook.com (2603:10b6:303:225::12)
 by IA1PR10MB6146.namprd10.prod.outlook.com (2603:10b6:208:3aa::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.14; Wed, 21 Sep
 2022 23:01:03 +0000
Received: from MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::8096:7cf2:829f:fa13]) by MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::8096:7cf2:829f:fa13%6]) with mapi id 15.20.5654.016; Wed, 21 Sep 2022
 23:01:03 +0000
Message-ID: <5c5ad692-7162-ec05-cf40-dffa310706c8@oracle.com>
Date: Wed, 21 Sep 2022 16:00:58 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 2/3] vdpa: load vlan configuration at NIC startup
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Harpreet Singh Anand
 <hanand@xilinx.com>, Cindy Lu <lulu@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>
References: <20220906163621.1144675-1-eperezma@redhat.com>
 <20220906163621.1144675-3-eperezma@redhat.com>
 <CACGkMEvnVavevtxWa49Yew+Nnkx_Wfmgf1JLVXCBe=zkpvdHnQ@mail.gmail.com>
 <CACGkMEswG2nmTve+p2MU9ue5CuwAu69CpeOUzYnu_BVfZE56JA@mail.gmail.com>
 <CAJaqyWf=NfkL_2uXVapJ6qCLziBc2jg+jMyR+cBQu+yDG6eg5w@mail.gmail.com>
 <CACGkMEvW5ZUZEcx9COvwjAT5PUraoko8k1foBez=T1nmhjKpDw@mail.gmail.com>
 <34969f96-b7c4-c9f8-2248-3e84a84148b2@oracle.com>
 <CAJaqyWfZBHSTwY+WRDbwS+Sw0NsXsmpfhgpOtmLNM3dUWzrd7w@mail.gmail.com>
 <411586c9-22a2-1bd5-fbcd-a7658fd00446@oracle.com>
 <CAJaqyWcJ9Ci5=0jw_WcVuY27mG+H7uUq_imkV3+CWycCEt_h8A@mail.gmail.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CAJaqyWcJ9Ci5=0jw_WcVuY27mG+H7uUq_imkV3+CWycCEt_h8A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR21CA0011.namprd21.prod.outlook.com
 (2603:10b6:a03:114::21) To MW4PR10MB6535.namprd10.prod.outlook.com
 (2603:10b6:303:225::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6535:EE_|IA1PR10MB6146:EE_
X-MS-Office365-Filtering-Correlation-Id: eb6cc5dd-8271-4e8c-b6bf-08da9c252868
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5T5XwggTb1OBvWNIAmifxB+AaQcEUoz8hsscwkz05LqH86b5QWzMb+TfRi6T5F623lG1RbDPsR2RopbuX3kDdDf4nvUigjoa8vx3/OpDi1k7UA1691DHyQ7P7UxYWna03NsED6dMHIRoj86sh0ng1bQwtHf5n3y53ag9rRcc8FadZvvcwlYrePv7l7a4jSR3ZD/HcocUNKuCHh5KjYj+JLLL4h27+AqZhYUDlrs1fHn80/xGGgpnsTIkeO4MVdwiGzkfgsClusBpZ/SiscvGKxKeuFI7g50o58h1X5y1RjlSVHpzNcVe2IPk2AJ/KHpeK2PkOnVhzk+MHNvXtPpLFyhTOdGiPjmkcv1PPM2XkIzHygixNTaOcA9rH7R3wv3U0TxjjpQMRB73+sCkoeACcR1m7tCKQjselZaQeDBcl9lDlBoBnkwpkCF+8lKCOGIJiT1HJ2K6La5OH8CIPejYsms0Z2LWxjI8FJcy2N6EALUGDxEAGOdWOI7J/VEDj5VgcAPgrPmXA0ygbghPZPSDfXmEXiia/Tu0zWzWgbH3110njbED1jCforblwGB6NXoOsoukQeK4aNVqY2XjyM7jYjfkYAdAJu5qYqc5/ok/84egXFb1vv7H2jxocLE+dHLTa4qQIQpsSOamz7WzXsY0tTsQkHoF3cYOsX1kl3pKw5Mkeko80Ekp1PsmtuWJSgDsFhwDOYiM5VtXy4U0QFPk8T57/JKLKxRyEahUYgF+TAxxLb6fkqU1whvd0khGYCwTzE59pRaQn0rZXV8FNqVh4UWMP6ASiSVkM/50xO7da2A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR10MB6535.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(136003)(346002)(366004)(396003)(39860400002)(451199015)(7416002)(316002)(83380400001)(66574015)(4326008)(8676002)(36756003)(66946007)(66476007)(66556008)(2906002)(86362001)(31696002)(38100700002)(6486002)(478600001)(31686004)(53546011)(6512007)(26005)(6916009)(186003)(54906003)(2616005)(5660300002)(41300700001)(8936002)(36916002)(6666004)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjgzOVpNNlorWTRaV2ZvSmVMcEhtWStmcTVhNzFqUWFCeUpqaU5OTVZZZUNx?=
 =?utf-8?B?RlNTaEFVN1BDVjg1SEllWWY3dnVhNzMrK2p2eG1uRG9zbE5XVnNqQ2NDai9J?=
 =?utf-8?B?OGhlRzZpMG02emNHM2tRK3VCZGVvdHkyTmN3RUNYb1NIL3JwL2dGYkRJWlVU?=
 =?utf-8?B?bXFFRzZLcWJkM1BwdmZHWWZRakcyUDg0S3FBY1VwS01qRzNLMTRjS3Fhc2JG?=
 =?utf-8?B?eGh3cmtCWmt3Tk51ZDlkU1k5TWFUT2lUd2ZJWTVmTFNvcVgzdFozUjg4TTZt?=
 =?utf-8?B?TVk2NGozMnROQWs0WXNia2cyRTl4Vy9nUlR3ZzJvZWVja3MyV3BtQkcyNHFo?=
 =?utf-8?B?Q0VWSGpsUFYraEZHaWRuR3ZHUUNHK3k1MERxazBZMGszUmphT1pybEpabW9y?=
 =?utf-8?B?eHZnQ0kvSENKTG9sZDJkRGR6VENBT0ZLSDVrK3QwNERoWW5GWEhGbVczMzIy?=
 =?utf-8?B?VXNGWnRFR1krN3g0a0FobkRsRFY1UmZCM3lqSlFRZUI5eWVvYVRkbS9BeXp4?=
 =?utf-8?B?RlVMTEdCK0M0MDVUY3R3NGVENUpRaEZNcEVXOGxKMEFZanJKSmNmUjB6S0Vx?=
 =?utf-8?B?R1pza0RiaUl0dUV6YVM3aXZ4V1RvQzk3dFltVDJoZ25CcGJiTWxtc3h4eWZV?=
 =?utf-8?B?QzgxdmdPVnFqeWhpeW5oR2FpWGRFbjVsV2dscm1idXNBZUJtQ1BXMExVSW44?=
 =?utf-8?B?U2VjNWJPVEJNMlNYM2ZKRDZVVGlqOVdTUDVXSzNsNEJadXZmeHhtcVpDTDhH?=
 =?utf-8?B?bVhtcTJzNVBNSXczSmxBcVU2bXJvTWtObUV0eVQwT1ByTHFHMm0yd0kxdlF0?=
 =?utf-8?B?OEIxOGY0OEpYMXZQdHNRNEw1OXNkSG8rc2NydTcyZE45a2tzTXBXYjZMRmIy?=
 =?utf-8?B?TjFPVndiRm4zQmhLYTFGNnFWZ2F1NnMwMFJzUHVyVUFwcHppRm5DUGlabVNC?=
 =?utf-8?B?KzVFNDVJSnhxLytIYnh5dDFRMWpmalB6TXdKZmFFTll1S2pOdlRRcmNFQ2ky?=
 =?utf-8?B?eVpKNkxEcUJ2cVpxRnhaczN1TXQwWFRBYXdMQkZFZnVVV0JQSTV6T1dFbUF6?=
 =?utf-8?B?UzIraGg2SUQ4QUtYMUROZWliMFdZMVhrMGNiZlBoNFlTTlBLeGxqSHh2RVN6?=
 =?utf-8?B?clJ5TWlDZ0FUeTJSQithUFlMVSsrVEZ1NEQ0SjVSMVFEaDBHVStwVDRyeHVl?=
 =?utf-8?B?RE5JWnZsTVdhYW5LUjcwM1JvWEE2VnBJQXJYcE5zcVFxWG14VVFPTXUrNjZ2?=
 =?utf-8?B?ZCt5TlNSZ2RIOEpBRzJLZ0p2NVcwbkN1RzQzc0ZhaSttS21XaVRyOVE0a0hF?=
 =?utf-8?B?eGRvaG1rMUtPK0xUSi9MeUIrT3dmbGxKaDdJM3FXSTF2d3JsZFBGMElFOFdv?=
 =?utf-8?B?V3JrWmNJTFBnd2JJMGhFWVA5aElmMkRCcitKWWczR0JvSzEzSFhVTVFWWmlk?=
 =?utf-8?B?MWIvQ2YwbDAzMVVPSzVLMU4wMkw5VHdaZWd1S1pJdi9Gc2dBd0szZkFkWWRO?=
 =?utf-8?B?alBVVjB6Zk5SU1p6ZmwzNitaaUgvekhBT1RselhyUFUzQUJOaXhaaG9Bak1s?=
 =?utf-8?B?cnRKb1pTYzV6SCtwanRYdTJkWUxrSnlpVHhsVWdYaVR6Z1dUK1F3cFJCUzhS?=
 =?utf-8?B?YTB0REc0Y1R2RTRHZEliaGVuSE5mZHZNOVdMWUlvbnJtRHJhdVdlcDVqV2Ez?=
 =?utf-8?B?UnpDd3dXa3QzM0dVVXlzYnpsZVZwaHZtVUF3a2h1TzNBVU03S2tQOTRmMVJJ?=
 =?utf-8?B?Vlg0RmhOVzQ2ZnNITDIyOUpKS2srSXZ3OHM3eDZ4clJNL0ZGR2ltbjhkaktC?=
 =?utf-8?B?M0FKeXgwMHVPRXZFMDBrTWFWZC81Z3psUlNyUkpuSlBGc054TW94cnN1OGxj?=
 =?utf-8?B?YkdlQS80SG5MOEFjR0RrY0FETnkxS1E0dVVWUUUvQTZRYW9rTG5PMVJCdnRR?=
 =?utf-8?B?YXBCY1lFOU1CZjdjZzdZL0NvZDlZeXRGQ1Z3NTliTFY3SG5PRVNCWGs3a3pk?=
 =?utf-8?B?WTVSSlJuY0p6TkFkaXV0bXZ2WEdQS0JKRmlTMVVpWUNtaStrbW1WUlJ1MjZ5?=
 =?utf-8?B?bnhKaGZxT21hQWlEZ3RYektDYnBzZkVtd085SncvMEI1dUJUREhtU3VtVndy?=
 =?utf-8?Q?JgI3TKccOByQpnXMsDeUqls9b?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb6cc5dd-8271-4e8c-b6bf-08da9c252868
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6535.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 23:01:03.3427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FUDVBGLZa45W4ZlYMvR775oP0Adb5tqPvX1crxAXG5SH1/chIDBp8pY+3RkNiz87BK/1aUoBVraqZbyVEwkcNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6146
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_11,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 spamscore=0
 bulkscore=0 mlxscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209210155
X-Proofpoint-GUID: 59tpKYtgO2Fe30gBJ1KTegSH1G6fBbKU
X-Proofpoint-ORIG-GUID: 59tpKYtgO2Fe30gBJ1KTegSH1G6fBbKU
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.702,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/16/2022 6:45 AM, Eugenio Perez Martin wrote:
> On Wed, Sep 14, 2022 at 5:44 PM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>
>>
>> On 9/14/2022 2:57 PM, Eugenio Perez Martin wrote:
>>> On Wed, Sep 14, 2022 at 1:33 PM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>>>
>>>> On 9/14/2022 3:20 AM, Jason Wang wrote:
>>>>> On Fri, Sep 9, 2022 at 4:02 PM Eugenio Perez Martin <eperezma@redhat.com> wrote:
>>>>>> On Fri, Sep 9, 2022 at 8:40 AM Jason Wang <jasowang@redhat.com> wrote:
>>>>>>> On Fri, Sep 9, 2022 at 2:38 PM Jason Wang <jasowang@redhat.com> wrote:
>>>>>>>> On Wed, Sep 7, 2022 at 12:36 AM Eugenio Pérez <eperezma@redhat.com> wrote:
>>>>>>>>> To have enabled vlans at device startup may happen in the destination of
>>>>>>>>> a live migration, so this configuration must be restored.
>>>>>>>>>
>>>>>>>>> At this moment the code is not accessible, since SVQ refuses to start if
>>>>>>>>> vlan feature is exposed by the device.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>>>>>>> ---
>>>>>>>>>     net/vhost-vdpa.c | 46 ++++++++++++++++++++++++++++++++++++++++++++--
>>>>>>>>>     1 file changed, 44 insertions(+), 2 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>>>>>>>>> index 4bc3fd01a8..ecbfd08eb9 100644
>>>>>>>>> --- a/net/vhost-vdpa.c
>>>>>>>>> +++ b/net/vhost-vdpa.c
>>>>>>>>> @@ -100,6 +100,8 @@ static const uint64_t vdpa_svq_device_features =
>>>>>>>>>         BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
>>>>>>>>>         BIT_ULL(VIRTIO_NET_F_STANDBY);
>>>>>>>>>
>>>>>>>>> +#define MAX_VLAN    (1 << 12)   /* Per 802.1Q definition */
>>>>>>>>> +
>>>>>>>>>     VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
>>>>>>>>>     {
>>>>>>>>>         VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
>>>>>>>>> @@ -423,6 +425,47 @@ static int vhost_vdpa_net_load_mq(VhostVDPAState *s,
>>>>>>>>>         return *s->status != VIRTIO_NET_OK;
>>>>>>>>>     }
>>>>>>>>>
>>>>>>>>> +static int vhost_vdpa_net_load_single_vlan(VhostVDPAState *s,
>>>>>>>>> +                                           const VirtIONet *n,
>>>>>>>>> +                                           uint16_t vid)
>>>>>>>>> +{
>>>>>>>>> +    ssize_t dev_written = vhost_vdpa_net_load_cmd(s, VIRTIO_NET_CTRL_VLAN,
>>>>>>>>> +                                                  VIRTIO_NET_CTRL_VLAN_ADD,
>>>>>>>>> +                                                  &vid, sizeof(vid));
>>>>>>>>> +    if (unlikely(dev_written < 0)) {
>>>>>>>>> +        return dev_written;
>>>>>>>>> +    }
>>>>>>>>> +
>>>>>>>>> +    if (unlikely(*s->status != VIRTIO_NET_OK)) {
>>>>>>>>> +        return -EINVAL;
>>>>>>>>> +    }
>>>>>>>>> +
>>>>>>>>> +    return 0;
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>> +static int vhost_vdpa_net_load_vlan(VhostVDPAState *s,
>>>>>>>>> +                                    const VirtIONet *n)
>>>>>>>>> +{
>>>>>>>>> +    uint64_t features = n->parent_obj.guest_features;
>>>>>>>>> +
>>>>>>>>> +    if (!(features & BIT_ULL(VIRTIO_NET_F_CTRL_VLAN))) {
>>>>>>>>> +        return 0;
>>>>>>>>> +    }
>>>>>>>>> +
>>>>>>>>> +    for (int i = 0; i < MAX_VLAN >> 5; i++) {
>>>>>>>>> +        for (int j = 0; n->vlans[i] && j <= 0x1f; j++) {
>>>>>>>>> +            if (n->vlans[i] & (1U << j)) {
>>>>>>>>> +                int r = vhost_vdpa_net_load_single_vlan(s, n, (i << 5) + j);
>>>>>>>> This seems to cause a lot of latency if the driver has a lot of vlans.
>>>>>>>>
>>>>>>>> I wonder if it's simply to let all vlan traffic go by disabling
>>>>>>>> CTRL_VLAN feature at vDPA layer.
>>>>>> The guest will not be able to recover that vlan configuration.
>>>>> Spec said it's best effort and we actually don't do this for
>>>>> vhost-net/user for years and manage to survive.
>>>> I thought there's a border line between best effort and do nothing. ;-)
>>>>
>>> I also think it is worth at least trying to migrate it for sure. For
>>> MAC there may be too many entries, but VLAN should be totally
>>> manageable (and the information is already there, the bitmap is
>>> actually being migrated).
>> The vlan bitmap is migrated, though you'd still need to add vlan filter
>> one by one through ctrl vq commands, correct? AFAIK you can add one
>> filter for one single vlan ID at a time via VIRTIO_NET_CTRL_VLAN_ADD.
>>
>>>> I think that the reason this could survive is really software
>>>> implementation specific - say if the backend doesn't start with VLAN
>>>> filtering disabled (meaning allow all VLAN traffic to pass) then it
>>>> would become a problem. This won't be a problem for almost PF NICs but
>>>> may be problematic for vDPA e.g. VF backed VDPAs.
>>> I'd say the driver would expect all vlan filters to be cleared after a
>>> reset, isn't it?
>> If I understand the intended behavior (from QEMU implementation)
>> correctly, when VIRTIO_NET_F_CTRL_VLAN is negotiated it would start with
>> all VLANs filtered (meaning only untagged traffic can be received and
>> traffic with VLAN tag would get dropped). However, if
>> VIRTIO_NET_F_CTRL_VLAN is not negotiated, all traffic including untagged
>> and tagged can be received.
>>
>>>    The spec doesn't explicitly say anything about that
>>> as far as I see.
>> Here the spec is totally ruled by the (software artifact of)
>> implementation rather than what a real device is expected to work with
>> VLAN rx filters. Are we sure we'd stick to this flawed device
>> implementation? The guest driver seems to be agnostic with this broken
>> spec behavior so far, and I am afraid it's an overkill to add another
>> feature bit or ctrl command to VLAN filter in clean way.
>>
> I agree with all of the above. So, double checking, all vlan should be
> allowed by default at device start?
That is true only when VIRTIO_NET_F_CTRL_VLAN is not negotiated. If the 
guest already negotiated VIRTIO_NET_F_CTRL_VLAN before being migrated, 
device should resume with all VLANs filtered/disallowed.

>   Maybe the spec needs to be more
> clear in that regard?
Yes, I think this is crucial. Otherwise we can't get consistent 
behavior, either from software to vDPA, or cross various vDPA vendors.
>
>>>>>>> Another idea is to extend the spec to allow us to accept a bitmap of
>>>>>>> the vlan ids via a single command, then we will be fine.
>>>>>>>
>>>>>> I'm not sure if adding more ways to configure something is the answer,
>>>>>> but I'd be ok to implement it.
>>>>>>
>>>>>> Another idea is to allow the sending of many CVQ commands in parallel.
>>>>>> It shouldn't be very hard to achieve using exposed buffers as ring
>>>>>> buffers, and it will short down the start of the devices with many
>>>>>> features.
>>>>> In the extreme case, what if guests decide to filter all of the vlans?
>>>>> It means we need MAX_VLAN commands which may exceeds the size of the
>>>>> control virtqueue.
>>>> Indeed, that's a case where a single flat device state blob would be
>>>> more efficient for hardware drivers to apply than individual control
>>>> command messages do.
>>>>
>>> If we're going that route, being able to set a bitmap for vlan
>>> filtering (Jason's proposal) seems to solve more issues in the same
>>> shot, doesn't it?
>> If I understand correctly about Jason's proposal, it's a spec extension
>> already to add multiple VLAN IDs in a row. This seems not much different
>> than the device state blob for the resume API idea I just presented in
>> the KVM forum (which also needs to extend the spec in another way)?
>>
>> struct virtio_mig_cfg_net_ctrl_vlan {
>>       struct virtio_mig_state_header hdr;
>>       le32 vlans[128];
>> };
>>
>> What is additional benefit that makes it able to solve more issues?
>>
> Maybe I totally misunderstood you.
>
> I don't think the solution to this problem is to create a call from
> the VMM to restore all the device state (vlan, mac, stats, ...),
> because that would not allow the guest to configure many vlan filters
> in one shot and retain all other config.
Noted I was simply asking question. I am trying to understand if there 
exists a use case *out of migration* that the guest would require 
programming multiple vlan filters in a row rather than do multiple 
VIRTIO_NET_CTRL_VLAN_ADD calls, adding one vlan filter each. If there's 
indeed such a use case, then it's a nice addition out of the migration 
case, I agree.

Thanks,
-Siwei

>
> If your proposal is like Jason's in that regard, I'm totally ok with
> it, and I don't have a strong opinion about the layout. Maybe I would
> not name it "mig_state", since it would be used by the guest in other
> contexts than migration.
>
> In other words, we should handle this outside of the migration scope,
> because the guest may use it to set many vlan filters in one shot,
> retaining other configuration. No more, no less.
>
> Thanks!
>


