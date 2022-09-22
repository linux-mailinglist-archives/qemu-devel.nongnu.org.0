Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9743A5E6CF6
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 22:23:02 +0200 (CEST)
Received: from localhost ([::1]:36382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obSir-0001dS-Hl
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 16:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1obSet-0007AA-C7
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 16:18:55 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:45614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1obSer-0000z9-6p
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 16:18:54 -0400
Received: by mail-lj1-x235.google.com with SMTP id c7so12314833ljm.12
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 13:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=PgI8gZS56i+q9xVYvLi6nccpnSjQ3W7YRemq4rvcOGk=;
 b=OEkuTKzWWrH5iG2M7Op/fOk75nVt8UfXn8qPh1S25opy4OmoZgH1lBXCCrzAJvZoST
 DrCVvZfpVYrRe9E6YZb0NW5PfBWsqQ1d8pUGmDGExv54+3KvkFVtCIsfMYq090REJxkj
 rr7+m7LzYb5ARwhFtJiWj9umqJlZki4Tx2wk7G5q9OlQASBlUleFxUPwXBYFhmIa110O
 Xh3EsEnFi+RpC5tkwyssHIi+pO9qHYPyAY86io70w3+PmQzoIpUFqLCF/kHVHnZhgES0
 Kp1fXgh/NPhSKtqoaI1MdEQ0w7JEHYHk0f44Co9YlM+Dp9lrQ6Of4r0Js8bPplscR7YZ
 Er7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=PgI8gZS56i+q9xVYvLi6nccpnSjQ3W7YRemq4rvcOGk=;
 b=sPNvn/PoOLNhGUK9Dn1K4sabHJMjFkux6jQK44iZYi3P73JvilGzoGgNUkHhWdI7g6
 3Qyxsyo/tTb2rR62AiI6rAsHrb2SysazVJL95cTMrSwM0FHm0eHUCHWW+8nnr191wWgQ
 rgRhw96XdJZYBwMg+4edtAsPPM8GCwaN1K0Urf4OrMnD8hlzmBTAqhQ7cxCeFkNjUrDb
 9vsrU4i84oiVTVbUg6VBUTrwC/gVVvVd2Q7OwMeN8MOmn8KD/GIuoyH/J19XDU8TGXAl
 ud55fRiq6aTLDb9WwvPO3HtCCzUNeGmMLACIUYfILiDjURcVbX6IRoOpv3uZbg8Yba6F
 VA+Q==
X-Gm-Message-State: ACrzQf09koCpVpKqVAsjdeZ72Lnqcc9B7DQ/n4eLkpilcn/jW7tc2Pu1
 1e1hJrHFHj1vygB1Ozyiaodld3x4UkF7awA0s3A=
X-Google-Smtp-Source: AMsMyM6AGwhYtQUUNBKJxoa+cP1KtWCriGAifM7nbI5tWzz2KZmNn5qZHKuRO5PAz894bgQdRHEkcSLB5iT1SdMW4lM=
X-Received: by 2002:a2e:8917:0:b0:26a:a520:db52 with SMTP id
 d23-20020a2e8917000000b0026aa520db52mr1640375lji.289.1663877927045; Thu, 22
 Sep 2022 13:18:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-39-bmeng.cn@gmail.com>
In-Reply-To: <20220920103159.1865256-39-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 22 Sep 2022 22:18:35 +0200
Message-ID: <CAJ+F1CK5A1K=YgOxzXg2fbc+GOC-FmgxwDDnD=TgSKsDt6rDHw@mail.gmail.com>
Subject: Re: [PATCH v2 38/39] tests/qtest: Enable qtest build on Windows
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000ca90e905e949c454"
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ca90e905e949c454
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Sep 20, 2022 at 3:37 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> Now that we have fixed various test case issues as seen when running
> on Windows, let's enable the qtest build on Windows.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
> Changes in v2:
> - new patch: "tests/qtest: Enable qtest build on Windows"
>
>  tests/qtest/meson.build | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 455f1bbb7e..ceab141824 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -1,6 +1,5 @@
> -# All QTests for now are POSIX-only, but the dependencies are
> -# really in libqtest, not in the testcases themselves.
> -if not config_host.has_key('CONFIG_POSIX')
> +# Build all QTests for POSIX and Windows
> +if not config_host.has_key('CONFIG_POSIX') and not
> config_host.has_key('CONFIG_WIN32')
>    subdir_done()
>  endif
>

I wonder, but I suppose we can just remove the conditions. No?


--=20
Marc-Andr=C3=A9 Lureau

--000000000000ca90e905e949c454
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 20, 2022 at 3:37 PM Bin=
 Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com" target=3D"_blank">bmeng.cn@=
gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">From: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" tar=
get=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
<br>
Now that we have fixed various test case issues as seen when running<br>
on Windows, let&#39;s enable the qtest build on Windows.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
---<br>
<br>
Changes in v2:<br>
- new patch: &quot;tests/qtest: Enable qtest build on Windows&quot;<br>
<br>
=C2=A0tests/qtest/meson.build | 5 ++---<br>
=C2=A01 file changed, 2 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build<br>
index 455f1bbb7e..ceab141824 100644<br>
--- a/tests/qtest/meson.build<br>
+++ b/tests/qtest/meson.build<br>
@@ -1,6 +1,5 @@<br>
-# All QTests for now are POSIX-only, but the dependencies are<br>
-# really in libqtest, not in the testcases themselves.<br>
-if not config_host.has_key(&#39;CONFIG_POSIX&#39;)<br>
+# Build all QTests for POSIX and Windows<br>
+if not config_host.has_key(&#39;CONFIG_POSIX&#39;) and not config_host.has=
_key(&#39;CONFIG_WIN32&#39;)<br>
=C2=A0 =C2=A0subdir_done()<br>
=C2=A0endif<br></blockquote><div><br></div><div>I wonder, but I suppose we =
can just remove the conditions. No?<br></div></div><br clear=3D"all"><br>--=
 <br><div dir=3D"ltr">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000ca90e905e949c454--

