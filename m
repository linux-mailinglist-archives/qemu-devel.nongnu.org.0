Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A455EA703
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 15:22:17 +0200 (CEST)
Received: from localhost ([::1]:42434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oco3s-0001O5-De
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 09:22:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ocny0-0003fR-RD
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:16:14 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:43001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ocnxv-00027O-7Q
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:16:11 -0400
Received: by mail-lf1-x134.google.com with SMTP id a3so10759110lfk.9
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 06:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=7GQvlGBv73EAvZ/htBXDTRv6iBqm6Xb9BxaKBSzjDeo=;
 b=e7pcYTbejwYl0hM9D333vif/EDzEj9XESvRDpNTKuDQxLhbdxyHthHPVjx3p3KpStc
 pMqU4JbHyUSaABfYn7iC93L+BDmTg3KvqWHLMepxk8daHu+5oxTGbj2tTSAN+7VygkBD
 PwavEvmQIHoLlr7oN3EkLsg3/xAOKNt9kRTplYFHexSdhnIj45kKiO8cp1fpam5aeCjd
 fU7z/Im3M54ABF65c6X39hAc2Qi/tsGS71G8X1zpLbY1lAB39aBEW4Egcs32EidqWxIv
 1FzxQY6WuwhIYcUp5vbsBBpOGmUPYvsAhrDbrSPgNfN5TNbNb9hROw2k7lTP/fHfgyAd
 Dvfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=7GQvlGBv73EAvZ/htBXDTRv6iBqm6Xb9BxaKBSzjDeo=;
 b=aq22gccGQd78KLh4dnjbmUjTI0EIGhX6zTvLLZbsY4p97BUWF3Hw5ww8idWEujv4yQ
 Lu0ca8w4gruRQiCfayi38KubX/wAjPDFnY2OcixHVV8TwMjybFUamhg8NjmC/FR3FJpe
 HWmSxvjr2H3wiga9/P+EkBJ8UQ/x3WL9+cXKyPWx8gV+RKE+BFuKEJuWDj771heV+rLE
 8SiuzXzk9ukc9BoSN07WdOq/4h8b+mj67qGcHQ/aFYXmOK4ijESb6r9jMG9DYQMx7wVI
 EN0hCvr/3bITngq+VVZXy+tlzfpy9qxbAVhQVbaapkY+AxBC8GWd+LGf1g4ZIpVhLMLy
 e/OQ==
X-Gm-Message-State: ACrzQf2WZifY9nbexg0cogItBKElH6D3PSWynaTM6D8WT0DeGDcGslcU
 7Cni2dolrs4M8cvbNnj352ZnihbN/Ti07K5hePc=
X-Google-Smtp-Source: AMsMyM5QxpNVnOpfqdHiYIp9Q52UEVZNuvwG87lan5h16kMyaZvszJQSS/q2+wSFWNaLIAPXcYnItxHYQ6TMVXS3qo4=
X-Received: by 2002:a05:6512:3ca0:b0:49f:f620:b826 with SMTP id
 h32-20020a0565123ca000b0049ff620b826mr9891709lfv.375.1664198165107; Mon, 26
 Sep 2022 06:16:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
 <20220925113032.1949844-15-bmeng.cn@gmail.com>
In-Reply-To: <20220925113032.1949844-15-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 26 Sep 2022 17:15:53 +0400
Message-ID: <CAJ+F1C+GXB7GoQtxk76H+eMJv8iQ7Pqmc1XxupmzqNsU5Rus1w@mail.gmail.com>
Subject: Re: [PATCH v3 14/54] tests/qtest: migration-test: Avoid using
 hardcoded /tmp
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000007798ac05e9945480"
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x134.google.com
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

--0000000000007798ac05e9945480
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Sun, Sep 25, 2022 at 3:52 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> This case was written to use hardcoded /tmp directory for temporary
> files. Update to use g_dir_make_tmp() for a portable implementation.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
> Changes in v3:
> - Split to a separate patch
>
>  tests/qtest/migration-test.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 4728d528bb..029c4f3a6a 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -2434,7 +2434,6 @@ static bool kvm_dirty_ring_supported(void)
>
>  int main(int argc, char **argv)
>  {
> -    char template[] =3D "/tmp/migration-test-XXXXXX";
>      const bool has_kvm =3D qtest_has_accel("kvm");
>      const bool has_uffd =3D ufd_version_check();
>      const char *arch =3D qtest_get_arch();
> @@ -2462,9 +2461,10 @@ int main(int argc, char **argv)
>          return g_test_run();
>      }
>
> -    tmpfs =3D g_mkdtemp(template);
> +    tmpfs =3D g_dir_make_tmp("migration-test-XXXXXX", NULL);
>      if (!tmpfs) {
> -        g_test_message("g_mkdtemp on path (%s): %s", template,
> strerror(errno));
> +        g_test_message("g_dir_make_tmp on path (%s): %s", tmpfs,
> +                       strerror(errno));
>

You need to update the error reporting by using the GError "error" argument
of g_dir_make_tmp().


>      }
>      g_assert(tmpfs);
>
> @@ -2589,6 +2589,7 @@ int main(int argc, char **argv)
>          g_test_message("unable to rmdir: path (%s): %s",
>                         tmpfs, strerror(errno));
>      }
> +    g_free((gpointer)tmpfs);
>

 argh, remove the const from tmpfs declaration!



