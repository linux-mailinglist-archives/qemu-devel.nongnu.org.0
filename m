Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D7E5676C0
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 20:44:59 +0200 (CEST)
Received: from localhost ([::1]:34790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8nXe-000316-EU
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 14:44:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o8nGW-0002ed-6t
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 14:27:16 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:44274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o8nGU-0002Nq-CQ
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 14:27:15 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 265HEMEN004881;
 Tue, 5 Jul 2022 18:27:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=QYJFuUggueQhjLgOuZkmwQCbYpPb/tHBic4pEl+2k3Y=;
 b=GbuT4uoS+Yt0PnY4fbl3r8XO37xq6dCzMJf91slV41tJ0JyWWzaDKhmK5bycX/686TGv
 B+NUz5oq5R3z6pqbmlFndZQ5oe7AkfmkjUrOhujizcDlivcC/MeimEv/jsMXTo48PP3F
 yoib4/43r2JmnaJQ3V5f2y9y7UPQw6MNkMPtTphpbvAQrbKqkjxBscC4qZjOA9wKgmN1
 LfH7qCITPl6rR7yYjvK05g/P2JBaKtK5z/S0mpOp1mycPoPkqpePi/CIJQdseYJyW8NC
 GbWye+F6/IXjoghs5cxuRyiRy/LlJjP1EkkDLiEP8ciWOZLRub6KsVWCE9IIZl3/7HUA ew== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h2ct2f0hj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jul 2022 18:27:04 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 265IQujK018865; Tue, 5 Jul 2022 18:27:04 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3h32mjfyc4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jul 2022 18:26:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XNgF5j53wUcWOz7OqL4hrsdOGckuOn9sf8RzrcmlipoyDjB2mt8u8UKzT40BKHq/CQvTdN8YiSRzkXa87zUulxb1LlC1LyFBN3Mw8ArJBOusvZCqlC0JJPd68x764cu5fuler11jzRobiV2XbzweCDgHe8Tt049mF0LfT1dDScQyb7JkE2kgCJMf2czIvqX/xZQkUBqAe0xWWKepyO9vQphxm6GkDAvuVhXuV2LjjAel/of0X1Wxg9/D5uV34kDM4ogzuGPb6bA7VWe25ykvtUFn1sVDRLmAngHnN+vV/eU8Vl9xdgwzeZmLz1hWBbV71crbNnVyqFZJ3dWIJySFXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QYJFuUggueQhjLgOuZkmwQCbYpPb/tHBic4pEl+2k3Y=;
 b=P+qxcCjcWNMM/mXq9FP41tEBlbF7x7FWV+1ODUnge8L/BviHQXtX+M27HsPeRksB7vH6Xh1qGEvXqVXqPT6uv7u/WFfEGINXKi+KQOOXd9lh7xjOp2GHcSATWxEOO3zoMYoaVZcos0yblUwAPF0CeSEz+LGagw0W5RGlOBIM0pZB7q1+KQNKvcVS0ADxR5IMvfkEz9EHpVGxr7D5JuF8gGQH2ROM5B1DnIL3mlcSmTTaHSYH3Q9Uecm/8q4S0T+Q2j2Fg1GeVrf80xTeKhLijeBBAhBwyW8eIPBtgGsTzTFbzz62o5blJmbLd3AI3vdu2WDEXWKxH5qF+HkX0bGcog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QYJFuUggueQhjLgOuZkmwQCbYpPb/tHBic4pEl+2k3Y=;
 b=XmITCV685UOApAoeM49X/lF+GLKPd8My5Vpm9N8ANf+2InYVBPYXs9f7DHBugyYP+z4rbTLJ3vJ0IC0Si6yNyFkiDnTb0kJ79LCKXTY1BHDGH0KieSfuQGFBoRPHbcwy8xlWyjyv3tcwUgMF2+e+BvOAkXeGsmg/fIbKETqLoN0=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by MW4PR10MB5809.namprd10.prod.outlook.com (2603:10b6:303:185::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Tue, 5 Jul
 2022 18:26:54 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::dc4d:56f4:a55b:4e9]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::dc4d:56f4:a55b:4e9%6]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 18:26:54 +0000
Message-ID: <52b7f3ff-0543-3af8-7155-feddb43b8419@oracle.com>
Date: Tue, 5 Jul 2022 14:26:49 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V8 12/39] memory: flat section iterator
Content-Language: en-US
To: Peng Liang <tcx4c70@gmail.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
 <1655304746-102776-13-git-send-email-steven.sistare@oracle.com>
 <0923b31f-1c59-a44b-303b-5bc2056f1e69@gmail.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <0923b31f-1c59-a44b-303b-5bc2056f1e69@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR02CA0106.namprd02.prod.outlook.com
 (2603:10b6:208:51::47) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96a11e92-a7b9-4b8d-1d7c-08da5eb3efea
