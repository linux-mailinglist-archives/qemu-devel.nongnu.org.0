Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CC36395B8
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Nov 2022 12:25:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oytIE-0003dW-NR; Sat, 26 Nov 2022 06:24:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oytIC-0003dO-Nk
 for qemu-devel@nongnu.org; Sat, 26 Nov 2022 06:24:20 -0500
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oytIA-0002Xr-GJ
 for qemu-devel@nongnu.org; Sat, 26 Nov 2022 06:24:20 -0500
Received: by mail-yb1-xb30.google.com with SMTP id c140so7835299ybf.11
 for <qemu-devel@nongnu.org>; Sat, 26 Nov 2022 03:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u5Om2qO6ieCOd0rR7KJYzXFdMYnPCERRv7ZTRCQhEhQ=;
 b=AOugCMDi4pPJ+XNwdQxm8o7UZUy8KzR4sPs8866YwHrnpizRf187EJAvnOLsFiPD5R
 iqXJfKlXJy2kiSubuKWtLgrJA5VuL9Uidy7voa2z2xlVzCp+qfRVKMClHyprExY5sRSe
 sj74lOJTHH64JTpl7gOovtapHsX0qi6AGMdy3TsJtxisMR2kLH9jntNrhhr6rqXfSRUk
 74QVvz9vgLQI9HyBJGyif3pL51veJ/SuOj7v7tdeE4xPTcn6RurzSjh4a+W1oi1ex9CY
 meycLx8gOL3QUbhzFlw0+rtmsqdWbUvUtwBl2Owb9a+8Hb1gU9TdDVMQarTWSwppz+sf
 P8uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u5Om2qO6ieCOd0rR7KJYzXFdMYnPCERRv7ZTRCQhEhQ=;
 b=pBc+jd51lao6nv3ANfUenIxBDXs6F345Zv8qfOAA4MBu99d1MXZVn3pHBE0nnbN5Ce
 ePz0eqlW5cNqptQLjEWaP0Xz0MHUbz3PmeB5xk0LBwwymepstvHNn8oy53c61jzXQ5G6
 tM/S+q82Hs4UV06jt+ral2QQeodrT8JzlqHBP2Jxvh2Gd9LTITI0ZBPOCmckvlQCoI0K
 jKhL+AIeKVjWFhuDECBjIT7xqRBc8GeTAofBjHIdHxwO6YaFBo1gyCSVkzohqFyLa0Ow
 a4lgKU6lmT8beFpmBmXfz7q8geRIozvH+tqkZdHTDTPLu3pFi10nj910nIMPPq6RQX1i
 kdLw==
X-Gm-Message-State: ANoB5pmwflFnXqzCCCWKdVTaFljV8nd8/TeTGTqufI/4hIHfiQF3oBDQ
 gaJvmbH5lMeto/ts+qGmumydHQMr+3mAfYeqRp0=
X-Google-Smtp-Source: AA0mqf5rlTQZSok5EUUEbXwmxbFC0aOFL/a8hSfCX5sqKT4pEoYW5W067K0rpj01IcKYrrhiRih7OQk/EUO+X5rHKJE=
X-Received: by 2002:a25:918a:0:b0:6ca:ecb9:970a with SMTP id
 w10-20020a25918a000000b006caecb9970amr21546794ybl.209.1669461857218; Sat, 26
 Nov 2022 03:24:17 -0800 (PST)
MIME-Version: 1.0
References: <20221125173043.1998075-1-alex.bennee@linaro.org>
 <87lenyajba.fsf@linaro.org> <87fse63v9t.fsf@linaro.org>
In-Reply-To: <87fse63v9t.fsf@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Sat, 26 Nov 2022 06:24:05 -0500
Message-ID: <CAJSP0QXaRrM3NGttNytsOZigF-SwiX4_H-j_6KHxS9VjOrPFkg@mail.gmail.com>
Subject: Re: [PATCH for 7.2-rc? v2 0/5] continuing efforts to fix vhost-user
 issues
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, slp@redhat.com, mst@redhat.com, 
 marcandre.lureau@redhat.com, stefanha@redhat.com, mathieu.poirier@linaro.org, 
 viresh.kumar@linaro.org, sgarzare@redhat.com, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb30.google.com
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

