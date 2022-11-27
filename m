Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B893A639C36
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Nov 2022 19:06:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozM23-0001wF-D6; Sun, 27 Nov 2022 13:05:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ozM1K-0001mh-An
 for qemu-devel@nongnu.org; Sun, 27 Nov 2022 13:04:50 -0500
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ozM1H-0006fL-Th
 for qemu-devel@nongnu.org; Sun, 27 Nov 2022 13:04:49 -0500
Received: by mail-yb1-xb33.google.com with SMTP id d128so10769893ybf.10
 for <qemu-devel@nongnu.org>; Sun, 27 Nov 2022 10:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6jfe3FkamBlixpwwoSUKF+1KnTHqy1TW6qfXVDMRbI8=;
 b=PRvdG+iun1vnhJFE5GQaB/erYbFYqDo/AQ6Tn0JE5g4bAIJLCYuEy4hE4F9eSXA6fA
 xYYRxyTsIcffAQU7yQ0Cml3944r6vV/FqZAB+NHsDCv9H15ZRr0/PSAK9UXYM/DZHaK9
 +QLcmK9ycEQpBfN+R1Z3Z1eauIjrvbv6VlAjv6xOaafPYxayh2zfun8JUV62+2XRTiQ1
 ZXXsZuZmCPucLUE7WwWivXLRpGOfjmiKCEQ688zWPQf2V3DLoWc1oNrgFI213kuU08Xg
 ZHhMGOTy8nHm0KG/wne6utQXRAXdhkUds9ivVR3yX041WId4IUxd5jajONULNvBO8vNj
 nnlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6jfe3FkamBlixpwwoSUKF+1KnTHqy1TW6qfXVDMRbI8=;
 b=4u0VdaS+HPM0/l4PD1PKDXbB/rfyzzP908Ml79oH2Z86o2FFfiQIm3GefiOQoOuEx7
 mOAb4fZZZe9nfV9HYwJlnYId6DMLt4pU2rmTv6jTte1w0EtlBh7vZq9MxcPmwgrZJPtV
 i9yR41kV+Ys/vi9iKZiq8dxj0TAdfujPrpzCdCi2FlI2OljX2XwIzK0nR5fxvpS4DiQ2
 Ygys5V7ahnHsZbOfEwXuFvq7OrE5DZYyYYqxBoZQJzC1zh1lf0KVZU80CzDPkuodr3IP
 v8p2DIYKZgFCJWvxKwrylbt/XLnpqF4fGZSgqOGypN5VAxqCHRvqQkm9rvLFQkoX6Mwf
 k40A==
X-Gm-Message-State: ANoB5pkqOXW9CXcnO9XH+fXd1qfst83hk6ZglcdNGXn9hfKuNl+X122z
 ZWU5IIgWxaSqIFsD8C3glO3J4EFVXs4fdOjIi8w=
X-Google-Smtp-Source: AA0mqf6p6KWMX2wtUSN0AK3OKbo+ji1fhS9HRiPUavDFW0liow76n/1vgdl8vz0dnBmcKL/U7Yq4pz2TRxUzs3X0dzg=
X-Received: by 2002:a25:32d3:0:b0:6f3:3829:22ff with SMTP id
 y202-20020a2532d3000000b006f3382922ffmr10796724yby.366.1669572286103; Sun, 27
 Nov 2022 10:04:46 -0800 (PST)
MIME-Version: 1.0
References: <20221125173043.1998075-1-alex.bennee@linaro.org>
 <87lenyajba.fsf@linaro.org> <87fse63v9t.fsf@linaro.org>
 <CAJSP0QXaRrM3NGttNytsOZigF-SwiX4_H-j_6KHxS9VjOrPFkg@mail.gmail.com>
 <87bkot4x4l.fsf@linaro.org>
