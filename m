Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A89A587B32
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 13:01:35 +0200 (CEST)
Received: from localhost ([::1]:58224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIpeY-0002yS-GH
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 07:01:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1oIpZJ-0005dw-Ih
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 06:56:10 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:47306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1oIpZE-0003my-8g
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 06:56:09 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2728ts9e012761;
 Tue, 2 Aug 2022 10:55:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2022-7-12;
 bh=APewtpohbp7CXBi5/hwKgGRl6q14eB2lNPIffxHxIMk=;
 b=H6cJ1Qo+0uitWNFh47PKgrAOLk2yDFJFXwDjtY5DnghBgARy9w/J09EzVvVM0Mjbs3W0
 VBWGjlBIleyfygZk0noRbRwa053l+Nfa5+CRn4Or10x5ZrbXbMHRxcM9foGkJgENhT2U
 QaVk4vokbhWR7JO7ap7Mwi+0pMWAXzkFItZ8xUk5wQRTL4sAlU6AMH/tvcANl3KiiE6j
 gU6iCG31c9LXZk6eHo4I82StExYhxDPqx9RTQh0XK3a7NVGhQAn5scWzcX2J2thE3DQT
 gtys52QWFS9qrKtJKO9J3DWcWB/DctLqVgeqajRdxpn6NE3SMj4ToCTpD4KUHR3nIQAX zg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hmu2c6cft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Aug 2022 10:55:59 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 272Aa8TU014328; Tue, 2 Aug 2022 10:55:58 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3hmu32755j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Aug 2022 10:55:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HizfOtaQLcaBz9Zyy4hpTfk3rrAvMskLjJnI3L0oG+IqZfj7WktUPP6BYlFJxLP4MXz880WB5quyaHDsc6uxAPRJ5UYim8+AtFErV0HVva9Qto363NFDl6llJC8CtWUu7yiKfA+ilPHLEN1XdcsHajrpcZzcaJ9ayMs1fRgbpF8a0ZXuS5+k+4aWTMXiQ/lFX0nHg+RF+pUGBrXkOxZ8rKloi0AHRrNbxMaJGVDsipkTDdGaw0pN1FyuqUrnrPygybPzlJkGnq5GHz78aJDMZEwsT7wqnwUhmR8/UiD8/8v/IhtAEt/MAsOr0v+n37RMqJoJjevvT4Ihay8tMxbCfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=APewtpohbp7CXBi5/hwKgGRl6q14eB2lNPIffxHxIMk=;
 b=VaDSlE/0iqIdbxgNCGzuxDHF/ZyYncLRq0GbHIIgY1ZmwmcBIQ3crQJIfJ6bWrH2Gt4iQrN8wdOmmnGfW2TorDekMZxK/uqc3GQDTZOmhRPVL8hXpg3UPZu3khMzBzlo/ps2v02z+gdGBN9pOJjL1yEgS16wC9loIQbY02FYDiBISBS+ECAHpN/Xd2NsinPI2y+PgK6m+8MNb99OkuB+YdKXf1TDVtrWPkvp3hAUc3dBAevH5+05Rvu1jVILyTq3H38g5wjpr5sx9cMAPr+2NA6p4fFPvdXZsNe0nfLkk5WLoE5bKe79B8UisqgRByUgilrat4/NYIQuDd/lZKjU/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APewtpohbp7CXBi5/hwKgGRl6q14eB2lNPIffxHxIMk=;
 b=QQT6JI8XIpoX2YZZ4pXz5cfLWKAfSjwUWuKfi1Twj9F8+33d8TBMcIREaMGXSNsvanv4csz5bg36LE7qWERAGnxJS0IbRI6yiwZKQcMVDrrZk8hFCO3Mq+b8UFvXOlQhYHGMvH7XrsgBFaZ8oyxHnAjAalmjRh27o2ksS5v4Qw8=
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by DM6PR10MB2715.namprd10.prod.outlook.com (2603:10b6:5:ba::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Tue, 2 Aug
 2022 10:55:57 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::89fe:338:779d:6bb0]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::89fe:338:779d:6bb0%8]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 10:55:57 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: zhenwei pi <pizhenwei@bytedance.com>, dgilbert@redhat.com,
 armbru@redhat.com
