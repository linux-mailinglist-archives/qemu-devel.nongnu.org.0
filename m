Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60598617DF2
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 14:32:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqaIf-0004Pn-Kd; Thu, 03 Nov 2022 09:30:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oqaIS-0004Ie-3f
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 09:30:16 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oqaIN-0000WM-9A
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 09:30:14 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-333a4a5d495so14921007b3.10
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 06:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xqW41fN7eeP7yQIDysFsiWX9LddfjzEDm9fLNQ5AaxU=;
 b=MarPMW9YdZCsuFayE9j6VyCWmDXzoKwK3/JRXhYEUorAoCCkaVd4rNP0Pf3HyHRi4n
 0XzcxCiyziEw4izU5gLk9tCqBm8IUNCMCJsSLXAI9njgD41sOMS6P0BcpPaNj2wizVVc
 HJh0PCToBFVKWv4jzTBnWkBvgb+TcCKNsqaHwsV3YEeYBAsp+RVAxfWUnEF8olHgm1HU
 iTCSamdurAcKQyeRocI0clFxyg0Ds+FBd7xTqsYP6CsfF4PL4RkE7msY9YDw/tYFzier
 R5KPPoq0U3zyg9ztlcHDST6m+R7/+1lDG/NerAjCOiA7AOdsUvr/rKFg0uhrxBUcdsAb
 /c9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xqW41fN7eeP7yQIDysFsiWX9LddfjzEDm9fLNQ5AaxU=;
 b=NyGqF6c4jlo7jPD1AGK8W4OYO5slvvw1NKsuANereLb7Sh0UWt3re5X9OBpoMbl4Un
 P6GqXW5UhyBfbzFYiSuvRAUC17753GCG8Ly4FZ05JI/LaR1LwlbPtEEY1vLgh0vTNfI9
 k4gsE/cIfZKVRhrHDMiRNFzmCodsSfZKlMi4kjTtPJ5EZvboKoLJ6PjGE2bT3YaIGwe/
 jP6Ugl7hBHHUidmHDRS2bHJLaUXfkVcZdej/NNNs+/8CmS6VpTXHVeky3Ig0ltCwqzS1
 JsaABXZfoBuSUS214VZThmaOw9ynt0dNGBzAcVjOUJSdVeQ9QRONWhK6fy+IW4YCk8YO
 w8ag==
X-Gm-Message-State: ACrzQf19D8y7boxIR43xbQLkb7TJ8o2i8BPHgfNu8t5iG9DfKLWFHDbl
 Z5ISp+HHWRNRNsdKDD5Zbu0WXiqZZt+4uG/5eA4=
X-Google-Smtp-Source: AMsMyM5MMDGjimkMvPyezAq5bBmkjLE5rSIBTKUJruxkA5wXx2Wm9bJ6zypHMxy2mxfzgy4yWPZGvNxpG8OPBcX7gYQ=
X-Received: by 2002:a81:6d06:0:b0:36f:ce83:4f91 with SMTP id
 i6-20020a816d06000000b0036fce834f91mr29217977ywc.156.1667482208649; Thu, 03
 Nov 2022 06:30:08 -0700 (PDT)
MIME-Version: 1.0
References: <20221102160336.616599-1-mst@redhat.com> <Y2LJX2HHiHpiKzKd@fedora>
 <20221103081148-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221103081148-mutt-send-email-mst@kernel.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 3 Nov 2022 09:29:56 -0400
Message-ID: <CAJSP0QXvJwvO311ELJZBQZx-M3aKvRgEfk6PX7So8n9n0X3HhQ@mail.gmail.com>
Subject: Re: [PULL v2 00/82] pci,pc,virtio: features, tests, fixes, cleanups
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 3 Nov 2022 at 08:14, Michael S. Tsirkin <mst@redhat.com> wrote:
> On Wed, Nov 02, 2022 at 03:47:43PM -0400, Stefan Hajnoczi wrote:
> > On Wed, Nov 02, 2022 at 12:02:14PM -0400, Michael S. Tsirkin wrote:
> > > Changes from v1:
> > >
> > > Applied and squashed fixes by Igor, Lei He, Hesham Almatary for
> > > bugs that tripped up the pipeline.
> > > Updated expected files for core-count test.
> >
> > Several "make check" CI failures have occurred. They look like they are
> > related. Here is one (see the URLs at the bottom of this email for more
> > details):
> >
> > 17/106 ERROR:../tests/qtest/qos-test.c:191:subprocess_run_one_test: chi=
ld process (/arm/virt/virtio-mmio/virtio-bus/virtio-net-device/virtio-net/v=
irtio-net-tests/vhost-user/flags-mismatch/subprocess [8609]) failed unexpec=
tedly ERROR
> >  17/106 qemu:qtest+qtest-arm / qtest-arm/qos-test                     E=
RROR          31.44s   killed by signal 6 SIGABRT
> > >>> G_TEST_DBUS_DAEMON=3D/builds/qemu-project/qemu/tests/dbus-vmstate-d=
aemon.sh MALLOC_PERTURB_=3D49 QTEST_QEMU_IMG=3D./qemu-img QTEST_QEMU_BINARY=
=3D./qemu-system-arm QTEST_QEMU_STORAGE_DAEMON_BINARY=3D./storage-daemon/qe=
mu-storage-daemon /builds/qemu-project/qemu/build/tests/qtest/qos-test --ta=
p -k
> > =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95 =E2=9C=80  =E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95
> > stderr:
> > qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
> > qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument =
(22)
> > qemu-system-arm: Failed to set msg fds.
> > qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument =
(22)
> > qemu-system-arm: -chardev socket,id=3Dchr-reconnect,path=3D/tmp/vhost-t=
est-6PT2U1/reconnect.sock,server=3Don: info: QEMU waiting for connection on=
: disconnected:unix:/tmp/vhost-test-6PT2U1/reconnect.sock,server=3Don
> > qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
> > qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument =
(22)
> > qemu-system-arm: Failed to set msg fds.
> > qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument =
(22)
> > qemu-system-arm: -chardev socket,id=3Dchr-connect-fail,path=3D/tmp/vhos=
t-test-H8G7U1/connect-fail.sock,server=3Don: info: QEMU waiting for connect=
ion on: disconnected:unix:/tmp/vhost-test-H8G7U1/connect-fail.sock,server=
=3Don
> > qemu-system-arm: -netdev vhost-user,id=3Dhs0,chardev=3Dchr-connect-fail=
,vhostforce=3Don: Failed to read msg header. Read 0 instead of 12. Original=
 request 1.
