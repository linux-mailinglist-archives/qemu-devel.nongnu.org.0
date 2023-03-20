Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CE06C13CE
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 14:43:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peFmy-0007Ky-3Y; Mon, 20 Mar 2023 09:43:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1peFmw-0007Jx-3M
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:43:02 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1peFmu-0001zL-3s
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:43:01 -0400
Received: by mail-pf1-x42b.google.com with SMTP id cu12so1704629pfb.13
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 06:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679319778;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qw21ehB7iND/HRGsPOul8oPFAyKjVl4C1k8qagTKBm8=;
 b=JzC2q0rp8n0qc2LVXGnAdrd1V9UmmxrI/mi00SWX2LeItoHWUEh3gwyYaIFiX1wGPr
 9tC6AYc5Npi/A5gIkZOk1e9QMBHM6kwMHOiMGw2W2vzIRdhOtPLwylN3Tbmdaf2GwOjY
 4U0X4bgh3cB5p8dwliCgdPTr99KXcZaxwxqIATBjLYycyR0/z75Nky82UrbxQAYJU+Sc
 nqVIZBadyb48EZL2zh4SU+7nEWLWDi5AJCU3epaZa93K8oR1S4hIWCCRm8bXuLpmImSj
 7+R/lZ08bOiAHI22JmKPF0D9u3FGhxHNmNJvzXx1XR45FUN6R/+l+dA1RQirQc30j/DD
 ZMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679319778;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qw21ehB7iND/HRGsPOul8oPFAyKjVl4C1k8qagTKBm8=;
 b=fsa6EslMGRliGeEm9ydUqW8ac8h6bbDRaVjcpuVryTAyrctNRh14f/myCaMDk9VuQU
 f1oDt7YzdQvEbAaVzp55bo9tDAH9ZdE03huFRsol+T7ILRdv+dk3IrxOr1lcaiUv+JKM
 cWcbxLkpdGoBStE/aeZKfAViEos6KVHuXNLpcRyzWepeMa92JWGSWt1Pe5qKjWLfIQ7C
 +Kpk0NLSJO7URuwzWEO+fe8r+Kbf4tPIBx0GO/FstBme7lGArqofmlgzUYziqxIZBM7U
 rHZnSUOq5tC3kS68WzdNCmmW9jN/P0XsHwPW5tAVqMWKS33Fu9ffa81W4cyiRIU0f8GN
 DZ+A==
X-Gm-Message-State: AO0yUKXlPc4TXJv/XllsDwAkEIr2mUyGLIl+DSwnzCSYuIx4yGD263CR
 vVoWuK0kCMFuyrm6XDILCcZyjbQtVypcAhkzn+BmUmn94L3HZtjLRUM=
X-Google-Smtp-Source: AK7set+8rDutZQrFD/kuON/r/2/w6BtbZUo2yo45o4V8E2+nDpu7ZfwOQi4m7t0Y6duFBd5S2OUj2d9t+1NlLGF9u1g=
X-Received: by 2002:a05:6a00:139f:b0:625:4ff8:3505 with SMTP id
 t31-20020a056a00139f00b006254ff83505mr7417514pfg.1.1679319778270; Mon, 20 Mar
 2023 06:42:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230318114644.1340899-1-alex.bennee@linaro.org>
