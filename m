Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7808C6FF006
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 12:39:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px3gd-0004K4-4k; Thu, 11 May 2023 06:38:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tmaillart@freebox.fr>)
 id 1px3ga-0004IO-As
 for qemu-devel@nongnu.org; Thu, 11 May 2023 06:38:12 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tmaillart@freebox.fr>)
 id 1px3gX-00082Q-SB
 for qemu-devel@nongnu.org; Thu, 11 May 2023 06:38:12 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-50bd37ca954so77921629a12.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 03:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20221208.gappssmtp.com; s=20221208; t=1683801487; x=1686393487;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DFlaOkDPlssiUIHhQjwBIJWmaDqgVsQ8QBxGd8sNxP8=;
 b=TbxaoVv8GP8Vj0G9uYxy/c3emac6U7X4hi3Oh/BbrIOm8lJ1CkpnZ1Sj9+/HMfXLg6
 Z0X8kSQooVYrpsLr8e6qiettrosaztpSKXoIYTvu6uyea78k4wKyMMYga+qeZH5ulxUy
 xXK93/rD/V/S7MSwtFgxrb3nTgxJkBAgwnoW0P6WcqfAC9oX6TtiggPkKN5ToMm2bSQi
 a6l+m8hnY8v0xSz3aeCTqqQwnkwofCp+R0a49wZ+Z47tiV4CK0Ua64ErGjEwXJOh8ajn
 aqgBGz3De8l7VvUNKK6pzm0khAcz1VqbDhIa2axcCxCyiwpBypIMaXQuuzVzN5X6AXwo
 HV6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683801487; x=1686393487;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DFlaOkDPlssiUIHhQjwBIJWmaDqgVsQ8QBxGd8sNxP8=;
 b=cBU3gLL8RNbo/FqCmS5Fj1mECRPXaunQSDCDKgzjczb9J4oUviLQeYGHEsJs4RFiaA
 q99PbZ6KA6e+eB7e0+yjsiyqO+Ane2vp/Mogi2LZQZgQ3/ZGi3cNWK8RvQs69FwS2sby
 JpZd1PZ94BadkX5aXt2zqS1CCLPvzrNyzM9HZsr/LHPq6wKwBdV5XFQ3ueCJuNZ/m58V
 NJIh2JkXpr/CreqxdsDgu6PmvSEIFe+aEoNt4qz2NQNKdxagjsxpFgMziMI+QMWMsHhX
 +MD1tO6sZgHjISV+AE483zsy7wobjvHap5bgP/M7dUlb7vQ/5r4WNg13IERWQHpI9AYx
 yqgw==
X-Gm-Message-State: AC+VfDz7XuHVupbabX1uLuwOFQHInRAw4zA1uY+LXgzmcOEQCfgAJYKb
 GrDXpGerhDndFeCqqKG5Lqh5avxIglu6E/DugWSjt4YIwrdUm2mXZXk=
X-Google-Smtp-Source: ACHHUZ5RShUutc97kx9JS94XT/pIG8GtWddO8HMPKyNjI6lqiqwf1fu7YQ2ukvy82TygcQ28SEpTvqrwll/J5O5wTF0=
X-Received: by 2002:a17:907:6e06:b0:969:c354:7d9a with SMTP id
 sd6-20020a1709076e0600b00969c3547d9amr8791896ejc.12.1683801486805; Thu, 11
 May 2023 03:38:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230426133747.403945-1-tmaillart@freebox.fr>
 <62e34905-91fc-6498-d228-faa37b26fd60@redhat.com>
In-Reply-To: <62e34905-91fc-6498-d228-faa37b26fd60@redhat.com>
From: =?UTF-8?Q?Th=C3=A9o_Maillart?= <tmaillart@freebox.fr>
Date: Thu, 11 May 2023 12:37:55 +0200
Message-ID: <CANDNypxOsD_HLC1Ad_MrGqUizsHgDmBv+zH3yEU6X=BXfNRi=w@mail.gmail.com>
Subject: Re: [PATCH] scsi: check inquiry buffer length to prevent crash
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000007e605f05fb68955b"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=tmaillart@freebox.fr; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--0000000000007e605f05fb68955b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 10, 2023 at 6:11=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com>=
 wrote:

