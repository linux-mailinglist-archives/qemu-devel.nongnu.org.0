Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7EC3DD54E
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 14:10:56 +0200 (CEST)
Received: from localhost ([::1]:47608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAWmV-0007Pr-2Z
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 08:10:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWaN-0000VF-7k
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 07:58:23 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:40634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWaK-0003a0-HL
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 07:58:23 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 k38-20020a05600c1ca6b029025af5e0f38bso2474114wms.5
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 04:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=woZjiPKWnfTmaS1CIBKdYSxYIOPWZm8+wKl63I+SP1w=;
 b=hJaG4qY7zb6en8+WLdfWv9HFlIUTspLeMlLm1jswDPyQm4Qdlf+3//xhinKW0ZnISo
 GS1uSccR1OQK955+sszuhl1qOZoaEVbPPm/tSC0FPjFhYa83T3/StXTS2SJa9ae8F2R8
 eu9+BeeAqNByG7f4ylUoOXmiFyZNoDnxGh61nI8hNgKKpHTJy5CLc1pFdILocCWpQaP4
 Ft7jgiRPfQ2BlDHvv+gnhaFQYlIC2fRiyoVflE7wA/c2NdH4xV3sE+LTgc1ZxdSptgtO
 sU8TQprHA1vERnmQ0jPELPaAlO7Y3MFQvSs+wS1GgpzokibW2wQRMpMCQ847KQC8cghX
 JRkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=woZjiPKWnfTmaS1CIBKdYSxYIOPWZm8+wKl63I+SP1w=;
 b=iQXxka/XsPA6HeDTU/RUSxH0ahExtIZ7euHuzWfmb551Mm7l0b5A/urXX+bayy7qis
 gfVlYWBdqQAO3WBx0LnYe/0DYRaTk7a9LOyaVycYwhETuQAAZ9rfqCSPMx/rvPqsHXNr
 l0EV+v4MLZIA++6JCLZ9ehloBvCjDnR5JqTGAA35akvFt30Qn8rLnaywSAYCFv6i4Yxv
 B2Rxw7dDTAyIt7Z1GgnaqhKTwGdoNzg/dmFMBf5UKcXOMgb2gjQL+S9MTcfknlLNfxlP
 BdKQecrFMDFQVH3U5EAhwnCMeQdxdCcvPM4EkYjKKgVAshpYQZMEB1TDkLiwwjJk3pAx
 b6PA==
X-Gm-Message-State: AOAM531RIfv8Bt9e8QTy66QvhcoPA3Z1bd6Vdv/JVDXkt/S5PfAYewic
 EXJHGgrYWCNaOgKvqfoXqClGdXutCFav7g==
X-Google-Smtp-Source: ABdhPJxvdYTUBkOW3+K9e7tLwpnzhDkqn3dgiGuDIDwmq2A+lkFrr2Yj9D1DN4dMPgDQzHDjzca5uw==
X-Received: by 2002:a05:600c:896:: with SMTP id
 l22mr6668888wmp.68.1627905498815; 
 Mon, 02 Aug 2021 04:58:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y66sm10102772wmy.39.2021.08.02.04.58.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 04:58:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/21] docs/devel/build-system.rst: Format literals correctly
Date: Mon,  2 Aug 2021 12:57:58 +0100
Message-Id: <20210802115812.10731-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210802115812.10731-1-peter.maydell@linaro.org>
References: <20210802115812.10731-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

build-system.rst seems to have been written under the mistaken
assumption that single-backticks mark up literal text (function
names, etc) which should be rendered in a fixed-width font.
The rST markup for this is ``double backticks``.

Update all the markup.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210726142338.31872-2-peter.maydell@linaro.org
---
 docs/devel/build-system.rst | 156 ++++++++++++++++++------------------
 1 file changed, 78 insertions(+), 78 deletions(-)

diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
index fd1650442ec..ee660a998d0 100644
--- a/docs/devel/build-system.rst
+++ b/docs/devel/build-system.rst
@@ -53,14 +53,14 @@ following tasks:
  - Add a Meson build option to meson_options.txt.
 
  - Add support to the command line arg parser to handle any new
