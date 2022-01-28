Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B91AA49FC96
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 16:16:31 +0100 (CET)
Received: from localhost ([::1]:35494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDSzF-000117-Ob
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 10:16:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nDSvE-0006HK-Ub
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:12:21 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:44366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nDSvB-0003az-9Z
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:12:20 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20SCxI5F009548; 
 Fri, 28 Jan 2022 15:11:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=aAH0VRPzLi707Aa3x1XlsGBMK6sVBnKeHnrW/aNKcKQ=;
 b=oo/n3KMP/afvw2ecbAzx04XOPzsZeqLXSBocEZf1vfIUjkDPnLUSlkrdN1QUbfY4f40Y
 jBuuxLNb8iXBDEBqMJcAQZNhniumk/40cyZnqTSQ8Ges1mSj+vOg8EqgudMTl39y/prN
 8OmebywPk20dC7C4AytM9kzvOWLf4I8qLNzEKqeyB6zvyH925L2/4257kHGBFiXaMHUO
 mYu4C+hNjR41Mk4A1Bq4hV2ucMsPMyQjPLEwheG7oJiYWWtj+1ee8Zj60Tz6ZsmgxYAF
 onUKw2zUZzegsUGucOdyN8pNtXArVihpoxhca1SJ0PxsPA92gwpiCLXRjjjoZw+rgn7E Gg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3duwrxkgu9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jan 2022 15:11:50 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20SFBTAv003105;
 Fri, 28 Jan 2022 15:11:49 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
 by aserp3030.oracle.com with ESMTP id 3dr7ynxe0j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jan 2022 15:11:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EJVJpF9iU//KJ+MAqkNQp3FnLKkzVJgdm1FgMeoALSg/PXJ6/89Z1BamFbfMU+WqvHuTfj/pviGZE3RQt/cAXs/CWz6JmXtvmF57oMxI9Txj9AHEVUoriMt+Ke44IvE5RoS2rlsbPNLTRkVDHbJJBXEWdXqovopBDefnEZT5+JzyZm0n/RyVLCLJQybCdWSYERyBb3zhvGI8UOqrrxM0yd/spj8+cORT5lS/QMZCimb3SU7ckEDe/gtifqmKhFcUmdXI2dpUhEqbI0td5FybqOzjwQH/0V+5bZNgoh0GVSxBc8jd7xjqNVYC8CRUpEC4yJuvrOJ5L/Sp5kceiwyhXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aAH0VRPzLi707Aa3x1XlsGBMK6sVBnKeHnrW/aNKcKQ=;
 b=f2a4ybpYThR1VW6p8Fet7vF0GgY5NmI1E7IdzcJ+xt5BUrNjlKWEji1YiYDLJeHrgomngSFc2gpqCKB8Hh8nY/moRm8c3tXnW/1Txt0xvG0T9sSdoaKK22lEj39Cc5N2L0f+e4dFYUaqpMRlTm/acZ8o4WogfzKvNOHjzhLCW3maRPLawm2I5LELlUgJmpl1K/pXOasTIoZaL+QOxGb5UA8g3m1QcxB14M0GplG0vnAQaeWd3Uv9x+aDV844G6eI9pWTCoJL7Oi2MYFHGtjVALCzfY+OAAVMlOA/yBlCOiwc4T/1ezlKwWLVawNa9i1s9QjppvT/yY6fY9bQynx6Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aAH0VRPzLi707Aa3x1XlsGBMK6sVBnKeHnrW/aNKcKQ=;
 b=fHtidMr6U0y7Tgu59JbhihRrrfvugRSiAyvw+4LukKPE6NsuwEB67pf/6gTIoPYmiODSBV8aHrKdkjVVgiBDLXcacWV5FEZ65HHgOXIls7oXnupmYrpJAe6CMvpXbcTOXGUD7oofLinSZndRIGCp3gYSGMfkmxXkmf8byeZD8ok=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by BY5PR10MB4180.namprd10.prod.outlook.com (2603:10b6:a03:211::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Fri, 28 Jan
 2022 15:11:45 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c%4]) with mapi id 15.20.4930.019; Fri, 28 Jan 2022
 15:11:45 +0000
