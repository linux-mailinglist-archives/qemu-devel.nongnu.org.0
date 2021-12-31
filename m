Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 608494820F1
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 01:09:25 +0100 (CET)
Received: from localhost ([::1]:38986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n35U4-0000ky-82
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 19:09:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n35Ss-0008Nd-Sw
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:08:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n35Sq-0002As-M6
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:08:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640909287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sMo8+9HAMD4muizFSIM+Foi4zMhInQ8Z6O2BhsG6c4c=;
 b=GfrK7lCKb23hNMghblqWzyYLsWyiDuHj7BEU6vTM8XFxuel/bxgiN6u1cY1VIAVIjnDkWn
 H84Gj9pjPMXqqFjNJM5hZF8UtKGC3401nVkbjUOmiVrq4J4Vl5c8K7b5qrNo+A09ENQ/A6
 S1FJILFSdTP9Hl63FZRgZTKdwORfo9A=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-6CAqCx8gMkyXDPxOC9l8LQ-1; Thu, 30 Dec 2021 19:08:02 -0500
X-MC-Unique: 6CAqCx8gMkyXDPxOC9l8LQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 o20-20020a056402439400b003f83cf1e472so17979188edc.18
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 16:08:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sMo8+9HAMD4muizFSIM+Foi4zMhInQ8Z6O2BhsG6c4c=;
 b=XyPE5kuV2D3z0jqBdhfoP45gXlPYT2tQDc+ZrfzrbbUK04Nk2ZFzuaAQoKBXcL2hgG
 Ut72R+wbBuTtlLKRpy/VLiTwjTJv6qKB6VLwyyV/m+rL+Efctr89kw35SoussubxDZQY
 35ux2yQeM5ltlEv+aFa20qZo1O7k2ByQQq4zO+84eARLKDq0ssU22uBcJwKj6w8HLQ6L
 98p05ar7KHP7jkyMuAc7sPusKUm/iNWD3aiW22No2kmSjrh+NUqXspS2TUwAgx1Nax4M
 6m2LPFs4Xwx0aiaFnr1N4nZA63eOTorVrIe4FWAFJdblaV6t7TKfJlugFYhS6D/xXXUx
 zRbA==
X-Gm-Message-State: AOAM531CuR6lGVJLcrBhUqPm9NIzHJlmjaxfJsAyvWU9SVnOdEiOwAe2
 R7K5R/vV++S/bWSQ83sFxdTE68fVFmBlzmlCihETTMD+5b1+ipz4eXAWnP5oEJyepv24gAFn+44
 oxA7IfClKz62TUKhdJCvCAo9w9Tj+PcrFvr82LI4o+HiO/WJrNhL/YwV0Eh3z79xh
X-Received: by 2002:a17:907:76d4:: with SMTP id
 kf20mr26457782ejc.44.1640909281680; 
 Thu, 30 Dec 2021 16:08:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzy7IVy0qW/Y9tw3bqjZF0vGMXGbzFHGhSEmwk4HzUMnuI6ZbXpO5Es3xuE4tfakl2V3x2INA==
X-Received: by 2002:a17:907:76d4:: with SMTP id
 kf20mr26457740ejc.44.1640909281373; 
 Thu, 30 Dec 2021 16:08:01 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id dt13sm7988288ejc.157.2021.12.30.16.07.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 16:08:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] MAINTAINERS: Change philmd's email address
Date: Fri, 31 Dec 2021 01:07:59 +0100
Message-Id: <20211231000759.707519-1-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The philmd@redhat.com email address will stop working on
2022-01-01, change it to my personal email address.

Update .mailmap in case anyone wants to send me an email
because of some past commit I authored.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v2: Fixed .mailmap (Richard)
---
 .gitlab-ci.d/edk2/Dockerfile |  2 +-
 .mailmap                     |  1 +
 MAINTAINERS                  | 18 +++++++++---------
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/.gitlab-ci.d/edk2/Dockerfile b/.gitlab-ci.d/edk2/Dockerfile
index b4584d1cf64..13029310f6d 100644
--- a/.gitlab-ci.d/edk2/Dockerfile
+++ b/.gitlab-ci.d/edk2/Dockerfile
@@ -3,7 +3,7 @@
 #
 FROM ubuntu:16.04
 
-MAINTAINER Philippe Mathieu-Daudé <philmd@redhat.com>
+MAINTAINER Philippe Mathieu-Daudé <f4bug@amsat.org>
 
 # Install packages required to build EDK2
 RUN apt update \
diff --git a/.mailmap b/.mailmap
index c45d1c53014..5113f55b3a0 100644
--- a/.mailmap
+++ b/.mailmap
@@ -63,6 +63,7 @@ Paul Burton <paulburton@kernel.org> <paul.burton@mips.com>
 Paul Burton <paulburton@kernel.org> <paul.burton@imgtec.com>
 Paul Burton <paulburton@kernel.org> <paul@archlinuxmips.org>
 Paul Burton <paulburton@kernel.org> <pburton@wavecomp.com>
