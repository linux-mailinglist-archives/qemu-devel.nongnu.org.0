Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0498241DB64
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 15:44:32 +0200 (CEST)
Received: from localhost ([::1]:58462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVwMR-0003TZ-2v
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 09:44:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVwBX-0008AW-NE
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 09:33:15 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:41570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVwBT-0005JW-Fs
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 09:33:14 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 g19-20020a1c9d13000000b003075062d4daso4384209wme.0
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 06:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WIMLHBiyDPK1hazF+HIFOa18J+vh2aSGumNwFu7JSos=;
 b=cb2Of3q2Ymlr6RggMNA273N5e7609BIDJDE1RTfcpWIBRVExwESymk8We28yYIZevI
 +3JHkIzTr9YKmclPkVNZwqiuKcoRpT2AphBHpRAXtYlT4NMZuQVaWYcACCp7vCliXyKJ
 6VxYGu9WUK+88Hhqew0hobnH9Y1RJWjlPS3wkcWqh4RsK0e32AjGFqxjVFSxm45VNqUs
 zOp8jlmdaNLP52YY9U8DmeLyBx21BI3wree1nYPzIQ0JuHM8cEpQL57BmqVZ238ycwWR
 mf6yCzQ+we6FNvhb0OKLqGbKQufBE4mMvX7E9cCaRokgvA2tdl6GrzrzbGg0cjKfI9og
 meqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WIMLHBiyDPK1hazF+HIFOa18J+vh2aSGumNwFu7JSos=;
 b=vgc9JnDEco+4ybS4E8HOFTA6J0SpcH69FbduduaUYFElEMwzbTddSM/IMtlGr3+U93
 FAOb/KTLKn0pxorXRRTrylYlD88scJEOkV6+DIwSC1yCBf/7T0P2QrXQ2pRko6K++0Ke
 ofJaWjJ3kMlEVQCHS/CcsTimW9u9DzsVidyE3fIj2sziONDfT1NQU8q4zyUC3Y0ylov0
 P4YsdtwjFhfDDI2ZdvWF7hJ4xNT24TXXJRlEl/+duPFiMTaZFa4Y+vOSc2s3AOyE/1dh
 oGuN6TkS2AzUD9n/VSVtIAsl3zPdqAx7xbyPrhwQGlOyB7dhMleEK4Sj7P5VrSeYj74Q
 u7WA==
X-Gm-Message-State: AOAM532COCfPvY8bGydUilgpi4nnCW4bAeuv8CjxWdDD8oYcNlWX7RAH
 oH1wVEPHTx/sckMg/zWyRXQY2//tbx8=
X-Google-Smtp-Source: ABdhPJyk6yI7Nd8ekk9/k5rQiBMd6UQiT+oAw4RtMkzxBh2TD9b346PbnuOsE1r4XHtOjILt7OlMPw==
X-Received: by 2002:a7b:c842:: with SMTP id c2mr15904189wml.93.1633008785506; 
 Thu, 30 Sep 2021 06:33:05 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c4sm3037168wrt.23.2021.09.30.06.33.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 06:33:05 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/7] docs: reorganize testing.rst
