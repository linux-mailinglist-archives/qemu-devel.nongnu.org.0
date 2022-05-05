Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1329E51BB5E
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 11:04:45 +0200 (CEST)
Received: from localhost ([::1]:35160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmXPf-0001hq-P4
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 05:04:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nmWjm-0005fB-5a
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:21:26 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:35686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nmWjk-0000cz-IM
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:21:25 -0400
Received: by mail-lf1-x135.google.com with SMTP id h29so6256579lfj.2
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 01:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bfrG5g3SsoZ4yl+R6NqKBMo1D1WTIr2+iYITFvUiJVQ=;
 b=dMHNB2am6OXFKhlqhoRHQxSVc8saFzinmYIg2tlGuvnHAK+ciH/W/tFtltS8Q9UNcf
 Ty0SqSYQ+n96Abv8k/BydPR6d9jBKchuCOy6eJDUinyOfOM7c54bO9LgabnlFxjXncVy
 rzji5ATqDAqhbMYZqr14dK19uU2KBJWjZXmAYdmy1LqIvYlbs5ziTeNq9vldVouzs7Iw
 nfi6cj3NHyDXnuy5V4BtsSdGphVC+o4A0hgAeVyL7jsNecpXmZl+f85roVXN31TTrK3N
 nwmrLMMchh8rxD8C9eBIPssKNP1VvwlyPHyWpyyKGi1W/qXioPMzYBoVIPmjINizRCHz
 Eegw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bfrG5g3SsoZ4yl+R6NqKBMo1D1WTIr2+iYITFvUiJVQ=;
 b=zVmrNa/22GswcFilgCWdg9XxEDi0bVC6eioPMqWE2QxkWM6beSWpAvjnbWXKDsZjuV
 2+jHZBDxMnvHgx9yu5pG9C5gvqqYP/iO1poc7n5F2zD+AGqvXe9TObo+8kDRqBNS6ByL
 1984qknnc8Q+UyDbrt0lfY0bsbwfS3yPpAMD0nmjQl7moRX+4nFFz0uOthdcvWT41IjA
 G1lFjD8PQ0qTjUqdeVn+ar0f464w7pAcDIbovXMEU5n0SbPc/WNzt3StheU3/fNj7Ik2
 FGM/YVSIWxsxUyYmpVGudbybbyDlVgUzq4uVC/n87l5IvNNC+poe621Kqwmv7hym2xK2
 DgQQ==
X-Gm-Message-State: AOAM533vnpAA4rg+84V4QotqKGNAIrvdkRRzy+BqWS4RTnwwJVIGS8ql
 GliYq0+7FdXnzgz4XsAL9knN7AV4UgI2zuDuqUKDNI5H
X-Google-Smtp-Source: ABdhPJzprZu9vCkgSzwkCOyxaAO3XRe01OZ1vIuOq56dfPfCZoX0vz3IdtXKGdYrdFXCL4tDumAosImOc/VecSNRMbo=
X-Received: by 2002:a05:6512:4004:b0:472:5e6b:91d5 with SMTP id
 br4-20020a056512400400b004725e6b91d5mr13546221lfb.357.1651738882810; Thu, 05
 May 2022 01:21:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220504210001.678419-1-pbonzini@redhat.com>
 <20220504210001.678419-2-pbonzini@redhat.com>
In-Reply-To: <20220504210001.678419-2-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 5 May 2022 12:21:11 +0400
Message-ID: <CAJ+F1CJgNMcVNFsctNR9MAaQ_5XojbX1J=LgjsVqyveArW6Xuw@mail.gmail.com>
Subject: Re: [PATCH 1/5] slirp: bump submodule to 4.7 release
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, Daniele Buono <dbuono@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="0000000000005f268c05de3f6d59"
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x135.google.com
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

--0000000000005f268c05de3f6d59
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 5, 2022 at 1:06 AM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Version 4.7 of slirp provides a new timer API that works better with CFI,
> together with several other improvements:
>
> * Allow disabling the internal DHCP server !22
> * Support Unix sockets in hostfwd !103
> * IPv6 DNS proxying support !110
> * bootp: add support for UEFI HTTP boot !111
>
> and bugfixes.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  slirp | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/slirp b/slirp
> index a88d9ace23..3ad1710a96 160000
> --- a/slirp
> +++ b/slirp
> @@ -1 +1 @@
> -Subproject commit a88d9ace234a24ce1c17189642ef9104799425e0
> +Subproject commit 3ad1710a96678fe79066b1469cead4058713a1d9
> --
> 2.35.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000005f268c05de3f6d59
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 5, 2022 at 1:06 AM Paolo =
Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Versi=
on 4.7 of slirp provides a new timer API that works better with CFI,<br>
together with several other improvements:<br>
<br>
* Allow disabling the internal DHCP server !22<br>
* Support Unix sockets in hostfwd !103<br>
* IPv6 DNS proxying support !110<br>
* bootp: add support for UEFI HTTP boot !111<br>
<br>
and bugfixes.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lur=
eau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=C2=A0<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0slirp | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/slirp b/slirp<br>
index a88d9ace23..3ad1710a96 160000<br>
--- a/slirp<br>
+++ b/slirp<br>
@@ -1 +1 @@<br>
-Subproject commit a88d9ace234a24ce1c17189642ef9104799425e0<br>
+Subproject commit 3ad1710a96678fe79066b1469cead4058713a1d9<br>
-- <br>
2.35.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000005f268c05de3f6d59--

