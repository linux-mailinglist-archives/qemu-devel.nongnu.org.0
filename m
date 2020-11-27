Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B34B92C6D96
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Nov 2020 00:22:43 +0100 (CET)
Received: from localhost ([::1]:55618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kin4b-0003pD-T8
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 18:22:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1kin3Y-0003HP-8W
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 18:21:36 -0500
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:35529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1kin3W-0007xI-7m
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 18:21:36 -0500
Received: by mail-il1-x136.google.com with SMTP id t13so5941970ilp.2
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 15:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xsF4qRa6qfSgJCdSwafn5Ows0f+3PgB1s/V8gjeVHSg=;
 b=G+Fyj0gUUbscrsWhKws0OiNib9xgYSnEaT/12BrsEV9aktvvE0NAisjnonuNS7SdMx
 H/lB0QkOli9m1t2CHFnkm9WzDhXQuSLGx3O8W1j0wLqOzRtYZATalhdXSEU392EXdruA
 7zok5rARUWlgh6CVI0zY49VK1LajCX2fzmdOE3CoO4CIvVEYTciMWFO9UscxCUNqEjGD
 0JxjwJ/spszbMH7P4FVNZSQqhU3iQRlea6I5qqp0rL4Yn9Ipqz4byy+3qv3zgZlmdxEY
 1PkiolYRah+xUWDyT8XDEvJ5vwx8C4rD7h174hNPDMvtPe1OMUX44/+maWURZwEnZeUu
 tNFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xsF4qRa6qfSgJCdSwafn5Ows0f+3PgB1s/V8gjeVHSg=;
 b=kIC7DbvQTXnpDMjnwbpp2dSytyjHe8xB9ffqZsH5xZ5oGr+1hwcMRQCH1fKu1G8Mtj
 ID1LOc9hdAMlyTIPp6NgphUmTSRAGAHRuiSIqkUkOSsBaCguWeLxe7/zmuhd6dlxkfxo
 k2tODb23pQXh47YDbhJzkVwqJouaHDWj2b82oRQ3VJlHJbSoecyRJjC58rztWA0sgOFL
 LyI6H5vYaDHzdfEU+UDwfNAVR6OYx9WWkXzrG1t2/0Xie2Cc7a0sRVEZ2SjG1xcpGJVk
 yJJ4zcocfKMj03/QNoQRWEGoqTJ1MY6kMLZJlapQnGGYM+l4oD/ammHfK7emzXux1Ta7
 chdg==
X-Gm-Message-State: AOAM532RwqgmTKvm+mY3THaPjZaJ8pRpjWWTP01FlLHEycOPzYEidS2K
 qJvj7nivytHwTZOwHyoiipNFqTDu8Nfo7BVQbu4=
X-Google-Smtp-Source: ABdhPJzGx+kSUgvJcYTYhEvkYFZBy/l7fx07H67gITNwGo8QYrEb9kZmdVwrq7OsPXCzrlA4OzV37l8fLgE/91B1q+U=
X-Received: by 2002:a92:ca91:: with SMTP id t17mr8286914ilo.67.1606519292632; 
 Fri, 27 Nov 2020 15:21:32 -0800 (PST)
MIME-Version: 1.0
References: <20201127174110.1932671-1-philmd@redhat.com>
 <b08db31b-1411-6936-f737-0d6c8f98ebb8@redhat.com>
 <f32a1db5-5231-fc4d-1741-0b5ee13f618f@redhat.com>
In-Reply-To: <f32a1db5-5231-fc4d-1741-0b5ee13f618f@redhat.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Sat, 28 Nov 2020 00:21:22 +0100
Message-ID: <CAPan3WrQS9dNcRx7be9MoXC7fGUbZqOUYtBMLKkiQHDnC3b+ag@mail.gmail.com>
Subject: Re: [RFC PATCH-for-5.2] gitlab-ci: Do not automatically run Avocado
 integration tests anymore
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000c322bc05b51eeb17"
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-il1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 virt-ci-maint-team@redhat.com, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c322bc05b51eeb17
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philippe, Thomas,

Op vr 27 nov. 2020 18:57 schreef Philippe Mathieu-Daud=C3=A9 <philmd@redhat=
.com>:

> On 11/27/20 6:47 PM, Thomas Huth wrote:
> > On 27/11/2020 18.41, Philippe Mathieu-Daud=C3=A9 wrote:
> >> We lately realized that the Avocado framework was not designed
> >> to be regularly run on CI environments. Therefore, as of 5.2
> >> we deprecate the gitlab-ci jobs using Avocado. To not disrupt
> >> current users, it is possible to keep the current behavior by
> >> setting the QEMU_CI_INTEGRATION_JOBS_PRE_5_2_RELEASE variable
> >> (see [*]).
> >> From now on, using these jobs (or adding new tests to them)
> >> is strongly discouraged.
> >>
> >> Tests based on Avocado will be ported to new job schemes during
> >> the next releases, with better documentation and templates.
> >
> > Why should we disable the jobs by default as long as there is no
> replacement
> > available yet?
>
> Why keep it enabled if it is failing randomly, if images hardcoded
> in tests are being removed from public servers, etc...?
>
>
> They are not disabled, they are still runnable manually or setting
> QEMU_CI_INTEGRATION_JOBS_PRE_5_2_RELEASE...
>
> We realized by default Avocado runs all tests on the CI jobs,
> triggering failures and complains. Developer stopped to contribute/
> review integration tests because of that. We want developers be
> able to contribute tests to the repository fearlessly.
>
> If we don't change anything, we'll keep having CI failures due
> to Avocado design issues (artifacts removed from remote servers,
> etc...).
>

I share your concern about the artifacts not being stored on a reliable
location that can be used for all Qemu acceptance tests. In particular for
the Orange Pi PC tests we have seen it happening, that the image we use was
removed from the armbian server.

As a temporary solution perhaps we can use github to store artifacts, until
we have a proper location?


> I haven't seen any attempt on this list to improve the current
> fragile situation, but better suggestions are certainly welcome.
>
> Thanks,
>
> Phil.
>
>
>

--000000000000c322bc05b51eeb17
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Philippe, Thomas,<br><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">Op vr 27 nov. 2020 18:57 schreef P=
hilippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@=
redhat.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 11/27/20 6:4=
7 PM, Thomas Huth wrote:<br>
&gt; On 27/11/2020 18.41, Philippe Mathieu-Daud=C3=A9 wrote:<br>
&gt;&gt; We lately realized that the Avocado framework was not designed<br>
&gt;&gt; to be regularly run on CI environments. Therefore, as of 5.2<br>
&gt;&gt; we deprecate the gitlab-ci jobs using Avocado. To not disrupt<br>
&gt;&gt; current users, it is possible to keep the current behavior by<br>
&gt;&gt; setting the QEMU_CI_INTEGRATION_JOBS_PRE_5_2_RELEASE variable<br>
&gt;&gt; (see [*]).<br>
&gt;&gt; From now on, using these jobs (or adding new tests to them)<br>
&gt;&gt; is strongly discouraged.<br>
&gt;&gt;<br>
&gt;&gt; Tests based on Avocado will be ported to new job schemes during<br=
>
&gt;&gt; the next releases, with better documentation and templates.<br>
&gt; <br>
&gt; Why should we disable the jobs by default as long as there is no repla=
cement<br>
&gt; available yet?<br>
<br>
Why keep it enabled if it is failing randomly, if images hardcoded<br>
in tests are being removed from public servers, etc...?<br><br>
<br>
They are not disabled, they are still runnable manually or setting<br>
QEMU_CI_INTEGRATION_JOBS_PRE_5_2_RELEASE...<br>
<br>
We realized by default Avocado runs all tests on the CI jobs,<br>
triggering failures and complains. Developer stopped to contribute/<br>
review integration tests because of that. We want developers be<br>
able to contribute tests to the repository fearlessly.<br>
<br>
If we don&#39;t change anything, we&#39;ll keep having CI failures due<br>
to Avocado design issues (artifacts removed from remote servers,<br>
etc...).<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">I share your concern about the artifacts not being stored on a re=
liable location that can be used for all Qemu acceptance tests. In particul=
ar for the Orange Pi PC tests we have seen it happening, that the image we =
use was removed from the armbian server.</div><div dir=3D"auto"><br></div><=
div dir=3D"auto">As a temporary solution perhaps we can use github to store=
 artifacts, until we have a proper location?</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">
<br>
I haven&#39;t seen any attempt on this list to improve the current<br>
fragile situation, but better suggestions are certainly welcome.<br>
<br>
Thanks,<br>
<br>
Phil.<br>
<br>
<br>
</blockquote></div></div></div>

--000000000000c322bc05b51eeb17--