On Sat, 26 Nov 2022 at 04:45, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>
> > Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
> >
> >> Hi,
> >>
> > <snip>
> >> I can replicate some of the other failures I've been seeing in CI by
> >> running:
> >>
> >>   ../../meson/meson.py test --repeat 10 --print-errorlogs qtest-arm/qo=
s-test
> >>
> >> however this seems to run everything in parallel and maybe is better
> >> at exposing race conditions. Perhaps the CI system makes those races
> >> easier to hit? Unfortunately I've not been able to figure out exactly
> >> how things go wrong in the failure case.
> >>
> > <snip>
> >
> > There is a circular call - we are in vu_gpio_stop which triggers a writ=
e
> > to vhost-user which allows us to catch a disconnect event:
> >
> >   #0  vhost_dev_is_started (hdev=3D0x557adf80d878) at /home/alex/lsrc/q=
emu.git/include/hw/virtio/vhost.h:199
> >   #1  0x0000557adbe0518a in vu_gpio_stop (vdev=3D0x557adf80d640) at ../=
../hw/virtio/vhost-user-gpio.c:138
> >   #2  0x0000557adbe04d56 in vu_gpio_disconnect (dev=3D0x557adf80d640) a=
t ../../hw/virtio/vhost-user-gpio.c:255
> >   #3  0x0000557adbe049bb in vu_gpio_event (opaque=3D0x557adf80d640, eve=
nt=3DCHR_EVENT_CLOSED) at ../../hw/virtio/vhost-user-gpio.c:274
>
> I suspect the best choice here is to schedule the cleanup as a later
> date. Should I use the aio_bh one shots for this or maybe an rcu cleanup
> event?
>
> Paolo, any suggestions?
>
> >   #4  0x0000557adc0539ef in chr_be_event (s=3D0x557adea51f10, event=3DC=
HR_EVENT_CLOSED) at ../../chardev/char.c:61
> >   #5  0x0000557adc0506aa in qemu_chr_be_event (s=3D0x557adea51f10, even=
t=3DCHR_EVENT_CLOSED) at ../../chardev/char.c:81
> >   #6  0x0000557adc04f666 in tcp_chr_disconnect_locked (chr=3D0x557adea5=
1f10) at ../../chardev/char-socket.c:470
> >   #7  0x0000557adc04c81a in tcp_chr_write (chr=3D0x557adea51f10, buf=3D=
0x7ffe8588cce0 "\v", len=3D20) at ../../chardev/char-socket.c:129

Does this mean the backend closed the connection before receiving all
the vhost-user protocol messages sent by QEMU?

This looks like a backend bug. It prevents QEMU's vhost-user client
from cleanly stopping the virtqueue (vhost_virtqueue_stop()).

QEMU is still broken if it cannot handle disconnect at any time. Maybe
a simple solution for that is to check for reentrancy (either by
checking an existing variable or adding a new one to prevent
vu_gpio_stop() from calling itself).

> >   #8  0x0000557adc050999 in qemu_chr_write_buffer (s=3D0x557adea51f10, =
buf=3D0x7ffe8588cce0 "\v", len=3D20, offset=3D0x7ffe8588cbe4, write_all=3Dt=
rue) at ../../chardev/char.c:121
> >   #9  0x0000557adc0507c7 in qemu_chr_write (s=3D0x557adea51f10, buf=3D0=
x7ffe8588cce0 "\v", len=3D20, write_all=3Dtrue) at ../../chardev/char.c:173
> >   #10 0x0000557adc046f3a in qemu_chr_fe_write_all (be=3D0x557adf80d830,=
 buf=3D0x7ffe8588cce0 "\v", len=3D20) at ../../chardev/char-fe.c:53
