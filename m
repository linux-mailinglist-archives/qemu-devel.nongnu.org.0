Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC7538DF77
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 04:58:55 +0200 (CEST)
Received: from localhost ([::1]:47294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll0nt-0006XJ-PM
	for lists+qemu-devel@lfdr.de; Sun, 23 May 2021 22:58:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1ll0iw-0006T4-5t
 for qemu-devel@nongnu.org; Sun, 23 May 2021 22:53:47 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:42028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1ll0iq-0003KU-EL
 for qemu-devel@nongnu.org; Sun, 23 May 2021 22:53:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1621824819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l3r41pGxuymTgMoNgf1HkqY9CsBmgcX0l6406Z3zihI=;
 b=fYWfN7R81Bxbe39IRBZP+1B82RfU9LGvQQ4zLMRQZOO0dQyx9ww+vy/KCoYoDVdJDN1lFV
 wVr6rsv2ar3rq9fgIxEK/jhKlVREU9Fn7Hren5uFz7i06EWFOk1+e73Ljk35n1WjDG7EVK
 rog0h+tWqOro10QLj/QH8MOpUjmhc8Y=
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-pEjetMvHPUOfU2TgAmSprQ-1; Mon, 24 May 2021 04:53:37 +0200
X-MC-Unique: pEjetMvHPUOfU2TgAmSprQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dV5dwNcUDxTMAxlPoHJ/KG1PSfuHzEKIRxu9ZNz2FUfU3luqAB3K2N14+WqAepaYZ7blrLwDzKzXICcileJv5GWcaqMNjxM6nuJGYSpxDTFhjSnwBu4hlwxg9VJuO1jI0eVBA9XgcxS5/NkLlWnQBPQ6lTw8JFuaUJCRKMHu/MyYSzbNcrGL+3Zq6A36hyzC/B3VbPA4ISs7HL+tcsMP7U+R1s36T2b2IcsgH5rZXZe9G/pJwcEe61GUyrPkA+BmXu2ZX7giSOPEh9M3rnqoBMxmnI9ixSeoRw522b6FwPQj8rjypRb6z/YoQqvnseLycKK51CS/z2oG/e7B3l0vjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SNBit8a3v2wYcrkIdZ0fRF++EFhiRP2j1aSTJDT/3rw=;
 b=FuHBWS1lslsUOok90itwF7EWml/YRkC6knq7YycujlN9ygWS+zluZI3ScHxc9nryzMXxCgjb+yp8HfIPBsfOetiDUWiIshEsdINwiepxOBCKoAZ/ilNCQUMZJn7UXVv5p7vxyCAIajtK/AfFzEzVnkpIdr16J7NOTrx5gBdZCqLM1+2v0SMdmRlnOgiRpeaLk1Ixp8brYy+L8P+QHFp44fmPVWEEg4yUrFHlz4zTF/Eby6J5Qqa4Ps8vDorxcELvewBUsxCPTBYITcfqSZuCNBoZih+iN9Izj7fsINYExq+3VD25HFowjJz/RbSn69mQJHOLv4q042sm0QLb/q1u+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB4126.eurprd04.prod.outlook.com
 (2603:10a6:803:47::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Mon, 24 May
 2021 02:53:36 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::b446:f4ea:d07c:ef5f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::b446:f4ea:d07c:ef5f%7]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 02:53:36 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cohuck@redhat.com, thuth@redhat.com, richard.henderson@linaro.org,
 cfontana@suse.de, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, pbonzini@redhat.com, acho@suse.com
Subject: [RFC v4 06/14] target/s390x: start moving TCG-only code to tcg/
Date: Mon, 24 May 2021 10:52:48 +0800
Message-ID: <20210524025256.22252-6-acho@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524025256.22252-1-acho@suse.com>
References: <20210524025256.22252-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [114.24.18.39]
X-ClientProxiedBy: HK2PR04CA0057.apcprd04.prod.outlook.com
 (2603:1096:202:14::25) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (114.24.18.39) by
 HK2PR04CA0057.apcprd04.prod.outlook.com (2603:1096:202:14::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Mon, 24 May 2021 02:53:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8a3ea9b-40d6-488d-0d21-08d91e5f2039
X-MS-TrafficTypeDiagnostic: VI1PR04MB4126:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB41266CCEEA75A948F63CD61CA0269@VI1PR04MB4126.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: giMveyAF9BX73gpdbMpA8lSIfvQEs6KVQ56HPkTFVgg+qhCFv/emnAPg9HrGglABbmAt3UNTItvYXxSsuy0+WC5HkchUq+aJf1dxXtQ9ypcN4iIadHkRxoMXG+i9/fkxJybghfI/HJEcSpAcoUdMx4I+2O1KGXJy+vxbrJ7RXASX7CQ1HDYW7o5SSy5ePvCvDQg0SzhWZhMUgr2/tifIZCxAEbeWMEMVz0Us7E3wKm/D/b43WOzX4Ic7Nrikj2u2pdr2bDe29DBD+Lf19qF7d4k0mt+mrFtEMl4Zz69w9ldNS+U5hRcUXSjdp/gvdGWQwBYNCzxxDn8v8S1awWkw94AIJfI2wOHfUycU4yjVQqaYptU/fgOLQ9JuKvGZItHPams84TlpKeGD5imdF/Ip0z24K4nm94mrCvMawfkyZ8g8Wj4sin3YD+DUb7Jykhs1DVVUJuaHM9UQVVpBS4npKO41L9W6BTjNJ5cUeG2qFCq4r938fe1eMq9/cgvbVjqMG5X8e+wyvipJ+ECwkEHst6qmr0OiWtqMvK2061e+aJ4nHEr14J/pHikPB4J62I1gMBaoCY9VUGQfULcI2yDl/j/JNq0rg6hA5RjRhRWp5uWoqXouK9d/ZniGZzaV3PbMhS+j1eeze6J0Op28tDkZJiOezpPP+n+JQLxl9YN+qMyS5OiT3MsgqWHDARbyB4vK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(136003)(376002)(396003)(39860400002)(36756003)(316002)(66476007)(38100700002)(8676002)(38350700002)(86362001)(52116002)(478600001)(66946007)(8936002)(1076003)(2906002)(956004)(26005)(6512007)(30864003)(16526019)(6506007)(186003)(83380400001)(2616005)(6666004)(4326008)(7416002)(5660300002)(6486002)(107886003)(66556008)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?FRrbpSz4kERMT0MvqR3o4tJmQFx7GqfGy7WfY4LqA3lvMba8HkPVWCIrbXok?=
 =?us-ascii?Q?TXEn0gRx46K6DT6qoiqUEHCtYwwF8zm96fsTNwL0nEyZlpg87SeTt0wgw6FI?=
 =?us-ascii?Q?GzXqvDJzXOm7qAcVm1+hjV7SLZndZUkJRD8pNW14KoaXUAo2lGJvH3vq6JNG?=
 =?us-ascii?Q?Vmik9OpX8Nne1whrSxmKCuZt5KcRINg4/OWwX13e6e0ux50ZzhrEGUepLrG/?=
 =?us-ascii?Q?Vt+njHbKJlhouFmqgIyForsUKYzTyQlKHq6KlzlrtaaDe7z8XwyreRr3rSg1?=
 =?us-ascii?Q?JcweejZ4bqIrBhtasxbvue+tW9vdOFtt5HL39mPjRMWhS0ex7xOYwILiw4f8?=
 =?us-ascii?Q?BAtbU3I1yYsfQntXw0OZmgTv97XqnWjhgzbmH7s/groCZuRoWM/PBlkumLGn?=
 =?us-ascii?Q?pxVybywKKv4Aab7aqJfSPvi/QN3pvT/hOjEoJvHbl/LCtdRubr8konxPQffY?=
 =?us-ascii?Q?cf2CDp4w3GOTh9wRngxsf2RCLZNO+cerQc+FIrMbEnd1bZcicEqI+HAnYrxb?=
 =?us-ascii?Q?XJ4VNZnRsM+8uIYk5F6xZl0kB0pd4DAUe6yfYuy4kk5Sse5ySC2pzn5a8Owh?=
 =?us-ascii?Q?O1YTlXqEubU6O1Ga8bs6jpsXvZIcXTqHQcR5NJH92GN1h4qwnejWfySASj6T?=
 =?us-ascii?Q?zF9v9MbcMHJjLfoIFOOWLKuNOhifvbKh+ZWB2nSK93r5Qa+4rSRCf1315p+w?=
 =?us-ascii?Q?D+3OrQssXK8OODq90dBPWNqcuoiNLpaldY8OVd8BAupHtKZhTiBarN+mZ26J?=
 =?us-ascii?Q?VwG6FixOfZWnY2zGB9ot47niTNzFYAqop9/LOYBOkOmGtsp9H5m5u4pNB3Yu?=
 =?us-ascii?Q?cVE6/vo90Q2a938BlHYFM+db4fKEvaq8hWPB5HkNYw/L7CO/kGjTwoSSupTz?=
 =?us-ascii?Q?/bbxhoZqSoBDkE0Yp5qmHGXW072cwRMAE3+BLxBmtlXD5WJtYtSN7Oq4iRsT?=
 =?us-ascii?Q?K9mc6wjo2dnantzj0l/PjzHg4bsTSZReTIVqVLcBZO+SXEfXasGQLh7B0Pjq?=
 =?us-ascii?Q?aC61kNb2kP3BAKUr9q528XBwUJOT7g/14dza/ald0yz77nLgWO1EgFkZm/dD?=
 =?us-ascii?Q?lfYPiMLQBAME1ZsJw7A2v9Y2SxsPOGUIU+0E/k2nYP3UPzhjbenzP5VN2sKu?=
 =?us-ascii?Q?AKqxO2UM9iPVHjuX+vsI/HJMKmbEhxrNE8f0mnIRXEv8kya0cGS9dZ4EJHxZ?=
 =?us-ascii?Q?onyQXSmgNDoRrC4xm3OICOO3N7LBR/uS97WJKsgKGp2O8rq/783vHALgbcLE?=
 =?us-ascii?Q?Fg2YxnZ/2st9lCn+p9C6QRKTkL2WCU4YzX3tDaUIJAOxmqs2lM9zdecS/k/Y?=
 =?us-ascii?Q?/xrGc4cLs0Dq5AhYmRMcbEZQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8a3ea9b-40d6-488d-0d21-08d91e5f2039
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 02:53:36.2591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jyhmh34vFAXOjbSPI4L9ZnyZxAUWUbSlPE5mmBMoaQjhVBPP9bq61zJJN+ir+PJt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4126
Received-SPF: pass client-ip=194.104.111.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

move everything related to translate, as well as HELPER code in tcg/

mmu_helper.c stays put for now, as it contains both TCG and KVM code.

The internal.h file is renamed to s390x-internal.h, because of the
risk of collision with other files with the same name.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Cho, Yu-Chen <acho@suse.com>
---
 hw/s390x/tod-tcg.c                            |  2 +-
 include/hw/s390x/tod.h                        |  2 +-
 target/s390x/arch_dump.c                      |  2 +-
 target/s390x/cpu.c                            |  2 +-
 target/s390x/cpu_models.c                     |  2 +-
 target/s390x/diag.c                           |  2 +-
 target/s390x/gdbstub.c                        |  2 +-
 target/s390x/helper.c                         |  2 +-
 target/s390x/interrupt.c                      |  4 ++--
 target/s390x/ioinst.c                         |  2 +-
 target/s390x/kvm.c                            |  2 +-
 target/s390x/machine.c                        |  4 ++--
 target/s390x/meson.build                      | 17 ++---------------
 target/s390x/mmu_helper.c                     |  2 +-
 target/s390x/{internal.h =3D> s390x-internal.h} |  6 ++++++
 target/s390x/sigp.c                           |  2 +-
 target/s390x/{ =3D> tcg}/cc_helper.c            |  2 +-
 target/s390x/{ =3D> tcg}/crypto_helper.c        |  2 +-
 target/s390x/{ =3D> tcg}/excp_helper.c          |  2 +-
 target/s390x/{ =3D> tcg}/fpu_helper.c           |  2 +-
 target/s390x/{ =3D> tcg}/insn-data.def          |  0
 target/s390x/{ =3D> tcg}/insn-format.def        |  0
 target/s390x/{ =3D> tcg}/int_helper.c           |  2 +-
 target/s390x/{ =3D> tcg}/mem_helper.c           |  2 +-
 target/s390x/tcg/meson.build                  | 14 ++++++++++++++
 target/s390x/{ =3D> tcg}/misc_helper.c          |  2 +-
 target/s390x/{ =3D> tcg}/s390-tod.h             |  0
 target/s390x/{ =3D> tcg}/tcg_s390x.h            |  0
 target/s390x/{ =3D> tcg}/translate.c            |  2 +-
 target/s390x/{ =3D> tcg}/translate_vx.c.inc     |  0
 target/s390x/{ =3D> tcg}/vec.h                  |  0
 target/s390x/{ =3D> tcg}/vec_fpu_helper.c       |  2 +-
 target/s390x/{ =3D> tcg}/vec_helper.c           |  2 +-
 target/s390x/{ =3D> tcg}/vec_int_helper.c       |  0
 target/s390x/{ =3D> tcg}/vec_string_helper.c    |  2 +-
 35 files changed, 49 insertions(+), 42 deletions(-)
 rename target/s390x/{internal.h =3D> s390x-internal.h} (98%)
 rename target/s390x/{ =3D> tcg}/cc_helper.c (99%)
 rename target/s390x/{ =3D> tcg}/crypto_helper.c (98%)
 rename target/s390x/{ =3D> tcg}/excp_helper.c (99%)
 rename target/s390x/{ =3D> tcg}/fpu_helper.c (99%)
 rename target/s390x/{ =3D> tcg}/insn-data.def (100%)
 rename target/s390x/{ =3D> tcg}/insn-format.def (100%)
 rename target/s390x/{ =3D> tcg}/int_helper.c (99%)
 rename target/s390x/{ =3D> tcg}/mem_helper.c (99%)
 create mode 100644 target/s390x/tcg/meson.build
 rename target/s390x/{ =3D> tcg}/misc_helper.c (99%)
 rename target/s390x/{ =3D> tcg}/s390-tod.h (100%)
 rename target/s390x/{ =3D> tcg}/tcg_s390x.h (100%)
 rename target/s390x/{ =3D> tcg}/translate.c (99%)
 rename target/s390x/{ =3D> tcg}/translate_vx.c.inc (100%)
 rename target/s390x/{ =3D> tcg}/vec.h (100%)
 rename target/s390x/{ =3D> tcg}/vec_fpu_helper.c (99%)
 rename target/s390x/{ =3D> tcg}/vec_helper.c (99%)
 rename target/s390x/{ =3D> tcg}/vec_int_helper.c (100%)
 rename target/s390x/{ =3D> tcg}/vec_string_helper.c (99%)

diff --git a/hw/s390x/tod-tcg.c b/hw/s390x/tod-tcg.c
index e91b9590f5..4b3e65050a 100644
--- a/hw/s390x/tod-tcg.c
+++ b/hw/s390x/tod-tcg.c
@@ -16,7 +16,7 @@
 #include "qemu/cutils.h"
 #include "qemu/module.h"
 #include "cpu.h"
-#include "tcg_s390x.h"
+#include "tcg/tcg_s390x.h"
=20
 static void qemu_s390_tod_get(const S390TODState *td, S390TOD *tod,
                               Error **errp)
diff --git a/include/hw/s390x/tod.h b/include/hw/s390x/tod.h
index ff3195a4bf..0935e85089 100644
--- a/include/hw/s390x/tod.h
+++ b/include/hw/s390x/tod.h
@@ -12,7 +12,7 @@
 #define HW_S390_TOD_H
=20
 #include "hw/qdev-core.h"
-#include "target/s390x/s390-tod.h"
+#include "tcg/s390-tod.h"
 #include "qom/object.h"
=20
 typedef struct S390TOD {
diff --git a/target/s390x/arch_dump.c b/target/s390x/arch_dump.c
index cc1330876b..08daf93ae1 100644
--- a/target/s390x/arch_dump.c
+++ b/target/s390x/arch_dump.c
@@ -13,7 +13,7 @@
=20
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "elf.h"
 #include "sysemu/dump.h"
=20
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 64455cf309..533b251b7e 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -23,7 +23,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "kvm_s390x.h"
 #include "sysemu/kvm.h"
 #include "sysemu/reset.h"
diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 050dcf2d42..4ff8cba7e5 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -12,7 +12,7 @@
=20
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "kvm_s390x.h"
 #include "sysemu/kvm.h"
 #include "sysemu/tcg.h"
diff --git a/target/s390x/diag.c b/target/s390x/diag.c
index d620cd4bd4..c17a2498a7 100644
--- a/target/s390x/diag.c
+++ b/target/s390x/diag.c
@@ -14,7 +14,7 @@
=20
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "hw/watchdog/wdt_diag288.h"
 #include "sysemu/cpus.h"
 #include "hw/s390x/ipl.h"
diff --git a/target/s390x/gdbstub.c b/target/s390x/gdbstub.c
index d6fce5ff1e..1dbe2973f4 100644
--- a/target/s390x/gdbstub.c
+++ b/target/s390x/gdbstub.c
@@ -20,7 +20,7 @@
=20
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "exec/exec-all.h"
 #include "exec/gdbstub.h"
 #include "qemu/bitops.h"
diff --git a/target/s390x/helper.c b/target/s390x/helper.c
index 7678994feb..2254873cef 100644
--- a/target/s390x/helper.c
+++ b/target/s390x/helper.c
@@ -20,7 +20,7 @@
=20
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "exec/gdbstub.h"
 #include "qemu/timer.h"
 #include "qemu/qemu-print.h"
diff --git a/target/s390x/interrupt.c b/target/s390x/interrupt.c
index 9b4d08f2be..734f0c62de 100644
--- a/target/s390x/interrupt.c
+++ b/target/s390x/interrupt.c
@@ -10,12 +10,12 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "kvm_s390x.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "exec/exec-all.h"
 #include "sysemu/kvm.h"
 #include "sysemu/tcg.h"
 #include "hw/s390x/ioinst.h"
-#include "tcg_s390x.h"
+#include "tcg/tcg_s390x.h"
 #if !defined(CONFIG_USER_ONLY)
 #include "hw/s390x/s390_flic.h"
 #endif
diff --git a/target/s390x/ioinst.c b/target/s390x/ioinst.c
index 1ee11522e1..4eb0a7a9f8 100644
--- a/target/s390x/ioinst.c
+++ b/target/s390x/ioinst.c
@@ -12,7 +12,7 @@
 #include "qemu/osdep.h"
=20
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "hw/s390x/ioinst.h"
 #include "trace.h"
 #include "hw/s390x/s390-pci-bus.h"
diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
index 4fb3bbfef5..2a22cc69f6 100644
--- a/target/s390x/kvm.c
+++ b/target/s390x/kvm.c
@@ -26,7 +26,7 @@
=20
 #include "qemu-common.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "kvm_s390x.h"
 #include "sysemu/kvm_int.h"
 #include "qemu/cutils.h"
diff --git a/target/s390x/machine.c b/target/s390x/machine.c
index 5b4e82f1ab..81a8a7ff99 100644
--- a/target/s390x/machine.c
+++ b/target/s390x/machine.c
@@ -16,10 +16,10 @@
=20
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "kvm_s390x.h"
 #include "migration/vmstate.h"
-#include "tcg_s390x.h"
+#include "tcg/tcg_s390x.h"
 #include "sysemu/kvm.h"
 #include "sysemu/tcg.h"
=20
diff --git a/target/s390x/meson.build b/target/s390x/meson.build
index a5e1ded93f..60d7f1b908 100644
--- a/target/s390x/meson.build
+++ b/target/s390x/meson.build
@@ -8,21 +8,6 @@ s390x_ss.add(files(
   'interrupt.c',
 ))
=20
-s390x_ss.add(when: 'CONFIG_TCG', if_true: files(
-  'cc_helper.c',
-  'crypto_helper.c',
-  'excp_helper.c',
-  'fpu_helper.c',
-  'int_helper.c',
-  'mem_helper.c',
-  'misc_helper.c',
-  'translate.c',
-  'vec_fpu_helper.c',
-  'vec_helper.c',
-  'vec_int_helper.c',
-  'vec_string_helper.c',
-))
-
 s390x_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'), if_false: files(=
'kvm-stub.c'))
=20
 gen_features =3D executable('gen-features', 'gen-features.c', native: true=
,
@@ -60,6 +45,8 @@ endif
=20
 s390x_user_ss =3D ss.source_set()
=20
+subdir('tcg')
+
 target_arch +=3D {'s390x': s390x_ss}
 target_softmmu_arch +=3D {'s390x': s390x_softmmu_ss}
 target_user_arch +=3D {'s390x': s390x_user_ss}
diff --git a/target/s390x/mmu_helper.c b/target/s390x/mmu_helper.c
index d492b23a17..52fdd86c63 100644
--- a/target/s390x/mmu_helper.c
+++ b/target/s390x/mmu_helper.c
@@ -19,7 +19,7 @@
 #include "qemu/error-report.h"
 #include "exec/address-spaces.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "kvm_s390x.h"
 #include "sysemu/kvm.h"
 #include "sysemu/tcg.h"
diff --git a/target/s390x/internal.h b/target/s390x/s390x-internal.h
similarity index 98%
rename from target/s390x/internal.h
rename to target/s390x/s390x-internal.h
index 11515bb617..171ecd59fb 100644
--- a/target/s390x/internal.h
+++ b/target/s390x/s390x-internal.h
@@ -244,6 +244,12 @@ void load_psw(CPUS390XState *env, uint64_t mask, uint6=
4_t addr);
 #ifndef CONFIG_USER_ONLY
 unsigned int s390_cpu_halt(S390CPU *cpu);
 void s390_cpu_unhalt(S390CPU *cpu);
+void s390_cpu_init_sysemu(Object *obj);
+bool s390_cpu_realize_sysemu(DeviceState *dev, Error **errp);
+void s390_cpu_finalize(Object *obj);
+void s390_cpu_class_init_sysemu(CPUClass *cc);
+void s390_cpu_machine_reset_cb(void *opaque);
+
 #else
 static inline unsigned int s390_cpu_halt(S390CPU *cpu)
 {
diff --git a/target/s390x/sigp.c b/target/s390x/sigp.c
index c604f17710..320dddbae2 100644
--- a/target/s390x/sigp.c
+++ b/target/s390x/sigp.c
@@ -10,7 +10,7 @@
=20
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "sysemu/hw_accel.h"
 #include "sysemu/runstate.h"
 #include "exec/address-spaces.h"
diff --git a/target/s390x/cc_helper.c b/target/s390x/tcg/cc_helper.c
similarity index 99%
rename from target/s390x/cc_helper.c
rename to target/s390x/tcg/cc_helper.c
index e7039d0d18..f0663f7a3e 100644
--- a/target/s390x/cc_helper.c
+++ b/target/s390x/tcg/cc_helper.c
@@ -20,7 +20,7 @@
=20
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "tcg_s390x.h"
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
diff --git a/target/s390x/crypto_helper.c b/target/s390x/tcg/crypto_helper.=
c
similarity index 98%
rename from target/s390x/crypto_helper.c
rename to target/s390x/tcg/crypto_helper.c
index ff3fbc3950..138d9e7ad9 100644
--- a/target/s390x/crypto_helper.c
+++ b/target/s390x/tcg/crypto_helper.c
@@ -12,7 +12,7 @@
=20
 #include "qemu/osdep.h"
 #include "qemu/main-loop.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "tcg_s390x.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
diff --git a/target/s390x/excp_helper.c b/target/s390x/tcg/excp_helper.c
similarity index 99%
rename from target/s390x/excp_helper.c
rename to target/s390x/tcg/excp_helper.c
index 20625c2c8f..b675536aec 100644
--- a/target/s390x/excp_helper.c
+++ b/target/s390x/tcg/excp_helper.c
@@ -20,7 +20,7 @@
=20
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "exec/helper-proto.h"
 #include "qemu/timer.h"
 #include "exec/exec-all.h"
diff --git a/target/s390x/fpu_helper.c b/target/s390x/tcg/fpu_helper.c
similarity index 99%
rename from target/s390x/fpu_helper.c
rename to target/s390x/tcg/fpu_helper.c
index f155bc048c..bc89ef7cc8 100644
--- a/target/s390x/fpu_helper.c
+++ b/target/s390x/tcg/fpu_helper.c
@@ -20,7 +20,7 @@
=20
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "tcg_s390x.h"
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
diff --git a/target/s390x/insn-data.def b/target/s390x/tcg/insn-data.def
similarity index 100%
rename from target/s390x/insn-data.def
rename to target/s390x/tcg/insn-data.def
diff --git a/target/s390x/insn-format.def b/target/s390x/tcg/insn-format.de=
f
similarity index 100%
rename from target/s390x/insn-format.def
rename to target/s390x/tcg/insn-format.def
diff --git a/target/s390x/int_helper.c b/target/s390x/tcg/int_helper.c
similarity index 99%
rename from target/s390x/int_helper.c
rename to target/s390x/tcg/int_helper.c
index 658507dd6d..954542388a 100644
--- a/target/s390x/int_helper.c
+++ b/target/s390x/tcg/int_helper.c
@@ -20,7 +20,7 @@
=20
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "tcg_s390x.h"
 #include "exec/exec-all.h"
 #include "qemu/host-utils.h"
diff --git a/target/s390x/mem_helper.c b/target/s390x/tcg/mem_helper.c
similarity index 99%
rename from target/s390x/mem_helper.c
rename to target/s390x/tcg/mem_helper.c
index f6a7d29273..9bae13ecf0 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -20,7 +20,7 @@
=20
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "tcg_s390x.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
diff --git a/target/s390x/tcg/meson.build b/target/s390x/tcg/meson.build
new file mode 100644
index 0000000000..ee4e8fec77
--- /dev/null
+++ b/target/s390x/tcg/meson.build
@@ -0,0 +1,14 @@
+s390x_ss.add(when: 'CONFIG_TCG', if_true: files(
+  'cc_helper.c',
+  'crypto_helper.c',
+  'excp_helper.c',
+  'fpu_helper.c',
+  'int_helper.c',
+  'mem_helper.c',
+  'misc_helper.c',
+  'translate.c',
+  'vec_fpu_helper.c',
+  'vec_helper.c',
+  'vec_int_helper.c',
+  'vec_string_helper.c',
+))
diff --git a/target/s390x/misc_helper.c b/target/s390x/tcg/misc_helper.c
similarity index 99%
rename from target/s390x/misc_helper.c
rename to target/s390x/tcg/misc_helper.c
index 7ea90d414a..33e6999e15 100644
--- a/target/s390x/misc_helper.c
+++ b/target/s390x/tcg/misc_helper.c
@@ -22,7 +22,7 @@
 #include "qemu/cutils.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "exec/memory.h"
 #include "qemu/host-utils.h"
 #include "exec/helper-proto.h"
diff --git a/target/s390x/s390-tod.h b/target/s390x/tcg/s390-tod.h
similarity index 100%
rename from target/s390x/s390-tod.h
rename to target/s390x/tcg/s390-tod.h
diff --git a/target/s390x/tcg_s390x.h b/target/s390x/tcg/tcg_s390x.h
similarity index 100%
rename from target/s390x/tcg_s390x.h
rename to target/s390x/tcg/tcg_s390x.h
diff --git a/target/s390x/translate.c b/target/s390x/tcg/translate.c
similarity index 99%
rename from target/s390x/translate.c
rename to target/s390x/tcg/translate.c
index 4f953ddfba..ac236888a0 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -30,7 +30,7 @@
=20
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "disas/disas.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg-op.h"
diff --git a/target/s390x/translate_vx.c.inc b/target/s390x/tcg/translate_v=
x.c.inc
similarity index 100%
rename from target/s390x/translate_vx.c.inc
rename to target/s390x/tcg/translate_vx.c.inc
diff --git a/target/s390x/vec.h b/target/s390x/tcg/vec.h
similarity index 100%
rename from target/s390x/vec.h
rename to target/s390x/tcg/vec.h
diff --git a/target/s390x/vec_fpu_helper.c b/target/s390x/tcg/vec_fpu_helpe=
r.c
similarity index 99%
rename from target/s390x/vec_fpu_helper.c
rename to target/s390x/tcg/vec_fpu_helper.c
index c1564e819b..850fac721e 100644
--- a/target/s390x/vec_fpu_helper.c
+++ b/target/s390x/tcg/vec_fpu_helper.c
@@ -12,7 +12,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "vec.h"
 #include "tcg_s390x.h"
 #include "tcg/tcg-gvec-desc.h"
diff --git a/target/s390x/vec_helper.c b/target/s390x/tcg/vec_helper.c
similarity index 99%
rename from target/s390x/vec_helper.c
rename to target/s390x/tcg/vec_helper.c
index 986e7cc825..ddd0a8be5b 100644
--- a/target/s390x/vec_helper.c
+++ b/target/s390x/tcg/vec_helper.c
@@ -11,7 +11,7 @@
  */
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "vec.h"
 #include "tcg/tcg.h"
 #include "tcg/tcg-gvec-desc.h"
diff --git a/target/s390x/vec_int_helper.c b/target/s390x/tcg/vec_int_helpe=
r.c
similarity index 100%
rename from target/s390x/vec_int_helper.c
rename to target/s390x/tcg/vec_int_helper.c
diff --git a/target/s390x/vec_string_helper.c b/target/s390x/tcg/vec_string=
_helper.c
similarity index 99%
rename from target/s390x/vec_string_helper.c
rename to target/s390x/tcg/vec_string_helper.c
index c516c0ceeb..ac315eb095 100644
--- a/target/s390x/vec_string_helper.c
+++ b/target/s390x/tcg/vec_string_helper.c
@@ -12,7 +12,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "cpu.h"
-#include "internal.h"
+#include "s390x-internal.h"
 #include "vec.h"
 #include "tcg/tcg.h"
 #include "tcg/tcg-gvec-desc.h"
--=20
2.31.1


