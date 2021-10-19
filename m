Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01069433FD1
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 22:32:18 +0200 (CEST)
Received: from localhost ([::1]:41990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcvmU-0004Qb-1M
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 16:32:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1mcvjZ-00038k-2E
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 16:29:17 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:32250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1mcvjW-0008A4-PE
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 16:29:16 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19JKKARE029622; 
 Tue, 19 Oct 2021 20:29:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=xJEIy3rw1rjyK/wnZmEL826a9Pef7rV2Ys7dNYvT+po=;
 b=mvQMfUpUcPi3bXYzUy8lpYCQVw3gv3Uo+uUDMZpmr7U21/31Fgfw2ECoIle8CxxcpJFO
 94J/3A39aiBb8TrVsvd+CvKiCqWl2F4rqbx6xYUrTYV8bskbOaXC19q0dzcMjktift/+
 /GFRujGcV/8v9ZwHOJn3BKRYpVnt0rmU1BjPTc80GVl3mkIMlypJtDsP+mgf7XpSHyle
 /q9KO0ua7MdAyKReg1mdUifYHjNjsFI6it6npCmWcCOvAbkEK/olQm565+is5WlMSSiJ
 gUHNnogrE7Fm9LWEhnPU3BjwEz7fSwKRKjk8wOyJWhF7Uk8Lxm5NTCavtr/T9hNaft6l 5w== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bsrefd1yr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Oct 2021 20:29:11 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19JKGn0V182179;
 Tue, 19 Oct 2021 20:29:11 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
 by aserp3030.oracle.com with ESMTP id 3bqmsfc8vm-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Oct 2021 20:29:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qkrh/i5wS9OVxEZQgkWWtmFhA16lzCc1zDT+bTGbkNvcUBcRng2wYQQR13dVUq92itTQOLyqiILq1TpejS/4BoKrBbSOmOq2973f76l0Nf+4bABbDhC0GDDYxBKLF4YTeGQt7Zr0lS6FD9jEce+m15zmEEH+P+gVsUTha3hPDaXD784VpVheP6sBCkAeKNp4GWIsLGks2gu9BdGmgS+F+i+r7fM6d5LZV7UaO097tmCnos+5Xf5sTXFRJSfqm0ZDa08Dx8DW7fjRq7WzBs7R3iigs4jYz3Wc5I/j3AAlbgBoWb/zud6iuoQ9WpjoIP+3EF0cKsR14X+1GrqwdCmsCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xJEIy3rw1rjyK/wnZmEL826a9Pef7rV2Ys7dNYvT+po=;
 b=inI86T6UbJ8vFkcc4Qd5ljqt/gMi57WeNLNNQNZyl6y3fFNBFeNHJG7JXYYSsxk/35ZW2TdL8n8DkRb+IAl7lUX9BCCZwUmdImniDhBBkWHaeSwqE/5YsMmiX9ZoPusU/fjDfWiApacwregwOY5N5dD5G/z8LCGM5pjtz1CC1oJlLyzvqlHqEFkJbuf4zsB+cHf7d4G3x4rtD6tMBndkO0ME6S1yhcw/ChMdYaCtJecK6eZcoGizO9CffueKxkb/rc/iZaUmTPlsojHHb10xMxVdtLG+PiHVPflojyhnzeDWFZZTcqjWyi+2DuyIOFu4rWGwRUMBhfP5cP5RFmCU4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xJEIy3rw1rjyK/wnZmEL826a9Pef7rV2Ys7dNYvT+po=;
 b=xN4l2KDf217+ntLfI0WoDLgKMD2h0tvjeZO9H+8Xu5qBFFQLoJw4JL4c1QAM2m6olQ7lFo8+xhJtdxk9hAKlIVAIYsiHr3ivvgMx2zmsnC+Dg9z1UkmD7slgh7d/sb2rvE1K2hIbm2OeXvHpy0kEyGeaIz1F7uhjw2w84rhvlwI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from SN6PR10MB2448.namprd10.prod.outlook.com (2603:10b6:805:41::18)
 by SA2PR10MB4681.namprd10.prod.outlook.com (2603:10b6:806:fb::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 20:29:09 +0000
Received: from SN6PR10MB2448.namprd10.prod.outlook.com
 ([fe80::2c40:de5b:9f20:4604]) by SN6PR10MB2448.namprd10.prod.outlook.com
 ([fe80::2c40:de5b:9f20:4604%5]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 20:29:09 +0000
From: Mark Kanda <mark.kanda@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] hmp: Support fd-based KVM stats query
Date: Tue, 19 Oct 2021 15:29:04 -0500
Message-Id: <20211019202904.4857-3-mark.kanda@oracle.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211019202904.4857-1-mark.kanda@oracle.com>
References: <20211019202904.4857-1-mark.kanda@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7P220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::31) To SN6PR10MB2448.namprd10.prod.outlook.com
 (2603:10b6:805:41::18)
MIME-Version: 1.0
Received: from linux-1.us.oracle.com (137.254.7.181) by
 SN7P220CA0026.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.15 via Frontend Transport; Tue, 19 Oct 2021 20:29:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6589c44-a79c-4367-5309-08d9933f1b11
X-MS-TrafficTypeDiagnostic: SA2PR10MB4681:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR10MB4681BFC4831504C5969E207FF9BD9@SA2PR10MB4681.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:510;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bjUFWGtqCMv1EjTv5FVZtvCd1mdGseuZeiotVLp5H4E+e4cn8SSExNgOIbUaxuHHIouw4nwwbY/Fh5tyC/hEZkiJfPqJF3MQAfKLuIxxowQjuPn9N5VK8XJO0ezanHgaiT5BFMI2OxPSx7hMscWZsYhs2QyvCLYwI26yr9RjnC4SbG0uOHIN2bUWEpkzkJXBuhObZTKn77FnpvPL6/13THpr2w3SlFedL7MtfyUX9KiMdSSG6SqXveZlsQps+7ebiJObpMsxTV7OyQgzN9nKlElwdN5OOPyaTmrBezzk4gtb7jBy5miW57xI3NjBDoeCKVfgG7yUXCAfevG5ME7HQJyuFY31SdmrR8O30zNyYwde8cOb91EcQKOkyhjwZytP/1+L89Rl/53BhMEaXmlTqTH6S8r/wVzkH4WPwwquJZ2xP2GtDJkYjw+XWz5rPgbFw/fFMxAys9Wv4gwOO+8NAKqsDxtR1csA8uK79e/NzxDPZ7+bjpRnDlv9QftvO878N8/+wyEZGSU5fVs1YOB/w7Krv1zPWE/ZizLkcl2pPr70Oji1+Zs+ED5CIxbHIZd7m98gU7rTx4UBi7rDQxPZOCzWRafsZseX5hUpR9T9Hjaig5t3BrxprXk5z83Rnuigz5ZH22hWBmSEOYk1yu87A6wcHKHql/Niwz2Si3yybod2sBus2I3xwCOhxR7lC8wxVh9uxYupEqYAUeFVFkT9NA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR10MB2448.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6916009)(86362001)(316002)(8936002)(52116002)(7696005)(956004)(66946007)(6666004)(186003)(6486002)(66476007)(2906002)(38350700002)(26005)(44832011)(5660300002)(2616005)(4326008)(508600001)(36756003)(66556008)(107886003)(1076003)(38100700002)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L34kOj6FvQakrdMqLglmANjLxbIrmN9ZmwK+r/HJ6q2j5UR8GncO/rv0L7Az?=
 =?us-ascii?Q?eKzFSbHNeczawHDnScUzRsW7t19iPZSodHhbQ/ySMMktTW42LsByeDCljW+6?=
 =?us-ascii?Q?3+t4bQGbLkLYKvgyK3a6phXecA3Mgrii0B/ZuTlq/rZsZvFG0oxtn8fTPhMc?=
 =?us-ascii?Q?Hb5fK+K25ZD5H9GGH84Nd/ViR8BW9jYf5I/QpCkVDFZ0yP1gr+qLAxMuA9mP?=
 =?us-ascii?Q?RYBXeKVoRcW104nQuFQgPeFEhIsV7lKwvwg8EFMrNjscTEFx+QVhQACep0WN?=
 =?us-ascii?Q?6wHN+U54HPA0RnJ2/kWaxXDwbPuBYby/Jhe2/YlEDWZsDQ1HyvpGuu41xfoV?=
 =?us-ascii?Q?t5k+YKt3GAeqL1hlk1dU67xLi5i95L4P6dlcdyUCs3KWAb+9fdiywOYTB7ER?=
 =?us-ascii?Q?G8WHmduP+Rovx+2rU612T1mOBhHOcv91swHmLlhnuRDAdg598dpoP3l9bTed?=
 =?us-ascii?Q?TZifqAfnu6bi9BBXluEyWa1jLVzYaZxAXaAvaBc5amg9bTD2ayIRDAA3UE0s?=
 =?us-ascii?Q?fRx9Ci50E0zX0RAZUX26r6RfMb0p8MihlnRxL1IIDBbj28KitWN37A2ORYAK?=
 =?us-ascii?Q?pSk3u3ZApL+xsd+8b2wWG/b4XMd7yr8KtPF+VD2EjEX00b5nHMHLdiSvYq/A?=
 =?us-ascii?Q?uCPqOV+jylJJXzfO3jWd7LoYHypTh9uTqqseX0go/NYFs3bKOiBuznmmI+Cr?=
 =?us-ascii?Q?fSPrgbMegXt3CEBlgsc9zNaFx+THYuZbVObObUoFmoWN5EyNTn2z0ARf3teM?=
 =?us-ascii?Q?xsvvkj2csbSifyhOQIKlUEyDYgnEY/TkAq9GlFd2hwtt3WxBXwNR+LOyqIFA?=
 =?us-ascii?Q?/OixrFehDy5SnceRCiVBDSP6Z+K1DsYm821pX/BYXwoDIvYTqpjlkNtraR/x?=
 =?us-ascii?Q?JIDoGPV6FzUYp89WnW4YfjVp7wXurs2oyONC+lLJOPry7G7SjasuaBcIybmQ?=
 =?us-ascii?Q?m2fZ1LHP8mZU+0eOxGm0EXoe8i1FY+EcX48ZINzZq1ZX8111RauhWOxwNeE3?=
 =?us-ascii?Q?10CAjZqu49IjJDJ7NqPqG2GHUd+wdK6nns1yLaJ/0F4YhC43FyggBbjMSURp?=
 =?us-ascii?Q?0nKHrL0IR3SBn8rru9INreFssKkqyGnUdlmnp1CHTKw2MvmfSpEkN1Q4xbH8?=
 =?us-ascii?Q?ABgnTY3RStiloEEBWcLIspZtejyoUePVHaTSg7V3eYgbyGp0F6cdGaKWeWHy?=
 =?us-ascii?Q?ITz3map2djTe5uieLlvPCy0IKSgDOX6j5XByZSxKEZbirYaIoRkAU7pFMRR+?=
 =?us-ascii?Q?rj5m5TQ1gkRWCg8eUOJC9PWod0z4PhdWzw17vfRWsPPXRkDuqiOPJqoRVt61?=
 =?us-ascii?Q?iyn8D05dJrWh1GbQGjd1lbk8?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6589c44-a79c-4367-5309-08d9933f1b11
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB2448.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 20:29:09.8267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7rWAO7PdT45UmTmOBqkWxNZf0H0LrIC/NNAxscEJcrxSE8t/cbR+YDf3WKCPUB7+YJOfNCn+X2vAiRXwT4xyjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4681
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10142
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110190117
X-Proofpoint-GUID: Oh_3XePygcYN1zCo7yAWHCynUHmEXJOc
X-Proofpoint-ORIG-GUID: Oh_3XePygcYN1zCo7yAWHCynUHmEXJOc
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=mark.kanda@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Leverage the QMP support for fd-based KVM stats.

