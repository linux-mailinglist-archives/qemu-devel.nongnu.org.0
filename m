Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 860D73B890E
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 21:14:04 +0200 (CEST)
Received: from localhost ([::1]:54652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyfet-0007lD-Gz
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 15:14:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lyfZG-00078R-Jd
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 15:08:14 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:25432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lyfZE-0005qE-4x
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 15:08:14 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15UJ6VCs005974; Wed, 30 Jun 2021 19:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=VIDvef8juSGKsWxabk+TgxIPYn/xj8mAQQ5Nv1Tex5Y=;
 b=aS787YcSwWMqTwtufCvcsFpaTlvVSNqSGaepKEEf9qOby7eA8id9lJoGYGy3oapho1oa
 Hil0pxq5lMU3eh5vM7aTUtOd2kz2KVNUVIihN1s6TgdKNpTYupOHFIfXA6r+cmduqCuS
 hdJtxgBZs8T/nziREbP5eEa8HX4G25Gr9STF4pUUqt0/cP9k3UGK0F6BOGNbBHRnIs09
 MR19QqNu+NfN6xgH98lorTdMZWtpaC5IdfJhoRIamxLhASRxOp6qo/Gcwfk3xjzRyXcJ
 mp4tXiw3PomawWbcQ2YEyMxk5Y7n5/SSvPOlPJimgWUXcYqkGMZeOChVxzu1N9FzeQ18 Tg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39gb2t26xv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 19:08:09 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15UJ0Akg101205;
 Wed, 30 Jun 2021 19:08:08 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
 by aserp3030.oracle.com with ESMTP id 39dt9hqpat-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 19:08:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dS9MUnz5aEQHcil5Y+Rl3wo1ng/FCBMaCQ7riSehcqQDflTPBaf+AEVhU3koMDBOh6C0ZNrkFdNIqxtgI0U8w6eztlIskTrdfE/PTVEX1ssPncrJBhfLCqSaKDKEdFZDe1+KzFv6xH0ykLOY+KVHDgRo6bRXex4c6ao5JnK6+x5F4JDAwtE8UO+Nr37uCY0Q8u5soAe9YehWgXWDhN10kXGglWlGRggw3pdbGCe7lFRzSwfhlPMWAI6VsmSPjxuJDOnY9u8Jc6HT7nhBh9xYIZZ5+Sfmf1TKdrBQX8C3V63iQK4ug9dPi8W2zu+nwPjv0eKYX5Ql0P2MAM+vdGmVGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VIDvef8juSGKsWxabk+TgxIPYn/xj8mAQQ5Nv1Tex5Y=;
 b=K4jzp1Je//eT292V68EQe6ShH9VveuE3xoByhndM2PjuoYqLeYA1CtzZK+77PZcTZUJJPIWWMtIk3zq6ocJlzYJOC4ELj/586vXU+J9mGRiRePXSKmq9ej7mzlMy0P4EjqE+7lmIjFGkAiITfFmMSwokITOfyzvyKk9iS3UxykNKCB3MHGDtamEVtYOAKWkl8sUimD4JAfQZ2tWzdTw9vJrrcL0W/Z/5YwSfPJf3OsAe/Nkn7ArcnaPMrCrk7evrwmtrzw775msHWoG8lCBFUvv8wJcOT/SOphTsWdHNVb3cnjR/2Y1FOI/C0rRO2fD9UaFKucm2cH+kJVEk59q7Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VIDvef8juSGKsWxabk+TgxIPYn/xj8mAQQ5Nv1Tex5Y=;
 b=GawuqG8urOLg5++blVz8NGYoCJJVYsl/ifY+yY7Kvo1YmSCTdmQt92EJz7Mhzk6skn9PjUvTdcnge7SyfsKmqFCVx83dtIrwxx5Hf+HWPd7PNxAKYXS9kpYN+8x9F9R8+MAs85ObzNG+Zj+mfhqxF+VTHPYLBF+fRyjxnUsDrpE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1758.namprd10.prod.outlook.com (2603:10b6:301:9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Wed, 30 Jun
 2021 19:08:05 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc%7]) with mapi id 15.20.4287.023; Wed, 30 Jun 2021
 19:08:05 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 09/10] ACPI ERST: qtest for ERST