> On 4/26/23 15:37, Th=C3=A9o Maillart wrote:
> > --- a/hw/scsi/scsi-generic.c
> > +++ b/hw/scsi/scsi-generic.c
> > @@ -191,7 +191,7 @@ static int scsi_handle_inquiry_reply(SCSIGenericReq
> *r, SCSIDevice *s, int len)
> >       if ((s->type =3D=3D TYPE_DISK || s->type =3D=3D TYPE_ZBC) &&
> >           (r->req.cmd.buf[1] & 0x01)) {
> >           page =3D r->req.cmd.buf[2];
> > -        if (page =3D=3D 0xb0) {
> > +        if (page =3D=3D 0xb0 && r->buflen >=3D 12) {
> >               uint64_t max_transfer =3D calculate_max_transfer(s);
> >               stl_be_p(&r->buf[8], max_transfer);
> >               /* Also take care of the opt xfer len. */
> > --
>
> This is not enough because right below there is a store of bytes 12..15.
>

I agree with you, I was wrong, the test should be r->buflen >=3D 16


> The best thing to do is to:
>
> 1) do the stores in an "uint8_t buf[8]" on the stack, followed by a
> memcpy to r->buf + 8.
>
> 2) add "&& r->buflen > 8" to the condition similar to what you've done
> above.
>

But I don't think this suggestion is necessary, it would basically do the
same
thing that is done in the current version adding an extra memcpy on the
stack.

In my opinion the only problem highlighted by this crash is that of writing
byte
8 to 15 while the buffer size is 4.

--0000000000007e605f05fb68955b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, May 10, 2023 at 6:11=E2=80=AFPM Paolo Bonzini &lt;<a href=3D=
"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On 4/26/23 15:37, Th=C3=A9o=
 Maillart wrote:<br>
&gt; --- a/hw/scsi/scsi-generic.c<br>
&gt; +++ b/hw/scsi/scsi-generic.c<br>
&gt; @@ -191,7 +191,7 @@ static int scsi_handle_inquiry_reply(SCSIGenericRe=
q *r, SCSIDevice *s, int len)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((s-&gt;type =3D=3D TYPE_DISK || s-&gt;ty=
pe =3D=3D TYPE_ZBC) &amp;&amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(r-&gt;req.cmd.buf[1] &amp; 0x=
01)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0page =3D r-&gt;req.cmd.buf[2];=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (page =3D=3D 0xb0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (page =3D=3D 0xb0 &amp;&amp; r-&gt;buf=
len &gt;=3D 12) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t max_tra=
nsfer =3D calculate_max_transfer(s);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stl_be_p(&amp;r-=
&gt;buf[8], max_transfer);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Also take car=
e of the opt xfer len. */<br>
&gt; -- <br>
<br>
This is not enough because right below there is a store of bytes 12..15.<br=
></blockquote><div><br></div><div>I agree with you, I was wrong, the test s=
hould be r-&gt;buflen &gt;=3D 16<br></div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
The best thing to do is to:<br>
<br>
1) do the stores in an &quot;uint8_t buf[8]&quot; on the stack, followed by=
 a <br>
memcpy to r-&gt;buf + 8.<br>
<br>
2) add &quot;&amp;&amp; r-&gt;buflen &gt; 8&quot; to the condition similar =
to what you&#39;ve done <br>
above.<br></blockquote><div><br></div>But I don&#39;t think this suggestion=
 is necessary, it would basically do the same</div><div class=3D"gmail_quot=
e">thing that is done in the current version adding an extra memcpy on the =
stack.</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote"=
>In my opinion the only problem highlighted by this crash is that of writin=
g byte</div><div class=3D"gmail_quote">8 to 15 while the buffer size is 4.<=
br></div></div>

--0000000000007e605f05fb68955b--

