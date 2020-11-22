Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 835272BC2CD
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Nov 2020 01:02:41 +0100 (CET)
Received: from localhost ([::1]:58556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgcq0-0000Kb-Kr
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 19:02:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kgcp1-0008HH-S3
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 19:01:39 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:45939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kgcox-0003lg-O0
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 19:01:39 -0500
Received: by mail-wr1-x42c.google.com with SMTP id t4so1817151wrr.12
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 16:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WllWlEukrBPjpGn3NsazcxP7XFKGR1RQb3CJzpRU4vU=;
 b=kMWy6H3dxuyAPgSv699I4gP3SNpxYsIK7XOT5FiF9Z5SeWKVXNELLPj3YX67BzuOvb
 e5FyDiWr9Mo0VPTmxK5oxfWm4Y/O4pl/r2PvR0UNJJq4oA6MZVHmTTJ9AVX/je0dY8NV
 pvWKgnLuCCxL3zqDvlmPMXOKktEvw/7ECeOmhc7UPI6UH+kHbRYWPl/AlBPeEpghR2Sc
 m2e3/8yrPCZGPlMb+ScEeEoOMmKUnfQJUvKaI2MynsEKVamCBppzXh96Gav+5tNNhDMk
 lRHX9BJ8nTbmuciozOXU8fk51H6fEeuncSBnSylk/LhQCLwzeqTdr+zHPQC/tq457ly6
 zu/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WllWlEukrBPjpGn3NsazcxP7XFKGR1RQb3CJzpRU4vU=;
 b=rdAwEqGUQfTH/gcK0Qcc/fZLW9ZR7NBdVcFPMY68GDs+98BQI5mqQqHhG9UYr9jA45
 27E+p6juSiSmjdhQ8kB5cyLtj9grGXzQoT1hRo6FmVJwZl1J0vwKsPqrFvl4E1wzD6OX
 tvA1VTZXQyhHytI9oN6kP2jV78j29L1WA/hTFDxFHSJAxFWmdo+YQkL8AS4+KRrpsEg+
 6/wnp+3+u1HK6kFdB5avk/wQJJdtvoznbC0F1jhwLVgnwNMHHscOQKXiplkjcChTCl42
 VAHxTZp6EBM9aPh6CgBQy6yCRhFbozPbykn1mZReNQ6KB9F3/lx9OfVmv7A1Valvfe/q
 WXRg==
X-Gm-Message-State: AOAM533X4zy7iO8YbIYjaVsMXKI4TxfiyNRXK8BNNIlSJEL7x+t9TT68
 7KJpSDmGs8wD/NHvrqiOx4jiO4nBUGDO3Q==
X-Google-Smtp-Source: ABdhPJyMdrxtAiUAd5/qHBvWlb4Rdyrw9zVlyFFcNtqRpsdNEDHfUJ3joHXF8fdJ/5iq2Mj7xBIaXg==
X-Received: by 2002:a5d:634b:: with SMTP id b11mr22629913wrw.97.1606003293615; 
 Sat, 21 Nov 2020 16:01:33 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d63sm8952155wmd.12.2020.11.21.16.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2020 16:01:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] docs/user: Remove outdated 'Quick Start' section
Date: Sun, 22 Nov 2020 00:01:31 +0000
Message-Id: <20201122000131.18487-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'Quick Start' section of the userspace emulator documentation is
very old and outdated. In particular:
 - it suggests running x86-on-x86 emulation, which is the least
   interesting possible use case
 - it recommends that users download tarballs of guest binaries
   from the QEMU web page which we no longer provide there

There's nothing salvageable here; delete it all.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I'm open to suggestions that this is being too drastic;
the main aim here is to remove references to tar.gz files
that we haven't provided for years, as noted by
 https://bugs.launchpad.net/qemu/+bug/1884982
Ideally the whole of docs/user could use a lot of love...

 docs/user/main.rst | 61 ----------------------------------------------
 1 file changed, 61 deletions(-)

diff --git a/docs/user/main.rst b/docs/user/main.rst
index bd99b0fdbe9..49ccae3ecab 100644
--- a/docs/user/main.rst
+++ b/docs/user/main.rst
@@ -45,67 +45,6 @@ emulator.
 Linux User space emulator
 -------------------------
 
-Quick Start
-~~~~~~~~~~~
-
-In order to launch a Linux process, QEMU needs the process executable
-itself and all the target (x86) dynamic libraries used by it.
-
--  On x86, you can just try to launch any process by using the native
-   libraries::
-
-      qemu-i386 -L / /bin/ls
-
-   ``-L /`` tells that the x86 dynamic linker must be searched with a
-   ``/`` prefix.
-
--  Since QEMU is also a linux process, you can launch QEMU with QEMU
-   (NOTE: you can only do that if you compiled QEMU from the sources)::
-
-      qemu-i386 -L / qemu-i386 -L / /bin/ls
-
--  On non x86 CPUs, you need first to download at least an x86 glibc
-   (``qemu-runtime-i386-XXX-.tar.gz`` on the QEMU web page). Ensure that
-   ``LD_LIBRARY_PATH`` is not set::
-
-      unset LD_LIBRARY_PATH
-
-   Then you can launch the precompiled ``ls`` x86 executable::
-
-      qemu-i386 tests/i386/ls
-
-   You can look at ``scripts/qemu-binfmt-conf.sh`` so that QEMU is
-   automatically launched by the Linux kernel when you try to launch x86
-   executables. It requires the ``binfmt_misc`` module in the Linux
-   kernel.
-
--  The x86 version of QEMU is also included. You can try weird things
-   such as::
-
-      qemu-i386 /usr/local/qemu-i386/bin/qemu-i386 \
-                /usr/local/qemu-i386/bin/ls-i386
-
-Wine launch
-~~~~~~~~~~~
-
--  Ensure that you have a working QEMU with the x86 glibc distribution
-   (see previous section). In order to verify it, you must be able to
-   do::
-
-      qemu-i386 /usr/local/qemu-i386/bin/ls-i386
-
--  Download the binary x86 Wine install (``qemu-XXX-i386-wine.tar.gz``
-   on the QEMU web page).
-
--  Configure Wine on your account. Look at the provided script
-   ``/usr/local/qemu-i386/bin/wine-conf.sh``. Your previous
-   ``${HOME}/.wine`` directory is saved to ``${HOME}/.wine.org``.
-
--  Then you can try the example ``putty.exe``::
-
-      qemu-i386 /usr/local/qemu-i386/wine/bin/wine \
-                /usr/local/qemu-i386/wine/c/Program\ Files/putty.exe
-
 Command line options
 ~~~~~~~~~~~~~~~~~~~~
 
-- 
2.20.1


