Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 736BE4B6F80
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 16:07:14 +0100 (CET)
Received: from localhost ([::1]:46984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJzQ9-0007um-0i
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 10:07:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nJzOS-0006Nw-PY
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 10:05:28 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:65246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nJzOO-0005Ic-Na
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 10:05:27 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21FEi1et014275; 
 Tue, 15 Feb 2022 15:04:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=YiA/DrP9SEX7oqG5ONHNxPcq9Lbjv8Yim5iVjYApaU8=;
 b=mJW80n7HZCmh1KuETZt3VmonHrap1eRLdrra4z1Os38KJMeWAtruzmBP/J8QJui8OLs2
 9t0qsROt/Y1I9q9/YtQxLeumq8Vynni+HA80NHauyMzlauhCCPjSu8TnK5UXqkuUJ286
 CAFdsNsU/hJWHWIXsAj3/Ah7e3sitNvQ2ijcp7xZdd09dUijiioegSIPhHbalN3V8TsO
 5yN1r0oIj83u4ALtNkuIOb3JV9+GH8ijKMud/3W6WUth1aRgmt0X17va48ai02r/Qzfr
 PWKKgU7o4KjmuNJNXZTB6GIWGC2hfabzRwPhXIM50vYJE9PV5EzFOD7adFX9CX76F2eQ Fg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e8570skqf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 15:04:45 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21FF0UMx008531;
 Tue, 15 Feb 2022 15:04:44 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
 by aserp3030.oracle.com with ESMTP id 3e62xerfe0-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 15:04:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HkdY+2+B4CJYeE2boFJd+kbSXlSpIEJvu2Ax9IoUqSW9LR0p1nKYQ3RXUt6da/TYsOGdP70qDhkh8Oak400jE1zQOUbiWe4MEDdiXLZW3gYU09QDoIADJjWXgdFTZMjvREjPHfu/fQrLqJJblnqhPTj3FNG7IUFXIZM1vdMx0shvqmFJW3FlTQj9VEj+nUECNLeY3atAFvJB3kn2JbBO67B5mUhRELB3EwQEQCg45vOniXnWnWstIUyfEipdzVuHNHHij7GNVEumMuXosXPomityAsaDYm3Odg1+de+kJQiMtfULVNuXN1pwpnYUeoOsNRFKdMMANeNwC++SYqcpkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YiA/DrP9SEX7oqG5ONHNxPcq9Lbjv8Yim5iVjYApaU8=;
 b=hNGl97WLEghvNiBgmPmI866ChLZzKZ24WzHegjS+iRQMwaS4OexIT3FYndLBBxUlKo6Jp0VCAPNRowq2ysMx43PXi2HpIkCV1RdgPgK890/Q7HZ6N3vEvUl1Rjzhsni42BZhzRHE2wdEdYyIUGe5jD45NKiK0aUVx7/D2JUbLFw72nCMtHpRyBCHpPttAudoxlyeonYGrKkRP1shlv9npuueN/pSF/tZH6JWNgHcwPzVZu4wH8+y2LsU4GCHX82lyPlkbVReUcRC25kPQsLdhXHCYyUsa9qcQeM/j2Do8cpb3Zx6ECIIzHneRM3gPg4o1ALq1PvVXi9uJIX4kOnAEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YiA/DrP9SEX7oqG5ONHNxPcq9Lbjv8Yim5iVjYApaU8=;
 b=mfF2rOQgtzAmQgGlGk0PAD/AbQ1G2IWLeGjWG9xNfF1prFd6TkuMy+YjReL1UHM/OFq21pCQlbqbeTizfzFnhZkU+KuVPF9E/h1Tqc0A25gSO450NjCGBvJgOQdp+PRrLmsOryhp1gaZ4Fujvfg4TKlbKZri4jS6IMhsBE+NMlA=
Received: from SA1PR10MB5841.namprd10.prod.outlook.com (2603:10b6:806:22b::16)
 by DM6PR10MB3865.namprd10.prod.outlook.com (2603:10b6:5:1d3::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12; Tue, 15 Feb
 2022 15:04:42 +0000
Received: from SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::58ef:3181:b9d4:b716]) by SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::58ef:3181:b9d4:b716%5]) with mapi id 15.20.4951.016; Tue, 15 Feb 2022
 15:04:42 +0000