X-MS-TrafficTypeDiagnostic: MW4PR10MB5809:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 95Vz69/Th5vpa4fmcjUl75KTux0f98f4ynoLnwSRMhbmWAD8sX1Zy7ybEx6VU++05UQEakvUetmrejlkk19ToQzvNkLMUE7SWXzhIIPuIwPSnxBcqcBvSkGbiVlwJxJGJ8WskRTBnUIiZIvST2ZiKDXW/MxaKBCKmJyYvRPW4aAZICv4HVeRA96tQ8KjuZpnmfS0kD/qB9R5vMmXYkWWFYXqKpMd4v8UPFJDe1W+UJZNvkd/D8lM2IhI4Ti6PI2zek+aHvRaVJniBON+JEiIudY54kUtiXMZfap4z3I7Cer4tPkztJFKdBnGaz8EmYLK7nj8tL0NHJqn0LJxfcqWNTqkPXfTeEalc7Uygq5uDOuKYizYaUdEGmiliacStPba7BYzbE5YX2ET7RQndxDK9sZfRGhh/rGFh1renOaNgzHTJSD2UWwpIm5C4w32EdsocJ3i/MTS6Mo6nTdybOjEqsdrfvqfp0EWay6DS5zrE6bRi/i9s7GHTzoiI7+KPBNhOo7xBJXIIBmZsclNWqJMcC9vjaUhLv58CHNkwTt7OHkJbDvF5OE9G38Mqmgsq5TRflV+GE4mqYlTDZAcIyu3xqPGgdfMnK9SufcAh2wTbDKLgp3D2pp5hcfJs4ubxSOuCix5utkDX0gnD6eBgmo/G6YINTu3/l1EjEfOPBVkRovJe3Ao9Hx441IqS4f7lWsaXVdJWrIh2gvFyTUQz1czOtMMU7iIDmwcrCQShXddO/TT1FCDskzrQFuSmDP1TjuaoSWdpkpySG+aqK+MaaK25PK3NQPWnu8lAVPYhLNkSUQZI9uQklh9kYQ+bM7JRCJdN0IVXMMk8Jb/PNY0UAABmpVAQ6bq5/QOmFGu4UNTUuU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(346002)(39860400002)(366004)(376002)(396003)(38100700002)(66556008)(8676002)(66476007)(4326008)(54906003)(66946007)(316002)(86362001)(31696002)(2616005)(31686004)(6486002)(41300700001)(6666004)(2906002)(478600001)(36916002)(8936002)(6506007)(44832011)(186003)(53546011)(26005)(83380400001)(5660300002)(6512007)(36756003)(7416002)(43740500002)(45980500001)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkQ0OFdRNmVVSmNlQ0hrd2d5OU52aGdBZGE0VXRXUzRudys2TTlGOVZVK1JM?=
 =?utf-8?B?ZTd1NzJzUng3WERJc0pWcFBDekY0a0JQdTBiWXRWQmlpS0JHamNQZmMzcG42?=
 =?utf-8?B?SFpBQlNqK0ZFRHZYVy9aSFhYN0lhUjV1MFd0RHNnZ0dSZU1ZcWZZVXFFOHFO?=
 =?utf-8?B?RXg2aW8vRFlQRWZWTGtZVkNORHRMR1cxdEExOENDVjVTeU9IVTNPbFQvOUl5?=
 =?utf-8?B?d1JqVyt1M2tYTUQvdE5LQ0hnb0laMTgyK21LNUwzV2RuYXdNeFlEazl2Mm9P?=
 =?utf-8?B?aytUTUZMbjJLZm90ZDlCeEZIQTVaL2ordjlnQ29qbnA0M2dsWXk2RE5LUTdk?=
 =?utf-8?B?ZDllTTAvdXlKTDhiMTk4TS9jVVBGd0NMVlg1aFFuQVlOaGpIZ01jWmhRVmR3?=
 =?utf-8?B?K3hJMURITzRCMVZja3dWZEdPOVBzSTc4T0E0Y095eEl2ekthZThFWjJBdjdL?=
 =?utf-8?B?VG01L1RDV0wzVDRDWURTTkRwUzl5RDVlbDhaUTloMnZRQkhTVDBnWUVPR2FR?=
 =?utf-8?B?L2xHNExSNTZ3dzNMT0JEdFR1V013RGNOd1JMMGJkeGVVajcrd2NkOVc4S0Qv?=
 =?utf-8?B?Y2k0a2xoZ0hmcm5yYllYRW8zY3dkQy9WbG9oeWdpK1N1ZjRnQzIzYVJKTkxt?=
 =?utf-8?B?YTREVm45MFVMOGlFeTZmdy9RU3NzUVZzZklMN3MzQnFJU2dTZWVyV3Npd2d5?=
 =?utf-8?B?QWZkNk5wWjVWcDUyQlJGUkE2OXJIc3pqaHlORWNJbmFxV1FCdWlwVWUvemY3?=
 =?utf-8?B?RHFuWVk5MndQWk0wenBkZ0tIVXIrbG1WTG82UE1weGZoREdnbWZxZk1pVFFv?=
 =?utf-8?B?dGdnRTNhZ1YxbnZQNUFzWXArOW1WR0hndlRWVHNzK2ZPcy9md1VSNndHTGVX?=
 =?utf-8?B?bzI1TExUU3QrbUlRRFN2SWp3ZzdHK1FHVk9yTk1SZEszY3dHOHlUSlE4Zm5P?=
 =?utf-8?B?ci82ejZvSU96STdrYjdRTWRpZE5nMUdjTk5zQ0dyMVp6SnU5SEJkQVNtY3BL?=
 =?utf-8?B?RnNqYlJxMEpWRjNTeXBMcGlwQnZWS2xZMUVMQ1pTS1R0MWdkUEdtMU9la2dG?=
 =?utf-8?B?eXZKMDhJbVlpZUtCcENOYy8zM0hZZG5QOEY2MGozUVM5UzNsMVQ2WHhXc0lI?=
 =?utf-8?B?WDAvVHBZQUJGRHg4WE1PUEcrVUlUbjBhUElXeDY5TTNNYlFFRENIWWhheEFk?=
 =?utf-8?B?b2RzVTNYc1hmV094L1lJb2taYWxlczZyK0Q5azJPNUtFTzVRR1BydFl2TWZr?=
 =?utf-8?B?aTkzZzkrRVFGSHlZN0ZZYUxPTkJaZzc2Uk1xQm9DZDRIeVlKenllYnA0NndL?=
 =?utf-8?B?WGIvM1c2S25saWNIeHdMMTRtTVVXLzJRMWJKRUE3b29HQU44L0FrWkpxSGNY?=
 =?utf-8?B?bUdRcys3UjkrOGdoTnpnYm1TZ1RvQWVURkE2d2t0bmY4ZkZjU2Q2SUVGVWp3?=
 =?utf-8?B?YjYxWG5IU0VTVEpCWUZLK1B3OERXbzkxcis4c2pwQmtTQk5wSW1sOG1lSEF3?=
 =?utf-8?B?OGRVT0RKb0RVNmZ0NTlsbGJrdjFvMHBDYUpYbksrTkNEOFgvUE5FRGdVQ1BI?=
 =?utf-8?B?SFl4eTFxL2dQN25uWUdaWDlPZSs5RnZIREJsZFo5c1FsOUtKQ1F2L09UM0NC?=
 =?utf-8?B?eUhwdjljaDNxVW95NGNtMjlVVUNPaVppKzMvL0c4NjZvek5GS2tRQWR1Wit6?=
 =?utf-8?B?SWFJTTlwcUNvN1M4Sy9NOU5mVUQ2MlRtdXNtdXl1QnBXanlTYWtGc1VRKzRJ?=
 =?utf-8?B?bVJuQlVycjN0bFQwMXI4M01OS2l4bDUrTXNQcHBXZUhDUjJLSFpiQkVabTNs?=
 =?utf-8?B?M1o5eUpmK3FlZmoxVHk4QlNiM3FXWWxJZDNwRTlmbGVUSVRTL0ZPMUQ4SFdH?=
 =?utf-8?B?TS9YblRVaTFsaG9xMkZxdjJXbDhkUkVjVy94NlY4UW5mYjJwVlNNMTYrS1Bi?=
 =?utf-8?B?eDZldDJCdzZqbGs2QjBlakFjKzU3ZlR5NENnY0hwTkg3SURQY0p1TkFDcURS?=
 =?utf-8?B?ZjBjVVI2K1hvQzM3TVU4Y3dzNUY4ZDJPWWQ1ZFgxRGdmRzhhTmdYTjZqWWdW?=
 =?utf-8?B?akl4KzJkNWwvT01FbHhaZWtMamo2WDRjZC9QNXFTZmdjUXl4TXpWWURCeFov?=
 =?utf-8?B?S1E2ckU4dXkyV2tkUm9PU0N0NnlqazlqYUoweEdrVDlDZ3luK3F2R3FaOS9m?=
 =?utf-8?B?NlE9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96a11e92-a7b9-4b8d-1d7c-08da5eb3efea
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 18:26:54.6725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iYKmogITiMeISKezIJh/WdOM8fFw7eIk/swAhi+3gDrjEcQv1d6GkS62UJkq3G6SKUJ8TlOebv9HFOQMn5AEXRfsYzxieXju2RiKgMKr1k0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5809
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-05_15:2022-06-28,
 2022-07-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999
 malwarescore=0 phishscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2207050079
