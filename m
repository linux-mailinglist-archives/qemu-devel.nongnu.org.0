Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 454BF394C88
	for <lists+qemu-devel@lfdr.de>; Sat, 29 May 2021 16:37:02 +0200 (CEST)
Received: from localhost ([::1]:53710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ln05F-0001jz-BK
	for lists+qemu-devel@lfdr.de; Sat, 29 May 2021 10:37:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1ln04T-000131-9b
 for qemu-devel@nongnu.org; Sat, 29 May 2021 10:36:13 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:33527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1ln04Q-0000bK-CX
 for qemu-devel@nongnu.org; Sat, 29 May 2021 10:36:13 -0400
Received: by mail-qt1-x82c.google.com with SMTP id a15so4896753qta.0
 for <qemu-devel@nongnu.org>; Sat, 29 May 2021 07:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :cc:to; bh=ngTHq4uZ/3YhGRj3d1E2PZpFyjb2xsjU5E6Qfyp3oPA=;
 b=qVHCW/Z1j30y6zsiPLLrW19RBZO6EDenptDoED4AYMBHeTM0Dz+/suD7cqvyKqus0D
 19D0B++bIj7+mJKu1fPw6Q8+7lU9+BRBnEzp/9K/Od9moOH9RHPI/MuN6B9VkiccmDx2
 hOj+9WMydL0vOYpm2o3C9WSI9HWEOLkXqeR2QD9kILnxiOqYoFfQgHOvaauhO5pp+Lnl
 9XCR6DB1Qd7GOGTDJ1lDjF1TcJVpEPsMrrfQyUsfBa2JSokEeC23ZPAr96BwsRClSkHJ
 f7tfahyZmIB1+YH3MP498KmxuyXEzIb2Zmh5LZnjDfA3m4sfWYDjv/i3UWiw3u587h9o
 v19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:cc:to;
 bh=ngTHq4uZ/3YhGRj3d1E2PZpFyjb2xsjU5E6Qfyp3oPA=;
 b=XLpD9hROZLFOFS2e/AKLu1sQTkyiUxaPRcCqtRUzwkrgX1Ip/nD2zqAWcz5yU1hhsl
 oovu6K7PHJ+XMkIyHz4/DWZFfjwqXUrUtfDEnDgTWX8NK6HES7/dKgkeBwTwcoH7mYS1
 06UI8JbTouf8TKdHfyRqCx5dCuqSFOKMak81P9ADmSoEqJFxWdAv/SMWgWkWMeWHh5pX
 QqsVtdFqB4AtlSwGWkKW0Xi6W3rJHsS6/k/NKtTuosdVsJRNLuAGmyP+h08tBGys90NQ
 fM8kg/RW/L/LK2n9GcftqXjb8/n+UdpGMKgM5o0XpjeWusvSEo78MkEMQNdxEsjuay48
 55Hg==
X-Gm-Message-State: AOAM532fCzLNfUfgJeKqRovZaIPFeK/i7jR4QpIUI/oVQ7wYQiUoGb7U
 upfzWf2wXnjgeDT/9itmWKE=
X-Google-Smtp-Source: ABdhPJyC6USeQIkmbnvHLKvCEMuMxGj1f722qoFDKMlgdqtjRd2qa3iZPNWvtpdO1a4Pn8qbJ98bSw==
X-Received: by 2002:ac8:5bd5:: with SMTP id b21mr7780196qtb.317.1622298969403; 
 Sat, 29 May 2021 07:36:09 -0700 (PDT)
Received: from [192.168.0.6] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id t12sm5288440qti.22.2021.05.29.07.36.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 29 May 2021 07:36:09 -0700 (PDT)
From: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: ping: [PATCH] Set icon for QEMU binary on Mac OS
Message-Id: <BCFCB4F4-5A5A-4CC1-B5D1-4C7D1E396D46@gmail.com>
Date: Sat, 29 May 2021 10:36:08 -0400
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU devel list <qemu-devel@nongnu.org>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=programmingkidx@gmail.com; helo=mail-qt1-x82c.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping,=20

please implement this patch. The default icon on Mac OS 11 is not very =
good looking.


=
https://lore.kernel.org/qemu-devel/20210202134410.9274-1-programmingkidx@g=
mail.com/

Before switching the build system over to Meson, an icon was
added to the QEMU binary on Mac OS. This patch adds back that
feature.

Signed-off-by: John Arbuckle <programmingkidx@gmail.com>
---

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