>      return ret;
>  }
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000007798ac05e9945480
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 25, 2022 at 3:52 PM Bin=
 Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin=
 Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.m=
eng@windriver.com</a>&gt;<br>
<br>
This case was written to use hardcoded /tmp directory for temporary<br>
files. Update to use g_dir_make_tmp() for a portable implementation.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
---<br>
<br>
Changes in v3:<br>
- Split to a separate patch<br>
<br>
=C2=A0tests/qtest/migration-test.c | 7 ++++---<br>
=C2=A01 file changed, 4 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c<br=
>
index 4728d528bb..029c4f3a6a 100644<br>
--- a/tests/qtest/migration-test.c<br>
+++ b/tests/qtest/migration-test.c<br>
@@ -2434,7 +2434,6 @@ static bool kvm_dirty_ring_supported(void)<br>
<br>
=C2=A0int main(int argc, char **argv)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 char template[] =3D &quot;/tmp/migration-test-XXXXXX&quot;;<=
br>
=C2=A0 =C2=A0 =C2=A0const bool has_kvm =3D qtest_has_accel(&quot;kvm&quot;)=
;<br>
=C2=A0 =C2=A0 =C2=A0const bool has_uffd =3D ufd_version_check();<br>
=C2=A0 =C2=A0 =C2=A0const char *arch =3D qtest_get_arch();<br>
@@ -2462,9 +2461,10 @@ int main(int argc, char **argv)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return g_test_run();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 tmpfs =3D g_mkdtemp(template);<br>
+=C2=A0 =C2=A0 tmpfs =3D g_dir_make_tmp(&quot;migration-test-XXXXXX&quot;, =
NULL);<br>
=C2=A0 =C2=A0 =C2=A0if (!tmpfs) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_test_message(&quot;g_mkdtemp on path (%s): %=
s&quot;, template, strerror(errno));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_test_message(&quot;g_dir_make_tmp on path (%=
s): %s&quot;, tmpfs,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0strerror(errno));<br></blockquote><div><br></div><div>You need to=
 update the error reporting by using the GError &quot;error&quot; argument =
of g_dir_make_tmp().</div><div>=C2=A0<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0g_assert(tmpfs);<br>
<br>
@@ -2589,6 +2589,7 @@ int main(int argc, char **argv)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_test_message(&quot;unable to rmdir: pat=
h (%s): %s&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 tmpfs, strerror(errno));<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 g_free((gpointer)tmpfs);<br></blockquote><div><br></div><div=
>=C2=A0argh, remove the const from tmpfs declaration!</div><br><div><br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000007798ac05e9945480--