X-Proofpoint-GUID: 5ZX-pJk5L3Q1wlsn1lz_mt_8iltoCY_a
X-Proofpoint-ORIG-GUID: 5ZX-pJk5L3Q1wlsn1lz_mt_8iltoCY_a
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/3/2022 3:52 AM, Peng Liang wrote:
> On 6/15/2022 10:51 PM, Steve Sistare wrote:
>> Add an iterator over the sections of a flattened address space.
>>
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>> ---
>>  include/exec/memory.h | 31 +++++++++++++++++++++++++++++++
>>  softmmu/memory.c      | 20 ++++++++++++++++++++
>>  2 files changed, 51 insertions(+)
>>
>> diff --git a/include/exec/memory.h b/include/exec/memory.h
>> index a03301d..6a257a4 100644
>> --- a/include/exec/memory.h
>> +++ b/include/exec/memory.h
>> @@ -2343,6 +2343,37 @@ void memory_region_set_ram_discard_manager(MemoryRegion *mr,
>>                                             RamDiscardManager *rdm);
>>  
>>  /**
>> + * memory_region_section_cb: callback for address_space_flat_for_each_section()
>> + *
>> + * @mrs: MemoryRegionSection of the range
>> + * @opaque: data pointer passed to address_space_flat_for_each_section()
>> + * @errp: error message, returned to the address_space_flat_for_each_section
>> + *        caller.
>> + *
>> + * Returns: non-zero to stop the iteration, and 0 to continue.  The same
>> + * non-zero value is returned to the address_space_flat_for_each_section caller.
>> + */
>> +
>> +typedef int (*memory_region_section_cb)(MemoryRegionSection *mrs,
>> +                                        void *opaque,
>> +                                        Error **errp);
>> +
>> +/**
>> + * address_space_flat_for_each_section: walk the ranges in the address space
>> + * flat view and call @func for each.  Return 0 on success, else return non-zero
>> + * with a message in @errp.
>> + *
>> + * @as: target address space
>> + * @func: callback function
>> + * @opaque: passed to @func
>> + * @errp: passed to @func
>> + */
>> +int address_space_flat_for_each_section(AddressSpace *as,
>> +                                        memory_region_section_cb func,
>> +                                        void *opaque,
>> +                                        Error **errp);
>> +
>> +/**
>>   * memory_region_find: translate an address/size relative to a
>>   * MemoryRegion into a #MemoryRegionSection.
>>   *
>> diff --git a/softmmu/memory.c b/softmmu/memory.c
>> index 0fe6fac..e5aefdd 100644
>> --- a/softmmu/memory.c
>> +++ b/softmmu/memory.c
>> @@ -2683,6 +2683,26 @@ bool memory_region_is_mapped(MemoryRegion *mr)
>>      return !!mr->container || mr->mapped_via_alias;
>>  }
>>  
>> +int address_space_flat_for_each_section(AddressSpace *as,
>> +                                        memory_region_section_cb func,
>> +                                        void *opaque,
>> +                                        Error **errp)
>> +{
>> +    FlatView *view = address_space_get_flatview(as);
>> +    FlatRange *fr;
>> +    int ret;
>> +
>> +    FOR_EACH_FLAT_RANGE(fr, view) {
>> +        MemoryRegionSection mrs = section_from_flat_range(fr, view);
>> +        ret = func(&mrs, opaque, errp);
>> +        if (ret) {
>> +            return ret;
>> +        }
>> +    }
>> +
> 
> Hi Steve,
> I guess a flatview_unref(view) is missing here? Because the return value
> of address_space_get_flatview has been flatview_ref.

Yes!  Good catch, will fix, thanks - Steve

>> +    return 0;
>> +}
>> +
>>  /* Same as memory_region_find, but it does not add a reference to the
>>   * returned region.  It must be called from an RCU critical section.
>>   */

