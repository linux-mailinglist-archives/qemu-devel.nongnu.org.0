Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FA847D837
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 21:18:00 +0100 (CET)
Received: from localhost ([::1]:55632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n083j-0003Ij-EX
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 15:17:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07WG-0006ZA-9Y
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:43:24 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:46548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07WD-0000PQ-7C
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:43:24 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJXsgk013630; 
 Wed, 22 Dec 2021 19:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=ikJSggrzlkAklrQejdgOsrgVjwnuDuEGolk1VU1OsCs=;
 b=dcS8YXLgQjRawdYstvPx/aO3gxjbrFF2FwSjBhaUfuNlVqmFygcasOcbavoFr9Uy5VNy
 L0n0Gs3K8PQXPPuNK8pTcMF76nBSOITaPltEhw4pt7np3UrjIxh0vU9eApqHhfI8PaxH
 v+e9Fi+NHsaNSvylBcAfcEElgv4Cos3OgDQHLNN/jDaTG/Od1Ciy7i16HyXAGkDDPlo7
 wNFgE6GXpDWI/+HFoMS+E08WcXl76mvy1ohgvaU50J6WwEnT5bsrhfVudnZJ/rcPK6Rv
 dS/AKoLQ8tnC8WGfYpwHx6Au0GSDOQdjVk1abuQVv61DiyuA7+IyG8fw8BuNHHAzveBC Xg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3d46rm0tke-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:03 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJfCec049074;
 Wed, 22 Dec 2021 19:42:03 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by aserp3020.oracle.com with ESMTP id 3d17f5rfmu-9
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IdiqLHlPbm+PYeBWb908GgBEffN/fPidhOPo6S9wK5Vn/Pqpu06g2gNgMPzNApEsDOF8MGsJY4VhI9wO28DYWlQoQ4XJt/TEnkof1N30uTfmsyoWoZNOmi4ZRz+tobUrTO0lt6fzHpMZxlyH4C7vNxEMXpdTqPDejKexS/0Dq265O4ix+aENI8sQf9t87F4wbZea0ZSkG2jsrAxTg3jA6XTejmZxcpzX9XcTmiXQeMabxwCQS1kXNh+621n2Hnm0j/3kLTwy/LQdBE/iDz+fH1WsyI3IcUnEkkRZuelaHN77Du4X8E59IlxjFvQUtNQa14CR5xGNGJz+Trb5aF86yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ikJSggrzlkAklrQejdgOsrgVjwnuDuEGolk1VU1OsCs=;
 b=JCVMEa1DQNCGfDYpUz3GcYezC3AryNIF4lYFpDgnW4h/wbvemuUyV+PNa+va92JKevIpi8Ze5TiocarnCposdTNh5oqnkbJWZaqMAnRKVXNoFLNcnNwePq6C8UXO7M3GY4mVRZtEkWrAbnZO7Apc5YdgtF9EAEAiWMEXoT2iyvHEAeeWeqQr+TnVC9wdbyuBB2zCq63A451m0p7fNkbz0oNnN47ctBfRrs2mdDP0TcqAcKRnkq2c9/WVe2komDUDzPlKjCnU8d+F3oFdjXjzK9N8EdlItLR2aj0bsdSTxEfvadM613ygsjj2uG15lhx1qKtQ02/sUowi2Dtq2fXJMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ikJSggrzlkAklrQejdgOsrgVjwnuDuEGolk1VU1OsCs=;
 b=NkHBIEzpc4ChQCbkbjxeCJGy3SH2Pqt2/fK3/KH9vkEKVEnzgPB9iPwDy93CcsF5dWa8Uv3Y4GmiuiRvWMR3Wftsbpq+3cdb+M8IZMjgLUPcuWvpnaIm2nw6xYbQoDIk2djt2mjpvNmlJaTgv2lF7LQvQn3HC0WsBfLkZjXTnrw=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2888.namprd10.prod.outlook.com (2603:10b6:a03:88::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Wed, 22 Dec
 2021 19:41:59 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623%4]) with mapi id 15.20.4801.020; Wed, 22 Dec 2021
 19:41:59 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V7 08/29] memory: flat section iterator
