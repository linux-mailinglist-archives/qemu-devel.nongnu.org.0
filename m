Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4153BDBB3
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 18:54:29 +0200 (CEST)
Received: from localhost ([::1]:60942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0oL6-00035t-U1
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 12:54:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oJa-0000CA-Ax
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:52:54 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:4048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oJX-00082n-Fq
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:52:54 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 166GqBZ6003703; Tue, 6 Jul 2021 16:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=74qSSjbCCMVD6ygfQuj+B+R71E8K71xsjFCPAaUs510=;
 b=b/L8gSQm9+c/QUgg0xqEZpbRCbNixVcTKWohCyUhFdG7QXVkh6FzxAnpP6JaQNVXVpoD
 EMEj/moRtAR8sYtoVyesuGNfJyYHfc9xNX0U6BWIkJcswQ5PdCU+4lCIQCfcgOWkTbps
 ATY1kdYS36/W/TZg6hFWCquZLioxtaH8kLOny2gBxzzQE1zLLxi/ViA9JhtgHOB6DlVm
 zPFYASYCRZWemtiRxsQOZKTL4KKktbB6hDYVyDF7eplFK0CbaJEigP/XBPP0OMtyGAlV
 8gLfC5LoCmjwPTorQoxKFSaABPbtL1VWm3LM82DppCPw2NdlNMAQ5lG9UYqZELKnSdIJ 7g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39m27hac5k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:52:48 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 166GoIEv012589;
 Tue, 6 Jul 2021 16:52:47 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2042.outbound.protection.outlook.com [104.47.73.42])
 by aserp3020.oracle.com with ESMTP id 39jfq8vj24-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:52:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jEYogTb1Eyx3csfYWotp0qH+8EX6IUe8teQfpVjHzy5Ar+i7S0SGGO0PB8mmbOaRfqelDJ1dOQrMZzR9nOjxmZLDOlazb20QBKAoKR6ppbyqitVrWiITkiLCY6y6urBqRmvhmhh59jF4gTzljUJcd9Hr1LYCnNWYXXjkb5HNTJi5pIMPWa8GwMTBtzLGqxvzEOYWbvDi2nDYKB9fRa6zHht9CGt/J2zSQDaH+BqGKdu5YcjfYKsGpRgLAaMqVomRKsr6GoOO5g2rcdPzuTtQOTj8MeM1eE+dcqw4R8L2LRaqvrYO+X0ZTfLfE3b4e0TfyXpWZcMoVpizWQX9P/H7Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=74qSSjbCCMVD6ygfQuj+B+R71E8K71xsjFCPAaUs510=;
 b=M+NW4ewCn9Q9CY+UtgVGzJAvQ3pYz/A/PDdzkF9ZuK7/cdVU9ui3Icgq0IA15msHiA+DzzZOI2bI0wenkLnbWMpcKYgWgFZF87olhoA1UQ+n9Kbb/O5tRYDUBPsdbTjL0PRlKFjIjepDiHZwTHJFR6Tt2S12wXlyJMjyUQBIbXFusedgKD1tNTO7baXUgFuQwPfprAH+qu97cpd4OdnTFvku6Janmlv/QvquA5Y0GWfLa02hNnrL/rhgijVpKQioydx1LX9MiGS4S+zh5QvjNGQA1oFscmIxsg0kdgXzgWFphR8uiyremb885HVZUQ5fVWOvDTkssU3ipdaOPKAFiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=74qSSjbCCMVD6ygfQuj+B+R71E8K71xsjFCPAaUs510=;
 b=0E8dSvIvHTc4DxgooEeo8Jcy/JuhJILIYhEvFNI7ugK1PvG5g9LR4vrZXCqENsfLl2OpYKpH4hJibnJV/Lj8akGoTqejy17XWpQTNMLY53m+oBh3vKdImYLxEEb1lfqVo2df80pu6lOxn4PZUnc29JONDW16hfuz0VazXzMS5uo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2982.namprd10.prod.outlook.com (2603:10b6:a03:8a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19; Tue, 6 Jul
 2021 16:52:46 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 16:52:46 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V4 05/25] as_flat_walk
