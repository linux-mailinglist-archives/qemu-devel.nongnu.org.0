Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9F35A9816
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 15:07:13 +0200 (CEST)
Received: from localhost ([::1]:58172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTjua-0001Fj-7s
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 09:07:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTjq3-0005DR-BE
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 09:02:31 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:46777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTjq0-0007yp-WA
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 09:02:30 -0400
Received: by mail-lf1-x12d.google.com with SMTP id z29so15718554lfb.13
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 06:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=bQAHAgmfZBnh+kgKa/DTMEK0zythoMU3XoObJmoMyM4=;
 b=pw1jxwgaZlPu9Nbuqg7fv6O9yNM5gxw7kY4Qm6CnHHEX0AfjAc9Dju1QOTuQIQsKyp
 PxhZoy5+r5dbn4MtqU4xw72NxaM+SCROzd50Xa3CgWGD8mdVlCc5uUn/Lu/xrtf9/pGe
 9//6k3d3TGl3cGfYNP5rLErnd6aMRVj2pRNs+JMqwFBpGqrF0QBTVFpxWt1hUtsHl9tJ
 omhnjW+arENmWZYlkHTFbL2pfhlAr1eyb18lsnrnRxS02pNiWPr1Aiq+fabWPjyGKqwr
 OijkjkSiXpbKfLvy/pNYRFaLK4jy2T//0ACXXp28kp96qL/T43ysjE31pD7FwwJ4xuI0
 /YKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=bQAHAgmfZBnh+kgKa/DTMEK0zythoMU3XoObJmoMyM4=;
 b=zXYpiah24Vjjr1EGSODYIXgFW2LaxR8cthmuLDiDDVqHpazAhe0S/uxPR5hpDPU40p
 AvKOmpxwTKx2cOTcRXvAHNbGMbg2b2M/5zg8fHDCgYGvz52fz3DKxU72vGfO0fWdFxkY
 ZKqnv/fsBKR8PgERXJ/dgAZAL8dJ2VZ2LfgfBhPjsdWUL8RakWYh8+YOafQ5VR6XKuJf
 3HOQraEEQoC01RXpDD2Eemow2RDUVqzvfmo1c7JFb4h4ZcvLDqG/0pT5i/nznpRHXJh3
 ykxJyjy2hZHpW76csyf8caSY4X5WOgMRoKdnzuTAsCXthRUsWwjnlZpWCUWDbaNq19C0
 OCSA==
X-Gm-Message-State: ACgBeo3UScvTBEPoeJeaqb1hQyzTNTT8bjzMatTuFJ55Le0po7EMqvE9
 WhHqgCU6sx2Ku2AA0L2B4Qby5ygOFiKCfgGJW1k=
X-Google-Smtp-Source: AA6agR5H49ezDCm0viUxxJ6BQGkG+avn1Z7+w+Use2LLjMWq/4sjLNJmElKEt77sadKcbIB8xKqPyqTgBQg4yl/0Dvk=
X-Received: by 2002:a05:6512:2306:b0:48b:2905:21a8 with SMTP id
 o6-20020a056512230600b0048b290521a8mr11776866lfu.167.1662037346921; Thu, 01
 Sep 2022 06:02:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-52-bmeng.cn@gmail.com>
In-Reply-To: <20220824094029.1634519-52-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 1 Sep 2022 17:02:15 +0400
Message-ID: <CAJ+F1CLs2H-wmdCQUjZnuioYo0DF7_bSgZwO+wKs1DLDQv2vXA@mail.gmail.com>
Subject: Re: [PATCH 51/51] docs/devel: testing: Document writing portable test
 cases
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Willian Rampazzo <willianr@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000aab09a05e79d3969"
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000aab09a05e79d3969
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Aug 24, 2022 at 2:57 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> Update the best practices of how to write portable test cases that
> can be built and run successfully on both Linux and Windows hosts.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>
>  docs/devel/testing.rst | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> index 3f6ebd5073..8fcabda30f 100644
> --- a/docs/devel/testing.rst
> +++ b/docs/devel/testing.rst
> @@ -115,6 +115,36 @@ check-block
>  are in the "auto" group).
>  See the "QEMU iotests" section below for more information.
>
> +Writing portable test cases
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +Both unit tests and qtests can run on a Linux host as well as a Windows
> host.
>

I believe they can work on other hosts too :)

"can run on a Windows host."


> +Care must be taken when writing portable test cases that can be built an=
d
> run
> +successfully on both hosts. The following are some best practices:
>

"on various hosts"


