Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF174F3C6C
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 17:48:12 +0200 (CEST)
Received: from localhost ([::1]:42172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nblPf-0002gA-8E
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 11:48:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nblOn-000205-RX
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 11:47:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nblOk-0006IV-Rx
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 11:47:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649173633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5sjHwJvKX8XEhBXpseEJmtctPD44klr2gBjp8PZkZpU=;
 b=Anx94ycyWAd4pLq0M8sujxASwHzH+odS4u7Z+4Z28CuD6oCFbR8eQj/kP3SIcgKdgDW2hB
 m8Zbbodeg0cYSV2NeJ16JKrQCLC7nBK+cIGI6GHYLvijpIY/L/+IEDX57/8848Cgi5wgzw
 1vCyqdcr748t27rjwunXKxcCVehbifk=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-348-CDnLJTslNEai31zu3DwvSA-1; Tue, 05 Apr 2022 11:47:12 -0400
X-MC-Unique: CDnLJTslNEai31zu3DwvSA-1
Received: by mail-vk1-f197.google.com with SMTP id
 l23-20020ac5cdb7000000b0033ffe029887so2471344vka.0
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 08:47:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5sjHwJvKX8XEhBXpseEJmtctPD44klr2gBjp8PZkZpU=;
 b=GEpl6g3O71Um8HH/R99eJfONPlHMFOVmj28TVeShyF2+7yfPEUOlFHeQSF7AKawvs+
 5ybWbcmWoDkAEUTJTxS+XfI0yTL57T5HE/PYIQih0egLY4XwiiDrEvsHHoFTqhNdU9Jm
 UNt6XtH+eQlEFlOg21nxqB+GVNLZ53BtXtr+9DAbb4/kJdyEMB6GMVSTDzxvtS3nTEFO
 IGKmu/d6DaAMbf1Naj0TlHRlmkYJa7naS2vbj8qSMKzrE79gpXtDMKpkGTTYngHeIDpN
 2uCpdtB3OmE1+DqfUPSvfDiITOWCONZ7SlSNpxIiEwqlinnUupNEiTuJBIRAvE+YHmSf
 1urQ==
X-Gm-Message-State: AOAM532lWmxBETt9/VxhKNz4fGAGiJD8BjTjHR90JN8yJk6p/seU0dMj
 oAmlX1NaxtxoZa+8HVsds6hBJ1eW7CluCLOCKrQBwwsBhwZ+G9ci0Nqf6m6vTynQRPSouDfgpjs
 bdIn8l44g3HC3BZ1PHuHWL9cYuJ+PwSA=
X-Received: by 2002:a67:17c4:0:b0:322:cfd8:15a1 with SMTP id
 187-20020a6717c4000000b00322cfd815a1mr1214604vsx.61.1649173631735; 
 Tue, 05 Apr 2022 08:47:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnMiUPWViI6dial7Mh/JFL9uvHC0EmmI4yD9TqQ7M74VsZGVUa99944uld79Pg9vksnGBXtS4gw3U3gAYbmKA=
X-Received: by 2002:a67:17c4:0:b0:322:cfd8:15a1 with SMTP id
 187-20020a6717c4000000b00322cfd815a1mr1214595vsx.61.1649173631478; Tue, 05
 Apr 2022 08:47:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220330182424.3438872-1-jsnow@redhat.com>
 <20220330182424.3438872-11-jsnow@redhat.com>
 <50204b1e-2bf5-8fa7-83f3-0ee8b9cc4ab5@greensocs.com>
In-Reply-To: <50204b1e-2bf5-8fa7-83f3-0ee8b9cc4ab5@greensocs.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 5 Apr 2022 11:47:01 -0400
Message-ID: <CAFn=p-b=_VFVuLdhuXSDg4cNYExSVS1Ojdd75P_-ih0y7kicRA@mail.gmail.com>
Subject: Re: [qemu.qmp PATCH 10/13] docs: add versioning policy to README
To: Damien Hedde <damien.hedde@greensocs.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000007a415f05dbea289c"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000007a415f05dbea289c
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 5, 2022, 5:16 AM Damien Hedde <damien.hedde@greensocs.com>
wrote:

>
>
> On 3/30/22 20:24, John Snow wrote:
> > The package is in an alpha state, but there's a method to the madness.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   README.rst | 21 +++++++++++++++++++++
> >   1 file changed, 21 insertions(+)
> >
> > diff --git a/README.rst b/README.rst
> > index 8593259..88efe84 100644
> > --- a/README.rst
> > +++ b/README.rst
> > @@ -154,6 +154,27 @@ fail. These checks use their own virtual
> environments and won't pollute
> >   your working space.
> >
> >
> > +Stability and Versioning
> > +------------------------
> > +
> > +This package uses a major.minor.micro SemVer versioning, with the
> > +following additional semantics during the alpha/beta period (Major
> > +version 0):
> > +
> > +This package treats 0.0.z versions as "alpha" versions. Each micro
> > +version update may change the API incompatibly. Early users are advised
> > +to pin against explicit versions, but check for updates often.
> > +
> > +A planned 0.1.z version will introduce the first "beta", whereafter each
> > +micro update will be backwards compatible, but each minor update will
> > +not be. The first beta version will be released after legacy.py is
> > +removed, and the API is tentatively "stable".
> > +
> > +Thereafter, normal SemVer/PEP440 rules will apply; micro updates will
> > +always be bugfixes, and minor updates will be reserved for backwards
> > +compatible feature changes.
> > +
> > +
> >   Changelog
> >   ---------
> >
>
> Looks reasonable to me.
> Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
>

Thanks! I'm hoping to make it easier to spin up more dev tooling outside of
the qemu tree. If you've got any wishlist items, feel free to let me know.

It's still early days for Python packages outside of the qemu tree, so
nearly everything is on the table still.

(the jsnow/python staging branch has some 17 patches in it that will be
checked in to QEMU when development re-opens. The forked qemu.qmp repo will
be based off of qemu.git after those patches go in. There's a bit of
shakeup where I delete the old qmp lib and replace it with what's currently
aqmp. It should hopefully not be a huge nuisance to your work, but if
there's issues, let me know.)

Thanks,
--John Snow

--0000000000007a415f05dbea289c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Apr 5, 2022, 5:16 AM Damien Hedde &lt;<a href=
=3D"mailto:damien.hedde@greensocs.com">damien.hedde@greensocs.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
On 3/30/22 20:24, John Snow wrote:<br>
&gt; The package is in an alpha state, but there&#39;s a method to the madn=
ess.<br>
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0README.rst | 21 +++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 21 insertions(+)<br>
&gt; <br>
&gt; diff --git a/README.rst b/README.rst<br>
&gt; index 8593259..88efe84 100644<br>
&gt; --- a/README.rst<br>
&gt; +++ b/README.rst<br>
&gt; @@ -154,6 +154,27 @@ fail. These checks use their own virtual environm=
ents and won&#39;t pollute<br>
&gt;=C2=A0 =C2=A0your working space.<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +Stability and Versioning<br>
&gt; +------------------------<br>
&gt; +<br>
&gt; +This package uses a major.minor.micro SemVer versioning, with the<br>
&gt; +following additional semantics during the alpha/beta period (Major<br=
>
&gt; +version 0):<br>
&gt; +<br>
&gt; +This package treats 0.0.z versions as &quot;alpha&quot; versions. Eac=
h micro<br>
&gt; +version update may change the API incompatibly. Early users are advis=
ed<br>
&gt; +to pin against explicit versions, but check for updates often.<br>
&gt; +<br>
&gt; +A planned 0.1.z version will introduce the first &quot;beta&quot;, wh=
ereafter each<br>
&gt; +micro update will be backwards compatible, but each minor update will=
<br>
&gt; +not be. The first beta version will be released after legacy.py is<br=
>
&gt; +removed, and the API is tentatively &quot;stable&quot;.<br>
&gt; +<br>
&gt; +Thereafter, normal SemVer/PEP440 rules will apply; micro updates will=
<br>
&gt; +always be bugfixes, and minor updates will be reserved for backwards<=
br>
&gt; +compatible feature changes.<br>
&gt; +<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0Changelog<br>
&gt;=C2=A0 =C2=A0---------<br>
&gt;=C2=A0 =C2=A0<br>
<br>
Looks reasonable to me.<br>
Reviewed-by: Damien Hedde &lt;<a href=3D"mailto:damien.hedde@greensocs.com"=
 target=3D"_blank" rel=3D"noreferrer">damien.hedde@greensocs.com</a>&gt;<br=
></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Tha=
nks! I&#39;m hoping to make it easier to spin up more dev tooling outside o=
f the qemu tree. If you&#39;ve got any wishlist items, feel free to let me =
know.</div><div dir=3D"auto"><br></div><div dir=3D"auto">It&#39;s still ear=
ly days for Python packages outside of the qemu tree, so nearly everything =
is on the table still.</div><div dir=3D"auto"><br></div><div dir=3D"auto">(=
the jsnow/python staging branch has some 17 patches in it that will be chec=
ked in to QEMU when development re-opens. The forked qemu.qmp repo will be =
based off of qemu.git after those patches go in. There&#39;s a bit of shake=
up where I delete the old qmp lib and replace it with what&#39;s currently =
aqmp. It should hopefully not be a huge nuisance to your work, but if there=
&#39;s issues, let me know.)</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Thanks,</div><div dir=3D"auto">--John Snow</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"></blockquote></div></div></div>

--0000000000007a415f05dbea289c--


