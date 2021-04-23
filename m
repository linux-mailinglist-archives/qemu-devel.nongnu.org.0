Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AF3369BE7
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 23:10:28 +0200 (CEST)
Received: from localhost ([::1]:58168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la34F-0003uj-ER
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 17:10:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1la32o-0003Ax-P1
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 17:08:58 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:46852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1la32k-0008KM-U1
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 17:08:58 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id h3so23714612qve.13
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 14:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :cc:to; bh=pmKHYdip9tGUi6ha9yUXrXtUUDtp4zHZ2q42gKwrzas=;
 b=Gmu43cm/k3m+GeAhvhkb5kN35SmczWm2fEe4iMOwyGY3TWQnhDHquz1TTcxr3okBEn
 JYKGu2Y18uhXiArlqknMtSGHde08rAqx8KYy2mLLTx5RFRAoa3VzVH/xHn7+h2266RdK
 JieWTCv+IKUaf688S4C9gBwjr75g86I/gWB9elQXj8ue7Uc254+xtM+gqCrv8fX3KsDd
 q2GDiksd6UYFgpqNYKSs7b20vneP7VjBZQxS8vvrcqapgWxYOf08lIs2vGoxdK7LPkCU
 Sg46Bzq8c1Brzb7NZ3FaQhU+duAyzX7+egzJoSBXetc/8J+MHJs7Wdxhs92TqsiBNvJ6
 Eq6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:cc:to;
 bh=pmKHYdip9tGUi6ha9yUXrXtUUDtp4zHZ2q42gKwrzas=;
 b=U3E2u38A+JRGmfkbwA4VgQTN+vzv/yDGI5Gc1TkB+K15/CNPBD90PBvt15UrzO9wJw
 kFPVbZ7q7qtvymwk2HA4oYuL2IdMh+yQG2N5uZUcX3V28Tt5iTWDxjqDVYut/QkK2Kar
 /9/HcOFJaS/HB5AKCJJPQslpdzDIB11zMMt8IcXtg6yl6TOPT2QekyhM32Lt0qlCoBBB
 Koxy0EviCW5QA013KPEcWHGrxKhGJQXia5/h9ADdxRkvnDNuDbVQbzymvmF7gBq8oimp
 etw3G5U6z7H/mnIQVift+s2VPCzWFzo2PUwCBbaYfDRqxo50OwIopavrJWt7GNuWODNl
 VLqQ==
X-Gm-Message-State: AOAM5311nr8Wb8L0LCbp/dowuyyoiRWFr3M/UgpF7M+vu/01JjXdhZbL
 oTB30xGQHDsh1GhG5HGOAR0=
X-Google-Smtp-Source: ABdhPJyLcpzF1RFE1UWvNP5qaq+y1RdxvWOScRKZGCbYW1vicf9goJaizQ6CjLD/XqoyDQKK+SdbCg==
X-Received: by 2002:a0c:f54e:: with SMTP id p14mr6227648qvm.61.1619212133362; 
 Fri, 23 Apr 2021 14:08:53 -0700 (PDT)
Received: from [192.168.0.6] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id n6sm4973521qtx.22.2021.04.23.14.08.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Apr 2021 14:08:52 -0700 (PDT)
From: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Ping: [PATCH] Set icon for QEMU binary on Mac OS
Message-Id: <7846F474-7718-43F0-98FE-933956352F0D@gmail.com>
Date: Fri, 23 Apr 2021 17:08:51 -0400
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=programmingkidx@gmail.com; helo=mail-qv1-xf2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: QEMU devel list <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch was submitted in February and I haven't heard anything about =
it since. Could this be included in the up coming release please?


=
https://lore.kernel.org/qemu-devel/20210202134410.9274-1-programmingkidx@g=
mail.com/

Before switching the build system over to Meson, an icon was
added to the QEMU binary on Mac OS. This patch adds back that
feature.

Signed-off-by: John Arbuckle <programmingkidx@gmail.com>
---
=20
meson.build
 | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)


diff
 --git a/meson.build b/meson.build
index f00b7754fd..7f534f4e75 100644
--- a/meson.build
+++ b/meson.build

@@ -2183,6 +2183,26 @@ foreach target : target_dirs

                link_args: link_args,
                gui_app: exe['gui'])
=20

+# set QEMU's icon on Mac OS
+if targetos =3D=3D 'darwin'
+    newiconpart1 =3D custom_target('Icon for ' + exe_name + ' - part =
1',
+          depends : emulator,
+          input : emulator,
+          output : 'new icon for ' + exe_name + ' - 1',
+          command : ['Rez', '-append',
+           meson.source_root() + '/pc-bios/qemu.rsrc', '-o',
+           meson.current_build_dir() / exe['name']],
+          build_by_default : true)
+
+    custom_target('Icon for ' + exe_name + ' - part 2',
+          depends : newiconpart1,
+          input : emulator,
+          output : 'new icon for ' + exe_name + ' - 2',
+          command : ['SetFile', '-a', 'C',
+           meson.current_build_dir() / exe['name']],
+          build_by_default : true)
+endif
+

     if exe_sign
       emulators +=3D {exe['name'] : custom_target(exe['name'],
                    install: true,
--=20
2.24.3 (Apple Git-128)=

