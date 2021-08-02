Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 610263DD571
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 14:13:55 +0200 (CEST)
Received: from localhost ([::1]:54494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAWpO-0003mA-EY
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 08:13:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWaS-0000ip-2h
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 07:58:28 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:41601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWaP-0003cG-O1
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 07:58:27 -0400
Received: by mail-wr1-x42b.google.com with SMTP id c9so905671wri.8
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 04:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=L8fNdCo6aFHirsmryZbRBTmjA6Ah4ZwEjtSOqdou9fY=;
 b=ux2yWoVMK4Ke4oOc337CbjQQ7JdUsTMi6+rcy+e/dr4P99G0caV531/XNIq5JLIvmq
 yjqM1bAqMbAiGUPtVApVCisLdOITbcEXd2JNlAlEpYWmNg3GtWcQi79KiYcTC9ktlJ3G
 iNReJnFunnyYrcXWROW/WqPea0XycoVvZwIIJ8Ouw82Xi9ex1Lkjnhy0ovYO+D04FlMz
 wvwtD8LCIpQLsvJ3ghbW2u7EPAuSFIqJQPyrWlJunEWkC1scU1oIAhqXmEPgXzIy0T6l
 YbzGWtvFtug3D/+5zh7IiZoQALJmInOD7qAOy01nC1v+Oh7QERbTM3t3Yw+bRGuFHbib
 8QIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L8fNdCo6aFHirsmryZbRBTmjA6Ah4ZwEjtSOqdou9fY=;
 b=hTPjqs/0cm5rmSWXZyxaJLqaW/NDVGK1Y2MnxqaxM1eJK+oZR9SG5gnSgMm48mDHmT
 GmTipXClazkIMQYTJNM7AEuM03vADaP+eAwfwXG2haRB+Ri6MNPObY7q+p4MN0r+ZEIl
 uoZ/gf0qYM5DWceb0T/TkJLFki1i6XZ6JaLe2o7pbUh8jyeFLGdE9HLDCK//nqbMHJq6
 6iKnBIzW9lwhlmRX7uMn1H6YCh3AiEhR4vVxF7Ta9r2Z8/Zp5IawYwCuo3B6wKzdcdhv
 TBfXMkLcKZDt34YaFCtOcI+knzQZYlqOyv20iHz1kWcOfVC3ij8bNvbZe92UB7LxQL7N
 b99w==
X-Gm-Message-State: AOAM533zDGJvW/OOC4RVbcdlh08Ns5RmYu8BZ1cYwu44oS+HM6jcL2hz
 kDIf6Iqtes5+c9tYj+nFnyA1CtKI+ucXlg==
X-Google-Smtp-Source: ABdhPJwLpOt4pIXgjk93Br96j5aINO4kh7HNAJmlsbx8p16td1DU9jyLwR+bVTzT5Se7uFh8cnNN0Q==
X-Received: by 2002:a5d:5650:: with SMTP id j16mr17041535wrw.46.1627905504190; 
 Mon, 02 Aug 2021 04:58:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y66sm10102772wmy.39.2021.08.02.04.58.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 04:58:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/21] docs: Format literals correctly
Date: Mon,  2 Aug 2021 12:58:05 +0100
Message-Id: <20210802115812.10731-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210802115812.10731-1-peter.maydell@linaro.org>
References: <20210802115812.10731-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, PDS_OTHER_BAD_TLD=2,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

