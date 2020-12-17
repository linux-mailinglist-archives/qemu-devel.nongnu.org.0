Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5612DCF6E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 11:22:46 +0100 (CET)
Received: from localhost ([::1]:41056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpqQn-0005J1-TS
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 05:22:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kpqOX-0004V1-E2
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 05:20:25 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:33581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kpqOU-0004OO-J6
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 05:20:25 -0500
Received: by mail-ej1-x636.google.com with SMTP id b9so12131794ejy.0
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 02:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TTMWIUSxLghNxgLssDk/G+ndSM20Vv69jYm7oZ8Csk0=;
 b=dDzt71uTUDJTwpkavrtCU6CUavtZ7uuu/9pqIm2fut822wdIHmDra6e74Eh7Rm0w9N
 61BKqIzSxzmMUW+LJi3O/caWwXvLl5akuREwMKC3MdPjWxwQIn1UBZAJHV0glqSqbIbR
 nklzOYu22UGOlPwt/Zh44Le+LEfcAHpFYwCXBi2egWnof3MaOnD6LR81qfid91S1EiBx
 qz6N5HMTbgVPHeYDZmbx4VnfPWuu+dGbMPhrF7uJWC7LolwJzXmZMkIimCJt4sbRfldl
 w3MHv6t9gMI6EhVwZIx/xXwqlka0h54bRjjX1rOhIGb9n+mb4JoZpjZRyasW/Hpzy0Aq
 Wn6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TTMWIUSxLghNxgLssDk/G+ndSM20Vv69jYm7oZ8Csk0=;
 b=q74poaH77W7Q31oVzDA/pnlNv4YNmMmidh1sSRrynaJWadWqEBQynZbTeZbZ201ejo
 E/cBrEZ965Z89/Qbz3czHWtA7xKnakyY8SXYw675fgaxCsL1YUfLlxVky5IlNIbmSdTs
 l2Sf6U7gVb+e+paAu1G+HG9IAEiTxHQ1KXuQp33M2A5zRR83iBP6dOM7F0mW8Mm0JqIQ
 ryhCZCajnknIw281vTSP7CaOiXkmr9sst+Ln6jTPw473jyJC8TQ/4hOyk/KnK2xIY1gG
 3Yny2NWuWirMcBwsiY5i08BuQUWIpS8YD4qPjWQTG/NPAUS6PBB4DvQgH8yihp/bH9+s
 zh2A==
X-Gm-Message-State: AOAM531x61QCgIup4TsTkqMV1XPfoVwG+vC/tGpxL+6f1Z6Ytq5kskps
 ROffZ3L+P059uBNbhuBBqSx2xInjMiQvAHvHFz8=
X-Google-Smtp-Source: ABdhPJzNqh6HOWjZgGTL4JY2orQdHHjvTv2A26auE9eqpJt7ywbhdYT6MBRvJwELwKqm0fZJanDeLbYWIRrZpfGgURw=
X-Received: by 2002:a17:906:30d2:: with SMTP id
 b18mr34298034ejb.109.1608200419349; 
 Thu, 17 Dec 2020 02:20:19 -0800 (PST)
MIME-Version: 1.0
References: <20201217085005.10644-1-pbonzini@redhat.com>
 <20201217085005.10644-2-pbonzini@redhat.com>
In-Reply-To: <20201217085005.10644-2-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 17 Dec 2020 14:20:07 +0400
Message-ID: <CAJ+F1CKe8jL0cT2ECfWN52KM6pCcdC7MF=JZm5WKmQiDw_xoAQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] configure: remove useless code to check for Xen PCI
 passthrough
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000b918e205b6a656a8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

--000000000000b918e205b6a656a8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2020 at 12:51 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> meson.build is already doing the same check, so remove it from
> configure.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  configure | 12 ------------
>  1 file changed, 12 deletions(-)
>
> diff --git a/configure b/configure
> index 708cf365f0..085a5ad7ff 100755
> --- a/configure
> +++ b/configure
> @@ -2879,18 +2879,6 @@ EOF
>    fi
>  fi
>
> -if test "$xen_pci_passthrough" !=3D "disabled"; then
> -  if test "$xen" =3D "enabled" && test "$linux" =3D "yes"; then
> -    xen_pci_passthrough=3Denabled
> -  else
> -    if test "$xen_pci_passthrough" =3D "enabled"; then
> -      error_exit "User requested feature Xen PCI Passthrough" \
> -          " but this feature requires /sys from Linux"
> -    fi
> -    xen_pci_passthrough=3Ddisabled
> -  fi
> -fi
> -
>  ##########################################
>  # X11 probe
>  if $pkg_config --exists "x11"; then
> --
> 2.29.2
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000b918e205b6a656a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 17, 2020 at 12:51 PM Paol=
o Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">mes=
on.build is already doing the same check, so remove it from<br>
configure.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lur=
eau@redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></div><div><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0configure | 12 ------------<br>
=C2=A01 file changed, 12 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 708cf365f0..085a5ad7ff 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -2879,18 +2879,6 @@ EOF<br>
=C2=A0 =C2=A0fi<br>
=C2=A0fi<br>
<br>
-if test &quot;$xen_pci_passthrough&quot; !=3D &quot;disabled&quot;; then<b=
r>
-=C2=A0 if test &quot;$xen&quot; =3D &quot;enabled&quot; &amp;&amp; test &q=
uot;$linux&quot; =3D &quot;yes&quot;; then<br>
-=C2=A0 =C2=A0 xen_pci_passthrough=3Denabled<br>
-=C2=A0 else<br>
-=C2=A0 =C2=A0 if test &quot;$xen_pci_passthrough&quot; =3D &quot;enabled&q=
uot;; then<br>
-=C2=A0 =C2=A0 =C2=A0 error_exit &quot;User requested feature Xen PCI Passt=
hrough&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot; but this feature requires /sys f=
rom Linux&quot;<br>
-=C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 xen_pci_passthrough=3Ddisabled<br>
-=C2=A0 fi<br>
-fi<br>
-<br>
=C2=A0##########################################<br>
=C2=A0# X11 probe<br>
=C2=A0if $pkg_config --exists &quot;x11&quot;; then<br>
-- <br>
2.29.2<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000b918e205b6a656a8--

