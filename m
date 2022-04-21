Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDF150AA70
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 23:02:31 +0200 (CEST)
Received: from localhost ([::1]:57318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhdwb-00040J-9D
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 17:02:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhdut-0001ok-0T
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 17:00:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhduh-0001ko-C5
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 17:00:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650574829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gx75XeFvR6ZfA8lzvRMEij3Co2dTx15v1K+yvHp0sWQ=;
 b=enMcO8JLWxAEaRkeEEOyFo3SlP245yZu/LkrMsEGGeWaKMJsPQTf+47Dr4oYqZ7mZDQHpo
 Rau1XgcMp2fxXYS4DeoEyJudSS2kEOT0UVsYI1fU7d94ElKkvYkO49C2akjH7CwYspHmKU
 Vqkf4FO+RaSyfUaMyDjF2P3kjggnnuY=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-546-AkSYJ4uTOv2TfAGDKCd9NA-1; Thu, 21 Apr 2022 17:00:26 -0400
X-MC-Unique: AkSYJ4uTOv2TfAGDKCd9NA-1
Received: by mail-vs1-f70.google.com with SMTP id
 g189-20020a676bc6000000b0032a7c141edaso450546vsc.0
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 14:00:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gx75XeFvR6ZfA8lzvRMEij3Co2dTx15v1K+yvHp0sWQ=;
 b=f61wPmBiSmbjJnxBwM3j3NsdcksJnI10f9hVvGM/5AfIfuBoqaXK3qNDz/p6fTZY1X
 xnXC3JIJo6Wki/BKJLDvf3OOw6wekOuC97haoP7YYM43iu/qZ9UlyfNekpMjUneTeKXy
 VOziuJGanAIncq3m6GDYKvdbw5W6nYwp4MDYvoui/3KxfDlvV6fMC5+oYBjaTRroAFJj
 Csqb290pysz7xB3/88gu0PLqATY7WDqHVFJzOXLSx1czuJ+OqrWIPxNrp7sf2PS/UoT+
 spCUd8HVSKtCxFpb9sqEZLDn/eZJ1NezC6l41wbuhLJ637PQQS9PHOmyUc1yvY+7MDXk
 sXzg==
X-Gm-Message-State: AOAM530yonMco1VW3yF7i6CsedF5Utf6R34bQ9gvt5QP1Gzgc0kgDKeF
 8xIax4j0a3AEwSjBie6o0Gj5lm+pBuwY84R5Pdv+Yu+wxlqr5yDHgEHYCYl2CcVDdYKP/cCSQIu
 J7gUdMGp8KS+2KfX9r57WFY93XZuLGbw=
X-Received: by 2002:a05:6122:887:b0:332:699e:7e67 with SMTP id
 7-20020a056122088700b00332699e7e67mr494579vkf.35.1650574825611; 
 Thu, 21 Apr 2022 14:00:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9+Mxd0qsKyDhzD3M3tUPfSyC2Hmh6JKaHhlkiI1d9eFFuFq3olTIoW3Nt4R1TDfO9NBEFt0W4SudlQfMrs18=
X-Received: by 2002:a05:6122:887:b0:332:699e:7e67 with SMTP id
 7-20020a056122088700b00332699e7e67mr494571vkf.35.1650574825380; Thu, 21 Apr
 2022 14:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAFn=p-a1DTR3ve_aQBARLG6NDdGscWQOn1wCjrPiRWL0sDvk9A@mail.gmail.com>
 <CABJz62MoAvnTaAYcNzKn7_=ENS+YovowS4OozZ7iYHQV2kL6Cg@mail.gmail.com>
In-Reply-To: <CABJz62MoAvnTaAYcNzKn7_=ENS+YovowS4OozZ7iYHQV2kL6Cg@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 21 Apr 2022 17:00:16 -0400
Message-ID: <CAFn=p-a4P4c9AcoT4mTmikQYyf=09brMP3D464XgHQUzO+th+A@mail.gmail.com>
Subject: Re: Create qemu-project/py-qemu.qmp repo
To: Andrea Bolognani <abologna@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000002472f005dd3066f5"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>,
 Victor Toso de Carvalho <victortoso@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002472f005dd3066f5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 21, 2022, 2:00 PM Andrea Bolognani <abologna@redhat.com> wrote:

> On Thu, Apr 21, 2022 at 12:46:48PM -0400, John Snow wrote:
> > Hi Alex: do you have the ability to create a blank/empty "py-qemu.qmp"
> > repo under the qemu-project grouping, and add me and Cleber as
> > maintainers for it? There weren't any objections when I floated the
> > idea [1].
> >
> > (Though I suggested "py-qemu.qmp" and Dan suggested "python-qemu.qmp".
> > I don't think we explicitly reconciled the difference. I like the
> > shorter one.)
>
> Since you CC'd me to this message, I'm going to assume you're
> explicitly welcoming my input on what specific shade this bikeshed
> should be painted ;)
>

