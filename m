Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAC43BBDED
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 15:56:38 +0200 (CEST)
Received: from localhost ([::1]:34902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0P5R-0002Pc-Gm
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 09:56:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1m0P3V-00014y-Kh
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:54:37 -0400
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32]:46615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1m0P3U-00020V-4S
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:54:37 -0400
Received: by mail-qv1-xf32.google.com with SMTP id g15so5868675qvi.13
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 06:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=LbvrBxtF0N6wyl7nFcuT1QdGTNRdy6hVdSgYSkKa3Kk=;
 b=J6u5aSeVK8sdsPMqKThTlGgaROai2Ju5KVmTebvGXX78KFcIj+rQU0UZYOb8tWKAcN
 rM0CdbAzQYuE7fHCik5qKPEtAX+ImMUJwXUID7LCHbVJFRoQJ1nvvXWni7/98wElZJch
 qzV6PS0XYJOn8KN4DdJI5cYLvrEWVnSjSQAM3GGG4crM0bd20AhODZD3fPYAasVrOju+
 4zNuftG8fSKgB3foGkSXPlP7SBZc3uLBM1Qc/tXHM5X1wgwirv3a2pW3oVYKa+NY+Nzw
 W0tTgjLQx8d4XSpFxdiwb6reuH1v3ljUrE7FnMfbhEIuaNaZ2r2yHEAZL282Cd6cAmD3
 nUhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=LbvrBxtF0N6wyl7nFcuT1QdGTNRdy6hVdSgYSkKa3Kk=;
 b=WT0aFIZkz3R5G+K4jlX2y/imeB2lj2LjMeoBenerdEUQYA3hnH2Y2T2B7A74rz20NY
 spOKCr95H5IEgZ9TUS2epKPFsAZJqukSrdYytIfDngEKZD0NIVf+II+afuZHsHiEc3Hh
 cU+NJPTGX02aMLcFR5l7vqsBuLxpSEajm5KCwvTjf1E4hth+4Jg5QQv2WvxHnnF3WOU7
 6miXcIyKOmmiUth9Y5+N+ITuOaiZEHKXrxH8/fDp2k+at/wvjCLrHF35AFWu7bx6pr9e
 Itb1oDV6nUYawzEqQcIqkl6aS56EffLUqxxyag6vHAOT6GI/DRrzifoNvzD7TA8E4CpK
 1viw==
X-Gm-Message-State: AOAM532FVF3essRmKKEwyUrE7tyWw0oleZUW1bwY+71EOOqj87MTeQeZ
 WpDHUslSF1Ae/VKRvwda7oY=
X-Google-Smtp-Source: ABdhPJy6ohtVh3Oghye/c0n1tFakFJmYaY24xLt/RhhFkFPRAVLCsmQ2cdsueEtN9sG4pww+fdq6eQ==
X-Received: by 2002:a05:6214:da3:: with SMTP id
 h3mr4359233qvh.31.1625493275212; 
 Mon, 05 Jul 2021 06:54:35 -0700 (PDT)
Received: from [192.168.0.6] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id o66sm5530006qkd.60.2021.07.05.06.54.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Jul 2021 06:54:34 -0700 (PDT)
From: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: [PATCH] Set icon for QEMU binary on Mac OS
Message-Id: <325BA2AF-B4F5-4134-BF90-63282E0B2A46@gmail.com>
Date: Mon, 5 Jul 2021 09:54:34 -0400
To: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU devel list <qemu-devel@nongnu.org>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f32;
 envelope-from=programmingkidx@gmail.com; helo=mail-qv1-xf32.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Paolo, I was told you were the one who I should send this patch to. =
Please let me know if you feel otherwise.


Before switching the build system over to Meson, an icon was
added to the QEMU binary on Mac OS. This patch adds back that
feature.

Signed-off-by: John Arbuckle <programmingkidx@gmail.com>
---
 meson.build | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meson.build b/meson.build
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
2.24.3 (Apple Git-128)



