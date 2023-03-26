Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEE16C97FF
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Mar 2023 23:17:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgXjl-0007fX-1T; Sun, 26 Mar 2023 17:17:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <casantos@redhat.com>)
 id 1pgXji-0007fJ-ML
 for qemu-devel@nongnu.org; Sun, 26 Mar 2023 17:17:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <casantos@redhat.com>)
 id 1pgXjg-0000ny-QI
 for qemu-devel@nongnu.org; Sun, 26 Mar 2023 17:17:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679865428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=xj4sM3lbFdqgsC600ozfBDPIXeApJnWwpYuIkOH8xyU=;
 b=WbnR9pfXqXqLyQRcp9w+lNeKMrhlbs+KwTFXJ+mrsiT2KmxMSRrjxtekX3bVAwfI3UI/0S
 CcritpGw+RS/o4/nIGoMmMmX8+4PciciCcp+tFe15mBMAS8rUBhi0hYveMI0lFtSvSwHxs
 6Y1bdC03Uj8ae+xA3p9W1HgrLhxle/A=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-356-X0_wdMJ3P22fpD8bVHZo0g-1; Sun, 26 Mar 2023 17:17:06 -0400
X-MC-Unique: X0_wdMJ3P22fpD8bVHZo0g-1
Received: by mail-oo1-f69.google.com with SMTP id
 c83-20020a4a4f56000000b0053b4b212346so1553805oob.10
 for <qemu-devel@nongnu.org>; Sun, 26 Mar 2023 14:17:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679865425;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xj4sM3lbFdqgsC600ozfBDPIXeApJnWwpYuIkOH8xyU=;
 b=OXDUdHVWlWn4IUgpyDtG7a5CNEslg0/eSgfUWKsGi0xuZ7+mv0GGPwnKMinn9k4nTt
 jcfKYc9xonXm6nbI04kYF841EbmmmVzMv5OglCgiDXKw8UhBMUlnx5SKm3qO7o+2qoMs
 mubfdS8mv82dDMJ0iRTsh1+3Ek/I3AV8f6U9bCzsfqy9xymLRusOXu+6bNu/8FDpuZJC
 7h1Ihy/hRMbbBQiPMAshebm3/9a3EZq+lHCCYMV12UdKHkO9zfC3lBtMoQ+3mXkx+vQt
 8NFkRLqC/JNGYxkzWbi25LY+uMozcbb8m+pmt9WOG/etzUDt1tE3OjeKaNGRU2wwdQ06
 Tkog==
X-Gm-Message-State: AO0yUKWtQasS5iWjzEzBmeS4U9aC0nUjuBQkQjzLCgZNgcM7XRo45xxV
 E5xDgzYuwQvQCJ06mjB1nX+sWh9bmkaCiNAO1xdcb7RKH3Uj234v+nEZXIe7h23/bWECPf4qr3h
 8q4GwC2uOyVmkT5amcWMpGqqSz4afYoYp523evXSET6fgnbRXM5NxkGwkDozew/2LmjCKlT0xft
 8=
X-Received: by 2002:a05:6870:b687:b0:17e:752f:2263 with SMTP id
 cy7-20020a056870b68700b0017e752f2263mr4699822oab.23.1679865425497; 
 Sun, 26 Mar 2023 14:17:05 -0700 (PDT)
X-Google-Smtp-Source: AKy350Znpe/p6AkJd4jXuCH0Z2EdEIkfa4Zi+c/eMKRwjlrqqTZIwXGcPgh/R0GXBv7izOp1EUsafQ==
X-Received: by 2002:a05:6870:b687:b0:17e:752f:2263 with SMTP id
 cy7-20020a056870b68700b0017e752f2263mr4699815oab.23.1679865425204; 
 Sun, 26 Mar 2023 14:17:05 -0700 (PDT)
Received: from casantos.remote.csb ([177.158.139.132])
 by smtp.gmail.com with ESMTPSA id
 i18-20020a056830011200b0069fa6ca584bsm4984736otp.40.2023.03.26.14.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Mar 2023 14:17:04 -0700 (PDT)
From: casantos@redhat.com
To: qemu-devel@nongnu.org
Cc: Carlos Santos <casantos@redhat.com>
Subject: [PATCH V2] meson: install keyboard maps only if necessary
Date: Sun, 26 Mar 2023 18:17:00 -0300
Message-Id: <20230326211700.68254-1-casantos@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=casantos@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Carlos Santos <casantos@redhat.com>

They are required only for system emulation (i.e. have_system is true).

Signed-off-by: Carlos Santos <casantos@redhat.com>
---
 pc-bios/keymaps/meson.build   | 6 ++++--
 tests/fp/berkeley-testfloat-3 | 2 +-
 ui/keycodemapdb               | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build
index 158a3b410c..bff3083313 100644
--- a/pc-bios/keymaps/meson.build
+++ b/pc-bios/keymaps/meson.build
@@ -47,7 +47,7 @@ if native_qemu_keymap.found()
                        build_by_default: true,
                        output: km,
                        command: [native_qemu_keymap, '-f', '@OUTPUT@', args.split()],
-                       install: true,
+                       install: have_system,
                        install_dir: qemu_datadir / 'keymaps')
   endforeach
 
@@ -56,4 +56,6 @@ else
   install_data(keymaps.keys(), install_dir: qemu_datadir / 'keymaps')
 endif
 
-install_data(['sl', 'sv'], install_dir: qemu_datadir / 'keymaps')
+if have_system
+  install_data(['sl', 'sv'], install_dir: qemu_datadir / 'keymaps')
+endif
diff --git a/tests/fp/berkeley-testfloat-3 b/tests/fp/berkeley-testfloat-3
index 40619cbb3b..5a59dcec19 160000
--- a/tests/fp/berkeley-testfloat-3
+++ b/tests/fp/berkeley-testfloat-3
@@ -1 +1 @@
-Subproject commit 40619cbb3bf32872df8c53cc457039229428a263
+Subproject commit 5a59dcec19327396a011a17fd924aed4fec416b3
diff --git a/ui/keycodemapdb b/ui/keycodemapdb
index f5772a62ec..d21009b1c9 160000
--- a/ui/keycodemapdb
+++ b/ui/keycodemapdb
@@ -1 +1 @@
-Subproject commit f5772a62ec52591ff6870b7e8ef32482371f22c6
+Subproject commit d21009b1c9f94b740ea66be8e48a1d8ad8124023
-- 
2.31.1