In rST markup, single backticks `like this` represent "interpreted
text", which can be handled as a bunch of different things if tagged
with a specific "role":
https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#interpreted-text
(the most common one for us is "reference to a URL, which gets
hyperlinked").

The default "role" if none is specified is "title_reference",
intended for references to book or article titles, and it renders
into the HTML as <cite>...</cite> (usually comes out as italics).

This commit fixes various places in the manual which were
using single backticks when double backticks (for literal text)
were intended, and covers those files where only one or two
instances of these errors were made.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/about/index.rst                       | 2 +-
 docs/interop/live-block-operations.rst     | 2 +-
 docs/system/arm/nuvoton.rst                | 2 +-
 docs/system/arm/sbsa.rst                   | 4 ++--
 docs/system/arm/virt.rst                   | 2 +-
 docs/system/cpu-hotplug.rst                | 2 +-
 docs/system/guest-loader.rst               | 6 +++---
 docs/system/ppc/powernv.rst                | 8 ++++----
 docs/system/riscv/microchip-icicle-kit.rst | 2 +-
 docs/system/riscv/virt.rst                 | 2 +-
 10 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/docs/about/index.rst b/docs/about/index.rst
index 689a9861dc3..beb762aa0a9 100644
--- a/docs/about/index.rst
+++ b/docs/about/index.rst
@@ -15,7 +15,7 @@ where QEMU can launch processes compiled for one CPU on another CPU.
 In this mode the CPU is always emulated.
 
 QEMU also provides a number of standalone commandline utilities,
-such as the `qemu-img` disk image utility that allows you to create,
+such as the ``qemu-img`` disk image utility that allows you to create,
 convert and modify disk images.
 
 .. toctree::
diff --git a/docs/interop/live-block-operations.rst b/docs/interop/live-block-operations.rst
index 477d085f54e..9e3635b2338 100644
--- a/docs/interop/live-block-operations.rst
+++ b/docs/interop/live-block-operations.rst
@@ -781,7 +781,7 @@ the content of image [D].
         }
 
 (6) [On *destination* QEMU] Finally, resume the guest vCPUs by issuing the
-    QMP command `cont`::
+    QMP command ``cont``::
 
         (QEMU) cont
         {
diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
index 3cd2b2b18d8..69f57c2886f 100644
--- a/docs/system/arm/nuvoton.rst
+++ b/docs/system/arm/nuvoton.rst
@@ -79,7 +79,7 @@ Boot options
 ------------
 
 The Nuvoton machines can boot from an OpenBMC firmware image, or directly into
-a kernel using the ``-kernel`` option. OpenBMC images for `quanta-gsj` and
+a kernel using the ``-kernel`` option. OpenBMC images for ``quanta-gsj`` and
 possibly others can be downloaded from the OpenPOWER jenkins :
 
    https://openpower.xyz/
diff --git a/docs/system/arm/sbsa.rst b/docs/system/arm/sbsa.rst
index 27b0999aaca..b499d7e9272 100644
--- a/docs/system/arm/sbsa.rst
+++ b/docs/system/arm/sbsa.rst
@@ -1,8 +1,8 @@
 Arm Server Base System Architecture Reference board (``sbsa-ref``)
 ==================================================================
 
-While the `virt` board is a generic board platform that doesn't match
-any real hardware the `sbsa-ref` board intends to look like real
+While the ``virt`` board is a generic board platform that doesn't match
+any real hardware the ``sbsa-ref`` board intends to look like real
 hardware. The `Server Base System Architecture
 <https://developer.arm.com/documentation/den0029/latest>`_ defines a
 minimum base line of hardware support and importantly how the firmware
diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 27652adfae1..59acf0eeafa 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -1,7 +1,7 @@
 'virt' generic virtual platform (``virt``)
 ==========================================
 
-The `virt` board is a platform which does not correspond to any
+The ``virt`` board is a platform which does not correspond to any
 real hardware; it is designed for use in virtual machines.
 It is the recommended board type if you simply want to run
 a guest such as Linux and do not care about reproducing the
diff --git a/docs/system/cpu-hotplug.rst b/docs/system/cpu-hotplug.rst
index bd0663616e8..015ce2b6ec3 100644
--- a/docs/system/cpu-hotplug.rst
+++ b/docs/system/cpu-hotplug.rst
@@ -78,7 +78,7 @@ vCPU hotplug
       }
       (QEMU)
 
-(5) Optionally, run QMP `query-cpus-fast` for some details about the
+(5) Optionally, run QMP ``query-cpus-fast`` for some details about the
     vCPUs::
 
       (QEMU) query-cpus-fast
diff --git a/docs/system/guest-loader.rst b/docs/system/guest-loader.rst
index 37d03cbd892..4320d1183f7 100644
--- a/docs/system/guest-loader.rst
+++ b/docs/system/guest-loader.rst
@@ -4,7 +4,7 @@
 Guest Loader
 ------------
 
