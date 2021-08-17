Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB3A3EED3D
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 15:22:19 +0200 (CEST)
Received: from localhost ([::1]:52018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFz2o-0004l4-BI
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 09:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mFz0H-0002Hu-53
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 09:19:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mFz0E-0000j8-Ct
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 09:19:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629206377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kPesHZj4EachAtuX5ygagdKSUf/j9EtDENH9ke1kpRw=;
 b=FGa0+AQ+yl7WLrTNbLLBvU+K3pf8Hm8P6wzzckX6WBIU9FiyYzHWrA1yp7lOJySMlfNZfq
 +W4XIvTBzDA0WWZG1KBXvUaBb5XK1jzfccLyONJWWYIhe9Y7CeYETxlVemMgLQy0BJvK9V
 qlqWmPnB1VAAfjgIN+D+wmHN1Kv3sMM=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-bYxWskXuNdSlthCeGsjqcQ-1; Tue, 17 Aug 2021 09:19:35 -0400
X-MC-Unique: bYxWskXuNdSlthCeGsjqcQ-1
Received: by mail-oi1-f199.google.com with SMTP id
 u34-20020a0568081522b02902681e945a49so5912148oiw.3
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 06:19:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kPesHZj4EachAtuX5ygagdKSUf/j9EtDENH9ke1kpRw=;
 b=tfDf3auT9QVnM7KiNHTJv0sjf2gmzS8M7AYibcSvXIWjd9xxS99p4H1p0xQbIOoRqi
 DC7gm0a2ct66nwXGBaF9ex/jU3nB/SofixO4nhPRK2yCIzSqVinAnWU5Vlo5RdpceapN
 J8lMpqG6sF7LM0asBQcYowop04OWawPJkm2oQtStSCzzJyWX5WeN/RDRIKVHuerDx9CP
 dPM9qnTmkApGIIAgYldjVQfAWk8sS1BsJuUjSthbsgAxaWUL94tjUP1ACpUM7+Xqbogd
 UtmLtq+Qqev+1eRPx0OqaPFmkO4Wk4KbDgOWfCPYMDtCmGeh5RK6bL5LE6s60zFTBxSw
 MZkQ==
X-Gm-Message-State: AOAM532hrrK1eahNkARhenaGd+LGxOIxneKXQBA+a0dWmrdgz1NMWSsi
 Ftvy3QcCewMEzbs7v57B92y+QywXpX9Suggj5fdBnCK5UQCvd1zTS6K0hOO1DdqU5yu3UIhoTSL
 hu7RVPiv1LHNUkaMNDvj4ZD1aaVgVsMM=
X-Received: by 2002:a05:6830:1604:: with SMTP id
 g4mr2668323otr.45.1629206374432; 
 Tue, 17 Aug 2021 06:19:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRfBIXKAf3QJ8JDl6leDpVrYJbYlUpEnes825cOPHEWIDLkU1KgGCw9osXt9a41pZySUkg/EwAVya/oYdovvI=
X-Received: by 2002:a05:6830:1604:: with SMTP id
 g4mr2668273otr.45.1629206373854; 
 Tue, 17 Aug 2021 06:19:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210804142737.3366441-1-kraxel@redhat.com>
 <477961d5-576b-a588-9cea-dad796c592d2@amsat.org>
 <20210805071155.pkvs4fjjdlx3juoo@sirius.home.kraxel.org>
 <CAFn=p-Y-EinfLODwbSNKMov-h1W=Y5XbJNZTwdAE9L4BM+-GJw@mail.gmail.com>
 <8e1504d9-3214-ba45-1edb-6bf8ae0aa2d5@redhat.com>
In-Reply-To: <8e1504d9-3214-ba45-1edb-6bf8ae0aa2d5@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 17 Aug 2021 09:19:22 -0400
Message-ID: <CAFn=p-ZrEkssab5kiMf5pdAyPA9frWu4AJ=VA6uZqSp9fspFjw@mail.gmail.com>
Subject: Re: [PATCH 0/7] floppy: build as modules.
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000002e01db05c9c12be8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002e01db05c9c12be8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 17, 2021 at 5:09 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com>
wrote:

> Hi John,
>
> On 8/16/21 11:55 PM, John Snow wrote:
> > On Thu, Aug 5, 2021 at 3:12 AM Gerd Hoffmann <kraxel@redhat.com
> > <mailto:kraxel@redhat.com>> wrote:
> >
> >     On Wed, Aug 04, 2021 at 05:19:02PM +0200, Philippe Mathieu-Daud=C3=
=A9
> wrote:
> >     > +Mark
> >     >
> >     > On 8/4/21 4:27 PM, Gerd Hoffmann wrote:
> >     > > Some code shuffling needed beforehand due to floppy being part =
of
> >     > > several platforms.  While being at it also make floppy optional
> >     > > in pc machine type.
> >     >
> >     > >   floppy: move fdctrl_init_sysbus
> >     > >   floppy: move sun4m_fdctrl_init
> >     >
> >     > https://www.mail-archive.com/qemu-block@nongnu.org/msg84008.html
> >     <https://www.mail-archive.com/qemu-block@nongnu.org/msg84008.html>
> >     >
> >     > Mark suggested:
> >     >
> >     >   You may be able to simplify this further by removing the
> >     >   global legacy init functions fdctrl_init_sysbus() and
> >     >   sun4m_fdctrl_init(): from what I can see fdctrl_init_sysbus()
> >     >   is only used in hw/mips/jazz.c and sun4m_fdctrl_init() is only
> >     >   used in hw/sparc/sun4m.c so you might as well inline them or
> >     >   move the functions to the relevant files.
> >     >
> >     > I did it and plan to send during 6.2. Sounds simpler than module.
> >     > You could easily rebase your series on top (or I can include your
> >     > patches while sending).
> >
> >     Feel free to include them.  But I can also rebase when your patches
> >     landed upstream.  Your choice ;)
> >
> > What's the plan here, what are we trying to solve with this series
> > *exactly*?
> > If Phil sends his cleanups, do we still want/need the modularization
> here?
>
> Both series are orthogonal, but if my cleanups get merged first, there
> is less floppy code to modularize.
>
> > For now I'm gonna shuffle these off of my review queue and I assume I'l=
l
> > see a respin/rebase from either you or phil during the 6.2 window, let
> > me know if this is wrong.
>
> This is OK. Probably easier for everybody if I can rebase/include Gerd's
> patches along. I'm still not convinced FDC modularization is the right
> way to go; but the PC machine is one of machines I know the less, and
> has inherited a lot of odd things, so I need to carefully audit few more
> things.
>
> I'd rather have faithful chipsets modelled. Long term I don't think
> FDC are going away from QEMU, as they are used by happy hobbyist running
> old DOS programs from the 80's. But being able to build QEMU without
> FDC would be nice indeed.
>
>
OK, Understood -- And you're right, upstream the FDC needs a bit of work
and love, because they are used and important. I just ... as you can tell,
don't have much time to give them that love myself.

