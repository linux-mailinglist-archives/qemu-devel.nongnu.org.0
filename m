Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AABAA375F0A
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 05:12:59 +0200 (CEST)
Received: from localhost ([::1]:47382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leqvC-0003En-NF
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 23:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leqtD-0001Z3-J6
 for qemu-devel@nongnu.org; Thu, 06 May 2021 23:10:55 -0400
Received: from indium.canonical.com ([91.189.90.7]:59368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leqt9-0002wN-7i
 for qemu-devel@nongnu.org; Thu, 06 May 2021 23:10:55 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leqt7-0003lL-K4
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 03:10:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9531D2E804C
 for <qemu-devel@nongnu.org>; Fri,  7 May 2021 03:10:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 May 2021 03:01:23 -0000
From: Thomas Huth <1885827@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: plugins windows
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee casmac cota th-huth
X-Launchpad-Bug-Reporter: Xiaolei (casmac)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159357217483.1717.4076077243388027502.malonedeb@chaenomeles.canonical.com>
Message-Id: <162035648349.5739.6814493626925775017.malone@wampee.canonical.com>
Subject: [Bug 1885827] Re: building plugin failed on Windows with mingw
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: e7d80ae5837265ee1dc6eb1a33bb6f2bf83390f0
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1885827 <1885827@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting the bug state to "Incomplete" now.

If the bug has already been fixed in the latest upstream version of QEMU,
then please close this ticket as "Fix released".

If it is not fixed yet and you think that this bug report here is still
valid, then you have two options:

1) If you already have an account on gitlab.com, please open a new ticket
for this problem in our new tracker here:

    https://gitlab.com/qemu-project/qemu/-/issues

and then close this ticket here on Launchpad (or let it expire auto-
matically after 60 days). Please mention the URL of this bug ticket on
Launchpad in the new ticket on GitLab.

2) If you don't have an account on gitlab.com and don't intend to get
one, but still would like to keep this ticket opened, then please switch
the state back to "New" within the next 60 days (otherwise it will get
closed as "Expired"). We will then eventually migrate the ticket auto-
matically to the new system (but you won't be the reporter of the bug
in the new system and thus won't get notified on changes anymore).

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1885827

Title:
  building plugin failed on Windows with mingw

Status in QEMU:
  Incomplete

Bug description:
  I want to build QEMU 4.2.0's plugin module on Windows 7/10 with Mingw, bu=
t the building process faild.
   =

  The step I follow is listed below:
  1. create "dsp_build" diretory under source file folder

  2.  change directory to dsp_build , and run ../configure --target-list=3D=
dsp-softmmu --cross-prefix=3Dx86_64-w64-mingw32- --enable-gtk --enable-sdl =
--enable-debug --enable-plugins
  3. build qemu project
  4. switch dir to /dsp_build, make -C tests/plugin, yeilds error: =

     CC      bb.o
   D:/emu_devl/qemu_src/qemu-sr-dsp-a/qemu_tidsp_c3x/tests/plugin/bb.c:17:2=
4: error: variable 'qemu_plugin_version' definition is marked dllimport
     17 | QEMU_PLUGIN_EXPORT int qemu_plugin_version =3D QEMU_PLUGIN_VERSIO=
N;
        |                        ^~~~~~~~~~~~~~~~~~~
   D:/emu_devl/qemu_src/qemu-sr-dsp-a/qemu_tidsp_c3x/tests/plugin/bb.c:17:2=
4: warning: 'qemu_plugin_version' redeclared without dllimport attribute: p=
revious dllimport ignored [-Wattributes]
   D:/emu_devl/qemu_src/qemu-sr-dsp-a/qemu_tidsp_c3x/tests/plugin/bb.c: In =
function 'vcpu_tb_exec':
   D:/emu_devl/qemu_src/qemu-sr-dsp-a/qemu_tidsp_c3x/tests/plugin/bb.c:33:2=
9: warning: cast from pointer to integer of different size [-Wpointer-to-in=
t-cast]
     33 |     unsigned long n_insns =3D (unsigned long)udata;
        |                             ^
   D:/emu_devl/qemu_src/qemu-sr-dsp-a/qemu_tidsp_c3x/tests/plugin/bb.c: In =
function 'vcpu_tb_trans':
   D:/emu_devl/qemu_src/qemu-sr-dsp-a/qemu_tidsp_c3x/tests/plugin/bb.c:51:4=
6: warning: cast to pointer from integer of different size [-Wint-to-pointe=
r-cast]
     51 |                                              (void *)n_insns);

  5.  Then , I modified the QEMU_flags and the compilation command
  arguments($(CC) ..) in  the  makefile :

                  BUILD_DIR :=3D $(CURDIR)/../..

  		include $(BUILD_DIR)/config-host.mak
  		include $(SRC_PATH)/rules.mak

                  $(call set-vpath, $(SRC_PATH)/tests/plugin)

  		NAMES :=3D
  		NAMES +=3D bb
  		NAMES +=3D empty
  		NAMES +=3D insn
  		NAMES +=3D mem
  		NAMES +=3D hotblocks
  		NAMES +=3D howvec
  		NAMES +=3D hotpages

                  SONAMES :=3D $(addsuffix .so,$(addprefix lib,$(NAMES)))

  		QEMU_CFLAGS +=3D -fPIC	-DBUILDING_DLL  		#added  -DBUILDING_DLL
  		QEMU_CFLAGS +=3D -I$(SRC_PATH)/include/qemu

                  all: $(SONAMES)

  		lib%.so: %.o
  			$(CC) -fPIC -shared -o $@ $^ $(LDLIBS) -L /c/msys64/mingw64/lib/ -lgli=
