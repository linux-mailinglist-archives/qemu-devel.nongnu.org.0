Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F6556D54
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jun 2019 17:10:34 +0200 (CEST)
Received: from localhost ([::1]:40952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hg9ZB-00079n-3S
	for lists+qemu-devel@lfdr.de; Wed, 26 Jun 2019 11:10:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38484)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <laurent@vivier.eu>) id 1hg9Xu-0006Wf-UW
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 11:09:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1hg9Xt-0006q0-WF
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 11:09:14 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:42103)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1hg9Xt-0006o4-LH
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 11:09:13 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MqqLB-1iJOFm2Ukb-00ms7f; Wed, 26 Jun 2019 17:08:59 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Wed, 26 Jun 2019 17:08:55 +0200
Message-Id: <20190626150855.27446-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:EYjruPF7k4nQmEO6Ff765BLnqKch8bUucno7HCiydvJihes5IpM
 W7+RGK1sKLR6siUllAas4/bJq/Q8CsYYKuQEmgkj9h5zTqvsQL63YLDZmwWZi59+fzxZ449
 XOv32w8bmsKnAuwmRtifVFt/Sb7/L2Zfijz615LlLyqvPEQE6XyRXFZhTFHu7Z522a0cUO2
 zG+Hkukq61PXAQE2Jcruw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fBQEGMG+siA=:cQYFBKyTiKP/7EDtZhSKry
 AfPk2XYZ3/nyO3G0ApcbWV0NRtNn3brzjHLSOnc+LrX03tBwcE/e6ITdsGpVrwGyLdE3YNL9q
 l4KUZmqWaQOsG5faU1nrHP5CsNbk6GA9VnziUrfS4fh498PuQnb+0R9fds3mqG476gAqp4Pog
 TI1C0VVCtPx42qpXiEu5SW2mfja/ERhMjTFXFn29YFcBlMU6StB94UB4ArOoQYslm+qWpQTkP
 +xxcVoA0hCwwaBezNBu0+PbgW1lfsa23uJGp52b8Ko3UpLVNkvAVUih0Z0D0pvHk3mNemcGyg
 t0ovF2uEm46zrKak3MM3esxYVv9wmEh8OLEAzxSDLXk+blg/jL/bvdVcG1xSVM51nI6EVOBNU
 ab6GkTLqsk9eYjKa/sNoOB9oR6yrBD5qniVHL7CS4z/X1oJHCtEKysjj3dZl+ZI+XJDlJM9Xq
 iXjcQTeXPCGgYkrhC2GiyLEsq6+/WovEclVwQdRL1QAp1aohVb8cEKWrEDsEp9/tnIQkf4SDp
 3o2o0ssIU5c78O7FWjcpIaLofqRNfyfzDL5Ucf6pPvqdyelZO+hu379+22mmwXDvmszccu1j3
 Z9VFTDATREUM5Q9XhcPD05MO2oP4xIaPMl1TqrNMLClGWupNmiGb/W3DyPTpjgv4rw7U93rhk
 riIbRpEXyK4Yfia7KXHBLwyf2B4896JtLmP54f4r09o4672PZtuEYYS+4eQrs+GKtJatguJxA
 bcGJeHYmBFzDO9L/vX0yp4OyzePGhx20a2KwTQ==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: [Qemu-devel] [PATCH] linux-user: move QEMU_IFLA_BR_MULTI_BOOLOPT to
 the good function
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU_IFLA_BR_MULTI_BOOLOPT has been added to the wrong function
host_to_target_slave_data_bridge_nlattr(). Move it to
host_to_target_data_bridge_nlattr().

This fixes following error:
  Unknown QEMU_IFLA_BR type 46

Fixes: 61b463fbf6cb ("linux-user: add new netlink types")
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/fd-trans.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/linux-user/fd-trans.c b/linux-user/fd-trans.c
index 612819c1b1ec..60077ce5319d 100644
--- a/linux-user/fd-trans.c
+++ b/linux-user/fd-trans.c
@@ -483,6 +483,12 @@ static abi_long host_to_target_data_bridge_nlattr(struct nlattr *nlattr,
     case QEMU_IFLA_BR_ROOT_ID:
     case QEMU_IFLA_BR_BRIDGE_ID:
         break;
+    /* br_boolopt_multi { uint32_t, uint32_t } */
+    case QEMU_IFLA_BR_MULTI_BOOLOPT:
+        u32 = NLA_DATA(nlattr);
+        u32[0] = tswap32(u32[0]); /* optval */
+        u32[1] = tswap32(u32[1]); /* optmask */
+        break;
     default:
         gemu_log("Unknown QEMU_IFLA_BR type %d\n", nlattr->nla_type);
         break;
@@ -546,12 +552,6 @@ static abi_long host_to_target_slave_data_bridge_nlattr(struct nlattr *nlattr,
     case QEMU_IFLA_BRPORT_ROOT_ID:
     case QEMU_IFLA_BRPORT_BRIDGE_ID:
         break;
-    /* br_boolopt_multi { uint32_t, uint32_t } */
-    case QEMU_IFLA_BR_MULTI_BOOLOPT:
-        u32 = NLA_DATA(nlattr);
-        u32[0] = tswap32(u32[0]); /* optval */
-        u32[1] = tswap32(u32[1]); /* optmask */
-        break;
     default:
         gemu_log("Unknown QEMU_IFLA_BRPORT type %d\n", nlattr->nla_type);
         break;
-- 
2.21.0