Message-ID: <c5460e4e-61dd-78ad-6703-e518a8302097@oracle.com>
Date: Fri, 28 Jan 2022 09:11:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v14 06/10] ACPI ERST: build the ACPI ERST table
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <1643214514-2839-1-git-send-email-eric.devolder@oracle.com>
 <1643214514-2839-7-git-send-email-eric.devolder@oracle.com>
 <alpine.OSX.2.20.2201271401250.42000@athabasca.local>
 <1f544cb3-7434-3480-63fc-ff317327ea78@oracle.com>
 <20220127193136-mutt-send-email-mst@kernel.org>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <20220127193136-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0171.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::26) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f296013a-28c7-437d-e109-08d9e2707f91
X-MS-TrafficTypeDiagnostic: BY5PR10MB4180:EE_
X-Microsoft-Antispam-PRVS: <BY5PR10MB4180DB5C4A2CB7331DE694E097229@BY5PR10MB4180.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lP/cPXAt3p+17IaqH1aU2p+z9YArlNwKMJiSylGhVC4C9O4B1GodHIoJvVnPBjLAk8KPVSWzixsKWmy3E3LtUaRbzAsTgAD3QODEiqXljA7S0V2TeYV1C8jr+yHOrTQSHJojGztNksGkhJONonkjzQzKKIsfgDQ3A34NLIbp53DxOOymGL4Se+S+UM+HwMUk3tj72aJZoUUHdw+G4cNtdMMIxH8c7KLux9MJs8zalHHI33jyqqVUNb/vNFELCFYHlqbm0cx133IAW8M1CkdP//pXefR5Ua4cjOFmQi/Vag6dLgweTWa8gu53Fwo0CPK0NXosbxSD55q65moDjAv5voNigWdGbFu871qQ5j587RUbSRUsWpIOpUXi+akLv52iYe88WHl+2phBK07tH7LWbYyHhXo4RTJqKc5u/d0KccXy9OcLGKkK9ogh2MHTUxPBgJSq8L7C+qtpaADqaSNefs4mcsSyh5CjL0Z9PUqLrURi7aU8nSwfSx5oJxAU4Tl6qaO/g2MZoU5zCvPYYlywp/1yjEDk8ubEFS/+LrrdMfph1YAyb0oetxOI5NvRZ0ycJkMlQnvaShfKb82PIDDoNQFuKpAl6jX+qx6j86ZG/sYrL0/TgIKPCkoCXw/6moTmIZfgpPvaO6gjFtCHm/TDjY/Rz6LPFDfTVzRwsXdlyXa6FMQSs/140u2laG/Qg4AWmncY/CIW0ZWjq8A6OLmSeLxkXtWf9sVDsfhrRGp6F9U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(30864003)(316002)(6666004)(6506007)(53546011)(6916009)(8936002)(6486002)(6512007)(8676002)(86362001)(4326008)(31696002)(508600001)(38100700002)(66476007)(66556008)(2906002)(66946007)(36756003)(107886003)(186003)(83380400001)(2616005)(31686004)(45980500001)(43740500002)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vm1tREdJb3JTZWg2VWNnSzRCYklqM2tJcUk5V3E3ZkM4QXN3UUQwaDlQSklJ?=
 =?utf-8?B?N09QWEJhSFpiWWxpYnViYTEzdXB4bVphVzV3ZmJsanJrUzRWYmFYdFFqcEh1?=
 =?utf-8?B?dWRBcjh0dldZRjE1bnIyOFJtM0E3VFlSM2E0eDQ0cVViVE5sR3JxT2x6bzB3?=
 =?utf-8?B?UFlISWpHRmFrRlo0K0hjRzZkTG43N2ltSzV1TVAwaUxEQ3dQMGltOTE0c3Zx?=
 =?utf-8?B?a1gzeXFzQVd0NGNSVzQ0aFpvTnAzNVFQVFNXZ00zOW1RUW5yanVPSkd1VDB4?=
 =?utf-8?B?R3pZSjlLZnpPSEtjcUZrL3ZybnIrcGZVUnVKaHAwTkpHVWlGeUxXeHVJa2pn?=
 =?utf-8?B?aDlhL2UvajMrQ3VScS8wZkRzdlliOEwvcHU1RGJLaWZ5SC9DSlJlaCtpc1di?=
 =?utf-8?B?aXFsaVZ0a3RRMDBIaVpZWEpFQUsyYnExendHbjNod0NKNWVqUkdjQmxVSVJh?=
 =?utf-8?B?UzZDYXk2TnhWUUVxNFZ1bXdaanBJZUY1WFFqL2hhVFVacklQTGpFZytVNVVz?=
 =?utf-8?B?dFRXcVdrelpMVHNaMHVnMzJEc0NiZDRQWmNBSnA1ZDZHakNsaENMSXRoZzY2?=
 =?utf-8?B?clhpTlNxUGxMOGxoRU5vNGV3ZFAzOEtpUVJkK3gxdWpTTG9tQTg5MWdUanRr?=
 =?utf-8?B?THFQa2ttMjNWU0g4Y2w4K3BRQmtET094Si9sZzdPZGVWTjFVV2ZsTEx4OWZk?=
 =?utf-8?B?SmkvM2krZVhTOTFTVnRwQ0NkRkZoSGhBVThZQzhQZlNMdEVvNTBacTJ2bnJG?=
 =?utf-8?B?Tk95M1pXdWQzUEhrREdvdG1UNEI3WHZDSm40WHNVclI5SUczckpsOGpVemlH?=
 =?utf-8?B?N1RvbllSY1BQc2N4MGVpNjhRTEJKUjZrLzVtcHdUTlNOQk1Mb2MrcVRGY0dP?=
 =?utf-8?B?bXZJYXpDSUJUODEvblN4bDczZGprR0tMQ2dVN0JncitjQnozVVpBaFNYN1JH?=
 =?utf-8?B?Z3JTNm5obmM2M0dtQTk1OG9abDQ0ZjV2YnFyYWhtMmxHWVdNZ01LRnVVeFN1?=
 =?utf-8?B?aDgycnpCTWI0TUJnVjU5OW4vZ29IMitOYkFKbjVYcE9jL01uakx6TmVmejM2?=
 =?utf-8?B?WlplRkVlcXhIZytBYVR6cVhYeU1QNk1KRWN1MC9Mb1lsblM3Z2RmZDJHTmRs?=
 =?utf-8?B?dmxNSmxCcFJWallXc09ZMjF1U0I3OXRUUU1RTmhsZ0d3RFQ0UWdaY0V5Tkw4?=
 =?utf-8?B?MEp6WnpjdnBhdko4MWV4Vm9TbTJVZE5kN3FZOTZCQ0VoallCWEVsM0pEQnpI?=
 =?utf-8?B?OWZPSDFxUkZ2MXI4TG9TSlNiVHpDZFpMajZxOHhQcFVubDE4MlZtbU5aRWdD?=
 =?utf-8?B?Sng4RjVXejA5aEJpcFVDNFBMbXhvSUtqRkdJRURPZmVEM2Y5a2d6dnd5d0E1?=
 =?utf-8?B?TjFjL1dxaEpvenlMQWkra0RYUDF3T0NIdVhnLzFRUk1ob3lpVERlUU5McHRE?=
 =?utf-8?B?YlhIdjFIY0pNVW55MUdTTElZaDRnVG1iZkdEMVRsaDFNdUVtL3psMVY4OENL?=
 =?utf-8?B?VU1YVzRJR3A0WFp5cjgvWVpBNCtGNGpxNS9JejQrRS9Jcms5UGUxYU1BeVNJ?=
 =?utf-8?B?emE4OHdmMXRMeXhtemxiV24wdStwVEdBd0JNSlloRnRFU0RvVWxhMlh6RnU4?=
 =?utf-8?B?TTZMKzhMUForaFVVQzU1T2NXa3pXVC90RUdNcTViNE14RXNWb1NkV0RSa05H?=
 =?utf-8?B?aGRRTk83V0QyRFBwRFJQRzFVTnNWcm1wWm8vUnBUSnI0QTJ4YkVwYnljZy91?=
 =?utf-8?B?bjdKM3RsOTc2WElpQWVrNXF3Y05Qb2g3S2JMM2ZyRW5UQ3J6cUJoc2RTT1dl?=
 =?utf-8?B?KzdXdjRsZnpYYythZTBqRUp2bkNpMnVxT2o5MTQyaHZEbGszaThGNmltaVFl?=
 =?utf-8?B?c1RVMnp0WTF0Vi9XMC9CZlRHYU9KNm1FR1J1dENQbGliRFBGTEg4UjhNdzNQ?=
 =?utf-8?B?TDVzQjgvOHRQQXFGV0pmNExyT0dZTmE1Mk14MmhTZ0hPZnRhT3VsYjhZSkpN?=
 =?utf-8?B?aTB3d1NUQ29ESWFkM2NNTCtsYzhBL0drSGM1aDJjdzgzMUZRQkpwZk44MVZu?=
 =?utf-8?B?MENCanRaQnVLV0htOTE2RXIwbmtIMnJLZ0kvamRrVjhIbHI5cnZxbmdDblVQ?=
 =?utf-8?B?NUNRclY2bk1lZWJnbXlicS9jN3ZrcDk1UENzMnZCKysvMytwUmdEb0x2eVlW?=
 =?utf-8?B?bXJkdDFFcXNLcDEyUVgzRHVMYktQNHA1bjJFcXk5eUdocXVMSWF0aExXb0k2?=
 =?utf-8?B?dnYrN25XWHlncU5Ua3d0SlM5MWZHZjUvYmZFSVB0Mi9kZTh0N0VZTmVieG9u?=
 =?utf-8?Q?E5fSAVSkeHDiQu0yGj?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f296013a-28c7-437d-e109-08d9e2707f91
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 15:11:45.7865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wUzjYCJXnpZYmYtJK9GA0q97qyf/OtsRuxX3WXRri6lGJU7PBeN4G2N6yu/jLWbnxXDX+MGD1l5o+5mmI3IMSkuAoAR+sBOZOciNZs6mZl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4180
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10240
 signatures=669575
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201280096
X-Proofpoint-GUID: -lVjzRknZTxptDfeUIcAXb9bN2Lb1P5T
X-Proofpoint-ORIG-GUID: -lVjzRknZTxptDfeUIcAXb9bN2Lb1P5T
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: berrange@redhat.com, ehabkost@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, Ani Sinha <ani@anisinha.ca>,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Michael,
Thanks for examining this. Inline response below.
eric

