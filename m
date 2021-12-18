Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB74A479A9C
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 12:46:29 +0100 (CET)
Received: from localhost ([::1]:59932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myYAW-00068Y-FH
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 06:46:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1myY80-0005M8-B7
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 06:43:52 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:46999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1myY7y-0000fk-Ob
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 06:43:52 -0500
Received: from quad ([82.142.30.186]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MeTHG-1mO7Ra1gzU-00aWJq; Sat, 18
 Dec 2021 12:43:42 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw: m68k: Add virt compat machine type for 7.0
Date: Sat, 18 Dec 2021 12:43:40 +0100
Message-Id: <20211218114340.1856757-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:i4Zx7VrKCz6qfpygc0r4LZIJehI6RNSYVhfxl8hALUBP9X84gDj
 g9VyxIxVeaNcgVC+2B4hkAYUByQW9c6XTUES+iMabvE7VpzdHeDkQhpObv19Y+x9l4H2JFD
 bVlNXFidE6th28aRj1AICZw+EcAquo4SGbRlt2NnxeimzctWsfudr6tEpms6b9oWtsrPFGd
 wFHhTnsWY6T+369elRePQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IA4Jwj5/lQA=:TLT7LRbv7lwKFnlq19p74U
 gdM5PKstdI8ZXtAuzn0/l08+Il5ojPRmuMR25SvGDnEx+011bEwU2pRFvdrkmxpmFRlN/IomZ
 ubNVHAogyGSdAadbezKD5YRO5hAdTjs7dBjpZXIk9XPmiqE+n6SNcoSi1rRqGHuSK9cpPcILu
 Z/RSWbx/7PaSt1rBH5tbIu2hqzhr896s8WXmkd0hxuOIYZCEgxUWybdsfxcfaqDJ5iUZ9eGEK
 i3pcdcULi4qVDcDbQvYq+GZeTUs3M6bm/nSof8mGu1ZTEhuEi0b5Mjlff18gCllOGMp1xmi9R
 8CnxNNl82ZY6Q6HzHDROMtJTWTGhZK0ihPWjI5Shi6nAxbMjJUHDQT9qbMRTqNc3/Dkhjor+X
 Ib74T0snxkBQQ4gTtSAMdYM4MsdzdSJ2QkLP//4pjGRo4EnkhODPDuUZo1ANpLjShyXphdZ51
 ekF5bmgIwZnmw2lUYJrj86xitg2WhvgYLm9u694Kt/YeCRPkYfSs0D8ZxMiYnjwNgQOxMgL89
 X0tE44ddRgESq+wcwKSiD8c74j5f2FsGn5+zRCzIj0nX4qht1ixCTQi+/U1YQDU5VtvFOg/Ao
 cfIHFcSYeQjeA2QwGGbS+SHQkltRdHksyYw1jCeiaNpLoUxNP0jpYagAth6iPzpPcJQD86GFV
 BL1ciBw012BGEn0tSbxS0a+DrAdERkj/SVA1afTu0F98LWQQw43C5w4+l8D5WsRSQ5WY=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 Laurent Vivier <laurent@vivier.eu>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
Based-On: <20211217143948.289995-1-cohuck@redhat.com>

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


