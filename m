Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7DE17BB43
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Mar 2020 12:13:33 +0100 (CET)
Received: from localhost ([::1]:34792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jAAv6-0008QU-PC
	for lists+qemu-devel@lfdr.de; Fri, 06 Mar 2020 06:13:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38802)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jAArp-00033W-MT
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 06:10:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jAArm-0004By-Ea
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 06:10:09 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44355)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jAArm-00046P-3G
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 06:10:06 -0500
Received: by mail-wr1-x42f.google.com with SMTP id n7so1838036wrt.11
 for <qemu-devel@nongnu.org>; Fri, 06 Mar 2020 03:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jaEuDvik65wi1gBLpVTR/eSRRlHMANGTU4KdDz/JZMQ=;
 b=AsfeAWcB3tTpZPDZyDxb2FhW3FU/1hAAqjc+qUq3BV0wavzlbi99Q8UUpFySIn3pgG
 jlNKqgpz75YMqDsLfTqSeygtSwVqjF2gqjnDErhJfM9OSvx5oL0lSWh0/56inUUx6udQ
 ersh/tiCgDpG15Iu2AYXiVtcJ7HBnsskMSSbC41APQzBuHqv8nbXbIJ9RC0faaTLClUJ
 CJy41lL0LCK+4Uy+ATtVcU/wTJOSt6U9wdByEC37BoxWgu9eMe42tDJuTtA/T3lnfUwO
 NwlDGM58G2MnVgkSjN23SblXuXHi2mG4b9iTiqVJASN+XjStum6Rx8mTHpQ1AzZMjNSK
 BAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jaEuDvik65wi1gBLpVTR/eSRRlHMANGTU4KdDz/JZMQ=;
 b=DeWEbgB1IfxV2vHS8NqMru3OW0NByzZj+Tj2fwWratAvMHKl7OyOCmxAb1PVH+RhQj
 ZXsZO6pcKjif7xPoXEoXKJmpyPPYSKWFinTQF4dsy5rFbWfQcf3ZQRd0U6SD3uSayCWc
 LGU1S4sdUhZ5lxCnJc7gxQHF1g1t99vo4Qt1OmBSNCcsmRGNdtotfRZ81OB8KlDDmSoE
 asbXErCsMYE/Ul+Om2HF2eFths4kYPH2Nu+8EflY//OQlbgm9sCqczq4BVfH3ayuJTaj
 wiZJcX9Mr74NB1mGi8wRIdfp3WTUtWoMSUALztOTchyIl3b2Hugt/PNF1b+5CzKkY4Wh
 WRXg==
X-Gm-Message-State: ANhLgQ1C3+zmIsywAlDMch9W9Sot1AeL0xV659Biab9eQLpEH2TWMIvn
 2msiSYq/2i3dXc59gLOhG/nHtXD51Im1Hw==
X-Google-Smtp-Source: ADFU+vvn6rhqZ7Uki/Cj185yj3QGRDamh3D0dUVS7CUmRlzkUuA7lLCghnyd2OfoHbCumU85AcwlQg==
X-Received: by 2002:a5d:61ce:: with SMTP id q14mr3529907wrv.222.1583493003696; 
 Fri, 06 Mar 2020 03:10:03 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y10sm12553029wma.26.2020.03.06.03.10.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 03:10:03 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/33] qemu-doc: convert user-mode emulation to a separate
 Sphinx manual
Date: Fri,  6 Mar 2020 11:09:27 +0000
Message-Id: <20200306110959.29461-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200306110959.29461-1-peter.maydell@linaro.org>
References: <20200306110959.29461-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42f
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

From: Paolo Bonzini <pbonzini@redhat.com>

The final addition to the set of QEMU manuals is the user-mode emulation
manual, which right now is included in qemu-doc.texi.  Extract it and
convert it to rST, so that qemu-doc.texi covers only full system emulation.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20200228153619.9906-2-peter.maydell@linaro.org
Message-id: 20200226113034.6741-2-pbonzini@redhat.com
[PMM: Fix makefile conflicts; add user manual to
 index.rst and index.html.in; don't specify empty man_pages
 list; fixed a few comments to say 'user' rather than 'system']
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 Makefile            |   8 +-
 docs/index.html.in  |   1 +
 docs/index.rst      |   1 +
 docs/user/conf.py   |  15 ++
 docs/user/index.rst |  16 +++
 docs/user/main.rst  | 295 ++++++++++++++++++++++++++++++++++++++
 qemu-doc.texi       | 337 --------------------------------------------
 7 files changed, 335 insertions(+), 338 deletions(-)
 create mode 100644 docs/user/conf.py
 create mode 100644 docs/user/index.rst
 create mode 100644 docs/user/main.rst

