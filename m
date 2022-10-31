Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEDE6136EF
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:52:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUFO-0008Gd-RK; Mon, 31 Oct 2022 08:50:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1opUFE-0008FO-3E
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:50:24 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1opUF5-0001xZ-ET
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:50:23 -0400
Received: by mail-qt1-x82a.google.com with SMTP id cr19so7321678qtb.0
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rGjlydxghdFevd2Lsx/34rMgyQkceVchoffqRXNt3rs=;
 b=GhWe2b8aHtAAfGgxeFuKnB7U34LkWyCU4p3kzyu/ttp8i8HE7vSUq7C+Y33kBDcfNh
 Z6Fqy8C2O7l+6L3WQICQz4yDPsIlw2ZQvb62IeC+ju9knF0KgPwJXk4UxspF4Q6sWiS3
 TwXGf7eO1nll2BKpgg6Hi5cwQTMzeysbg7pZ2U9IRPoGNtu4DBYb3sLgLnI4LYSaqAYq
 83qfCptx4xGTIhlhYvo4bRvTRwOc7iP391lYczvErBiKeL74Azt6Z/6Uon5oya3WTKj+
 bv1kzlYWjro1sariRKghopqhkRuVN0DLoOezASsn7FFFBJ7Fo9Ly5QntQ0Lyz8638Lf9
 yFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rGjlydxghdFevd2Lsx/34rMgyQkceVchoffqRXNt3rs=;
 b=JyzkjBvnsNEpkbG1/7/10mEcc6qxFawc2auBjJkVDk2zHZDOmTkpJwF+TPg7h95DS9
 OMOGKy8rQBeq/D28k6PIk0LwOupJwCmLQKZeM/vdrTas6xbpbtpoekpWluzoFKxwc1Wa
 LXC1WMBlZxMcWbAGKpyxqu7EaAFuIaLZDp+4ru3PGdzpUr/XbwO3+2kTi7ix40C9kzH/
 ZhwB658mi1L4BM+NUXyN1MFriZ3qei5nYgf99tpV9sgLvxET3xAKpQZttrOx2ovIWYHG
 L7edlPIjiA9mHc3cECJM5EF+YakU39jdM6+UXP4NOnsVV8rwwQJvNa8m18yz74zabHrt
 AsnA==
X-Gm-Message-State: ACrzQf0GuSd2bVFrJ7bP7QTPmKnrfRqT7ZGCbWpX0qYMI18I1RNzNqnb
 qlD+8WauR2lpj9oYjyYVNNek+MBWFFUlI5NwGq4iObTIjlRpmItU
X-Google-Smtp-Source: AMsMyM55ywpvnXHIo1OvLAuzZUzLD0rRYk9BM7HAfjqoINYX7MbWWUVrdVozwBtsB97U9WIPpex3Mr1N09LwNhNkVRg=
X-Received: by 2002:ac8:5f89:0:b0:39c:e5a2:6db9 with SMTP id
 j9-20020ac85f89000000b0039ce5a26db9mr10221019qta.138.1667220614227; Mon, 31
 Oct 2022 05:50:14 -0700 (PDT)
MIME-Version: 1.0
References: <20221027151135.496368-1-mst@redhat.com>
 <20221031114942.36e1dc83@fedora>
 <20221031065126-mutt-send-email-mst@kernel.org>
 <20221031133104.2e4946d8@fedora>
In-Reply-To: <20221031133104.2e4946d8@fedora>
From: Ani Sinha <ani@anisinha.ca>
Date: Mon, 31 Oct 2022 18:20:03 +0530
Message-ID: <CAARzgwwUGtWRWa7LHm2aB+vuJWe76p0uQRL1W6VfN9MbvLpRRA@mail.gmail.com>
Subject: Re: [PATCH] bios-tables-test: do not ignore allowed diff list
To: Igor Mammedov <imammedo@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000793e0505ec540c92"
Received-SPF: none client-ip=2607:f8b0:4864:20::82a;
 envelope-from=ani@anisinha.ca; helo=mail-qt1-x82a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000793e0505ec540c92
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 31, 2022 at 18:01 Igor Mammedov <imammedo@redhat.com> wrote:

