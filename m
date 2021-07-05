Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7043BBD7C
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 15:29:35 +0200 (CEST)
Received: from localhost ([::1]:44578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0OfG-00047L-Dm
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 09:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1m0Odh-0002q4-FI
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:27:57 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:41546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1m0Odf-0001lk-Vd
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:27:57 -0400
Received: by mail-qk1-x72a.google.com with SMTP id j13so16948224qka.8
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 06:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=XTM+3sYBUffREzK1B/qKsU4cSa/GcPwKh4v6J7Ke0U0=;
 b=meSLaoGDpDBd42ctVanRyFAuTzg21YW7+RQjgGPUt2t+GL695R9OaQuWbPnf3h31dW
 j20Jx9y2tzwH7kSrCd3ZAC4u6ebBcbjlOFbsqpsb06YzLNoxBWl08vSUhLBHjeJrKb2g
 ot+5sdMS3+lA8EKlV1Ux+9io+CcEkO5fTLCrpkJAQusfG8ApSUBwJAgy+uwABmOrPjbb
 dNTfJsfGelRdiA32IfS9j3rvSg6h7kuFEL8rdv+/GtTxrO4w0FYzLSpN6eg/0ifcThwz
 JfolJOD5HT2wEpDVPrNF9ckkFf+F0hx9ekvbr8RtcIUZ+7rp0vILMauXmMkZX6v1X/Mm
 MhVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=XTM+3sYBUffREzK1B/qKsU4cSa/GcPwKh4v6J7Ke0U0=;
 b=cQ3gZQANpw50uFfxeHqmfWbKXLS5MslDbaZ27hvZRATizdU/IRUVj32CyJioWROqpn
 R8sxPZfT9Eu4PnvRBxXyxUkZ/SIiSIsJdNqDcjX8wWm5mCyZJEslEIF65vP4y+yWNWvT
 F3V9+PC3mcu3rg2aHcwvxDTodQ+N2tWntbKtyJ9mEFhheyu6iPCUEbf6himXVEcFZ4Xu
 MT/u1lFKCWz/n++AOHXz0VUY9UHnfBFNUSZXfCMR1GVYhMIkSc9ASQDMNsufPEINvzFF
 9NRgKBNiaWRqkmhrnYoeYCK6vVxIEFfsINQrnajSUTt6orTu3qvwLr1qmElVLW1VOvlw
 epJQ==
X-Gm-Message-State: AOAM532ZvoxMX9S1n8aSc5RBAhLQTProqxJHRjPOFpGMKOZ+DnFabN2G
 llrLixw8Ev1cLADhg9R0jL8CTXOK/w4=
X-Google-Smtp-Source: ABdhPJzC0ay7rZeeYifDZTxm4uzZ05/HlOHNJLgNPa/xERSaPXBuy8LFBUNUCVOMsf6j6ghzBKYCCg==
X-Received: by 2002:a37:2e86:: with SMTP id u128mr13947325qkh.26.1625491673828; 
 Mon, 05 Jul 2021 06:27:53 -0700 (PDT)
Received: from [192.168.0.6] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id r2sm3688676qkf.94.2021.07.05.06.27.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Jul 2021 06:27:53 -0700 (PDT)
From: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Help with patch
Message-Id: <CD536CB4-9110-47F4-8357-F9F2C867A532@gmail.com>
Date: Mon, 5 Jul 2021 09:27:51 -0400
To: QEMU devel list <qemu-devel@nongnu.org>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=programmingkidx@gmail.com; helo=mail-qk1-x72a.google.com
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

Hi, I made a patch that adds an icon to QEMU on Mac OS. Who should I =
send this patch to?=20


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



