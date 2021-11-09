Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4A744AC63
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 12:17:02 +0100 (CET)
Received: from localhost ([::1]:44584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkP7d-0004H8-JL
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 06:17:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mkP64-0002ON-3F; Tue, 09 Nov 2021 06:15:24 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:49303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mkP61-0003jU-Lr; Tue, 09 Nov 2021 06:15:23 -0500
Received: from quad ([82.142.14.190]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N5W0q-1mdKmb0zX8-016xkc; Tue, 09
 Nov 2021 12:15:19 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/2] hw: m68k: virt: Add compat machine for 6.1
Date: Tue,  9 Nov 2021 12:15:16 +0100
Message-Id: <20211109111517.996104-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211109111517.996104-1-laurent@vivier.eu>
References: <20211109111517.996104-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:RrhAaUco+x5KzyfwlINS2hTyhKTOfocbZHTrLaZq7bEJU/ub6qQ
 JL44p9ho6GteuffBK+TeNSsGXt23AXU25xh+5f0ZuQHAzAmxZwhf6NFbcr2cgCKQKLkt7ec
 2phvXnwQKOxyomqgLLlCqEsXXgcQ4svLbldbtbekCh1tItTo+qBY9wjPVBm85m0o9i1pP4Q
 RZS/jHpGP8W530AexKtqQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dMeHpY0EqmY=:9NiMtV6g3yxs/CWjaA+EMO
 aTraUaFBJoZjNSxhUMJVp1IlYgg0r6VAGyMw8I5D+EnX3VXCMknZ00jj/J/YompxL0gz9Ud6w
 SzfZkcRUB3fT39kx2Vt0AA6dr9VurRYqJHARFZ+YHZSTWPPVeTcWzFeHepMEcxXYgjmaLEYeh
 uOyDn+jBhmeQS55y+pagKpdSnXX20oPEgRJL1GWCI7x6QWNe/DjlIZnS2oh2e7hwPg8EdAI40
 AA8i89+dwnbP5zeo3VZAFwUXZr37lJyxTTRDaPCQjW5hY6thwfsBeyu+jiILgZjfXCAvyqxmF
 sKa3TGY2koxzjf9syi9ozZkL3ezyszfz2u0pVN3XtGSd1KeoZ3zSS9qumnv+kQyiD1jNHbOCX
 p4vnVHaTY2hP7LYsISSaj+9KJ+hlTbW8Flvvw6XxP3a630O87UmSmgfJc4kZNEH9srO7R1YFS
 PDb3bLTpwQOgKCNYjraK+BteCHq7y0FvA0frucWkfc1qwSh1NxH+KUytaIGxjHenrwQg9zFjZ
 evCdP/9LGTeYioQT9du67R8XkumPK7zf97O5shbCX1xoOBqXyUvYp5PoIaEkRit0L/iAveI+5
 U7dPqqOUd91C38YNFOuFQ4Z66KzYH5CFVWw09Jmcjs2LaTMU8kNaaeIr5SI0V0fNmEwf2NXNB
 pGuZaTUGv9e9103I8iMsJffI4FYpydSvuQYfEvH1fvEquQekwDI4UlBT4QbG2P5nMDYc=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the missing machine type for m68k/virt

Cc: qemu-stable@nongnu.org
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20211106194158.4068596-2-laurent@vivier.eu>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/m68k/virt.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index 4e8bce5aa6f7..0d9e3f83c169 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -304,7 +304,14 @@ type_init(virt_machine_register_types)
     } \
     type_init(machvirt_machine_##major##_##minor##_init);
 
+static void virt_machine_6_1_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE(6, 1, true)
+
 static void virt_machine_6_0_options(MachineClass *mc)
 {
+    virt_machine_6_1_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_6_0, hw_compat_6_0_len);
 }
-DEFINE_VIRT_MACHINE(6, 0, true)
+DEFINE_VIRT_MACHINE(6, 0, false)
-- 
2.31.1


