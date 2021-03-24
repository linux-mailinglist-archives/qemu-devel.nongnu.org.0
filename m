Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2AF347CFC
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 16:51:08 +0100 (CET)
Received: from localhost ([::1]:35248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP5mk-0008Lf-BY
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 11:51:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1lP5lX-0007pN-JP
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 11:49:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1lP5lU-00041h-QH
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 11:49:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616600987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r4pVuzwSYpvSLXjfxjbaDnjZ4sq/UfKDTT59747Ayt8=;
 b=ckicrnaflPp/1Nrr3kpgmnGZgxM1wnEPPCTWQm07MAQ0777ovNvsXJ0n6PROhSDOpftOq2
 QU3knL3Q53pb5agAO1UJZ91p9nn8JvyhvqdcnFFXiydABNhLDOAqhEMf+lSBUCEYuRh0m9
 grC+ygpIhbjgIEW+BUYmpynGAFXQq1s=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-vsT06YcxOaGvwStzVyf8FQ-1; Wed, 24 Mar 2021 11:49:45 -0400
X-MC-Unique: vsT06YcxOaGvwStzVyf8FQ-1
Received: by mail-oo1-f69.google.com with SMTP id c199so1474831oob.18
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 08:49:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r4pVuzwSYpvSLXjfxjbaDnjZ4sq/UfKDTT59747Ayt8=;
 b=F39Vq28jNs9fJOlKMG4gpsO18em6eo4mfTCKARrc4iznN/r/NzNVgdW2Wkj6M4Kj8B
 kyl0LKmQdRgN/T1wlFerUJMphJoIdn2N3GNaVdHAkOq2bQ5DAsj2uHve5IuYWYdNEu3f
 7qfA7uSOH3zZhgWuZgoWS6yw6HW/8kg9irbroaoqlt7sSVkTyD7dstS/lrMAK0jTNvwe
 DDEZjzFgr0dYilQdVKPqOxX0MG39FCqu4xlllgAIen4biy5wYzw2i8LQTvhgZ8WlnYTt
 6VyK4uMoxDEZWZvghCHYcVzBUPIp/0ydvDRPfJ2NSbZcYMe+C2IWbynZB8pCnNNZMBOC
 uBsw==
X-Gm-Message-State: AOAM531grvF/t2FU0ryp+GA1jNZoIJq6fNEhBca00RIolA6coQamxnLn
 LkWfAB2eTkFHP8u/AO/9yHqMV4w1v3JLY5joWSn9fawbKilky9CczWMV1IKuFwvWpdEfNAvsihT
 rqcIHcEjAbRnSa3Ig12DIRJQyqH/KVrI=
X-Received: by 2002:aca:484e:: with SMTP id v75mr2914785oia.56.1616600983663; 
 Wed, 24 Mar 2021 08:49:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxivIzG+fEQVsHC8fBN84SWpaoRC+ngCiNhWDd8sxW3yU/ejZMHhIkrwv2DkA0tlkifKpduuevvEczd0PvLQY=
X-Received: by 2002:aca:484e:: with SMTP id v75mr2914764oia.56.1616600983391; 
 Wed, 24 Mar 2021 08:49:43 -0700 (PDT)
MIME-Version: 1.0
References: <2021032217253258728710@chinatelecom.cn>
 <0b01a688-f86b-0888-2c03-f4d55273b93f@redhat.com>
In-Reply-To: <0b01a688-f86b-0888-2c03-f4d55273b93f@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Wed, 24 Mar 2021 17:49:27 +0200
Message-ID: <CAMRbyysT_s+AkskuAGvT7wXOQ+LaX3OkSYTo4UxtYKqE0cjBMg@mail.gmail.com>
Subject: Re: [PATCH V4] file-posix: allow -EBUSY error during ioctl(fd,
 BLKZEROOUT, range) on block
To: Max Reitz <mreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsoffer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000005be50605be4a3fb5"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: ChangLimin <changlm@chinatelecom.cn>, kwolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005be50605be4a3fb5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 24, 2021 at 4:52 PM Max Reitz <mreitz@redhat.com> wrote:

> On 22.03.21 10:25, ChangLimin wrote:
> > For Linux 5.10/5.11, qemu write zeros to a multipath device using
> > ioctl(fd, BLKZEROOUT, range) with cache none or directsync return -EBUS=
Y
> > permanently.
>
> So as far as I can track back the discussion, Kevin asked on v1 why we=E2=
=80=99d
> set has_write_zeroes to false, i.e. whether the EBUSY might not go away
> at some point, and if it did, whether we shouldn=E2=80=99t retry BLKZEROO=
UT then.
> You haven=E2=80=99t explicitly replied to that question (as far as I can =
see),
> so it kind of still stands.
>
> Implicitly, there are two conflicting answers in this patch: On one
> hand, the commit message says =E2=80=9Cpermanently=E2=80=9D, and this is =
what you told
> Nir as a realistic case where this can occur.


I'm afraid ChangLimin did not answer my question. I'm looking for real
world used case when qemu cannot write zeros to multipath device, when
nobody else is using the device.

I tried to reproduce this on Fedora (kernel 5.10) with qemu-img convert,
once with a multipath device, and once with logical volume on a vg created
on the multipath device, and I could not reproduce this issue.

If I understand the kernel change correctly, this can happen when there is
a mounted file system on top of the multipath device. I don't think we have
a use case when qemu accesses a multipath device when the device is used
by a file system, but maybe I missed something.


> So that to me implies
> that we actually should not retry BLKZEROOUT, because the EBUSY will
> remain, and that condition won=E2=80=99t change while the block device is=
 in use
> by qemu.
>
> On the other hand, in the code, you have decided not to reset
> has_write_zeroes to false, so the implementation will retry.
>

EBUSY is usually a temporary error, so retrying makes sense. The question
is if we really can write zeroes manually in this case?


> So I don=E2=80=99t quite understand.  Should we keep trying BLKZEROOUT or=
 is
> there no chance of it working after it has at one point failed with
> EBUSY?  (Are there other cases besides what=E2=80=99s described in this c=
ommit
> message where EBUSY might be returned and it is only temporary?)
>
> > Fallback to pwritev instead of exit for -EBUSY error.
> >
> > The issue was introduced in Linux 5.10:
> >
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?=
id=3D384d87ef2c954fc58e6c5fd8253e4a1984f5fe02
> >
> > Fixed in Linux 5.12:
> >
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D56887cffe946bb0a90c74429fa94d6110a73119d
> >
> > Signed-off-by: ChangLimin <changlm@chinatelecom.cn>
> > ---
> >   block/file-posix.c | 8 ++++++--
> >   1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/block/file-posix.c b/block/file-posix.c
> > index 20e14f8e96..d4054ac9cb 100644
> > --- a/block/file-posix.c
> > +++ b/block/file-posix.c
> > @@ -1624,8 +1624,12 @@ static ssize_t
> > handle_aiocb_write_zeroes_block(RawPosixAIOData *aiocb)
> >           } while (errno =3D=3D EINTR);
> >
> >           ret =3D translate_err(-errno);
> > -        if (ret =3D=3D -ENOTSUP) {
> > -            s->has_write_zeroes =3D false;
> > +        switch (ret) {
> > +        case -ENOTSUP:
> > +            s->has_write_zeroes =3D false; /* fall through */
> > +        case -EBUSY: /* Linux 5.10/5.11 may return -EBUSY for multipat=
h
> > devices */
> > +            return -ENOTSUP;
> > +            break;
>
> (Not sure why this break is here.)
>
> Max
>
> >           }
> >       }
> >   #endif
> > --
> > 2.27.0
> >
>
>
>

