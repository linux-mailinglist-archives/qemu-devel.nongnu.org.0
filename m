Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D1230FD4E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 20:53:10 +0100 (CET)
Received: from localhost ([::1]:57672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7kgf-0000N8-UU
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 14:53:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7kcM-0004GA-SY
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 14:48:43 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:33220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7kc9-0001De-3B
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 14:48:37 -0500
Received: by mail-ej1-x62e.google.com with SMTP id sa23so7625262ejb.0
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 11:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qoylg8djR6fUTmvBxblfeYi279JpJ1UxAHWQm9aoB3g=;
 b=Za+POu3+tvLBtET6YZYaFx8YDyefq0wm9vkD/CxSSV9OqvzZJT8/6wVg8lpe5vgCVc
 hHIF9aFrXlaS8upBcpRCFqxQVpTpJMp8I+aL9FWgMDk5pbdN1as5HNuKWHU83WVq8W8z
 VTxiyAeKfMXBYmFbrqfJD+FItyj/Tra1fzngoC92dNOsEZMGxfN/k/4gHkFaz2GjWGA1
 hq0V4Z9GPzjqlwHaoPxh7G9zWyJ9mtyBWXHW8t8R74hBKBP1/uj6p25zKfbCaK0bKWLW
 XZ18mqsQT4NiLua0eVu8AiJRwWkI/1dQmz8O2q7z8b1rd5FSpQj8effQunDhoxQz+PWZ
 6geg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qoylg8djR6fUTmvBxblfeYi279JpJ1UxAHWQm9aoB3g=;
 b=eDKFgYFkOjwK7U2nx3KEIuQjd9OwYGMS0L5fwPUWXF63eQms4K7lqrKG3FfUIe1JmY
 aHznVguVefr33NpTjyFA6DcNUcvOKmK/rmH3y8pd9gg32jUaRukpKN9s/nIcnBILW0m4
 qBRcT9KlIwtG46zNqOalQtGS2t5z42bDvrT9q9edYHf63mD7AXdh6AXTCWNcK9go7C8t
 tj//KZuj752rlxgzgtdVP0t7iEtyvwLXUjUds5c2FNnJTitgtIkoBlawQSFqsZ5q9bpn
 nGLjxzSLFuEDSY9P+YRcVXwycApAZIbOZmtGISaVglrvwQO8Bd/9KjuVj7hjuvEq2pan
 kTBQ==
X-Gm-Message-State: AOAM530N6gur9iP3XnGgxwvGPyg4MgdtDzdABjj7VzgztWhaeGe+f6im
 aEviuq9QVfMZ7s4ZdBtGtXPo93E5m2hwj5dXGfkOlw==
X-Google-Smtp-Source: ABdhPJzXgYVnGKHNBSUX7XNBKiMbmXIT/68/G1O3HwMLsxZRBZX/6vlhroahxGjO761wO6EsGOiZTY3QvfvkMAIRCHk=
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr727037ejd.250.1612468104442; 
 Thu, 04 Feb 2021 11:48:24 -0800 (PST)
MIME-Version: 1.0
References: <20210204163959.377618-1-dgilbert@redhat.com>
In-Reply-To: <20210204163959.377618-1-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Feb 2021 19:48:13 +0000
Message-ID: <CAFEAcA--Orfsp_V6PDMW4GcKsZYBJ7rW4V4QsU+ia6BUVdXXug@mail.gmail.com>
Subject: Re: [PULL 00/27] migration queue
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: gaojinhao@huawei.com, "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 andrey.gruzdev@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 4 Feb 2021 at 17:16, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> The following changes since commit 1ba089f2255bfdb071be3ce6ac6c3069e8012179:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-qmp-2021-02-04' into staging (2021-02-04 14:15:35 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/dagrh/qemu.git tags/pull-migration-20210204a
>
> for you to fetch changes up to ef74d46576a9e5aff96f285b74150f341a525688:
>
>   migration: introduce snapshot-{save, load, delete} QMP commands (2021-02-04 16:29:03 +0000)
>
> ----------------------------------------------------------------
> Migration pull 2020-02-04
>
>  New snapshot features:
>    a) Andrey's RAM snapshot feature using userfault-wp
>    b) Dan's native-QMP snapshots
>
> Cleanups:
>    c) Jinhao's memory leeak fixes
>    d) Wainer's maybe unitialized fix
>    e) Markus's parameter fixes
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Fails iotest 267 on ppc64 host:
  TEST   iotest-qcow2: 267 [fail]