In-Reply-To: <87bkot4x4l.fsf@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Sun, 27 Nov 2022 13:04:34 -0500
Message-ID: <CAJSP0QVXjzbRNrwSxUZ79msmS-LxU6ohXqg0fREw8m6JhspqkQ@mail.gmail.com>
Subject: Re: [PATCH for 7.2-rc? v2 0/5] continuing efforts to fix vhost-user
 issues
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, slp@redhat.com, mst@redhat.com, 
 marcandre.lureau@redhat.com, stefanha@redhat.com, mathieu.poirier@linaro.org, 
 viresh.kumar@linaro.org, sgarzare@redhat.com, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb33.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, 26 Nov 2022 at 09:18, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Stefan Hajnoczi <stefanha@gmail.com> writes:
>
> > On Sat, 26 Nov 2022 at 04:45, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> >>
> >>
> >> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
> >>
> >> > Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
> >> >
> >> >> Hi,
> >> >>
> >> > <snip>
> >> >> I can replicate some of the other failures I've been seeing in CI b=
y
> >> >> running:
> >> >>
> >> >>   ../../meson/meson.py test --repeat 10 --print-errorlogs qtest-arm=
/qos-test
> >> >>
> >> >> however this seems to run everything in parallel and maybe is bette=
r
> >> >> at exposing race conditions. Perhaps the CI system makes those race=
s
> >> >> easier to hit? Unfortunately I've not been able to figure out exact=
ly
> >> >> how things go wrong in the failure case.
> >> >>
> >> > <snip>
> >> >
> >> > There is a circular call - we are in vu_gpio_stop which triggers a w=
rite
> >> > to vhost-user which allows us to catch a disconnect event:
> >> >
> >> >   #0 vhost_dev_is_started (hdev=3D0x557adf80d878) at
> >> > /home/alex/lsrc/qemu.git/include/hw/virtio/vhost.h:199
> >> >   #1  0x0000557adbe0518a in vu_gpio_stop (vdev=3D0x557adf80d640) at =
../../hw/virtio/vhost-user-gpio.c:138
> >> >   #2 0x0000557adbe04d56 in vu_gpio_disconnect (dev=3D0x557adf80d640)
> >> > at ../../hw/virtio/vhost-user-gpio.c:255
> >> >   #3 0x0000557adbe049bb in vu_gpio_event (opaque=3D0x557adf80d640,
> >> > event=3DCHR_EVENT_CLOSED) at ../../hw/virtio/vhost-user-gpio.c:274
> >>
> >> I suspect the best choice here is to schedule the cleanup as a later
> >> date. Should I use the aio_bh one shots for this or maybe an rcu clean=
up
> >> event?
> >>
> >> Paolo, any suggestions?
> >>
> >> >   #4 0x0000557adc0539ef in chr_be_event (s=3D0x557adea51f10,
> >> > event=3DCHR_EVENT_CLOSED) at ../../chardev/char.c:61
> >> >   #5 0x0000557adc0506aa in qemu_chr_be_event (s=3D0x557adea51f10,
> >> > event=3DCHR_EVENT_CLOSED) at ../../chardev/char.c:81
> >> >   #6 0x0000557adc04f666 in tcp_chr_disconnect_locked
> >> > (chr=3D0x557adea51f10) at ../../chardev/char-socket.c:470
> >> >   #7 0x0000557adc04c81a in tcp_chr_write (chr=3D0x557adea51f10,
> >> > buf=3D0x7ffe8588cce0 "\v", len=3D20) at
> >> > ../../chardev/char-socket.c:129
> >
> > Does this mean the backend closed the connection before receiving all
> > the vhost-user protocol messages sent by QEMU?
> >
> > This looks like a backend bug. It prevents QEMU's vhost-user client
> > from cleanly stopping the virtqueue (vhost_virtqueue_stop()).
>
> Well the backend in this case is the qtest framework so not the worlds
> most complete implementation.
>
> > QEMU is still broken if it cannot handle disconnect at any time. Maybe
> > a simple solution for that is to check for reentrancy (either by
> > checking an existing variable or adding a new one to prevent
> > vu_gpio_stop() from calling itself).
>
> vhost-user-blk introduced an additional flag:
>
>     /*
>      * There are at least two steps of initialization of the
>      * vhost-user device. The first is a "connect" step and
>      * second is a "start" step. Make a separation between
>      * those initialization phases by using two fields.
>      */
>     /* vhost_user_blk_connect/vhost_user_blk_disconnect */
>     bool connected;
>     /* vhost_user_blk_start/vhost_user_blk_stop */
>     bool started_vu;
>
> but that in itself is not enough. If you look at the various cases of
> handling CHR_EVENT_CLOSED you'll see some schedule the shutdown with aio
> and some don't even bother (so will probably break the same way).
>
> Rather than have a mish-mash of solutions maybe we should introduce a
> new vhost function - vhost_user_async_close() which can take care of the
> scheduling and wrap it with a check for a valid vhost structure in case
> it gets shutdown in the meantime?

