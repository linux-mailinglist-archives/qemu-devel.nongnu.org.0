Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C41356FDA
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 17:09:38 +0200 (CEST)
Received: from localhost ([::1]:51176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU9oH-00070J-Sq
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 11:09:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1lU9h9-0002uA-8H
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 11:02:15 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:33374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1lU9gw-00067s-He
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 11:02:14 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id es6so2527421qvb.0
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 08:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :cc:to; bh=wy2PFIY18l7s7W//JJPmfigYRWpOCBLFkZME5KfRKvQ=;
 b=vfjeZE9VFedH8ny4ce+MdlNQOJ3p+/bYHFR/t8NAtgKV89Y9pBotAshV254X2LXB9o
 WvDnnB8ektHyZWgmh7zn3Kz9gaLBr1D+vqmduO3bkbb9jRtiKnuW0c0OGiZm8VULMGz5
 +gFmm01xmtYnbdnk+77OF3js4xli+Aw5cyTouYJkBXgnSYT848xjQzwi4eoP5qPu0PHm
 yezNvYkzyJtkRwq3GtIm6lSa4gVUa3oyiYyGAhln3Pv6Xvq+Wk4WjpuYHgOltPWCNxtO
 ymz5S9oyi9IFYr9W/2AalTW9Ok1H05qArfNWbDgJMJrpuLZ8Rt5LcgpuLD8MPQp+47p9
 Naag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:cc:to;
 bh=wy2PFIY18l7s7W//JJPmfigYRWpOCBLFkZME5KfRKvQ=;
 b=RLQ2oly8/XbRWtzx2aDLCKVlSvq1bCH/LanbG7bY85SKtO+kH5A22bnHi82+Od/Ofe
 fK9XR29/FvoaywJhV8wiZevn5BJAwQvJgFbpU37PaWd0qdzZ16wzpsKB+nOi3Qg3Gfrs
 WSKMAmUHt8HuQ9cmoIj232ykUcfX7eMKec6kETSYNo8WN7NNTX3sGQxfNCsVHhcb8m3n
 zZNBe81shlI83g1lLqOS3SZOx0Ja/NzD8AM6VXX8OvcdKVqb5t4/j5wwCnjnlpb2xPwo
 EPkrOLiSI623xusllI7f52Jdv+1xxDK9swQVseAO+vnC7cbxCWgNlzpNVd+Os3pDuZt7
 6RwQ==
X-Gm-Message-State: AOAM533V7ILNqKQvkplhDBOQna0q4FeGvMWEqYqVIRraTzwA552Ift98
 i2RIsVM0o9khpMxtrv73HnY=
X-Google-Smtp-Source: ABdhPJyuzOw/jgQnFaYUtgmkl5fE2JBIntmBp/5V65R8I3tsesqqf0AQx6Z2Yol2g+wiSATaAhimAw==
X-Received: by 2002:ad4:4f28:: with SMTP id fc8mr3968790qvb.10.1617807719688; 
 Wed, 07 Apr 2021 08:01:59 -0700 (PDT)
Received: from [192.168.0.5] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id r13sm16335916qtw.37.2021.04.07.08.01.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Apr 2021 08:01:58 -0700 (PDT)
From: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Ping: [PATCH] Set icon for QEMU binary on Mac OS
Message-Id: <C474F7A2-9BDC-427A-9018-49BFE26C907E@gmail.com>
Date: Wed, 7 Apr 2021 11:01:57 -0400
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=programmingkidx@gmail.com; helo=mail-qv1-xf2e.google.com
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

I haven't heard anything about this patch for a while.=20

=46rom 45650a7f52deb8c2c436d71a3fcf5326287c2e05 Mon Sep 17 00:00:00 2001
From: John Arbuckle <programmingkidx@gmail.com>
Date: Tue, 2 Feb 2021 08:35:43 -0500
Subject: [PATCH] Set icon for QEMU binary on Mac OS

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



