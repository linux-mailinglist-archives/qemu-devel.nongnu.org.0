Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A2944AC6B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 12:18:36 +0100 (CET)
Received: from localhost ([::1]:48872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkP9A-00076s-0i
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 06:18:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mkP63-0002Nx-O7
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 06:15:23 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:45827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mkP61-0003jY-F2
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 06:15:23 -0500
Received: from quad ([82.142.14.190]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1McYTD-1mAW302XL3-00cyRN; Tue, 09
 Nov 2021 12:15:19 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 2/2] hw: m68k: virt: Add compat machine for 6.2
Date: Tue,  9 Nov 2021 12:15:17 +0100
Message-Id: <20211109111517.996104-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211109111517.996104-1-laurent@vivier.eu>
References: <20211109111517.996104-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:NF8sx9Tq0T2xwA2pElJGBJO8FXNZRCd8BMqWkRcGy5dklu032gX
 ETgAPkusnQWgqZXCwnyPhtY60VsFQfggjIt0i7mGxsxU89P9pg6HNaNO65BRZJUiv+J27Y3
 yzDdVjPbAFi13Ih9uquCg3/DSw/6AkSbLsIsDfliaBzmaGHqtH5Ph8lBvQ/JjjjHBz8O1B9
 IlMjTd6SZXVe70s8P8+OA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JsSPdcmit+M=:39lUKgd5xarAPYIoEyypo1
 cdlMnmDhKto2MlKC/1pC0yCatoU+QUmOFubQR/DIyw/vmHRD79r3UVvAZaE4qhW3jaw1oeT9o
 tHEGa61+7rez2Hii7+oGJbwHXW2Niy12zgqLEy/2dFEcOD9ubmWIaTksc4sV3S27ut4jlnmJq
 Qc0K/0EUn7fpoZ6wOtmMaGtWgHH1HzD7HuJ/6oCFL8dX5/L85mQD+ixxR3qafr0cGt7AAPCNy
 fa3ozc+kt+dIrD/oFJynSIVCIWZio8Y5pa/q3zCyHUUXE5zgxgXfoadk5BWgmoUZRCGlXU6RA
 s274gSdnPSOzMrOMjEI3DRdA+2Dc8Q1YocdoDMU5SCP9EabbfWgk7ZgmkCFNmJ01mUeoFwRRN
 t50JRS5YOImYRiKOn9F/wbob0l/HP+bEaG4432pWy3sSpZ/DBoOENqdjNFThiJxSa67vUS2Li
 YPorFDYd58+GUQJTqql6WC4WQcMBnhZq7EFe3NkCBEoWX0qDmXlPA2sd1Q45IGNypbe9nBgnz
 fvfZ4zTkEPK3zov/SecG8qYtRwF8z415QSAXoDPbFq0E+JjmubfybOFKmNZIASuKiGk8bmLll
 dBNpJkwC+nS2O6ZfICQJWqK4FDURxUeOViijrDfN7kq1yOnl4a9j94v2fElBCZ6k/QvO3WeUm
 WcMHnM+yxVqPabm/oF74T0C9tjDXDNBS1CglnTZII/BUWB5r42kNdXNxBVjJ37teBdTg=
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the missing machine type for m68k/virt

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20211106194158.4068596-3-laurent@vivier.eu>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/m68k/virt.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index 0d9e3f83c169..978c26e025a7 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -304,10 +304,17 @@ type_init(virt_machine_register_types)
     } \
     type_init(machvirt_machine_##major##_##minor##_init);
 
+static void virt_machine_6_2_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE(6, 2, true)
+
 static void virt_machine_6_1_options(MachineClass *mc)
 {
+    virt_machine_6_2_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
 }
-DEFINE_VIRT_MACHINE(6, 1, true)
+DEFINE_VIRT_MACHINE(6, 1, false)
 
 static void virt_machine_6_0_options(MachineClass *mc)
 {
-- 
2.31.1


