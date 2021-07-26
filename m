Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBA53D5B8B
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 16:27:22 +0200 (CEST)
Received: from localhost ([::1]:57606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m81Zh-0005Ka-1s
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 10:27:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m81WJ-0005jP-Nq
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 10:23:51 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:39923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m81WH-0008TI-FR
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 10:23:51 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 f14-20020a05600c154eb02902519e4abe10so2137833wmg.4
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 07:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7gwq6Br5Y6+V67xD+873/QRYUOjzOo/xxivGb8gOrKs=;
 b=CdGIQYPoGPdcFAbprHTroxphegHzLkyF1oD1rZ+H3Sn8WDloEtrU44gTt7pC0oEgoX
 Pg/xcloeDBdyq3ap3go6yraRgwpU8RAfoDNG2Xs2dwMjkMzSn6du2DjvLCIeccTs7Ogv
 aHuP+xkdjM70RKQBGMBApo8shfd1dihIJ2coxTWlfYkRsO6yVaenGa4kgoMCIbJkF1HR
 PDOZyYKv3DxxDNXhZhPMg8VJaoImlMzTH7caKDDA3zFMpchC5r/Ygk1aV++l/amHifgM
 jTOzSMRyEcneklQgaTnQ5U83sj7NPpjqxvIiuuNqn7vS6DJmX/p6oieS8OnNT+VOLxWw
 qszQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7gwq6Br5Y6+V67xD+873/QRYUOjzOo/xxivGb8gOrKs=;
 b=fxxyWcWdBwwmF/1La002OxYtN05g+rlPhS8F69FOLTtQEcnS+XLRgKsScBSm6cqVGh
 KLK/4CZaHoSXxXb1EweXtZmk4mZgSgBnCDf6glZFiBJPH6w3AlAu0Q/r30rGtaycGUnW
 2sjGNajXCnwulrOLPRgqM5KVj9Luui6gHAmEoGWHXOqeISc/EzR/Bzm8FsMgVjHD67jy
 f1Ud7VYqFwmcQ0RvXj5cMp7Y5ZEEp1vizYLRt5RkgaqfJNdEaQfBUEPo+k1Gb3ApYszv
 7GHxvYPv7Y+dt6h4kDKHhyUX8hV7d6eUQQ6vmjajuQWqoWE7N6AtWwlfQHBSrkETwW7U
 VbkQ==
X-Gm-Message-State: AOAM530AnrRWkM7SQKfF2mQIX9r8UEn9qdUYobm+96nwtibe8RK5Qmk5
 bDUVlXODsEr2czQCB0I12BgDjGZ5Y84mlg==
X-Google-Smtp-Source: ABdhPJxGUvGD4XioLWlwvfgr7hn0dFsl3UF/M6aPBR/va0tZkfAhbU2nQpvepTcVtGhpgoKjD7f9ag==
X-Received: by 2002:a05:600c:4788:: with SMTP id
 k8mr16328909wmo.75.1627309427876; 
 Mon, 26 Jul 2021 07:23:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 6sm13823427wmi.3.2021.07.26.07.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 07:23:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 08/10] docs: Format literals correctly
Date: Mon, 26 Jul 2021 15:23:36 +0100
Message-Id: <20210726142338.31872-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210726142338.31872-1-peter.maydell@linaro.org>
References: <20210726142338.31872-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_OTHER_BAD_TLD=1.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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


