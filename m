Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD544D66D4
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 17:51:55 +0100 (CET)
Received: from localhost ([::1]:50416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSiUc-0006WO-If
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 11:51:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1nSiPC-00014I-53
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 11:46:18 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:36242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1nSiP7-0002dn-O4
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 11:46:16 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22BFxfL7031759; 
 Fri, 11 Mar 2022 16:46:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=Mp5gSrWNm+7PAtCcyAwe6MDudDdCJcUVdme9heSrLcM=;
 b=Mq+9zB4lsLcLJ+gT3i1fHXeNeLUd1JX5Vl9rR5lmqPADgv2NMk2d2n3N1nFjZpJJbDW8
 OuI9loOxkPB5NHr60bgiJZM5jY25eSxgvqFtxI+tCa1nrjG/rZJ/BQk3T2zB9RnOZv4m
 92iqgmS47oOaFd6/zXi3sIuXVFpvbMVza3A1aL2lDCFhMLrHg+usj2xSMojOYuFEw5Ha
 fh34UiX0TywGBPR4VkhdorxArilf0q1qBQZeIefNmxq5JaLVrq5J7ltl3gbQeqeCq9Tq
 Epr8KyKu/Kywxj967ocCjNe4fKCT2sXmj5P3b8mx3DSq7UfgLf0i3gNc8oX4YOzJunwg 4Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ekxf119tw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Mar 2022 16:46:00 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22BGjtOg165118;
 Fri, 11 Mar 2022 16:45:59 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2041.outbound.protection.outlook.com [104.47.51.41])
 by aserp3030.oracle.com with ESMTP id 3ekwwe6r76-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Mar 2022 16:45:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G83lYOQQ2+UIi9CzSK5SBVhGZNYUrYATfLU6Olkzh+w5AgFHn8df0TMhuPemZru86P+1ohGrbY7PHTCHxBFadS4dr1RFkpDzjaAm8iEaor465TOfvGFaTa444dbh+sb9LiWD+mE7sk9qqimyCzipg/kELMcAN/IyhM5ygn3s9VY3GrckvwtZsAtR9JVmW8bcu5AoqmM9mKmJ9vcaHxhWtdWdfdEAkqgsYBi42eazu28IUMNJ6mKLopQU4pie394wNdOZhrITclJYGzqRFkaSsyjhyued7N2qLUNcRACsiCtj5yEoVe1kEGQ1GoW0bfGFUB72GMwK6olvm3AINXFkeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mp5gSrWNm+7PAtCcyAwe6MDudDdCJcUVdme9heSrLcM=;
 b=YwJqwZc460ptMSgHY8G9bEvGSruE0f9h5lpGG/1wFVfEkJVqglC3bwopfrM2Eu8BsLAzZTv4raAcXhlYZEbDNJaSQdiMMXtXOYlsVqVEmtLMrD0qMyyhERpM8sZdDNsCUI/OaE9KLuJF7Rz0TizcUcug4UYHSFJ6lj4G2F6eWj0VFq0tnH9ekIxlYsiO3YMlsBYEAwq4NV1koRObdb2D2zTuxCpUs/Ph1+LvTAYFoGj3OzI5gl5VtKZkdr1NLfr1OxiPt//4sZjnE6lJc06054zn9rPiHYIutBgVB96vR1q+3Z96NX8fB5ldshN9MdNQCsyUI0nsctzZlm8svw5T6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mp5gSrWNm+7PAtCcyAwe6MDudDdCJcUVdme9heSrLcM=;
 b=ZAWVV/VWLRDJke4DnYAuy7BDzmJQK2s01LBI7zM9NFDyzvI36u+bIatVUzQjg7F+tRrldBGxxhYa2ok+J5lvLCxTfqYPF1nBgsPXGe2vPwxMdmG+7+/NFmbSOUVZ0uxRzE2Wx3niiTee4BzF1tyj5KtAk7A6lJmbBYR5JgORYnA=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by SN6PR10MB2877.namprd10.prod.outlook.com (2603:10b6:805:cf::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Fri, 11 Mar
 2022 16:45:57 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6005:8b9:1b00:b0da]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6005:8b9:1b00:b0da%6]) with mapi id 15.20.5061.024; Fri, 11 Mar 2022
 16:45:57 +0000