-   `--enable-XXX`/`--disable-XXX` flags required by the feature.
+   ``--enable-XXX``/``--disable-XXX`` flags required by the feature.
 
  - Add information to the help output message to report on the new
    feature flag.
 
  - Add code to perform the actual feature check.
 
- - Add code to include the feature status in `config-host.h`
+ - Add code to include the feature status in ``config-host.h``
 
  - Add code to print out the feature status in the configure summary
    upon completion.
@@ -116,51 +116,51 @@ Helper functions
 The configure script provides a variety of helper functions to assist
 developers in checking for system features:
 
-`do_cc $ARGS...`
+``do_cc $ARGS...``
    Attempt to run the system C compiler passing it $ARGS...
 
-`do_cxx $ARGS...`
+``do_cxx $ARGS...``
    Attempt to run the system C++ compiler passing it $ARGS...
 
-`compile_object $CFLAGS`
+``compile_object $CFLAGS``
    Attempt to compile a test program with the system C compiler using
    $CFLAGS. The test program must have been previously written to a file
-   called $TMPC.  The replacement in Meson is the compiler object `cc`,
-   which has methods such as `cc.compiles()`,
-   `cc.check_header()`, `cc.has_function()`.
+   called $TMPC.  The replacement in Meson is the compiler object ``cc``,
+   which has methods such as ``cc.compiles()``,
+   ``cc.check_header()``, ``cc.has_function()``.
 
-`compile_prog $CFLAGS $LDFLAGS`
+``compile_prog $CFLAGS $LDFLAGS``
    Attempt to compile a test program with the system C compiler using
    $CFLAGS and link it with the system linker using $LDFLAGS. The test
    program must have been previously written to a file called $TMPC.
-   The replacement in Meson is `cc.find_library()` and `cc.links()`.
+   The replacement in Meson is ``cc.find_library()`` and ``cc.links()``.
 
-`has $COMMAND`
+``has $COMMAND``
    Determine if $COMMAND exists in the current environment, either as a
    shell builtin, or executable binary, returning 0 on success.  The
-   replacement in Meson is `find_program()`.
+   replacement in Meson is ``find_program()``.
 
-`check_define $NAME`
+``check_define $NAME``
    Determine if the macro $NAME is defined by the system C compiler
 
-`check_include $NAME`
+``check_include $NAME``
    Determine if the include $NAME file is available to the system C
-   compiler.  The replacement in Meson is `cc.has_header()`.
+   compiler.  The replacement in Meson is ``cc.has_header()``.
 
-`write_c_skeleton`
+``write_c_skeleton``
    Write a minimal C program main() function to the temporary file
    indicated by $TMPC
 
-`feature_not_found $NAME $REMEDY`
+``feature_not_found $NAME $REMEDY``
    Print a message to stderr that the feature $NAME was not available
    on the system, suggesting the user try $REMEDY to address the
    problem.
 
-`error_exit $MESSAGE $MORE...`
+``error_exit $MESSAGE $MORE...``
    Print $MESSAGE to stderr, followed by $MORE... and then exit from the
    configure script with non-zero status
 
-`query_pkg_config $ARGS...`
+``query_pkg_config $ARGS...``
    Run pkg-config passing it $ARGS. If QEMU is doing a static build,
    then --static will be automatically added to $ARGS
 
@@ -187,7 +187,7 @@ process for:
 
 4) other data files, such as icons or desktop files
 
-All executables are built by default, except for some `contrib/`
+All executables are built by default, except for some ``contrib/``
 binaries that are known to fail to build on some platforms (for example
 32-bit or big-endian platforms).  Tests are also built by default,
 though that might change in the future.
@@ -195,14 +195,14 @@ though that might change in the future.
 The source code is highly modularized, split across many files to
 facilitate building of all of these components with as little duplicated
 compilation as possible. Using the Meson "sourceset" functionality,
-`meson.build` files group the source files in rules that are
+``meson.build`` files group the source files in rules that are
 enabled according to the available system libraries and to various
 configuration symbols.  Sourcesets belong to one of four groups:
 
 Subsystem sourcesets:
   Various subsystems that are common to both tools and emulators have