*cough* *cough* *nudge* *wink*

I'll be sending a patch when 6.2 opens indicating my desire to step down
from the device.

--js

--0000000000002e01db05c9c12be8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 17, 2021 at 5:09 AM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Hi John,<br>
<br>
On 8/16/21 11:55 PM, John Snow wrote:<br>
&gt; On Thu, Aug 5, 2021 at 3:12 AM Gerd Hoffmann &lt;<a href=3D"mailto:kra=
xel@redhat.com" target=3D"_blank">kraxel@redhat.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:kraxel@redhat.com" target=3D"_blank">krax=
el@redhat.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Wed, Aug 04, 2021 at 05:19:02PM +0200, Philippe =
Mathieu-Daud=C3=A9 wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +Mark<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; On 8/4/21 4:27 PM, Gerd Hoffmann wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; Some code shuffling needed beforehand due=
 to floppy being part of<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; several platforms.=C2=A0 While being at i=
t also make floppy optional<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; in pc machine type.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;=C2=A0 =C2=A0floppy: move fdctrl_init_sysb=
us<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;=C2=A0 =C2=A0floppy: move sun4m_fdctrl_ini=
t<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; <a href=3D"https://www.mail-archive.com/qemu-b=
lock@nongnu.org/msg84008.html" rel=3D"noreferrer" target=3D"_blank">https:/=
/www.mail-archive.com/qemu-block@nongnu.org/msg84008.html</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://www.mail-archive.com/qemu-bl=
ock@nongnu.org/msg84008.html" rel=3D"noreferrer" target=3D"_blank">https://=
www.mail-archive.com/qemu-block@nongnu.org/msg84008.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Mark suggested:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0You may be able to simplify this f=
urther by removing the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0global legacy init functions fdctr=
l_init_sysbus() and<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0sun4m_fdctrl_init(): from what I c=
an see fdctrl_init_sysbus()<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0is only used in hw/mips/jazz.c and=
 sun4m_fdctrl_init() is only<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0used in hw/sparc/sun4m.c so you mi=
ght as well inline them or<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0move the functions to the relevant=
 files.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I did it and plan to send during 6.2. Sounds s=
impler than module.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; You could easily rebase your series on top (or=
 I can include your<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; patches while sending).<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Feel free to include them.=C2=A0 But I can also reb=
ase when your patches<br>
&gt;=C2=A0 =C2=A0 =C2=A0landed upstream.=C2=A0 Your choice ;)<br>
&gt; <br>
&gt; What&#39;s the plan here, what are we trying to solve with this series=
<br>
&gt; *exactly*?<br>
&gt; If Phil sends his cleanups, do we still want/need the modularization h=
ere?<br>
<br>
Both series are orthogonal, but if my cleanups get merged first, there<br>
is less floppy code to modularize.<br>
<br>
&gt; For now I&#39;m gonna shuffle these off of my review queue and I assum=
e I&#39;ll<br>
&gt; see a respin/rebase from either you or phil during the 6.2 window, let=
<br>
&gt; me know if this is wrong.<br>
<br>
This is OK. Probably easier for everybody if I can rebase/include Gerd&#39;=
s<br>
patches along. I&#39;m still not convinced FDC modularization is the right<=
br>
way to go; but the PC machine is one of machines I know the less, and<br>
has inherited a lot of odd things, so I need to carefully audit few more<br=
>
things.<br>
<br>
I&#39;d rather have faithful chipsets modelled. Long term I don&#39;t think=
<br>
FDC are going away from QEMU, as they are used by happy hobbyist running<br=
>
old DOS programs from the 80&#39;s. But being able to build QEMU without<br=
>
FDC would be nice indeed.<br>
<br></blockquote><div><br></div><div>OK, Understood -- And you&#39;re right=
, upstream the FDC needs a bit of work and love, because they are used and =
important. I just ... as you can tell, don&#39;t have much time to give the=
m that love myself.</div><div><br></div><div>*cough* *cough* *nudge* *wink*=
</div><div><br></div><div>I&#39;ll be sending a patch when 6.2 opens indica=
ting my desire to step down from the device.</div><div><br></div><div>--js<=
br></div><div>=C2=A0</div></div></div>

--0000000000002e01db05c9c12be8--