Message-ID: <6e249462-ef96-a355-7d71-8407340904bc@oracle.com>
Date: Fri, 11 Mar 2022 11:45:53 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH V7 11/29] qapi: list utility functions
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-12-git-send-email-steven.sistare@oracle.com>
 <CAJ+F1C+O91Hohh6MLEaQ3e-3De2Ru1U+OemhX3B3DrJqXzuTMg@mail.gmail.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CAJ+F1C+O91Hohh6MLEaQ3e-3De2Ru1U+OemhX3B3DrJqXzuTMg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN4PR0501CA0039.namprd05.prod.outlook.com
 (2603:10b6:803:41::16) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ecec6380-ff36-44aa-377a-08da037e9d3d
X-MS-TrafficTypeDiagnostic: SN6PR10MB2877:EE_
X-Microsoft-Antispam-PRVS: <SN6PR10MB2877D57C8B59E50A056FE1ADF90C9@SN6PR10MB2877.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AVTrb3Gq6sQHcZtaHG9oxYoQajD4Lgau+FMe/ckGZ0oURxB5N/5Tvl8zWFvtqULLXVlCxkxrI09FGown6MkLGWYYjWdwylBm4oJveQ/z79wnbJ+uwmFJvaMI68PZXkVIipxhRe7EIGQH2dodYtM6rkyeT/1CffQ86LZeVT/9iRYZF/ew1DvuzpzcgYU00IeyHBIp3jPZNxdUd51v42C+ucxIBlLHhv32qJ9HoD5fwYm2QP9BI3VVyOeLk/jVhCFzib3KKTvoAGqYJeEvIJalbbeM0igDjyVK10pHJwy13dK+WNteW60KDvuXdevN/LUc6JaqoXEpHvozhN6+18n+BIzXJiWv3xZeHw4vf4w0mvKBi7t1/swJOuWX0hL63z0uEgBBe42MNkzsQy+LTaESq2vhwMU3UPSdUAxNpyGMhi2mJ05HM4KqFytFIyd3aNOD4XeZzYYgSjJqj2ExhslzFGdFqYfchwh7R2KpfE/MXgNudwxIYNGz9gmJm8EQviss6bqwTRu1c1dQN8gPQuuEsqxqaGctBprAC6NxxgryQ4qnKUHq+NG246DGwv00DubYcT2dgmcsBBIuXH3hoRfCg+DIXF/RzjE+p7T1cTaAGHcxvNJmrN1hLGgo+HhJQCUx+U3/ALRY/C90rS/UbtITk7S1HNJSyq+KKtXcsyJTVwjmBUG2AZ5YgzbmAg50jRfyarvgr4h2nhUg5y7uP2J6kkfp4uOmQK0rlZ7NQ8toi214L9RoK8n5SnD24EH/sT7Tdkb+pnr50uw2vTvyeqCT4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(38100700002)(2616005)(186003)(26005)(2906002)(5660300002)(44832011)(31686004)(4326008)(8936002)(7416002)(36756003)(66476007)(66556008)(8676002)(6506007)(6512007)(53546011)(36916002)(316002)(6916009)(31696002)(86362001)(6666004)(66946007)(54906003)(508600001)(6486002)(43740500002)(45980500001)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHAzN2ltNFhHTTFTSHdpMVU3U2JoTk56MW9nRklXV09yYmcyZ1FQK3JhcnBI?=
 =?utf-8?B?Z2FqTVJCQTRzem94SmFST1NaSG5BNDZaemh2OXEzSVQyVGt4WWRFRnNaQ2sr?=
 =?utf-8?B?bVlaejUyVW1qSXZBZ082K1prSHh6OTJkNHUwUE16akwrMU9uMkpMVmloVXJL?=
 =?utf-8?B?QUhXTHdnaXV2OGMyVU5xbGd4YmVJVjVLdGNRbGF4SS9IQzI4WksxdlczQzBI?=
 =?utf-8?B?Vk5tM0Z4a2pkT0ZtUzNlZVZTYW9tTE9wUkpZUUpIYnk0WHg0L2cxbUVHTnFL?=
 =?utf-8?B?empGNTJveHM3UmFjakU4aFRCcVBFbmpGVzFuR0UyYkIrTDFqMkozNFQ5c3c2?=
 =?utf-8?B?VVhqOS9GSGxEWkJmbUd0V0ZFQ1BJNDkvdi8raHJsM1NoMmdvVk5MdFZybzhu?=
 =?utf-8?B?S2NGRG5sQk50WjNXQjF1MTNBUytWNnl4VWtPTGYwWlpmUXV4MENzSGtEOERO?=
 =?utf-8?B?U0w2Njk4VzZoempzclhPN3UrTkZ1d0NyZllzVE9hSGNlRnVpcDZZKzBUSmpD?=
 =?utf-8?B?K0Z0ckJKQnd6YnNTSm9KbUNrdXkzU1F5c2NDUytmdit1RXBIT0gwelJUcytp?=
 =?utf-8?B?RHlwc05PNU1TL042U3BHNE80NGRyK3M4ODltZ2ZsVnlSbkRtaDc3MzZaZ1Zh?=
 =?utf-8?B?V1laN3lnQldOTSttQlJwMlZYWDBhUW96SVVJS0hkb21NWGZ4Z3piWXZoR3hs?=
 =?utf-8?B?VHlHQTQwb0t2eTAxRHNzWXpGamphUWVqVnd5bzNWeUJmRmwxVnh6SDdOL2E5?=
 =?utf-8?B?eVRDUGg3d0dqYzVHbDZXQ2kxbkdSc1BvYjJlRHF6bWJXWkZkWmJWaXFUWHlV?=
 =?utf-8?B?U2VxVjFWYXdGMmZFVFVIY0VJR0V0VnBCY0toQWhUMWdGOW5NcW1PLy9ibVcv?=
 =?utf-8?B?TC9KeHh3SHdkcGJ1dWVoYUN3TW1ZdWFIbzhxbHJNdzBya0h4MTcrSVNDUTNo?=
 =?utf-8?B?R0xMYUdKcndscFdPbldSeWdSVmVGcFhpdkkxMWZzQ2dlOGhYamgyWGpBRlIy?=
 =?utf-8?B?Tzdma0NqbW90ZWNnSlVXNFpzL1ZySGVlTDZNS24wQ1huUkdZcDBjbnF6cVhK?=
 =?utf-8?B?cTcyRkxhSTVaNlltWk5MaVdFQjlKZmF0KzBGL0M2U0VtNjBab2RSdHNCNUNL?=
 =?utf-8?B?LzdPMXB1U2ZiMGZkNnFpV0R6aUw0NkRLSGhKRnovV1F2ZGNjTkxXZmo0SkhX?=
 =?utf-8?B?ZU55L2NPVzc1YnFYNmRnQjl2aDlsTlZPYWJteGMvcElBMjluRlNGeEVMU0Jr?=
 =?utf-8?B?Vk90b3lwNkk2bnU3U0tKYnpreitueHBRcVJpLzRrckhDVTJvRkpLNEx6dGkx?=
 =?utf-8?B?bVV4T2Roek5vRWRwb1hoTytCTk5KQmlBb0dVNnhSWm9xR3g0TmpFcGpDMVFE?=
 =?utf-8?B?WEJxN3lsZFlJdVROSE9tZXhUSUMyK0JpeUxkRkdiTWMraGFDWmxxMWdDN21B?=
 =?utf-8?B?ZmFEZHZlazdOVk84OU9ka2ZDR3ozSEhtcXgxTEtKeHlYVG1OZ1ZEd1pCdXNH?=
 =?utf-8?B?ajJCVEFrUlhWbUhlUzFFbmdpUUZiOUNmNGNuRTd0VUlxaVlLeVd4MURhcmpq?=
 =?utf-8?B?a0VnOVdkZHRGNHo2NEh5R2xOVjl3S25EZEc0Q3FhUDJPMXZsVDZueFFtMTlR?=
 =?utf-8?B?VU43MnhWbUpxV0lGb2czVXg4a3dNYzFZYUtiYVJaNUplME53V0VKMmVabS95?=
 =?utf-8?B?R294ZXljYnBsakdqNGc4RzdObTZONUlOQTB0TmxyNmk3cHZQb1RWbzhnbDJt?=
 =?utf-8?B?RDZ6bUdiaUYwamhSMkZaanBJeWJLVG9QZnRIWDdxM0MxU3lUaUpweUViQXVz?=
 =?utf-8?B?WWJweUZhUFdJNFhjaVFyQmEyM0RLaGtxUU5VNDEzSmJjZ2NJdFVBK05ZalNn?=
 =?utf-8?B?c3dickNFaGFzWFZrM3FyZFJTbWdhTS9LZlB5MXBoSVpFZTdOd29IOUlUeURu?=
 =?utf-8?B?Mk5EN21kTngxTkFkTVZtaDBRdUgwd3JOTG5idGZCbHlDTWNSSmQ4WlQvNWZl?=
 =?utf-8?B?TXB2encrWXRoWVZrN2piUEdoY2dqbENKVThXSVZ6emswVHl5V2F3Vm8wcTBB?=
 =?utf-8?B?dTc3V0NEQndWVW1CRmNGbHkyUFBwakJRVGVGbmQrcTdmdVhSQWVzYXRvSmVz?=
 =?utf-8?B?MHlvOEhSM0Z4K1Z2UXVuRjZMZktvMTByZ05JdjROL3dpak1KSmVSNDZ3T3U5?=
 =?utf-8?B?RHoyb0JjYXhGZ0ZObzVWb3BjQmlsWnFKRWkwTnRHWGRrUGd3K29JZnpieXZU?=
 =?utf-8?B?Q3dBb3ZESm9JRVF6eXEzM0Z3N2RnPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecec6380-ff36-44aa-377a-08da037e9d3d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 16:45:56.9674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: joRdG4ew60zBbhcHQuzYkdBK/Kt8B5CQ+3mg8VQwJqD8qsi+csImTAt2vpnURXa50wnbETuwVHHp3ZZobVRpx6lGKoudL0535Sc56qQZeBU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR10MB2877
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10283
 signatures=693140
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203110083
X-Proofpoint-ORIG-GUID: mzjsGXI1lS1yuZ-G-QvEImN7f2dLbX9y
X-Proofpoint-GUID: mzjsGXI1lS1yuZ-G-QvEImN7f2dLbX9y
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