Date: Thu, 30 Sep 2021 15:32:50 +0200
Message-Id: <20210930133250.181156-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210930133250.181156-1-pbonzini@redhat.com>
References: <20210930133250.181156-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Clean up the heading levels to use === --- ~~~ ^^^ '''.  Reorganize the
outline for the Avocado part, and always include headings for the
class names.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/testing.rst | 146 +++++++++++++++++++++--------------------
 1 file changed, 76 insertions(+), 70 deletions(-)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 200ce46c63..8df38f751d 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -1,11 +1,10 @@
-===============
 Testing in QEMU
 ===============
 
 This document describes the testing infrastructure in QEMU.
 
 Testing with "make check"
-=========================
+-------------------------
 
 The "make check" testing family includes most of the C based tests in QEMU. For
 a quick help, run ``make check-help`` from the source tree.
@@ -24,7 +23,7 @@ expect the executables to exist and will fail with obscure messages if they
 cannot find them.
 
 Unit tests
-----------
+~~~~~~~~~~
 
 Unit tests, which can be invoked with ``make check-unit``, are simple C tests
 that typically link to individual QEMU object files and exercise them by
@@ -67,7 +66,7 @@ and copy the actual command line which executes the unit test, then run
 it from the command line.
 
 QTest
------
+~~~~~
 
 QTest is a device emulation testing framework.  It can be very useful to test
 device models; it could also control certain aspects of QEMU (such as virtual
@@ -81,7 +80,7 @@ QTest cases can be executed with
    make check-qtest
 
 QAPI schema tests
------------------
+~~~~~~~~~~~~~~~~~
 
 The QAPI schema tests validate the QAPI parser used by QMP, by feeding
 predefined input to the parser and comparing the result with the reference
@@ -108,14 +107,14 @@ parser (either fixing a bug or extending/modifying the syntax). To do this:
   ``qapi-schema += foo.json``
 
 check-block
------------
+~~~~~~~~~~~
 
 ``make check-block`` runs a subset of the block layer iotests (the tests that
 are in the "auto" group).
 See the "QEMU iotests" section below for more information.
 
 QEMU iotests
-============
+------------
 
 QEMU iotests, under the directory ``tests/qemu-iotests``, is the testing
 framework widely used to test block layer related features. It is higher level
@@ -152,7 +151,7 @@ More options are supported by the ``./check`` script, run ``./check -h`` for
 help.
 
 Writing a new test case
------------------------
+~~~~~~~~~~~~~~~~~~~~~~~
 
 Consider writing a tests case when you are making any changes to the block
 layer. An iotest case is usually the choice for that. There are already many
@@ -206,7 +205,8 @@ test failure.  If using such devices are explicitly desired, consider adding
 ``locking=off`` option to disable image locking.
 
 Debugging a test case
------------------------
+~~~~~~~~~~~~~~~~~~~~~
+
 The following options to the ``check`` script can be useful when debugging
 a failing test:
 
@@ -235,7 +235,7 @@ a failing test:
   ``$TEST_DIR/qemu-machine-<random_string>``.
 
 Test case groups
-----------------
+~~~~~~~~~~~~~~~~
 
 "Tests may belong to one or more test groups, which are defined in the form
 of a comment in the test source file. By convention, test groups are listed
@@ -285,10 +285,10 @@ Note that the following group names have a special meaning:
 .. _container-ref:
 
 Container based tests
-=====================
+---------------------
 
 Introduction
-------------
+~~~~~~~~~~~~
 
 The container testing framework in QEMU utilizes public images to
 build and test QEMU in predefined and widely accessible Linux
@@ -303,7 +303,7 @@ The container images are also used to augment the generation of tests
 for testing TCG. See :ref:`checktcg-ref` for more details.
 
 Docker Prerequisites
---------------------
+~~~~~~~~~~~~~~~~~~~~
 
 Install "docker" with the system package manager and start the Docker service
 on your development machine, then make sure you have the privilege to run
@@ -334,7 +334,7 @@ exploit the whole host with Docker bind mounting or other privileged
 operations.  So only do it on development machines.
 
 Podman Prerequisites
---------------------
+~~~~~~~~~~~~~~~~~~~~
 
 Install "podman" with the system package manager.
 
@@ -346,7 +346,7 @@ Install "podman" with the system package manager.
 The last command should print an empty table, to verify the system is ready.
 
 Quickstart
-----------
+~~~~~~~~~~
 
 From source tree, type ``make docker-help`` to see the help. Testing
 can be started without configuring or building QEMU (``configure`` and
@@ -362,7 +362,7 @@ is downloaded and initialized automatically), in which the ``test-build`` job
 is executed.
 
 Registry
---------
+~~~~~~~~
 
 The QEMU project has a container registry hosted by GitLab at
 ``registry.gitlab.com/qemu-project/qemu`` which will automatically be
@@ -376,7 +376,7 @@ locally by using the ``NOCACHE`` build option:
    make docker-image-debian10 NOCACHE=1
 
 Images
-------
+~~~~~~
 
 Along with many other images, the ``centos8`` image is defined in a Dockerfile
 in ``tests/docker/dockerfiles/``, called ``centos8.docker``. ``make docker-help``
@@ -391,7 +391,7 @@ mainly used to do necessary host side setup. One such setup is ``binfmt_misc``,
 for example, to make qemu-user powered cross build containers work.
 
 Tests
------
+~~~~~
 
 Different tests are added to cover various configurations to build and test
 QEMU.  Docker tests are the executables under ``tests/docker`` named
@@ -402,7 +402,7 @@ source and build it.
 The full list of tests is printed in the ``make docker-help`` help.
 
 Debugging a Docker test failure
--------------------------------
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 When CI tasks, maintainers or yourself report a Docker test failure, follow the
 below steps to debug it:
@@ -419,7 +419,7 @@ below steps to debug it:
    the prompt for debug.
 
 Options
--------
+~~~~~~~
 
 Various options can be used to affect how Docker tests are done. The full
 list is in the ``make docker`` help text. The frequently used ones are:
@@ -433,7 +433,7 @@ list is in the ``make docker`` help text. The frequently used ones are:
   failure" section.
 
 Thread Sanitizer
-================
+----------------
 
 Thread Sanitizer (TSan) is a tool which can detect data races.  QEMU supports
 building and testing with this tool.
@@ -443,7 +443,7 @@ For more information on TSan:
 https://github.com/google/sanitizers/wiki/ThreadSanitizerCppManual
 
 Thread Sanitizer in Docker
----------------------------
+~~~~~~~~~~~~~~~~~~~~~~~~~~
 TSan is currently supported in the ubuntu2004 docker.
 
 The test-tsan test will build using TSan and then run make check.
@@ -458,7 +458,7 @@ We recommend using DEBUG=1 to allow launching the test from inside the docker,
 and to allow review of the warnings generated by TSan.
 
 Building and Testing with TSan
-------------------------------
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 It is possible to build and test with TSan, with a few additional steps.
 These steps are normally done automatically in the docker.
@@ -497,7 +497,7 @@ This allows for running the test and then checking the warnings afterwards.
 If you want TSan to stop and exit with error on warnings, use exitcode=66.
 
 TSan Suppressions
------------------
+~~~~~~~~~~~~~~~~~
 Keep in mind that for any data race warning, although there might be a data race
 detected by TSan, there might be no actual bug here.  TSan provides several
 different mechanisms for suppressing warnings.  In general it is recommended
@@ -523,7 +523,7 @@ More information on the file format can be found here under "Blacklist Format":
 https://github.com/google/sanitizers/wiki/ThreadSanitizerFlags
 
 TSan Annotations
-----------------
+~~~~~~~~~~~~~~~~
 include/qemu/tsan.h defines annotations.  See this file for more descriptions
 of the annotations themselves.  Annotations can be used to suppress
 TSan warnings or give TSan more information so that it can detect proper
@@ -540,14 +540,14 @@ The full set of annotations can be found here:
 https://github.com/llvm/llvm-project/blob/master/compiler-rt/lib/tsan/rtl/tsan_interface_ann.cpp
 
 VM testing
-==========
+----------
 
 This test suite contains scripts that bootstrap various guest images that have
 necessary packages to build QEMU. The basic usage is documented in ``Makefile``
 help which is displayed with ``make vm-help``.
 
 Quickstart
-----------
+~~~~~~~~~~
 
 Run ``make vm-help`` to list available make targets. Invoke a specific make
 command to run build test in an image. For example, ``make vm-build-freebsd``
@@ -562,7 +562,7 @@ concerned about attackers taking control of the guest and potentially
 exploiting a QEMU security bug to compromise the host.
 
 QEMU binaries
--------------
+~~~~~~~~~~~~~
 
 By default, qemu-system-x86_64 is searched in $PATH to run the guest. If there
 isn't one, or if it is older than 2.10, the test won't work. In this case,
@@ -571,20 +571,20 @@ provide the QEMU binary in env var: ``QEMU=/path/to/qemu-2.10+``.
 Likewise the path to qemu-img can be set in QEMU_IMG environment variable.
 
 Make jobs
----------
+~~~~~~~~~
 
 The ``-j$X`` option in the make command line is not propagated into the VM,
 specify ``J=$X`` to control the make jobs in the guest.
 
 Debugging
----------
+~~~~~~~~~
 
 Add ``DEBUG=1`` and/or ``V=1`` to the make command to allow interactive
 debugging and verbose output. If this is not enough, see the next section.
 ``V=1`` will be propagated down into the make jobs in the guest.
 
 Manual invocation
------------------
+~~~~~~~~~~~~~~~~~
 
 Each guest script is an executable script with the same command line options.
 For example to work with the netbsd guest, use ``$QEMU_SRC/tests/vm/netbsd``:
@@ -608,7 +608,7 @@ For example to work with the netbsd guest, use ``$QEMU_SRC/tests/vm/netbsd``:
     $ ./netbsd --interactive --image /var/tmp/netbsd.img sh
 
 Adding new guests
------------------
+~~~~~~~~~~~~~~~~~
 
 Please look at existing guest scripts for how to add new guests.
 
@@ -641,7 +641,7 @@ the script's ``main()``.
   recommended.
 
 Image fuzzer testing
-====================
+--------------------
 
 An image fuzzer was added to exercise format drivers. Currently only qcow2 is
 supported. To start the fuzzer, run
@@ -654,7 +654,7 @@ Alternatively, some command different from "qemu-img info" can be tested, by
 changing the ``-c`` option.
 
 Acceptance tests using the Avocado Framework
-============================================
+--------------------------------------------
 
 The ``tests/acceptance`` directory hosts functional tests, also known
 as acceptance level tests.  They're usually higher level tests, and
@@ -693,7 +693,7 @@ Tests based on ``avocado_qemu.Test`` can easily:
    - http://avocado-framework.readthedocs.io/en/latest/api/utils/avocado.utils.html
 
 Running tests
--------------
+~~~~~~~~~~~~~
 
 You can run the acceptance tests simply by executing:
 
@@ -722,7 +722,7 @@ may be invoked by running:
   tests/venv/bin/avocado run $OPTION1 $OPTION2 tests/acceptance/
 
 Manual Installation
--------------------
+~~~~~~~~~~~~~~~~~~~
 
 To manually install Avocado and its dependencies, run:
 
@@ -735,7 +735,7 @@ Alternatively, follow the instructions on this link:
   https://avocado-framework.readthedocs.io/en/latest/guides/user/chapters/installing.html
 
 Overview
---------
+~~~~~~~~
 
 The ``tests/acceptance/avocado_qemu`` directory provides the
 ``avocado_qemu`` Python module, containing the ``avocado_qemu.Test``
@@ -771,7 +771,7 @@ in the current directory, tagged as "quick", run:
   avocado run -t quick .
 
 The ``avocado_qemu.Test`` base test class
------------------------------------------
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 The ``avocado_qemu.Test`` class has a number of characteristics that
 are worth being mentioned right away.
@@ -821,7 +821,7 @@ At test "tear down", ``avocado_qemu.Test`` handles all the QEMUMachines
 shutdown.
 
 The ``avocado_qemu.LinuxTest`` base test class
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 The ``avocado_qemu.LinuxTest`` is further specialization of the
 ``avocado_qemu.Test`` class, so it contains all the characteristics of
@@ -864,7 +864,7 @@ execution of a QEMU binary, giving its users:
    a more succinct and intuitive way
 
 QEMU binary selection
-~~~~~~~~~~~~~~~~~~~~~
+^^^^^^^^^^^^^^^^^^^^^
 
 The QEMU binary used for the ``self.vm`` QEMUMachine instance will
 primarily depend on the value of the ``qemu_bin`` parameter.  If it's
@@ -885,20 +885,23 @@ The resulting ``qemu_bin`` value will be preserved in the
 ``avocado_qemu.Test`` as an attribute with the same name.
 
 Attribute reference
--------------------
+~~~~~~~~~~~~~~~~~~~
+
+Test
+^^^^
 
 Besides the attributes and methods that are part of the base
 ``avocado.Test`` class, the following attributes are available on any
 ``avocado_qemu.Test`` instance.
 
 vm
-~~
+''
 
 A QEMUMachine instance, initially configured according to the given
 ``qemu_bin`` parameter.
 
 arch
-~~~~
+''''
 
 The architecture can be used on different levels of the stack, e.g. by
 the framework or by the test itself.  At the framework level, it will
