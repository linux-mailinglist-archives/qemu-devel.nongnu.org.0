Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3864C181C3C
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 16:23:53 +0100 (CET)
Received: from localhost ([::1]:54116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jC3D5-0003Zv-Pc
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 11:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56281)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1jC3C9-0003AU-9i
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:22:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1jC3C7-0000dG-7l
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:22:52 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:30998
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1jC3C7-0000bF-0N
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:22:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583940169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RacB3diWm8IOPZn7DJqXBeeN5WqJsR/R7ucgd2QuA4w=;
 b=QiSSRQqv8CVP+PzpfDmQtNMRWdNkT0hRqvl/rWygu1Wo21mx+R3YwfNmKfcUtniv+g8Gmz
 ZQDX+yHpiDo/XvhnHbhHXHrM0gd8ia/vTCSZOUpXe+IVI/El57AAOIYUl9LN+Pzi1SAKzb
 gXk9YNWHJfaHaC1OQXSCzZXCDEn4e8E=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-qyvlSYZoOAGKPtoLzX7AhQ-1; Wed, 11 Mar 2020 11:22:41 -0400
X-MC-Unique: qyvlSYZoOAGKPtoLzX7AhQ-1
Received: by mail-ed1-f72.google.com with SMTP id z2so2159007edl.3
 for <qemu-devel@nongnu.org>; Wed, 11 Mar 2020 08:22:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/U1rWM+FC/s8rDinON3FmujLySWrPPax0AWxBnQpY8w=;
 b=FU1ErfQSpY6bd1oFTvH8dOzb8gdFbZUS6W2AzneH/8/MKzSg4Oj9iskzO3T0bO5ezg
 DPsmBbpOO0aajUvc9teMKOBOOHBdvku7Q2tObhgcyNDXD7jU1j4tzsph2bnMrPaHlikm
 sAUcP3D5azTku3KMSL7bhGK/rE1I453/ZRvBMBX22/vqyYx1tFAGkpPLZPvyq/kzIwQ/
 s0l/RK7sbqAgH5p/x6ZSsfnlZlMiZ8yEaa3ZLnQ37LQlYPekuhiTYenamsmnkh/6YJ5P
 S3qenKUWibOrrdxCNPrTaDCZjvNSTI4qDm2BgcuLhu/SgnEO35G/riBt053t+3ILasJb
 5Uaw==
X-Gm-Message-State: ANhLgQ1oKzAQU8thVDvguyw0fi34niBGvGBHOqLDtBXmbSNtbcweXp0J
 WbdP8awTt5uzmdUFTaMqeToMh8Kbn8N35N3whKnlgWx6aPqKaB85lUQF8sbdnu9ycKRQtcoljGn
 UJa8v1P7Bm0JLPYiEFBbj8nyYmJHIjbg=
X-Received: by 2002:aa7:de85:: with SMTP id j5mr3263992edv.193.1583940160215; 
 Wed, 11 Mar 2020 08:22:40 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsJG4u2JmExxexcIR4dn4XyvN/Mcu2RN4hycp3UNC240mxlTgzhSLvF2s03XQ800NSKW2XX7OqPQseZCcN9HUU=
X-Received: by 2002:aa7:de85:: with SMTP id j5mr3263967edv.193.1583940160017; 
 Wed, 11 Mar 2020 08:22:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200228153619.9906-1-peter.maydell@linaro.org>
 <20200228153619.9906-32-peter.maydell@linaro.org>
 <87blp3x7rr.fsf@dusky.pond.sub.org>
 <CAFEAcA9EEuAeKm8kXtSJUtm6F3=VfyMxOkESvrZzoVt87HwKpw@mail.gmail.com>
In-Reply-To: <CAFEAcA9EEuAeKm8kXtSJUtm6F3=VfyMxOkESvrZzoVt87HwKpw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 11 Mar 2020 16:22:27 +0100
Message-ID: <CABgObfY1zeUEb3pKFX7YEtAHRuaMDtXJHPpNxz-0Fzhtqdy++w@mail.gmail.com>
Subject: Re: [PATCH v3 31/33] docs: Stop building qemu-doc
To: Peter Maydell <peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000956eba05a095ce24"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Kashyap Chamarthy <kchamart@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000956eba05a095ce24
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Also, man to text is obviously doable with groff if we're content with the
man page content.

