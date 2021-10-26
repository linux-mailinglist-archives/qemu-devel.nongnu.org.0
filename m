Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA2343BA95
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 21:19:34 +0200 (CEST)
Received: from localhost ([::1]:52660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfRyv-0000Bq-Gq
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 15:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfRxq-00079B-7J
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 15:18:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfRxm-0002jK-FY
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 15:18:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635275900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SaA8lM+twoIRwUaSaFOjpPiedUh/DanAegjIIZH2wE0=;
 b=LkS3fGJ7jvLG5b5mcgLppT67nITYuDEyCp4HP8mlg/TbCqHAgRa9cb1D/9WIb6Iy/BjH1X
 5B+gsAR7CIweZyHOirxpM/10D0VaF5RRqxBV/DwsvEndxKG9YKJV+T2pvTWsTmiJcgIIqv
 TENftJxTO+QPtuRvX4SgMvwgAi6QnAg=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-i6YM9kTGOMeTsrOYZP3MqA-1; Tue, 26 Oct 2021 15:18:18 -0400
X-MC-Unique: i6YM9kTGOMeTsrOYZP3MqA-1
Received: by mail-vk1-f198.google.com with SMTP id
 w124-20020a1fc682000000b0029aceaf35b2so201187vkf.19
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 12:18:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SaA8lM+twoIRwUaSaFOjpPiedUh/DanAegjIIZH2wE0=;
 b=huOWjvadkIXjwYt1NTDl+e3z2uL8UBkz1FriPtmIMRyYhbdSAyrFe0QKzKO9mgf36O
 qwAHjsipF6/4cpKHW5XQy3eTQ44gyYdJFpSC9eK0yu4e4ZirnZGtvWHTlwkeYGp4DKZ7
 zHWwQQX0Y/E7sLchjiD9lP8uPjVoO218zZ4Bz19vxpTZcbSG5/wRnfosdrrKpreGMYRT
 b3Y0M18AURUXvL27QtRbT7NfvqycneVJyu/P4Cu6mp0YuA1P/vnGYoIk4lZtdOAlchgw
 A/9zA8oj14WYJPOiQOGvW9/DqdXa49d0b5+8VTpz7q6Vvwx+wtl3NBfrqvj5H/GAHUPw
 jQGQ==
X-Gm-Message-State: AOAM531dJsbJRMNFIuUOTaAqU6B9vf7zDKmtBI3YV4NuTlKJhpzikc9A
 cx7HTpz0i6pYmGsHKc2bzgFBJlTr2xa/roWkUOBogEkZL5oFv36WGacytVt04Bqtayabcn41iZ1
 K3EmS8EOmyYOt5zEiDSrpp63qv22FAYU=
X-Received: by 2002:a05:6122:2020:: with SMTP id
 l32mr1592843vkd.10.1635275898108; 
 Tue, 26 Oct 2021 12:18:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1xwdiJvQwl9Og6pidV8zm/kKiO+r02btCLWmkPClTKoFTu1QFtRXnOnyXY1iv7nT80pOayVC6oobHu2/5VGQ=
X-Received: by 2002:a05:6122:2020:: with SMTP id
 l32mr1592789vkd.10.1635275897847; 
 Tue, 26 Oct 2021 12:18:17 -0700 (PDT)
MIME-Version: 1.0
References: <20211011131558.3273255-1-armbru@redhat.com>
 <YWVsheOBwyx+3QOM@redhat.com> <87r1cq78hs.fsf@dusky.pond.sub.org>
In-Reply-To: <87r1cq78hs.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Tue, 26 Oct 2021 15:18:07 -0400
Message-ID: <CAFn=p-ZOE+KgYE8FoAeCpW+FL3cRgM1HKzAQFy8TBYigZQb6HQ@mail.gmail.com>
Subject: Re: [PATCH] qapi: Improve input_type_enum()'s error message
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000000054f205cf46572c"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_BL_SPAMCOP_NET=1.347, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 qemu-devel <qemu-devel@nongnu.org>, Max Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000054f205cf46572c
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 12, 2021 at 8:10 AM Markus Armbruster <armbru@redhat.com> wrote:

> Kevin Wolf <kwolf@redhat.com> writes:
>
> > Am 11.10.2021 um 15:15 hat Markus Armbruster geschrieben:
> >> The error message claims the parameter is invalid:
> >>
> >>     $ qemu-system-x86_64 -object qom-type=nonexistent
> >>     qemu-system-x86_64: -object qom-type=nonexistent: Invalid parameter
> 'nonexistent'
> >>
> >> What's wrong is actually the *value* 'nonexistent'.  Improve the
> >> message to
> >>
> >>     qemu-system-x86_64: -object qom-type=nonexistent: Parameter
> 'qom-type' does not accept value 'nonexistent'
> >>
> >> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> >> ---
> >>  qapi/qapi-visit-core.c          | 3 ++-
> >>  tests/unit/check-qom-proplist.c | 2 +-
> >>  tests/qemu-iotests/049.out      | 6 +++---
> >>  tests/qemu-iotests/206.out      | 2 +-
> >>  tests/qemu-iotests/237.out      | 6 +++---
> >>  tests/qemu-iotests/245          | 2 +-
> >
> > Good that you remembered to update iotests cases. I'm afraid there are
> > two more that need an update.
> >
> > 287 contains these lines:
> >
> >     output=$(_make_test_img -o 'compression_type=zstd' 64M;
> _cleanup_test_img)
> >     if echo "$output" | grep -q "Invalid parameter 'zstd'"; then
> >         _notrun "ZSTD is disabled"
> >     fi
> >
> > Instead of skipping the test case when zstd support is not compiled in,
> > this test fails now.
> >
> > 308 contains a similar check for FUSE support and fails now when FUSE
> > support is disabled.
>
> 287 passes for me.  I figure that's because I built with CONFIG_ZSTD.
> 308 I simply missed.
>
> Thanks for your help!
>

This likely fixes https://gitlab.com/qemu-project/qemu/-/issues/608 and you
could include that in your commit message if it isn't too late.

--js

--0000000000000054f205cf46572c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 12, 2021 at 8:10 AM Marku=
s Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Kevi=
n Wolf &lt;<a href=3D"mailto:kwolf@redhat.com" target=3D"_blank">kwolf@redh=
at.com</a>&gt; writes:<br>
<br>
&gt; Am 11.10.2021 um 15:15 hat Markus Armbruster geschrieben:<br>
&gt;&gt; The error message claims the parameter is invalid:<br>
&gt;&gt; <br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0$ qemu-system-x86_64 -object qom-type=3Dnonexis=
tent<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0qemu-system-x86_64: -object qom-type=3Dnonexist=
ent: Invalid parameter &#39;nonexistent&#39;<br>
&gt;&gt; <br>
&gt;&gt; What&#39;s wrong is actually the *value* &#39;nonexistent&#39;.=C2=
=A0 Improve the<br>
&gt;&gt; message to<br>
&gt;&gt; <br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0qemu-system-x86_64: -object qom-type=3Dnonexist=
ent: Parameter &#39;qom-type&#39; does not accept value &#39;nonexistent&#3=
9;<br>
&gt;&gt; <br>
&gt;&gt; Signed-off-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redh=
at.com" target=3D"_blank">armbru@redhat.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 qapi/qapi-visit-core.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 3=
 ++-<br>
&gt;&gt;=C2=A0 tests/unit/check-qom-proplist.c | 2 +-<br>
&gt;&gt;=C2=A0 tests/qemu-iotests/049.out=C2=A0 =C2=A0 =C2=A0 | 6 +++---<br=
>
&gt;&gt;=C2=A0 tests/qemu-iotests/206.out=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;&gt;=C2=A0 tests/qemu-iotests/237.out=C2=A0 =C2=A0 =C2=A0 | 6 +++---<br=
>
&gt;&gt;=C2=A0 tests/qemu-iotests/245=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2=
 +-<br>
&gt;<br>
&gt; Good that you remembered to update iotests cases. I&#39;m afraid there=
 are<br>
&gt; two more that need an update.<br>
&gt;<br>
&gt; 287 contains these lines:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0output=3D$(_make_test_img -o &#39;compression_type=
=3Dzstd&#39; 64M; _cleanup_test_img)<br>
&gt;=C2=A0 =C2=A0 =C2=A0if echo &quot;$output&quot; | grep -q &quot;Invalid=
 parameter &#39;zstd&#39;&quot;; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_notrun &quot;ZSTD is disabled&quot;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0fi<br>
&gt;<br>
&gt; Instead of skipping the test case when zstd support is not compiled in=
,<br>
&gt; this test fails now.<br>
&gt;<br>
&gt; 308 contains a similar check for FUSE support and fails now when FUSE<=
br>
&gt; support is disabled.<br>
<br>
287 passes for me.=C2=A0 I figure that&#39;s because I built with CONFIG_ZS=
TD.<br>
308 I simply missed.<br>
<br>
Thanks for your help!<br></blockquote><div><br></div><div>This likely fixes=
 <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/608">https://gitl=
ab.com/qemu-project/qemu/-/issues/608</a> and you could include that in you=
r commit message if it isn&#39;t too late.</div><div><br></div><div>--js<br=
> </div></div></div>

--0000000000000054f205cf46572c--