Handling this in core vhost code would be great.

I suggested checking a variable because it's not async. Async is more
complicated because it creates a new in-between state while waiting
for the operation to complete. Async approaches are more likely to
have bugs for this reason.

vhost-user-blk.c's async shutdown is a good example of that:
    case CHR_EVENT_CLOSED:
        if (!runstate_check(RUN_STATE_SHUTDOWN)) {
            /*
             * A close event may happen during a read/write, but vhost
             * code assumes the vhost_dev remains setup, so delay the
             * stop & clear.
             */
            AioContext *ctx =3D qemu_get_current_aio_context();

            qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL, NULL, NULL,
                    NULL, NULL, false);
            aio_bh_schedule_oneshot(ctx, vhost_user_blk_chr_closed_bh, opaq=
ue);

            /*
             * Move vhost device to the stopped state. The vhost-user devic=
e
             * will be clean up and disconnected in BH. This can be useful =
in
             * the vhost migration code. If disconnect was caught there is =
an
             * option for the general vhost code to get the dev state witho=
ut
             * knowing its type (in this case vhost-user).
             *
             * FIXME: this is sketchy to be reaching into vhost_dev
             * now because we are forcing something that implies we
             * have executed vhost_dev_stop() but that won't happen
             * until vhost_user_blk_stop() gets called from the bh.
             * Really this state check should be tracked locally.
             */
            s->dev.started =3D false;

That said, maybe async is really needed here. I haven't looked at the code.