diff --git a/Makefile b/Makefile
index aa9cc0b5847..faa0ffa05b0 100644
--- a/Makefile
+++ b/Makefile
@@ -787,6 +787,7 @@ distclean: clean
 	$(call clean-manual,specs)
 	$(call clean-manual,system)
 	$(call clean-manual,tools)
+	$(call clean-manual,user)
 	for d in $(TARGET_DIRS); do \
 	rm -rf $$d || exit 1 ; \
         done
@@ -845,6 +846,7 @@ install-sphinxdocs: sphinxdocs
 	$(call install-manual,specs)
 	$(call install-manual,system)
 	$(call install-manual,tools)
+	$(call install-manual,user)
 
 install-doc: $(DOCS) install-sphinxdocs
 	$(INSTALL_DIR) "$(DESTDIR)$(qemu_docdir)"
@@ -1039,7 +1041,8 @@ sphinxdocs: $(MANUAL_BUILDDIR)/devel/index.html \
             $(MANUAL_BUILDDIR)/interop/index.html \
             $(MANUAL_BUILDDIR)/specs/index.html \
             $(MANUAL_BUILDDIR)/system/index.html \
-            $(MANUAL_BUILDDIR)/tools/index.html
+            $(MANUAL_BUILDDIR)/tools/index.html \
+            $(MANUAL_BUILDDIR)/user/index.html
 
 # Canned command to build a single manual
 # Arguments: $1 = manual name, $2 = Sphinx builder ('html' or 'man')
@@ -1074,6 +1077,9 @@ $(MANUAL_BUILDDIR)/system/index.html: $(call manual-deps,system)
 $(MANUAL_BUILDDIR)/tools/index.html: $(call manual-deps,tools) $(SRC_PATH)/qemu-img-cmds.hx $(SRC_PATH)/docs/qemu-option-trace.rst.inc
 	$(call build-manual,tools,html)
 
+$(MANUAL_BUILDDIR)/user/index.html: $(call manual-deps,user)
+	$(call build-manual,user,html)
+
 $(call define-manpage-rule,interop,qemu-ga.8)
 
 $(call define-manpage-rule,system,qemu-block-drivers.7)
diff --git a/docs/index.html.in b/docs/index.html.in
index cf61b1cf448..a576ace8a27 100644
--- a/docs/index.html.in
+++ b/docs/index.html.in
@@ -14,6 +14,7 @@
             <li><a href="specs/index.html">System Emulation Guest Hardware Specifications</a></li>
             <li><a href="system/index.html">System Emulation User's Guide</a></li>
             <li><a href="tools/index.html">Tools Guide</a></li>
+            <li><a href="user/index.html">User Mode Emulation User's Guide</a></li>
         </ul>
     </body>
 </html>
diff --git a/docs/index.rst b/docs/index.rst
index acd604fa8a9..376dab28850 100644
--- a/docs/index.rst
+++ b/docs/index.rst
@@ -15,3 +15,4 @@ Welcome to QEMU's documentation!
    specs/index
    system/index
    tools/index
