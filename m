Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3FF513C13
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 21:20:16 +0200 (CEST)
Received: from localhost ([::1]:56696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk9gV-0007fD-4p
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 15:20:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nk9eV-0006Hd-1N
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 15:18:11 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:33341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nk9eT-0005Bo-FH
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 15:18:10 -0400
Received: by mail-qk1-x72e.google.com with SMTP id s4so4406833qkh.0
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 12:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H6l1r2vWwn+D75uO6SMTc4JK0+lh13Va7e7XVRTSu3c=;
 b=joalRjpG/gE5UGseZ3fNK5iuN3L2hkuuLsw82/o/ORIEtLGnzHTYn0CTy9sawQsHQc
 2EBW2DARass24mZ1qxKCkbkU2BYJfwR02SaxSrz6fLo4MVl0JoLbPeYWbTCnIoqvsfEW
 0SAYSUpGSj7k5jgMBrBr4E3wh8KzA4UJ037Jj8z5NpMiIDKm3f9jKSR2xnzaCU/vUiGb
 4Puo3R0NYnMXyD4erxNqxseC0jNkpqrFdrEHta9P2miRr6Fb5ht8SU3UDeupPBO7fJBx
 B2HbUjv65zqoDE/dIPTO5n5KzQsAB1MO5r6GsGkSn+MrM/fn+mrN+XEwcS66eADkKlct
 RpbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H6l1r2vWwn+D75uO6SMTc4JK0+lh13Va7e7XVRTSu3c=;
 b=mTQb0/7/aXp1oGN/zCpv1Nel7BRth9qfw6KVOYNaSDmIB+3QRCgBhUMR9YlSYFYp6G
 N5pgpAw3gID2cs55iroMvQ8Vp1Mwzsqu/bC3SRzeXUAoiLZU624GknrbMWVyZ+fjN9vm
 0/uZ9A0tMfQzXaLz8RwZu5WnX51legAtcZcbphkt3H2pPDCWzrEUt3DRj6ODEbbmZ2fL
 lSa3v8jgnUpyZGj/3ixWicYppOnh1eb2a1ig/nRTVxbkNWBGYb1Cu4EW8uWw7y7fi6WE
 dr7lTQHsqOdBKWfDdoYGQXL0L4b9EEdH+gg/YZFQmgj2QHneh3WzqTWTlNzT7TVAanHd
 VDOg==
X-Gm-Message-State: AOAM530jKyqihwVmNsBeED+tEk1KKkwYW1HTC4NEO7X2qqR2UFXvsX4a
 VY5Eu12lyGfZmH1cBZ+zKJcVcHIRKZs37B14TRY=
X-Google-Smtp-Source: ABdhPJx0r30JykZJhv4x0WBW7OO3YVk5sgp2PesAaFuELl9rX0/INg643x2od1kIEvUmlUz1g54ez2txQaVGr5kGFew=
X-Received: by 2002:a37:a92:0:b0:69f:8a9e:6db4 with SMTP id
 140-20020a370a92000000b0069f8a9e6db4mr6469140qkk.539.1651173488609; Thu, 28
 Apr 2022 12:18:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220428181541.300619-1-kkostiuk@redhat.com>
In-Reply-To: <20220428181541.300619-1-kkostiuk@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 28 Apr 2022 23:17:57 +0400
Message-ID: <CAJ+F1CKH8MjetfU4e_cEksqrZvb6RswksX2p7-Tp5CaOBGzLzw@mail.gmail.com>
Subject: Re: [PATCH 2/2] qga-vss: always build qga-vss.tlb when qga-vss.dll is
 built
To: Konstantin Kostiuk <kkostiuk@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000004069f905ddbbc97b"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qk1-x72e.google.com
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
Cc: Michael Roth <michael.roth@amd.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004069f905ddbbc97b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 28, 2022 at 10:18 PM Konstantin Kostiuk <kkostiuk@redhat.com>
wrote:

> Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  qga/vss-win32/meson.build | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/qga/vss-win32/meson.build b/qga/vss-win32/meson.build
> index 71c50d0866..26c5dd6e0e 100644
> --- a/qga/vss-win32/meson.build
> +++ b/qga/vss-win32/meson.build
> @@ -23,8 +23,6 @@ qga_vss =3D shared_module(
>    ]
>  )
>
> -all_qga +=3D qga_vss
> -
>  if midl.found()
>    gen_tlb =3D custom_target('gen-tlb',
>                            input: 'qga-vss.idl',
> @@ -36,3 +34,5 @@ else
>                            output: 'qga-vss.tlb',
>                            command: [widl, '-t', '@INPUT@', '-o',
> '@OUTPUT@'])
>  endif
> +
> +all_qga +=3D [ qga_vss, gen_tlb ]
> --
> 2.25.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000004069f905ddbbc97b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 28, 2022 at 10:18 PM Kons=
tantin Kostiuk &lt;<a href=3D"mailto:kkostiuk@redhat.com">kkostiuk@redhat.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Signed-off-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkostiuk@redhat.c=
om" target=3D"_blank">kkostiuk@redhat.com</a>&gt;<br></blockquote><div><br>=
</div><div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:m=
arcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div><=
br></div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0qga/vss-win32/meson.build | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/qga/vss-win32/meson.build b/qga/vss-win32/meson.build<br>
index 71c50d0866..26c5dd6e0e 100644<br>
--- a/qga/vss-win32/meson.build<br>
+++ b/qga/vss-win32/meson.build<br>
@@ -23,8 +23,6 @@ qga_vss =3D shared_module(<br>
=C2=A0 =C2=A0]<br>
=C2=A0)<br>
<br>
-all_qga +=3D qga_vss<br>
-<br>
=C2=A0if midl.found()<br>
=C2=A0 =C2=A0gen_tlb =3D custom_target(&#39;gen-tlb&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0input: &#39;qga-vss.idl&#39;,<br>
@@ -36,3 +34,5 @@ else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0output: &#39;qga-vss.tlb&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0command: [widl, &#39;-t&#39;, &#39;@INPUT@&#39;, &#=
39;-o&#39;, &#39;@OUTPUT@&#39;])<br>
=C2=A0endif<br>
+<br>
+all_qga +=3D [ qga_vss, gen_tlb ]<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000004069f905ddbbc97b--

