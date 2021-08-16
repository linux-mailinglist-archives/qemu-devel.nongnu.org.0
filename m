Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F223EDF91
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 23:57:10 +0200 (CEST)
Received: from localhost ([::1]:54896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFkbV-0002ry-Mk
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 17:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mFka0-00022o-1J
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 17:55:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mFkZw-0004XO-1I
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 17:55:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629150931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mmDp2eZBJYqJt6gXd8EVRFnZ3tjLHyTRuDIeYpukMgU=;
 b=hmWK2t6dsUhDU/PViC1tN06r7TV9yR8tW4SISqjC7BSxv8FxCLf4b9Sk6+hkoAPbWbFTHK
 CFxqWGi/KYAaoUI0V+hNltPw5Xd7bevkbh/jY3xT07+zOZJxqYoIik9lZ+p9whGX5ThiLa
 Y9sRRTOLN+K1MlNplxFVCp+XJ4pqoMQ=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-abxXtSfqNQquG70GuIeeLQ-1; Mon, 16 Aug 2021 17:55:27 -0400
X-MC-Unique: abxXtSfqNQquG70GuIeeLQ-1
Received: by mail-oo1-f71.google.com with SMTP id
 b24-20020a4ac2980000b0290269ebe9b797so7439860ooq.18
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 14:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mmDp2eZBJYqJt6gXd8EVRFnZ3tjLHyTRuDIeYpukMgU=;
 b=B4RncwFaKLe5G5rnAI6GLJ9RGwOE7lE8efyY/lIZQknsFNrTBwXZLMiDaX7shjqZJc
 UTYnvlwKrHta4ZXZsvM9xY7v0OmFyOy5nUp1/xp9YbhZ20z7J2lw5ZMrIT7WPmg9uCZH
 oj0SfJ0gAPRpv6oaq3sV9LOZe6FIZYR7m2E1tGZZi9jyDN5DXXTVQOPRdbs0DNAD40fx
 1DRHxaj/U8lwXZT61TNsrswsQt+7oeUTBX8NMpjwPz18H0JUmoKUJZr603Ru7eptT6yr
 s1H7MVr1TM81HxAZjSo/hsq/UgrxKWzywKIuSHCUdwqRU4zWBx8Y/ExeMHM4flOHxeYs
 4wFw==
X-Gm-Message-State: AOAM53187c+h6WcsCjAz0CTwafEvSbMGRS+VswPBOyV1IuLn1PwqdvYo
 rpr2TOlYmbc/0p7F/kjPKJOw/xwthe+PDfPBpjLr8iIcSAigQfPSwtz+3zh0SRLY3eUE+5Ab7BT
 cDBnTyyc3KZiCWRzouYCXYvCuf+S2fXU=
X-Received: by 2002:a05:6808:1906:: with SMTP id bf6mr2291oib.52.1629150926980; 
 Mon, 16 Aug 2021 14:55:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0KhkBpyHWbMGjbTwSnUEhRlOTxYRQxoOFuKtYDM2fPhMbL+V8a1oQB+WNVK/BZ4wuXYefeIznPuefO5Jh4+4=
X-Received: by 2002:a05:6808:1906:: with SMTP id bf6mr2277oib.52.1629150926773; 
 Mon, 16 Aug 2021 14:55:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210804142737.3366441-1-kraxel@redhat.com>
 <477961d5-576b-a588-9cea-dad796c592d2@amsat.org>
 <20210805071155.pkvs4fjjdlx3juoo@sirius.home.kraxel.org>
In-Reply-To: <20210805071155.pkvs4fjjdlx3juoo@sirius.home.kraxel.org>
From: John Snow <jsnow@redhat.com>
Date: Mon, 16 Aug 2021 17:55:16 -0400
Message-ID: <CAFn=p-Y-EinfLODwbSNKMov-h1W=Y5XbJNZTwdAE9L4BM+-GJw@mail.gmail.com>
Subject: Re: [PATCH 0/7] floppy: build as modules.
To: Gerd Hoffmann <kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000046b2c505c9b442bc"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000046b2c505c9b442bc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 5, 2021 at 3:12 AM Gerd Hoffmann <kraxel@redhat.com> wrote:

> On Wed, Aug 04, 2021 at 05:19:02PM +0200, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > +Mark
> >
> > On 8/4/21 4:27 PM, Gerd Hoffmann wrote:
> > > Some code shuffling needed beforehand due to floppy being part of
> > > several platforms.  While being at it also make floppy optional
> > > in pc machine type.
> >
> > >   floppy: move fdctrl_init_sysbus
> > >   floppy: move sun4m_fdctrl_init
> >
> > https://www.mail-archive.com/qemu-block@nongnu.org/msg84008.html
> >
> > Mark suggested:
> >
> >   You may be able to simplify this further by removing the
> >   global legacy init functions fdctrl_init_sysbus() and
> >   sun4m_fdctrl_init(): from what I can see fdctrl_init_sysbus()
> >   is only used in hw/mips/jazz.c and sun4m_fdctrl_init() is only
> >   used in hw/sparc/sun4m.c so you might as well inline them or
> >   move the functions to the relevant files.
> >
> > I did it and plan to send during 6.2. Sounds simpler than module.
> > You could easily rebase your series on top (or I can include your
> > patches while sending).
>
> Feel free to include them.  But I can also rebase when your patches
> landed upstream.  Your choice ;)
>
> take care,
>   Gerd
>
>
What's the plan here, what are we trying to solve with this series
*exactly*?
If Phil sends his cleanups, do we still want/need the modularization here?