+Philippe Mathieu-Daudé <f4bug@amsat.org> <philmd@redhat.com>
 Stefan Brankovic <stefan.brankovic@syrmia.com> <stefan.brankovic@rt-rk.com.com>
 Yongbok Kim <yongbok.kim@mips.com> <yongbok.kim@imgtec.com>
 
diff --git a/MAINTAINERS b/MAINTAINERS
index 54565368054..c64c2be9bd5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1630,7 +1630,7 @@ F: pc-bios/bios-microvm.bin
 Machine core
 M: Eduardo Habkost <eduardo@habkost.net>
 M: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
-R: Philippe Mathieu-Daudé <philmd@redhat.com>
+R: Philippe Mathieu-Daudé <f4bug@amsat.org>
 S: Supported
 F: cpu.c
 F: hw/core/cpu.c
@@ -1810,7 +1810,7 @@ F: docs/virtio-net-failover.rst
 T: git https://github.com/jasowang/qemu.git net
 
 Parallel NOR Flash devices
-M: Philippe Mathieu-Daudé <philmd@redhat.com>
+M: Philippe Mathieu-Daudé <f4bug@amsat.org>
 T: git https://gitlab.com/philmd/qemu.git pflash-next
 S: Maintained
 F: hw/block/pflash_cfi*.c
@@ -2226,7 +2226,7 @@ F: hw/isa/piix4.c
 F: include/hw/southbridge/piix.h
 
 Firmware configuration (fw_cfg)
-M: Philippe Mathieu-Daudé <philmd@redhat.com>
+M: Philippe Mathieu-Daudé <f4bug@amsat.org>
 R: Gerd Hoffmann <kraxel@redhat.com>
 S: Supported
 F: docs/specs/fw_cfg.txt
@@ -2524,7 +2524,7 @@ F: scripts/coccinelle/errp-guard.cocci
 
 GDB stub
 M: Alex Bennée <alex.bennee@linaro.org>
-R: Philippe Mathieu-Daudé <philmd@redhat.com>
+R: Philippe Mathieu-Daudé <f4bug@amsat.org>
 S: Maintained
 F: gdbstub*
 F: include/exec/gdbstub.h
@@ -2535,7 +2535,7 @@ Memory API
 M: Paolo Bonzini <pbonzini@redhat.com>
 M: Peter Xu <peterx@redhat.com>
 M: David Hildenbrand <david@redhat.com>
-R: Philippe Mathieu-Daudé <philmd@redhat.com>
+R: Philippe Mathieu-Daudé <f4bug@amsat.org>
 S: Supported
 F: include/exec/ioport.h
 F: include/exec/memop.h
@@ -3029,14 +3029,14 @@ F: include/hw/i2c/smbus_slave.h
 F: include/hw/i2c/smbus_eeprom.h
 
 Firmware schema specifications
-M: Philippe Mathieu-Daudé <philmd@redhat.com>
+M: Philippe Mathieu-Daudé <f4bug@amsat.org>
 R: Daniel P. Berrange <berrange@redhat.com>
 R: Kashyap Chamarthy <kchamart@redhat.com>
 S: Maintained
 F: docs/interop/firmware.json
 
 EDK2 Firmware
-M: Philippe Mathieu-Daudé <philmd@redhat.com>
+M: Philippe Mathieu-Daudé <f4bug@amsat.org>
 R: Gerd Hoffmann <kraxel@redhat.com>
 S: Supported
 F: hw/i386/*ovmf*
@@ -3274,7 +3274,7 @@ F: block/null.c
 NVMe Block Driver
 M: Stefan Hajnoczi <stefanha@redhat.com>
 R: Fam Zheng <fam@euphon.net>
-R: Philippe Mathieu-Daudé <philmd@redhat.com>
+R: Philippe Mathieu-Daudé <f4bug@amsat.org>
 L: qemu-block@nongnu.org
 S: Supported
 F: block/nvme*
@@ -3517,7 +3517,7 @@ F: tests/tcg/Makefile.include
 Integration Testing with the Avocado framework
 W: https://trello.com/b/6Qi1pxVn/avocado-qemu
 R: Cleber Rosa <crosa@redhat.com>
-R: Philippe Mathieu-Daudé <philmd@redhat.com>
+R: Philippe Mathieu-Daudé <f4bug@amsat.org>
 R: Wainer dos Santos Moschetta <wainersm@redhat.com>
 R: Beraldo Leal <bleal@redhat.com>
 S: Odd Fixes
-- 
2.33.1