@@ -915,7 +918,7 @@ name.  If one is not given explicitly, it will either be set to
 ``:avocado: tags=arch:VALUE`` tag, it will be set to ``VALUE``.
 
 cpu
-~~~
+'''
 
 The cpu model that will be set to all QEMUMachine instances created
 by the test.
@@ -926,7 +929,7 @@ name. If one is not given explicitly, it will either be set to
 ``:avocado: tags=cpu:VALUE`` tag, it will be set to ``VALUE``.
 
 machine
-~~~~~~~
+'''''''
 
 The machine type that will be set to all QEMUMachine instances created
 by the test.
@@ -937,20 +940,20 @@ name.  If one is not given explicitly, it will either be set to
 ``:avocado: tags=machine:VALUE`` tag, it will be set to ``VALUE``.
 
 qemu_bin
-~~~~~~~~
+''''''''
 
 The preserved value of the ``qemu_bin`` parameter or the result of the
 dynamic probe for a QEMU binary in the current working directory or
 source tree.
 
 LinuxTest
-~~~~~~~~~
+^^^^^^^^^
 
 Besides the attributes present on the ``avocado_qemu.Test`` base
 class, the ``avocado_qemu.LinuxTest`` adds the following attributes:
 
 distro
-......
+''''''
 
 The name of the Linux distribution used as the guest image for the
 test.  The name should match the **Provider** column on the list
@@ -959,7 +962,7 @@ of images supported by the avocado.utils.vmimage library:
 https://avocado-framework.readthedocs.io/en/latest/guides/writer/libs/vmimage.html#supported-images
 
 distro_version
-..............
+''''''''''''''
 
 The version of the Linux distribution as the guest image for the
 test.  The name should match the **Version** column on the list
@@ -968,7 +971,7 @@ of images supported by the avocado.utils.vmimage library:
 https://avocado-framework.readthedocs.io/en/latest/guides/writer/libs/vmimage.html#supported-images
 
 distro_checksum
-...............
+'''''''''''''''
 
 The sha256 hash of the guest image file used for the test.
 