b-2.0
  			# original cmd: $(CC) -shared -Wl,-soname,$@ -o $@ $^ $(LDLIBS)

  		clean:
  			rm -f *.o *.so *.d
  			rm -Rf .libs

                  .PHONY: all clean

  6.  Executing make yeilds:

  make: enter   =E2=80=9C/d/emu_devl/qemu_src/qemu-sr-dsp-a/qemu_tidsp_c3x/=
build_dsp/tests/plugin=E2=80=9D
    CC      bb.o
  x86_64-w64-mingw32-gcc -fPIC -shared -o libbb.so bb.o  -L /c/msys64/mingw=
64/lib/ -lglib-2.0
  C:/msys64/mingw64/bin/../lib/gcc/x86_64-w64-mingw32/10.1.0/../../../../x8=
6_64-w64-mingw32/bin/ld.exe: bb.o: in function `plugin_exit':
  D:/emu_devl/qemu_src/qemu-sr-dsp-a/qemu_tidsp_c3x/tests/plugin/bb.c:28: u=
ndefined reference to `qemu_plugin_outs'
  C:/msys64/mingw64/bin/../lib/gcc/x86_64-w64-mingw32/10.1.0/../../../../x8=
6_64-w64-mingw32/bin/ld.exe: D:/emu_devl/qemu_src/qemu-sr-dsp-a/qemu_tidsp_=
c3x/tests/plugin/bb.c:29: undefined reference to `__stack_chk_fail'
  C:/msys64/mingw64/bin/../lib/gcc/x86_64-w64-mingw32/10.1.0/../../../../x8=
6_64-w64-mingw32/bin/ld.exe: bb.o: in function `vcpu_tb_trans':
  D:/emu_devl/qemu_src/qemu-sr-dsp-a/qemu_tidsp_c3x/tests/plugin/bb.c:41: u=
ndefined reference to `qemu_plugin_tb_n_insns'
  C:/msys64/mingw64/bin/../lib/gcc/x86_64-w64-mingw32/10.1.0/../../../../x8=
6_64-w64-mingw32/bin/ld.exe: D:/emu_devl/qemu_src/qemu-sr-dsp-a/qemu_tidsp_=
c3x/tests/plugin/bb.c:44: undefined reference to `qemu_plugin_register_vcpu=
_tb_exec_inline'
  C:/msys64/mingw64/bin/../lib/gcc/x86_64-w64-mingw32/10.1.0/../../../../x8=
6_64-w64-mingw32/bin/ld.exe: D:/emu_devl/qemu_src/qemu-sr-dsp-a/qemu_tidsp_=
c3x/tests/plugin/bb.c:46: undefined reference to `qemu_plugin_register_vcpu=
_tb_exec_inline'
  C:/msys64/mingw64/bin/../lib/gcc/x86_64-w64-mingw32/10.1.0/../../../../x8=
6_64-w64-mingw32/bin/ld.exe: D:/emu_devl/qemu_src/qemu-sr-dsp-a/qemu_tidsp_=
c3x/tests/plugin/bb.c:49: undefined reference to `qemu_plugin_register_vcpu=
_tb_exec_cb'
  C:/msys64/mingw64/bin/../lib/gcc/x86_64-w64-mingw32/10.1.0/../../../../x8=
6_64-w64-mingw32/bin/ld.exe: bb.o: in function `qemu_plugin_install':
  D:/emu_devl/qemu_src/qemu-sr-dsp-a/qemu_tidsp_c3x/tests/plugin/bb.c:63: u=
ndefined reference to `qemu_plugin_register_vcpu_tb_trans_cb'
  C:/msys64/mingw64/bin/../lib/gcc/x86_64-w64-mingw32/10.1.0/../../../../x8=
6_64-w64-mingw32/bin/ld.exe: D:/emu_devl/qemu_src/qemu-sr-dsp-a/qemu_tidsp_=
c3x/tests/plugin/bb.c:64: undefined reference to `qemu_plugin_register_atex=
it_cb'
  C:/msys64/mingw64/bin/../lib/gcc/x86_64-w64-mingw32/10.1.0/../../../../x8=
6_64-w64-mingw32/bin/ld.exe: bb.o:bb.c:(.rdata$.refptr.__stack_chk_guard[.r=
efptr.__stack_chk_guard]+0x0): undefined reference to `__stack_chk_guard'
  collect2.exe: error: ld returned 1 exit status

     It looks like linking problem(fail to link functions defined in api.c,=
 core.c...), but I have no idea what goes wrong. If I mannualy add api.o, c=
ore.o in the compilation command, still get error like undefined reference =
to '__stack_chk_guard'. =

     My collegue can build 4.2.0  plugins on Ubuntu Linux without any probl=
em.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1885827/+subscriptions

