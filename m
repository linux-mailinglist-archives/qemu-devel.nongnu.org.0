Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBB064F19B
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 20:15:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6G3p-0005sz-Cb; Fri, 16 Dec 2022 14:07:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p6G3m-0005sE-EH
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 14:07:54 -0500
Received: from mout.gmx.net ([212.227.15.15])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p6G3k-0006VU-2J
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 14:07:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1671217661; bh=femJzT7zcPLf2Wj3S1y7f4w2ldHg5BfbVH5cYqLpyvo=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=AMSPq4h+HD9KEmtofEyK8EnBkz9ARYvbstBMWlqJwNcGXjq/h7asHLApFPL7Uf4q4
 yCNwE5bhoWEdMFhXNb+/Iex53T6jJOMd1aW29TD34q6Aj70mLkdCMnb+jcr00wtUVJ
 T4c6106kj+RxwhVwBrimj92jD6dKaYkseFNsiWzAhfh71/yYmU3dY2NE9lUdRVedbn
 1DxQIfYvCch4iOvs+3xJOi626CLAEgz4ehSHYo5Pc73rfhizYgzRCGxyJX27VI08jR
 fv2jx7V3psNlG6zol1zAHSP7UJOXX35RmZSvszWc3OkC2//g3j3WoygQtfNQTdLy4D
 u+YFQFHB20oXA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([92.116.155.237]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mulm5-1opHIs2zBr-00rlYL; Fri, 16
 Dec 2022 20:07:41 +0100
Date: Fri, 16 Dec 2022 20:07:39 +0100
From: Helge Deller <deller@gmx.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH] meson: Clean up some dependencies regarding qemu-system
Message-ID: <Y5zB+5t5K0AEj6Rn@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:5Xz0iRWYCmMJ2hRWlmM3M6gVoWOR4j5E4gVzLkZnybMWQseVDke
 u1BWRw/QhxnsUmvvc+ECEYrOrsOexfP3hbI5Rxv579BJeof7c22FNA69Sis9d4d39o82IFr
 QfuQAV9LV5UE/FOL1mYZUkxBmM4197QlWHH90cxLEzMZyRzwzmfGr8MtVkp3PxNovUykVnQ
 y2l9ERRMsAF+Bz1ix6FDA==
UI-OutboundReport: notjunk:1;M01:P0:w29gsSE7y00=;sx+BVMNd3uuvBrcfBQyG7nePlkt
 6joycMzWqLY5+oNV37LuT3f9DbPOHZzapLNoalf1lHtSJqoaHQxtkZQ57MhGYTjHBj8qTbnkq
 e8+/cqzEVZDj79R67nFBFKW5mwnJewpDAp68mwP48U9GJd02AdAPDmCNZEn/dIrUy7+6CMTpz
 GZgiATkYB+q2nOQt6vU5OprcFH9kTMBliK3LVZFAxNERjoCfIo5WUYyDccAuGR63nwCn7VMmO
 ba4UHwSEBl7JrI0jSYvG5k7UecSAdNSRQMncTR9dwVe/HMpz1YyI254cwQu6ZU7eoIGz1IEnN
 9fwzFv6LDaIkLqZq2UYcj8k6FfBKlyz3QWiTIK84UvOuEGQk2kBMPDrkzcIR63S0HrORApVCe
 pRTyxXeZUYr6ElYiA6k25q5/+uFkUrK/nVq9KKxoa5GEUFl16RllOEdIr+r0CyeYjGMCoqHBl
 +MEFSCIjxr+faoDNKH0XjnEhQLQA1lvHfdaE/sbNn4hxIpVeoNClBvt1EFQQ4yz6k9vC1p0FS
 psQW7e7RqOgSugIHw6I7TT1EUrY05Srku0iQ32hUz3HKA+q21m63FMa+5wwfK2mAwA74SBvqY
 r3I9At9hjHHbZkleFaE4vAFLnfIK0M5wm6NoYwWupv/BQlgQ/cYuV3umhK42ifG+z+OcqBEYn
 GA8etqX3KjxCAkeThbS9nzcoJM9veyrw2pV8IfZHaYMCrzqvL4v/K76gcodRv2G+ZHJv8oJer
 nYtpmmRJnC0bIgFaOLp4f5zqiAwo+W8Jvd4aFOiW0wGQca0rZUB0TfV7uOptmxerd4QP9qd3B
 r4ISsYzweXHVRTLY7DFkLRVXDBL8bb/ZLKeA+bVCMECwfDuoJ2MXJX279vs8VlscrNe1XiPy6
 rJYGte3N7+Egr8oinvVX/S1b6ZU2fMpHxB+1L0+tjcQ2dtNfeovmfMCggN3s6wG3A3N5dG9vg
 kt8E0d7Ze4LuqKmYL41nfQyJQts=
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=212.227.15.15; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Reduce amount of compiled code and installed binaries if just the qemu
utilities such as qemu-img, qemu-io and qemu-nbd have to be built.  This
helps to make those tools easier available on hosts where qemu-system or
qemu-user isn't supported.