@@ -977,7 +980,7 @@ same name), no validation on the integrity of the image will be
 performed.
 
 Parameter reference
--------------------
+~~~~~~~~~~~~~~~~~~~
 
 To understand how Avocado parameters are accessed by tests, and how
 they can be passed to tests, please refer to::
@@ -991,8 +994,11 @@ like the following:
 
   PARAMS (key=qemu_bin, path=*, default=./qemu-system-x86_64) => './qemu-system-x86_64
 
+Test
+^^^^
+
 arch
-~~~~
+''''
 
 The architecture that will influence the selection of a QEMU binary
 (when one is not explicitly given).
@@ -1005,31 +1011,30 @@ This parameter has a direct relation with the ``arch`` attribute.  If
 not given, it will default to None.
 
 cpu
-~~~
+'''
 
 The cpu model that will be set to all QEMUMachine instances created
 by the test.
 
 machine
-~~~~~~~
+'''''''
 
 The machine type that will be set to all QEMUMachine instances created
 by the test.
 
-
 qemu_bin
-~~~~~~~~
+''''''''
 
 The exact QEMU binary to be used on QEMUMachine.
 
 LinuxTest
-~~~~~~~~~
+^^^^^^^^^
 
 Besides the parameters present on the ``avocado_qemu.Test`` base
 class, the ``avocado_qemu.LinuxTest`` adds the following parameters:
 
 distro