>
> >
> >> >   #8  0x0000557adc050999 in qemu_chr_write_buffer (s=3D0x557adea51f1=
0, buf=3D0x7ffe8588cce0 "\v", len=3D20, offset=3D0x7ffe8588cbe4, write_all=
=3Dtrue) at ../../chardev/char.c:121
> >> >   #9  0x0000557adc0507c7 in qemu_chr_write (s=3D0x557adea51f10, buf=
=3D0x7ffe8588cce0 "\v", len=3D20, write_all=3Dtrue) at ../../chardev/char.c=
:173
> >> >   #10 0x0000557adc046f3a in qemu_chr_fe_write_all (be=3D0x557adf80d8=
30, buf=3D0x7ffe8588cce0 "\v", len=3D20) at ../../chardev/char-fe.c:53
> >> >   #11 0x0000557adbddc02f in vhost_user_write (dev=3D0x557adf80d878, =
msg=3D0x7ffe8588cce0, fds=3D0x0, fd_num=3D0) at ../../hw/virtio/vhost-user.=
c:490
> >> >   #12 0x0000557adbddd48f in vhost_user_get_vring_base (dev=3D0x557ad=
f80d878, ring=3D0x7ffe8588d000) at ../../hw/virtio/vhost-user.c:1260
> >> >   #13 0x0000557adbdd4bd6 in vhost_virtqueue_stop (dev=3D0x557adf80d8=
78, vdev=3D0x557adf80d640, vq=3D0x557adf843570, idx=3D0) at ../../hw/virtio=
/vhost.c:1220
> >> >   #14 0x0000557adbdd7eda in vhost_dev_stop (hdev=3D0x557adf80d878, v=
dev=3D0x557adf80d640, vrings=3Dfalse) at ../../hw/virtio/vhost.c:1916
> >> >   #15 0x0000557adbe051a6 in vu_gpio_stop (vdev=3D0x557adf80d640) at =
../../hw/virtio/vhost-user-gpio.c:142
> >> >   #16 0x0000557adbe04849 in vu_gpio_set_status (vdev=3D0x557adf80d64=
0, status=3D15 '\017') at ../../hw/virtio/vhost-user-gpio.c:173
> >> >   #17 0x0000557adbdc87ff in virtio_set_status (vdev=3D0x557adf80d640=
, val=3D15 '\017') at ../../hw/virtio/virtio.c:2442
> >> >   #18 0x0000557adbdcbfa0 in virtio_vmstate_change (opaque=3D0x557adf=
80d640, running=3Dfalse, state=3DRUN_STATE_SHUTDOWN) at ../../hw/virtio/vir=
tio.c:3736
> >> >   #19 0x0000557adb91ad27 in vm_state_notify (running=3Dfalse, state=
=3DRUN_STATE_SHUTDOWN) at ../../softmmu/runstate.c:334
> >> >   #20 0x0000557adb910e88 in do_vm_stop (state=3DRUN_STATE_SHUTDOWN, =
send_stop=3Dfalse) at ../../softmmu/cpus.c:262
> >> >   #21 0x0000557adb910e30 in vm_shutdown () at ../../softmmu/cpus.c:2=
80
> >> >   #22 0x0000557adb91b9c3 in qemu_cleanup () at ../../softmmu/runstat=
e.c:827
> >> >   #23 0x0000557adb522975 in qemu_default_main () at ../../softmmu/ma=
in.c:38
> >> >   #24 0x0000557adb5229a8 in main (argc=3D27, argv=3D0x7ffe8588d2f8) =
at ../../softmmu/main.c:48
> >> >   (rr) p hdev->started
> >> >   $9 =3D true
> >> >   (rr) info thread
> >> >     Id   Target Id                                Frame
> >> >   * 1    Thread 2140414.2140414 (qemu-system-aar) vhost_dev_is_start=
ed (hdev=3D0x557adf80d878) at /home/alex/lsrc/qemu.git/include/hw/virtio/vh=
ost.h:199
> >> >     2    Thread 2140414.2140439 (qemu-system-aar) 0x0000000070000002=
 in syscall_traced ()
> >> >     3    Thread 2140414.2140442 (qemu-system-aar) 0x0000000070000002=
 in syscall_traced ()
> >> >     4    Thread 2140414.2140443 (qemu-system-aar) 0x0000000070000002=
 in syscall_traced ()
> >> >
> >> > During which we eliminate the vhost_dev with a memset:
> >> >
> >> >   Thread 1 hit Hardware watchpoint 2: *(unsigned int *) 0x557adf80da=
30
> >> >
> >> >   Old value =3D 2
> >> >   New value =3D 0
> >> >   __memset_avx2_unaligned_erms () at ../sysdeps/x86_64/multiarch/mem=
set-vec-unaligned-erms.S:220
> >> >   Download failed: Invalid argument.  Continuing without source file=
 ./string/../sysdeps/x86_64/multiarch/memset-vec-unaligned-erms.S.