Reason for this patch is that qemu fail to build on debian for some
seconday non-release architectures (e.g. hppa, sh4, ia64), as can be
seen here:
https://buildd.debian.org/status/package.php?p=3Dqemu&suite=3Dsid
This patch helps to clean up the build so that these tools
can be provided on those platforms in future.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/docs/meson.build b/docs/meson.build
index 9136fed3b7..cfbde168b7 100644
=2D-- a/docs/meson.build
+++ b/docs/meson.build
@@ -49,7 +49,7 @@ if build_docs
         'qemu-trace-stap.1': (stap.found() ? 'man1' : ''),
         'virtfs-proxy-helper.1': (have_virtfs_proxy_helper ? 'man1' : '')=
,
         'virtiofsd.1': (have_virtiofsd ? 'man1' : ''),
-        'qemu.1': 'man1',
+        'qemu.1': (have_system ? 'man1' : ''),
         'qemu-block-drivers.7': 'man7',
         'qemu-cpu-models.7': 'man7'
   }
diff --git a/meson.build b/meson.build
index 5c6b5a1c75..fe4c9c83bb 100644
=2D-- a/meson.build
+++ b/meson.build
@@ -3021,7 +3021,6 @@ subdir('util')
 subdir('qom')
 subdir('authz')
 subdir('crypto')
-subdir('ui')
 subdir('hw')
 subdir('gdbstub')

@@ -3060,9 +3059,10 @@ if have_system or have_user
                          arguments: ['@INPUT@', '@EXTRA_ARGS@', '-o', '@O=
UTPUT@'])
   subdir('libdecnumber')
   subdir('target')
+  subdir('ui')
+  subdir('audio')
 endif

-subdir('audio')
 subdir('io')
 subdir('chardev')
 subdir('fsdev')
@@ -3581,7 +3581,7 @@ subdir('qga')

 # Don't build qemu-keymap if xkbcommon is not explicitly enabled
 # when we don't build tools or system
-if xkbcommon.found()
+if xkbcommon.found() and have_system
   # used for the update-keymaps target, so include rules even if !have_to=
ols
   qemu_keymap =3D executable('qemu-keymap', files('qemu-keymap.c', 'ui/in=
put-keymap.c') + genh,
                            dependencies: [qemuutil, xkbcommon], install: =
have_tools)
@@ -3596,7 +3596,9 @@ if have_tools
                dependencies: [blockdev, qemuutil, gnutls, selinux],
                install: true)

-  subdir('storage-daemon')
+  if have_system
+    subdir('storage-daemon')
+  endif
   subdir('contrib/rdmacm-mux')
   subdir('contrib/elf2dmp')

@@ -3611,7 +3613,7 @@ if have_tools
     subdir('contrib/vhost-user-scsi')
   endif

-  if targetos =3D=3D 'linux'
+  if targetos =3D=3D 'linux' and have_system
     executable('qemu-bridge-helper', files('qemu-bridge-helper.c'),
                dependencies: [qemuutil, libcap_ng],
                install: true,
diff --git a/qapi/meson.build b/qapi/meson.build
index fbdb442fdf..4a499db441 100644
=2D-- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -51,12 +51,12 @@ qapi_all_modules =3D [
   'transaction',
   'virtio',
   'yank',
+  'qdev',
 ]
 if have_system
   qapi_all_modules +=3D [
     'acpi',
     'audio',
-    'qdev',
     'pci',
     'rdma',
     'rocker',
diff --git a/tests/meson.build b/tests/meson.build
index 8e318ec513..a63a7de9f0 100644
=2D-- a/tests/meson.build
+++ b/tests/meson.build
@@ -1,5 +1,7 @@
 subdir('bench')
-subdir('qemu-iotests')
+if have_system
+  subdir('qemu-iotests')
+endif

 test_qapi_outputs =3D [
   'qapi-builtin-types.c',
diff --git a/tools/meson.build b/tools/meson.build
index 10eb3a043f..740d572a94 100644
=2D-- a/tools/meson.build
+++ b/tools/meson.build
@@ -5,7 +5,7 @@ have_virtiofsd =3D get_option('virtiofsd') \
              error_message: 'virtiofsd requires libcap-ng-devel and secco=
mp-devel') \
     .require(have_vhost_user,
              error_message: 'virtiofsd needs vhost-user-support') \
-    .disable_auto_if(not have_tools and not have_system) \
+    .disable_auto_if(not have_system) \
     .allowed()

 if have_virtiofsd

