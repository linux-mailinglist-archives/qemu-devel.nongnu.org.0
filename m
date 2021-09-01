Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B743FD90B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 13:54:36 +0200 (CEST)
Received: from localhost ([::1]:41702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLOp9-0004ET-7S
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 07:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mLOlM-00074J-0J
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 07:50:40 -0400
Received: from mail-bn7nam10on2134.outbound.protection.outlook.com
 ([40.107.92.134]:37985 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mLOlK-0002UE-Gv
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 07:50:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dmdTrVWBl/7+U0J4/iZHs611Dfq+UEwHeAhpUKKnX/4BscA1lfK9jrTVeva6e9G9axMBuo02/WSuv+wEGdX/EFAgSIzuRk3F5UvPXH3dPeeZKf68RENqwbGJJi86tsG9OUrT++JinPWW8hlJE+6YuSLug+7tzeEp5PEUXZ9xgcp/Y8/TrfH5P5F8Gc+YHaNJNP+3lo/zr4DCmUIRYP23clC4BUB8bof1s5RifHmU0hU0esYxMV1eGTmvrJIJvMPIX+ezgLSs8iaQK4o5ogv+gkFazmwUzuaKBAQ0uU5KKdtQjtZWIZBDs02zSHgRZXXQMvI5LjvL3IV6pJLhdCz50A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aS6NVYFeWYkAUe+yX/SnynNsxZaFbZU5FDRzrN2qyKA=;
 b=WSVkcc1JIYkQQxbVg/STg9C79r/pTWxUyhpOi1q44vna23q4/Ee4/YMv+DSHze6zlFQJeLHNpeeCRsUnsAW+itb8pUeMHtwq2M/Hag1jiZM22oNYIyRWxzSZR3vPe0XCApq1cquMswHCwSkSZ40ZqlfH+Hn3Y5EqMGiUe3Sw0oLiAhXvxz7FUWG36OFyfKDF3d6YpOtoHacvwedf9lnzPO9pXspLtnnr2zxWk0/Sbt0/ovttg3ojqfQxGlNIn2nTelIQ4WtmN2kpDeytg9lfx5sZzremVzzb36sPydCOUdq3oFWu/rjT1pq9CIfj4Hl2fum/d1pYwgEPjkezFsQBkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aS6NVYFeWYkAUe+yX/SnynNsxZaFbZU5FDRzrN2qyKA=;
 b=P0TlYCRUWAyAZCHc0ItfbNHQ8Acm4BfbH/p8rtxwMlDsawVhe4LJy0Ay9e6gQb1WStrVvt6GP+aAaK9t8F3Ua+8Cevl2gjIOtci/lHfY57I6gKt4smj4gbMO7syE9Tgnh/hkTPuaG8E+p6dLR9CWQi011WEc/JScYkrBLe7YJxE5py8592cAdyuVYiv94+8qACcN59Dj5W0pLREWoJhiEf4IZFhcTc5fVtdIu8fQwdFhAasCMXCbSAp6Isv+MV3fpraR6TVcIWRIoaOVZ1GGZSNVyApyrgNuNTrcs4MdNV5ybT7HEJCW8B1gENbpSSKjTgfe+omtuBt72h2Lqnw6Tg==
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4224.namprd03.prod.outlook.com (2603:10b6:805:ba::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Wed, 1 Sep
 2021 11:50:27 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139%7]) with mapi id 15.20.4457.024; Wed, 1 Sep 2021
 11:50:27 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL v3 1/8] fuzz: fix sparse memory access in the DMA callback
