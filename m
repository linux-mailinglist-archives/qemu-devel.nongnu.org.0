Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE933508D33
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 18:25:15 +0200 (CEST)
Received: from localhost ([::1]:36020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhD8k-0000DR-Qc
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 12:25:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhCqk-0001U6-16
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 12:06:38 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:42994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhCqi-0005yC-B0
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 12:06:37 -0400
Received: by mail-qk1-x72f.google.com with SMTP id j6so1539647qkp.9
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 09:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ve62p81qD7x61BvVqgDvCx5rQiQvq6PnZomDxujdCGU=;
 b=ILHFlPyS40jqXYPoqJJxqQCwJhGdhL1JvSuWv7MJsFzp3j1HTu3dmsIRx8i+6g/xcU
 YFDCL/gB99I7gOT9cWPE3DjfszNMzPyH6r8LC8NWAtFJDYyfHtf4oHNmGqrCaguhOs8K
 oi04oUB8rEmz35EnzgudvpC8rt6oTberZXVmGxwwuJRBSweN/ZA4cQRZ6z6MNdDf+5rX
 hC2mxrilJVhSNNncFyqiNUhlzCUrbPB/HpY1jwJHpFOJI4jD51AX+N++e5+EnpkNlt0E
 qJDh4BUNyog2BZ1CAzSy7jy9+GoLe1I19u50tJ0Xg+tEHpo6GO3voNPF77Bi+5Cs0yDu
 nzdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ve62p81qD7x61BvVqgDvCx5rQiQvq6PnZomDxujdCGU=;
 b=Qk+wVibsOF0YmMmG93rRjBwEWtUHvAjQ3jItvPOgydFfyj+FhCLNS/OR1PYULJ1DGx
 RoveXIiNB1jRnF4Sk2mCx2xMSVNp7M9GT8osCPEsXxmje1zn3xuA+1rh2kFEERj1TXpU
 7IyUgFc0Cwoc65F8aXagjlhhc+poErWXseMiq32Y4qiBIvfxEYbAPj0GizC3bK6M09wL
 jRC6un/YZx/8sF19Dke73Sg8BrtH9FuxUsh0yNG5yEqxSCJOVgmdYF2MzAQJvra8T0qc
 dMhN4zecQ+oHe8SWfJzXa23fv+LV0dlvpNbz1JwoQliGCjNw1sZrO1zIamA2oeeHFnDl
 avlQ==
X-Gm-Message-State: AOAM533yP/5DtFQKyQ70bODp0Snl7+NwbHUJ+BxUGJLGYzjerHbCX3He
 XqPlqcnwtpeMuVf8zffr3a+6RkLoQIm6vzfv3Xk=
X-Google-Smtp-Source: ABdhPJxgqoFzRrG26AuDex9dC8Ic8PAbq4GWx4JuSxA4nfCbAWCLqgP9X6p+gIdvdx348LFhyWx8AjkbmPEsuV9Sfko=
X-Received: by 2002:a05:620a:4093:b0:69c:fda:3cf2 with SMTP id
 f19-20020a05620a409300b0069c0fda3cf2mr12983577qko.245.1650470793950; Wed, 20
 Apr 2022 09:06:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220420153407.73926-1-pbonzini@redhat.com>
 <20220420153407.73926-6-pbonzini@redhat.com>
In-Reply-To: <20220420153407.73926-6-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 20 Apr 2022 20:06:22 +0400
Message-ID: <CAJ+F1C++=5_KnxvD9AcvgY1jy4TWqwMEFZME-sRVzMM8tS0ziA@mail.gmail.com>
Subject: Re: [PATCH 05/34] configure: gcov should not exclude fortify-source
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000062b97605dd182d2c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qk1-x72f.google.com
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000062b97605dd182d2c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2022 at 7:49 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> There is no reason other than history (dating back to commit 1d728c3946,
> "tests: add gcov
> support", 2013-01-06) for this, remove this unnecessary conditional.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  configure | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/configure b/configure
> index 7a89cb4123..48ae18f47f 100755
> --- a/configure
> +++ b/configure
> @@ -2625,9 +2625,7 @@ fi
>
>  write_c_skeleton
>
> -if test "$gcov" =3D "yes" ; then
> -  :
> -elif test "$fortify_source" =3D "yes" ; then
> +if test "$fortify_source" =3D "yes" ; then
>    QEMU_CFLAGS=3D"-U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 $QEMU_CFLAGS"
>    debug=3Dno
>  fi
> --
> 2.35.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000062b97605dd182d2c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 20, 2022 at 7:49 PM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Ther=
e is no reason other than history (dating back to commit 1d728c3946, &quot;=
tests: add gcov<br>
support&quot;, 2013-01-06) for this, remove this unnecessary conditional.<b=
r>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandr=
e.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<=
/div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0configure | 4 +---<br>
=C2=A01 file changed, 1 insertion(+), 3 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 7a89cb4123..48ae18f47f 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -2625,9 +2625,7 @@ fi<br>
<br>
=C2=A0write_c_skeleton<br>
<br>
-if test &quot;$gcov&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 :<br>
-elif test &quot;$fortify_source&quot; =3D &quot;yes&quot; ; then<br>
+if test &quot;$fortify_source&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0QEMU_CFLAGS=3D&quot;-U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 $Q=
EMU_CFLAGS&quot;<br>
=C2=A0 =C2=A0debug=3Dno<br>
=C2=A0fi<br>
-- <br>
2.35.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000062b97605dd182d2c--