> >> >   220     ../sysdeps/x86_64/multiarch/memset-vec-unaligned-erms.S: N=
o such file or directory.
> >> >   (rr) bt
> >> >   #0  __memset_avx2_unaligned_erms () at ../sysdeps/x86_64/multiarch=
/memset-vec-unaligned-erms.S:220
> >> >   #1  0x0000557adbdd67f8 in vhost_dev_cleanup (hdev=3D0x557adf80d878=
) at ../../hw/virtio/vhost.c:1501
> >> >   #2  0x0000557adbe04d68 in vu_gpio_disconnect (dev=3D0x557adf80d640=
) at ../../hw/virtio/vhost-user-gpio.c:256
> >> >   #3  0x0000557adbe049bb in vu_gpio_event (opaque=3D0x557adf80d640, =
event=3DCHR_EVENT_CLOSED) at ../../hw/virtio/vhost-user-gpio.c:274
> >> >   #4  0x0000557adc0539ef in chr_be_event (s=3D0x557adea51f10, event=
=3DCHR_EVENT_CLOSED) at ../../chardev/char.c:61
> >> >   #5  0x0000557adc0506aa in qemu_chr_be_event (s=3D0x557adea51f10, e=
vent=3DCHR_EVENT_CLOSED) at ../../chardev/char.c:81
> >> >   #6  0x0000557adc04f666 in tcp_chr_disconnect_locked (chr=3D0x557ad=
ea51f10) at ../../chardev/char-socket.c:470
> >> >   #7  0x0000557adc04c81a in tcp_chr_write (chr=3D0x557adea51f10, buf=
=3D0x7ffe8588cce0 "\v", len=3D20) at ../../chardev/char-socket.c:129
> >> >   #8  0x0000557adc050999 in qemu_chr_write_buffer (s=3D0x557adea51f1=
0, buf=3D0x7ffe8588cce0 "\v", len=3D20, offset=3D0x7ffe8588cbe4, write_all=
=3Dtrue) at ../../chardev/char.c:121
> >> >   #9  0x0000557adc0507c7 in qemu_chr_write (s=3D0x557adea51f10, buf=
=3D0x7ffe8588cce0 "\v", len=3D20, write_all=3Dtrue) at ../../chardev/char.c=
:173
> >> >   #10 0x0000557adc046f3a in qemu_chr_fe_write_all (be=3D0x557adf80d8=
30, buf=3D0x7ffe8588cce0 "\v", len=3D20) at ../../chardev/char-fe.c:53
> >> >   #11 0x0000557adbddc02f in vhost_user_write (dev=3D0x557adf80d878, =
msg=3D0x7ffe8588cce0, fds=3D0x0, fd_num=3D0) at ../../hw/virtio/vhost-user.=
c:490
> >> >   #12 0x0000557adbddd48f in vhost_user_get_vring_base (dev=3D0x557ad=
f80d878, ring=3D0x7ffe8588d000) at ../../hw/virtio/vhost-user.c:1260
> >> >   #13 0x0000557adbdd4bd6 in vhost_virtqueue_stop (dev=3D0x557adf80d8=
78, vdev=3D0x557adf80d640, vq=3D0x557adf843570, idx=3D0) at ../../hw/virtio=
/vhost.c:1220
> >> >   #14 0x0000557adbdd7eda in vhost_dev_stop (hdev=3D0x557adf80d878, v=
dev=3D0x557adf80d640, vrings=3Dfalse) at ../../hw/virtio/vhost.c:1916
> >> >   #15 0x0000557adbe051a6 in vu_gpio_stop (vdev=3D0x557adf80d640) at =
../../hw/virtio/vhost-user-gpio.c:142
> >> >   #16 0x0000557adbe04849 in vu_gpio_set_status (vdev=3D0x557adf80d64=
0, status=3D15 '\017') at ../../hw/virtio/vhost-user-gpio.c:173
> >> >   #17 0x0000557adbdc87ff in virtio_set_status (vdev=3D0x557adf80d640=
, val=3D15 '\017') at ../../hw/virtio/virtio.c:2442
> >> >   #18 0x0000557adbdcbfa0 in virtio_vmstate_change (opaque=3D0x557adf=
80d640, running=3Dfalse, state=3DRUN_STATE_SHUTDOWN) at ../../hw/virtio/vir=
tio.c:3736
> >> >   #19 0x0000557adb91ad27 in vm_state_notify (running=3Dfalse, state=
=3DRUN_STATE_SHUTDOWN) at ../../softmmu/runstate.c:334
> >> >   #20 0x0000557adb910e88 in do_vm_stop (state=3DRUN_STATE_SHUTDOWN, =
send_stop=3Dfalse) at ../../softmmu/cpus.c:262
> >> >   #21 0x0000557adb910e30 in vm_shutdown () at ../../softmmu/cpus.c:2=
80
> >> >   #22 0x0000557adb91b9c3 in qemu_cleanup () at ../../softmmu/runstat=
e.c:827
> >> >   #23 0x0000557adb522975 in qemu_default_main () at ../../softmmu/ma=
in.c:38
> >> >   #24 0x0000557adb5229a8 in main (argc=3D27, argv=3D0x7ffe8588d2f8) =
at ../../softmmu/main.c:48
> >> >
> >> > Before finally:
> >> >
> >> >   #0  __GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/unix/sysv/linux=
/raise.c:50
> >> >   #1  0x00007f24dc269537 in __GI_abort () at abort.c:79
> >> >   #2  0x00007f24dc26940f in __assert_fail_base (fmt=3D0x7f24dc3e16a8=
 "%s%s%s:%u: %s%sAssertion `%s' failed.\n%n", assertion=3D0x557adc28d8f5 "a=
