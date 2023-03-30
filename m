Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 155956D09C3
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 17:35:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phuIn-0005kK-CF; Thu, 30 Mar 2023 11:35:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1phuIk-0005jm-08
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 11:34:58 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1phuIf-0007Bd-PB
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 11:34:57 -0400
Received: by mail-ed1-x52e.google.com with SMTP id er13so37093196edb.9
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 08:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1680190491;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VYTCdtgQvqAl7Z8BOj8EWcVApZN8M+KL3m5nJMmwpxw=;
 b=m8axK4R3i871UGZzTSwNibeJgjtpoDzvTQBqKbyFvcq9QO1xVM3M+SLfN7mYsq94IW
 5tfkosfsb9pApKH0jNIx1q8yGZ766pUysSZFLysleXtSBc3Di1Szl9+slRrIdFfPQaCG
 lRUHg8BXrO4+EpSIFECCM04hp+ahPirrbSjszDM96uVs+2j4QjX1EdbIg77Sy7XGC6q7
 TWIbj17jgW5RhbaAaQWTylmkMEs8O8woGCPduODShaJ+DlbK1Nng7OsJqj20DrVpBvcF
 AsNoK6m30tLGyUN5xtQLBbYsz+WDQoffzst3rcZtK/feUc3LVpNwM+IRFti4h8RYbtXG
 ioHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680190491;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VYTCdtgQvqAl7Z8BOj8EWcVApZN8M+KL3m5nJMmwpxw=;
 b=iXlmJAfrYNwQDGsQM8zyOYPSGIXucwAV5QCYubUNPSZLANoJDWkhzc9F5vsmg0x/DI
 5wOZAIkbZtKdRQUVKW/Rr3vx556iwZ+4aYI6og2r0ZQ0UdAVGmnRftg4qSuAkDj+84Xr
 0rJtY3W5hIUf9Kbr+dCbBZDqenPUq/barDzox12b7or6FtdzUwa3slau8jVhtR3mB6u7
 5Mt1CPYpWIZ7F0L9kshQt7jQaVEbYPsraxdRDtnbbpwR2N8DudYEkOOmKEZVHr3v6qeu
 iP/YU7l2LDmbqBsxmhshYXMfBRxwOMItFv/R0gQcyANJssrw2AsnqLZdGu2rgF/Ytxch
 3ksg==
X-Gm-Message-State: AAQBX9dbTaQijSxkgEeT9iixVtTEVZsEX4dOGBOu43uwwz22gm0pof9S
 emEvtRabO6L0dAIkAxhMdOwEkh4nzvv/LeWqONEf/Q==
X-Google-Smtp-Source: AKy350ZweD9RS2XpOGiraWQNyc7pdiHGaGzIH6WWsaCV8a3cPwdXqkvuH2q8g+4AVqLHdKfQrK7xXfw2Y8pbDWocRZ8=
X-Received: by 2002:a17:906:3505:b0:931:faf0:3db1 with SMTP id
 r5-20020a170906350500b00931faf03db1mr3131975eja.4.1680190491053; Thu, 30 Mar
 2023 08:34:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230330101141.30199-1-alex.bennee@linaro.org>
 <20230330101141.30199-4-alex.bennee@linaro.org>
In-Reply-To: <20230330101141.30199-4-alex.bennee@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 30 Mar 2023 17:34:40 +0200
Message-ID: <CANCZdfoq2zF3txOwR5ZiDD+uKJmKRL68hSn+u3_vZdUuhi5oAg@mail.gmail.com>
Subject: Re: [PATCH 03/11] MAINTAINERS: add a section for policy documents
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Ryo ONODERA <ryoon@netbsd.org>, 
 Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Kyle Evans <kevans@freebsd.org>, Reinoud Zandijk <reinoud@netbsd.org>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Kashyap Chamarthy <kchamart@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Bernhard Beschow <shentey@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000005fe07d05f81fd560"
Received-SPF: none client-ip=2a00:1450:4864:20::52e;
 envelope-from=wlosh@bsdimp.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000005fe07d05f81fd560
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alex,

On Thu, Mar 30, 2023 at 12:11=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@lina=
ro.org> wrote:

> We don't update these often but if you are the sort of person who
> enjoys debating and tuning project policies you could now add yourself
> as a reviewer here so you don't miss the next debate over tabs vs
> spaces ;-)
>
> Who's with me?
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Kashyap Chamarthy <kchamart@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Cc: Bernhard Beschow <shentey@gmail.com>
>

Reviewed-by: Warner Losh <imp@bsdimp.com>

Since I'm not on the list, I approve :). I had enough dealing with code of
conduct issues with FreeBSD to last for any number of years...