On 3/9/2022 9:11 AM, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Dec 22, 2021 at 11:42 PM Steve Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>> wrote:
> 
>     Generalize strList_from_comma_list() to take any delimiter character, rename
>     as strList_from_string(), and move it to qapi/util.c.  Also add
>     strv_from_strList() and QAPI_LIST_LENGTH().
> 
> Looks like you could easily split, and add some tests.

Will do.  
I don't see any tests that include qapi/util.h, so this will be a new test file.

For the split, how about:
  patch: qapi: strList_from_string
  patch: qapi: strv_from_strList
  patch: qapi: QAPI_LIST_LENGTH
  patch: qapi: unit tests for lists

Or do you prefer that unit tests be pushed with each function's patch?

>     No functional change.
> 
>     Signed-off-by: Steve Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>>
>     ---
>      include/qapi/util.h | 28 ++++++++++++++++++++++++++++
>      monitor/hmp-cmds.c  | 29 ++---------------------------
>      qapi/qapi-util.c    | 37 +++++++++++++++++++++++++++++++++++++
>      3 files changed, 67 insertions(+), 27 deletions(-)
> 
>     diff --git a/include/qapi/util.h b/include/qapi/util.h
>     index 81a2b13..c249108 100644
>     --- a/include/qapi/util.h
>     +++ b/include/qapi/util.h
>     @@ -22,6 +22,8 @@ typedef struct QEnumLookup {
>          const int size;
>      } QEnumLookup;
> 
>     +struct strList;
>     +
>      const char *qapi_enum_lookup(const QEnumLookup *lookup, int val);
>      int qapi_enum_parse(const QEnumLookup *lookup, const char *buf,
>                          int def, Error **errp);
>     @@ -31,6 +33,19 @@ bool qapi_bool_parse(const char *name, const char *value, bool *obj,
>      int parse_qapi_name(const char *name, bool complete);
> 
>      /*
>     + * Produce and return a NULL-terminated array of strings from @args.
>     + * All strings are g_strdup'd.
>     + */
>     +char **strv_from_strList(const struct strList *args);
> 
>     +
> 
> I'd suggest to use the dedicated glib type GStrv

Will do, here and in related code.

- Steve

>     +/*
>     + * Produce a strList from the character delimited string @in.
>     + * All strings are g_strdup'd.
>     + * A NULL or empty input string returns NULL.
>     + */
>     +struct strList *strList_from_string(const char *in, char delim);
>     +
>     +/*
>       * For any GenericList @list, insert @element at the front.
>       *
>       * Note that this macro evaluates @element exactly once, so it is safe
>     @@ -56,4 +71,17 @@ int parse_qapi_name(const char *name, bool complete);
>          (tail) = &(*(tail))->next; \
>      } while (0)
> 
>     +/*
>     + * For any GenericList @list, return its length.
>     + */
>     +#define QAPI_LIST_LENGTH(list) \
>     +    ({ \
>     +        int len = 0; \
>     +        typeof(list) elem; \
>     +        for (elem = list; elem != NULL; elem = elem->next) { \
>     +            len++; \
>     +        } \
>     +        len; \
>     +    })
>     +
>      #endif
>     diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>     index b8c22da..5ca8b4b 100644
>     --- a/monitor/hmp-cmds.c
>     +++ b/monitor/hmp-cmds.c
>     @@ -43,6 +43,7 @@
>      #include "qapi/qapi-commands-run-state.h"
>      #include "qapi/qapi-commands-tpm.h"
>      #include "qapi/qapi-commands-ui.h"
>     +#include "qapi/util.h"
>      #include "qapi/qapi-visit-net.h"
>      #include "qapi/qapi-visit-migration.h"
>      #include "qapi/qmp/qdict.h"
>     @@ -70,32 +71,6 @@ bool hmp_handle_error(Monitor *mon, Error *err)
>          return false;
>      }
> 
>     -/*
>     - * Produce a strList from a comma separated list.
>     - * A NULL or empty input string return NULL.
>     - */
>     -static strList *strList_from_comma_list(const char *in)
>     -{
>     -    strList *res = NULL;
>     -    strList **tail = &res;
>     -
>     -    while (in && in[0]) {
>     -        char *comma = strchr(in, ',');
>     -        char *value;
>     -
>     -        if (comma) {
>     -            value = g_strndup(in, comma - in);
>     -            in = comma + 1; /* skip the , */
>     -        } else {
>     -            value = g_strdup(in);
>     -            in = NULL;
>     -        }
>     -        QAPI_LIST_APPEND(tail, value);
>     -    }
>     -
>     -    return res;
>     -}
>     -
>      void hmp_info_name(Monitor *mon, const QDict *qdict)
>      {
>          NameInfo *info;
>     @@ -1103,7 +1078,7 @@ void hmp_announce_self(Monitor *mon, const QDict *qdict)
>                                                  migrate_announce_params());
> 
>          qapi_free_strList(params->interfaces);
>     -    params->interfaces = strList_from_comma_list(interfaces_str);
>     +    params->interfaces = strList_from_string(interfaces_str, ',');
>          params->has_interfaces = params->interfaces != NULL;
>          params->id = g_strdup(id);
>          params->has_id = !!params->id;
>     diff --git a/qapi/qapi-util.c b/qapi/qapi-util.c
>     index fda7044..edd51b3 100644
>     --- a/qapi/qapi-util.c
>     +++ b/qapi/qapi-util.c
>     @@ -15,6 +15,7 @@
>      #include "qapi/error.h"
>      #include "qemu/ctype.h"
>      #include "qapi/qmp/qerror.h"
>     +#include "qapi/qapi-builtin-types.h"
> 
>      CompatPolicy compat_policy;
> 
>     @@ -152,3 +153,39 @@ int parse_qapi_name(const char *str, bool complete)
>          }
>          return p - str;
>      }
>     +
>     +char **strv_from_strList(const strList *args)
>     +{
>     +    const strList *arg;
>     +    int i = 0;
>     +    char **argv = g_malloc((QAPI_LIST_LENGTH(args) + 1) * sizeof(char *));
>     +
>     +    for (arg = args; arg != NULL; arg = arg->next) {
>     +        argv[i++] = g_strdup(arg->value);
>     +    }
>     +    argv[i] = NULL;
>     +
>     +    return argv;
>     +}
>     +
>     +strList *strList_from_string(const char *in, char delim)
>     +{
>     +    strList *res = NULL;
>     +    strList **tail = &res;
>     +
>     +    while (in && in[0]) {
>     +        char *next = strchr(in, delim);
>     +        char *value;
>     +
>     +        if (next) {
>     +            value = g_strndup(in, next - in);
>     +            in = next + 1; /* skip the delim */
>     +        } else {
>     +            value = g_strdup(in);
>     +            in = NULL;
>     +        }
>     +        QAPI_LIST_APPEND(tail, value);
>     +    }
>     +
>     +    return res;
>     +}
>     -- 
>     1.8.3.1
> 
> 
> 
> 
> -- 
> Marc-André Lureau