In-Reply-To: <20230318114644.1340899-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Mar 2023 13:42:46 +0000
Message-ID: <CAFEAcA-f=tDQqmisqaJQxwYjgYOv+1XbCUDcaZkH_Jikt1iYNg@mail.gmail.com>
Subject: Re: [PULL 00/31] various fixes (testing, plugins, gitdm)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Sat, 18 Mar 2023 at 11:46, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The following changes since commit 74c581b6452394e591f13beba9fea2ec0688e2=
f5:
>
>   Merge tag 'trivial-branch-for-8.0-pull-request' of https://gitlab.com/l=
aurent_vivier/qemu into staging (2023-03-17 14:22:01 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stsquad/qemu.git tags/pull-for-8.0-170323-4
>
> for you to fetch changes up to 4f2c431acd43d0aa505494229d05fa343762f272:
>
>   qtests: avoid printing comments before g_test_init() (2023-03-17
>   17:50:19 +0000)
>
> You can see my CI run on the branch here:
>
>   https://gitlab.com/stsquad/qemu/-/pipelines/810271620
>
> The failures:
>
>   FreeBSD's time out on a migration test
>   Centos8 Stream because my private runner needs more disk space
>
> ----------------------------------------------------------------
> Misc fixes for 8.0 (testing, plugins, gitdm)
>
>   - update Alpine image used for testing images
>   - include libslirp in custom runner build env
>   - update gitlab-runner recipe for CentOS
>   - update docker calls for better caching behaviour
>   - document some plugin callbacks
>   - don't use tags to define drives for lkft baseline tests
>   - fix missing clear of plugin_mem_cbs
>   - fix iotests to report individual results
>   - update the gitdm metadata for contributors
>   - avoid printing comments before g_test_init()
>

This seems to consistently fail an avocado test on the
centos-stream-8-x86_64 job:
(21/51) tests/avocado/multiprocess.py:Multiprocess.test_multiprocess_x86_64=
:
ERROR: ConnectError: Failed to establish session: EOFError\n Exit
code: 1\n Command: ./qemu-system-x86_64 -display none -vga none
-chardev socket,id=3Dmon,fd=3D17 -mon chardev=3Dmon,mode=3Dcontrol -machine
x-remote -nodefaults -device lsi53c895a,id=3Dlsi1 -object x-remote-o...
(0.10 s)

https://gitlab.com/qemu-project/qemu/-/jobs/3962028269
https://gitlab.com/qemu-project/qemu/-/jobs/3965134190



The iotests also don't seem to pass on the OpenBSD VM after this;
which test fails varies from run to run but the common factor
is a complaint about running out of disk space:



719/774 qemu:block / io-qcow2-177
           ERROR           4.21s   exit status 1
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95 =E2=9C=80  =E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95
stderr:
--- /home/qemu/qemu-test.8HLwgo/src/tests/qemu-iotests/177.out
+++ /home/qemu/qemu-test.8HLwgo/build/scratch/qcow2-file-177/177.out.bad
@@ -5,8 +5,7 @@
 wrote 134217728/134217728 bytes at offset 0
 128 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134217728
backing_file=3DTEST_DIR/t.IMGFMT.base backing_fmt=3DIMGFMT
-wrote 134217728/134217728 bytes at offset 0
-128 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+write failed: No space left on device

 =3D=3D constrained alignment and max-transfer =3D=3D
 wrote 131072/131072 bytes at offset 1000
@@ -27,22 +26,27 @@
 30 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)


(etc)

and in another run

stderr:
--- /home/qemu/qemu-test.ZfU510/src/tests/qemu-iotests/040.out
+++ /home/qemu/qemu-test.ZfU510/build/scratch/qcow2-file-040/040.out.bad
@@ -1,5 +1,54 @@
-.................................................................
+................................EE...............................
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+ERROR: testIntermediateReadErrorReport (__main__.TestErrorHandling)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/home/qemu/qemu-test.ZfU510/src/python/qemu/machine/machine.py",
line 433, in launch
+    self._launch()
+  File "/home/qemu/qemu-test.ZfU510/src/python/qemu/machine/machine.py",
line 460, in _launch
+    self._pre_launch()
+  File "/home/qemu/qemu-test.ZfU510/src/tests/qemu-iotests/iotests.py",
line 837, in _pre_launch
+    super()._pre_launch()
+  File "/home/qemu/qemu-test.ZfU510/src/python/qemu/machine/qtest.py",
line 142, in _pre_launch
+    super()._pre_launch()
+  File "/home/qemu/qemu-test.ZfU510/src/python/qemu/machine/machine.py",
line 358, in _pre_launch
+    self._qemu_log_path =3D os.path.join(self.log_dir, self._name + ".log"=
)
+  File "/home/qemu/qemu-test.ZfU510/src/python/qemu/machine/machine.py",
line 905, in log_dir
+    return self.temp_dir
+  File "/home/qemu/qemu-test.ZfU510/src/python/qemu/machine/machine.py",
line 886, in temp_dir
+    self._temp_dir =3D tempfile.mkdtemp(prefix=3D"qemu-machine-",
+  File "/usr/local/lib/python3.9/tempfile.py", line 363, in mkdtemp
+    _os.mkdir(file, 0o700)
+OSError: [Errno 28] No space left on device:
'/home/qemu/qemu-test.ZfU510/build/scratch/qcow2-file-040/qemu-machine-g_v0=
pby3'
+
+The above exception was the direct cause of the following exception:
+
+Traceback (most recent call last):
+  File "/home/qemu/qemu-test.ZfU510/src/tests/qemu-iotests/040", line
472, in setUp
+    self.vm.launch()
+  File "/home/qemu/qemu-test.ZfU510/src/python/qemu/machine/machine.py",
line 446, in launch
+    raise VMLaunchFailure(
+qemu.machine.machine.VMLaunchFailure: OSError: [Errno 28] No space
left on device:
'/home/qemu/qemu-test.ZfU510/build/scratch/qcow2-file-040/qemu-machine-g_v0=
pby3'
+       Command:
+       Output: None
+

The host machine (hackbox) doesn't seem to have disk space issues
so presumably the iotests want to use too much disk space for
whatever the image size is that the tests/vm infrastructure
creates ?

thanks
-- PMM

