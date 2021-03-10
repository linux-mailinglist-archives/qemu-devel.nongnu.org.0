Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCF43344EA
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 18:16:02 +0100 (CET)
Received: from localhost ([::1]:55728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK2RC-0006T2-Kc
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 12:15:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <famforupstream@gmail.com>)
 id 1lK2Dt-0001su-7h
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:02:13 -0500
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:35319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <famforupstream@gmail.com>)
 id 1lK2Dp-0007dp-Fc
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:02:12 -0500
Received: by mail-lf1-x143.google.com with SMTP id e7so34740598lft.2
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 09:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8dCwZYXqTrzJMZ+77WXlHUVRfGeb79hdOp+dfBCQyLo=;
 b=qCuQ/xREnaw2duTMKUe0Wsyd5To0lpyr6wtLAjWoI6J8tCxAj7zlcLIKaKqwq9CS1K
 onS9Bdc8C0ub8QXSm8OPWMBcRYmtmMEelCwcMRYN/uMpAIc7EakPoNVyOywkbZOMmYpX
 T1bC53AHkHV4M5a97UuJ8IlifrUNGqFrLHyzHROW9+3Qnqca1lmHHCoFmykapOv38bmk
 O58mF871PQ8RWNZZRgWBmXBt3R3hWX6n6gDciYMxt3B2H44o7r38hjfYazhoB/KPJgec
 Wa+Z/at2tLjbs/PLIagDQYf9ZMrk2EYaNd/Tg8vwm7rILsZE51/i8DpPXfEvIUGEpy43
 N8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8dCwZYXqTrzJMZ+77WXlHUVRfGeb79hdOp+dfBCQyLo=;
 b=in6MG0cJ9T+OhAsjSgmbvb9zSeJFoExIE6zp+qxfAjVbzK6/v/jUa0qjQLvk/IHzO2
 /FAKe3dWuZiuxCGklQhYkN1aGTa+eUhwCvEYxjtdfkHkDEXwS3RoLLow5VWleoSpfDU5
 6lRnFhtsUFNRnbw3RTZaocsoWAhzV4PWqrqnc73RFsheTVigJhfrPZL0TaDF75YR8t8U
 DrXxiDDmfPf+1OI5rEDEBoZullDQ+HeXIPgq8nYqI/rCCHZLzxJZkus/nnzc5mdRkEOm
 b83gxLs0A8qEYWBxeDBRBmuZSD8yytGNvsnEnPZOTCAAFDZrGp94w6vPJ5aiWPD5K+fA
 kjbg==
X-Gm-Message-State: AOAM532lwXUWPMKzXWp4KYzbjnk4M6JDWth9GzAQDhTa+mWYUrltxwLl
 vB8hdJVb087RfWUVSV7PhcWdsFs4yQTnRiDFmhY=
X-Google-Smtp-Source: ABdhPJy6kPgLo54ikw/WJF3Oa1B+ZgAkcs9jd3BuT+iS9fVSK/VnV7a9+6fTcZFIbvJGhckkycOEYqbKTeOjakG4kJw=
X-Received: by 2002:a05:6512:131c:: with SMTP id
 x28mr2525647lfu.387.1615395726694; 
 Wed, 10 Mar 2021 09:02:06 -0800 (PST)
MIME-Version: 1.0
References: <20210308154633.158915-1-thuth@redhat.com>
In-Reply-To: <20210308154633.158915-1-thuth@redhat.com>
From: Fam Zheng <famforupstream@gmail.com>
Date: Wed, 10 Mar 2021 17:01:55 +0000
Message-ID: <CAGNx5+0KjgmeMCaDPdPbPoYpB1u7gw+UqmJoD0EAd_uO-L46vQ@mail.gmail.com>
Subject: Re: [PATCH v2] MAINTAINERS: Merge the Gitlab-CI section into the
 generic CI section
To: Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000761d1e05bd31a0bf"
Received-SPF: pass client-ip=2a00:1450:4864:20::143;
 envelope-from=famforupstream@gmail.com; helo=mail-lf1-x143.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000761d1e05bd31a0bf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

My time on QEMU is rather limited and I could hardly look at testing
patches for long. So it makes sense to drop me.

Acked-by: Fam Zheng <fam@euphon.net>

Thanks!
Fam

