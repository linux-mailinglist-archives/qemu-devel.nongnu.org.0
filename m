Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D838E425DEA
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:47:36 +0200 (CEST)
Received: from localhost ([::1]:39248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYaIh-00045i-OW
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:47:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mYaCq-0003yU-87
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 16:41:32 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mYaCo-0005W3-Mt
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 16:41:31 -0400
Received: by mail-wr1-x431.google.com with SMTP id v25so22808614wra.2
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 13:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dKwtMcGSfbjz2E1AmQYH7JN92pTAL26XtULWIqePfR4=;
 b=p7mQnAIFK+uId9I0Wbr/o6kLpmmAWWvkZknz+MOn8R2RwTB02uVVr8OzbHXv/jYbgQ
 kZjD1uGjN5UWBi53/BEnHZL0i+iAM+7O8rmxiwBiOaP2C8c+GqnCfpYE1GUrgNoikNUD
 lQq9AJF/anIOGf79I4rjJCprhLtWnCpV7XGRHeDG01sre8MSBqJIGRp9o2yXk4nlsBeA
 R2G/23XKYHpj8NmztTn2Q2CzDF3zDIAaKtay8CRD4TOJTtw6n3hmTdXy5rpsSgBb95qQ
 8E+7r7sFD+mrK0jWLj8jeipR4qP+gqUFX6VbjM/XGFLIg1+grfa2jKbC70yfstv/hQZ3
 tDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dKwtMcGSfbjz2E1AmQYH7JN92pTAL26XtULWIqePfR4=;
 b=pOJyWj5AGlklJ6HnupTMgN6hWarSeKIQo19LEDVES/Eu0OE3ik60/2Lwu2HLq2/qia
 5pFX4zPU6acNndvtGj2jTS48gv5h4JcDEoPL+1VMqlWV/DFUCxoNLzia6ba/6DdSNcHg
 9URaZ1ZtwvuU1IU9ZLLCh4MPNSoW/20mr1l7FhOI4w0m5rmwGaLwYVyy326CuAmnOi5/
 iTB0Ki9+w2t/0v/3wACJFPjo2xoL/ZH8pEa92PC24vJEzhvJ+lkpfRBFEDG1ijJH1vEo
 zAQKozNhQUZlvPSTxUewZg7tEGBEpFPizkb//j4KoTYF8G3K8bqVIQRob/2pPbd/ECoE
 RHXw==
X-Gm-Message-State: AOAM533Mfb6lP6c5FjgqY9NMfuDdKOCyx51RTm3AdkRUX2eZbXbYuM/e
 a7KGOfovX6blqTQEgb4u45OdU4J6M/+yI2xcx87WonS/
X-Google-Smtp-Source: ABdhPJyCQ5APkq57B3mo8jJbzkCoeG1aGGouiL7mF2JPXcCSBuYs6j7SQWvbbPvNjTGCI+k0R0LD7sYx9isAkUOlnFA=
X-Received: by 2002:a5d:47a4:: with SMTP id 4mr8434933wrb.374.1633639288584;
 Thu, 07 Oct 2021 13:41:28 -0700 (PDT)
MIME-Version: 1.0
References: <20211007130630.632028-1-pbonzini@redhat.com>
 <20211007130829.632254-16-pbonzini@redhat.com>
In-Reply-To: <20211007130829.632254-16-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 8 Oct 2021 00:41:16 +0400
Message-ID: <CAJ+F1C+ra+drGNsG1g4iUQxwRXt8Rigxh0tR8ZWLXcEVCwQ02w@mail.gmail.com>
Subject: Re: [PATCH 21/24] configure: remove deprecated --{enable,
 disable}-git-update
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000007cbd4405cdc9495e"
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x431.google.com
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

--0000000000007cbd4405cdc9495e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 7, 2021 at 5:23 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> The options were deprecated in 6.0.  That said, we do not really have a
> formal deprecation cycle for build-time changes, since they do not affect
> users.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  configure | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/configure b/configure
> index 33d330dcc9..d00ba0cbd2 100755
> --- a/configure
> +++ b/configure
> @@ -1483,14 +1483,6 @@ for opt do
>    ;;
>    --with-git=3D*) git=3D"$optarg"
>    ;;
> -  --enable-git-update)
> -      git_submodules_action=3D"update"
> -      echo "--enable-git-update deprecated, use
> --with-git-submodules=3Dupdate"
> -  ;;
> -  --disable-git-update)
> -      git_submodules_action=3D"validate"
> -      echo "--disable-git-update deprecated, use
> --with-git-submodules=3Dvalidate"
> -  ;;
>    --with-git-submodules=3D*)
>        git_submodules_action=3D"$optarg"
>    ;;
> --
> 2.31.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000007cbd4405cdc9495e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 7, 2021 at 5:23 PM Paolo =
Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blank">pbonzi=
ni@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">The options were deprecated in 6.0.=C2=A0 That said, we do not=
 really have a<br>
formal deprecation cycle for build-time changes, since they do not affect<b=
r>
users.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandr=
e.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<=
/div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0configure | 8 --------<br>
=C2=A01 file changed, 8 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 33d330dcc9..d00ba0cbd2 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -1483,14 +1483,6 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--with-git=3D*) git=3D&quot;$optarg&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --enable-git-update)<br>
-=C2=A0 =C2=A0 =C2=A0 git_submodules_action=3D&quot;update&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 echo &quot;--enable-git-update deprecated, use --with=
-git-submodules=3Dupdate&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-git-update)<br>
-=C2=A0 =C2=A0 =C2=A0 git_submodules_action=3D&quot;validate&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 echo &quot;--disable-git-update deprecated, use --wit=
h-git-submodules=3Dvalidate&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--with-git-submodules=3D*)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0git_submodules_action=3D&quot;$optarg&quot;<br>
=C2=A0 =C2=A0;;<br>
-- <br>
2.31.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--0000000000007cbd4405cdc9495e--