Date: Wed, 22 Dec 2021 11:05:13 -0800
Message-Id: <1640199934-455149-9-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0196.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::21) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b817c274-3e1e-4f66-6500-08d9c5831e3e
X-MS-TrafficTypeDiagnostic: BYAPR10MB2888:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB2888B9B5B69BF3770763ED3EF97D9@BYAPR10MB2888.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9fLhxt4wJzEZHnpiDS3SRhR3Wgz1KFAMJSJOUXoYA2cbZwg5Fa16nzm8dlyjvIBJe2REx3QQsh++9sksD6r1aTxm+yps8dN4mdiPHjMGrBkXfeyY4kfi5r5//mZspRcL4TnGxEdJ0Pk1O8BDLfB5ZtHPAghj3C8l8vxG32WBXNL2Q3sRGlXERCttrf/qhL5W5fBW0LmeABshb0JhcygoS4m6ParlMUzeNSUNfRqrCw6HtLOfAN+pmF6vw8xurV8qm3A0tCkYj1WCSuP4w8d5L39Yq7p6hCGPb5R/75DFqHIjkS50DinVGrZcihI3FvHaK5KKRxk6cxK3KgSbt85gx9k5Ww3RaDt5hqmzbwtdcwrVr8M68Gtz+qocgmP8da8hFaf5SCbWLVAk1w29BiK/KeMl5PaFcmQqTaSUTb4kZffzC6MHoWNBNPzqLC1FImkP/5HDJOKO1r2viMyJuQbfge8V0CTCcU9DM1SgD4xCFvVgWal4f5pB2G7hFEKqG0JVEiVnolKxdUOsvqhdnEamvPfR3TMWMAfg3rVeqW/hrtJc4apazf6H4lmX5quoR5axZWFTS/m27STrDupwvmc6Fm/YkDDQXX0Un20eVedbfHRX/wjiyGZoNIOnCS1IC28HoKZS2+O/L/bELqP5j4SWuVHXVR8JQoRiggKvBijqKCHnOgqKnnzE/iRsWaU1XIdWth8RL0ZfIH/AF0f2xQE8og==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(86362001)(66946007)(6486002)(6916009)(6666004)(36756003)(4326008)(316002)(52116002)(6506007)(186003)(26005)(7416002)(38100700002)(66476007)(8676002)(2906002)(8936002)(38350700002)(6512007)(5660300002)(54906003)(83380400001)(508600001)(2616005)(107886003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XhZlbRglLsOWVusohCpSpj9D0poP7Peot0+0SW+iwO19RJcwFbd255vJy9Ys?=
 =?us-ascii?Q?9EXI6QZZl5u1FAw5Xj9ePANYEpmv4hTWAEvG5RzuMOLry6CIn2aEy2qO5J8q?=
 =?us-ascii?Q?U2ZXE65UCrT05gif1TLwktrSncVZGHgLUBvz1xDb8FqLDSepXSSIiyieWPcd?=
 =?us-ascii?Q?Gu32rITkcHcpkKzzUbHBF59ivTgBlwTdqpS3LAQybFWnzKLZdog8c+3EbtlC?=
 =?us-ascii?Q?Epr17mEPMZ1bH304suFHnMxKba8iTOJvG3kmJTPnQ4NqpJxPhV8cVq6+Czfj?=
 =?us-ascii?Q?GGajtmIN9H/gJyIeTii/RiRwtUZIOglShAubUTP06YvzbDO28pgtd3aHk22K?=
 =?us-ascii?Q?M7VwIVat0s7I9IJLMLtktkR6eHXxS2nX944Jt6Xt6ScAdh3yy++BqGe3121P?=
 =?us-ascii?Q?dmxrZf4lZhaUpyma+dkqrrGwQ/6gUvujswjuMO5m79+aDZPeB21O7/kS/WGO?=
 =?us-ascii?Q?2JO5yfDmE5Vm15BnscGgjc9VH+Wq06NuG6hpeIG0dAA9/u+SvfZNVjxm94Fa?=
 =?us-ascii?Q?Qd0dfeW3tllwr1d2BdX7ndh7uQ//rxMebVd7FTqchhn480B5VOBr0wLvxnX6?=
 =?us-ascii?Q?Z0WgYWJQyzphw3rC5xEFT3ZaVbLcMG369jHtxfwZm2Hi2pP4+T84dNQ3tYHF?=
 =?us-ascii?Q?evfsIhCOC2t/IgITHWgW8OHDtXpUXEd9pptvbFylP1f9xmUAW4cXuVSnQlT0?=
 =?us-ascii?Q?sKqXctAxnFa3fHzJrVN7i9YbTTgbk/tEiiZ0VSrc4g0c6UC9E9bEM2PE90oW?=
 =?us-ascii?Q?ONuPisliw7fRFY5dqUlQwceHynnlCoPdV+M8f3VbdeJI1zqMRlq+gcphZcZI?=
 =?us-ascii?Q?Iz724fHI9JoIQxQmoaVgD+1MQZtOmo664NF3H8S4/3CIl6xVoLstxA2L7yGr?=
 =?us-ascii?Q?btbIP0oauSGYgX+anQ+Izu9nWsfh22cie+NIVkN5kstmDPF27CaJi0jnYq1f?=
 =?us-ascii?Q?ZXXsqO1ROdAUct+MhSmHMYmOO5q0EXgS6uMTNmqOUsN9AopsKZWRUyv6ZJJz?=
 =?us-ascii?Q?KKOTw9ZTr4VFhz7RROyM1hBWGkv9D+OKh8eNSfSOrA3C1ktG4jJt2fSkZVJA?=
 =?us-ascii?Q?QGNOPYAo0tyrzeE+DlKffTllyYgjm4WBa8cxMPC/crZphQ5oDUVKe3hfvJhJ?=
 =?us-ascii?Q?qNFPwaFhOixMcZSKEJ8PHdfaghmizpArYeLFuu6WrQAovLrQdg1QSunNhfAo?=
 =?us-ascii?Q?JoVFRdQoXPnPxaN0fK3mhnrHKGTADDduqhpm5XeCkZfD9aA3EUcgyL3OmCQn?=
 =?us-ascii?Q?jKaC29Qxocx/8R/J0G37sn87DhYYN6G1y7dEyouRMoYUGUM2Yno02sRmjHAf?=
 =?us-ascii?Q?D5qLgMvkFyQppi6MwQL903EW2E6dLTtBf6SQeinvFNolPBiCiQSb8Ezgnd4R?=
 =?us-ascii?Q?hIfBxK7Ia3YWAcjlJslRgCy+Co7rF05cqaqltdYE2rwKseg11oUFkkXiIv3L?=
 =?us-ascii?Q?kBPm9Nj2G6vnuUECslhKaL00cPFd+3PnoCmhzLLn3ZOh4ny7fDk4TZzri0ap?=
 =?us-ascii?Q?9OX0IB+IR0KK2Q8cOx70krCttfL7SodPRSXo3RQpiCur50MzbGSRlgfrgn83?=
 =?us-ascii?Q?sK/jsR+nRD5UyFlB1c+bbufW8xin7OTsLF66e+xEx/xKiIITgrPFAzOEwglS?=
 =?us-ascii?Q?PU9nwvjGuqqe/A1lfMe+tReCwGTiJTxXY1ysaEPMY+to1hayQJNGBnNpOZ1s?=
 =?us-ascii?Q?dwuQ2Q=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b817c274-3e1e-4f66-6500-08d9c5831e3e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 19:41:59.1397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B90TekiMUh9U+dCoie4+LD3GO7+79aRUXfQnE0aH/afv5KmjA/2ZuC8hllng8ny1QNn3MpWuMxFaT9CfIGcOIal6HW8kAW9DT56AIbC6U+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2888
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10206
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 spamscore=0 phishscore=0 mlxscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220107
X-Proofpoint-GUID: 5ADJmdaHCJ2B1a67GuGSJ_FcQe2mIJJ7
X-Proofpoint-ORIG-GUID: 5ADJmdaHCJ2B1a67GuGSJ_FcQe2mIJJ7
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
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
 include/exec/memory.h | 31 +++++++++++++++++++++++++++++++
 softmmu/memory.c      | 20 ++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 137f5f3..9660475 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2338,6 +2338,37 @@ void memory_region_set_ram_discard_manager(MemoryRegion *mr,
                                            RamDiscardManager *rdm);
 
 /**
+ * memory_region_section_cb: callback for address_space_flat_for_each_section()
+ *
+ * @s: MemoryRegionSection of the range
+ * @opaque: data pointer passed to address_space_flat_for_each_section()
+ * @errp: error message, returned to the address_space_flat_for_each_section
+ *        caller.
+ *
+ * Returns: non-zero to stop the iteration, and 0 to continue.  The same
+ * non-zero value is returned to the address_space_flat_for_each_section caller.
+ */
+
+typedef int (*memory_region_section_cb)(MemoryRegionSection *s,
+                                        void *opaque,
+                                        Error **errp);
+
+/**
+ * address_space_flat_for_each_section: walk the ranges in the address space
+ * flat view and call @func for each.  Return 0 on success, else return non-zero
+ * with a message in @errp.
+ *
+ * @as: target address space
+ * @func: callback function
+ * @opaque: passed to @func
+ * @errp: passed to @func
+ */
+int address_space_flat_for_each_section(AddressSpace *as,
+                                        memory_region_section_cb func,
+                                        void *opaque,
+                                        Error **errp);
+
+/**
  * memory_region_find: translate an address/size relative to a
  * MemoryRegion into a #MemoryRegionSection.
  *
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 30b2f68..40f3522 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2663,6 +2663,26 @@ bool memory_region_is_mapped(MemoryRegion *mr)
     return mr->container ? true : false;
 }
 
+int address_space_flat_for_each_section(AddressSpace *as,
+                                        memory_region_section_cb func,
+                                        void *opaque,
+                                        Error **errp)
+{
+    FlatView *view = address_space_get_flatview(as);
+    FlatRange *fr;
+    int ret;
+
+    FOR_EACH_FLAT_RANGE(fr, view) {
+        MemoryRegionSection section = section_from_flat_range(fr, view);
+        ret = func(&section, opaque, errp);
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