Date: Tue,  6 Jul 2021 09:45:36 -0700
Message-Id: <1625589956-81651-6-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1625589956-81651-1-git-send-email-steven.sistare@oracle.com>
References: <1625589956-81651-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0201CA0041.namprd02.prod.outlook.com
 (2603:10b6:803:2e::27) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-dev63.us.oracle.com (148.87.23.4) by
 SN4PR0201CA0041.namprd02.prod.outlook.com (2603:10b6:803:2e::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19 via Frontend
 Transport; Tue, 6 Jul 2021 16:52:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6cabf162-77ef-4914-4256-08d9409e7ab1
X-MS-TrafficTypeDiagnostic: BYAPR10MB2982:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB2982F09E87A10BB18B526DFCF91B9@BYAPR10MB2982.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sfI0OkJtdMR4spFSI/gGb2HLOh0KOT3OG69Vl7tGqhM1BbZKcxYm220i1k31nHIzMsPnXk/iz1k1NzHr2i8kvnl6vMiJoMEdae6pmnci6sMyAW+ezesRRuHKrafD9wfKfQeod2mKEOVZq3aRaBby4UOFTlYrR+gipDe+JXIm0t7inTtixyOKrIFLDXOJ+0B76IGCILlfCy6KRN+NIoOLcqq+fv4YkifFH9XdSzAnDccisw7nS3ogq3zQ0R4jDudZmzmgN/EuiwmYJBIMOi9soiosj/FULl8sCOwaLKZeStHp3dwyv0qePzpT9BUswMU23bac13KM/Orh2sanuOUJnxoxC6ZMb79YSaKxorAqWspn/77yPkIce9+FsWfk2plLdaFp7ANdTQCJIMOMWrWa2iOq/dLpfNjL0wbtlPQqaM0u12VkKf8JiPB+m9NoyTk8Kgvj8xE0pAdbZX/iJSoJDdSdGcEKoBMJfg1Dv5ns1SzelbXZbfdUNeERf/C8st0reHSgcv/wjAl2JJsv6iKMfWbtounsCEw24GtHUASXC7sMjT0sNYDHHVmIoCIomyJHjLpfvmSwkMoR62A8W5jTbQyBa6QBE0IOjKfkqHdMRcOnc3SzV19fR03MuKccR0e0lPF+dtYfSwZV9hvMy6tZgT8JgH40kmIN/BkTIjJwBew7lnIOqIhg7FNzrZLf+oXmSaTaT1rSS2zespQSLe+nUQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(346002)(366004)(136003)(396003)(376002)(956004)(8936002)(83380400001)(2616005)(7696005)(316002)(52116002)(6666004)(478600001)(26005)(8676002)(38350700002)(38100700002)(186003)(36756003)(86362001)(6486002)(7416002)(66946007)(54906003)(2906002)(107886003)(4326008)(66476007)(6916009)(66556008)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KQDYX4NBhUJdwzHhJ7IIBE1veU7VYp1yaqgjgt0EB8+XTGF78PFC866dUaSX?=
 =?us-ascii?Q?OeykMlEF51fRkjoJLltxKRSivNRWDh6J02V1YWwotK25fQQpDnnGMj6DVAG/?=
 =?us-ascii?Q?VzltW7U9okh0Ptm+chFVxSH63KUA0LtJl5Hi58c4g3B2fevHGKmY5vkI8nA3?=
 =?us-ascii?Q?J62W73Gx6KCzOEHd1PxhuMRFOKOOfAvR6BJOJC55Od/emuNGsblEPQTBhWl4?=
 =?us-ascii?Q?yAc/NADlrf2J4cmJs+FQOBDaH7T45Hd8hlVsa5hxFV+U9gXVTAn/nXCf5QxX?=
 =?us-ascii?Q?cqmbf/f/z0j7V+w2WeXyzBBc/FZbjk+qcmkmhgrP5Ayfdog//eYwcBYbaDpY?=
 =?us-ascii?Q?BJe8s3z5PO/djc+27yv/tp6w2XBzSxxjVqF0odBOxYJmRe/tUELEN8l9CEGL?=
 =?us-ascii?Q?Rmb8tHmDFKD+/LgEhRlf62FQkOGU/kvF4Yjy+7dMJbNT4z3ABDes4tq+w9Rm?=
 =?us-ascii?Q?3BX0Aj4nqrMo2i3WYXrBGa53pA2rXFwPuj+p/LIJGP2yc5G6SNcsy02XR5yx?=
 =?us-ascii?Q?3J4y4icfRaGYKc4AzlSF5KrRohBOrJjbiFLInQt+OpflJh7IYprDJDX3jvar?=
 =?us-ascii?Q?ahfIO6UjuBmV3ek/5K/2i3R+Y986pCTda35lMFKZzY6/yLdQ5xEPc79EEyIv?=
 =?us-ascii?Q?FO6j3QsFO1VhAUr4pFoGZBqY2miHW9WoUXwhLIFKp+UtO9F1sWWwAxbG2zk1?=
 =?us-ascii?Q?n3Jbas2+wlMTcvCehWOAm5Ojr3nPSLdg66tMqcRO32e+FmUxJRv9h2RHMmx0?=
 =?us-ascii?Q?pSPCscCowTR61r3PyM9JFNQr8TRnsuCOIJTqC+kkwdQ29i3IbDQthGEVmqFc?=
 =?us-ascii?Q?SWS5cKUuo0W1qWwIj9381Yl74X+Vv3iRrLp3aTrO3+HT1t0hw+FYw7KOj+xF?=
 =?us-ascii?Q?iSAiYCyUnwxzCpnrmrZq5CauCFIHUfupwIq4iP24L4/+fuIPQ12dha/Eunyv?=
 =?us-ascii?Q?WUe0SkNSTEE2JgCPFuyRKj4kKmI64/8Cm0f1LB4+X7H21u3XLBnewz5xdyYJ?=
 =?us-ascii?Q?yUwg0s9rD874kob6wlevQiTN6CJDzYTGzgbl6qzpPTlb6yjiD701uAzzgbpn?=
 =?us-ascii?Q?hmXhFp6If0GkihYAKTrgvyuL+0JLDhcObN1XFYd7Z/Pi38l5WTpVYvE9UVU/?=
 =?us-ascii?Q?RGwMHASICt008/5vcivjLsMfMNITI9h4l4FMJKG484c6+nqwd7DuJUnaUPQk?=
 =?us-ascii?Q?nAyALxMkpDCOgMjRzI0qjD3/bN0EqhuoCjlS1BKVRNWhenMbN/qsiTyPlhit?=
 =?us-ascii?Q?fnS6AM9nqu106O1GiUQGd2c+Pswrir/9YOYpAKmX+/wFgm2qWhDKDdbOxA6M?=
 =?us-ascii?Q?WEPAVOxu5CJmW4UbCD2O4hHN?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cabf162-77ef-4914-4256-08d9409e7ab1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 16:52:45.8492 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vDnMVjXhMd5iQz1013bLjQJS5ByURbX9Kbf11fdikAqLB3HKCt1+AN+jExc/aFwV7enb1jsdP9f4FBdDCT4yijZ2oHhadK919oBQuIHo/gw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2982
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 phishscore=0
 mlxscore=0 bulkscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107060079
X-Proofpoint-ORIG-GUID: pXkFC_vWbNJUge1R_Jd6SEs9Rj2GqACk
X-Proofpoint-GUID: pXkFC_vWbNJUge1R_Jd6SEs9Rj2GqACk
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add an iterator over the sections of a flattened address space.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 include/exec/memory.h | 17 +++++++++++++++++
 softmmu/memory.c      | 18 ++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index e8b71d8..d87c059 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2003,6 +2003,23 @@ bool memory_region_present(MemoryRegion *container, hwaddr addr);
  */
 bool memory_region_is_mapped(MemoryRegion *mr);
 
+typedef int (*qemu_flat_walk_cb)(MemoryRegionSection *s,
+                                 void *handle,
+                                 Error **errp);
+
+/**
+ * as_flat_walk: walk the ranges in the address space flat view and call @func
+ * for each.  Return 0 on success, else return non-zero with a message in
+ * @errp.
+ *
+ * @as: target address space
+ * @func: callback function
+ * @handle: passed to @func
+ * @errp: passed to @func
+ */
+int as_flat_walk(AddressSpace *as, qemu_flat_walk_cb func,
+                 void *handle, Error **errp);
+
 /**
  * memory_region_find: translate an address/size relative to a
  * MemoryRegion into a #MemoryRegionSection.
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 7197559..b2d5092 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2570,6 +2570,24 @@ bool memory_region_is_mapped(MemoryRegion *mr)
     return mr->container ? true : false;
 }
 
+int as_flat_walk(AddressSpace *as, qemu_flat_walk_cb func,
+                 void *handle, Error **errp)
+{
+    FlatView *view = address_space_get_flatview(as);
+    FlatRange *fr;
+    int ret;
+
+    FOR_EACH_FLAT_RANGE(fr, view) {
+        MemoryRegionSection section = section_from_flat_range(fr, view);
+        ret = func(&section, handle, errp);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    return 0;
+}
+
 /* Same as memory_region_find, but it does not add a reference to the
  * returned region.  It must be called from an RCU critical section.
  */
-- 
1.8.3.1