Cc: qemu-devel@nongnu.org, zhenwei pi <pizhenwei@bytedance.com>
Subject: Re: [PATCH v4 1/1] monitor: Support specified vCPU registers
In-Reply-To: <20220802073720.1236988-2-pizhenwei@bytedance.com>
References: <20220802073720.1236988-1-pizhenwei@bytedance.com>
 <20220802073720.1236988-2-pizhenwei@bytedance.com>
Date: Tue, 02 Aug 2022 11:55:53 +0100
Message-ID: <m2y1w6nccm.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0258.eurprd04.prod.outlook.com
 (2603:10a6:10:28e::23) To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80f038e9-9112-4c29-7ff8-08da747593e8
X-MS-TrafficTypeDiagnostic: DM6PR10MB2715:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FrdfAK4VmHA/EeiPMcshoP0K3ZuKiRiE+9QC0BEbR6leTMpw+6mrFcQUIkkI99EHSWkKWeWmXq7Lzo8Yjay/iBjPY2vr7Z7VPfcHumKP//1MOg7Uuqu8N+SzfAqBr8LVk8LnJpQaEcEz88d+pm/qjvH5nywhP80EgVRSYLWopzis4zVmXFD+Nptnz9vFWW3KZZRrRkFhoQrU426S6wrWf+fbtmOsOWHC+Zl4O7eE6lTuC8HeU/HPSoBuzDWZ7TvVh7C5vIOjUPgqfhazXfXJAsEjCo6M+oyjQGmQ8uNtsPICkZCocFTplD4N3Y1n7W2s1Wr0e6uvTZ0Pw0Ghbq6N5wZailQHUYYV5v9M7MkOpkjPOYcw8+VSqVSUXeon0rDJgAYLHRbkDVYMYliOLS7Zh0m7ViOEwEyzF9ToiPPx+ppXmDu/CbwLVyCsqjHTHyRawdbCxY60iGKJnn4VLvbjE1DsXbwEOOS8lX0NoaLTycnr8AaPnUXb+CG5JV5VMvaTFTqoe8GOa0aKRSYTgYTIRCoXXZrkcjbYYKF7hCryIYDTzR4+qMxyYVuCRwI+tVDK19NHt+03lrudVBt+gLBN1NC8x1twoxhWpHwdcGY/YAfonZ0dfqdj4puo2We5p8p4edyoWgTGJcyJV0Gro5WYgSs5aZe5DJSKa8t19HaMYkAFW3J2ZGDQwWvKzBTeXu8Q3nT6HvHVOX+SK87pLYCJKK9zVAuWWwmEQoLwCuyAs/bOXrcBQyixnqn94egcPxVq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(136003)(366004)(376002)(346002)(39860400002)(5660300002)(6506007)(41300700001)(6666004)(8936002)(8676002)(66946007)(316002)(38100700002)(86362001)(66556008)(66476007)(2616005)(478600001)(6486002)(2906002)(186003)(83380400001)(4326008)(36756003)(44832011)(6512007)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ONT1xRuTPVJOCk9mPSX8/y5TdZ2cDiocYIUL4gdRbju2HVWDFLaxyTS5zy50?=
 =?us-ascii?Q?ockGs9dNo/G7N5mXOH/++k6nEinUEvSs3A5kELMXpxv9lMVMGg0HLI2Q0avI?=
 =?us-ascii?Q?3mldoZpg4rBIN0BpqkYAGkKMRdaLebqwf2sel0t2zb4IJaPLka6YLjURbYHE?=
 =?us-ascii?Q?UVhFaRWwbHImlWTIMzoscJ/6+pWDwqOlAGhH8HqCTi09jedSmlK8kgYjt5t9?=
 =?us-ascii?Q?fWVBMidj+Q/FBLYcKVEgOTnKEF9fGjtyEOdhk1+MpKF8zLmEHbt/FlL2yDmI?=
 =?us-ascii?Q?uJLGZCsAKL26dRYinxWp6+eAYVfopAAG0nxcp6O1yKEueuaVm61gityxB9Wa?=
 =?us-ascii?Q?7rn9wmwOimDh2Z/LK/DQv0rdiBNErPOcOlNh4WxZS1TDo/LL9o4YdEMLODKm?=
 =?us-ascii?Q?dU/TaqGXpjBp72kMCYY3VvtOE9cqQWRdYJW86RWAHn2c9p5O1l3zIF+Vukqj?=
 =?us-ascii?Q?P79IrtX6MrW1bvo7O0emQZGBIQUd8NDvUuJa8qhxTAbz649Q9v7wc2muHGke?=
 =?us-ascii?Q?9O6RG28+qRHWGB4rskion5mclw34RZVRMFD7OZSQJ9cGNjcxUtK3wPpNdmDI?=
 =?us-ascii?Q?Tl93MbsVZjgZ96+tCQm0AGYT7eex1bkDNMI/G4ODfk45ec/nMy7/ZrHD6+qy?=
 =?us-ascii?Q?gRqo9p66PGLNl6/D7FXzwVGTHBROygAQ8IolXG4u39iWx8N5f+K77qUBSAOf?=
 =?us-ascii?Q?1Nih611bbUQL9ezCK6sHSQiuRhDEzHsdItv4aWKGmixij+WW3g+sDpgBocFk?=
 =?us-ascii?Q?xG6GgAB/AOwAlKQaMAxTaqkJ09dI7Xli19q8Vthz73CNrCuGZwa9tuJPOdwv?=
 =?us-ascii?Q?oBTLGsW+gaY8036UsLh18GynXK/PMxzYrXKd0s52zUH4WODsBiNJqYqxwtgc?=
 =?us-ascii?Q?lR3P7VPN0FC2V0Us1JqgJiwF8wfXxkiNOWOThtO3IwTpm2ERKmLZDbwSWEl+?=
 =?us-ascii?Q?cSY72yqVUa+wVcAnKeG8jRTbo/pkVbBsuxiS2uoEEGfgxC3jQbqvHJmQ8sJc?=
 =?us-ascii?Q?8SLM01kn0AtHl3HFbG9wK4BX6IDXO61CqElGXDxI3bzIjlarD9p9P5PRlGdJ?=
 =?us-ascii?Q?Weq4gRX4B1l8dWw6t0sQP+bwEej9DCcba/EefcICaZn+bvCDDeuVeRJUVhWX?=
 =?us-ascii?Q?jlPKtwPrWDgcA/pTC/prdf8czx/Tn3d1FamQxyeHS2heFxLrwW0LQrvy4BfK?=
 =?us-ascii?Q?uQQsPL2bqR/rk6ohcYg2HfgKg/2U6cLSzKDjEFVv3PY08zG0lidc4wVfDGb3?=
 =?us-ascii?Q?F0jUTzISyaZCPoWP5qV7wAy4T11LLnAxwMg+ndVrsogMJ+t2+ktaJ4Hp3M2G?=
 =?us-ascii?Q?eHZLhZRRkf/Qldi8C5YkUQoZuSvDNF95/5eOQQ1lrEaN6KHoTSrpn/Y4VcTR?=
 =?us-ascii?Q?6kCmN+TRpNN5w03ALuPXmCv4AOgsQwVDE0cLcUpOhxXeH1QctLh49pozrMbc?=
 =?us-ascii?Q?vAHXKG9BLARJInEUY/HX0QIZZdBxEjfvetWj9fAXa4i9Slko+S5yaeUAnw0U?=
 =?us-ascii?Q?YhFvAF6nfzpi0yMf1otJUpFh/IAyC4sOQz68ZwtWA6HM2aWUU9UP/mc1dtcA?=
 =?us-ascii?Q?YlMTQ23sz0qAQMgVmPo8ihgIUc7r0xpEAHHBxkot4g7CeLsJTQIfpyUbOf0O?=
 =?us-ascii?Q?vg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80f038e9-9112-4c29-7ff8-08da747593e8
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 10:55:56.9548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iwK4A0XwfBGE3Jl1vwAj3qA2Ee1DNKyStzI3m2+S4yosSxXSey+oM9cADLdIF1vOmLV7Adpq/eD0/GNfXZStSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB2715
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-02_06,2022-08-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999 phishscore=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2208020051
X-Proofpoint-GUID: LiW6bZd9vlVH7kVNoT4f1acv79pOAvqQ
X-Proofpoint-ORIG-GUID: LiW6bZd9vlVH7kVNoT4f1acv79pOAvqQ
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=darren.kenny@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