> >   #11 0x0000557adbddc02f in vhost_user_write (dev=3D0x557adf80d878, msg=
=3D0x7ffe8588cce0, fds=3D0x0, fd_num=3D0) at ../../hw/virtio/vhost-user.c:4=
90
> >   #12 0x0000557adbddd48f in vhost_user_get_vring_base (dev=3D0x557adf80=
d878, ring=3D0x7ffe8588d000) at ../../hw/virtio/vhost-user.c:1260
> >   #13 0x0000557adbdd4bd6 in vhost_virtqueue_stop (dev=3D0x557adf80d878,=
 vdev=3D0x557adf80d640, vq=3D0x557adf843570, idx=3D0) at ../../hw/virtio/vh=
ost.c:1220
> >   #14 0x0000557adbdd7eda in vhost_dev_stop (hdev=3D0x557adf80d878, vdev=
=3D0x557adf80d640, vrings=3Dfalse) at ../../hw/virtio/vhost.c:1916
> >   #15 0x0000557adbe051a6 in vu_gpio_stop (vdev=3D0x557adf80d640) at ../=
../hw/virtio/vhost-user-gpio.c:142
> >   #16 0x0000557adbe04849 in vu_gpio_set_status (vdev=3D0x557adf80d640, =
status=3D15 '\017') at ../../hw/virtio/vhost-user-gpio.c:173
> >   #17 0x0000557adbdc87ff in virtio_set_status (vdev=3D0x557adf80d640, v=
al=3D15 '\017') at ../../hw/virtio/virtio.c:2442
> >   #18 0x0000557adbdcbfa0 in virtio_vmstate_change (opaque=3D0x557adf80d=
640, running=3Dfalse, state=3DRUN_STATE_SHUTDOWN) at ../../hw/virtio/virtio=
.c:3736
> >   #19 0x0000557adb91ad27 in vm_state_notify (running=3Dfalse, state=3DR=
UN_STATE_SHUTDOWN) at ../../softmmu/runstate.c:334
> >   #20 0x0000557adb910e88 in do_vm_stop (state=3DRUN_STATE_SHUTDOWN, sen=
d_stop=3Dfalse) at ../../softmmu/cpus.c:262
> >   #21 0x0000557adb910e30 in vm_shutdown () at ../../softmmu/cpus.c:280
> >   #22 0x0000557adb91b9c3 in qemu_cleanup () at ../../softmmu/runstate.c=
:827
> >   #23 0x0000557adb522975 in qemu_default_main () at ../../softmmu/main.=
c:38
> >   #24 0x0000557adb5229a8 in main (argc=3D27, argv=3D0x7ffe8588d2f8) at =
../../softmmu/main.c:48
> >   (rr) p hdev->started
> >   $9 =3D true
> >   (rr) info thread
> >     Id   Target Id                                Frame
> >   * 1    Thread 2140414.2140414 (qemu-system-aar) vhost_dev_is_started =
(hdev=3D0x557adf80d878) at /home/alex/lsrc/qemu.git/include/hw/virtio/vhost=
.h:199
> >     2    Thread 2140414.2140439 (qemu-system-aar) 0x0000000070000002 in=
 syscall_traced ()
> >     3    Thread 2140414.2140442 (qemu-system-aar) 0x0000000070000002 in=
 syscall_traced ()
> >     4    Thread 2140414.2140443 (qemu-system-aar) 0x0000000070000002 in=
 syscall_traced ()