+   user/index
diff --git a/docs/user/conf.py b/docs/user/conf.py
new file mode 100644
index 00000000000..4b09aedd454
--- /dev/null
+++ b/docs/user/conf.py
@@ -0,0 +1,15 @@
+# -*- coding: utf-8 -*-
+#
+# QEMU documentation build configuration file for the 'user' manual.
+#
+# This includes the top level conf file and then makes any necessary tweaks.
+import sys
+import os
+
+qemu_docdir = os.path.abspath("..")
+parent_config = os.path.join(qemu_docdir, "conf.py")
+exec(compile(open(parent_config, "rb").read(), parent_config, 'exec'))
+
+# This slightly misuses the 'description', but is the best way to get
+# the manual title to appear in the sidebar.
+html_theme_options['description'] = u'User Mode Emulation User''s Guide'
diff --git a/docs/user/index.rst b/docs/user/index.rst
new file mode 100644
index 00000000000..e030dadf652
--- /dev/null
+++ b/docs/user/index.rst
@@ -0,0 +1,16 @@
+.. This is the top level page for the 'user' manual.
+
+
+QEMU User Mode Emulation User's Guide
+=====================================
+
+This manual is the overall guide for users using QEMU
+for user-mode emulation.  In this mode, QEMU can launch
+processes compiled for one CPU on another CPU.
+
+Contents:
+
+.. toctree::
+   :maxdepth: 2
+
+   main
diff --git a/docs/user/main.rst b/docs/user/main.rst
new file mode 100644
index 00000000000..ca69f7727d5
--- /dev/null
+++ b/docs/user/main.rst
@@ -0,0 +1,295 @@
+QEMU User space emulator
+========================
+
+Supported Operating Systems
+---------------------------
+
+The following OS are supported in user space emulation:
+
+-  Linux (referred as qemu-linux-user)
+
+-  BSD (referred as qemu-bsd-user)
+
+Features
+--------
+
+QEMU user space emulation has the following notable features:
+
+**System call translation:**
+   QEMU includes a generic system call translator. This means that the
+   parameters of the system calls can be converted to fix endianness and
+   32/64-bit mismatches between hosts and targets. IOCTLs can be
+   converted too.
+
+**POSIX signal handling:**
+   QEMU can redirect to the running program all signals coming from the
+   host (such as ``SIGALRM``), as well as synthesize signals from
+   virtual CPU exceptions (for example ``SIGFPE`` when the program
+   executes a division by zero).
+
+   QEMU relies on the host kernel to emulate most signal system calls,
+   for example to emulate the signal mask. On Linux, QEMU supports both
+   normal and real-time signals.
+
+**Threading:**
+   On Linux, QEMU can emulate the ``clone`` syscall and create a real
+   host thread (with a separate virtual CPU) for each emulated thread.
+   Note that not all targets currently emulate atomic operations
+   correctly. x86 and ARM use a global lock in order to preserve their
+   semantics.
+
+QEMU was conceived so that ultimately it can emulate itself. Although it
+is not very useful, it is an important test to show the power of the
+emulator.
+
+Linux User space emulator
+-------------------------
+
+Quick Start
+~~~~~~~~~~~
+
+In order to launch a Linux process, QEMU needs the process executable
+itself and all the target (x86) dynamic libraries used by it.
+
+-  On x86, you can just try to launch any process by using the native
+   libraries::
+
+      qemu-i386 -L / /bin/ls
+
+   ``-L /`` tells that the x86 dynamic linker must be searched with a
+   ``/`` prefix.
+
+-  Since QEMU is also a linux process, you can launch QEMU with QEMU
+   (NOTE: you can only do that if you compiled QEMU from the sources)::
+
+      qemu-i386 -L / qemu-i386 -L / /bin/ls
+
+-  On non x86 CPUs, you need first to download at least an x86 glibc
+   (``qemu-runtime-i386-XXX-.tar.gz`` on the QEMU web page). Ensure that
+   ``LD_LIBRARY_PATH`` is not set::
+
+      unset LD_LIBRARY_PATH
+
+   Then you can launch the precompiled ``ls`` x86 executable::
+
+      qemu-i386 tests/i386/ls
+
+   You can look at ``scripts/qemu-binfmt-conf.sh`` so that QEMU is
+   automatically launched by the Linux kernel when you try to launch x86
+   executables. It requires the ``binfmt_misc`` module in the Linux
+   kernel.
+
+-  The x86 version of QEMU is also included. You can try weird things
+   such as::
+
+      qemu-i386 /usr/local/qemu-i386/bin/qemu-i386 \
+                /usr/local/qemu-i386/bin/ls-i386
+
+Wine launch
+~~~~~~~~~~~
+
+-  Ensure that you have a working QEMU with the x86 glibc distribution
+   (see previous section). In order to verify it, you must be able to
+   do::
+
+      qemu-i386 /usr/local/qemu-i386/bin/ls-i386
+
+-  Download the binary x86 Wine install (``qemu-XXX-i386-wine.tar.gz``
+   on the QEMU web page).
+
+-  Configure Wine on your account. Look at the provided script
+   ``/usr/local/qemu-i386/bin/wine-conf.sh``. Your previous
+   ``${HOME}/.wine`` directory is saved to ``${HOME}/.wine.org``.
+
+-  Then you can try the example ``putty.exe``::
+
+      qemu-i386 /usr/local/qemu-i386/wine/bin/wine \
+                /usr/local/qemu-i386/wine/c/Program\ Files/putty.exe
+
+Command line options
+~~~~~~~~~~~~~~~~~~~~
+
+::
+
+   qemu-i386 [-h] [-d] [-L path] [-s size] [-cpu model] [-g port] [-B offset] [-R size] program [arguments...]
+
+``-h``
+   Print the help
+
+``-L path``
+   Set the x86 elf interpreter prefix (default=/usr/local/qemu-i386)
+
+``-s size``
+   Set the x86 stack size in bytes (default=524288)
+
+``-cpu model``
+   Select CPU model (-cpu help for list and additional feature
+   selection)
+
+``-E var=value``
+   Set environment var to value.
+
+``-U var``
+   Remove var from the environment.
+
+``-B offset``
+   Offset guest address by the specified number of bytes. This is useful
+   when the address region required by guest applications is reserved on
+   the host. This option is currently only supported on some hosts.
+
+``-R size``
+   Pre-allocate a guest virtual address space of the given size (in
+   bytes). \"G\", \"M\", and \"k\" suffixes may be used when specifying
+   the size.
+
+Debug options:
+
+``-d item1,...``
+   Activate logging of the specified items (use '-d help' for a list of
+   log items)
+
+``-p pagesize``
+   Act as if the host page size was 'pagesize' bytes
+
+``-g port``
+   Wait gdb connection to port
+
+``-singlestep``
+   Run the emulation in single step mode.
+
+Environment variables:
+
+QEMU_STRACE
+   Print system calls and arguments similar to the 'strace' program
+   (NOTE: the actual 'strace' program will not work because the user
+   space emulator hasn't implemented ptrace). At the moment this is
+   incomplete. All system calls that don't have a specific argument
+   format are printed with information for six arguments. Many
+   flag-style arguments don't have decoders and will show up as numbers.
+
+Other binaries
+~~~~~~~~~~~~~~
+
+user mode (Alpha)
+``qemu-alpha`` TODO.
+
+user mode (ARM)
+``qemu-armeb`` TODO.
+
+user mode (ARM)
+``qemu-arm`` is also capable of running ARM \"Angel\" semihosted ELF
+binaries (as implemented by the arm-elf and arm-eabi Newlib/GDB
+configurations), and arm-uclinux bFLT format binaries.
+
+user mode (ColdFire)
+user mode (M68K)
+``qemu-m68k`` is capable of running semihosted binaries using the BDM
+(m5xxx-ram-hosted.ld) or m68k-sim (sim.ld) syscall interfaces, and
+coldfire uClinux bFLT format binaries.
+
+The binary format is detected automatically.
+
+user mode (Cris)
+``qemu-cris`` TODO.
+
+user mode (i386)
+``qemu-i386`` TODO. ``qemu-x86_64`` TODO.
+
+user mode (Microblaze)
+``qemu-microblaze`` TODO.
+
+user mode (MIPS)
+``qemu-mips`` executes 32-bit big endian MIPS binaries (MIPS O32 ABI).
+
+``qemu-mipsel`` executes 32-bit little endian MIPS binaries (MIPS O32
+ABI).
+
+``qemu-mips64`` executes 64-bit big endian MIPS binaries (MIPS N64 ABI).
+
+``qemu-mips64el`` executes 64-bit little endian MIPS binaries (MIPS N64
+ABI).
+
+``qemu-mipsn32`` executes 32-bit big endian MIPS binaries (MIPS N32
+ABI).
+
+``qemu-mipsn32el`` executes 32-bit little endian MIPS binaries (MIPS N32
+ABI).
+
+user mode (NiosII)
+``qemu-nios2`` TODO.
+
+user mode (PowerPC)
+``qemu-ppc64abi32`` TODO. ``qemu-ppc64`` TODO. ``qemu-ppc`` TODO.
+
+user mode (SH4)
+``qemu-sh4eb`` TODO. ``qemu-sh4`` TODO.
+
+user mode (SPARC)
+``qemu-sparc`` can execute Sparc32 binaries (Sparc32 CPU, 32 bit ABI).
+
+``qemu-sparc32plus`` can execute Sparc32 and SPARC32PLUS binaries
+(Sparc64 CPU, 32 bit ABI).
+
+``qemu-sparc64`` can execute some Sparc64 (Sparc64 CPU, 64 bit ABI) and
+SPARC32PLUS binaries (Sparc64 CPU, 32 bit ABI).
+
+BSD User space emulator
+-----------------------
+
+BSD Status
+~~~~~~~~~~
+
+-  target Sparc64 on Sparc64: Some trivial programs work.
+
+Quick Start
+~~~~~~~~~~~
+
+In order to launch a BSD process, QEMU needs the process executable
+itself and all the target dynamic libraries used by it.
+
+-  On Sparc64, you can just try to launch any process by using the
+   native libraries::
+
+      qemu-sparc64 /bin/ls
+
+Command line options
+~~~~~~~~~~~~~~~~~~~~
+
+::
+
+   qemu-sparc64 [-h] [-d] [-L path] [-s size] [-bsd type] program [arguments...]
+
+``-h``
+   Print the help
+
+``-L path``
+   Set the library root path (default=/)
+
+``-s size``
+   Set the stack size in bytes (default=524288)
+
+``-ignore-environment``
+   Start with an empty environment. Without this option, the initial
+   environment is a copy of the caller's environment.
+
+``-E var=value``
+   Set environment var to value.
+
+``-U var``
+   Remove var from the environment.
+
+``-bsd type``
+   Set the type of the emulated BSD Operating system. Valid values are
+   FreeBSD, NetBSD and OpenBSD (default).
+
+Debug options:
+
+``-d item1,...``
+   Activate logging of the specified items (use '-d help' for a list of
+   log items)
+
+``-p pagesize``
+   Act as if the host page size was 'pagesize' bytes
+
+``-singlestep``
+   Run the emulation in single step mode.
diff --git a/qemu-doc.texi b/qemu-doc.texi
index 33b9597b1dc..6636816b85f 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -38,7 +38,6 @@
 * Introduction::
 * QEMU PC System emulator::
 * QEMU System emulator for non PC targets::
-* QEMU User space emulator::
 * System requirements::
 * Security::
 * Implementation notes::
@@ -2487,342 +2486,6 @@ so should only be used with trusted guest OS.
 
 @c man end
 
-@node QEMU User space emulator
-@chapter QEMU User space emulator
-
-@menu
-* Supported Operating Systems ::
-* Features::
-* Linux User space emulator::
-* BSD User space emulator ::
-@end menu
-
-@node Supported Operating Systems
-@section Supported Operating Systems
-
-The following OS are supported in user space emulation:
-
-@itemize @minus
-@item
-Linux (referred as qemu-linux-user)
-@item
-BSD (referred as qemu-bsd-user)
-@end itemize
-
-@node Features
-@section Features
-
-QEMU user space emulation has the following notable features:
-
-@table @strong
-@item System call translation:
-QEMU includes a generic system call translator.  This means that
-the parameters of the system calls can be converted to fix
-endianness and 32/64-bit mismatches between hosts and targets.
-IOCTLs can be converted too.
-
-@item POSIX signal handling:
-QEMU can redirect to the running program all signals coming from
-the host (such as @code{SIGALRM}), as well as synthesize signals from
-virtual CPU exceptions (for example @code{SIGFPE} when the program
-executes a division by zero).
-
-QEMU relies on the host kernel to emulate most signal system
-calls, for example to emulate the signal mask.  On Linux, QEMU
-supports both normal and real-time signals.
-
-@item Threading:
-On Linux, QEMU can emulate the @code{clone} syscall and create a real
-host thread (with a separate virtual CPU) for each emulated thread.
-Note that not all targets currently emulate atomic operations correctly.
-x86 and ARM use a global lock in order to preserve their semantics.
-@end table
-
-QEMU was conceived so that ultimately it can emulate itself. Although
-it is not very useful, it is an important test to show the power of the
-emulator.
-
-@node Linux User space emulator
-@section Linux User space emulator
-
-@menu
-* Quick Start::
-* Wine launch::
-* Command line options::
-* Other binaries::
-@end menu
-
-@node Quick Start
-@subsection Quick Start
-
-In order to launch a Linux process, QEMU needs the process executable
-itself and all the target (x86) dynamic libraries used by it.
-
-@itemize
-
-@item On x86, you can just try to launch any process by using the native
-libraries:
-
-@example
-qemu-i386 -L / /bin/ls
-@end example
-
-@code{-L /} tells that the x86 dynamic linker must be searched with a
-@file{/} prefix.
-
-@item Since QEMU is also a linux process, you can launch QEMU with
-QEMU (NOTE: you can only do that if you compiled QEMU from the sources):
-
-@example
-qemu-i386 -L / qemu-i386 -L / /bin/ls
-@end example
-
-@item On non x86 CPUs, you need first to download at least an x86 glibc
-(@file{qemu-runtime-i386-XXX-.tar.gz} on the QEMU web page). Ensure that
-@code{LD_LIBRARY_PATH} is not set:
-
-@example
-unset LD_LIBRARY_PATH
-@end example
-
-Then you can launch the precompiled @file{ls} x86 executable:
-
-@example
-qemu-i386 tests/i386/ls
-@end example
-You can look at @file{scripts/qemu-binfmt-conf.sh} so that
-QEMU is automatically launched by the Linux kernel when you try to
-launch x86 executables. It requires the @code{binfmt_misc} module in the
-Linux kernel.
-
-@item The x86 version of QEMU is also included. You can try weird things such as:
-@example
-qemu-i386 /usr/local/qemu-i386/bin/qemu-i386 \
-          /usr/local/qemu-i386/bin/ls-i386
-@end example
-
-@end itemize
-
-@node Wine launch
-@subsection Wine launch
-
-@itemize
-
-@item Ensure that you have a working QEMU with the x86 glibc
-distribution (see previous section). In order to verify it, you must be
-able to do:
-
-@example
-qemu-i386 /usr/local/qemu-i386/bin/ls-i386
-@end example
-
-@item Download the binary x86 Wine install
-(@file{qemu-XXX-i386-wine.tar.gz} on the QEMU web page).
-
-@item Configure Wine on your account. Look at the provided script
-@file{/usr/local/qemu-i386/@/bin/wine-conf.sh}. Your previous
-@code{$@{HOME@}/.wine} directory is saved to @code{$@{HOME@}/.wine.org}.
-
-@item Then you can try the example @file{putty.exe}:
-
-@example
-qemu-i386 /usr/local/qemu-i386/wine/bin/wine \
-          /usr/local/qemu-i386/wine/c/Program\ Files/putty.exe
-@end example
-
-@end itemize
-
-@node Command line options
-@subsection Command line options
-
-@example
-@command{qemu-i386} [@option{-h]} [@option{-d]} [@option{-L} @var{path}] [@option{-s} @var{size}] [@option{-cpu} @var{model}] [@option{-g} @var{port}] [@option{-B} @var{offset}] [@option{-R} @var{size}] @var{program} [@var{arguments}...]
-@end example
-
-@table @option
-@item -h
-Print the help
-@item -L path
-Set the x86 elf interpreter prefix (default=/usr/local/qemu-i386)
-@item -s size
-Set the x86 stack size in bytes (default=524288)
-@item -cpu model
-Select CPU model (-cpu help for list and additional feature selection)
-@item -E @var{var}=@var{value}
-Set environment @var{var} to @var{value}.
-@item -U @var{var}
-Remove @var{var} from the environment.
-@item -B offset
-Offset guest address by the specified number of bytes.  This is useful when
-the address region required by guest applications is reserved on the host.
-This option is currently only supported on some hosts.
-@item -R size
-Pre-allocate a guest virtual address space of the given size (in bytes).
-"G", "M", and "k" suffixes may be used when specifying the size.
-@end table
-
-Debug options:
-
-@table @option
-@item -d item1,...
-Activate logging of the specified items (use '-d help' for a list of log items)
-@item -p pagesize
-Act as if the host page size was 'pagesize' bytes
-@item -g port
-Wait gdb connection to port
-@item -singlestep
-Run the emulation in single step mode.
-@end table
-
-Environment variables:
-
-@table @env
-@item QEMU_STRACE
-Print system calls and arguments similar to the 'strace' program
-(NOTE: the actual 'strace' program will not work because the user
-space emulator hasn't implemented ptrace).  At the moment this is
-incomplete.  All system calls that don't have a specific argument
-format are printed with information for six arguments.  Many
-flag-style arguments don't have decoders and will show up as numbers.
-@end table
-
-@node Other binaries
-@subsection Other binaries
-
-@cindex user mode (Alpha)
-@command{qemu-alpha} TODO.
-
-@cindex user mode (ARM)
-@command{qemu-armeb} TODO.
-
-@cindex user mode (ARM)
-@command{qemu-arm} is also capable of running ARM "Angel" semihosted ELF
-binaries (as implemented by the arm-elf and arm-eabi Newlib/GDB
-configurations), and arm-uclinux bFLT format binaries.
-
-@cindex user mode (ColdFire)
-@cindex user mode (M68K)
-@command{qemu-m68k} is capable of running semihosted binaries using the BDM
-(m5xxx-ram-hosted.ld) or m68k-sim (sim.ld) syscall interfaces, and
-coldfire uClinux bFLT format binaries.
-
-The binary format is detected automatically.
-
-@cindex user mode (Cris)
-@command{qemu-cris} TODO.
-
-@cindex user mode (i386)
-@command{qemu-i386} TODO.
-@command{qemu-x86_64} TODO.
-
-@cindex user mode (Microblaze)
-@command{qemu-microblaze} TODO.
-
-@cindex user mode (MIPS)
-@command{qemu-mips} executes 32-bit big endian MIPS binaries (MIPS O32 ABI).
-
-@command{qemu-mipsel} executes 32-bit little endian MIPS binaries (MIPS O32 ABI).
-
-@command{qemu-mips64} executes 64-bit big endian MIPS binaries (MIPS N64 ABI).
-
-@command{qemu-mips64el} executes 64-bit little endian MIPS binaries (MIPS N64 ABI).
-
-@command{qemu-mipsn32} executes 32-bit big endian MIPS binaries (MIPS N32 ABI).
-
-@command{qemu-mipsn32el} executes 32-bit little endian MIPS binaries (MIPS N32 ABI).
-
-@cindex user mode (NiosII)
-@command{qemu-nios2} TODO.
-
-@cindex user mode (PowerPC)
-@command{qemu-ppc64abi32} TODO.
-@command{qemu-ppc64} TODO.
-@command{qemu-ppc} TODO.
-
-@cindex user mode (SH4)
-@command{qemu-sh4eb} TODO.
-@command{qemu-sh4} TODO.
-
-@cindex user mode (SPARC)
-@command{qemu-sparc} can execute Sparc32 binaries (Sparc32 CPU, 32 bit ABI).
-
-@command{qemu-sparc32plus} can execute Sparc32 and SPARC32PLUS binaries
-(Sparc64 CPU, 32 bit ABI).
-
-@command{qemu-sparc64} can execute some Sparc64 (Sparc64 CPU, 64 bit ABI) and
-SPARC32PLUS binaries (Sparc64 CPU, 32 bit ABI).
-
-@node BSD User space emulator
-@section BSD User space emulator
-
-@menu
-* BSD Status::
-* BSD Quick Start::
-* BSD Command line options::
-@end menu
-
-@node BSD Status
-@subsection BSD Status
-
-@itemize @minus
-@item
-target Sparc64 on Sparc64: Some trivial programs work.
-@end itemize
-
-@node BSD Quick Start
-@subsection Quick Start
-
-In order to launch a BSD process, QEMU needs the process executable
-itself and all the target dynamic libraries used by it.
-
-@itemize
-
-@item On Sparc64, you can just try to launch any process by using the native
-libraries:
-
-@example
-qemu-sparc64 /bin/ls
-@end example
-
-@end itemize
-
-@node BSD Command line options
-@subsection Command line options
-
-@example
-@command{qemu-sparc64} [@option{-h]} [@option{-d]} [@option{-L} @var{path}] [@option{-s} @var{size}] [@option{-bsd} @var{type}] @var{program} [@var{arguments}...]
-@end example
-
-@table @option
-@item -h
-Print the help
-@item -L path
-Set the library root path (default=/)
-@item -s size
-Set the stack size in bytes (default=524288)
-@item -ignore-environment
-Start with an empty environment. Without this option,
-the initial environment is a copy of the caller's environment.
-@item -E @var{var}=@var{value}
-Set environment @var{var} to @var{value}.
-@item -U @var{var}
-Remove @var{var} from the environment.
-@item -bsd type
-Set the type of the emulated BSD Operating system. Valid values are
-FreeBSD, NetBSD and OpenBSD (default).
-@end table
-
-Debug options:
-
-@table @option
-@item -d item1,...
-Activate logging of the specified items (use '-d help' for a list of log items)
-@item -p pagesize
-Act as if the host page size was 'pagesize' bytes
-@item -singlestep
-Run the emulation in single step mode.
-@end table
-
 @node System requirements
 @chapter System requirements
 
-- 
2.20.1