-  their own sourceset, for example `block_ss` for the block device subsystem,
-  `chardev_ss` for the character device subsystem, etc.  These sourcesets
+  their own sourceset, for example ``block_ss`` for the block device subsystem,
+  ``chardev_ss`` for the character device subsystem, etc.  These sourcesets
   are then turned into static libraries as follows::
 
     libchardev = static_library('chardev', chardev_ss.sources(),
@@ -211,8 +211,8 @@ Subsystem sourcesets:
 
     chardev = declare_dependency(link_whole: libchardev)
 
-  As of Meson 0.55.1, the special `.fa` suffix should be used for everything
-  that is used with `link_whole`, to ensure that the link flags are placed
+  As of Meson 0.55.1, the special ``.fa`` suffix should be used for everything
+  that is used with ``link_whole``, to ensure that the link flags are placed
   correctly in the command line.
 
 Target-independent emulator sourcesets:
@@ -221,16 +221,16 @@ Target-independent emulator sourcesets:
   This includes error handling infrastructure, standard data structures,
   platform portability wrapper functions, etc.
 
-  Target-independent code lives in the `common_ss`, `softmmu_ss` and
-  `user_ss` sourcesets.  `common_ss` is linked into all emulators,
-  `softmmu_ss` only in system emulators, `user_ss` only in user-mode
+  Target-independent code lives in the ``common_ss``, ``softmmu_ss`` and
+  ``user_ss`` sourcesets.  ``common_ss`` is linked into all emulators,
+  ``softmmu_ss`` only in system emulators, ``user_ss`` only in user-mode
   emulators.
 
   Target-independent sourcesets must exercise particular care when using
-  `if_false` rules.  The `if_false` rule will be used correctly when linking
+  ``if_false`` rules.  The ``if_false`` rule will be used correctly when linking
   emulator binaries; however, when *compiling* target-independent files
-  into .o files, Meson may need to pick *both* the `if_true` and
-  `if_false` sides to cater for targets that want either side.  To
+  into .o files, Meson may need to pick *both* the ``if_true`` and
+  ``if_false`` sides to cater for targets that want either side.  To
   achieve that, you can add a special rule using the ``CONFIG_ALL``
   symbol::
 
@@ -245,14 +245,14 @@ Target-dependent emulator sourcesets:
   In the target-dependent set lives CPU emulation, some device emulation and
   much glue code. This sometimes also has to be compiled multiple times,
   once for each target being built.  Target-dependent files are included
-  in the `specific_ss` sourceset.
+  in the ``specific_ss`` sourceset.
 
-  Each emulator also includes sources for files in the `hw/` and `target/`
+  Each emulator also includes sources for files in the ``hw/`` and ``target/``
   subdirectories.  The subdirectory used for each emulator comes
   from the target's definition of ``TARGET_BASE_ARCH`` or (if missing)
-  ``TARGET_ARCH``, as found in `default-configs/targets/*.mak`.
+  ``TARGET_ARCH``, as found in ``default-configs/targets/*.mak``.
 
-  Each subdirectory in `hw/` adds one sourceset to the `hw_arch` dictionary,
+  Each subdirectory in ``hw/`` adds one sourceset to the ``hw_arch`` dictionary,
   for example::
 
     arm_ss = ss.source_set()
@@ -262,8 +262,8 @@ Target-dependent emulator sourcesets:
 
   The sourceset is only used for system emulators.
 
-  Each subdirectory in `target/` instead should add one sourceset to each
-  of the `target_arch` and `target_softmmu_arch`, which are used respectively
+  Each subdirectory in ``target/`` instead should add one sourceset to each
+  of the ``target_arch`` and ``target_softmmu_arch``, which are used respectively
   for all emulators and for system emulators only.  For example::
 
     arm_ss = ss.source_set()
@@ -273,11 +273,11 @@ Target-dependent emulator sourcesets:
     target_softmmu_arch += {'arm': arm_softmmu_ss}
 
 Module sourcesets:
-  There are two dictionaries for modules: `modules` is used for
-  target-independent modules and `target_modules` is used for
-  target-dependent modules.  When modules are disabled the `module`
-  source sets are added to `softmmu_ss` and the `target_modules`
-  source sets are added to `specific_ss`.
+  There are two dictionaries for modules: ``modules`` is used for
+  target-independent modules and ``target_modules`` is used for
+  target-dependent modules.  When modules are disabled the ``module``
+  source sets are added to ``softmmu_ss`` and the ``target_modules``
+  source sets are added to ``specific_ss``.
 
   Both dictionaries are nested.  One dictionary is created per
   subdirectory, and these per-subdirectory dictionaries are added to
@@ -290,15 +290,15 @@ Module sourcesets:
     modules += { 'hw-display': hw_display_modules }
 
 Utility sourcesets:
-  All binaries link with a static library `libqemuutil.a`.  This library
+  All binaries link with a static library ``libqemuutil.a``.  This library
   is built from several sourcesets; most of them however host generated
-  code, and the only two of general interest are `util_ss` and `stub_ss`.
+  code, and the only two of general interest are ``util_ss`` and ``stub_ss``.
 
   The separation between these two is purely for documentation purposes.
-  `util_ss` contains generic utility files.  Even though this code is only
+  ``util_ss`` contains generic utility files.  Even though this code is only
   linked in some binaries, sometimes it requires hooks only in some of
   these and depend on other functions that are not fully implemented by
-  all QEMU binaries.  `stub_ss` links dummy stubs that will only be linked
+  all QEMU binaries.  ``stub_ss`` links dummy stubs that will only be linked
   into the binary if the real implementation is not present.  In a way,
   the stubs can be thought of as a portable implementation of the weak
   symbols concept.
@@ -307,8 +307,8 @@ Utility sourcesets:
 The following files concur in the definition of which files are linked
 into each emulator:
 
-`default-configs/devices/*.mak`
-  The files under `default-configs/devices/` control the boards and devices
+``default-configs/devices/*.mak``
+  The files under ``default-configs/devices/`` control the boards and devices
   that are built into each QEMU system emulation targets. They merely contain
   a list of config variable definitions such as::
 
@@ -316,18 +316,18 @@ into each emulator:
     CONFIG_XLNX_ZYNQMP_ARM=y
     CONFIG_XLNX_VERSAL=y
 
-`*/Kconfig`
-  These files are processed together with `default-configs/devices/*.mak` and
+``*/Kconfig``
+  These files are processed together with ``default-configs/devices/*.mak`` and
   describe the dependencies between various features, subsystems and
   device models.  They are described in :ref:`kconfig`
 
-`default-configs/targets/*.mak`
-  These files mostly define symbols that appear in the `*-config-target.h`
+``default-configs/targets/*.mak``
+  These files mostly define symbols that appear in the ``*-config-target.h``
   file for each emulator [#cfgtarget]_.  However, the ``TARGET_ARCH``
-  and ``TARGET_BASE_ARCH`` will also be used to select the `hw/` and
-  `target/` subdirectories that are compiled into each target.
+  and ``TARGET_BASE_ARCH`` will also be used to select the ``hw/`` and
+  ``target/`` subdirectories that are compiled into each target.
 
-.. [#cfgtarget] This header is included by `qemu/osdep.h` when
+.. [#cfgtarget] This header is included by ``qemu/osdep.h`` when
                 compiling files from the target-specific sourcesets.
 
 These files rarely need changing unless you are adding a completely
@@ -339,19 +339,19 @@ Support scripts
 ---------------
 
 Meson has a special convention for invoking Python scripts: if their
-first line is `#! /usr/bin/env python3` and the file is *not* executable,
+first line is ``#! /usr/bin/env python3`` and the file is *not* executable,
 find_program() arranges to invoke the script under the same Python
 interpreter that was used to invoke Meson.  This is the most common
 and preferred way to invoke support scripts from Meson build files,
 because it automatically uses the value of configure's --python= option.
 
-In case the script is not written in Python, use a `#! /usr/bin/env ...`
+In case the script is not written in Python, use a ``#! /usr/bin/env ...``
 line and make the script executable.
 
 Scripts written in Python, where it is desirable to make the script
 executable (for example for test scripts that developers may want to
 invoke from the command line, such as tests/qapi-schema/test-qapi.py),
-should be invoked through the `python` variable in meson.build. For
+should be invoked through the ``python`` variable in meson.build. For
 example::
 
   test('QAPI schema regression tests', python,
@@ -375,10 +375,10 @@ rules and wraps them so that e.g. submodules are built before QEMU.
 The resulting build system is largely non-recursive in nature, in
 contrast to common practices seen with automake.
 
-Tests are also ran by the Makefile with the traditional `make check`
-phony target, while benchmarks are run with `make bench`.  Meson test
-suites such as `unit` can be ran with `make check-unit` too.  It is also
-possible to run tests defined in meson.build with `meson test`.
+Tests are also ran by the Makefile with the traditional ``make check``
+phony target, while benchmarks are run with ``make bench``.  Meson test
+suites such as ``unit`` can be ran with ``make check-unit`` too.  It is also
+possible to run tests defined in meson.build with ``meson test``.
 
 Important files for the build system
 ====================================
@@ -390,28 +390,28 @@ The following key files are statically defined in the source tree, with
 the rules needed to build QEMU. Their behaviour is influenced by a
 number of dynamically created files listed later.
 
-`Makefile`
+``Makefile``
   The main entry point used when invoking make to build all the components
   of QEMU. The default 'all' target will naturally result in the build of
   every component. Makefile takes care of recursively building submodules
   directly via a non-recursive set of rules.
 
-`*/meson.build`
+``*/meson.build``
   The meson.build file in the root directory is the main entry point for the
   Meson build system, and it coordinates the configuration and build of all
   executables.  Build rules for various subdirectories are included in
   other meson.build files spread throughout the QEMU source tree.
 
-`tests/Makefile.include`
+``tests/Makefile.include``
   Rules for external test harnesses. These include the TCG tests,
-  `qemu-iotests` and the Avocado-based acceptance tests.
+  ``qemu-iotests`` and the Avocado-based acceptance tests.
 
-`tests/docker/Makefile.include`
+``tests/docker/Makefile.include``
   Rules for Docker tests. Like tests/Makefile, this file is included
   directly by the top level Makefile, anything defined in this file will
   influence the entire build system.
 
-`tests/vm/Makefile.include`
+``tests/vm/Makefile.include``
   Rules for VM-based tests. Like tests/Makefile, this file is included
   directly by the top level Makefile, anything defined in this file will
   influence the entire build system.
@@ -427,11 +427,11 @@ Makefile.
 
 Built by configure:
 
-`config-host.mak`
+``config-host.mak``
   When configure has determined the characteristics of the build host it
   will write a long list of variables to config-host.mak file. This
   provides the various install directories, compiler / linker flags and a
-  variety of `CONFIG_*` variables related to optionally enabled features.
+  variety of ``CONFIG_*`` variables related to optionally enabled features.
   This is imported by the top level Makefile and meson.build in order to
   tailor the build output.
 
@@ -446,29 +446,29 @@ Built by configure:
 
 Built by Meson:
 
-`${TARGET-NAME}-config-devices.mak`
+``${TARGET-NAME}-config-devices.mak``
   TARGET-NAME is again the name of a system or userspace emulator. The
   config-devices.mak file is automatically generated by make using the
   scripts/make_device_config.sh program, feeding it the
   default-configs/$TARGET-NAME file as input.
 
-`config-host.h`, `$TARGET-NAME/config-target.h`, `$TARGET-NAME/config-devices.h`
+``config-host.h``, ``$TARGET-NAME/config-target.h``, ``$TARGET-NAME/config-devices.h``
   These files are used by source code to determine what features
   are enabled.  They are generated from the contents of the corresponding
-  `*.h` files using the scripts/create_config program. This extracts
+  ``*.h`` files using the scripts/create_config program. This extracts
   relevant variables and formats them as C preprocessor macros.
 
-`build.ninja`
+``build.ninja``
   The build rules.
 
 
 Built by Makefile:
 
-`Makefile.ninja`
+``Makefile.ninja``
   A Makefile include that bridges to ninja for the actual build.  The
   Makefile is mostly a list of targets that Meson included in build.ninja.
 
-`Makefile.mtest`
+``Makefile.mtest``
   The Makefile definitions that let "make check" run tests defined in
   meson.build.  The rules are produced from Meson's JSON description of
   tests (obtained with "meson introspect --tests") through the script
@@ -478,9 +478,9 @@ Built by Makefile:
 Useful make targets
 -------------------
 
-`help`
+``help``
   Print a help message for the most common build targets.
 
-`print-VAR`
+``print-VAR``
   Print the value of the variable VAR. Useful for debugging the build
   system.
-- 
2.20.1


