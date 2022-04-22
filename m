Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E8B50B3D8
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 11:17:41 +0200 (CEST)
Received: from localhost ([::1]:53058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhpQ1-0007lJ-FQ
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 05:17:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhpFl-0006qz-C5
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 05:07:01 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:44715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhpFj-0002AI-DM
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 05:07:01 -0400
Received: by mail-qk1-x730.google.com with SMTP id b189so5364922qkf.11
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 02:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U/IT53HEefx4ZVhQc75tqwOZItlRC0frfPRcRfg6w+M=;
 b=YAojaMUTYrJdpl5wjAG8NkftCbJDwuL9cSOaLkK1hxIYhFMXorGerWGnaXoo4DGTIf
 HwaUrPOxcfOBFgD2WBxHckmygT/1+L2RdW/a65aBbbOIx73joQEGF5EQDQzIrgkddYB4
 OixtZos+HLVzehs6cG1dKrbJjqPXGhp9lfJoFeH9hLdgCIfeCztneRa/smFG14ZQHSjv
 waeevR5ac+czYdMLjvlI0xsOx0McSKVnQU6CJAWEbq2H5la/dBFQ0/e900buLh2MESdn
 vj5RCTR3PkjgAyFLU9KIX1iXGUjgT680BQWUJVVXJCH4xkklYumgLlBe2i8YpEjTSoiT
 9HJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U/IT53HEefx4ZVhQc75tqwOZItlRC0frfPRcRfg6w+M=;
 b=2K8ACO5j+v8kcVyEGMpveESPKCo9mGC/7bdZwf0yWTxN3bdpvX6cxDm3Rar5hq+LS0
 t/1zJJmEfVSP+EhCMySbIh6TeFBYMkLHfoNr2ObMXoP2DS3dR5RiR+4wrGCU0MlpMIfO
 exhe8HmLqt6bEYdtqmAaYVBuZVDYnNFmMmIg+xAPXQEUUtPj4t2JLprWvLM2td+ew3Al
 LVxVZDLNnXaINZqu88oSOb810zg3RgfElORNXUSZensy9CvKrSYRHPkfzcF+sipqOfeS
 Pn4CYZqpz1X6haq/wCAHX3Qu/toaNL/I87ChM5a5VDx7CYAi+7x8A9Mj3xuKt3BNZHgZ
 3DFA==
X-Gm-Message-State: AOAM530YDu0CJ0rmqcNtwx22J3e+wx7u+xxYF8wgobrpbhdXOE4K0/Ka
 1l+ecy2c/VlJkyn1NyVrayXiEAQFq7w0a7v10UsTuzp/QGydNQ==
X-Google-Smtp-Source: ABdhPJyhbjGsc+MbAUsW8lzoNwSkopPUfnlDjvweiIlY01YgMdD+7P1ksp8rGEnQtGPI4c0i4tGu1q2/poClYooGSFg=
X-Received: by 2002:a05:620a:4093:b0:69c:fda:3cf2 with SMTP id
 f19-20020a05620a409300b0069c0fda3cf2mr1917350qko.245.1650618418428; Fri, 22
 Apr 2022 02:06:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220422083639.3156978-1-marcandre.lureau@redhat.com>
 <20220422083639.3156978-9-marcandre.lureau@redhat.com>
 <YmJtpgNzy3omF0+V@redhat.com>
In-Reply-To: <YmJtpgNzy3omF0+V@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 22 Apr 2022 13:06:46 +0400
Message-ID: <CAJ+F1CK1HCyfBo5Q3hmXhjaPy48APzO5FsF1NC1Epp8ppDsVtA@mail.gmail.com>
Subject: Re: [PATCH 08/10] Use g_unix_set_fd_nonblocking()
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000007d7d8d05dd3a8c69"
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qk1-x730.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000007d7d8d05dd3a8c69
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Apr 22, 2022 at 12:57 PM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om>
wrote:

> On Fri, Apr 22, 2022 at 12:36:37PM +0400, marcandre.lureau@redhat.com
> wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > API available since glib 2.30. It also preserves errno.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  hw/misc/ivshmem.c           | 2 +-
> >  util/event_notifier-posix.c | 6 ++----
> >  util/main-loop.c            | 2 +-
> >  3 files changed, 4 insertions(+), 6 deletions(-)
>
> There are many more places in QEMU setting O_NONBLOCK.
>
> $ git grep '\bO_NONBLOCK' | grep -i setfl
> hw/misc/ivshmem.c:    fcntl_setfl(fd, O_NONBLOCK); /* msix/irqfd poll non
> block */
> hw/rdma/rdma_backend.c:    rc =3D fcntl(backend_dev->channel->fd, F_SETFL=
,
> flags | O_NONBLOCK);
> linux-user/syscall.c:        if (fcntl(fd, F_SETFL, O_NONBLOCK | flags) =
=3D=3D
> -1) {
> net/tap-bsd.c:    fcntl(fd, F_SETFL, O_NONBLOCK);
> net/tap-bsd.c:    fcntl(fd, F_SETFL, O_NONBLOCK);
> net/tap-linux.c:    fcntl(fd, F_SETFL, O_NONBLOCK);
> net/tap-solaris.c:    fcntl(fd, F_SETFL, O_NONBLOCK);
> tests/qtest/fuzz/virtio_net_fuzz.c:    fcntl(sockfds[0], F_SETFL,
> O_NONBLOCK);
> tests/tcg/multiarch/linux-test.c:    chk_error(fcntl(fds[0], F_SETFL,
> O_NONBLOCK));
> tests/tcg/multiarch/linux-test.c:    chk_error(fcntl(fds[1], F_SETFL,
> O_NONBLOCK));
> tests/unit/test-iov.c:       fcntl(sv[1], F_SETFL, O_RDWR|O_NONBLOCK);
> tests/unit/test-iov.c:       fcntl(sv[0], F_SETFL, O_RDWR|O_NONBLOCK);
> util/event_notifier-posix.c:        ret =3D fcntl_setfl(fds[0], O_NONBLOC=
K);
> util/event_notifier-posix.c:        ret =3D fcntl_setfl(fds[1], O_NONBLOC=
K);
> util/main-loop.c:    fcntl_setfl(sigfd, O_NONBLOCK);
> util/oslib-posix.c:    f =3D fcntl(fd, F_SETFL, f & ~O_NONBLOCK);
> util/oslib-posix.c:    if (fcntl(fd, F_SETFL, f | O_NONBLOCK) =3D=3D -1) =
{
>

As you may have guessed, the goal was to move fcntl_setfl() to block/, as
done in next patch.

It looks like other callers generally do more than just setting nonblock,
they need more careful review.


>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000007d7d8d05dd3a8c69
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 22, 2022 at 12:57 PM Da=
niel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@r=
edhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Fri, Apr 22, 2022 at 12:36:37PM +0400, <a href=3D"mailto:marc=
andre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a> =
wrote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; API available since glib 2.30. It also preserves errno.<br>
&gt; <br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 hw/misc/ivshmem.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-=
<br>
&gt;=C2=A0 util/event_notifier-posix.c | 6 ++----<br>
&gt;=C2=A0 util/main-loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-=
<br>
&gt;=C2=A0 3 files changed, 4 insertions(+), 6 deletions(-)<br>
<br>
There are many more places in QEMU setting O_NONBLOCK.<br>
<br>
$ git grep &#39;\bO_NONBLOCK&#39; | grep -i setfl<br>
hw/misc/ivshmem.c:=C2=A0 =C2=A0 fcntl_setfl(fd, O_NONBLOCK); /* msix/irqfd =
poll non block */<br>
hw/rdma/rdma_backend.c:=C2=A0 =C2=A0 rc =3D fcntl(backend_dev-&gt;channel-&=
gt;fd, F_SETFL, flags | O_NONBLOCK);<br>
linux-user/syscall.c:=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fcntl(fd, F_SETFL, O_N=
ONBLOCK | flags) =3D=3D -1) {<br>
net/tap-bsd.c:=C2=A0 =C2=A0 fcntl(fd, F_SETFL, O_NONBLOCK);<br>
net/tap-bsd.c:=C2=A0 =C2=A0 fcntl(fd, F_SETFL, O_NONBLOCK);<br>
net/tap-linux.c:=C2=A0 =C2=A0 fcntl(fd, F_SETFL, O_NONBLOCK);<br>
net/tap-solaris.c:=C2=A0 =C2=A0 fcntl(fd, F_SETFL, O_NONBLOCK);<br>
tests/qtest/fuzz/virtio_net_fuzz.c:=C2=A0 =C2=A0 fcntl(sockfds[0], F_SETFL,=
 O_NONBLOCK);<br>
tests/tcg/multiarch/linux-test.c:=C2=A0 =C2=A0 chk_error(fcntl(fds[0], F_SE=
TFL, O_NONBLOCK));<br>
tests/tcg/multiarch/linux-test.c:=C2=A0 =C2=A0 chk_error(fcntl(fds[1], F_SE=
TFL, O_NONBLOCK));<br>
tests/unit/test-iov.c:=C2=A0 =C2=A0 =C2=A0 =C2=A0fcntl(sv[1], F_SETFL, O_RD=
WR|O_NONBLOCK);<br>
tests/unit/test-iov.c:=C2=A0 =C2=A0 =C2=A0 =C2=A0fcntl(sv[0], F_SETFL, O_RD=
WR|O_NONBLOCK);<br>
util/event_notifier-posix.c:=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D fcntl_setfl=
(fds[0], O_NONBLOCK);<br>
util/event_notifier-posix.c:=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D fcntl_setfl=
(fds[1], O_NONBLOCK);<br>
util/main-loop.c:=C2=A0 =C2=A0 fcntl_setfl(sigfd, O_NONBLOCK);<br>
util/oslib-posix.c:=C2=A0 =C2=A0 f =3D fcntl(fd, F_SETFL, f &amp; ~O_NONBLO=
CK);<br>
util/oslib-posix.c:=C2=A0 =C2=A0 if (fcntl(fd, F_SETFL, f | O_NONBLOCK) =3D=
=3D -1) {<br></blockquote><div><br></div><div>As you may have guessed, the =
goal was to move fcntl_setfl() to block/, as done in next patch.</div><div>=
<br></div><div>It looks like other callers generally do more than just sett=
ing nonblock, they need more careful review.<br></div><div> <br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
With regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer" target=3D"_blank">ht=
tps://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"http=
s://www.flickr.com/photos/dberrange" rel=3D"noreferrer" target=3D"_blank">h=
ttps://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer" target=3D"_blank">htt=
ps://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com" rel=3D"n=
oreferrer" target=3D"_blank">https://fstop138.berrange.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer" target=3D"_bla=
nk">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D=
"https://www.instagram.com/dberrange" rel=3D"noreferrer" target=3D"_blank">=
https://www.instagram.com/dberrange</a> :|<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000007d7d8d05dd3a8c69--