This looks good to me...

On Tuesday, 2022-08-02 at 15:37:20 +08, zhenwei pi wrote:
> Originally we have to get all the vCPU registers and parse the
> specified one. To improve the performance of this usage, allow user
> specified vCPU id to query registers.
>
> Run a VM with 16 vCPU, use bcc tool to track the latency of
> 'hmp_info_registers':
> 'info registers -a' uses about 3ms;
> 'info registers 12' uses about 150us.
>
> Cc: Darren Kenny <darren.kenny@oracle.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

Thanks,

Darren.

> ---
>  hmp-commands-info.hx |  8 +++++---
>  monitor/misc.c       | 10 ++++++++--
>  2 files changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index 188d9ece3b..e012035541 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -100,9 +100,11 @@ ERST
>  
>      {
>          .name       = "registers",
> -        .args_type  = "cpustate_all:-a",
> -        .params     = "[-a]",
> -        .help       = "show the cpu registers (-a: all - show register info for all cpus)",
> +        .args_type  = "cpustate_all:-a,vcpu:i?",
> +        .params     = "[-a|vcpu]",
> +        .help       = "show the cpu registers (-a: show register info for all cpus;"
> +                      " vcpu: specific vCPU to query; show the current CPU's registers if"
> +                      " no argument is specified)",
>          .cmd        = hmp_info_registers,
>      },
>  
> diff --git a/monitor/misc.c b/monitor/misc.c
> index 3d2312ba8d..6436a8786b 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -307,6 +307,7 @@ int monitor_get_cpu_index(Monitor *mon)
>  static void hmp_info_registers(Monitor *mon, const QDict *qdict)
>  {
>      bool all_cpus = qdict_get_try_bool(qdict, "cpustate_all", false);
> +    int vcpu = qdict_get_try_int(qdict, "vcpu", -1);
>      CPUState *cs;
>  
>      if (all_cpus) {
> @@ -315,13 +316,18 @@ static void hmp_info_registers(Monitor *mon, const QDict *qdict)
>              cpu_dump_state(cs, NULL, CPU_DUMP_FPU);
>          }
>      } else {
> -        cs = mon_get_cpu(mon);
> +        cs = vcpu >= 0 ? qemu_get_cpu(vcpu) : mon_get_cpu(mon);
>  
>          if (!cs) {
> -            monitor_printf(mon, "No CPU available\n");
> +            if (vcpu >= 0) {
> +                monitor_printf(mon, "CPU#%d not available\n", vcpu);
> +            } else {
> +                monitor_printf(mon, "No CPU available\n");
> +            }
>              return;
>          }
>  
> +        monitor_printf(mon, "\nCPU#%d\n", cs->cpu_index);
>          cpu_dump_state(cs, NULL, CPU_DUMP_FPU);
>      }
>  }
> -- 
> 2.20.1

