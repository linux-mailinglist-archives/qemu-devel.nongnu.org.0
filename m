Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A573A87EA
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 19:43:52 +0200 (CEST)
Received: from localhost ([::1]:39112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltD6N-0003s0-Sy
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 13:43:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ltD4d-0001cY-VT
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:42:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ltD4a-0004Aw-OI
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:42:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623778920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=10nR8CR6ExLuDjTBOo9KleVKa/a2UHKpqK/FlwUcOW8=;
 b=c44+8VzjADv1znpc+VoEwyrJsceS0/nUArr78qr5G33rmvL+kWP7D/y1w3pzNE34uSuSiX
 P1ui4nXxqTVk1emmDH/HdBlUMNFJYWMy4miTeyHFScUsH+j6m86S364u4BcdqRLSTaKWf7
 cRYwIF8yWbychpyX74A+VNzHxvDCtl4=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-hO-i0UefMwG_1N5pe6USiA-1; Tue, 15 Jun 2021 13:41:58 -0400
X-MC-Unique: hO-i0UefMwG_1N5pe6USiA-1
Received: by mail-pg1-f198.google.com with SMTP id
 q12-20020a65684c0000b029022094918bbfso9272257pgt.2
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 10:41:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=10nR8CR6ExLuDjTBOo9KleVKa/a2UHKpqK/FlwUcOW8=;
 b=ZggXZWbY1lnRqh8a17lao7iKa58Lz4b7vIBCUAIbd4OORLA8ZtVIxVKRmOUn91ZRle
 teaE1QQLxMVFMLUQ4QCez2EoH5BWDjN13ko8MloVO358RfeNU6u61AvwTneXr+Ys2I/N
 sB8rvefQLURD94AcYpND9C5TBVFif6zWAODX0mUkRakoUo7m0aV1GhnOgDyqHcueleHK
 0fxMWKA3oGXY5g+cxYcNc0FNCdAaxYW3inrg1fOjMkTbyWW1rzPBSJ+1v+e5f0qHvxj7
 L5Y5q+/gX+jMQXTlbUEsTKetf92FncnRY7qpxRJzCEkK6A6GZMrXflxwd3I6rwrq1jsV
 dNxg==
X-Gm-Message-State: AOAM533kIZ+N1bOtflk0Iay+QM0VVKYa4o3XbBH68ewG484i67UMmogO
 FPLl/9/t9IYI/AcvYolTI9XCxsS7TqDxmF1DXKbHKZZMPKPTAus7iCZ+LtBXIu/s9m6mqekkQze
 i6Jh2Aa21e7wHXbLQPGOoYcv7EqCM4Nc=
X-Received: by 2002:a63:3e4e:: with SMTP id l75mr700093pga.10.1623778917718;
 Tue, 15 Jun 2021 10:41:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhDFbtP1dXwKp40cpX4AOqDhIwCvQ/F7o2JO76daDAFUSkXW6LgrXgJnmD0JTyxJ2OUZ0gt5KJRZ92KXE6s/g=
X-Received: by 2002:a63:3e4e:: with SMTP id l75mr700073pga.10.1623778917415;
 Tue, 15 Jun 2021 10:41:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210603133722.218465-1-pbonzini@redhat.com>
 <20210603133722.218465-3-pbonzini@redhat.com>
 <77e6386a-8070-dede-1598-bd397464ef78@redhat.com>
In-Reply-To: <77e6386a-8070-dede-1598-bd397464ef78@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 15 Jun 2021 19:41:45 +0200
Message-ID: <CABgObfYDxXMx7GWLQu7PymFm3aDuLeDcGtqSeGXpHQgBScPERg@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] scsi-generic: pass max_segments via max_iov field
 in BlockLimits
To: Max Reitz <mreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000911d4705c4d17dba"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Wolf, Kevin" <kwolf@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000911d4705c4d17dba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, I try to avoid the 90 character limit (though sometimes that's hard
too, hello QOM) but I don't think much of the lower one.

Paolo

Il mar 15 giu 2021, 18:20 Max Reitz <mreitz@redhat.com> ha scritto:

> On 03.06.21 15:37, Paolo Bonzini wrote:
> > I/O to a disk via read/write is not limited by the number of segments
> allowed
> > by the host adapter; the kernel can split requests if needed, and the
> limit
> > imposed by the host adapter can be very low (256k or so) to avoid that
> SG_IO
> > returns EINVAL if memory is heavily fragmented.
> >
> > Since this value is only interesting for SG_IO-based I/O, do not includ=
e
> > it in the max_transfer and only take it into account when patching the
> > block limits VPD page in the scsi-generic device.
> >
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > ---
> >   block/file-posix.c     | 3 +--
> >   hw/scsi/scsi-generic.c | 6 ++++--
> >   2 files changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/block/file-posix.c b/block/file-posix.c
> > index 58db526cc2..e3241a0dd3 100644
> > --- a/block/file-posix.c
> > +++ b/block/file-posix.c
> > @@ -1239,8 +1239,7 @@ static void raw_refresh_limits(BlockDriverState
> *bs, Error **errp)
> >
> >           ret =3D sg_get_max_segments(s->fd);
> >           if (ret > 0) {
> > -            bs->bl.max_transfer =3D MIN(bs->bl.max_transfer,
> > -                                      ret * qemu_real_host_page_size);
> > +            bs->bl.max_iov =3D ret;
> >           }
> >       }
> >
> > diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
> > index 98c30c5d5c..82e1e2ee79 100644
> > --- a/hw/scsi/scsi-generic.c
> > +++ b/hw/scsi/scsi-generic.c
> > @@ -179,10 +179,12 @@ static void
> scsi_handle_inquiry_reply(SCSIGenericReq *r, SCSIDevice *s)
> >           (r->req.cmd.buf[1] & 0x01)) {
> >           page =3D r->req.cmd.buf[2];
> >           if (page =3D=3D 0xb0) {
> > -            uint32_t max_transfer =3D
> > -                blk_get_max_transfer(s->conf.blk) / s->blocksize;
> > +            uint32_t max_transfer =3D blk_get_max_transfer(s->conf.blk=
);
> > +            uint32_t max_iov =3D blk_get_max_iov(s->conf.blk);
> >
> >               assert(max_transfer);
> > +            max_transfer =3D MIN_NON_ZERO(max_transfer, max_iov *
> qemu_real_host_page_size)
> > +                / s->blocksize;
>
> Now that I ran checkpatch for patch 3, I saw that it complains about
> this line being longer than 80 characters. I think it could be split so
> it doesn=E2=80=99t exceed that limit. It looks a bit like you intentional=
ly
> exceeded the warning limit, but didn=E2=80=99t exceed the error limit (of=
 90).
> Is that so?
>
> Max
>
>

--000000000000911d4705c4d17dba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Yes, I try to avoid the 90 character limit (though someti=
mes that&#39;s hard too, hello QOM) but I don&#39;t think much of the lower=
 one.<div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Il mar 15 giu=
 2021, 18:20 Max Reitz &lt;<a href=3D"mailto:mreitz@redhat.com">mreitz@redh=
at.com</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 03.06=
.21 15:37, Paolo Bonzini wrote:<br>
&gt; I/O to a disk via read/write is not limited by the number of segments =
allowed<br>
&gt; by the host adapter; the kernel can split requests if needed, and the =
limit<br>
&gt; imposed by the host adapter can be very low (256k or so) to avoid that=
 SG_IO<br>
&gt; returns EINVAL if memory is heavily fragmented.<br>
&gt;<br>
&gt; Since this value is only interesting for SG_IO-based I/O, do not inclu=
de<br>
&gt; it in the max_transfer and only take it into account when patching the=
<br>
&gt; block limits VPD page in the scsi-generic device.<br>
&gt;<br>
&gt; Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com=
" target=3D"_blank" rel=3D"noreferrer">pbonzini@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0block/file-posix.c=C2=A0 =C2=A0 =C2=A0| 3 +--<br>
&gt;=C2=A0 =C2=A0hw/scsi/scsi-generic.c | 6 ++++--<br>
&gt;=C2=A0 =C2=A02 files changed, 5 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/block/file-posix.c b/block/file-posix.c<br>
&gt; index 58db526cc2..e3241a0dd3 100644<br>
&gt; --- a/block/file-posix.c<br>
&gt; +++ b/block/file-posix.c<br>
&gt; @@ -1239,8 +1239,7 @@ static void raw_refresh_limits(BlockDriverState =
*bs, Error **errp)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D sg_get_max_segments(s-=
&gt;fd);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &gt; 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bs-&gt;bl.max_transfer =3D =
MIN(bs-&gt;bl.max_transfer,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret * qemu_=
real_host_page_size);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bs-&gt;bl.max_iov =3D ret;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c<br>
&gt; index 98c30c5d5c..82e1e2ee79 100644<br>
&gt; --- a/hw/scsi/scsi-generic.c<br>
&gt; +++ b/hw/scsi/scsi-generic.c<br>
&gt; @@ -179,10 +179,12 @@ static void scsi_handle_inquiry_reply(SCSIGeneri=
cReq *r, SCSIDevice *s)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(r-&gt;req.cmd.buf[1] &amp; 0x=
01)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0page =3D r-&gt;req.cmd.buf[2];=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (page =3D=3D 0xb0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t max_transfer =3D<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 blk_get_max_t=
ransfer(s-&gt;conf.blk) / s-&gt;blocksize;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t max_transfer =3D b=
lk_get_max_transfer(s-&gt;conf.blk);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t max_iov =3D blk_ge=
t_max_iov(s-&gt;conf.blk);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(max_trans=
fer);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 max_transfer =3D MIN_NON_ZE=
RO(max_transfer, max_iov * qemu_real_host_page_size)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 / s-&gt;block=
size;<br>
<br>
Now that I ran checkpatch for patch 3, I saw that it complains about <br>
this line being longer than 80 characters. I think it could be split so <br=
>
it doesn=E2=80=99t exceed that limit. It looks a bit like you intentionally=
 <br>
exceeded the warning limit, but didn=E2=80=99t exceed the error limit (of 9=
0). <br>
Is that so?<br>
<br>
Max<br>
<br>
</blockquote></div>

--000000000000911d4705c4d17dba--


