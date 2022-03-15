Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 927FE4D9B42
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 13:32:03 +0100 (CET)
Received: from localhost ([::1]:55228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU6LJ-0008Oc-1L
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 08:32:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nU698-0005Ue-G6
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:19:29 -0400
Received: from [2a00:1450:4864:20::12d] (port=34796
 helo=mail-lf1-x12d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nU696-0001mK-Ss
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:19:26 -0400
Received: by mail-lf1-x12d.google.com with SMTP id e6so26011776lfc.1
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 05:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ydYFYE+7nA9D/pceOi8sh8hVJ3Cjr6vb8CMTuO+p+zw=;
 b=OQHgSDyzPIKhLIjmLyEn7hSPZmoDUUmQhCcFZD9wcQUY7IzOfYr1unzZ2Nallu9v73
 hsXqFWwXernQXFA4kyFKlnOaIzLTLwPSobxArMDImyISULqEJjZ+W9jtT95DWoE/21I1
 HwRspOKIbQM4HhH2y0Xdua3j+cQF1yhkn9b0NAsyEYgGsFCAfUXLh4Sx443/cBQSHcJT
 sbhp0jsp3JjGIdnGoB/PSI8g/enbmAPJY3FRIdi9hOKN+lq4oDAFtdbkdySnov9L50er
 eLQkcQscdfVYEHYmg8Gp7N2BZiWKP0v+NlzrOUgiG7bK/8r01K0kCe8kyVDpsHFhTh+7
 ncIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ydYFYE+7nA9D/pceOi8sh8hVJ3Cjr6vb8CMTuO+p+zw=;
 b=3kGX61Dlyirz0sOHmiR8KBbM7mqp1ar5Dy7fSIJXb2kd1n3QeA59nyj6+iz3sVNi80
 w9agfby5ORHmoMVDyuXxBsRYhMywGE0GBFYoiwM//lGFJztbNyEhaFaH1MFLrZDFFkLZ
 C1Vc8eSnHuZ9wRhsAGj1W49DqJWdg+2lWRXc9eNdeXtPa2v1QLMINJVmKz4mnOWRS0X4
 20EX/LtQuZ2BvelJHJp+A77nqnLUQGJ0z0qmDBZhguLus6NJKsbgIBhTBKx/rXV7r/L9
 oNp6CcJKUhPC/BL5WcJSK69ev6qqxIAD8HKpBa0szhBgrXNuiHnQGjs44pXHwSKfOBif
 yy6A==
X-Gm-Message-State: AOAM5324MYZidIyw5LdHxV+69xxv7bBVvIcC04rzzcIMkr7ATyKeoF2t
 hjWzrLcAHsiob3Bea+sDQ3v1/g3D+naIui5O5H1sAWzWluA=
X-Google-Smtp-Source: ABdhPJyRtOiy9QROOYXkq8ZF6llGHW/pQ1bZAoxr1gCk66J+XkOJQuoxCYwKsfjiaJwhtSow3y+x06ih7TXiHgEW6i0=
X-Received: by 2002:a05:6512:6ce:b0:448:46c6:b93e with SMTP id
 u14-20020a05651206ce00b0044846c6b93emr15708320lff.46.1647346761687; Tue, 15
 Mar 2022 05:19:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220315121251.2280317-1-alex.bennee@linaro.org>
 <20220315121251.2280317-9-alex.bennee@linaro.org>
In-Reply-To: <20220315121251.2280317-9-alex.bennee@linaro.org>
From: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Date: Tue, 15 Mar 2022 12:19:09 +0000
Message-ID: <CAHDbmO31PZVCaUE5Y00zECXtUEEji49v79XPY73PU4iO9vFvQA@mail.gmail.com>
Subject: Re: [PATCH v1 8/8] gitlab: include new aarch32 job in custom-runners
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000008d7ef905da40ce1e"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=alex.bennee@linaro.org; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>, sw@weilnetz.de, richard.henderson@linaro.org,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-arm@nongnu.org, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008d7ef905da40ce1e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

And of course after sending I immediately see the aarch32 job is misnamed.
Will send a v2 follow-up individually

On Tue, 15 Mar 2022 at 12:12, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:

> Without linking it in it won't be presented on the UI.
>
> Fixes: cc44a16002 ("gitlab: add a new aarch32 custom runner definition")
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  .gitlab-ci.d/custom-runners.yml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/.gitlab-ci.d/custom-runners.yml
> b/.gitlab-ci.d/custom-runners.yml
> index 3e76a2034a..15aaccc481 100644
> --- a/.gitlab-ci.d/custom-runners.yml
> +++ b/.gitlab-ci.d/custom-runners.yml
> @@ -16,4 +16,5 @@ variables:
>  include:
>    - local: '/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml'
>    - local: '/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml'
> +  - local: '/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml'
>    - local: '/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml'
> --
> 2.30.2
>
>

--=20
Alex Benn=C3=A9e
KVM/QEMU Hacker for Linaro

--0000000000008d7ef905da40ce1e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">And of course after sending I immediately see the aarch32 =
job is misnamed. Will send a v2 follow-up individually<br></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 15 Mar 20=
22 at 12:12, Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org"=
>alex.bennee@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Without linking it in it won&#39;t be presented on t=
he UI.<br>
<br>
Fixes: cc44a16002 (&quot;gitlab: add a new aarch32 custom runner definition=
&quot;)<br>
Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.or=
g" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
---<br>
=C2=A0.gitlab-ci.d/custom-runners.yml | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.=
yml<br>
index 3e76a2034a..15aaccc481 100644<br>
--- a/.gitlab-ci.d/custom-runners.yml<br>
+++ b/.gitlab-ci.d/custom-runners.yml<br>
@@ -16,4 +16,5 @@ variables:<br>
=C2=A0include:<br>
=C2=A0 =C2=A0- local: &#39;/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.=
yml&#39;<br>
=C2=A0 =C2=A0- local: &#39;/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch6=
4.yml&#39;<br>
+=C2=A0 - local: &#39;/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml=
&#39;<br>
=C2=A0 =C2=A0- local: &#39;/.gitlab-ci.d/custom-runners/centos-stream-8-x86=
_64.yml&#39;<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Alex Benn=C3=A9e<br>KVM/QEMU Hacker for Linaro</div>

--0000000000008d7ef905da40ce1e--