On 1/27/22 18:37, Michael S. Tsirkin wrote:
> On Thu, Jan 27, 2022 at 04:02:07PM -0600, Eric DeVolder wrote:
>> Ani,
>> Thanks for the RB! Inline responses below.
>> eric
>>
>> On 1/27/22 02:36, Ani Sinha wrote:
>>>
>>>
>>> On Wed, 26 Jan 2022, Eric DeVolder wrote:
>>>
>>>> This builds the ACPI ERST table to inform OSPM how to communicate
>>>> with the acpi-erst device.
>>>
>>> There might be more optimizations possible but I think we have messaged
>>> this code enough. We can further rework the code if needed in subsequent
>>> patches once this is pushed.
>>>
>>>>
>>>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>>>
>>> with some minor comments,
>>>
>>> Reviewed-by: Ani Sinha <ani@anisinha.ca>
>>>
>>>>    hw/acpi/erst.c | 225 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 225 insertions(+)
>>>>
>>>> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
>>>> index fe9ba51..5d5a639 100644
>>>> --- a/hw/acpi/erst.c
>>>> +++ b/hw/acpi/erst.c
>>>> @@ -59,6 +59,27 @@
>>>>    #define STATUS_RECORD_STORE_EMPTY     0x04
>>>>    #define STATUS_RECORD_NOT_FOUND       0x05
>>>>
>>>> +/* ACPI 4.0: Table 17-19 Serialization Instructions */
>>>> +#define INST_READ_REGISTER                 0x00
>>>> +#define INST_READ_REGISTER_VALUE           0x01
>>>> +#define INST_WRITE_REGISTER                0x02
>>>> +#define INST_WRITE_REGISTER_VALUE          0x03
>>>> +#define INST_NOOP                          0x04
>>>> +#define INST_LOAD_VAR1                     0x05
>>>> +#define INST_LOAD_VAR2                     0x06
>>>> +#define INST_STORE_VAR1                    0x07
>>>> +#define INST_ADD                           0x08
>>>> +#define INST_SUBTRACT                      0x09
>>>> +#define INST_ADD_VALUE                     0x0A
>>>> +#define INST_SUBTRACT_VALUE                0x0B
>>>> +#define INST_STALL                         0x0C
>>>> +#define INST_STALL_WHILE_TRUE              0x0D
>>>> +#define INST_SKIP_NEXT_INSTRUCTION_IF_TRUE 0x0E
>>>> +#define INST_GOTO                          0x0F
>>>> +#define INST_SET_SRC_ADDRESS_BASE          0x10
>>>> +#define INST_SET_DST_ADDRESS_BASE          0x11
>>>> +#define INST_MOVE_DATA                     0x12
>>>> +
>>>>    /* UEFI 2.1: Appendix N Common Platform Error Record */
>>>>    #define UEFI_CPER_RECORD_MIN_SIZE 128U
>>>>    #define UEFI_CPER_RECORD_LENGTH_OFFSET 20U
>>>> @@ -172,6 +193,210 @@ typedef struct {
>>>>
>>>>    /*******************************************************************/
>>>>    /*******************************************************************/
>>>> +typedef struct {
>>>> +    GArray *table_data;
>>>> +    pcibus_t bar;
>>>> +    uint8_t instruction;
>>>> +    uint8_t flags;
>>>> +    uint8_t register_bit_width;
>>>> +    pcibus_t register_offset;
>>>> +} BuildSerializationInstructionEntry;
>>>> +
>>>> +/* ACPI 4.0: 17.4.1.2 Serialization Instruction Entries */
>>>> +static void build_serialization_instruction(
>>>> +    BuildSerializationInstructionEntry *e,
>>>> +    uint8_t serialization_action,
>>>> +    uint64_t value)
>>>> +{
>>>> +    /* ACPI 4.0: Table 17-18 Serialization Instruction Entry */
>>>> +    struct AcpiGenericAddress gas;
>>>> +    uint64_t mask;
>>>> +
>>>> +    /* Serialization Action */
>>>> +    build_append_int_noprefix(e->table_data, serialization_action, 1);
>>>> +    /* Instruction */
>>>> +    build_append_int_noprefix(e->table_data, e->instruction, 1);
>>>> +    /* Flags */
>>>> +    build_append_int_noprefix(e->table_data, e->flags, 1);
>>>> +    /* Reserved */
>>>> +    build_append_int_noprefix(e->table_data, 0, 1);
>>>> +    /* Register Region */
>>>> +    gas.space_id = AML_SYSTEM_MEMORY;
>>>> +    gas.bit_width = e->register_bit_width;
>>>> +    gas.bit_offset = 0;
>>>> +    gas.access_width = ctz32(e->register_bit_width) - 2;
>>>
>>> Should this be casted as unit8_t?
>> OK, done.
>>
>>>
>>>> +    gas.address = (uint64_t)(e->bar + e->register_offset);
>>>> +    build_append_gas_from_struct(e->table_data, &gas);
>>>> +    /* Value */
>>>> +    build_append_int_noprefix(e->table_data, value, 8);
>>>> +    /* Mask */
>>>> +    mask = (1ULL << (e->register_bit_width - 1) << 1) - 1;
>>>> +    build_append_int_noprefix(e->table_data, mask, 8);
>>>> +}
>>>> +
>>>> +/* ACPI 4.0: 17.4.1 Serialization Action Table */
>>>> +void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
>>>> +    const char *oem_id, const char *oem_table_id)
>>>> +{
>>>> +    /*
>>>> +     * Serialization Action Table
>>>> +     * The serialization action table must be generated first
>>>> +     * so that its size can be known in order to populate the
>>>> +     * Instruction Entry Count field.
>>>> +     */
>>>> +    GArray *table_instruction_data = g_array_new(FALSE, FALSE, sizeof(char));
>>>> +    pcibus_t bar0 = pci_get_bar_addr(PCI_DEVICE(erst_dev), 0);
>>>> +    AcpiTable table = { .sig = "ERST", .rev = 1, .oem_id = oem_id,
>>>> +                        .oem_table_id = oem_table_id };
>>>> +    /* Contexts for the different ways ACTION and VALUE are accessed */
>>>> +    BuildSerializationInstructionEntry rd_value_32_val = {
>>>> +        .table_data = table_instruction_data,
>>>> +        .bar = bar0,
>>>> +        .instruction = INST_READ_REGISTER_VALUE,
>>>> +        .flags = 0,
>>>> +        .register_bit_width = 32,
>>>> +        .register_offset = ERST_VALUE_OFFSET,
>>>> +    };
>>>> +    BuildSerializationInstructionEntry rd_value_32 = {
>>>> +        .table_data = table_instruction_data,
>>>> +        .bar = bar0,
>>>> +        .instruction = INST_READ_REGISTER,
>>>> +        .flags = 0,
>>>> +        .register_bit_width = 32,
>>>> +        .register_offset = ERST_VALUE_OFFSET,
>>>> +    };
>>>> +    BuildSerializationInstructionEntry rd_value_64 = {
>>>> +        .table_data = table_instruction_data,
>>>> +        .bar = bar0,
>>>> +        .instruction = INST_READ_REGISTER,
>>>> +        .flags = 0,
>>>> +        .register_bit_width = 64,
>>>> +        .register_offset = ERST_VALUE_OFFSET,
>>>> +    };
>>>> +    BuildSerializationInstructionEntry wr_value_32_val = {
>>>> +        .table_data = table_instruction_data,
>>>> +        .bar = bar0,
>>>> +        .instruction = INST_WRITE_REGISTER_VALUE,
>>>> +        .flags = 0,
>>>> +        .register_bit_width = 32,
>>>> +        .register_offset = ERST_VALUE_OFFSET,
>>>> +    };
>>>> +    BuildSerializationInstructionEntry wr_value_32 = {
>>>> +        .table_data = table_instruction_data,
>>>> +        .bar = bar0,
>>>> +        .instruction = INST_WRITE_REGISTER,
>>>> +        .flags = 0,
>>>> +        .register_bit_width = 32,
>>>> +        .register_offset = ERST_VALUE_OFFSET,
>>>> +    };
>>>> +    BuildSerializationInstructionEntry wr_value_64 = {
>>>> +        .table_data = table_instruction_data,
>>>> +        .bar = bar0,
>>>> +        .instruction = INST_WRITE_REGISTER,
>>>> +        .flags = 0,
>>>> +        .register_bit_width = 64,
>>>> +        .register_offset = ERST_VALUE_OFFSET,
>>>> +    };
>>>> +    BuildSerializationInstructionEntry wr_action = {
>>>> +        .table_data = table_instruction_data,
>>>> +        .bar = bar0,
>>>> +        .instruction = INST_WRITE_REGISTER_VALUE,
>>>> +        .flags = 0,
>>>> +        .register_bit_width = 32,
>>>> +        .register_offset = ERST_ACTION_OFFSET,
>>>> +    };
>>>
>>> We can probably write a macro to simply generating these structs. I see
>>> .bar and .flags are the same in all structs. The .bit_width can be a param
>>> into the macro etc.
>> Agree, however the request was to NOT hide the use of local variables in
>> macros, so while .flags is always 0, .instruction, .register_bit_width and .register_offset
>> would be parameters, that leaves .table_data and .bar which just need the local
>> variables. Is the following acceptable (which hides the use of the local variables)?
> 
> You can just use assignment:
> 
>     BuildSerializationInstructionEntry entry = {
>         .table_data = table_instruction_data,
>         .bar = bar0,
>         .flags = 0,
>         .register_bit_width = 32,
>     };
>     BuildSerializationInstructionEntry rd_value_32_val = entry;
>     rd_value_32_val.action = INST_READ_REGISTER_VALUE;
>     rd_value_32_val.register_offset = ERST_ACTION_OFFSET;
> 
> and so on.
> not sure it's worth it, it's just a couple of lines.
> 

OK, here is the equivalent using struct assignment, is this what you were after?

     BuildSerializationInstructionEntry base = {
         .table_data = table_instruction_data,
         .bar = bar0,
         .instruction = INST_WRITE_REGISTER,
         .flags = 0,
         .register_bit_width = 32,
         .register_offset = ERST_VALUE_OFFSET,
     };
     BuildSerializationInstructionEntry rd_value_32_val = base;
     rd_value_32_val.instruction = INST_READ_REGISTER_VALUE;
     BuildSerializationInstructionEntry rd_value_32 = base;
     rd_value_32.instruction = INST_READ_REGISTER;
     BuildSerializationInstructionEntry rd_value_64 = base;
     rd_value_64.instruction = INST_READ_REGISTER;
     rd_value_64.register_bit_width = 64;
     BuildSerializationInstructionEntry wr_value_32_val = base;
     wr_value_32_val.instruction = INST_WRITE_REGISTER_VALUE;
     BuildSerializationInstructionEntry wr_value_32 = base;
     BuildSerializationInstructionEntry wr_value_64 = base;
     wr_value_64.register_bit_width = 64;
     BuildSerializationInstructionEntry wr_action = base;
     wr_action.instruction = INST_WRITE_REGISTER_VALUE;
     wr_action.register_offset = ERST_ACTION_OFFSET;



> 
> 
>> #define SERIALIZATIONINSTRUCTIONCTX(name, \
>>      inst, bit_width, offset) \
>>      BuildSerializationInstructionEntry name = { \
>>          .table_data = table_instruction_data, \
>>          .bar = bar0, \
>>          .instruction = inst, \
>>          .flags = 0, \
>>          .register_bit_width = bit_width, \
>>          .register_offset = offset, \
>>      }
>>      SERIALIZATIONINSTRUCTIONCTX(rd_value_32_val,
>>          INST_READ_REGISTER_VALUE, 32, ERST_VALUE_OFFSET);
>>      SERIALIZATIONINSTRUCTIONCTX(rd_value_32,
>>          INST_READ_REGISTER, 32, ERST_VALUE_OFFSET);
>>      SERIALIZATIONINSTRUCTIONCTX(rd_value_64,
>>          INST_READ_REGISTER, 64, ERST_VALUE_OFFSET);
>>      SERIALIZATIONINSTRUCTIONCTX(wr_value_32_val,
>>          INST_WRITE_REGISTER_VALUE, 32, ERST_VALUE_OFFSET);
>>      SERIALIZATIONINSTRUCTIONCTX(wr_value_32,
>>          INST_WRITE_REGISTER, 32, ERST_VALUE_OFFSET);
>>      SERIALIZATIONINSTRUCTIONCTX(wr_value_64,
>>          INST_WRITE_REGISTER, 64, ERST_VALUE_OFFSET);
>>      SERIALIZATIONINSTRUCTIONCTX(wr_action,
>>          INST_WRITE_REGISTER_VALUE, 32, ERST_ACTION_OFFSET);
>>
>> These are the 7 accessors needed.
> 
> not at all sure this one is worth the macro mess.

