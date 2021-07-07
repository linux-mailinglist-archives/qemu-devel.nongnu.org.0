Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3F23BED08
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 19:29:24 +0200 (CEST)
Received: from localhost ([::1]:38628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1BMP-0002wO-Fl
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 13:29:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKR-0000Av-Bp
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:19 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:44554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKP-0006jE-5U
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:19 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 167HCNF4029345; Wed, 7 Jul 2021 17:27:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=UyyWNVzOLHKMrmkqN8hYwR1tb8++eQDHnddSOLGxYdc=;
 b=e8gVWfnlEu1zmdb4l49L7zUX/j6Ko3Eg5rUV8Wwh+PR0MmqJFzCGT3fLF2QP/9mv7VHZ
 jUiHkjgWcwpI3Eqxz03EJJO+4GLEtbK3QnW4+tXECNNRFu0M3Mey9FwCF+O//C9ABSxR
 u4tc8sSX57L4RjzUEnwwBd87oF3i4oIt2g5LVdWfJWeL4ppn+V8RmusYr1PqMN/dmenf
 FVcifKYAxAtdMNUJQIjlGnszfAio6rkVmjr5RsRAhdtU/k9SRylYuoIKj5ieFGgCTbOs
 6nVJBO1GXC/3ZB0kNkuFKt+XRSmYbt8i/rV5QTFW6VAvg7xHsERJ3WrE5dEq7UotX1HN GA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39m2aacpas-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:13 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 167HAMKn068988;
 Wed, 7 Jul 2021 17:27:12 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
 by aserp3020.oracle.com with ESMTP id 39jfqayxx9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hsbxTs26UemKtw4fzqV+PAR200sSXP+a7EmS+zKK8PruX3jUXMEdHwVzC4SnRwSTj6N7E6mbfSdomo22HoEDKurFfcJ6Kbq2wdFb4ajCFob66qqOpb+um7c0AiQZ6XK7AKosJLQkS2JlRraDAyjj1Yl4FVuwq+TqK/aLQAygHPQtcK8J8FAXLMTr7HUEIZdPO2Hfrc+rJ6zXwD0Lx7i0O93ac+SO/XhcP5cjaDwp/RmxuJ/gF4vGaKoV7DmNGVsuD5uI+vyYQOuMWZ/CdLt9BSraK0iNr17KcKiP/Yb3pQjcBukivyHzN6EBgD9lmtj+CDqIC6txaFGGFT5QPTzFpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UyyWNVzOLHKMrmkqN8hYwR1tb8++eQDHnddSOLGxYdc=;
 b=Bki4eZZrq9zgqFwj/ekE6ZOUjcxYmqnvhr4RuY79gvq7C4gdBiwMBXb0IRzUvEhz4TntKC3X2p0AbpZsEL1wxsW9KqAupZYGmtQ6lQzYiLcakFakblHMk0Z5UFMfP5H6zW8SLXsg1KQC9CISuXjT6Tv7/G/rGCEtP3uQNFkBEwdsHqY+T9iotBTFybJwGJJ8jSGkPszV3/LeyTZnK7eM2hD1DPZvE6GiR2UF88iEMQrXcUM+rMFgkpyzVCzDYjlIP6SFVFduJGMZGXH4TcHPmjWXzb0bYd270RounBdCKJ+w3CCxRri7LU0qS41dXFHPV4QdHQNPVvJEnpTlrHgd8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UyyWNVzOLHKMrmkqN8hYwR1tb8++eQDHnddSOLGxYdc=;
 b=SCgzFJH6s/iAZzpBG7+aNTiYVY4ebK1I6iFNvPoIeZkf7UW4/bqyEaNUYj0N4av66MNgR7BZc8MCQYw/euFj40w6H4tHrjLSghTtYo+rAN16D+MsJjmqo6Z1uCBHjN6HrNMmfdbGLkYUOkPNyK42PaORp/l+SKSpLVPZvJYQ57I=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB3285.namprd10.prod.outlook.com (2603:10b6:a03:159::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Wed, 7 Jul
 2021 17:27:10 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 17:27:10 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V5 05/25] as_flat_walk
Date: Wed,  7 Jul 2021 10:20:14 -0700
Message-Id: <1625678434-240960-6-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0104.namprd03.prod.outlook.com
 (2603:10b6:a03:333::19) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-dev63.us.oracle.com (148.87.23.13) by
 SJ0PR03CA0104.namprd03.prod.outlook.com (2603:10b6:a03:333::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21 via Frontend
 Transport; Wed, 7 Jul 2021 17:27:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a1d1284-8e7e-4de1-e7f5-08d9416c734d
X-MS-TrafficTypeDiagnostic: BYAPR10MB3285:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB3285B3D52D1C2F0BE0518A80F91A9@BYAPR10MB3285.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WbLtFn75UhQwGT3uK245tYl7OAXwfldA00AjrjppFrYb3N7eE1zViCmug7FhELmmn2i+625jl4cvo4JawA3UxzltELQGyHQn3+Q0eA27DDRTp696TM33OGxsREZ1s1l1WOKihrG5AM85G1ArUKnBdnfMz/1wrWc8PKDsOam4uDgJnZ9DfK0Yandy+CliU0QY8ULJYVfHbXcumt8oDAa/gc37XlmzCfMvAvBIhAzkJHsiEb91FEwzMkgE/Ykulebof8ZMe3v24wcW8TbLN4995x8qiiFpSBfUw5PGbadxkuAMoeCHaNKLRpAp8vLPb1Gq9x2Kj1DEdgI8p6nXZ033Fjz34ejxQByDs0FnI7LuHbBc6lFWiFY2w9RedQcwN81y+hDxxPTYqTLzpQpViDGJlm6kpK2ifpdk235FkEl6eaYlntPP1bx4FeQ6x/HzyAUCEuc61bH2e65F8AZ5SYZP7omtScVFe1vx0Y199Ea3hFpcPKxFxADM9vp8fADMr2v5W4WU0kPMl+WtMH3kI0yvZrD6Co/WsujFDfAcNOgaFl3sWnKcQQZgs3PWxRLjHa126EbIQVujrWznsFqT/ybSfoJnIv2wf4KoW/YEdgSpbHKjl9tfDWmSkyrTBg3lQ79W4XrKw78QghTv+DaLGjk+uyg4pHoPUHVRppzD4u8hsPSMYT6pk+IiniaC9nD+SnKawzWaM0u5MasuwA3LZn0aLA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(366004)(396003)(39860400002)(346002)(4326008)(8936002)(54906003)(7416002)(66946007)(38100700002)(38350700002)(107886003)(86362001)(7696005)(52116002)(66556008)(66476007)(2906002)(83380400001)(36756003)(6486002)(5660300002)(2616005)(316002)(26005)(8676002)(6916009)(186003)(956004)(6666004)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rUlol77H64ozPeV6U6eMaHIpm9x0ieS88GYbIKR1JV8EsEe88FecginWCg2q?=
 =?us-ascii?Q?0DHv7uarTdU/5BTpYfcFrDKg35PTEf6dy06sS9NiWnJLQRXKh0bwIF+Q0/KL?=
 =?us-ascii?Q?hOzTLPaB1yryR436J2nkzqd8tvlrXHFziq0vbcZXfi/T5BhvlvSDYJrxzQCG?=
 =?us-ascii?Q?FFRIpwXQx3o7+hw6+Dqth2u7KrDS5EOuNMAW30MOh0cZUnSKOLG6JT7EtD83?=
 =?us-ascii?Q?oxfynPNdVnPHlNZr2lECmNIuicntyxYDtBxYTwyE5V7U8w+S4HS9XtOXt09y?=
 =?us-ascii?Q?//6NcdjjETltJEp1eGoXUcr82ofHQyAPThK7gHowa1C28SqcHE2cwx7AiHks?=
 =?us-ascii?Q?jfKZMAPkA5GVkkKE5EeeZHYxgTpUW2Ja+olSy0k5Cy9FOse5KCrVOYYHwA2W?=
 =?us-ascii?Q?BEwA1SzeUPvUfARymUmoWQK0wVo3gwxjTJuj7NgcfmYuRQ0BVgy5VCdpnGsd?=
 =?us-ascii?Q?thf5uF9Qi5MgSJ/jMAdqiiaooG+MT+o9oV0DnpWOz0b27iq0vgM4dGpsM5jx?=
 =?us-ascii?Q?Us86kV4EtdOa5v4z553SJiMhZ+Si1W/OfAA5Fqe9vhZ+g8Ry4kWfTid6vGEK?=
 =?us-ascii?Q?GXUmC+sklm8Ib3XOGxUpivTU9PT8rF/UytuWMZwiJiQXnVFR2HU3bpncNUHM?=
 =?us-ascii?Q?5HApsTHXv+ZexerVC7M0j/gITh4Ehrd+KljAhGmAbkwqbJUpU0MK4+ZLyJFo?=
 =?us-ascii?Q?BBtGtP+wBHDUFvKy8a1ZYSp89pPlmFojkGajVxz9zEpdRrU7R+eNLOASucWB?=
 =?us-ascii?Q?6LYpfsNTbL5H531jLuB7dI7Y5Sniloco69zg7UsK4ypfBpszeGsN9r4H4RdA?=
 =?us-ascii?Q?c3NJShc2MQONMSGwh3cBFDjsAn4D0Ri7vVD83/ooypaB4beX0VhBvCV1rKIP?=
 =?us-ascii?Q?fKgc5msWVLiKdariP+w5yWSQyJ5uvpJJSkHNghQepNIcUiFk/D4HQsGZ3wOq?=
 =?us-ascii?Q?TiISSUXY0QW8I99itcljvZvx3HtFvEKGXbxNijMV0dTD+syzeRTbrDPTDEq8?=
 =?us-ascii?Q?FVYgdLdlm0fSTtHC1TuFFD+dxo8yANNjab0WAGCI2UxOe9LXL6lYacs4hzl9?=
 =?us-ascii?Q?gSav2vIpm3nukyAwB6u4nMRy8ibgVcpswjgGQtKd+3Fm+L/uAgbcTqGdG7dD?=
 =?us-ascii?Q?BVdCdvqBJoaF3iTKQ6Am4bx0/z7BbMSniz6dytFthz1z5P3n3SKV8eV60JiX?=
 =?us-ascii?Q?VCJG453doosixkJbwT9mHlYyxmAAPs/csR3O3GV14os9ouQmW4XbXgNMuk3J?=
 =?us-ascii?Q?0f0U63dKjkJp9XcjFE3OU8Za8eo6wBWJCkKk++ynFfusaLgLJW1zFR34UWEd?=
 =?us-ascii?Q?hznh6enTK2L2IyviSLUwyCGf?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a1d1284-8e7e-4de1-e7f5-08d9416c734d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 17:27:10.2211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CT0eh3Z8Xoinrn1oVT4iErxaxe6vaPFL/Cen1KVh5QPUQ0C3l2wrcjzpXu62yetjmbeDqzIu+oZSH368lv5ZTKoOXRcXohODD/1yAeeKDxs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3285
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 phishscore=0
 mlxscore=0 bulkscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107070100
X-Proofpoint-ORIG-GUID: h_t1jMrW-RpAnTdwwu3wh1pRQSNXVtdx
X-Proofpoint-GUID: h_t1jMrW-RpAnTdwwu3wh1pRQSNXVtdx
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
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
index 7ad63f8..a030aef 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2023,6 +2023,23 @@ bool memory_region_present(MemoryRegion *container, hwaddr addr);
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
index e9536bc..1ec1e25 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2577,6 +2577,24 @@ bool memory_region_is_mapped(MemoryRegion *mr)
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