> +
> +* Use portable APIs from glib whenever necessary, e.g.: g_setenv(),
> +  g_mkdtemp(), g_mkdir_with_parents().
> +* Avoid using hardcoded /tmp for temporary file directory.
> +  Use g_get_tmp_dir() instead.
> +* Bear in mind that Windows has different special string representation
> for
> +  stdin/stdout/stderr and null devices. For example if your test case us=
es
> +  "/dev/fd/2" and "/dev/null" on Linux, remember to use "2" and "nul" on
> +  Windows instead. Also IO redirection does not work on Windows, so avoi=
d
> +  using "2>nul" whenever necessary.
> +* If your test cases uses the blkdebug feature, use relative path to pas=
s
> +  the config and image file paths in the command line as Windows absolut=
e
> +  path contains the delimeter ":" which will confuse the blkdebug parser=
.
> +* Use double quotes in your extra QEMU commmand line in your test cases
> +  instead of single quotes, as Windows does not drop single quotes when
> +  passing the command line to QEMU.
> +* Windows opens a file in text mode by default, while a POSIX compliant
> +  implementation treats text files and binary files the same. So if your
> +  test cases opens a file to write some data and later wants to compare
> the
> +  written data with the original one, be sure to pass the letter 'b' as
> +  part of the mode string to fopen(), or O_BINARY flag for the open()
> call.
> +* If a certain test case can only run on POSIX or Linux hosts, use a
> proper
> +  #ifdef in the codes. If the whole test suite cannot run on Windows,
> disable
> +  the build in the meson.build file.
> +
>  QEMU iotests
>  ------------
>
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000aab09a05e79d3969
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 24, 2022 at 2:57 PM Bin=
 Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin=
 Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.m=
eng@windriver.com</a>&gt;<br>
<br>
Update the best practices of how to write portable test cases that<br>
can be built and run successfully on both Linux and Windows hosts.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br></blockquote><div><br></div>=
<div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lu=
reau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=C2=A0<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
<br>
=C2=A0docs/devel/testing.rst | 30 ++++++++++++++++++++++++++++++<br>
=C2=A01 file changed, 30 insertions(+)<br>
<br>
diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst<br>
index 3f6ebd5073..8fcabda30f 100644<br>
--- a/docs/devel/testing.rst<br>
+++ b/docs/devel/testing.rst<br>
@@ -115,6 +115,36 @@ check-block<br>
=C2=A0are in the &quot;auto&quot; group).<br>
=C2=A0See the &quot;QEMU iotests&quot; section below for more information.<=
br>
<br>
+Writing portable test cases<br>
+~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
+Both unit tests and qtests can run on a Linux host as well as a Windows ho=
st.<br></blockquote><div><br></div><div>I believe they can work on other ho=
sts too :)</div><div><br></div><div>&quot;can run on a Windows host.&quot;<=
br></div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
+Care must be taken when writing portable test cases that can be built and =
run<br>
+successfully on both hosts. The following are some best practices:<br></bl=
ockquote><div><br></div><div>&quot;on various hosts&quot;<br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+* Use portable APIs from glib whenever necessary, e.g.: g_setenv(),<br>
+=C2=A0 g_mkdtemp(), g_mkdir_with_parents().<br>
+* Avoid using hardcoded /tmp for temporary file directory.<br>
+=C2=A0 Use g_get_tmp_dir() instead.<br>
+* Bear in mind that Windows has different special string representation fo=
r<br>
+=C2=A0 stdin/stdout/stderr and null devices. For example if your test case=
 uses<br>
+=C2=A0 &quot;/dev/fd/2&quot; and &quot;/dev/null&quot; on Linux, remember =
to use &quot;2&quot; and &quot;nul&quot; on<br>
+=C2=A0 Windows instead. Also IO redirection does not work on Windows, so a=
void<br>
+=C2=A0 using &quot;2&gt;nul&quot; whenever necessary.<br>
+* If your test cases uses the blkdebug feature, use relative path to pass<=
br>
+=C2=A0 the config and image file paths in the command line as Windows abso=
lute<br>
+=C2=A0 path contains the delimeter &quot;:&quot; which will confuse the bl=
kdebug parser.<br>
+* Use double quotes in your extra QEMU commmand line in your test cases<br=
>
+=C2=A0 instead of single quotes, as Windows does not drop single quotes wh=
en<br>
+=C2=A0 passing the command line to QEMU.<br>
+* Windows opens a file in text mode by default, while a POSIX compliant<br=
>
+=C2=A0 implementation treats text files and binary files the same. So if y=
our<br>
+=C2=A0 test cases opens a file to write some data and later wants to compa=
re the<br>
+=C2=A0 written data with the original one, be sure to pass the letter &#39=
;b&#39; as<br>
+=C2=A0 part of the mode string to fopen(), or O_BINARY flag for the open()=
 call.<br>
+* If a certain test case can only run on POSIX or Linux hosts, use a prope=
r<br>
+=C2=A0 #ifdef in the codes. If the whole test suite cannot run on Windows,=
 disable<br>
+=C2=A0 the build in the meson.build file.<br>
+<br>
=C2=A0QEMU iotests<br>
=C2=A0------------<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000aab09a05e79d3969--