More of a "Speak now or forever hold your peace" =F0=9F=98=85

I think I would go with "python-qemu-qmp". Having a dot in the name
>
of a git repo is not very common AFAICT, and I wouldn't rule out the
> possibility of some GitLab feature or other tooling breaking or
> misbehaving because of it.
>
> If you're really keen on saving those few extra keystrokes, maybe
> "pyqemu" is a better prefix than "py-qemu"? I don't know, it just
> looks more natural to me.
>

The idea is to have the repo name resemble the Python package name, which
is "qemu.qmp". For Python, it's customary to have the package name match
the import name. The import name is "qemu.qmp".

I tested this name on GitLab and it appears to work just fine.

I'd add "py:" as a prefix, but the colon doesn't work as a filename in many
places, so I suggested "py-".

Thus, all together, "py-qemu.qmp".

(I could spell out "python", I just prefer the shorter prefix because it's
explanatory enough as-is and I like keeping git checkout names short. My
favorite color of bike shed is blue.)


> --
> Andrea Bolognani / Red Hat / Virtualization
>
>

--0000000000002472f005dd3066f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Apr 21, 2022, 2:00 PM Andrea Bolognani &lt;<a =
href=3D"mailto:abologna@redhat.com">abologna@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">On Thu, Apr 21, 2022 at 12:46:48PM -040=
0, John Snow wrote:<br>
&gt; Hi Alex: do you have the ability to create a blank/empty &quot;py-qemu=
.qmp&quot;<br>
&gt; repo under the qemu-project grouping, and add me and Cleber as<br>
&gt; maintainers for it? There weren&#39;t any objections when I floated th=
e<br>
&gt; idea [1].<br>
&gt;<br>
&gt; (Though I suggested &quot;py-qemu.qmp&quot; and Dan suggested &quot;py=
thon-qemu.qmp&quot;.<br>
&gt; I don&#39;t think we explicitly reconciled the difference. I like the<=
br>
&gt; shorter one.)<br>
<br>
Since you CC&#39;d me to this message, I&#39;m going to assume you&#39;re<b=
r>
explicitly welcoming my input on what specific shade this bikeshed<br>
should be painted ;)<br></blockquote></div></div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">More of a &quot;Speak now or forever hold your peace&qu=
ot; =F0=9F=98=85</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div cl=
ass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">I think I would go with =
&quot;python-qemu-qmp&quot;. Having a dot in the name<br></blockquote><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">
of a git repo is not very common AFAICT, and I wouldn&#39;t rule out the<br=
>
possibility of some GitLab feature or other tooling breaking or<br>
misbehaving because of it.<br>
<br>
If you&#39;re really keen on saving those few extra keystrokes, maybe<br>
&quot;pyqemu&quot; is a better prefix than &quot;py-qemu&quot;? I don&#39;t=
 know, it just<br>
looks more natural to me.<br></blockquote></div></div><div dir=3D"auto"><br=
></div><div dir=3D"auto">The idea is to have the repo name resemble the Pyt=
hon package name, which is &quot;qemu.qmp&quot;. For Python, it&#39;s custo=
mary to have the package name match the import name. The import name is &qu=
ot;qemu.qmp&quot;.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I tes=
ted this name on GitLab and it appears to work just fine.</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">I&#39;d add &quot;py:&quot; as a prefix, =
but the colon doesn&#39;t work as a filename in many places, so I suggested=
 &quot;py-&quot;.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thus, =
all together, &quot;py-qemu.qmp&quot;.</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">(I could spell out &quot;python&quot;, I just prefer the sho=
rter prefix because it&#39;s explanatory enough as-is and I like keeping gi=
t checkout names short. My favorite color of bike shed is blue.)</div><div =
dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">
<br>
-- <br>
Andrea Bolognani / Red Hat / Virtualization<br>
<br>
</blockquote></div></div></div>

--0000000000002472f005dd3066f5--