Date: Wed,  1 Sep 2021 07:49:57 -0400
Message-Id: <20210901115004.34768-2-alxndr@bu.edu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210901115004.34768-1-alxndr@bu.edu>
References: <20210901115004.34768-1-alxndr@bu.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0328.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::33) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BL1PR13CA0328.namprd13.prod.outlook.com (2603:10b6:208:2c1::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.8 via Frontend
 Transport; Wed, 1 Sep 2021 11:50:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff2bc3a8-9831-43ca-c9f4-08d96d3eb0ec
X-MS-TrafficTypeDiagnostic: SN6PR03MB4224:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB42246230DDB6DAD3A902B8D7BACD9@SN6PR03MB4224.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AIA70Ij0H+Zijm+eq0zBYZ+fVGOc3d3EeuVz58GcV9DsZs4HRLVF+nABQ8qKjJLvDL2x7CHh8cnhiwr0F2wGKSZ/CRSact1V/h/PXqCHA+BstblApa/kY5OLHGTl7f2+nDQcYrAoMaHkUoTyS+NSZvK+vDOTplLQN4DIBg7a9l8xnM/XbQFlabixMP+TAPuN+LNR+XFosSs3GyA9PK1GdeDwRhiD81LhnlE8B70pdGpYZuom2Craiwqx+MmRxHJtWGbNOt4qRQjSDxdEUUfVsAw+eEtNWTVgPziHmv3WbliuWV1b3sKAkOS1zOFl7h2CXEjjVoNhPgYh1cNbiGT2JXLmMx1ssMx79IUkR9k3xCTnh7yXtd0RBM3sDaUri11ii+8bhv2fPfu4of+A6hcUrYSsRFlj6qRCZxcQ4ISpIFM/lFsidgW5UbBiUesIcTMO0XhTe2PnTTDDchXlRfylYvMdHOv7XTuxhhwwx4fxY0mmW9btgQzMucNzggTJxgXSgHeN5ek8srVkSML5ElpbGvibklmOuD/OFwlBDGfToqpbSIiMKwB+9qDl5604Lj+Qu3DhhB1GJIkps5Qt079dsKVglxy9W+wNC04bYhCmHIPxHM0h4mbI5hS0x2kV57IkSDga9OqymHBDnvVNCGU1MHjHE3V25hNn/4ASE4d5ID+/ZM7MPx22x6TAQs9R/l3pw0kzoz9AMh5FDklEbrT35A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(376002)(366004)(39860400002)(75432002)(8936002)(38100700002)(38350700002)(6486002)(4326008)(52116002)(5660300002)(86362001)(36756003)(956004)(2616005)(2906002)(66476007)(66556008)(54906003)(1076003)(83380400001)(186003)(316002)(6916009)(66946007)(6512007)(6506007)(8676002)(26005)(478600001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1Y2NEMrSE1mdXUydlVLVEJUOXJKTll0SXlYTGlXRUt0NGQ1WTROT2JIUi96?=
 =?utf-8?B?dXBJL0NLWFI5cjRoSFFPaGU5UWRnelFXMUFHcmVkWFJjQVZUeGQzay9JQjM4?=
 =?utf-8?B?aXZ4T2ExQnpWdWpXRERUTEpXczZlbFNvZHlsY3RwcVgxRmJ4VktkM0VKbmJN?=
 =?utf-8?B?Qk03eXVTcWlSays2czdXOFdTZ3puaVAvbkJwVksyNExmTHR1ZW1MQXNvckpJ?=
 =?utf-8?B?dlBhdHBGaFNmS1FDRFAyN1pvSVY4cngyeGI0a0RZZ2NrdDJGa3loSVJTZU5P?=
 =?utf-8?B?bjVqQVVaZVdiY2lLQTJaelBYV1owVExzY09FS2ViSkpaVGlqZE5ReXlmUWta?=
 =?utf-8?B?NnZXcStqZ3FIWGlpMTdaa1lqNDNyWnYrU1RlTDhLOHlHdVJHOXdOZXM2aTVn?=
 =?utf-8?B?TkFoZ3R1RUpYQTNqZGhyTWtCOHVxQkNBV1pVZjFkY29ISmtnQzlPekpNMkM1?=
 =?utf-8?B?M0FMYXQ1OUJ1MUl5ZExyeStNWnRqay9KMTFtMGJKT0JjQUVxTi9FYXIxcU92?=
 =?utf-8?B?YzNwcWNZOXA0TmQzV3VlQ09OSHdTYTN4bkFQeDIyYkE2MDBBcWppZzRWSzM1?=
 =?utf-8?B?RHI5N2FlUUowcTF4NWl1SHd1aW90Z3dpa04wRFU5SXZHZHNUTTI4dkpxSmE1?=
 =?utf-8?B?dkxqRTN2UFhseDk2UHBZcFcxNmMwMFhzM0ZXVXdRckdMWHp2cUlOaEZiaStT?=
 =?utf-8?B?b0VacUQwRkNLSnc0cjg3VWJsY2pITUwzVE9wdTNNNkxZbDhWZENBOWxKMzJk?=
 =?utf-8?B?VlpXUmNoZ1B5bVptS3dzWmpSTzlQaXNmaUVwRlY3eVFtcGsxYUxraVU3QzRq?=
 =?utf-8?B?aUxJekZYSVBaaXdJOTRTbHFES2ZiU0h2SEtqRmtGcmM2RHBVSlpNOXhuWE9U?=
 =?utf-8?B?THVTU3gzWk5ObzlTM0NJYThkR3dSOTFvNnpDZHdWL0xacXFWRkN0R3ZqZFM2?=
 =?utf-8?B?SFFld2IrT0pBb2NNckdMVUQxTHV0STNTWDdxUE5tVG8zVmFTN2hoVWo3MU45?=
 =?utf-8?B?bldHL1NjVFUyNWwyTUIvNC9kSkd4dDlZTnVKT2hEUFNtOWFJNkJBVE4vb2hN?=
 =?utf-8?B?cmMvMXRvbnpMZEV0N0FYc3VuaGp1alhxWlhyQW1idlpIaklqL0FZTjVCd3JM?=
 =?utf-8?B?Q01JWlVrWGt4TFEzc1F2SU1paG1Id0RiQW9RbFZxL290S0djYndWZ3gxQ3NY?=
 =?utf-8?B?aEZuMGluWnlwRVMzWXJQWXM3YzVweDZqQ2gzUjFNdkhYSGMzVzVHUm1KaWph?=
 =?utf-8?B?QzBDR3RYNFFxZUJuY2JIcFpzY1FzTklZQmNldGlDZ3BlUDZjaEYxMi91S3hk?=
 =?utf-8?B?WDcydFo3cW84MGxLb0prWmdFRnU1V2ovSWFhNngxanlWNit2N1h2N1l4WXZ1?=
 =?utf-8?B?N2pkbHhJTEY2aWZQUk8vaFlNaTdpNzZhT0lmVXB0elJ4ZXByTkZnUkV4M2Iw?=
 =?utf-8?B?YkdVRllHYlVaNnl3c1ExLzIvelFOSERWNDRIL2VXTHNCZ0lOenRhUHFXZW80?=
 =?utf-8?B?bG91YmM2V09ydFdmRmd1Q0ZqUittOEszSEpzcXFzY2I4STlobmN1dmJQb2w0?=
 =?utf-8?B?V3luVVJiVVhYZGhoMjJVcmpIM0o4N1Bzd3Qva3JiS1hWbjFic2xGbHh2bmRU?=
 =?utf-8?B?Y1lvRlMxSUozZ0lQRVRHNVpzeStHejA3ZWxZUWRnajUybS8wR0UvSkdRQ1hD?=
 =?utf-8?B?VVFQdUw2YzZHRzY4S0lleEFYQXVIZmVhaURwbEoxT0Y3eHk1bmVmVU9xRGQ3?=
 =?utf-8?Q?y88cbhUXgnTP509OMI5ZoHaPZr76arnHHHyLHkx?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: ff2bc3a8-9831-43ca-c9f4-08d96d3eb0ec
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 11:50:27.4873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t0BfEQgzATjKv0LRoE+MC88QHamZzl9/npItXT5ysq9OKPzM2yVxvbS0m7FbmxPV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4224
Received-SPF: pass client-ip=40.107.92.134; envelope-from=alxndr@bu.edu;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.238, HK_RANDOM_FROM=0.999, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: bonzini@redhat.com, peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The code mistakenly relied on address_space_translate to store the
length remaining until the next memory-region. We care about this
because when there is RAM or sparse-memory neighboring on an MMIO
region, we should only write up to the border, to prevent inadvertently
invoking MMIO handlers within the DMA callback.

However address_space_translate_internal only stores the length until
the end of the MemoryRegion if memory_region_is_ram(mr). Otherwise
the *len is left unmodified. This caused some false-positive issues,
where the fuzzer found a way to perform a nested MMIO write through a
DMA callback on an [address, length] that started within sparse memory
and spanned some device MMIO regions.

To fix this, write to sparse memory in small chunks of
memory_access_size (similar to the underlying address_space_write code),
which will prevent accidentally hitting MMIO handlers through large
writes.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/fuzz/generic_fuzz.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index 6c67522717..0ea47298b7 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -240,10 +240,17 @@ void fuzz_dma_read_cb(size_t addr, size_t len, MemoryRegion *mr)
                                       addr, &addr1, &l, true,
                                       MEMTXATTRS_UNSPECIFIED);
 
-        if (!(memory_region_is_ram(mr1) ||
-              memory_region_is_romd(mr1)) && mr1 != sparse_mem_mr) {
+        /*
+         *  If mr1 isn't RAM, address_space_translate doesn't update l. Use
+         *  memory_access_size to identify the number of bytes that it is safe
+         *  to write without accidentally writing to another MemoryRegion.
+         */
+        if (!memory_region_is_ram(mr1)) {
             l = memory_access_size(mr1, l, addr1);
-        } else {
+        }
+        if (memory_region_is_ram(mr1) ||
+            memory_region_is_romd(mr1) ||
+            mr1 == sparse_mem_mr) {
             /* ROM/RAM case */
             if (qtest_log_enabled) {
                 /*
-- 
2.30.2