QEMU          --
"/home/pm215/qemu/build/all/tests/qemu-iotests/../../qemu-system-ppc64"
-nodefaults -display none -accel q
test
QEMU_IMG      -- "/home/pm215/qemu/build/all/tests/qemu-iotests/../../qemu-img"
QEMU_IO       --
"/home/pm215/qemu/build/all/tests/qemu-iotests/../../qemu-io" --cache
writeback --aio threads -f qcow2
QEMU_NBD      -- "/home/pm215/qemu/build/all/tests/qemu-iotests/../../qemu-nbd"
IMGFMT        -- qcow2
IMGPROTO      -- file
PLATFORM      -- Linux/ppc64 gcc1-power7.osuosl.org 3.10.0-862.14.4.el7.ppc64
TEST_DIR      -- /home/pm215/qemu/build/all/tests/qemu-iotests/scratch
SOCK_DIR      -- /tmp/tmpea7m6_b4
SOCKET_SCM_HELPER --
/home/pm215/qemu/build/all/tests/qemu-iotests/socket_scm_helper
--- /home/pm215/qemu/tests/qemu-iotests/267.out
+++ 267.out.bad
@@ -36,7 +36,9 @@
 ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
 --        snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000
 (qemu) loadvm snap0
-(qemu) quit
+./common.rc: line 163: 24600 Segmentation fault      ( if [ -n
"${QEMU_NEED_PID}" ]; then
+    echo $BASHPID > "${QEMU_TEST_DIR}/qemu-${_QEMU_HANDLE}.pid";
+fi; VALGRIND_QEMU="${VALGRIND_QEMU_VM}" _qemu_proc_exec
"${VALGRIND_LOGFILE}" "$QEMU_PROG" $QEMU_OPTIONS "$@" )

 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728
 Testing: -drive driver=IMGFMT,file=TEST_DIR/t.IMGFMT,if=none -device
virtio-blk,drive=none0
@@ -47,7 +49,9 @@
 ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
 --        snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000
 (qemu) loadvm snap0
-(qemu) quit
+./common.rc: line 163: 24653 Segmentation fault      ( if [ -n
"${QEMU_NEED_PID}" ]; then
+    echo $BASHPID > "${QEMU_TEST_DIR}/qemu-${_QEMU_HANDLE}.pid";
+fi; VALGRIND_QEMU="${VALGRIND_QEMU_VM}" _qemu_proc_exec
"${VALGRIND_LOGFILE}" "$QEMU_PROG" $QEMU_OPTIONS "$@" )


 === -drive if=virtio ===
@@ -72,7 +76,9 @@
 ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
 --        snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000
 (qemu) loadvm snap0
-(qemu) quit
+./common.rc: line 163: 24760 Segmentation fault      ( if [ -n
"${QEMU_NEED_PID}" ]; then
+    echo $BASHPID > "${QEMU_TEST_DIR}/qemu-${_QEMU_HANDLE}.pid";
+fi; VALGRIND_QEMU="${VALGRIND_QEMU_VM}" _qemu_proc_exec
"${VALGRIND_LOGFILE}" "$QEMU_PROG" $QEMU_OPTIONS "$@" )


 === Simple -blockdev ===
@@ -97,7 +103,9 @@
 ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
 --        snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000
 (qemu) loadvm snap0
-(qemu) quit
+./common.rc: line 163: 24866 Segmentation fault      ( if [ -n
"${QEMU_NEED_PID}" ]; then
+    echo $BASHPID > "${QEMU_TEST_DIR}/qemu-${_QEMU_HANDLE}.pid";
+fi; VALGRIND_QEMU="${VALGRIND_QEMU_VM}" _qemu_proc_exec
"${VALGRIND_LOGFILE}" "$QEMU_PROG" $QEMU_OPTIONS "$@" )

 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728
 Testing: -blockdev