> On Mon, 31 Oct 2022 06:52:11 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
>
> > On Mon, Oct 31, 2022 at 11:49:42AM +0100, Igor Mammedov wrote:
> > > On Thu, 27 Oct 2022 11:11:48 -0400
> > > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > >
> > > > we had such a beautiful structure for updating
> > > > expected files, designed to keep bisect working.
> > > > It turns out that we ignored the result of
> > > > the allow list checks unless all tables matched
> > > > anyway.
> > > >
> > > > Sigh.
> > >
> > > strange,
> > > it seems to be working fine (I mean white-listing) here
> >
> > it's pretty clear no? if we only check test_acpi_find_diff_allowed
> > when all tables match anyway, it won't help test pass.
>
> currently all_tables_match is accumulated value that starts with 'true'
> and with the meaning 'do not explode unless at least a table was not
> explicitly whitelisted'
> [...]
> > > >
> > > > -        all_tables_match =3D all_tables_match &&
>   '&&' here serves as a trigger that lets flip always initial
> 'all_tables_match =3D true'
>
> > > > +        all_tables_match =3D all_tables_match ||
>   once it changes to '||' the all_tables_match will never flip to false
> and trigger
>   g_assert(all_tables_match);
> at the end, when there is unexpected (non-whitelisted) table mismatch.
>
> Am I missing something?


Ah you are right. My bad I didn=E2=80=99t see this either.


>
> > > >              test_acpi_find_diff_allowed(exp_sdt);
> > > >
> > > >          /*
> >
>
>

--000000000000793e0505ec540c92
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Oct 31, 2022 at 18:01 Igor Mammedov &lt;<a href=3D"=
mailto:imammedo@redhat.com">imammedo@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(=
204,204,204)">On Mon, 31 Oct 2022 06:52:11 -0400<br>
&quot;Michael S. Tsirkin&quot; &lt;<a href=3D"mailto:mst@redhat.com" target=
=3D"_blank">mst@redhat.com</a>&gt; wrote:<br>
<br>
&gt; On Mon, Oct 31, 2022 at 11:49:42AM +0100, Igor Mammedov wrote:<br>
&gt; &gt; On Thu, 27 Oct 2022 11:11:48 -0400<br>
&gt; &gt; &quot;Michael S. Tsirkin&quot; &lt;<a href=3D"mailto:mst@redhat.c=
om" target=3D"_blank">mst@redhat.com</a>&gt; wrote:<br>
&gt; &gt;=C2=A0 =C2=A0<br>
&gt; &gt; &gt; we had such a beautiful structure for updating<br>
&gt; &gt; &gt; expected files, designed to keep bisect working.<br>
&gt; &gt; &gt; It turns out that we ignored the result of<br>
&gt; &gt; &gt; the allow list checks unless all tables matched<br>
&gt; &gt; &gt; anyway.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Sigh.=C2=A0 <br>
&gt; &gt; <br>
&gt; &gt; strange,<br>
&gt; &gt; it seems to be working fine (I mean white-listing) here=C2=A0 <br=
>
&gt; <br>
&gt; it&#39;s pretty clear no? if we only check test_acpi_find_diff_allowed=
<br>
&gt; when all tables match anyway, it won&#39;t help test pass.<br>
<br>
currently all_tables_match is accumulated value that starts with &#39;true&=
#39;<br>
and with the meaning &#39;do not explode unless at least a table was not<br=
>
explicitly whitelisted&#39;<br>
[...]<br>
&gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 all_tables_match =3D all_tables=
_match &amp;&amp;<br>
=C2=A0 &#39;&amp;&amp;&#39; here serves as a trigger that lets flip always =
initial &#39;all_tables_match =3D true&#39;<br>
<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 all_tables_match =3D all_tables=
_match ||<br>
=C2=A0 once it changes to &#39;||&#39; the all_tables_match will never flip=
 to false<br>
and trigger<br>
=C2=A0 g_assert(all_tables_match);<br>
at the end, when there is unexpected (non-whitelisted) table mismatch.<br>
<br>
Am I missing something?</blockquote><div dir=3D"auto"><br></div><div dir=3D=
"auto">Ah you are right. My bad I didn=E2=80=99t see this either.</div><div=
 dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left=
:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test_acpi_fi=
nd_diff_allowed(exp_sdt);<br>
&gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*=C2=A0 <br>
&gt; <br>
<br>
</blockquote></div></div>

--000000000000793e0505ec540c92--

