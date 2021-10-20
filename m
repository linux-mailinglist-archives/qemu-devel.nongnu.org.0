Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0B8435040
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 18:34:58 +0200 (CEST)
Received: from localhost ([::1]:34220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdEYK-00083I-KY
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 12:34:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mdEWW-0007GH-Ru
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 12:33:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mdEWS-00082s-JG
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 12:33:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634747578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=giK5JKMf4Yqa2+29CFg6zW7AukDEJ/YuSS1yvXMRu4E=;
 b=C6DQrkCU2gfjzc8kp1Zv+oJF8zcsdPcCu/0OSd7/wvCcnFNM9aE3MDFJwqfL9NueRrxViO
 WojT3Dkzm9ol9tUgpE27yxI0PECxIOzSVx9gc3A1ikfwc2VnBi/Dr8JUPr5Toq3GIEdfVk
 ObtkRs83UbxWRjgHA05hCtoQAn+9cgA=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-JTT7SvDZNyaeT17yyz8JHA-1; Wed, 20 Oct 2021 12:32:57 -0400
X-MC-Unique: JTT7SvDZNyaeT17yyz8JHA-1
Received: by mail-ua1-f69.google.com with SMTP id
 y31-20020a9f3262000000b002ca2fd8179eso2023143uad.7
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 09:32:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=giK5JKMf4Yqa2+29CFg6zW7AukDEJ/YuSS1yvXMRu4E=;
 b=Q15cKeKltTnit5IQTYEXnGxPBrFBC+rNwxSbb+lgnqD0k5mEtAnM7ltRQJrzQAsuMJ
 n9pY76CqiOeZKvjTXOuLB/AY0/Q6YFQszlKmIwr+3v4YQkL9XZN8gTKb09T3/F/1AQjC
 DRKgOSViaXKkZ+RZ/VzGX5zEAkicOaXqCp/qjnGF96jiz0nCo1cG5BT4i5ZiD1groS4k
 51kgrlt8rx4ZuDrobASjegZKN+Bbi42KLuWhmLYfRe824rmgwIo5WhtllTq3LMcPIiji
 PY/Fq8rFa/0nAhYmB1eO2M8/mf/4kAA/zayy0dMRDQrK8DR/bR0VGuTVirE0gfhHmTAC
 D3Fw==
X-Gm-Message-State: AOAM5308BYCyv7oCVLRTA5ntGmttgS0viIDxzsAvA2aUUnzL1r5lcC2Y
 PH+TXF2jweTeU+pBP7O8s7sMwwvFRb3uIXTC+EMS3ahDrskKZ4h4ugA7LUHUzm3yGYNoJ++8nvX
 8Wf01iD8/qnrXyPCga7tW5lH9bPXs0jw=
X-Received: by 2002:a67:f70a:: with SMTP id m10mr281126vso.40.1634747574659;
 Wed, 20 Oct 2021 09:32:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyb1SuqyKsH6chzTYVAk7eamdBSFHL217pp06LR5d3w8lSvAjl4jHOWVdwLcKIxp872YRPgBJkYGO2kHMVQoVA=
X-Received: by 2002:a67:f70a:: with SMTP id m10mr280863vso.40.1634747573057;
 Wed, 20 Oct 2021 09:32:53 -0700 (PDT)
MIME-Version: 1.0
References: <20211018014059.13E65746353@zero.eik.bme.hu>
 <549ece11-990f-a19b-5dfe-508e315a6163@amsat.org>
 <a36736da-32a0-84fe-f33-32b2f31126bf@eik.bme.hu>
 <31027ddc-b618-9628-d725-1516f7bfd098@amsat.org>
 <20211020143626.dvthmwizsljuwqz4@habkost.net>
 <b1447f19-7bb3-c070-abd9-bfcc7c94aa84@eik.bme.hu>
 <20211020151824.ecl3etam425diyli@habkost.net>
In-Reply-To: <20211020151824.ecl3etam425diyli@habkost.net>
From: John Snow <jsnow@redhat.com>
Date: Wed, 20 Oct 2021 12:32:42 -0400
Message-ID: <CAFn=p-YxcDADgfsrHdb1pNgreLmsLO1r2uSwMRC4BdLJLvA2pw@mail.gmail.com>
Subject: Re: [PATCH] via-ide: Avoid expensive operations in irq handler
To: Eduardo Habkost <ehabkost@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000063d51605cecb541c"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000063d51605cecb541c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 20, 2021 at 11:18 AM Eduardo Habkost <ehabkost@redhat.com>
wrote:

> On Wed, Oct 20, 2021 at 04:58:58PM +0200, BALATON Zoltan wrote:
> > On Wed, 20 Oct 2021, Eduardo Habkost wrote:
> > > On Mon, Oct 18, 2021 at 12:10:04PM +0200, Philippe Mathieu-Daud=C3=A9=
 wrote:
> > > > On 10/18/21 11:51, BALATON Zoltan wrote:
> > > > > On Mon, 18 Oct 2021, Philippe Mathieu-Daud=C3=A9 wrote:
> > > > > > On 10/18/21 03:36, BALATON Zoltan wrote:
> > > > > > > Cache the pointer to PCI function 0 (ISA bridge, that this ID=
E
> device
> > > > > > > has to use for IRQs) in the PCIIDEState and pass that as the
> opaque
> > > > > > > data for the interrupt handler to eliminate both the need to
> look up
> > > > > > > function 0 at every interrupt and also a QOM type cast of the
> opaque
> > > > > > > pointer as that's also expensive (mainly due to qom-debug bei=
ng
> > > > > > > enabled by default).
> > > > > > >
> > > > > > > Suggested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > > > > > > Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> > > > > > > ---
> > > > > > >  hw/ide/via.c         | 11 ++++++-----
> > > > > > >  include/hw/ide/pci.h |  1 +
> > > > > > >  2 files changed, 7 insertions(+), 5 deletions(-)
> > > > > > >
> > > > > > > diff --git a/hw/ide/via.c b/hw/ide/via.c
> > > > > > > index 82def819c4..30566bc409 100644
> > > > > > > --- a/hw/ide/via.c
> > > > > > > +++ b/hw/ide/via.c
> > > > > > > @@ -104,15 +104,15 @@ static void bmdma_setup_bar(PCIIDEState
> *d)
> > > > > > >
> > > > > > >  static void via_ide_set_irq(void *opaque, int n, int level)
> > > > > > >  {
> > > > > > > -    PCIDevice *d =3D PCI_DEVICE(opaque);
> > > > > > > +    PCIIDEState *d =3D opaque;
> > > > > > >
> > > > > > >      if (level) {
> > > > > > > -        d->config[0x70 + n * 8] |=3D 0x80;
> > > > > > > +        d->parent_obj.config[0x70 + n * 8] |=3D 0x80;
> > > > > > >      } else {
> > > > > > > -        d->config[0x70 + n * 8] &=3D ~0x80;
> > > > > > > +        d->parent_obj.config[0x70 + n * 8] &=3D ~0x80;
> > > > > > >      }
> > > > > >
> > > > > > Better not to access parent_obj, so I'd rather keep the previou=
s
> > > > > > code as it. The rest is OK, thanks. If you don't want to respin
> > > > > > I can fix and take via mips-next.
> > > > >
> > > > > Why not? If it's OK to access other fields why not parent_obj? Th=
at
> > > > > avoids the QOM cast PCI_DEVICE(opaque) or PCI_DEVICE(d) after thi=
s
> > > > > patch. We know it's a PCIIDEState and has PCIDevice parent_obj
> field
> > > > > because we set the opaque pointer when adding this callback so I
> think
> > > > > this works and is the less expensive way. But feel free to change
> it any
> > > > > way you like and use it that way. I'd keep it as it is.
> > > >
> > > > My understanding of QOM is we shouldn't access internal states that
> > > > way, because 1/ this makes object refactors harder and 2/ this is
> > > > not the style/example we want in the codebase, but it doesn't seem
> > > > documented, so Cc'ing Markus/Eduardo for confirmation.
> > >
> > > `PCI_DEVICE(d)` is preferred instead `of d.parent_obj` (parent_obj is
> > > just a QOM implementation detail).  If there are real performance
> > > reasons to avoid it, we need numbers to support that.
> >
> > OK I can try to do some measurement or go back to PCI_DEVICE() then.
> >
> > > Also, note that `OBJECT_CHECK(obj)` is just `return obj` if
> > > CONFIG_QOM_CAST_DEBUG is disabled.
> >
> > But configure enables it by default even without --enable-debug so I
> think
> > most people don't even know and it's enabled practically everywhere
> > (probably even in distros). Why can't we have it disabled by default if
> it's
> > a developer debug option and enable it only for developers where it's
> useful
> > to catch bugs?
>
> It's a trade-off, I don't think there's a right answer for
> everybody.  Personally, I'd say the benefits outweigh the risks
> of disabling it for most users (especially the ones building QEMU
> directly from source).
>
> I don't mean to say it's OK for CONFIG_QOM_CAST_DEBUG=3Dy builds to
> have visibly poor performance.  If the typecast above causes a
> measurable performance impact, it might be reasonable to have a
> workaround like:
>
>   static void via_ide_set_irq(void *opaque, int n, int level)
>   {
>       PCIIDEState *ide =3D opaque;
>       PCIDevice *pci =3D opaque;
>       ...
>   }
>
> --
> Eduardo
>
>
For the record here, I'm going to defer to consensus judgment between
Eduardo, Philippe, and BALATON. Let me know when you're all happy with the
patch.

--js

--00000000000063d51605cecb541c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 20, 2021 at 11:18 AM Edua=
rdo Habkost &lt;<a href=3D"mailto:ehabkost@redhat.com">ehabkost@redhat.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n Wed, Oct 20, 2021 at 04:58:58PM +0200, BALATON Zoltan wrote:<br>
&gt; On Wed, 20 Oct 2021, Eduardo Habkost wrote:<br>
&gt; &gt; On Mon, Oct 18, 2021 at 12:10:04PM +0200, Philippe Mathieu-Daud=
=C3=A9 wrote:<br>
&gt; &gt; &gt; On 10/18/21 11:51, BALATON Zoltan wrote:<br>
&gt; &gt; &gt; &gt; On Mon, 18 Oct 2021, Philippe Mathieu-Daud=C3=A9 wrote:=
<br>
&gt; &gt; &gt; &gt; &gt; On 10/18/21 03:36, BALATON Zoltan wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; Cache the pointer to PCI function 0 (ISA brid=
ge, that this IDE device<br>
&gt; &gt; &gt; &gt; &gt; &gt; has to use for IRQs) in the PCIIDEState and p=
ass that as the opaque<br>
&gt; &gt; &gt; &gt; &gt; &gt; data for the interrupt handler to eliminate b=
oth the need to look up<br>
&gt; &gt; &gt; &gt; &gt; &gt; function 0 at every interrupt and also a QOM =
type cast of the opaque<br>
&gt; &gt; &gt; &gt; &gt; &gt; pointer as that&#39;s also expensive (mainly =
due to qom-debug being<br>
&gt; &gt; &gt; &gt; &gt; &gt; enabled by default).<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; Suggested-by: Philippe Mathieu-Daud=C3=A9 &lt=
;<a href=3D"mailto:f4bug@amsat.org" target=3D"_blank">f4bug@amsat.org</a>&g=
t;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Signed-off-by: BALATON Zoltan &lt;<a href=3D"=
mailto:balaton@eik.bme.hu" target=3D"_blank">balaton@eik.bme.hu</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; &gt; &gt; =C2=A0hw/ide/via.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 11 ++++++-----<br>
&gt; &gt; &gt; &gt; &gt; &gt; =C2=A0include/hw/ide/pci.h |=C2=A0 1 +<br>
&gt; &gt; &gt; &gt; &gt; &gt; =C2=A02 files changed, 7 insertions(+), 5 del=
etions(-)<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; diff --git a/hw/ide/via.c b/hw/ide/via.c<br>
&gt; &gt; &gt; &gt; &gt; &gt; index 82def819c4..30566bc409 100644<br>
&gt; &gt; &gt; &gt; &gt; &gt; --- a/hw/ide/via.c<br>
&gt; &gt; &gt; &gt; &gt; &gt; +++ b/hw/ide/via.c<br>
&gt; &gt; &gt; &gt; &gt; &gt; @@ -104,15 +104,15 @@ static void bmdma_setup=
_bar(PCIIDEState *d)<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; =C2=A0static void via_ide_set_irq(void *opaqu=
e, int n, int level)<br>
&gt; &gt; &gt; &gt; &gt; &gt; =C2=A0{<br>
&gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0=C2=A0=C2=A0 PCIDevice *d =3D PCI_DEVI=
CE(opaque);<br>
&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0 PCIIDEState *d =3D opaque=
;<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0 if (level) {<br>
&gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d=
-&gt;config[0x70 + n * 8] |=3D 0x80;<br>
&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d=
-&gt;parent_obj.config[0x70 + n * 8] |=3D 0x80;<br>
&gt; &gt; &gt; &gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0 } else {<br>
&gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d=
-&gt;config[0x70 + n * 8] &amp;=3D ~0x80;<br>
&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d=
-&gt;parent_obj.config[0x70 + n * 8] &amp;=3D ~0x80;<br>
&gt; &gt; &gt; &gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; Better not to access parent_obj, so I&#39;d rather=
 keep the previous<br>
&gt; &gt; &gt; &gt; &gt; code as it. The rest is OK, thanks. If you don&#39=
;t want to respin<br>
&gt; &gt; &gt; &gt; &gt; I can fix and take via mips-next.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Why not? If it&#39;s OK to access other fields why not =
parent_obj? That<br>
&gt; &gt; &gt; &gt; avoids the QOM cast PCI_DEVICE(opaque) or PCI_DEVICE(d)=
 after this<br>
&gt; &gt; &gt; &gt; patch. We know it&#39;s a PCIIDEState and has PCIDevice=
 parent_obj field<br>
&gt; &gt; &gt; &gt; because we set the opaque pointer when adding this call=
back so I think<br>
&gt; &gt; &gt; &gt; this works and is the less expensive way. But feel free=
 to change it any<br>
&gt; &gt; &gt; &gt; way you like and use it that way. I&#39;d keep it as it=
 is.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; My understanding of QOM is we shouldn&#39;t access internal =
states that<br>
&gt; &gt; &gt; way, because 1/ this makes object refactors harder and 2/ th=
is is<br>
&gt; &gt; &gt; not the style/example we want in the codebase, but it doesn&=
#39;t seem<br>
&gt; &gt; &gt; documented, so Cc&#39;ing Markus/Eduardo for confirmation.<b=
r>
&gt; &gt; <br>
&gt; &gt; `PCI_DEVICE(d)` is preferred instead `of d.parent_obj` (parent_ob=
j is<br>
&gt; &gt; just a QOM implementation detail).=C2=A0 If there are real perfor=
mance<br>
&gt; &gt; reasons to avoid it, we need numbers to support that.<br>
&gt; <br>
&gt; OK I can try to do some measurement or go back to PCI_DEVICE() then.<b=
r>
&gt; <br>
&gt; &gt; Also, note that `OBJECT_CHECK(obj)` is just `return obj` if<br>
&gt; &gt; CONFIG_QOM_CAST_DEBUG is disabled.<br>
&gt; <br>
&gt; But configure enables it by default even without --enable-debug so I t=
hink<br>
&gt; most people don&#39;t even know and it&#39;s enabled practically every=
where<br>
&gt; (probably even in distros). Why can&#39;t we have it disabled by defau=
lt if it&#39;s<br>
&gt; a developer debug option and enable it only for developers where it&#3=
9;s useful<br>
&gt; to catch bugs?<br>
<br>
It&#39;s a trade-off, I don&#39;t think there&#39;s a right answer for<br>
everybody.=C2=A0 Personally, I&#39;d say the benefits outweigh the risks<br=
>
of disabling it for most users (especially the ones building QEMU<br>
directly from source).<br>
<br>
I don&#39;t mean to say it&#39;s OK for CONFIG_QOM_CAST_DEBUG=3Dy builds to=
<br>
have visibly poor performance.=C2=A0 If the typecast above causes a<br>
measurable performance impact, it might be reasonable to have a<br>
workaround like:<br>
<br>
=C2=A0 static void via_ide_set_irq(void *opaque, int n, int level)<br>
=C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 PCIIDEState *ide =3D opaque;<br>
=C2=A0 =C2=A0 =C2=A0 PCIDevice *pci =3D opaque;<br>
=C2=A0 =C2=A0 =C2=A0 ...<br>
=C2=A0 }<br>
<br>
-- <br>
Eduardo<br>
<br></blockquote><div><br></div><div>For the record here, I&#39;m going to =
defer to consensus judgment between Eduardo, Philippe, and BALATON. Let me =
know when you&#39;re all happy with the patch.</div><div><br></div><div>--j=
s<br></div></div></div>

--00000000000063d51605cecb541c--