> >
> > During which we eliminate the vhost_dev with a memset:
> >
> >   Thread 1 hit Hardware watchpoint 2: *(unsigned int *) 0x557adf80da30
> >
> >   Old value =3D 2
> >   New value =3D 0
> >   __memset_avx2_unaligned_erms () at ../sysdeps/x86_64/multiarch/memset=
-vec-unaligned-erms.S:220
> >   Download failed: Invalid argument.  Continuing without source file ./=
string/../sysdeps/x86_64/multiarch/memset-vec-unaligned-erms.S.
> >   220     ../sysdeps/x86_64/multiarch/memset-vec-unaligned-erms.S: No s=
uch file or directory.
> >   (rr) bt
> >   #0  __memset_avx2_unaligned_erms () at ../sysdeps/x86_64/multiarch/me=
mset-vec-unaligned-erms.S:220
> >   #1  0x0000557adbdd67f8 in vhost_dev_cleanup (hdev=3D0x557adf80d878) a=
t ../../hw/virtio/vhost.c:1501
> >   #2  0x0000557adbe04d68 in vu_gpio_disconnect (dev=3D0x557adf80d640) a=
t ../../hw/virtio/vhost-user-gpio.c:256
> >   #3  0x0000557adbe049bb in vu_gpio_event (opaque=3D0x557adf80d640, eve=
nt=3DCHR_EVENT_CLOSED) at ../../hw/virtio/vhost-user-gpio.c:274
> >   #4  0x0000557adc0539ef in chr_be_event (s=3D0x557adea51f10, event=3DC=
HR_EVENT_CLOSED) at ../../chardev/char.c:61
> >   #5  0x0000557adc0506aa in qemu_chr_be_event (s=3D0x557adea51f10, even=
t=3DCHR_EVENT_CLOSED) at ../../chardev/char.c:81
> >   #6  0x0000557adc04f666 in tcp_chr_disconnect_locked (chr=3D0x557adea5=
1f10) at ../../chardev/char-socket.c:470
> >   #7  0x0000557adc04c81a in tcp_chr_write (chr=3D0x557adea51f10, buf=3D=
0x7ffe8588cce0 "\v", len=3D20) at ../../chardev/char-socket.c:129
> >   #8  0x0000557adc050999 in qemu_chr_write_buffer (s=3D0x557adea51f10, =
buf=3D0x7ffe8588cce0 "\v", len=3D20, offset=3D0x7ffe8588cbe4, write_all=3Dt=
rue) at ../../chardev/char.c:121
> >   #9  0x0000557adc0507c7 in qemu_chr_write (s=3D0x557adea51f10, buf=3D0=
x7ffe8588cce0 "\v", len=3D20, write_all=3Dtrue) at ../../chardev/char.c:173
> >   #10 0x0000557adc046f3a in qemu_chr_fe_write_all (be=3D0x557adf80d830,=
 buf=3D0x7ffe8588cce0 "\v", len=3D20) at ../../chardev/char-fe.c:53
> >   #11 0x0000557adbddc02f in vhost_user_write (dev=3D0x557adf80d878, msg=
=3D0x7ffe8588cce0, fds=3D0x0, fd_num=3D0) at ../../hw/virtio/vhost-user.c:4=
90
> >   #12 0x0000557adbddd48f in vhost_user_get_vring_base (dev=3D0x557adf80=
d878, ring=3D0x7ffe8588d000) at ../../hw/virtio/vhost-user.c:1260
> >   #13 0x0000557adbdd4bd6 in vhost_virtqueue_stop (dev=3D0x557adf80d878,=
 vdev=3D0x557adf80d640, vq=3D0x557adf843570, idx=3D0) at ../../hw/virtio/vh=
