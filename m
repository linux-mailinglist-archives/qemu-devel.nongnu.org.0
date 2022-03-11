Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7E84D66CC
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 17:49:46 +0100 (CET)
Received: from localhost ([::1]:45234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSiSX-0002vW-6h
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 11:49:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1nSiOn-0000sb-GC
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 11:45:53 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:59232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1nSiOh-0002bL-Bs
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 11:45:49 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22BFxPPV012143; 
 Fri, 11 Mar 2022 16:45:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=/7VdfzKANaTKUqEt1Fa04ywqn6bDBDhAllRjGT/LmDc=;
 b=YFhMgzdwmQlZniY9K4u9FmykETC1XiBs07aAwNGbwwOC89xD0g3S4Yz9wfenMXzpXSdz
 4lnkQo3lOAHlnK4NBm+BQEYpYyICooicJspkd0vS4XWZJ2dzGDEBZMDPfjtIz0gJpANt
 GHpslur/UL378c5DA8vKLh9da63yLkVZgICEit3uH4ra8no3pjU2xN2Q8kvUem1qLqS3
 Aax7yIo0jY1Q63aouT8ZkGg7Pn6hjtrdae//QlG4cSb4IYl1L1uqn2bJC/zoHuvQDLqI
 Ntzxx1hYEQhI41Y4of5WtXru6V3ihwmv2eAjiQD470bjf2KoaScuPED4ajYAuiEtKoyF fQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ekyfssned-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Mar 2022 16:45:37 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22BGiePg104578;
 Fri, 11 Mar 2022 16:45:36 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
 by userp3030.oracle.com with ESMTP id 3ekvyxqnn8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Mar 2022 16:45:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GUp+KENh+KkljXDrlW5lSjJWV7Z3wERrs1djwPGM/YlO/5Gpq9H6rGiWZa1+kBmle93/3RR2MT52tjJ+TH57IQwU9FDvMmdyZD/ByxsUqOVYqknQt8g/X1XkH+q9kv8kwiZov18oNGdYqy+d2NLkiH8eHzBLeHxdqWkENlvYhpwOKK0haSgajGfuVTJNXVr/83uB1kdJApaXdxwADSZyVXYltdbwytcBFb7Km7WBi8AzWj0OPoka9OcB28odnPvFOqhDfaHdxQqR8I38qov8ZObo659qQS4YIq8Katygjohie/FqrN1zsInAnWA8AZD0ptwy1Yo+CFP7tJdsnIIXbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/7VdfzKANaTKUqEt1Fa04ywqn6bDBDhAllRjGT/LmDc=;
 b=a/gAG4hcLlQehOjJwLagu+zbAVcJnEQSoV8YBYrf1Mu4oiLk5yfUj0n5cW9820pL1SewJWzJVFWulmlelCHNYB+EoqDNPxwamW4GLXURXpGYb0MgkqW29KsTI1lJOZbvllMlwLvRl6UM5UbaZ+AFbn6vdP5Yx5gHFr+irj3S6bEXK5Qs7WVSI2p/7iXV7s96CYlp/io5GkiPpmOamMXgA4MhTdsnQfN/8dkpk7bcsxgX0v9lFjPmPX/Fi0SRneUbdkuLqSYolN8nmUDi6rknb1P/grdpZylTECeDE2pg8jFBK/lG/PmXV7OCPyeIuEsIhtbBJG9kazt6NXeKHBCsWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/7VdfzKANaTKUqEt1Fa04ywqn6bDBDhAllRjGT/LmDc=;
 b=nqKfbeAX+MN1+tH4w5o9mz3JZHrkigeYUuesinT8A/zVpasUSI5gwy4/4hTanFpT0APs685C9qc/1A+kbPE96hqeIu2uqJVKD61xS+z0IlWc7zesHrZ1J+gQCOnjGtpsZlel26FhOnoGcmYcDJ97PkG5UVCFDb+OSvuDj4wXmes=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by MN2PR10MB3760.namprd10.prod.outlook.com (2603:10b6:208:180::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Fri, 11 Mar
 2022 16:45:33 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6005:8b9:1b00:b0da]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6005:8b9:1b00:b0da%6]) with mapi id 15.20.5061.024; Fri, 11 Mar 2022
 16:45:33 +0000