Warner


> ---
> v2
>   - s/your/you are/
>   - add some willing victims
> ---
>  MAINTAINERS | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9e1a60ea24..2c173dbd96 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -64,6 +64,19 @@ L: qemu-devel@nongnu.org
>  F: *
>  F: */
>
> +Project policy and developer guides
> +R: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> +R: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> +R: Thomas Huth <thuth@redhat.com>
> +R: Markus Armbruster <armbru@redhat.com>
> +W: https://www.qemu.org/docs/master/devel/index.html
> +S: Odd Fixes
> +F: docs/devel/style.rst
> +F: docs/devel/code-of-conduct.rst
> +F: docs/devel/conflict-resolution.rst
> +F: docs/devel/submitting-a-patch.rst
> +F: docs/devel/submitting-a-pull-request.rst
> +
>  Responsible Disclosure, Reporting Security Issues
>  -------------------------------------------------
>  W: https://wiki.qemu.org/SecurityProcess
> --
> 2.39.2
>
>

--0000000000005fe07d05f81fd560
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Alex,</div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 30, 2023 at 12:11=E2=80=
=AFPM Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.b=
ennee@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">We don&#39;t update these often but if you are the sort of =
person who<br>
enjoys debating and tuning project policies you could now add yourself<br>
as a reviewer here so you don&#39;t miss the next debate over tabs vs<br>
spaces ;-)<br>
<br>
Who&#39;s with me?<br>
<br>
Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.or=
g" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
Cc: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=3D"_blank">t=
huth@redhat.com</a>&gt;<br>
Cc: Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com" targ=
et=3D"_blank">berrange@redhat.com</a>&gt;<br>
Cc: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" target=3D"_b=
lank">armbru@redhat.com</a>&gt;<br>
Cc: Kashyap Chamarthy &lt;<a href=3D"mailto:kchamart@redhat.com" target=3D"=
_blank">kchamart@redhat.com</a>&gt;<br>
Cc: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_bla=
nk">pbonzini@redhat.com</a>&gt;<br>
Cc: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D=
"_blank">peter.maydell@linaro.org</a>&gt;<br>
Cc: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org" ta=
rget=3D"_blank">philmd@linaro.org</a>&gt;<br>
Cc: Bernhard Beschow &lt;<a href=3D"mailto:shentey@gmail.com" target=3D"_bl=
ank">shentey@gmail.com</a>&gt;<br></blockquote><div><br></div><div>Reviewed=
-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.com</a>&g=
t;</div><div><br></div><div>Since I&#39;m not on the list, I approve :). I =
had enough dealing with code of conduct issues with FreeBSD to last for any=
 number of years...</div><div><br></div><div>Warner</div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
v2<br>
=C2=A0 - s/your/you are/<br>
=C2=A0 - add some willing victims<br>
---<br>
=C2=A0MAINTAINERS | 13 +++++++++++++<br>
=C2=A01 file changed, 13 insertions(+)<br>
<br>
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index 9e1a60ea24..2c173dbd96 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -64,6 +64,19 @@ L: <a href=3D"mailto:qemu-devel@nongnu.org" target=3D"_b=
lank">qemu-devel@nongnu.org</a><br>
=C2=A0F: *<br>
=C2=A0F: */<br>
<br>
+Project policy and developer guides<br>
+R: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org" target=
=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
+R: Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com" targ=
et=3D"_blank">berrange@redhat.com</a>&gt;<br>
+R: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=3D"_blank">t=
huth@redhat.com</a>&gt;<br>
+R: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" target=3D"_b=
lank">armbru@redhat.com</a>&gt;<br>
+W: <a href=3D"https://www.qemu.org/docs/master/devel/index.html" rel=3D"no=
referrer" target=3D"_blank">https://www.qemu.org/docs/master/devel/index.ht=
ml</a><br>
+S: Odd Fixes<br>
+F: docs/devel/style.rst<br>
+F: docs/devel/code-of-conduct.rst<br>
+F: docs/devel/conflict-resolution.rst<br>
+F: docs/devel/submitting-a-patch.rst<br>
+F: docs/devel/submitting-a-pull-request.rst<br>
+<br>
=C2=A0Responsible Disclosure, Reporting Security Issues<br>
=C2=A0-------------------------------------------------<br>
=C2=A0W: <a href=3D"https://wiki.qemu.org/SecurityProcess" rel=3D"noreferre=
r" target=3D"_blank">https://wiki.qemu.org/SecurityProcess</a><br>
-- <br>
2.39.2<br>
<br>
</blockquote></div></div>

--0000000000005fe07d05f81fd560--