--0000000000005be50605be4a3fb5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Mar 24, 2021 at 4:52 PM Max Reitz=
 &lt;<a href=3D"mailto:mreitz@redhat.com">mreitz@redhat.com</a>&gt; wrote:<=
br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On 22.03.21 10:25, ChangLimin wrote:<br>
&gt; For Linux 5.10/5.11, qemu write zeros to a multipath device using<br>
&gt; ioctl(fd, BLKZEROOUT, range) with cache none or directsync return -EBU=
SY<br>
&gt; permanently.<br>
<br>
So as far as I can track back the discussion, Kevin asked on v1 why we=E2=
=80=99d <br>
set has_write_zeroes to false, i.e. whether the EBUSY might not go away <br=
>
at some point, and if it did, whether we shouldn=E2=80=99t retry BLKZEROOUT=
 then.<br>
You haven=E2=80=99t explicitly replied to that question (as far as I can se=
e), <br>
so it kind of still stands.<br>
<br>
Implicitly, there are two conflicting answers in this patch: On one <br>
hand, the commit message says =E2=80=9Cpermanently=E2=80=9D, and this is wh=
at you told <br>
Nir as a realistic case where this can occur.=C2=A0 </blockquote><div><br><=
/div><div>I&#39;m afraid ChangLimin did not answer my question. I&#39;m loo=
king for real</div><div>world used case when qemu cannot write zeros to mul=
tipath device, when</div><div>nobody else is using the device.</div><div><b=
r></div><div>I tried to reproduce this on Fedora (kernel 5.10) with qemu-im=
g convert,</div><div>once with a multipath device, and once with logical vo=
lume on a vg created</div><div>on the multipath device, and I could not rep=
roduce this issue.</div><div><br></div><div>If I understand the kernel chan=
ge correctly, this can happen when there is</div><div>a mounted file system=
 on top of the multipath device. I don&#39;t think we have=C2=A0</div><div>=