From: Mark Kanda <mark.kanda@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/3] hmp: Support for querying stats
Date: Tue, 15 Feb 2022 09:04:32 -0600
Message-Id: <20220215150433.2310711-3-mark.kanda@oracle.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220215150433.2310711-1-mark.kanda@oracle.com>
References: <20220215150433.2310711-1-mark.kanda@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0038.namprd04.prod.outlook.com
 (2603:10b6:806:120::13) To SA1PR10MB5841.namprd10.prod.outlook.com
 (2603:10b6:806:22b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46ef3c01-abcb-4e1b-17c5-08d9f0947eb8
X-MS-TrafficTypeDiagnostic: DM6PR10MB3865:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB38659B4685B6EA11AEA69DCEF9349@DM6PR10MB3865.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:165;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OXncg3KkURBlNeWFalt9i/dpaaFVCDRCW7nWvNfez7CDoGYJsu9874DC4d7CThfTUxTk8lfifJeoQpOVJUCrS+GFO7tiomVRarGfnTmnQrw9lY6jB6tYext6SCUQVUMPZpfsxf4icyrUX2EvkQwzM67vKg9k16yCsBR830tVrz+n7qN/rd2kxJevMleLOZCanmy3ujW5SfPMkRb9/imMq52eAoY8YqYy9LkzVz7qMm7VEnN6UroQz48XhFTPkf9++aHTLCBVqV846KGuGJpgdNcU6z1u9vzXwyNQnrjVTtOmB+ab1i/DntAQRIHKGNyzHAtGiUxkdoDqRSb46aJSx11D3MNDnePCcHFYm64kvP5zIhvXYmuRkb1mia1iOMfYk336b+WWdylcBPI10ChgAr3xQBSHvvuUSqgM7nYjSR0MhH7WiEojs/muju1zWzU5/isLiNopVEd1/Bng7+Jm3U9yP8iSlFaXmwrGX6+R8OGmhpqi1jc/hMOIUJEJb3S81IWduZcSZLeFxX6N3mThHejq1FY6aaUGaXuaD2vOPTnVk2AXrMrswWLvWlXJuV+ql81FxSa80ZhbeIhxBJqMUYacm4tCcR0x+3GCQAAqiKu03d4CMHCyVnezyD3TK3m0pPM93amZgSHKE5uNZFLbBLH249919JYFIbEVkPZYaVzsp7BTWwtVM+hQ+aE9s4aRYpCb+4G0qD4TTGjivZeFLA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR10MB5841.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(107886003)(2616005)(8676002)(1076003)(66476007)(26005)(6512007)(66556008)(86362001)(6916009)(52116002)(66946007)(6486002)(316002)(6666004)(508600001)(36756003)(83380400001)(44832011)(38350700002)(38100700002)(4326008)(5660300002)(186003)(8936002)(2906002)(30864003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1oWwkfqmqvO6vdxuPOG3zABdOx28Oa+atWdVgu8NZxg88NCYh2xR6FpJuqAK?=
 =?us-ascii?Q?wg2Wn0T4S5+L7G9zGA7y0sCBQRMaz64XU/v6/8suakC6WO1gtroh6fsMvxR9?=
 =?us-ascii?Q?SYQR/0u9NSRCuDzL7ZZh9L8taEyXeJHe72PWEHlbEshLH1r+jUTF6G8X2T0/?=
 =?us-ascii?Q?izt6Yx7iIDHD0yPgJQA+sfqzcIErSbMrfzy53C7xv+TBkgB/URGnfAnD4F6m?=
 =?us-ascii?Q?dVlJVhsmCESPe0sFyPbfFLlkEhbVAC2bFyMbSeT1adpDjGhLm11gij/O4ZEL?=
 =?us-ascii?Q?0mgHjRF9zQOzmLTQoQmoNPDvsUCUVm5uWVVvBeymvxRo2mGMwkQ5c689Zqx5?=
 =?us-ascii?Q?B6/fHNsHVpWRC0fviZ3bNZNJaQcd4qkdgwBDnRW8PNx0HEUr6eC481MYNFny?=
 =?us-ascii?Q?WmmZfg0mlPjZbuLvn8+K/tJazuiugzWRXM6WMhoqvCEE/nRJlqsDjIhVsMvw?=
 =?us-ascii?Q?1Wyil7pLqJSlCPaGpJ9OeZnuwEjNpboFFSBs4rOmckpHDsumUEGqOl/+H4Ku?=
 =?us-ascii?Q?epm2Cf5TtaGKo6bJguvZm0JIZcSEusU7u3/No9EoGV36CxsRgGs+IGRHpz8N?=
 =?us-ascii?Q?Az8CjeYQplLcJybwZr8NuyLdKNxdMozA03duTRL2YAJoFKRBrkp6tsVn0nek?=
 =?us-ascii?Q?a5yYK2vb30Urdh61H5XL1PNfON0Wvy7YLJC0wueNsrEkM1Jy2uAj5GcU11EP?=
 =?us-ascii?Q?mLzv/poj3dQCr+t2FN1bzvUT0F1aKszVm846Jpmn/TxqfWJkN3uO//TQP/84?=
 =?us-ascii?Q?3LQNtb4WjYQcPi+jDQZNmN33blSy3WtkeLYb/rNJRCwp79fAML3ZZWZpVu1K?=
 =?us-ascii?Q?MJsO0398YJIw2ylqOH0qJ/5LYaVcLlR+soOFtzBeAEX9ZDp9REwzvfxwS+cm?=
 =?us-ascii?Q?QcMaYiqvwwWg8oLxVklDskaJq1Le4EjjsVJVSjqs3zgRtz7Wi7Nly407GvKF?=
 =?us-ascii?Q?L9iQBfD8kYYgUC90agc3y5xSK6byp9lECRTkFY/KmQCHALs0b1zcbtGSSxBt?=
 =?us-ascii?Q?JXv7itelgdJpeyC4GffMdb38G09/3VT++taobhOy9WnY2W87HcknGz+ilOCE?=
 =?us-ascii?Q?JMYJrhoNS8MCnznvtnoHNN9KIRn0jDtkFKxaYKAua5cmhpBWoi1VKUoFLvP3?=
 =?us-ascii?Q?PddLleCcy2Uh/G7DXZubenqRMYqio9vYEw5nWgJa0gdw27Jr4dmU2T7EAxqN?=
 =?us-ascii?Q?2vOgmqkZ+4BDFKhyxn9FVn9PQSX69lPt5ymokA0DusHWMnhkib/rx4ZYePZU?=
 =?us-ascii?Q?xceAduWb+yy6XeMNoz1eRUdtegOeUXsHSFVNTROC30CkW/29JlhJ0xBZvrjT?=
 =?us-ascii?Q?ZGWvVce1HUWSLv0oVP4FgJx5PsRt0J3CCrnZ1hIeW4jx2zPmcb8nNwLIOp+1?=
 =?us-ascii?Q?Ca9s+MdggTI7AcfpPAL3uhXZSUfyEANsZoL/71sP0suQ3iSrqXt4SRPGxl3B?=
 =?us-ascii?Q?Nm9zEHvFzIu+vpqykI3/NVTkTuAE+lXe3UMsga4H49P74ze7dm2roO004Pja?=
 =?us-ascii?Q?DSxOsd6IiB5MvJKnNjuExqmRqUrcikq8xadigBtJ7GpOaRo5x3A2cGSgZ1D4?=
 =?us-ascii?Q?72/AmP0EYWEzBm7LoKbc69koDYmNsDq1mlyAthwk0RTSfumgYE3Mijh42LGC?=
 =?us-ascii?Q?UWcyD+ixlDB4vglKOq92iDA=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46ef3c01-abcb-4e1b-17c5-08d9f0947eb8
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB5841.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 15:04:42.4892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FUxOiZcPwmCu4PxZRH+DMmPJQvh9ciGt20QjaYn399NkLIEX2GCFjeEXbo8pS3x6DAqhgVJ40Ea/iHVqIgdRbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3865
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10258
 signatures=673431
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202150088
X-Proofpoint-ORIG-GUID: b4K72x2PClYEvKKwJ0YEwXoCd2kpRtO-
X-Proofpoint-GUID: b4K72x2PClYEvKKwJ0YEwXoCd2kpRtO-
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=mark.kanda@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Leverage the QMP support for querying stats. The interface supports similar
arguments as the QMP interface. Wildcard char (*) is accepted for names and
stats target.

Examples (with fd-based KVM stats):

- Display all stats
(qemu) info stats
vm
  provider: kvm
    max_mmu_page_hash_collisions (peak): 0
    max_mmu_rmap_size (peak): 0
...
vcpu (qom path: /machine/unattached/device[0])
  provider: kvm
    guest_mode (instant): 0
    directed_yield_successful (cumulative): 0
...

(qemu) info stats-schemas
vm
  provider: kvm
    max_mmu_page_hash_collisions (peak)
    max_mmu_rmap_size (peak)
...
vcpu
  provider: kvm
    guest_mode (instant)
    directed_yield_successful (cumulative)

- Display 'halt_wait_ns' and 'exits' for vCPUs with qom paths
/machine/unattached/device[2] and /machine/unattached/device[4]:

(qemu) info stats exits,halt_wait_ns /machine/unattached/device[2],
/machine/unattached/device[4]

vcpu (qom path: /machine/unattached/device[2])
  provider: kvm
    exits (cumulative): 52369
    halt_wait_ns (cumulative nanoseconds): 416092704390
vcpu (qom path: /machine/unattached/device[4])
  provider: kvm
    exits (cumulative): 52550
    halt_wait_ns (cumulative nanoseconds): 419637402657

- Display all VM stats for provider KVM:

(qemu) info stats * vm kvm
vm
  provider: kvm
    max_mmu_page_hash_collisions (peak): 0
    max_mmu_rmap_size (peak): 0
    nx_lpage_splits (instant): 51
...

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
---
 hmp-commands-info.hx  |  28 ++++
 include/monitor/hmp.h |   2 +
 monitor/hmp-cmds.c    | 328 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 358 insertions(+)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index e90f20a107..c0ad3a3e2a 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -879,3 +879,31 @@ SRST
   ``info sgx``
     Show intel SGX information.
 ERST
+
+    {
+        .name       = "stats",
+        .args_type  = "names:s?,vcpus:s?,provider:s?",
+        .params     = "[names] [vcpus] [provider]",
+        .help       = "show statistics; optional comma separated names, "
+	              "vcpu qom paths, and provider",
+        .cmd        = hmp_info_stats,
+    },
+
+SRST
+  ``stats``
+    Show stats
+ERST
+
+    {
+        .name       = "stats-schemas",
+        .args_type  = "provider:s?",
+        .params     = "[provider]",
+        .help       = "show statistics schema for each provider",
+        .cmd        = hmp_info_stats_schemas,
+    },
+
+SRST
+  ``stats-schemas``
+    Show stats per schema
+ERST
+
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 96d014826a..a748511105 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -133,5 +133,7 @@ void hmp_info_dirty_rate(Monitor *mon, const QDict *qdict);
 void hmp_calc_dirty_rate(Monitor *mon, const QDict *qdict);
 void hmp_human_readable_text_helper(Monitor *mon,
                                     HumanReadableText *(*qmp_handler)(Error **));
+void hmp_info_stats(Monitor *mon, const QDict *qdict);
+void hmp_info_stats_schemas(Monitor *mon, const QDict *qdict);
 
 #endif
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 8c384dc1b2..2a8f1432fb 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -40,6 +40,7 @@
 #include "qapi/qapi-commands-pci.h"
 #include "qapi/qapi-commands-rocker.h"
 #include "qapi/qapi-commands-run-state.h"
+#include "qapi/qapi-commands-stats.h"
 #include "qapi/qapi-commands-tpm.h"
 #include "qapi/qapi-commands-ui.h"
 #include "qapi/qapi-visit-net.h"
@@ -2178,3 +2179,330 @@ void hmp_info_memory_size_summary(Monitor *mon, const QDict *qdict)
     }
     hmp_handle_error(mon, err);
 }