The interface supports an optional 'filter' argument to specify a
particular stat to query. Base and exponent are displayed in human
readable format.

Examples:

(qemu) info kvmstats

vm:
  max_mmu_page_hash_collisions (peak): 0
  nx_lpage_splits (instant): 114
  lpages (instant): 193
  mmu_unsync (instant): 0
  mmu_cache_miss (cumulative): 293
  mmu_recycled (cumulative): 0
  mmu_flooded (cumulative): 0
  mmu_pde_zapped (cumulative): 0
  mmu_pte_write (cumulative): 0
  mmu_shadow_zapped (cumulative): 178
  remote_tlb_flush (cumulative): 63

vcpu_0:
  req_event (cumulative): 538
  nmi_injections (cumulative): 0
...

(qemu) info kvmstats halt_poll_fail_ns

vm:

vcpu_0:
  halt_poll_fail_ns (cumulative): 20*10^-9 seconds

vcpu_1:
  halt_poll_fail_ns (cumulative): 30*10^-9 seconds

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
---
 hmp-commands-info.hx  | 13 +++++++++++
 include/monitor/hmp.h |  1 +
 monitor/hmp-cmds.c    | 52 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 66 insertions(+)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 4c966e8a6b..ef5bca01d9 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -335,6 +335,19 @@ SRST
     Show KVM information.
 ERST
 
