Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A725E5E6CD1
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 22:11:17 +0200 (CEST)
Received: from localhost ([::1]:42116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obSXU-0003xS-QT
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 16:11:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1obSRs-0005XR-DO
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 16:05:36 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:43958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1obSRb-00060J-Bt
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 16:05:27 -0400
Received: by mail-lf1-x12e.google.com with SMTP id o2so16460395lfc.10
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 13:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=91hBZiX1FQF6cFm1ysrPeWyRgtWdJHK2KsTG+6jLNFo=;
 b=jbK9fmTTymSFb5RtC1nn2uTTwXVTMx8GyOWMf26S9IzNg171W4DSgyJKHz6WlTzSvX
 lLm7fhDUXUTlUWV5i6f/PgBE4IIXtPMLpAh1JgjQObsaiCuSkb8VFZMeYUtMlEimbcVS
 cLPCuDySHYvytMIUP3RH12rJ2mSq3GeV1fAVEaRdeIDyhpttba4++Y+8C6MWkxvwuANN
 Vl+pzWtdpv1BWuck4PrBnpe+4bq01snXmr5pfqH7Cmn5d0ER+PH7m+8qndJ41INU3hKY
 Sdzm37fvbay3AmCgZbs5vBTEvpl5xTVMm5tevmusMZcfrnMznFybLrR0aWgEy7Elsgwd
 DbKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=91hBZiX1FQF6cFm1ysrPeWyRgtWdJHK2KsTG+6jLNFo=;
 b=vqoTQwVMtHDcTzA+X49am5e5JHxLkpKWzpeLxLIndNyHnBHfAR/vXeqSwiUma28PbS
 bTRyfQvY803bV1j8RRdFUV+TiDV8I9E1373SaVMeHlK6RNQL2Idt4zbM0i4klXgtRT8/
 ZMl3VryKkkPgIpWnYmc9UWCTppIibZ08e0eTdGRQs8e+PEj1NAk+uXGjAkoU9e/+qG6s
 3LtkJkgt7eowG6T/vplkRSHnZ8ZsA5dK3BQmvv60QkYZZGzHtL1vgH9S8yBhlTZk8lr3
 ULb5/Oi+0qURUbkF+RnZoAdWvnNtSbb3HQhCIicRlF7FHFwUEoCISjd/3khPRS7xgCaA
 Uc0Q==
X-Gm-Message-State: ACrzQf3zD4rOLrDXOve8eYjaIdDg40N0lMIZ3ke45cg2bUCsEqTroazn
 vYjYHuED5OyPDAwiU8WQep9qTODfiSYxutz/kYM=
X-Google-Smtp-Source: AMsMyM5ZVoHG6+Iuo8fK7NCvB5NpcpxzSeCuCs3sF+i8BN4BOFUG0eiZBtXF6mGt61A/5HWqgOKsg8Ry9jrGfom1m0E=
X-Received: by 2002:a05:6512:280d:b0:498:fd40:51d4 with SMTP id
 cf13-20020a056512280d00b00498fd4051d4mr2128108lfb.167.1663877107705; Thu, 22
 Sep 2022 13:05:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-23-bmeng.cn@gmail.com>
In-Reply-To: <20220920103159.1865256-23-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 22 Sep 2022 22:04:56 +0200
Message-ID: <CAJ+F1CKQ+nKVOqeTicaU_0bgNBeHQnooj1VuX2=DxofbGmwW8g@mail.gmail.com>
Subject: Re: [PATCH v2 22/39] tests/qtest: migration-test: Disable IO
 redirection for win32
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f46a4b05e949932a"
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
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

--000000000000f46a4b05e949932a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 20, 2022 at 3:04 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> On Windows the QEMU executable is created via CreateProcess() and
> IO redirection does not work, so don't bother adding IO redirection
> to the command line.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
> Changes in v2:
> - Change the place that sets IO redirection in the command line
>

hmm ok,
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


>  tests/qtest/migration-test.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 9925691ead..c87afad9e8 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -648,7 +648,16 @@ static int test_migrate_start(QTestState **from,
> QTestState **to,
>      }
>
>      if (!getenv("QTEST_LOG") && args->hide_stderr) {
> +#ifndef _WIN32
>          ignore_stderr =3D "2>/dev/null";
> +#else
> +        /*
> +         * On Windows the QEMU executable is created via CreateProcess()
> and
> +         * IO redirection does not work, so don't bother adding IO
> redirection
> +         * to the command line.
> +         */
> +        ignore_stderr =3D "";
> +#endif
>      } else {
>          ignore_stderr =3D "";
>      }
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000f46a4b05e949932a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 20, 2022 at 3:04 PM Bin M=
eng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin M=
eng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.men=
g@windriver.com</a>&gt;<br>
<br>
On Windows the QEMU executable is created via CreateProcess() and<br>
IO redirection does not work, so don&#39;t bother adding IO redirection<br>
to the command line.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
---<br>
<br>
Changes in v2:<br>
- Change the place that sets IO redirection in the command line<br></blockq=
uote><div><br></div><div>hmm ok,</div><div>Reviewed-by: Marc-Andr=C3=A9 Lur=
eau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@red=
hat.com</a>&gt;<br></div><div><br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
<br>
=C2=A0tests/qtest/migration-test.c | 9 +++++++++<br>
=C2=A01 file changed, 9 insertions(+)<br>
<br>
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c<br=
>
index 9925691ead..c87afad9e8 100644<br>
--- a/tests/qtest/migration-test.c<br>
+++ b/tests/qtest/migration-test.c<br>
@@ -648,7 +648,16 @@ static int test_migrate_start(QTestState **from, QTest=
State **to,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!getenv(&quot;QTEST_LOG&quot;) &amp;&amp; args-&gt;=
hide_stderr) {<br>
+#ifndef _WIN32<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ignore_stderr =3D &quot;2&gt;/dev/null&qu=
ot;;<br>
+#else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* On Windows the QEMU executable is crea=
ted via CreateProcess() and<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* IO redirection does not work, so don&#=
39;t bother adding IO redirection<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* to the command line.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ignore_stderr =3D &quot;&quot;;<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ignore_stderr =3D &quot;&quot;;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000f46a4b05e949932a--