-The guest loader is similar to the `generic-loader` although it is
+The guest loader is similar to the ``generic-loader`` although it is
 aimed at a particular use case of loading hypervisor guests. This is
 useful for debugging hypervisors without having to jump through the
 hoops of firmware and boot-loaders.
@@ -27,12 +27,12 @@ multi-boot capability. A typical example would look like:
 In the above example the Xen hypervisor is loaded by the -kernel
 parameter and passed it's boot arguments via -append. The Dom0 guest
 is loaded into the areas of memory. Each blob will get
-`/chosen/module@<addr>` entry in the FDT to indicate it's location and
+``/chosen/module@<addr>`` entry in the FDT to indicate it's location and
 size. Additional information can be passed with by using additional
 arguments.
 
 Currently the only supported machines which use FDT data to boot are
-the ARM and RiscV `virt` machines.
+the ARM and RiscV ``virt`` machines.
 
 Arguments
 ^^^^^^^^^
diff --git a/docs/system/ppc/powernv.rst b/docs/system/ppc/powernv.rst
index 43c58bc32e7..4c4cdea527e 100644
--- a/docs/system/ppc/powernv.rst
+++ b/docs/system/ppc/powernv.rst
@@ -48,15 +48,15 @@ Firmware
 --------
 
 The OPAL firmware (OpenPower Abstraction Layer) for OpenPower systems
-includes the runtime services `skiboot` and the bootloader kernel and
-initramfs `skiroot`. Source code can be found on GitHub:
+includes the runtime services ``skiboot`` and the bootloader kernel and
+initramfs ``skiroot``. Source code can be found on GitHub:
 
   https://github.com/open-power.
 
-Prebuilt images of `skiboot` and `skiboot` are made available on the `OpenPOWER <https://openpower.xyz/job/openpower/job/openpower-op-build/>`__ site. To boot a POWER9 machine, use the `witherspoon <https://openpower.xyz/job/openpower/job/openpower-op-build/label=slave,target=witherspoon/lastSuccessfulBuild/>`__ images. For POWER8, use
+Prebuilt images of ``skiboot`` and ``skiboot`` are made available on the `OpenPOWER <https://openpower.xyz/job/openpower/job/openpower-op-build/>`__ site. To boot a POWER9 machine, use the `witherspoon <https://openpower.xyz/job/openpower/job/openpower-op-build/label=slave,target=witherspoon/lastSuccessfulBuild/>`__ images. For POWER8, use
 the `palmetto <https://openpower.xyz/job/openpower/job/openpower-op-build/label=slave,target=palmetto/lastSuccessfulBuild/>`__ images.
 
-QEMU includes a prebuilt image of `skiboot` which is updated when a
+QEMU includes a prebuilt image of ``skiboot`` which is updated when a
 more recent version is required by the models.
 
 Boot options
diff --git a/docs/system/riscv/microchip-icicle-kit.rst b/docs/system/riscv/microchip-icicle-kit.rst
index 817d2aec9cd..40798b1aae5 100644
--- a/docs/system/riscv/microchip-icicle-kit.rst
+++ b/docs/system/riscv/microchip-icicle-kit.rst
@@ -95,7 +95,7 @@ Then we can boot the machine by:
       -serial chardev:serial1
 
 With above command line, current terminal session will be used for the first
-serial port. Open another terminal window, and use `minicom` to connect the
+serial port. Open another terminal window, and use ``minicom`` to connect the
 second serial port.
 
 .. code-block:: bash
diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
index 3709f057972..321d77e07d4 100644
--- a/docs/system/riscv/virt.rst
+++ b/docs/system/riscv/virt.rst
@@ -1,7 +1,7 @@
 'virt' Generic Virtual Platform (``virt``)
 ==========================================
 
-The `virt` board is a platform which does not correspond to any real hardware;
+The ``virt`` board is a platform which does not correspond to any real hardware;
 it is designed for use in virtual machines. It is the recommended board type
 if you simply want to run a guest such as Linux and do not care about
 reproducing the idiosyncrasies and limitations of a particular bit of
-- 
2.20.1


