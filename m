Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 348984888F4
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 12:44:33 +0100 (CET)
Received: from localhost ([::1]:45316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6Wch-0003cR-Pf
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 06:44:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n6WaG-0001Wr-Ae
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 06:42:01 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:60725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n6WaC-0008B4-Ub
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 06:41:59 -0500
Received: from quad ([82.142.23.158]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N6bwO-1mIJtJ3wPW-0186TS; Sun, 09
 Jan 2022 12:41:52 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/4] hw: m68k: Add virt compat machine type for 7.0
Date: Sun,  9 Jan 2022 12:41:46 +0100
Message-Id: <20220109114149.1275322-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220109114149.1275322-1-laurent@vivier.eu>
References: <20220109114149.1275322-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:gtN4DuiNuvHdO93nh7q/HRx3Lc2OHDL9Ru4qTg+yKVycuX6mrqV
 VRjIwPTgbTGN1RdHpsXhMLmLo0n53G39n/D+9esq9ddq2LunIRIObeU8AFojQgSehIkQqFB
 aYOoS1VMY/ItiSTeragvYJsSSgzOIXwdy4d0dcJ517H/2ixO3fHdxw0UsNRy5o7zJ7CZWTg
 bAu8HJMhdRfiHZXdbvLfg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AI070UQ4B0k=:ei4S+Lz1FI25PS2R9oSw5q
 8nqL4bMI252/0NJF7Oa2tWaRERh2uurvOqo8zNAlLD2Wa0NCBxRN5WdyWrazLgqSLIzwUxdzq
 +fUWgKo2KndKtBi3AqsweU5j1WkVduMckWmT3sdHk1Dxfy16yPNRhS+n6Qa9WvHX0h8gUCL0R
 EEedVVPqOxvp8EfZkO/kGK0lGsq0fmQ2WE4JKU/Z2OQCJtfiBpFGEpwI/u7D4p6gwVBNnU9l0
 AbSrj3t5K163CNe9RQZRoVa+Uyj8syhSnuf2qwDrAblURSOS/S8MIVKPatZaq7ws8YNt+BJGQ
 yTr9/J5zen4WW9V8lGbXHg84zAwUi5SsBkoZreO2cpUWp1w4naz5hRl6R43ZxkRJN9eGh5hvM
 3AE4apr/JrcSFThx46deC39a+Txr4jgjsDtTsBbnQlvJAUxJBkKvGteyTOXbdS6g8B28V7v69
 E5p3TRZYSjDStnsQ7N62VtB5lcj+D/u8X3cPVDLLSzNfXAK2+KSfjioigs6MHz/2P2mMW8HCD
 3rmyPp3U7G4O1USG061dKKaTXBFSMPD4aU4/iIfKcDvMGa5un2tapmNpXkl4gFCj2wIZrmkLH
 tvE3vx+/LMLwyqYp1ewd0JKNbY3/LyougN0tFoi7DIrQ91hLdLiJSPVGFhIWywl4Su9keVWDe
 ALoopMI5NGZZJ+tG4Jn2zTkDXhnI/S4PcxDrcda6dJkhIPAQlz2rxE9gSt9FKkVkNtq8=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Message-Id: <20211218114340.1856757-1-laurent@vivier.eu>
---
 hw/m68k/virt.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index 0efa4a45c7f4..78e926a55457 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -304,10 +304,17 @@ type_init(virt_machine_register_types)
     } \
     type_init(machvirt_machine_##major##_##minor##_init);
 
+static void virt_machine_7_0_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE(7, 0, true)
+
 static void virt_machine_6_2_options(MachineClass *mc)
 {
+    virt_machine_7_0_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_6_2, hw_compat_6_2_len);
 }
-DEFINE_VIRT_MACHINE(6, 2, true)
+DEFINE_VIRT_MACHINE(6, 2, false)
 
 static void virt_machine_6_1_options(MachineClass *mc)
 {
-- 
2.33.1