+
+static void print_stats_schema_value(Monitor *mon, StatsSchemaValue *value)
+{
+    monitor_printf(mon, "    %s (%s", value->name, StatsType_str(value->type));
+
+    if (value->unit == STATS_UNIT_SECONDS &&
+        value->exponent >= -9 && value->exponent <= 0 &&
+        value->exponent % 3 == 0 && value->base == STATS_BASE_POW10) {
+
+        const char *si_prefix[] = { "", "milli", "micro", "nano" };
+        monitor_printf(mon, " %s", si_prefix[value->exponent / -3]);
+
+    } else if (value->unit == STATS_UNIT_BYTES &&
+        value->exponent >= 0 && value->exponent <= 40 &&
+        value->exponent % 10 == 0 && value->base == STATS_BASE_POW2) {
+
+        const char *si_prefix[] = {
+            "", "kilo", "mega", "giga", "tera" };
+        monitor_printf(mon, " %s", si_prefix[value->exponent / 10]);
+
+    } else if (value->exponent) {
+        /* Print the base and exponent as "x <base>^<exp>" */
+        monitor_printf(mon, " x %s^%d", StatsBase_str(value->base),
+                       value->exponent);
+    }
+
+    /* Don't print "none" unit type */
+    monitor_printf(mon, "%s)", value->unit == STATS_UNIT_NONE ?
+                   "" : StatsUnit_str(value->unit));
+
+    /* Print bucket size for linear histograms */
+    if ((value->type == STATS_TYPE_LINEAR_HIST) && value->has_bucket_size) {
+        monitor_printf(mon, " bucket-size=%d", value->bucket_size);
+    }
+}
+
+static StatsSchemaValueList *find_schema_value_list(
+    StatsSchemaProviderList *list, StatsProvider provider)
+{
+    StatsSchemaProviderList *schema_provider_list;
+
+    for (schema_provider_list = list;
+         schema_provider_list;
+         schema_provider_list = schema_provider_list->next) {
+        if (schema_provider_list->value->provider == provider) {
+            return schema_provider_list->value->stats;
+        }
+    }
+    return NULL;
+}
+
+static void print_stats_results(Monitor *mon, StatsTarget type,
+                                StatsResultsEntryList *list,
+                                StatsSchemaProviderList *schema)
+{
+    StatsResultsEntryList *results_entry_list;
+
+    for (results_entry_list = list;
+         results_entry_list;
+         results_entry_list = results_entry_list->next) {
+
+        StatsResultsEntry *results_entry = results_entry_list->value;
+        /* Find provider schema */
+        StatsSchemaValueList *schema_value_list =
+            find_schema_value_list(schema, results_entry->provider);
+        StatsList *stats_list;
+
+        if (!schema_value_list) {
+            monitor_printf(mon, "failed to find schema list for %s\n",
+                           StatsProvider_str(results_entry->provider));
+            return;
+        }
+
+        monitor_printf(mon, "  provider: %s\n",
+                       StatsProvider_str(results_entry->provider));
+
+        for (stats_list = results_entry->stats;
+             stats_list;
+             stats_list = stats_list->next,
+                 schema_value_list = schema_value_list->next) {
+
+            Stats *stats = stats_list->value;
+            StatsValue *stats_value = stats->value;
+            StatsSchemaValue *schema_value = schema_value_list->value;
+
+            /* Find schema entry */
+            while (!g_str_equal(stats->name, schema_value->name)) {
+                if (!schema_value_list->next) {
+                    monitor_printf(mon, "failed to find schema entry for %s\n",
+                                   stats->name);
+                    return;
+                }
+                schema_value_list = schema_value_list->next;
+                schema_value = schema_value_list->value;
+            }
+
+            print_stats_schema_value(mon, schema_value);
+
+            if (stats_value->type == QTYPE_QNUM) {
+                monitor_printf(mon, ": %" PRId64 "\n", stats_value->u.scalar);
+            } else if (stats_value->type == QTYPE_QDICT) {
+                uint64List *list;
+                int i;
+
+                monitor_printf(mon, ": ");
+                for (list = stats_value->u.list.values, i = 1;
+                     list;
+                     list = list->next, i++) {
+                    monitor_printf(mon, "[%d]=%" PRId64 " ", i, list->value);
+                }
+                monitor_printf(mon, "\n");
+            }
+        }
+    }
+}
+
+static const char wildcard[] = "*";
+static StatsFilter *stats_filter(StatsTarget target, const char *names,
+                                 const char *vcpus, StatsProvider provider)
+{
+    StatsFilter *filter = g_malloc0(sizeof(*filter));
+    filter->target = target;
+
+    switch (target) {
+    case STATS_TARGET_VM:
+    {
+        StatsRequestList *request_list = NULL;
+        StatsRequest *request = g_malloc0(sizeof(*request));
+
+        if (names && !g_str_equal(names, wildcard)) {
+            request->fields = strList_from_comma_list(names);
+            request->has_fields = true;
+        }
+        if (provider != STATS_PROVIDER__MAX) {
+            request->provider = provider;
+            request->has_provider = true;
+        }
+
+        QAPI_LIST_PREPEND(request_list, request);
+        filter->u.vm.filters = request_list;
+        filter->u.vm.has_filters = true;
+        break;
+    }
+    case STATS_TARGET_VCPU:
+    {
+        StatsRequestList *request_list = NULL;
+        StatsRequest *request = g_malloc0(sizeof(*request));
+        if (names && !g_str_equal(names, wildcard)) {
+            request->fields = strList_from_comma_list(names);
+            request->has_fields = true;
+        }
+        if (provider != STATS_PROVIDER__MAX) {
+            request->provider = provider;
+            request->has_provider = true;
+        }
+
+        if (vcpus && !g_str_equal(vcpus, wildcard) &&
+            !g_str_equal(vcpus, StatsTarget_str(STATS_TARGET_VCPU))) {
+            filter->u.vcpu.vcpus = strList_from_comma_list(vcpus);
+            filter->u.vcpu.has_vcpus = true;
+        }
+
+        QAPI_LIST_PREPEND(request_list, request);
+        filter->u.vcpu.filters = request_list;
+        filter->u.vcpu.has_filters = true;
+        break;
+    }
+    default:
+        break;
+    }
+    return filter;
+}
+
+void hmp_info_stats(Monitor *mon, const QDict *qdict)
+{
+    const char *names = qdict_get_try_str(qdict, "names");
+    const char *vcpus = qdict_get_try_str(qdict, "vcpus");
+    const char *provider = qdict_get_try_str(qdict, "provider");
+
+    StatsProvider stats_provider = STATS_PROVIDER__MAX;
+    StatsTarget target;
+    Error *err = NULL;
+
+    if (provider) {
+        for (stats_provider = 0; stats_provider < STATS_PROVIDER__MAX;
+             stats_provider++) {
+            if (g_str_equal(StatsProvider_str(stats_provider), provider)) {
+                break;
+            }
+        }
+        if (stats_provider == STATS_PROVIDER__MAX) {
+            monitor_printf(mon, "invalid stats filter provider %s\n",
+                           provider);
+            goto exit;
+        }
+    }
+
+    for (target = 0; target < STATS_TARGET__MAX; target++) {
+        StatsResults *stats_results = NULL;
+        StatsSchemaResults *schema_results = NULL;
+        StatsResultsVCPUEntryList *results_entry_list;
+
+        StatsFilter *filter = stats_filter(target, names, vcpus,
+                                           stats_provider);
+        switch (target) {
+        case STATS_TARGET_VM:
+            if (vcpus && !g_str_equal(vcpus, wildcard) &&
+                !g_str_equal(vcpus, StatsTarget_str(STATS_TARGET_VM))) {
+                break;
+            }
+            stats_results = qmp_query_stats(filter, &err);
+            if (err) {
+                goto exit;
+            }
+            schema_results =
+                qmp_query_stats_schemas(provider ? true : false,
+                                        stats_provider, &err);
+            if (err) {
+                goto exit;
+            }
+            if (!stats_results->has_vm) {
+                break;
+            }
+            monitor_printf(mon, "%s\n", StatsTarget_str(STATS_TARGET_VM));
+            print_stats_results(mon, STATS_TARGET_VM, stats_results->vm,
+                                schema_results->vm);
+
+           break;
+        case STATS_TARGET_VCPU:
+            stats_results = qmp_query_stats(filter, &err);
+            if (err) {
+                goto exit;
+            }
+            schema_results =
+                qmp_query_stats_schemas(provider ? true : false,
+                                        stats_provider, &err);
+            if (err) {
+                goto exit;
+            }
+            for (results_entry_list = stats_results->vcpus;
+                 results_entry_list;
+                 results_entry_list = results_entry_list->next) {
+                monitor_printf(mon, "%s (qom path: %s)\n",
+                               StatsTarget_str(STATS_TARGET_VCPU),
+                               results_entry_list->value->path);
+
+                print_stats_results(mon, STATS_TARGET_VCPU,
+                                    results_entry_list->value->providers,
+                                    schema_results->vcpu);
+            }
+            break;
+        default:
+            break;
+        }
+        qapi_free_StatsFilter(filter);
+        qapi_free_StatsSchemaResults(schema_results);
+        qapi_free_StatsResults(stats_results);
+    }
+
+exit:
+    if (err) {
+        monitor_printf(mon, "%s\n", error_get_pretty(err));
+        error_free(err);
+    }
+}
+
+static void print_stats_schema_list(Monitor *mon, StatsSchemaProviderList *list)
+{
+    StatsSchemaProviderList *schema_provider_list;
+
+    for (schema_provider_list = list;
+         schema_provider_list;
+         schema_provider_list = schema_provider_list->next) {
+
+        StatsSchemaProvider *schema_provider =
+            schema_provider_list->value;
+        monitor_printf(mon, "  provider: %s\n",
+                       StatsProvider_str(schema_provider->provider));
+
+        StatsSchemaValueList *schema_value_list;
+        for (schema_value_list = schema_provider->stats;
+             schema_value_list;
+             schema_value_list = schema_value_list->next) {
+
+            StatsSchemaValue *schema_value = schema_value_list->value;
+            print_stats_schema_value(mon, schema_value);
+            monitor_printf(mon, "\n");
+        }
+    }
+}
+
+void hmp_info_stats_schemas(Monitor *mon, const QDict *qdict)
+{
+    const char *provider = qdict_get_try_str(qdict, "provider");
+    StatsProvider stats_provider = STATS_PROVIDER__MAX;
+    StatsSchemaResults *schema_result;
+    Error *err = NULL;
+
+    if (provider) {
+        for (stats_provider = 0; stats_provider < STATS_PROVIDER__MAX;
+             stats_provider++) {
+            if (g_str_equal(StatsProvider_str(stats_provider), provider)) {
+                break;
+            }
+        }
+        if (stats_provider == STATS_PROVIDER__MAX) {
+            monitor_printf(mon, "invalid stats filter provider %s\n", provider);
+            return;
+       }
+    }
+
+    schema_result =
+        qmp_query_stats_schemas(provider ? true : false, stats_provider, &err);
+
+    if (err) {
+        monitor_printf(mon, "%s\n", error_get_pretty(err));
+        error_free(err);
+        return;
+    }
+
+    monitor_printf(mon, "%s\n", StatsTarget_str(STATS_TARGET_VM));
+    print_stats_schema_list(mon, schema_result->vm);
+    monitor_printf(mon, "%s\n", StatsTarget_str(STATS_TARGET_VCPU));
+    print_stats_schema_list(mon, schema_result->vcpu);
+
+    qapi_free_StatsSchemaResults(schema_result);
+}
-- 
2.27.0