Message-ID: <d9bb6d88-282d-3a0a-005c-a285ec9ec3c2@oracle.com>
Date: Fri, 11 Mar 2022 11:45:29 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH V7 12/29] vl: helper to request re-exec
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-13-git-send-email-steven.sistare@oracle.com>
 <CAJ+F1C+kKZS5N2W+T_TLszooj7_eiiPqiE+2zJdjBW21JqDzbg@mail.gmail.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CAJ+F1C+kKZS5N2W+T_TLszooj7_eiiPqiE+2zJdjBW21JqDzbg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN4PR0501CA0056.namprd05.prod.outlook.com
 (2603:10b6:803:41::33) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a432c72-321f-4050-1267-08da037e8f13
X-MS-TrafficTypeDiagnostic: MN2PR10MB3760:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB3760D628F4F121A56154BE8FF90C9@MN2PR10MB3760.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k5RWORQHt1EYfkmdNzBHmRoOE7nfwuNFvx93bP1jXE704YIbdroxwK8O0HOyAFB9pz6bLl8ehk8Pvcaj76knarg3cJD1bRn7+qiyoK8BLjkLeGGzE2MOGNx/cCW6RKAWFup81U0r2SLsLWCe5m0EhKpq5k2Cx8D8MtN52wAgxPZInAUOvkGTvhYKK4uCXvnefnPC5uq0O5xw77FMbpRNismSeLeX9DamUWFb00WNB8B+924rrx3zIQ6PQix+/gAwgocXiTYZWWGy4Tde1F5J2XKXKGzwNpq80umUOUXYQ3RxySfV4kWD9Yw1yra+CQr5RrytSji6p6WCjND1J0Ao6Zd/NvbRRmYs5jA4DzgFnFokgK1qUoNZjC0kB1z1cepe9oAUM8XKOt/PzhoyyoGH7rBVOU4IYcv0E2WClM6qKaux7RjGg696o+GiMeN+I90CubXEQStnerTFDd0jylSq37S+zl9AnCSYYbUrRCfiMxJsGx6xHnFMIzQ38cuG943xPawa0O5czs+Fd/5mromtSKWYQS5HWoZo8v2qpvDLDeUM0kX9sk7QPxGF1Qw8TmSXxIO0lF86NsrchqbbxanpjrW2AyqU/zEQ6/JCJcCtsuwH+xRAwxke/iRiwlxvr1WY3hlKFjLRozAsUiXQEQaeDMFgnNKgheXGGLJ146T+vwpi72aFRS6H2tqrjbB8xKJsygngz9Zh9EZgypZ8fRDqRyfeOMG5w4ty4KGCsWbxXSY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(2616005)(7416002)(8936002)(186003)(38100700002)(44832011)(83380400001)(2906002)(6512007)(6666004)(6506007)(86362001)(36916002)(66476007)(66556008)(31696002)(66946007)(53546011)(8676002)(36756003)(4326008)(316002)(31686004)(6486002)(508600001)(6916009)(54906003)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEtVdTZxUE9GNTZSWWtrQVZId0k5aTl0V2lZUnNyKytqNXc4Rnp5VmZYVHFX?=
 =?utf-8?B?MjgraUt6VTNBcHVMNE5EUlFTZnBuWU9PWXBrUEQ2WUpmTlVvMEZNS2txc1d2?=
 =?utf-8?B?SlJ3d0c4V01aNDFoL2VTSFdsUERrak9LcGRnYkpxbFBsdHZDN1RLYzduNEVN?=
 =?utf-8?B?VVR4TE5CWjI1WWxEQWhOZ2FHdFl6OExiSFRYeGIvSndiM2VCblFNN2ZsM2Jx?=
 =?utf-8?B?SEp3Zms5RzE3OHhHYy9WMlR3NmxIRklnMGpOdUlBMzk5bWhJdFJXMmFmV3JL?=
 =?utf-8?B?elJ4MEpnZ3N3Zm5MbHU4RmRhSjM1VjFMdm1Ga3U2MTFBd2NvL0ZOdm54YUxt?=
 =?utf-8?B?R0tKRWVSdjczaXZXUWdEQlIxS1Z4MUhXdU9LVi9jbWl5UUg3KzZkbVFXUUp1?=
 =?utf-8?B?Zm9qbGJhQ2hiZThiQ2hBdmNIUHhwVi8zaDZ2Q3Q4cXJPMXBsZU14dzh5aWVJ?=
 =?utf-8?B?TmUzNWlBWDBWVFV4TVdtRHVGSnU5TG81eHVHUk1IcUNacUtIUVYwUVBFV2pV?=
 =?utf-8?B?ZFE3WE9yMWs3b0R4dHN2QTVEMTByMEJmdlRmSy9DbXkvc3NTYVg2cTZ3Tnpq?=
 =?utf-8?B?NUJVSFR2cnZGZ2FQciszRlcvWHpoQTB1UTJvUWZzSGhpWVREbFlyS2NSQ2R6?=
 =?utf-8?B?ME8zbzAwbVRWalZXM0I3cTd3OWlNYXhlNEdtZjhPRjlaSTRJQWZSZFQyMlVS?=
 =?utf-8?B?VlByVnBOV203QzFSbFVTMUtXTjMwdVBOTEN1RDhRZXVFa1VpejdMSGMzQy9K?=
 =?utf-8?B?Z21UQW1aU2t4dEh6d3YrVS80bGpMM0kzUHI3ZHgrUDRUaUZVT1V5TDc4bHZt?=
 =?utf-8?B?VnAxTW91UkdmYVU5T2dFZWRGU2lNTlU4QmFEWlA0UkIwZFplekhXVk1kSmx1?=
 =?utf-8?B?WFVCNDl1NXNZSUlNNHM4ZzR4Y0I3S2tBeXE4WlhwbUZBcU0reEZpWjVtSFNx?=
 =?utf-8?B?TXNIMWp0MG92THF6V1ArUk5mSmFRQjdLODJxL1JaQ3NQcE9uS3BjQ3B5Zzgv?=
 =?utf-8?B?cGNiYko3cDRXNHFKeEZJdEtsK2l0dXhEa3FWMjNzOHNCL1hsNnJxV0xYQlRW?=
 =?utf-8?B?VHM4a201ZkdRUjZhM05XMFltZCtkdFhTdkxVUWJ2cGhGMlFDb3YvNWFOZ1lT?=
 =?utf-8?B?QjczNjVOTHdLQWgrZkFPSXE5MlIvQWRKbXZSVGpBRE1UdzlwSVdnbllybzNO?=
 =?utf-8?B?WEd2UlFLbG83RFduNTVMbjE2T3AvbllWSHhlUkxoU1g2WVhpZ1h4UG92TE5k?=
 =?utf-8?B?dktLOUlDU3JMU0J6MzdCc3haWmltMTc0c2dlellmb3AwaWZzK2NJdzhGRUw2?=
 =?utf-8?B?QlhlbFQ2WnlhSzRLczlQYjJndE0wcUlwWmhMOFNDN1BmTk5oTmJPTE1MNmFP?=
 =?utf-8?B?K2NFSUxNUFdIZWdrekRkdmVMLzI5SFRpcHdOdlpHMmYwOVNKQjU3NmxiVThT?=
 =?utf-8?B?TksremJuNVU3ajZOSTFQWGNWR0NneWl5QWhUM3ZnbzRmVFZmdmhMTjExVWF6?=
 =?utf-8?B?OHloZGczK25GVjlCUlR0cDFpMEZQN0R4Tk5saXlPODhzNlB0UE1hVk1GUVhU?=
 =?utf-8?B?MXVNK0huZTVpazFpVGFCOXlSaVdMMUlOd0crekdQendlaEJKdWlpa0plU0w2?=
 =?utf-8?B?WURDeTRSZk4yM1A0Tjk3V25OdjlReE5VTEdLc1MyWFhyaWE0SENjZWlEaXNN?=
 =?utf-8?B?WmtOTit5NHYyRTBDdlhZc216Nks1WVNOMWU2S296YWdNdVlROFdPNDRGb0xU?=
 =?utf-8?B?eHpuWFRDajNXb05iSWtVZFByMXYzTDk0ZU9UZW1Pa0hwNVJrWm55dzE5ODI1?=
 =?utf-8?B?VmdEaXhrdHNFZDZOMnBPTVhhdFRTQmR1QVViV2RVTkVBb2VhcVBnQVVtSDg3?=
 =?utf-8?B?c0hNQmduaDh5QlBDV1V5ckJvZEx6QVZ0Q2JLbnRWRGV2bHpnaVdmOHhzak9B?=
 =?utf-8?B?cnJIUGo1T1k4RGYvcGUvZDBDNEViZFVVQjVVU0hxc09sWTdFSTJhNFhFZFJ6?=
 =?utf-8?B?clpBN0w1b1RRPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a432c72-321f-4050-1267-08da037e8f13
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 16:45:33.3125 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ka2KhBWmTsgWjj/6mySYxNwsgPdy1WnPxMON/eqwOuPaJAMNMDbVjWaIyVS3nKF8Ozb5SsardDCcJzVIxQ+VW+XE+MXH/wbtU7ArbMgU6XY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3760
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10283
 signatures=693140
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203110083
X-Proofpoint-GUID: _cI53bR8k84-k1KqTDoYvOFpoNRA0b0_
X-Proofpoint-ORIG-GUID: _cI53bR8k84-k1KqTDoYvOFpoNRA0b0_
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
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/2022 9:16 AM, Marc-André Lureau wrote:
> On Wed, Dec 22, 2021 at 11:52 PM Steve Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>> wrote:
> 
>     Add a qemu_system_exec_request() hook that causes the main loop to exit and
>     re-exec qemu using the specified arguments.
> 
>     Signed-off-by: Steve Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>>
>     ---
>      include/sysemu/runstate.h |  1 +
>      softmmu/runstate.c        | 21 +++++++++++++++++++++
>      2 files changed, 22 insertions(+)
> 
>     diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h
>     index b655c7b..198211b 100644
>     --- a/include/sysemu/runstate.h
>     +++ b/include/sysemu/runstate.h
>     @@ -57,6 +57,7 @@ void qemu_system_wakeup_enable(WakeupReason reason, bool enabled);
>      void qemu_register_wakeup_notifier(Notifier *notifier);
>      void qemu_register_wakeup_support(void);
>      void qemu_system_shutdown_request(ShutdownCause reason);
>     +void qemu_system_exec_request(const strList *args);
>      void qemu_system_powerdown_request(void);
>      void qemu_register_powerdown_notifier(Notifier *notifier);
>      void qemu_register_shutdown_notifier(Notifier *notifier);
>     diff --git a/softmmu/runstate.c b/softmmu/runstate.c
>     index 3d344c9..309a4bf 100644
>     --- a/softmmu/runstate.c
>     +++ b/softmmu/runstate.c
>     @@ -38,6 +38,7 @@
>      #include "monitor/monitor.h"
>      #include "net/net.h"
>      #include "net/vhost_net.h"
>     +#include "qapi/util.h"
>      #include "qapi/error.h"
>      #include "qapi/qapi-commands-run-state.h"
>      #include "qapi/qapi-events-run-state.h"
>     @@ -355,6 +356,7 @@ static NotifierList wakeup_notifiers =
>      static NotifierList shutdown_notifiers =
>          NOTIFIER_LIST_INITIALIZER(shutdown_notifiers);
>      static uint32_t wakeup_reason_mask = ~(1 << QEMU_WAKEUP_REASON_NONE);
>     +static char **exec_argv;
> 
>      ShutdownCause qemu_shutdown_requested_get(void)
>      {
>     @@ -371,6 +373,11 @@ static int qemu_shutdown_requested(void)
>          return qatomic_xchg(&shutdown_requested, SHUTDOWN_CAUSE_NONE);
>      }
> 
>     +static int qemu_exec_requested(void)
>     +{
>     +    return exec_argv != NULL;
>     +}
>     +
>      static void qemu_kill_report(void)
>      {
>          if (!qtest_driver() && shutdown_signal) {
>     @@ -641,6 +648,13 @@ void qemu_system_shutdown_request(ShutdownCause reason)
>          qemu_notify_event();
>      }
> 
>     +void qemu_system_exec_request(const strList *args)
>     +{
>     +    exec_argv = strv_from_strList(args);
> 
> 
> I would rather make it take a GStrv, since that's what it actually uses.
> 
> I would also check if argv[0] is set (or document the expected behaviour).

Will do, thanks.

- Steve

>     +    shutdown_requested = 1;
>     +    qemu_notify_event();
>     +}
>     +
>      static void qemu_system_powerdown(void)
>      {
>          qapi_event_send_powerdown();
>     @@ -689,6 +703,13 @@ static bool main_loop_should_exit(void)
>          }
>          request = qemu_shutdown_requested();
>          if (request) {
>     +
>     +        if (qemu_exec_requested()) {
>     +            execvp(exec_argv[0], exec_argv);
>     +            error_report("execvp %s failed: %s", exec_argv[0], strerror(errno));
>     +            g_strfreev(exec_argv);
>     +            exec_argv = NULL;
>     +        }
>              qemu_kill_report();
>              qemu_system_shutdown(request);
>              if (shutdown_action == SHUTDOWN_ACTION_PAUSE) {
>     -- 
>     1.8.3.1
> 
> 
> 
> 
> -- 
> Marc-André Lureau