+    {
+        .name       = "kvmstats",
+        .args_type  = "filter:s?",
+        .params     = "filter",
+        .help       = "show KVM statistics; optional filter for stat name",
+        .cmd        = hmp_info_kvmstats,
+    },
+
+SRST
+  ``info kvmstats``
+    Show KVM statistics.
+ERST
+
     {
         .name       = "numa",
         .args_type  = "",
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 6bc27639e0..20be8f8586 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -21,6 +21,7 @@ void hmp_handle_error(Monitor *mon, Error *err);
 void hmp_info_name(Monitor *mon, const QDict *qdict);
 void hmp_info_version(Monitor *mon, const QDict *qdict);
 void hmp_info_kvm(Monitor *mon, const QDict *qdict);
+void hmp_info_kvmstats(Monitor *mon, const QDict *qdict);
 void hmp_info_status(Monitor *mon, const QDict *qdict);
 void hmp_info_uuid(Monitor *mon, const QDict *qdict);
 void hmp_info_chardev(Monitor *mon, const QDict *qdict);
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index bcaa41350e..24a545a66b 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -134,6 +134,58 @@ void hmp_info_kvm(Monitor *mon, const QDict *qdict)
     qapi_free_KvmInfo(info);
 }
 
+void hmp_info_kvmstats(Monitor *mon, const QDict *qdict)
+{
+    KvmStatsList *stats_list, *stats_list_entry;
+    KvmStats *stats_entry;
+    KvmStatDataList *data_entry;
+    KvmStatData *kvm_stat;
+    uint64List *val;
+    const char *filter;
+    Error *err = NULL;
+
+    filter = qdict_get_try_str(qdict, "filter");
+    if (filter) {
+        stats_list = qmp_query_kvmstats(TRUE, filter, &err);
+    } else {
+        stats_list = qmp_query_kvmstats(FALSE, NULL, &err);
+    }
+
+    if (err) {
+        monitor_printf(mon, "%s\n", error_get_pretty(err));
+        error_free(err);
+        return;
+    }
+
+    for (stats_list_entry = stats_list; stats_list_entry;
+         stats_list_entry = stats_list_entry->next) {
+        stats_entry = stats_list_entry->value;
+        monitor_printf(mon, "\n%s:\n", stats_entry->name);
+
+        for (data_entry = stats_entry->stats; data_entry;
+             data_entry = data_entry->next) {
+            kvm_stat = data_entry->value;
+            monitor_printf(mon, "  %s (%s):", kvm_stat->name,
+                           KvmStatType_str(kvm_stat->type));
+
+            for (val = kvm_stat->val; val; val = val->next) {
+                if (kvm_stat->exponent) {
+                    /* Print the base and exponent as "*<base>^<exp>" */
+                    monitor_printf(mon, " %lu*%d^%d", val->value,
+                                   kvm_stat->base, kvm_stat->exponent);
+                } else {
+                    monitor_printf(mon, " %lu", val->value);
+                }
+            }
+
+            /* Don't print "none" unit type */
+            monitor_printf(mon, " %s\n", kvm_stat->unit == KVM_STAT_UNIT_NONE ?
+                           "" : KvmStatUnit_str(kvm_stat->unit));
+        }
+    }
+    qapi_free_KvmStatsList(stats_list);
+}
+
 void hmp_info_status(Monitor *mon, const QDict *qdict)
 {
     StatusInfo *info;
-- 
2.26.2