ssign || nvqs =3D=3D proxy->nvqs_with_notifiers", file=3D0x557adc28d7ab "..=
/../hw/virtio/virtio-pci.c", line=3D1029, function=3D<optimized out>) at as=
sert.c:92
> >> >   #3  0x00007f24dc278662 in __GI___assert_fail (assertion=3D0x557adc=
28d8f5 "assign || nvqs =3D=3D proxy->nvqs_with_notifiers", file=3D0x557adc2=
8d7ab "../../hw/virtio/virtio-pci.c", line=3D1029, function=3D0x557adc28d92=
2 "int virtio_pci_set_guest_notifiers(DeviceState *, int, _Bool)") at asser=
t.c:101
> >> >   #4  0x0000557adb8e97f1 in virtio_pci_set_guest_notifiers (d=3D0x55=
7adf805280, nvqs=3D0, assign=3Dfalse) at ../../hw/virtio/virtio-pci.c:1029
> >> >   #5  0x0000557adbe051c7 in vu_gpio_stop (vdev=3D0x557adf80d640) at =
../../hw/virtio/vhost-user-gpio.c:144
> >> >   #6  0x0000557adbe04849 in vu_gpio_set_status (vdev=3D0x557adf80d64=
0, status=3D15 '\017') at ../../hw/virtio/vhost-user-gpio.c:173
> >> >   #7  0x0000557adbdc87ff in virtio_set_status (vdev=3D0x557adf80d640=
, val=3D15 '\017') at ../../hw/virtio/virtio.c:2442
> >> >   #8  0x0000557adbdcbfa0 in virtio_vmstate_change (opaque=3D0x557adf=
80d640, running=3Dfalse, state=3DRUN_STATE_SHUTDOWN) at ../../hw/virtio/vir=
tio.c:3736
> >> >   #9  0x0000557adb91ad27 in vm_state_notify (running=3Dfalse, state=
=3DRUN_STATE_SHUTDOWN) at ../../softmmu/runstate.c:334
> >> >   #10 0x0000557adb910e88 in do_vm_stop (state=3DRUN_STATE_SHUTDOWN, =
send_stop=3Dfalse) at ../../softmmu/cpus.c:262
> >> >   #11 0x0000557adb910e30 in vm_shutdown () at ../../softmmu/cpus.c:2=
80
> >> >   #12 0x0000557adb91b9c3 in qemu_cleanup () at ../../softmmu/runstat=
e.c:827
> >> >   #13 0x0000557adb522975 in qemu_default_main () at ../../softmmu/ma=
in.c:38
> >> >   #14 0x0000557adb5229a8 in main (argc=3D27, argv=3D0x7ffe8588d2f8) =
at ../../softmmu/main.c:48
> >> >
> >> > Because of course we've just done that on disconnect.
> >> >
> >> > Not sure what the cleanest way to avoid that is yet. Maybe it will b=
e
> >> > clearer on Monday morning.
> >>
> >>
> >> --
> >> Alex Benn=C3=A9e
> >>
>
>
> --
> Alex Benn=C3=A9e