For now I'm gonna shuffle these off of my review queue and I assume I'll
see a respin/rebase from either you or phil during the 6.2 window, let me
know if this is wrong.

Thanks,
--js

--00000000000046b2c505c9b442bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 5, 2021 at 3:12 AM Gerd H=
offmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, A=
ug 04, 2021 at 05:19:02PM +0200, Philippe Mathieu-Daud=C3=A9 wrote:<br>
&gt; +Mark<br>
&gt; <br>
&gt; On 8/4/21 4:27 PM, Gerd Hoffmann wrote:<br>
&gt; &gt; Some code shuffling needed beforehand due to floppy being part of=
<br>
&gt; &gt; several platforms.=C2=A0 While being at it also make floppy optio=
nal<br>
&gt; &gt; in pc machine type.<br>
&gt; <br>
&gt; &gt;=C2=A0 =C2=A0floppy: move fdctrl_init_sysbus<br>
&gt; &gt;=C2=A0 =C2=A0floppy: move sun4m_fdctrl_init<br>
&gt; <br>
&gt; <a href=3D"https://www.mail-archive.com/qemu-block@nongnu.org/msg84008=
.html" rel=3D"noreferrer" target=3D"_blank">https://www.mail-archive.com/qe=
mu-block@nongnu.org/msg84008.html</a><br>
&gt; <br>
&gt; Mark suggested:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0You may be able to simplify this further by removing the<b=
r>
&gt;=C2=A0 =C2=A0global legacy init functions fdctrl_init_sysbus() and<br>
&gt;=C2=A0 =C2=A0sun4m_fdctrl_init(): from what I can see fdctrl_init_sysbu=
s()<br>
&gt;=C2=A0 =C2=A0is only used in hw/mips/jazz.c and sun4m_fdctrl_init() is =
only<br>
&gt;=C2=A0 =C2=A0used in hw/sparc/sun4m.c so you might as well inline them =
or<br>
&gt;=C2=A0 =C2=A0move the functions to the relevant files.<br>
&gt; <br>
&gt; I did it and plan to send during 6.2. Sounds simpler than module.<br>
&gt; You could easily rebase your series on top (or I can include your<br>
&gt; patches while sending).<br>
<br>
Feel free to include them.=C2=A0 But I can also rebase when your patches<br=
>
landed upstream.=C2=A0 Your choice ;)<br>
<br>
take care,<br>
=C2=A0 Gerd<br>
<br></blockquote><div><br></div><div>What&#39;s the plan here, what are we =
trying to solve with this series *exactly*?</div><div>If Phil sends his cle=
anups, do we still want/need the modularization here?</div><div><br></div><=
div>For now I&#39;m gonna shuffle these off of my review queue and I assume=
 I&#39;ll see a respin/rebase from either you or phil during the 6.2 window=
, let me know if this is wrong.<br></div><div><br></div><div>Thanks,<br></d=
iv><div></div><div>--js<br></div></div></div>

--00000000000046b2c505c9b442bc--