-......
+''''''
 
 The name of the Linux distribution used as the guest image for the
 test.  The name should match the **Provider** column on the list
@@ -1038,7 +1043,7 @@ of images supported by the avocado.utils.vmimage library:
 https://avocado-framework.readthedocs.io/en/latest/guides/writer/libs/vmimage.html#supported-images
 
 distro_version
-..............
+''''''''''''''
 
 The version of the Linux distribution as the guest image for the
 test.  The name should match the **Version** column on the list
@@ -1047,7 +1052,7 @@ of images supported by the avocado.utils.vmimage library:
 https://avocado-framework.readthedocs.io/en/latest/guides/writer/libs/vmimage.html#supported-images
 
 distro_checksum
-...............
+'''''''''''''''
 
 The sha256 hash of the guest image file used for the test.
 
@@ -1055,7 +1060,8 @@ If this value is not set in the code or by this parameter no
 validation on the integrity of the image will be performed.
 
 Skipping tests
---------------
+~~~~~~~~~~~~~~
+
 The Avocado framework provides Python decorators which allow for easily skip
 tests running under certain conditions. For example, on the lack of a binary
 on the test system or when the running environment is a CI system. For further
@@ -1070,7 +1076,7 @@ environment variables became a kind of standard way to enable/disable tests.
 Here is a list of the most used variables:
 
 AVOCADO_ALLOW_LARGE_STORAGE
-~~~~~~~~~~~~~~~~~~~~~~~~~~~
+^^^^^^^^^^^^^^^^^^^^^^^^^^^
 Tests which are going to fetch or produce assets considered *large* are not
 going to run unless that ``AVOCADO_ALLOW_LARGE_STORAGE=1`` is exported on
 the environment.
@@ -1079,7 +1085,7 @@ The definition of *large* is a bit arbitrary here, but it usually means an
 asset which occupies at least 1GB of size on disk when uncompressed.
 
 AVOCADO_ALLOW_UNTRUSTED_CODE
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 There are tests which will boot a kernel image or firmware that can be
 considered not safe to run on the developer's workstation, thus they are
 skipped by default. The definition of *not safe* is also arbitrary but
@@ -1090,7 +1096,7 @@ You should export ``AVOCADO_ALLOW_UNTRUSTED_CODE=1`` on the environment in
 order to allow tests which make use of those kind of assets.
 
 AVOCADO_TIMEOUT_EXPECTED
-~~~~~~~~~~~~~~~~~~~~~~~~
+^^^^^^^^^^^^^^^^^^^^^^^^
 The Avocado framework has a timeout mechanism which interrupts tests to avoid the
 test suite of getting stuck. The timeout value can be set via test parameter or
 property defined in the test class, for further details::
@@ -1104,7 +1110,7 @@ compiled with debug flags. Therefore, the ``AVOCADO_TIMEOUT_EXPECTED`` variable
 has been used to determine whether those tests should run or not.
 
 GITLAB_CI
-~~~~~~~~~
+^^^^^^^^^
 A number of tests are flagged to not run on the GitLab CI. Usually because
 they proved to the flaky or there are constraints on the CI environment which
 would make them fail. If you encounter a similar situation then use that
@@ -1117,7 +1123,7 @@ variable as shown on the code snippet below to skip the test:
       do_something()
 
 Uninstalling Avocado
---------------------
+~~~~~~~~~~~~~~~~~~~~
 
 If you've followed the manual installation instructions above, you can
 easily uninstall Avocado.  Start by listing the packages you have
@@ -1135,7 +1141,7 @@ Avocado is installed will be cleaned up as part of ``make check-clean``.
 .. _checktcg-ref:
 
 Testing with "make check-tcg"
-=============================
+-----------------------------
 
 The check-tcg tests are intended for simple smoke tests of both
 linux-user and softmmu TCG functionality. However to build test
@@ -1168,7 +1174,7 @@ itself.
 See :ref:`container-ref` for more details.
 
 Running subset of tests
------------------------
+~~~~~~~~~~~~~~~~~~~~~~~
 
 You can build the tests for one architecture::
 
@@ -1182,7 +1188,7 @@ Adding ``V=1`` to the invocation will show the details of how to
 invoke QEMU for the test which is useful for debugging tests.
 
 TCG test dependencies
----------------------
+~~~~~~~~~~~~~~~~~~~~~
 
 The TCG tests are deliberately very light on dependencies and are
 either totally bare with minimal gcc lib support (for softmmu tests)
@@ -1216,7 +1222,7 @@ to run to exercise QEMU's linux-user code::
   https://linux-test-project.github.io/
 
 GCC gcov support
-================
+----------------
 
 ``gcov`` is a GCC tool to analyze the testing coverage by
 instrumenting the tested code. To use it, configure QEMU with
-- 
2.31.1