I'm hoping to produce a v15 with the style you want.
eric

> 
>>>
>>>> +    unsigned action;
>>>> +
>>>> +    trace_acpi_erst_pci_bar_0(bar0);
>>>> +
>>>> +    /* Serialization Instruction Entries */
>>>> +    action = ACTION_BEGIN_WRITE_OPERATION;
>>>> +    build_serialization_instruction(&wr_action, action, action);
>>>> +
>>>> +    action = ACTION_BEGIN_READ_OPERATION;
>>>> +    build_serialization_instruction(&wr_action, action, action);
>>>> +
>>>> +    action = ACTION_BEGIN_CLEAR_OPERATION;
>>>> +    build_serialization_instruction(&wr_action, action, action);
>>>> +
>>>> +    action = ACTION_END_OPERATION;
>>>> +    build_serialization_instruction(&wr_action, action, action);
>>>> +
>>>> +    action = ACTION_SET_RECORD_OFFSET;
>>>> +    build_serialization_instruction(&wr_value_32, action, 0);
>>>> +    build_serialization_instruction(&wr_action, action, action);
>>>> +
>>>> +    action = ACTION_EXECUTE_OPERATION;
>>>> +    build_serialization_instruction(&wr_value_32_val, action,
>>>> +        ERST_EXECUTE_OPERATION_MAGIC);
>>>> +    build_serialization_instruction(&wr_action, action, action);
>>>> +
>>>> +    action = ACTION_CHECK_BUSY_STATUS;
>>>> +    build_serialization_instruction(&wr_action, action, action);
>>>> +    build_serialization_instruction(&rd_value_32_val, action, 0x01);
>>>> +
>>>> +    action = ACTION_GET_COMMAND_STATUS;
>>>> +    build_serialization_instruction(&wr_action, action, action);
>>>> +    build_serialization_instruction(&rd_value_32, action, 0);
>>>> +
>>>> +    action = ACTION_GET_RECORD_IDENTIFIER;
>>>> +    build_serialization_instruction(&wr_action, action, action);
>>>> +    build_serialization_instruction(&rd_value_64, action, 0);
>>>> +
>>>> +    action = ACTION_SET_RECORD_IDENTIFIER;
>>>> +    build_serialization_instruction(&wr_value_64, action, 0);
>>>> +    build_serialization_instruction(&wr_action, action, action);
>>>> +
>>>> +    action = ACTION_GET_RECORD_COUNT;
>>>> +    build_serialization_instruction(&wr_action, action, action);
>>>> +    build_serialization_instruction(&rd_value_32, action, 0);
>>>> +
>>>> +    action = ACTION_BEGIN_DUMMY_WRITE_OPERATION;
>>>> +    build_serialization_instruction(&wr_action, action, action);
>>>> +
>>>> +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE;
>>>> +    build_serialization_instruction(&wr_action, action, action);
>>>> +    build_serialization_instruction(&rd_value_64, action, 0);
>>>> +
>>>> +    action = ACTION_GET_ERROR_LOG_ADDRESS_LENGTH;
>>>> +    build_serialization_instruction(&wr_action, action, action);
>>>> +    build_serialization_instruction(&rd_value_64, action, 0);
>>>> +
>>>> +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES;
>>>> +    build_serialization_instruction(&wr_action, action, action);
>>>> +    build_serialization_instruction(&rd_value_32, action, 0);
>>>> +
>>>> +    action = ACTION_GET_EXECUTE_OPERATION_TIMINGS;
>>>> +    build_serialization_instruction(&wr_action, action, action);
>>>> +    build_serialization_instruction(&rd_value_64, action, 0);
>>>> +
>>>> +    /* Serialization Header */
>>>> +    acpi_table_begin(&table, table_data);
>>>> +
>>>> +    /* Serialization Header Size */
>>>> +    build_append_int_noprefix(table_data, 48, 4);
>>>> +
>>>> +    /* Reserved */
>>>> +    build_append_int_noprefix(table_data,  0, 4);
>>>> +
>>>> +    /*
>>>> +     * Instruction Entry Count
>>>> +     * Each instruction entry is 32 bytes
>>>> +     */
>>>> +    g_assert((table_instruction_data->len) % 32 == 0);
>>>> +    build_append_int_noprefix(table_data,
>>>> +        (table_instruction_data->len / 32), 4);
>>>> +
>>>> +    /* Serialization Instruction Entries */
>>>> +    g_array_append_vals(table_data, table_instruction_data->data,
>>>> +        table_instruction_data->len);
>>>> +    g_array_free(table_instruction_data, TRUE);
>>>> +
>>>> +    acpi_table_end(linker, &table);
>>>> +}
>>>> +
>>>> +/*******************************************************************/
>>>> +/*******************************************************************/
>>>>    static uint8_t *get_nvram_ptr_by_index(ERSTDeviceState *s, unsigned index)
>>>>    {
>>>>        uint8_t *rc = NULL;
>>>> --
>>>> 1.8.3.1
>>>>
>>>>
> 