> > qemu-system-arm: -netdev vhost-user,id=3Dhs0,chardev=3Dchr-connect-fail=
,vhostforce=3Don: vhost_backend_init failed: Protocol error
> > qemu-system-arm: -netdev vhost-user,id=3Dhs0,chardev=3Dchr-connect-fail=
,vhostforce=3Don: failed to init vhost_net for queue 0
> > qemu-system-arm: -netdev vhost-user,id=3Dhs0,chardev=3Dchr-connect-fail=
,vhostforce=3Don: info: QEMU waiting for connection on: disconnected:unix:/=
tmp/vhost-test-H8G7U1/connect-fail.sock,server=3Don
> > qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
> > qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument =
(22)
> > qemu-system-arm: Failed to set msg fds.
> > qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument =
(22)
> > qemu-system-arm: -chardev socket,id=3Dchr-flags-mismatch,path=3D/tmp/vh=
ost-test-94UYU1/flags-mismatch.sock,server=3Don: info: QEMU waiting for con=
nection on: disconnected:unix:/tmp/vhost-test-94UYU1/flags-mismatch.sock,se=
rver=3Don
> > qemu-system-arm: Failed to write msg. Wrote -1 instead of 52.
> > qemu-system-arm: vhost_set_mem_table failed: Invalid argument (22)
> > qemu-system-arm: Failed to set msg fds.
> > qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument =
(22)
> > UndefinedBehaviorSanitizer:DEADLYSIGNAL
> > =3D=3D8618=3D=3DERROR: UndefinedBehaviorSanitizer: SEGV on unknown addr=
ess 0x000000000000 (pc 0x55e34deccab0 bp 0x000000000000 sp 0x7ffc94894710 T=
8618)
> > =3D=3D8618=3D=3DThe signal is caused by a READ memory access.
> > =3D=3D8618=3D=3DHint: address points to the zero page.
> >     #0 0x55e34deccab0 in ldl_he_p /builds/qemu-project/qemu/include/qem=
u/bswap.h:301:5
> >     #1 0x55e34deccab0 in ldn_he_p /builds/qemu-project/qemu/include/qem=
u/bswap.h:440:1
> >     #2 0x55e34deccab0 in flatview_write_continue /builds/qemu-project/q=
emu/build/../softmmu/physmem.c:2824:19
> >     #3 0x55e34dec9f21 in flatview_write /builds/qemu-project/qemu/build=
/../softmmu/physmem.c:2867:12
> >     #4 0x55e34dec9f21 in address_space_write /builds/qemu-project/qemu/=
build/../softmmu/physmem.c:2963:18
> >     #5 0x55e34decace7 in address_space_unmap /builds/qemu-project/qemu/=
build/../softmmu/physmem.c:3306:9
> >     #6 0x55e34de6d4ec in vhost_memory_unmap /builds/qemu-project/qemu/b=
uild/../hw/virtio/vhost.c:342:9
> >     #7 0x55e34de6d4ec in vhost_virtqueue_stop /builds/qemu-project/qemu=
/build/../hw/virtio/vhost.c:1242:5
> >     #8 0x55e34de72904 in vhost_dev_stop /builds/qemu-project/qemu/build=
/../hw/virtio/vhost.c:1882:9
> >     #9 0x55e34d890514 in vhost_net_stop_one /builds/qemu-project/qemu/b=
uild/../hw/net/vhost_net.c:331:5
> >     #10 0x55e34d88fef6 in vhost_net_start /builds/qemu-project/qemu/bui=
ld/../hw/net/vhost_net.c:404:13
> >     #11 0x55e34de0bec6 in virtio_net_vhost_status /builds/qemu-project/=
qemu/build/../hw/net/virtio-net.c:307:13
> >     #12 0x55e34de0bec6 in virtio_net_set_status /builds/qemu-project/qe=
mu/build/../hw/net/virtio-net.c:388:5
> >     #13 0x55e34de5e409 in virtio_set_status /builds/qemu-project/qemu/b=
uild/../hw/virtio/virtio.c:2442:9
> >     #14 0x55e34da22a50 in virtio_mmio_write /builds/qemu-project/qemu/b=
uild/../hw/virtio/virtio-mmio.c:428:9
> >     #15 0x55e34deb44a6 in memory_region_write_accessor /builds/qemu-pro=
ject/qemu/build/../softmmu/memory.c:493:5
> >     #16 0x55e34deb428a in access_with_adjusted_size /builds/qemu-projec=
t/qemu/build/../softmmu/memory.c:555:18
> >     #17 0x55e34deb402d in memory_region_dispatch_write /builds/qemu-pro=
ject/qemu/build/../softmmu/memory.c
> >     #18 0x55e34deccaf1 in flatview_write_continue /builds/qemu-project/=
qemu/build/../softmmu/physmem.c:2825:23
> >     #19 0x55e34dec9f21 in flatview_write /builds/qemu-project/qemu/buil=
d/../softmmu/physmem.c:2867:12
> >     #20 0x55e34dec9f21 in address_space_write /builds/qemu-project/qemu=
/build/../softmmu/physmem.c:2963:18
> >     #21 0x55e34ded0bf6 in qtest_process_command /builds/qemu-project/qe=
mu/build/../softmmu/qtest.c
> >     #22 0x55e34ded008d in qtest_process_inbuf /builds/qemu-project/qemu=
/build/../softmmu/qtest.c:796:9
> >     #23 0x55e34e109b02 in tcp_chr_read /builds/qemu-project/qemu/build/=
../chardev/char-socket.c:508:13
> >     #24 0x7fc6c665d0ae in g_main_context_dispatch (/lib64/libglib-2.0.s=
o.0+0x550ae)
> >     #25 0x55e34e1fc1bc in glib_pollfds_poll /builds/qemu-project/qemu/b=
uild/../util/main-loop.c:297:9
> >     #26 0x55e34e1fc1bc in os_host_main_loop_wait /builds/qemu-project/q=
emu/build/../util/main-loop.c:320:5
> >     #27 0x55e34e1fc1bc in main_loop_wait /builds/qemu-project/qemu/buil=
d/../util/main-loop.c:596:11
> >     #28 0x55e34da52de6 in qemu_main_loop /builds/qemu-project/qemu/buil=
d/../softmmu/runstate.c:739:9
> >     #29 0x55e34d60a4f5 in qemu_default_main /builds/qemu-project/qemu/b=
uild/../softmmu/main.c:37:14
> >     #30 0x7fc6c43a5eaf in __libc_start_call_main (/lib64/libc.so.6+0x3f=
eaf)
> >     #31 0x7fc6c43a5f5f in __libc_start_main@GLIBC_2.2.5 (/lib64/libc.so=
.6+0x3ff5f)
> >     #32 0x55e34d5e1094 in _start (/builds/qemu-project/qemu/build/qemu-=
system-arm+0xc17094)
> > UndefinedBehaviorSanitizer can not provide additional info.
> > SUMMARY: UndefinedBehaviorSanitizer: SEGV /builds/qemu-project/qemu/inc=
lude/qemu/bswap.h:301:5 in ldl_he_p
> > =3D=3D8618=3D=3DABORTING
> > Broken pipe
> > ../tests/qtest/libqtest.c:179: kill_qemu() tried to terminate QEMU proc=
ess but encountered exit status 1 (expected 0)
> > **
> > ERROR:../tests/qtest/qos-test.c:191:subprocess_run_one_test: child proc=
ess (/arm/virt/virtio-mmio/virtio-bus/virtio-net-device/virtio-net/virtio-n=
et-tests/vhost-user/flags-mismatch/subprocess [8609]) failed unexpectedly
> > (test program exited with status code -6)
> >
> > https://gitlab.com/qemu-project/qemu/-/jobs/3265209698
> > https://gitlab.com/qemu-project/qemu/-/pipelines/683909108
> >
> > Stefan
>
>
> Ugh. I need to build with ubsan to reproduce yes? didn't trigger for me
> I am wondering how to bisect on gitlab.

I searched for "clang-system" (the name of the job) in .gitlab-ci.d to
get the job commands. The GitLab job output also contains details of
the commands that were run (unfortunately it doesn't expand
environment variables so some aspects are not visible from the GitLab
output).

That led to the following local command-line:

$ git checkout 645ec851
$ ./configure --enable-werror --disable-docs --target-list=3Darm-softmmu
--cc=3Dclang --cxx=3Dclang++ --extra-cflags=3D-fsanitize=3Dundefined
--extra-cflags=3D-fno-sanitize-recover=3Dundefined && make check-qtest

It reproduces locally on my Fedora 36 machine.

Stefan