Date: Wed, 30 Jun 2021 15:07:20 -0400
Message-Id: <1625080041-29010-10-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-Originating-IP: [138.3.201.23]
X-ClientProxiedBy: BYAPR01CA0060.prod.exchangelabs.com (2603:10b6:a03:94::37)
 To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 BYAPR01CA0060.prod.exchangelabs.com (2603:10b6:a03:94::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.23 via Frontend Transport; Wed, 30 Jun 2021 19:08:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8106ac3-089f-44e7-9bf3-08d93bfa640e
X-MS-TrafficTypeDiagnostic: MWHPR10MB1758:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB17586BA571AD35E960AF09C997019@MWHPR10MB1758.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h9YTZBf6puzZzu6un5CVu98JH77gVyy0jRH73jg3P5bbi3pcPtV4sQdMuK97iZ7fRe6J2Uk4YLwMHDweSEuz/WF8/+IkvT45PY+EeK1oY/GGEd138SN5pRcmcejGpVeQd5YrA0leXBK6ydVpGnSwJesBNZ/3+mn/kMvww9UZ3ak0Wqn92Zq0UStPNu1KZTI1IVam299oa2sKurpGQ6hk4KuZo1aTd43kHh4rDwPRCD/HIHu5Ga35ynLhBYNRZv4F5cZMER3yjnnTPuNkKpA0mUu9CrzaEeZi+gVeqBTFwYAElq/s0SCCEWUIttBxVwqvU0EIindzsWpE1tL6zEU9pbl0LZoLKfdRuosQaKbuUZD0LJwZ4IYqq9KqLaIFOEETdU99LZLT+QY0znFkiRFW6d52lSDCxXLWXOz+0vT5/m4NnoyjunQyasO5c1wcLsahsPg3d0UzXgTGaM3Kko4KhpU427aVyw/PC+93wEWzcK8wpVfddckj2gwFkN95DtNvpjGYfrh4bdV7mO6YgfgeTIvfzWUzu+L39k0Md281hLrWp3JQvGgJw7eVJ4BQc0SwT8DXgv/aJomd0PNIvov/jHDlgfdK51ouSdRApGYrkYKXmG8DMZzfkhZ2JIbzSHEPBOrBtHUnPEJw3pgZiMu8lObIpvvEgg+l5NlAx5awok5mJALFLIvJAU2YZ/eSrEx4NJf9YefQi4mknJFplOuaMA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(376002)(346002)(39860400002)(396003)(366004)(6486002)(66556008)(2616005)(6666004)(2906002)(956004)(66476007)(66946007)(4326008)(107886003)(36756003)(316002)(86362001)(38350700002)(38100700002)(5660300002)(8936002)(16526019)(186003)(6916009)(478600001)(52116002)(26005)(8676002)(7696005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L4MT73WJzYXRdZCrrtZ9/1Nb3oFt1kxqJtEI0kujnyZb9tKUbEHYxovKWU0V?=
 =?us-ascii?Q?XuBK3RWOS2AQZjlpv9GH32+x9+05gCiGcCUxW9Ac/n1/7L49GZqhX+x7QkAd?=
 =?us-ascii?Q?WCTt+PQ7t4m7Sna97uR5Z9DIi5TcgBPW4z3GwlkmORGDpVYzEuOAq2D057gA?=
 =?us-ascii?Q?j/jQHTHuyiAMGVNsNq1d/NkMIZUi+xrpHFvNt+1eVmqmmKeiaR4SAVsCoLwh?=
 =?us-ascii?Q?cQOxs9K6q05rVJsNhgaE9zgddB8iWb4BZ/M9KiWxfd24BkAqhqSAiPVJDhgj?=
 =?us-ascii?Q?rHb2y+bCgl9n3lDGtN3S1FqPG168Z7XnA9i7jtUyV68MCoILoBLbzOv0NgKD?=
 =?us-ascii?Q?Q0Agz2/KxP0XGHYkVGV1hyPr6H5qfkEJQ3EZqfviCK3j7l1p/R9BHVdLbdPr?=
 =?us-ascii?Q?YZn7CGpPj+jCEXOVCoDalpcOOO+IaxjHX4+5CgizivOvzvDHXge8Jem2uFF+?=
 =?us-ascii?Q?Bk3zoZxBMKCKkekjhQWxtNalFgjVYmQcCzF1emoKKe2gvvhB9ZM8bHdtGmMk?=
 =?us-ascii?Q?Vh+vnspGcaCVF563E87/djNGwFnVpKVoFBU8QiqH9dtZa+jKc4cuCmul9cLf?=
 =?us-ascii?Q?/miyLvb3dI8pfP8mdL8BDPrAUVcjqcWr5UaDYxpuCZ8fk78r0qlRvWkXgv4R?=
 =?us-ascii?Q?xXjqu6u64E0LdEsNaDr+AtzYfo9KYoSAkI5XNz4jqU3Rf4JWw/F1kCFdKVHv?=
 =?us-ascii?Q?Ijvzxr5qSbYM0hnni4aMBepwMdXp3kn1xEUnqrGLKQsqhdCgsAuSjht7tAdW?=
 =?us-ascii?Q?peLdx5x/ktroJ0PJsA9pBhEmTlfWLAmnEKt3YlM43ItsF405RZmdRLiCvzek?=
 =?us-ascii?Q?e9+MoBXgDchaANrB87ZVAkMFGx6hWMWnBMC8tFFxD5G4NDvXQUYPCEqF+Aad?=
 =?us-ascii?Q?boCZRdeym9kMY0InLLvJCP+4l3DdxhGC4ROq+Cz2NGt2kBScgSwUXwXVSB/7?=
 =?us-ascii?Q?eIXP/uLNiiwYJOP02bo8QriiNTdGt2PM0vCsNV19/fXSi/fMyvAqfUtJjdAi?=
 =?us-ascii?Q?4ObOej+qbt/IHZqY0IJlQx0lBtJG/VrWbvyczNPtyvcU0ADAhkzfTHbyvXj8?=
 =?us-ascii?Q?UOtUPYbi0V1R29rgZCW4Olket9RjCdnFOhAKnVF3q+7VxfViopOgGqIo7wJq?=
 =?us-ascii?Q?CzukoAVg1Ve7mZV/hZBSR+ZLg/1LAUqskYwsi2EamtiYmq9EXz9Y6mG2/z/D?=
 =?us-ascii?Q?bMfPVCOoYqIZnMsQzHluEDy8GWlHTiEQzmKj9SqUm96GdEo/oN3p9p2VjDyE?=
 =?us-ascii?Q?KXugyQ9sOikiGP4WyH6clXkCHAGKEPlNHjN7OQiuOVhYTPU4Cexrl1mbRKyR?=
 =?us-ascii?Q?kOdX1pnWNf9AU7wYTEKCB/Qh?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8106ac3-089f-44e7-9bf3-08d93bfa640e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2021 19:08:05.7242 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WiDP2Su20IGOIvB3jGelQVbG1N0qiwsrtUF4e0LZCOkD3Yd//kjLCsTyq5vx+v2yNFMsRDIIFbIrXa9SYVkGkIShica9SrApNczeIElXrkA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1758
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10031
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106300106
X-Proofpoint-GUID: b1I2W3anUmKcdISeaUnoaDxX1iUVztWI
X-Proofpoint-ORIG-GUID: b1I2W3anUmKcdISeaUnoaDxX1iUVztWI
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 pbonzini@redhat.com, imammedo@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change provides a qtest that locates and then does a simple
interrogation of the ERST feature within the guest.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 tests/qtest/erst-test.c | 129 ++++++++++++++++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build |   2 +
 2 files changed, 131 insertions(+)
 create mode 100644 tests/qtest/erst-test.c

diff --git a/tests/qtest/erst-test.c b/tests/qtest/erst-test.c
new file mode 100644
index 0000000..ce014c1
--- /dev/null
+++ b/tests/qtest/erst-test.c
@@ -0,0 +1,129 @@
+/*
+ * QTest testcase for ACPI ERST
+ *
+ * Copyright (c) 2021 Oracle
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/bitmap.h"
+#include "qemu/uuid.h"
+#include "hw/acpi/acpi-defs.h"
+#include "boot-sector.h"
+#include "acpi-utils.h"
+#include "libqos/libqtest.h"
+#include "qapi/qmp/qdict.h"
+
+#define RSDP_ADDR_INVALID 0x100000 /* RSDP must be below this address */
+
+static uint64_t acpi_find_erst(QTestState *qts)
+{
+    uint32_t rsdp_offset;
+    uint8_t rsdp_table[36 /* ACPI 2.0+ RSDP size */];
+    uint32_t rsdt_len, table_length;
+    uint8_t *rsdt, *ent;
+    uint64_t base = 0;
+
+    /* Wait for guest firmware to finish and start the payload. */
+    boot_sector_test(qts);
+
+    /* Tables should be initialized now. */
+    rsdp_offset = acpi_find_rsdp_address(qts);
+
+    g_assert_cmphex(rsdp_offset, <, RSDP_ADDR_INVALID);
+
+    acpi_fetch_rsdp_table(qts, rsdp_offset, rsdp_table);
+    acpi_fetch_table(qts, &rsdt, &rsdt_len, &rsdp_table[16 /* RsdtAddress */],
+                     4, "RSDT", true);
+
+    ACPI_FOREACH_RSDT_ENTRY(rsdt, rsdt_len, ent, 4 /* Entry size */) {
+        uint8_t *table_aml;
+        acpi_fetch_table(qts, &table_aml, &table_length, ent, 4, NULL, true);
+        if (!memcmp(table_aml + 0 /* Header Signature */, "ERST", 4)) {
+            /*
+             * Picking up ERST base address from the Register Region
+             * specified as part of the first Serialization Instruction
+             * Action (which is a Begin Write Operation).
+             */
+            memcpy(&base, &table_aml[56], sizeof(base));
+            g_free(table_aml);
+            break;
+        }
+        g_free(table_aml);
+    }
+    g_free(rsdt);
+    return base;
+}
+
+static char disk[] = "tests/erst-test-disk-XXXXXX";
+
+#define ERST_CMD()                              \
+    "-accel kvm -accel tcg "                    \
+    "-object memory-backend-file," \
+      "id=erstnvram,mem-path=tests/acpi-erst-XXXXXX,size=0x10000,share=on " \
+    "-device acpi-erst,memdev=erstnvram " \
+    "-drive id=hd0,if=none,file=%s,format=raw " \
+    "-device ide-hd,drive=hd0 ", disk
+
+static void erst_get_error_log_address_range(void)
+{
+    QTestState *qts;
+    uint64_t log_address_range = 0;
+    unsigned log_address_length = 0;
+    unsigned log_address_attr = 0;
+
+    qts = qtest_initf(ERST_CMD());
+
+    uint64_t base = acpi_find_erst(qts);
+    g_assert(base != 0);
+
+    /* Issue GET_ERROR_LOG_ADDRESS_RANGE command */
+    qtest_writel(qts, base + 0, 0xD);
+    /* Read GET_ERROR_LOG_ADDRESS_RANGE result */
+    log_address_range = qtest_readq(qts, base + 8);\
+
+    /* Issue GET_ERROR_LOG_ADDRESS_RANGE_LENGTH command */
+    qtest_writel(qts, base + 0, 0xE);
+    /* Read GET_ERROR_LOG_ADDRESS_RANGE_LENGTH result */
+    log_address_length = qtest_readq(qts, base + 8);\
+
+    /* Issue GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES command */
+    qtest_writel(qts, base + 0, 0xF);
+    /* Read GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES result */
+    log_address_attr = qtest_readq(qts, base + 8);\
+
+    /* Check log_address_range is not 0,~0 or base */
+    g_assert(log_address_range != base);
+    g_assert(log_address_range != 0);
+    g_assert(log_address_range != ~0UL);
+
+    /* Check log_address_length is ERST_RECORD_SIZE */
+    g_assert(log_address_length == (8 * 1024));
+
+    /* Check log_address_attr is 0 */
+    g_assert(log_address_attr == 0);
+
+    qtest_quit(qts);
+}
+
+int main(int argc, char **argv)
+{
+    int ret;
+
+    ret = boot_sector_init(disk);
+    if (ret) {
+        return ret;
+    }
+
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_add_func("/erst/get-error-log-address-range",
+                   erst_get_error_log_address_range);
+
+    ret = g_test_run();
+    boot_sector_cleanup(disk);
+
+    return ret;
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 0c76738..deae443 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -66,6 +66,7 @@ qtests_i386 = \
   (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['rtl8139-test'] : []) +              \
   (config_all_devices.has_key('CONFIG_E1000E_PCI_EXPRESS') ? ['fuzz-e1000e-test'] : []) +   \
   (config_all_devices.has_key('CONFIG_ESP_PCI') ? ['am53c974-test'] : []) +                 \
+  (config_all_devices.has_key('CONFIG_ACPI') ? ['erst-test'] : []) +                 \
   qtests_pci +                                                                              \
   ['fdc-test',
    'ide-test',
@@ -237,6 +238,7 @@ qtests = {
   'bios-tables-test': [io, 'boot-sector.c', 'acpi-utils.c', 'tpm-emu.c'],
   'cdrom-test': files('boot-sector.c'),
   'dbus-vmstate-test': files('migration-helpers.c') + dbus_vmstate1,
+  'erst-test': files('erst-test.c', 'boot-sector.c', 'acpi-utils.c'),
   'ivshmem-test': [rt, '../../contrib/ivshmem-server/ivshmem-server.c'],
   'migration-test': files('migration-helpers.c'),
   'pxe-test': files('boot-sector.c'),
-- 
1.8.3.1


