Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 619C13E0518
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 18:01:17 +0200 (CEST)
Received: from localhost ([::1]:37416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBJKR-0006ax-Iv
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 12:01:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mBIDa-0000eh-3W
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:50:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mBIDT-0001Ka-Ts
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:50:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628088593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cqd1XK7Gd0nvofoNMQmEqRIhSosqr5kTu/cjFjskcpE=;
 b=Zryip7CbqjFbCf/7z4rN2spoHHG7wZqjLsTBMzIhDKnkDsERml/1jvhJV6DufVy2J+3+wt
 bqYXQNnQXULDxKdOEA9ooXWTjFxohXPHMe4C4qoGYWTlVcz6mcO+e/w6ooLQ8640mpw74g
 PRv3ch54rwciyRgq+xX6c2X56efxIZg=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-vFC9NJy1Mv6v_3R65trtmA-1; Wed, 04 Aug 2021 10:49:50 -0400
X-MC-Unique: vFC9NJy1Mv6v_3R65trtmA-1
Received: by mail-ot1-f69.google.com with SMTP id
 a91-20020a9d26640000b02904f073e6bc1dso889919otb.11
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 07:49:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cqd1XK7Gd0nvofoNMQmEqRIhSosqr5kTu/cjFjskcpE=;
 b=QlwnMTL92R4EYo+ejIsy2ahbmU85VOBOO0BmPr2dPv3xbj2YgGG8Wk/G3vtu7GV11u
 PMVo3PrY4CvJ0oAnD5o5bUrc/uJ2HUcVZZjY6zHZaNfAGp0zgWfZClU3oQOod78qOc9z
 wgA5DNvJbIcbbNxdRAnE7F2BAauOKfKmQl1m+byK3JtDHruFRpA503ldnS/lvrpFi35u
 fu8u/jHzNyvl5F/twPXprFEkWD7FOF3aeWn+0o+A1nILdFa9HSu1Vpf/I7sowSsXg1Y5
 Z7GGp8JGg1buvq7SC7gB8KQIQ3o0PE+RZ5guwPrpmm0yvjTALPSf/9VjXsPNFHPMSV9R
 PGFg==
X-Gm-Message-State: AOAM533IrwrIVjed+37Vak+pO5h8IzIhL5l8YBtezoQWZfyXK0I12ZY5
 vA8oJm158i2pK5r59+qQz+j3fAa1/M0izKc5iJ+XUUyzyRFh7FRiILFfQLYSJoLtrheYF6LGVUM
 LiG0CYWvsy3/GKSY+M7nMp78wBdZxX3E=
X-Received: by 2002:a05:6808:f94:: with SMTP id
 o20mr7093572oiw.112.1628088589487; 
 Wed, 04 Aug 2021 07:49:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz61B7w/hPxevr2rWZkl7flw3XGFsJo0BtnUX8Xu1Zk4sXikYPAstlIym9XM1Q+E9SLtp2Rnj44V2SLOGUaZm0=
X-Received: by 2002:a05:6808:f94:: with SMTP id
 o20mr7093559oiw.112.1628088589313; 
 Wed, 04 Aug 2021 07:49:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210720235619.2048797-1-jsnow@redhat.com>
 <CAFEAcA8fG4Tuk04VuOHoeRBPdjvgDYhyyBUqyKOj045=uqxH1Q@mail.gmail.com>
 <87im0lioj6.fsf@dusky.pond.sub.org>
In-Reply-To: <87im0lioj6.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Wed, 4 Aug 2021 10:49:38 -0400
Message-ID: <CAFn=p-a6pNUV4N6Ziq=9tgNaviNH_XnFUvAf2a9YCXoV7NYMNQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] docs: convert qapi-code-gen.txt to qapi-code-gen.rst
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000007792f05c8bcea55"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000007792f05c8bcea55
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 4, 2021 at 4:48 AM Markus Armbruster <armbru@redhat.com> wrote:

> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Wed, 21 Jul 2021 at 00:58, John Snow <jsnow@redhat.com> wrote:
> >>
> >> Patch 1 does (roughly) the bare minimum, patch 2 adds some formatting,
> >> and patch 3 adds cross-references.
> >>
> >> John Snow (3):
> >>   docs: convert qapi-code-gen.txt to ReST
> >>   docs/qapi-code-gen: Beautify formatting
> >>   docs/qapi-code-gen: add cross-references
> >
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> Let's queue this after my "[PATCH] docs/devel/qapi-code-gen: Update
> examples to match current code".
>
>
Sure. Do you need a rebase? (I don't see that patch in origin/master right
now.)


> For 6.1, or "don't rock the boat now"?
>

No preference. In response to the same question on the other doc conversion
patch, "No preference."

--00000000000007792f05c8bcea55
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 4, 2021 at 4:48 AM Markus=
 Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Peter=
 Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank">=
peter.maydell@linaro.org</a>&gt; writes:<br>
<br>
&gt; On Wed, 21 Jul 2021 at 00:58, John Snow &lt;<a href=3D"mailto:jsnow@re=
dhat.com" target=3D"_blank">jsnow@redhat.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Patch 1 does (roughly) the bare minimum, patch 2 adds some formatt=
ing,<br>
&gt;&gt; and patch 3 adds cross-references.<br>
&gt;&gt;<br>
&gt;&gt; John Snow (3):<br>
&gt;&gt;=C2=A0 =C2=A0docs: convert qapi-code-gen.txt to ReST<br>
&gt;&gt;=C2=A0 =C2=A0docs/qapi-code-gen: Beautify formatting<br>
&gt;&gt;=C2=A0 =C2=A0docs/qapi-code-gen: add cross-references<br>
&gt;<br>
&gt; Reviewed-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.=
org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
<br>
Let&#39;s queue this after my &quot;[PATCH] docs/devel/qapi-code-gen: Updat=
e<br>
examples to match current code&quot;.<br>
<br></blockquote><div><br></div><div>Sure. Do you need a rebase? (I don&#39=
;t see that patch in origin/master right now.)<br></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
For 6.1, or &quot;don&#39;t rock the boat now&quot;?<br></blockquote><div><=
br></div><div>No preference. In response to the same question on the other =
doc conversion patch, &quot;No preference.&quot;<br></div></div></div>

--00000000000007792f05c8bcea55--


