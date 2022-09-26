Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A97265EA758
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 15:33:36 +0200 (CEST)
Received: from localhost ([::1]:59472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocoEp-0005AA-PS
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 09:33:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oco1R-0008Ar-5X
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:19:45 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:36847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oco1P-0002Y1-6n
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:19:44 -0400
Received: by mail-lj1-x234.google.com with SMTP id t16so3391635ljh.3
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 06:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=pjGaXuQ5dow3UtvRGKzpy9kiVwathISeEd3YE5NBd5o=;
 b=bkGfFHRw2KlToMNi5a9F3+mN38D1y+XUBFP3pAgHDGvyjFmU3/Q/AVCVmeEFhSg5Qs
 5Dps8KmQVyEXt2vyendov7MOC3JjmaQhwg+TewUMUM3LFZIJo/OKF15lVT+6qHeH/i0e
 OJPmjukqW1QPFCVgxFBOI1f5DOX89mP2pUDwrE2u+/tyf3N9HkBM+Beoob8piazHCqNj
 Ajp4z+eGesQsGa92gD6pl+tt9WtRWdItQ18CCZdXByFNqKn/4ndAOAztXrwKiJLgXRh0
 tf0vjNV70Mo5RJZcnPwD/YA2AMOcLEf8woheayH7c8c3M1JqghODTZBp0SFvQSEdrTEY
 hlkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=pjGaXuQ5dow3UtvRGKzpy9kiVwathISeEd3YE5NBd5o=;
 b=E3woaODAhdHVuE6eCW1lODw1Q61iwT1apx3WxcaJAkiDzLQHv81AXCIL3w70bcTbXT
 G474bKlmjYQquSHhafsMZT6MRQeMq48kcXcTw4BLvgF4TvYbMjSgJA9w8bb0AD1AndP6
 H7cwK+nZebPZtLjPgA/ePcuKmHu+bkW0tYLuHgPChbgxHaDOZ+7rJgWH4jJGKsqtrak2
 WD70U/7AiGG4O2Xa3s5q/aF7ubYYqU6eAsTDUc69BthbGcxYiEnKXinD9qS4xucrMSdO
 5HsrQGwPAzpajniWCcz7cQdr7bHFIbjvEeY44EiCCEAh8Wcym+jGoX1h4n8WmDwKCkpy
 6Cfw==
X-Gm-Message-State: ACrzQf2UavpcYzFJwRdPro6wyGdVSRztmg2PKixKF1orvI9tCoe2xj0u
 QUdopTAF2v9PJiVUaQMPRJQmwyIzLnWw8hCMdQUECgizyGmMlA==
X-Google-Smtp-Source: AMsMyM4lOiCafRqEXd139OmgDTbfzfBdnG9NW9jxrJLYWUCW9hz4FznsYtm3XUtTyunch6uV2z6X6ZTocg58TbsgB9k=
X-Received: by 2002:a2e:a607:0:b0:26c:42c8:13af with SMTP id
 v7-20020a2ea607000000b0026c42c813afmr7366274ljp.267.1664198381473; Mon, 26
 Sep 2022 06:19:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
 <20220925113032.1949844-17-bmeng.cn@gmail.com>
In-Reply-To: <20220925113032.1949844-17-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 26 Sep 2022 17:19:30 +0400
Message-ID: <CAJ+F1C+GWMYCLmKN8nC26BfjznhHa7E1opq19G9xPh0EZozSNg@mail.gmail.com>
Subject: Re: [PATCH v3 16/54] tests/qtest: qmp-test: Avoid using hardcoded /tmp
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Laurent Vivier <lvivier@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000005d152505e99461d6"
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x234.google.com
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

--0000000000005d152505e99461d6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 25, 2022 at 3:51 PM Bin Meng <bmeng.cn@gmail.com> wrote:

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
>  tests/qtest/qmp-test.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/tests/qtest/qmp-test.c b/tests/qtest/qmp-test.c
> index bf7304c7dc..0fa00c12dc 100644
> --- a/tests/qtest/qmp-test.c
> +++ b/tests/qtest/qmp-test.c
> @@ -161,12 +161,13 @@ static void test_qmp_protocol(void)
>
>  /* Out-of-band tests */
>
> -char tmpdir[] =3D "/tmp/qmp-test-XXXXXX";
> +char *tmpdir;
>  char *fifo_name;
>
>  static void setup_blocking_cmd(void)
>  {
> -    if (!g_mkdtemp(tmpdir)) {
> +    tmpdir =3D g_dir_make_tmp("qmp-test-XXXXXX", NULL);
> +    if (!tmpdir) {
>          g_error("g_mkdtemp: %s", strerror(errno));
>      }
>

Again, errno usage is not correct for glib, using GError.

I would replace with  g_assert_no_error(err) here too

     fifo_name =3D g_strdup_printf("%s/fifo", tmpdir);
> @@ -179,6 +180,7 @@ static void cleanup_blocking_cmd(void)
>  {
>      unlink(fifo_name);
>      rmdir(tmpdir);
> +    g_free(tmpdir);
>  }
>
>  static void send_cmd_that_blocks(QTestState *s, const char *id)
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000005d152505e99461d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 25, 2022 at 3:51 PM Bin M=
eng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin M=
eng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.men=
g@windriver.com</a>&gt;<br>
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
=C2=A0tests/qtest/qmp-test.c | 6 ++++--<br>
=C2=A01 file changed, 4 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/tests/qtest/qmp-test.c b/tests/qtest/qmp-test.c<br>
index bf7304c7dc..0fa00c12dc 100644<br>
--- a/tests/qtest/qmp-test.c<br>
+++ b/tests/qtest/qmp-test.c<br>
@@ -161,12 +161,13 @@ static void test_qmp_protocol(void)<br>
<br>
=C2=A0/* Out-of-band tests */<br>
<br>
-char tmpdir[] =3D &quot;/tmp/qmp-test-XXXXXX&quot;;<br>
+char *tmpdir;<br>
=C2=A0char *fifo_name;<br>
<br>
=C2=A0static void setup_blocking_cmd(void)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 if (!g_mkdtemp(tmpdir)) {<br>
+=C2=A0 =C2=A0 tmpdir =3D g_dir_make_tmp(&quot;qmp-test-XXXXXX&quot;, NULL)=
;<br>
+=C2=A0 =C2=A0 if (!tmpdir) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_error(&quot;g_mkdtemp: %s&quot;, strerr=
or(errno));<br>
=C2=A0 =C2=A0 =C2=A0}<br></blockquote><div><br></div><div>Again, errno usag=
e is not correct for glib, using GError.<br></div><div><br></div><div>I wou=
ld replace with=C2=A0 g_assert_no_error(err) here too<br></div><div><br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0fifo_name =3D g_strdup_printf(&quot;%s/fifo&quot;, tmpd=
ir);<br>
@@ -179,6 +180,7 @@ static void cleanup_blocking_cmd(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0unlink(fifo_name);<br>
=C2=A0 =C2=A0 =C2=A0rmdir(tmpdir);<br>
+=C2=A0 =C2=A0 g_free(tmpdir);<br>
=C2=A0}<br>
<br>
=C2=A0static void send_cmd_that_blocks(QTestState *s, const char *id)<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000005d152505e99461d6--

