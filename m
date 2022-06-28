Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9211955CDCB
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 15:04:12 +0200 (CEST)
Received: from localhost ([::1]:46466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6At0-0004DH-U7
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 09:04:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o6Ap7-0002L3-0Q
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:00:16 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:35347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o6Ap3-0005hQ-LM
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:00:08 -0400
Received: by mail-lj1-x22c.google.com with SMTP id u14so1438764ljh.2
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 06:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=io2GIRmR+kd4ruI3UAhjitImtDmkFi87el59usEUR+8=;
 b=YjHHj8z2C7M/rZxupNQMm9+Dtpu9VX9EaZbwxoj5YgncTv/sOdIm3HZhVTkR/rBB9s
 v8x4sUfa4Um9lFVZ+2EcpJkb0RqVwIMybKH5dU6EcgcJwI+YC+7/s6JQEizgfw1am3SL
 mX7MY3K0CV+EiGkBI6UWof0FQiBuwTDaMRSxEjjmET/aRuZml5zMxf9nFuaH2tavr56m
 hKdQw+C76015AzeWSP7n5REDHoV7yt+4dfYgjQM13t5pvJUXqCZyWRp51dWIR3WaBf1D
 +7xuEady7HHWNWdV+nMiSHm+aCU2mec8ekNYiPnd6nrngvy+6aADvczrCUs9pEKjoY1t
 ricA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=io2GIRmR+kd4ruI3UAhjitImtDmkFi87el59usEUR+8=;
 b=Fg6JGNWKu1OaJY41kUhGVKvykRhsQYdZgTrSjCJjOEhDbHdngFNkrewisZRpdamhqu
 0hmXvIvnIP2rA+xmMA4taM+QTU4nXYcC83IQ+bbpU0eh1LfR3SpRldttOZC72heJjLoh
 Z1EGMeuWBZad7DYFub/VjSa7USi3pvpaKqbNzAreAw1/TgiBH6w/QLFg0WSC+DmiT1Nz
 UhehJPT68A9KUgAufMBbp3BgigTIv/ZoDPC40DQKohTocRotJG7dPVQJODG5yBHM88lo
 6C08ornX2n7QnIoxBjMycftSh28F4ClL7pX39ooZu3H8sAjrHz5pLtyzQ4wx3PHp1B1E
 vseQ==
X-Gm-Message-State: AJIora9f7nIyynrcDCPnWIeQLLKri2fNuxspiqfGiak8pj7/l3GSxHph
 FrHnyNwj7RjrYZC+5UmzsfOwDigcFuGo9TCj9uc=
X-Google-Smtp-Source: AGRyM1vEWRfrI9wUoUoS9+RVTVNjkANDXT65lvSgWvBXv+WLK3NGtgUyB3mpp0NjQ/Wu3WT2hLGVyjpAgLNVHNqN8fE=
X-Received: by 2002:a2e:a801:0:b0:24a:ff0b:ae7a with SMTP id
 l1-20020a2ea801000000b0024aff0bae7amr9551317ljq.287.1656421202940; Tue, 28
 Jun 2022 06:00:02 -0700 (PDT)
MIME-Version: 1.0
References: <7ad664fc-ca40-e446-028f-47ea1fd1c21d@linaro.org>
 <CAJ+F1CKJycsXw=o4=tr+GNFBWkK41WAM_0h428_joW+cF0-V2g@mail.gmail.com>
 <6bcec8e5-4fb6-db96-20ee-853f159c8a9a@linaro.org>
In-Reply-To: <6bcec8e5-4fb6-db96-20ee-853f159c8a9a@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 28 Jun 2022 16:59:50 +0400
Message-ID: <CAJ+F1CLhwDV7g7PMJnnwo493wiuFc8S9uq1N-owLj3bnjV6gYQ@mail.gmail.com>
Subject: Re: virgl avocado hang
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000066585805e2819df9"
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000066585805e2819df9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Jun 27, 2022 at 4:08 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 6/27/22 16:10, Marc-Andr=C3=A9 Lureau wrote:
> > Could you describe how to reproduce? I naively --disable-virglrenderer
> and I get:
> >
> > $ tests/venv/bin/avocado run tests/avocado/virtio-gpu.py
> > Fetching asset from
> tests/avocado/virtio-gpu.py:VirtioGPUx86.test_virtio_vga_virgl
> > Fetching asset from
> tests/avocado/virtio-gpu.py:VirtioGPUx86.test_virtio_vga_virgl
> > Fetching asset from
> tests/avocado/virtio-gpu.py:VirtioGPUx86.test_vhost_user_vga_virgl
> > Fetching asset from
> tests/avocado/virtio-gpu.py:VirtioGPUx86.test_vhost_user_vga_virgl
> > JOB ID     : d9c5b65777777564d1d926fdfb58deaf0e967d15
> > JOB LOG    :
> /home/elmarco/avocado/job-results/job-2022-06-27T12.56-d9c5b65/job.log
> >   (1/2) tests/avocado/virtio-gpu.py:VirtioGPUx86.test_virtio_vga_virgl:
> CANCEL: VirGL not
> > enabled? (0.08 s)
> >   (2/2)
> tests/avocado/virtio-gpu.py:VirtioGPUx86.test_vhost_user_vga_virgl: CANCE=
L:
> Could
> > not find vhost-user-gpu (0.02 s)
> > RESULTS    : PASS 0 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 =
|
> CANCEL 2
> > JOB TIME   : 0.56 s
>
> Ah, I beg your pardon -- virglrenderer is *not* disabled, I merely assume=
d
> it was.  But
> the effect is still there -- dead qemu not reaped, indefinite hang on the
> driver.
>
> The end of the log is:
>
> > 2022-06-27 17:32:19,746 stacktrace       L0045 ERROR|   Command:
> ./qemu-system-x86_64 -display none -vga none -chardev
> socket,id=3Dmon,path=3D/var/tmp/avo_qemu_sock_4j1r4bdf/qemu-245052-7f2a8c=
8a3bb0-monitor.sock
> -mon chardev=3Dmon,mode=3Dcontrol -chardev
> socket,id=3Dconsole,path=3D/var/tmp/avo_qemu_sock_4j1r4bdf/qemu-245052-7f=
2a8c8a3bb0-console.sock,server=3Don,wait=3Doff
> -serial chardev:console -cpu host -m 2G -machine pc,accel=3Dkvm -device
> virtio-vga-gl -display egl-headless -kernel
> /home/rth/avocado/data/cache/by_location/892ae21f3ae7d04994d81e1c0bf204ec=
ebe555bb/vmlinuz
> -initrd
> /home/rth/avocado/data/cache/by_location/892ae21f3ae7d04994d81e1c0bf204ec=
ebe555bb/initrd.img
> -append printk.time=3D0 console=3DttyS0 rdinit=3D/bin/bash
>
> > 2022-06-27 17:32:19,746 stacktrace       L0045 ERROR|   Output:
> qemu-system-x86_64: -display egl-headless: Parameter 'type' does not acce=
pt
> value 'egl-headless'
>
>
> if that helps.
>
>
Ok I managed to reproduce, it's enough to give invalid arguments to make it
hang for a long while.

This a flaw in machine.py, which waits for the qemu QMP connection,
forever. We could first teach it to wait for the default 15s max.

But machine.py probably needs to be ported to the async QMPClient
(python/qemu/qmp/legacy.py).

For now, I'll send a simpler fix and leave TODOs for later ;)


--=20
Marc-Andr=C3=A9 Lureau

--00000000000066585805e2819df9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 27, 2022 at 4:08 PM Ric=
hard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org" target=
=3D"_blank">richard.henderson@linaro.org</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On 6/27/22 16:10, Marc-Andr=C3=A9 L=
ureau wrote:<br>
&gt; Could you describe how to reproduce? I naively --disable-virglrenderer=
 and I get:<br>
&gt; <br>
&gt; $ tests/venv/bin/avocado run tests/avocado/virtio-gpu.py<br>
&gt; Fetching asset from tests/avocado/virtio-gpu.py:VirtioGPUx86.test_virt=
io_vga_virgl<br>
&gt; Fetching asset from tests/avocado/virtio-gpu.py:VirtioGPUx86.test_virt=
io_vga_virgl<br>
&gt; Fetching asset from tests/avocado/virtio-gpu.py:VirtioGPUx86.test_vhos=
t_user_vga_virgl<br>
&gt; Fetching asset from tests/avocado/virtio-gpu.py:VirtioGPUx86.test_vhos=
t_user_vga_virgl<br>
&gt; JOB ID =C2=A0 =C2=A0 : d9c5b65777777564d1d926fdfb58deaf0e967d15<br>
&gt; JOB LOG =C2=A0 =C2=A0: /home/elmarco/avocado/job-results/job-2022-06-2=
7T12.56-d9c5b65/job.log<br>
&gt;=C2=A0 =C2=A0(1/2) tests/avocado/virtio-gpu.py:VirtioGPUx86.test_virtio=
_vga_virgl: CANCEL: VirGL not <br>
&gt; enabled? (0.08 s)<br>
&gt;=C2=A0 =C2=A0(2/2) tests/avocado/virtio-gpu.py:VirtioGPUx86.test_vhost_=
user_vga_virgl: CANCEL: Could <br>
&gt; not find vhost-user-gpu (0.02 s)<br>
&gt; RESULTS =C2=A0 =C2=A0: PASS 0 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | I=
NTERRUPT 0 | CANCEL 2<br>
&gt; JOB TIME =C2=A0 : 0.56 s<br>
<br>
Ah, I beg your pardon -- virglrenderer is *not* disabled, I merely assumed =
it was.=C2=A0 But <br>
the effect is still there -- dead qemu not reaped, indefinite hang on the d=
river.<br>
<br>
The end of the log is:<br>
<br>
&gt; 2022-06-27 17:32:19,746 stacktrace=C2=A0 =C2=A0 =C2=A0 =C2=A0L0045 ERR=
OR|=C2=A0 =C2=A0Command: ./qemu-system-x86_64 -display none -vga none -char=
dev socket,id=3Dmon,path=3D/var/tmp/avo_qemu_sock_4j1r4bdf/qemu-245052-7f2a=
8c8a3bb0-monitor.sock -mon chardev=3Dmon,mode=3Dcontrol -chardev socket,id=
=3Dconsole,path=3D/var/tmp/avo_qemu_sock_4j1r4bdf/qemu-245052-7f2a8c8a3bb0-=
console.sock,server=3Don,wait=3Doff -serial chardev:console -cpu host -m 2G=
 -machine pc,accel=3Dkvm -device virtio-vga-gl -display egl-headless -kerne=
l /home/rth/avocado/data/cache/by_location/892ae21f3ae7d04994d81e1c0bf204ec=
ebe555bb/vmlinuz -initrd /home/rth/avocado/data/cache/by_location/892ae21f3=
ae7d04994d81e1c0bf204ecebe555bb/initrd.img -append printk.time=3D0 console=
=3DttyS0 rdinit=3D/bin/bash<br>
<br>
&gt; 2022-06-27 17:32:19,746 stacktrace=C2=A0 =C2=A0 =C2=A0 =C2=A0L0045 ERR=
OR|=C2=A0 =C2=A0Output: qemu-system-x86_64: -display egl-headless: Paramete=
r &#39;type&#39; does not accept value &#39;egl-headless&#39;<br>
<br>
<br>
if that helps.<br>
<br></blockquote><div><br></div><div>Ok I managed to reproduce, it&#39;s en=
ough to give invalid arguments to make it hang for a long while.</div><div>=
<br></div><div>This a flaw in machine.py, which waits for the qemu QMP conn=
ection, forever. We could first teach it to wait for the default 15s max.</=
div><div><br></div><div>But machine.py probably needs to be ported to the a=
sync QMPClient (python/qemu/qmp/legacy.py).</div><div><br></div><div>For no=
w, I&#39;ll send a simpler fix and leave TODOs for later ;)<br></div><br cl=
ear=3D"all"></div><br>-- <br><div dir=3D"ltr">Marc-Andr=C3=A9 Lureau<br></d=
iv></div>

--00000000000066585805e2819df9--

