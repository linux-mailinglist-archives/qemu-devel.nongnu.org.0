Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 909455EA743
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 15:29:59 +0200 (CEST)
Received: from localhost ([::1]:50656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocoBJ-0001cf-OT
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 09:29:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oco2B-0000rR-UP
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:20:33 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:34486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oco28-0002r8-S2
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:20:30 -0400
Received: by mail-lj1-x234.google.com with SMTP id h3so7448724lja.1
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 06:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=8CKVhfydfweDo+lfR8Vm5mCGCbpIe1bLnYA+AgySg+Q=;
 b=jyDgtrETXNvfw9s3ZzVWzldlbrOwKd8FB7gicV1V9/ujJzUsXrwCzVhm/GBKpjct64
 WpYUPGDrExPfNxBJiGC3Vn3FeLMjGe6T+GDcHKTx8hyd2O98bOsm9CxlNhqKT4CJe/Dy
 xgpxnQR+gLebYk2CeqONbAgjqRXEscxE5kS6WQtMQ6nvHd6GaBZJBGqCIMxiVXxvcYX3
 ZUH3gpMi6uxMGoZ+cnAQZDl7+NGaXgDUEjcH0+Ly+Y04d/Z7hj3s3IF/H+RjLc69+pyI
 3a4l5pY0LC+e/Ut8h15zTPnIUB9WIjwTrtFKPPwRQuqFAPcIgdBFfxrIozl+IMGNb0TG
 e7Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=8CKVhfydfweDo+lfR8Vm5mCGCbpIe1bLnYA+AgySg+Q=;
 b=0EKmgzCHMrSHBqMb06CmEFb2178Z+PWs9MTHxSa7C107ULpHWIAIewjf+i/cpjMueQ
 CPGdj4mm31huit0ANMJCcdzJYeLpNn9PbsnV5YfOfY+n+rnlEXowXqm8+LVhuw2A55xz
 /9eRgODtma0yZAxpCu5FEZsOJXFiHCaALTnnah8YBO9Ixo0bnOSaJ1Kd6ev4R+5ZscdT
 dJLeGanpS9S4iSUmeAH2MUoeC4WvHMLa3irzdwVzszIonGie5eqfqdW7abwfHXRVEkeP
 RXbuve6mKing3dB8tY+ABSaZlScDgW8MndZsynYSMp5cMFDwGxICOIr9Q91xPcJwpxIR
 C0rg==
X-Gm-Message-State: ACrzQf2TY9qcWHUNnyHkvJTKbrRVvYkVLqiQK1gx+CZEAjZ7d3K4w22j
 AVRJhbeVOAbYefgI+PnqE2LZx/wu2X12nwDq5dk=
X-Google-Smtp-Source: AMsMyM61y5cyEkt/E1C7roXr93kKetScefWqKmCG6b0ltV9Qx0ZhK2AI4+iWRT1BpBaKbKZP5ve54avnYsveO8gcr9s=
X-Received: by 2002:a2e:a44c:0:b0:26b:e70f:a026 with SMTP id
 v12-20020a2ea44c000000b0026be70fa026mr7472892ljn.94.1664198426458; Mon, 26
 Sep 2022 06:20:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
 <20220925113032.1949844-18-bmeng.cn@gmail.com>
In-Reply-To: <20220925113032.1949844-18-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 26 Sep 2022 17:20:14 +0400
Message-ID: <CAJ+F1C+G239L9jFCUuKBH=cH6YE-2cSTGDEXOMxcEZEZL+a0TQ@mail.gmail.com>
Subject: Re: [PATCH v3 17/54] tests/qtest: vhost-user-blk-test: Avoid using
 hardcoded /tmp
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Coiby Xu <Coiby.Xu@gmail.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000000b80a805e9946401"
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

--0000000000000b80a805e9946401
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 25, 2022 at 3:59 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> This case was written to use hardcoded /tmp directory for temporary
> files. Update to use g_get_tmp_dir() for a portable implementation.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>
> Changes in v3:
> - Split to a separate patch
>
>  tests/qtest/vhost-user-blk-test.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tests/qtest/vhost-user-blk-test.c
> b/tests/qtest/vhost-user-blk-test.c
> index a81c2a2715..07a4c2d500 100644
> --- a/tests/qtest/vhost-user-blk-test.c
> +++ b/tests/qtest/vhost-user-blk-test.c
> @@ -841,7 +841,8 @@ static char *create_listen_socket(int *fd)
>      char *path;
>
>      /* No race because our pid makes the path unique */
> -    path =3D g_strdup_printf("/tmp/qtest-%d-sock.XXXXXX", getpid());
> +    path =3D g_strdup_printf("%s/qtest-%d-sock.XXXXXX",
> +                           g_get_tmp_dir(), getpid());
>      tmp_fd =3D mkstemp(path);
>      g_assert_cmpint(tmp_fd, >=3D, 0);
>      close(tmp_fd);
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000000b80a805e9946401
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 25, 2022 at 3:59 PM Bin M=
eng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin M=
eng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.men=
g@windriver.com</a>&gt;<br>
<br>
This case was written to use hardcoded /tmp directory for temporary<br>
files. Update to use g_get_tmp_dir() for a portable implementation.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br></blockquote><div><br></div>=
<div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lu=
reau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=C2=A0<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
<br>
Changes in v3:<br>
- Split to a separate patch<br>
<br>
=C2=A0tests/qtest/vhost-user-blk-test.c | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk=
-test.c<br>
index a81c2a2715..07a4c2d500 100644<br>
--- a/tests/qtest/vhost-user-blk-test.c<br>
+++ b/tests/qtest/vhost-user-blk-test.c<br>
@@ -841,7 +841,8 @@ static char *create_listen_socket(int *fd)<br>
=C2=A0 =C2=A0 =C2=A0char *path;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* No race because our pid makes the path unique */<br>
-=C2=A0 =C2=A0 path =3D g_strdup_printf(&quot;/tmp/qtest-%d-sock.XXXXXX&quo=
t;, getpid());<br>
+=C2=A0 =C2=A0 path =3D g_strdup_printf(&quot;%s/qtest-%d-sock.XXXXXX&quot;=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0g_get_tmp_dir(), getpid());<br>
=C2=A0 =C2=A0 =C2=A0tmp_fd =3D mkstemp(path);<br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmpint(tmp_fd, &gt;=3D, 0);<br>
=C2=A0 =C2=A0 =C2=A0close(tmp_fd);<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000000b80a805e9946401--