driver=file,filename=TEST_DIR/t.IMGFMT,node-name=file -blockdev
driver=raw,file=file,node-name=raw -blockdev
driver=IMGFMT,file=raw,node-name=fmt
@@ -108,7 +116,9 @@
 ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
 --        snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000
 (qemu) loadvm snap0
-(qemu) quit
+./common.rc: line 163: 24919 Segmentation fault      ( if [ -n
"${QEMU_NEED_PID}" ]; then
+    echo $BASHPID > "${QEMU_TEST_DIR}/qemu-${_QEMU_HANDLE}.pid";
+fi; VALGRIND_QEMU="${VALGRIND_QEMU_VM}" _qemu_proc_exec
"${VALGRIND_LOGFILE}" "$QEMU_PROG" $QEMU_OPTIONS "$@" )


 === -blockdev with a filter on top ===
@@ -122,7 +132,9 @@
 ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
 --        snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000
 (qemu) loadvm snap0
-(qemu) quit
+./common.rc: line 163: 24972 Segmentation fault      ( if [ -n
"${QEMU_NEED_PID}" ]; then
+    echo $BASHPID > "${QEMU_TEST_DIR}/qemu-${_QEMU_HANDLE}.pid";
+fi; VALGRIND_QEMU="${VALGRIND_QEMU_VM}" _qemu_proc_exec
"${VALGRIND_LOGFILE}" "$QEMU_PROG" $QEMU_OPTIONS "$@" )


 === -blockdev with a backing file ===
@@ -137,7 +149,9 @@
 ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
 --        snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000
 (qemu) loadvm snap0
-(qemu) quit
+./common.rc: line 163: 25056 Segmentation fault      ( if [ -n
"${QEMU_NEED_PID}" ]; then
+    echo $BASHPID > "${QEMU_TEST_DIR}/qemu-${_QEMU_HANDLE}.pid";
+fi; VALGRIND_QEMU="${VALGRIND_QEMU_VM}" _qemu_proc_exec
"${VALGRIND_LOGFILE}" "$QEMU_PROG" $QEMU_OPTIONS "$@" )

 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728
backing_file=TEST_DIR/t.IMGFMT.base backing_fmt=IMGFMT
 Testing: -blockdev
driver=file,filename=TEST_DIR/t.IMGFMT.base,node-name=backing-file
-blockdev driver=IMGFMT,file=backing-file,node-name=backing-fmt
-blockdev driver=file,filename=TEST_DIR/t.IMGFMT,node-name=file
-blockdev driver=IMGFMT,file=file,backing=backing-fmt,node-name=fmt
@@ -148,7 +162,9 @@
 ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
 --        snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000
 (qemu) loadvm snap0
-(qemu) quit
+./common.rc: line 163: 25109 Segmentation fault      ( if [ -n
"${QEMU_NEED_PID}" ]; then
+    echo $BASHPID > "${QEMU_TEST_DIR}/qemu-${_QEMU_HANDLE}.pid";
+fi; VALGRIND_QEMU="${VALGRIND_QEMU_VM}" _qemu_proc_exec
"${VALGRIND_LOGFILE}" "$QEMU_PROG" $QEMU_OPTIONS "$@" )

 Internal snapshots on overlay:
 Snapshot list:
@@ -169,7 +185,9 @@
 ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
 --        snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000
 (qemu) loadvm snap0
-(qemu) quit
+./common.rc: line 163: 25179 Segmentation fault      ( if [ -n
"${QEMU_NEED_PID}" ]; then
+    echo $BASHPID > "${QEMU_TEST_DIR}/qemu-${_QEMU_HANDLE}.pid";
+fi; VALGRIND_QEMU="${VALGRIND_QEMU_VM}" _qemu_proc_exec
"${VALGRIND_LOGFILE}" "$QEMU_PROG" $QEMU_OPTIONS "$@" )

 Internal snapshots on overlay:
 Snapshot list:
  TEST   iotest-qcow2: 268


thanks
-- PMM