On Mon, 8 Mar 2021 at 15:50, Thomas Huth <thuth@redhat.com> wrote:

> The status of the gitlab-CI files is currently somewhat confusing, and
> it is often not quite clear whether a patch should go via my tree or
> via the testing tree of Alex. That situation has grown historically...
> Initially, I was the only one using the gitlab-CI, just for my private
> repository there. But in the course of time, the gitlab-CI switched to
> use the containers from tests/docker/ (which is not part of the gitlab-CI
> section in the MAINTAINERS file), and QEMU now even switched to gitlab.co=
m
> completely for the repository and will soon use it as its gating CI, too,
> so it makes way more sense if the gitlab-ci.yml files belong to the peopl=
e
> who are owning the qemu-project on gitlab.com and take care of the gitlab
> CI there. Thus let's merge the gitlab-ci section into the common "test an=
d
> build automation" section.
>
> While we're at it, I'm also removing the line with Fam there for now,
> since he was hardly active during the last years in this area anymore.
> If he ever gets more time for this part again in the future, we surely
> can add the line back again.
>
> Now to avoid that Alex is listed here alone, Philippe and I agreed to
> help as backup maintainers here, too.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2: Keep Philippe and myself as maintainer instead of reviewer
>
>  MAINTAINERS | 21 +++++++--------------
>  1 file changed, 7 insertions(+), 14 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 26c9454823..5c4c179abb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3262,17 +3262,21 @@ F: include/hw/remote/iohub.h
>
>  Build and test automation
>  -------------------------
> -Build and test automation
> +Build and test automation, Linux Continuous Integration
>  M: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> -M: Fam Zheng <fam@euphon.net>
> -R: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> +M: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> +M: Thomas Huth <thuth@redhat.com>
> +R: Wainer dos Santos Moschetta <wainersm@redhat.com>
>  S: Maintained
>  F: .github/lockdown.yml
> +F: .gitlab-ci.yml
> +F: .gitlab-ci.d/
>  F: .travis.yml
>  F: scripts/ci/
>  F: tests/docker/
>  F: tests/vm/
>  F: scripts/archive-source.sh
> +W: https://gitlab.com/qemu-project/qemu/pipelines
>  W: https://travis-ci.org/qemu/qemu
>  W: http://patchew.org/QEMU/
>
> @@ -3289,17 +3293,6 @@ S: Maintained
>  F: .cirrus.yml
>  W: https://cirrus-ci.com/github/qemu/qemu
>
> -GitLab Continuous Integration
> -M: Thomas Huth <thuth@redhat.com>
> -M: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> -M: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> -R: Wainer dos Santos Moschetta <wainersm@redhat.com>
> -S: Maintained
> -F: .gitlab-ci.yml
> -F: .gitlab-ci.d/crossbuilds.yml
> -F: .gitlab-ci.d/*py
> -F: scripts/ci/gitlab-pipeline-status
> -
>  Guest Test Compilation Support
>  M: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>  R: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> --
> 2.27.0
>
>
>

--000000000000761d1e05bd31a0bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div>My time on QEMU is rather limited and =
I could hardly look at testing patches for long. So it makes sense to drop =
me.</div><div><br></div><div>Acked-by: Fam Zheng &lt;<a href=3D"mailto:fam@=
euphon.net">fam@euphon.net</a>&gt;<div></div><br></div><div>Thanks!</div><d=
iv>Fam</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Mon, 8 Mar 2021 at 15:50, Thomas Huth &lt;<a href=3D"mailto:=
thuth@redhat.com">thuth@redhat.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">The status of the gitlab-CI files is curr=
ently somewhat confusing, and<br>
it is often not quite clear whether a patch should go via my tree or<br>
via the testing tree of Alex. That situation has grown historically...<br>
Initially, I was the only one using the gitlab-CI, just for my private<br>
repository there. But in the course of time, the gitlab-CI switched to<br>
use the containers from tests/docker/ (which is not part of the gitlab-CI<b=
r>
section in the MAINTAINERS file), and QEMU now even switched to <a href=3D"=
http://gitlab.com" rel=3D"noreferrer" target=3D"_blank">gitlab.com</a><br>
completely for the repository and will soon use it as its gating CI, too,<b=
r>
so it makes way more sense if the gitlab-ci.yml files belong to the people<=
br>
who are owning the qemu-project on <a href=3D"http://gitlab.com" rel=3D"nor=
eferrer" target=3D"_blank">gitlab.com</a> and take care of the gitlab<br>
CI there. Thus let&#39;s merge the gitlab-ci section into the common &quot;=
test and<br>
build automation&quot; section.<br>
<br>
While we&#39;re at it, I&#39;m also removing the line with Fam there for no=
w,<br>
since he was hardly active during the last years in this area anymore.<br>
If he ever gets more time for this part again in the future, we surely<br>
can add the line back again.<br>
<br>
Now to avoid that Alex is listed here alone, Philippe and I agreed to<br>
help as backup maintainers here, too.<br>
<br>
Signed-off-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=
=3D"_blank">thuth@redhat.com</a>&gt;<br>
---<br>
=C2=A0v2: Keep Philippe and myself as maintainer instead of reviewer<br>
<br>
=C2=A0MAINTAINERS | 21 +++++++--------------<br>
=C2=A01 file changed, 7 insertions(+), 14 deletions(-)<br>
<br>
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index 26c9454823..5c4c179abb 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -3262,17 +3262,21 @@ F: include/hw/remote/iohub.h<br>
<br>
=C2=A0Build and test automation<br>
=C2=A0-------------------------<br>
-Build and test automation<br>
+Build and test automation, Linux Continuous Integration<br>
=C2=A0M: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org" tar=
get=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
-M: Fam Zheng &lt;<a href=3D"mailto:fam@euphon.net" target=3D"_blank">fam@e=
uphon.net</a>&gt;<br>
-R: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com" ta=
rget=3D"_blank">philmd@redhat.com</a>&gt;<br>
+M: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com" ta=
rget=3D"_blank">philmd@redhat.com</a>&gt;<br>
+M: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=3D"_blank">t=
huth@redhat.com</a>&gt;<br>
+R: Wainer dos Santos Moschetta &lt;<a href=3D"mailto:wainersm@redhat.com" =
target=3D"_blank">wainersm@redhat.com</a>&gt;<br>
=C2=A0S: Maintained<br>
=C2=A0F: .github/lockdown.yml<br>
+F: .gitlab-ci.yml<br>
+F: .gitlab-ci.d/<br>
=C2=A0F: .travis.yml<br>
=C2=A0F: scripts/ci/<br>
=C2=A0F: tests/docker/<br>
=C2=A0F: tests/vm/<br>
=C2=A0F: scripts/archive-source.sh<br>
+W: <a href=3D"https://gitlab.com/qemu-project/qemu/pipelines" rel=3D"noref=
errer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/pipelines</a>=
<br>
=C2=A0W: <a href=3D"https://travis-ci.org/qemu/qemu" rel=3D"noreferrer" tar=
get=3D"_blank">https://travis-ci.org/qemu/qemu</a><br>
=C2=A0W: <a href=3D"http://patchew.org/QEMU/" rel=3D"noreferrer" target=3D"=
_blank">http://patchew.org/QEMU/</a><br>
<br>
@@ -3289,17 +3293,6 @@ S: Maintained<br>
=C2=A0F: .cirrus.yml<br>
=C2=A0W: <a href=3D"https://cirrus-ci.com/github/qemu/qemu" rel=3D"noreferr=
er" target=3D"_blank">https://cirrus-ci.com/github/qemu/qemu</a><br>
<br>
-GitLab Continuous Integration<br>
-M: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=3D"_blank">t=
huth@redhat.com</a>&gt;<br>
-M: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com" ta=
rget=3D"_blank">philmd@redhat.com</a>&gt;<br>
-M: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org" target=
=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
-R: Wainer dos Santos Moschetta &lt;<a href=3D"mailto:wainersm@redhat.com" =
target=3D"_blank">wainersm@redhat.com</a>&gt;<br>
-S: Maintained<br>
-F: .gitlab-ci.yml<br>
-F: .gitlab-ci.d/crossbuilds.yml<br>
-F: .gitlab-ci.d/*py<br>
-F: scripts/ci/gitlab-pipeline-status<br>
-<br>
=C2=A0Guest Test Compilation Support<br>
=C2=A0M: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org" tar=
get=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
=C2=A0R: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org"=
 target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
-- <br>
2.27.0<br>
<br>
<br>
</blockquote></div>

--000000000000761d1e05bd31a0bf--