a use case when qemu accesses a multipath device when the device is used</d=
iv><div>by a file system, but maybe I missed something.</div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">So that to me implies =
<br>
that we actually should not retry BLKZEROOUT, because the EBUSY will <br>
remain, and that condition won=E2=80=99t change while the block device is i=
n use <br>
by qemu.<br>
<br>
On the other hand, in the code, you have decided not to reset <br>
has_write_zeroes to false, so the implementation will retry.<br></blockquot=
e><div><br></div><div>EBUSY is usually a temporary error, so retrying makes=
 sense. The question</div><div>is if we really can write zeroes manually in=
 this case?</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
So I don=E2=80=99t quite understand.=C2=A0 Should we keep trying BLKZEROOUT=
 or is <br>
there no chance of it working after it has at one point failed with <br>
EBUSY?=C2=A0 (Are there other cases besides what=E2=80=99s described in thi=
s commit <br>
message where EBUSY might be returned and it is only temporary?)<br>
<br>
&gt; Fallback to pwritev instead of exit for -EBUSY error.<br>
&gt; <br>
&gt; The issue was introduced in Linux 5.10:<br>
&gt; <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/stable/linu=
x.git/commit/?id=3D384d87ef2c954fc58e6c5fd8253e4a1984f5fe02" rel=3D"norefer=
rer" target=3D"_blank">https://git.kernel.org/pub/scm/linux/kernel/git/stab=
le/linux.git/commit/?id=3D384d87ef2c954fc58e6c5fd8253e4a1984f5fe02</a><br>
&gt; <br>
&gt; Fixed in Linux 5.12:<br>
&gt; <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/li=
nux.git/commit/?id=3D56887cffe946bb0a90c74429fa94d6110a73119d" rel=3D"noref=
errer" target=3D"_blank">https://git.kernel.org/pub/scm/linux/kernel/git/to=
rvalds/linux.git/commit/?id=3D56887cffe946bb0a90c74429fa94d6110a73119d</a><=
br>
&gt; <br>
&gt; Signed-off-by: ChangLimin &lt;<a href=3D"mailto:changlm@chinatelecom.c=
n" target=3D"_blank">changlm@chinatelecom.cn</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0block/file-posix.c | 8 ++++++--<br>
&gt;=C2=A0 =C2=A01 file changed, 6 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/block/file-posix.c b/block/file-posix.c<br>
&gt; index 20e14f8e96..d4054ac9cb 100644<br>
&gt; --- a/block/file-posix.c<br>
&gt; +++ b/block/file-posix.c<br>
&gt; @@ -1624,8 +1624,12 @@ static ssize_t <br>
&gt; handle_aiocb_write_zeroes_block(RawPosixAIOData *aiocb)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} while (errno =3D=3D EINTR);<=
br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D translate_err(-errno);=
<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret =3D=3D -ENOTSUP) {<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;has_write_zeroes =3D =
false;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (ret) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0case -ENOTSUP:<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;has_write_zeroes =3D =
false; /* fall through */<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0case -EBUSY: /* Linux 5.10/5.11 may retur=
n -EBUSY for multipath <br>
&gt; devices */<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOTSUP;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
<br>
(Not sure why this break is here.)<br>
<br>
Max<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0#endif<br>
&gt; --<br>
&gt; 2.27.0<br>
&gt; <br>
<br>
<br>
</blockquote></div></div>

--0000000000005be50605be4a3fb5--