ost.c:1220
> >   #14 0x0000557adbdd7eda in vhost_dev_stop (hdev=3D0x557adf80d878, vdev=
=3D0x557adf80d640, vrings=3Dfalse) at ../../hw/virtio/vhost.c:1916
> >   #15 0x0000557adbe051a6 in vu_gpio_stop (vdev=3D0x557adf80d640) at ../=
../hw/virtio/vhost-user-gpio.c:142
> >   #16 0x0000557adbe04849 in vu_gpio_set_status (vdev=3D0x557adf80d640, =
status=3D15 '\017') at ../../hw/virtio/vhost-user-gpio.c:173
> >   #17 0x0000557adbdc87ff in virtio_set_status (vdev=3D0x557adf80d640, v=
al=3D15 '\017') at ../../hw/virtio/virtio.c:2442
> >   #18 0x0000557adbdcbfa0 in virtio_vmstate_change (opaque=3D0x557adf80d=
640, running=3Dfalse, state=3DRUN_STATE_SHUTDOWN) at ../../hw/virtio/virtio=
.c:3736
> >   #19 0x0000557adb91ad27 in vm_state_notify (running=3Dfalse, state=3DR=
UN_STATE_SHUTDOWN) at ../../softmmu/runstate.c:334
> >   #20 0x0000557adb910e88 in do_vm_stop (state=3DRUN_STATE_SHUTDOWN, sen=
d_stop=3Dfalse) at ../../softmmu/cpus.c:262
> >   #21 0x0000557adb910e30 in vm_shutdown () at ../../softmmu/cpus.c:280
> >   #22 0x0000557adb91b9c3 in qemu_cleanup () at ../../softmmu/runstate.c=
:827
> >   #23 0x0000557adb522975 in qemu_default_main () at ../../softmmu/main.=
c:38
> >   #24 0x0000557adb5229a8 in main (argc=3D27, argv=3D0x7ffe8588d2f8) at =
../../softmmu/main.c:48
> >
> > Before finally:
> >
> >   #0  __GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/unix/sysv/linux/ra=
ise.c:50
> >   #1  0x00007f24dc269537 in __GI_abort () at abort.c:79
> >   #2  0x00007f24dc26940f in __assert_fail_base (fmt=3D0x7f24dc3e16a8 "%=
s%s%s:%u: %s%sAssertion `%s' failed.\n%n", assertion=3D0x557adc28d8f5 "assi=
gn || nvqs =3D=3D proxy->nvqs_with_notifiers", file=3D0x557adc28d7ab "../..=
/hw/virtio/virtio-pci.c", line=3D1029, function=3D<optimized out>) at asser=
t.c:92
> >   #3  0x00007f24dc278662 in __GI___assert_fail (assertion=3D0x557adc28d=
8f5 "assign || nvqs =3D=3D proxy->nvqs_with_notifiers", file=3D0x557adc28d7=
ab "../../hw/virtio/virtio-pci.c", line=3D1029, function=3D0x557adc28d922 "=
int virtio_pci_set_guest_notifiers(DeviceState *, int, _Bool)") at assert.c=
:101
> >   #4  0x0000557adb8e97f1 in virtio_pci_set_guest_notifiers (d=3D0x557ad=
f805280, nvqs=3D0, assign=3Dfalse) at ../../hw/virtio/virtio-pci.c:1029
> >   #5  0x0000557adbe051c7 in vu_gpio_stop (vdev=3D0x557adf80d640) at ../=
../hw/virtio/vhost-user-gpio.c:144
> >   #6  0x0000557adbe04849 in vu_gpio_set_status (vdev=3D0x557adf80d640, =
status=3D15 '\017') at ../../hw/virtio/vhost-user-gpio.c:173
> >   #7  0x0000557adbdc87ff in virtio_set_status (vdev=3D0x557adf80d640, v=
al=3D15 '\017') at ../../hw/virtio/virtio.c:2442
> >   #8  0x0000557adbdcbfa0 in virtio_vmstate_change (opaque=3D0x557adf80d=
640, running=3Dfalse, state=3DRUN_STATE_SHUTDOWN) at ../../hw/virtio/virtio=
.c:3736
> >   #9  0x0000557adb91ad27 in vm_state_notify (running=3Dfalse, state=3DR=
UN_STATE_SHUTDOWN) at ../../softmmu/runstate.c:334
> >   #10 0x0000557adb910e88 in do_vm_stop (state=3DRUN_STATE_SHUTDOWN, sen=
d_stop=3Dfalse) at ../../softmmu/cpus.c:262
> >   #11 0x0000557adb910e30 in vm_shutdown () at ../../softmmu/cpus.c:280
> >   #12 0x0000557adb91b9c3 in qemu_cleanup () at ../../softmmu/runstate.c=
:827
> >   #13 0x0000557adb522975 in qemu_default_main () at ../../softmmu/main.=
c:38
> >   #14 0x0000557adb5229a8 in main (argc=3D27, argv=3D0x7ffe8588d2f8) at =
../../softmmu/main.c:48
> >
> > Because of course we've just done that on disconnect.
> >
> > Not sure what the cleanest way to avoid that is yet. Maybe it will be
> > clearer on Monday morning.
>
>
> --
> Alex Benn=C3=A9e
>