Paolo

Il mer 11 mar 2020, 16:16 Peter Maydell <peter.maydell@linaro.org> ha
scritto:

> On Wed, 11 Mar 2020 at 14:53, Markus Armbruster <armbru@redhat.com> wrote=
:
> > This appears to lose plain text, PDF and info output.  Any chance to ge=
t
> > plain text back?
>
> This is deliberate. Consensus when we decided on the docs
> transition plan was that plain text was not a useful output
> format. (discussed in
> https://lists.gnu.org/archive/html/qemu-devel/2019-05/msg04932.html
> and following thread).
>
> Sphinx does support text file generation, so you can if
> you really want it generate it with something like
>  sphinx-build docs /tmp/docs-out -b text
> but:
>  * it produces one text file per input file, so you might
> as well just read the rST sources
>  * at least in the version of Sphinx I have, the text builder
> does not implement some of the table markup we use,
> so it will fall over partway with a NotImplementedError
>
> PDF similarly is in theory possible via 'latex' builder
> (and then running LaTeX on the results). You can also
> download a PDF from
> https://readthedocs.org/projects/qemu/downloads/
> You will find that there are some bits where rendering
> is not good (eg long lines that didn't get wrapped so were
> just truncated).
>
> Personally I think it's difficult enough managing two
> output formats and checking that they look reasonable
> (we already found places in the QAPI docs where
> clearly nobody had looked at *any* of the rendered
> formats) so I think settling on "our supported document
> formats are HTML and manpage" is reasonable.
>
> thanks
> -- PMM
>
>

--000000000000956eba05a095ce24
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Also, man to text is obviously doable with groff if we&#3=
9;re content with the man page content.<div dir=3D"auto"><br></div><div dir=
=3D"auto">Paolo</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mer 11 mar 2020, 16:16 Peter Maydell &lt;<a href=3D=
"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; ha scrit=
to:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">On Wed, 11 Mar 2020 at 14:53, M=
arkus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" target=3D"_blank"=
 rel=3D"noreferrer">armbru@redhat.com</a>&gt; wrote:<br>
&gt; This appears to lose plain text, PDF and info output.=C2=A0 Any chance=
 to get<br>
&gt; plain text back?<br>
<br>
This is deliberate. Consensus when we decided on the docs<br>
transition plan was that plain text was not a useful output<br>
format. (discussed in<br>
<a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2019-05/msg04932.h=
tml" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.gnu.org/=
archive/html/qemu-devel/2019-05/msg04932.html</a><br>
and following thread).<br>
<br>
Sphinx does support text file generation, so you can if<br>
you really want it generate it with something like<br>
=C2=A0sphinx-build docs /tmp/docs-out -b text<br>
but:<br>
=C2=A0* it produces one text file per input file, so you might<br>
as well just read the rST sources<br>
=C2=A0* at least in the version of Sphinx I have, the text builder<br>
does not implement some of the table markup we use,<br>
so it will fall over partway with a NotImplementedError<br>
<br>
PDF similarly is in theory possible via &#39;latex&#39; builder<br>
(and then running LaTeX on the results). You can also<br>
download a PDF from<br>
<a href=3D"https://readthedocs.org/projects/qemu/downloads/" rel=3D"norefer=
rer noreferrer" target=3D"_blank">https://readthedocs.org/projects/qemu/dow=
nloads/</a><br>
You will find that there are some bits where rendering<br>
is not good (eg long lines that didn&#39;t get wrapped so were<br>
just truncated).<br>
<br>
Personally I think it&#39;s difficult enough managing two<br>
output formats and checking that they look reasonable<br>
(we already found places in the QAPI docs where<br>
clearly nobody had looked at *any* of the rendered<br>
formats) so I think settling on &quot;our supported document<br>
formats are HTML and manpage&quot; is reasonable.<br>
<br>
thanks<br>
-- PMM<br>
<br>
</blockquote></div>

--000000000000956eba05a095ce24--


