Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE82425E5A
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:59:51 +0200 (CEST)
Received: from localhost ([::1]:48168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYaUY-0003oK-47
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:59:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mYaE4-0006EI-4z
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 16:42:48 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:33666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mYaE1-0006Xo-Oj
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 16:42:47 -0400
Received: by mail-lf1-x12e.google.com with SMTP id j21so12141248lfe.0
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 13:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XLQMAzZcVjaoZB+yhRpA3lk+BPApxxOqg7BkXIVl8iQ=;
 b=C6SMD8isZUtVY7DzXtlu/OGio5zPdwETwvVo6KBlOZPwCuoA7g4V7ZWB6pRpMwZxFw
 FnlKvPlIEvkxpocdt+C0EcGD87SqAH4ZWsASNh0IUH8xLKVZ6gsUPe38mupzXCOhs6+C
 f6CEwmi8KA1T8KjWY/xmLzgMDrjP/czGg8HWF4Gj/ZBzXodAcEXzOPRsFqaArA9WyI68
 5B7IproJA5kcPUBclhzGL8TdsTzHmZ06YLcYyD1ZPU+v7x1rgxrwmbZD5i+EsbDNr8hC
 pn7neYP6EQbtuWCDLDm+7gYcRcRMVu+hV2fIqs5c48c7Fu388DUizNUM6/RIyBGWB9Wh
 51Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XLQMAzZcVjaoZB+yhRpA3lk+BPApxxOqg7BkXIVl8iQ=;
 b=YEkriDjGm1TrBSyXznXe/hlB/H1XsK2R/Dgc3Ah8LJMTuhjL26185wTR5cLs7ntmA2
 vx8L5mQhWk6Vv6DkZ3GluwOTlGBfGwXkooRVqkY6SCjWZWrFqKdhMEXU4kdtgItx9ma1
 8nkf6YRTqkUAF7bP1J4k28LaeT/2Us//y4KsuMgVaa+i1pVUsvKarz0bONPGFYk9f/6X
 NPPsVQG69HJets81/DCtNMgCS5r9t796PkQU8EJDamLo4TodJh9BN3d5XAiWNdQfKT2x
 t0H0QKG8lROyyp6219/nlbiasl44Mt1Utub5Xjp3HNtvJ4miydTrKgtRP3f1VYuJmraK
 bg3g==
X-Gm-Message-State: AOAM530w+3lxLqAJRsvhKG9pi23Y3n5nKcysjtwrMHBfNS8Rk6XOdNuu
 TycD6CZSMXNDxvA/x3UWTEJX/FHN4gspcU2AHGs=
X-Google-Smtp-Source: ABdhPJzKUCgEW3uk3pe7tdsUSHWWdnRbeRcbqa5H/Evo6VT9MRkfPwQ2WJtYjRwjCXUVbKoSR23ykND3oqE2YGt0THs=
X-Received: by 2002:ac2:57d4:: with SMTP id k20mr6530082lfo.160.1633639363934; 
 Thu, 07 Oct 2021 13:42:43 -0700 (PDT)
MIME-Version: 1.0
References: <20211007130630.632028-1-pbonzini@redhat.com>
 <20211007130630.632028-2-pbonzini@redhat.com>
In-Reply-To: <20211007130630.632028-2-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 8 Oct 2021 00:42:29 +0400
Message-ID: <CAJ+F1C+j8EqmNZUCZ5DdNwMp+nj_1ZV6fAfV0q0x2QB7iXyjAg@mail.gmail.com>
Subject: Re: [PATCH 01/24] configure: remove --oss-lib
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000fa7e1a05cdc94db7"
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12e.google.com
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
Cc: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>,
 QEMU <qemu-devel@nongnu.org>, Gerd Hoffman <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000fa7e1a05cdc94db7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Oct 7, 2021 at 5:11 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> OSS is a kernel API, so the option should not be needed.  The library
> is used on NetBSD, where OSS is emulated, so keep the variable.
>
> Cc: Gerd Hoffman <kraxel@redhat.com>
> Cc: Volker R=C3=BCmelin <vr_qemu@t-online.de>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Not just NetBSD. You could --audio-drv-list=3Doss and --oss-lib=3D to speci=
fy
the library to link with.

However, I am not sure this is still needed. It was introduced in:
commit 2f6a1ab038eefd6e5a9cfc8ec49435f6ad025812
Author: Blue Swirl <blauwirbel@gmail.com>
Date:   Thu Aug 21 18:00:53 2008 +0000

    Fix OSS on OpenBSD

    git-svn-id: svn://svn.savannah.nongnu.org/qemu/trunk@5045
c046a42c-6fe2-441c-8c8c-71466251a162

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  configure | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/configure b/configure
> index 877bf3d76a..ab6bc0c994 100755
> --- a/configure
> +++ b/configure
> @@ -1007,8 +1007,6 @@ for opt do
>    ;;
>    --enable-gettext) gettext=3D"enabled"
>    ;;
> -  --oss-lib=3D*) oss_lib=3D"$optarg"
> -  ;;
>    --audio-drv-list=3D*) audio_drv_list=3D"$optarg"
>    ;;
>    --block-drv-rw-whitelist=3D*|--block-drv-whitelist=3D*)
> block_drv_rw_whitelist=3D$(echo "$optarg" | sed -e 's/,/ /g')
> @@ -1815,7 +1813,6 @@ Advanced options (experts only):
>    --disable-slirp          disable SLIRP userspace network connectivity
>    --enable-tcg-interpreter enable TCI (TCG with bytecode interpreter,
> experimental and slow)
>    --enable-malloc-trim     enable libc malloc_trim() for memory
> optimization
> -  --oss-lib                path to OSS library
>    --cpu=3DCPU                Build for host CPU [$cpu]
>    --with-coroutine=3DBACKEND coroutine backend. Supported options:
>                             ucontext, sigaltstack, windows
> --
> 2.31.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000fa7e1a05cdc94db7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 7, 2021 at 5:11 PM Paol=
o Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blank">pbon=
zini@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">OSS is a kernel API, so the option should not be needed.=C2=
=A0 The library<br>
is used on NetBSD, where OSS is emulated, so keep the variable.<br>
<br>
Cc: Gerd Hoffman &lt;<a href=3D"mailto:kraxel@redhat.com" target=3D"_blank"=
>kraxel@redhat.com</a>&gt;<br>
Cc: Volker R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.de" target=
=3D"_blank">vr_qemu@t-online.de</a>&gt;<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>Not just NetBSD. You could --audio-drv-list=3Doss and --oss-lib=3D to s=
pecify the library to link with.</div><div><br></div><div>However, I am not=
 sure this is still needed. It was introduced in:</div><div>commit 2f6a1ab0=
38eefd6e5a9cfc8ec49435f6ad025812<br>Author: Blue Swirl &lt;<a href=3D"mailt=
o:blauwirbel@gmail.com" target=3D"_blank">blauwirbel@gmail.com</a>&gt;<br>D=
ate: =C2=A0 Thu Aug 21 18:00:53 2008 +0000<br><br>=C2=A0 =C2=A0 Fix OSS on =
OpenBSD<br>=C2=A0 =C2=A0 <br>=C2=A0 =C2=A0 git-svn-id: svn://<a href=3D"htt=
p://svn.savannah.nongnu.org/qemu/trunk@5045" target=3D"_blank">svn.savannah=
.nongnu.org/qemu/trunk@5045</a> c046a42c-6fe2-441c-8c8c-71466251a162<br></d=
iv><div><br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"m=
ailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redha=
t.com</a>&gt;<br></div><div><br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
---<br>
=C2=A0configure | 3 ---<br>
=C2=A01 file changed, 3 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 877bf3d76a..ab6bc0c994 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -1007,8 +1007,6 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-gettext) gettext=3D&quot;enabled&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --oss-lib=3D*) oss_lib=3D&quot;$optarg&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--audio-drv-list=3D*) audio_drv_list=3D&quot;$optarg&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--block-drv-rw-whitelist=3D*|--block-drv-whitelist=3D*) block_=
drv_rw_whitelist=3D$(echo &quot;$optarg&quot; | sed -e &#39;s/,/ /g&#39;)<b=
r>
@@ -1815,7 +1813,6 @@ Advanced options (experts only):<br>
=C2=A0 =C2=A0--disable-slirp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disable SLIR=
P userspace network connectivity<br>
=C2=A0 =C2=A0--enable-tcg-interpreter enable TCI (TCG with bytecode interpr=
eter, experimental and slow)<br>
=C2=A0 =C2=A0--enable-malloc-trim=C2=A0 =C2=A0 =C2=A0enable libc malloc_tri=
m() for memory optimization<br>
-=C2=A0 --oss-lib=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pa=
th to OSS library<br>
=C2=A0 =C2=A0--cpu=3DCPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 Build for host CPU [$cpu]<br>
=C2=A0 =C2=A0--with-coroutine=3DBACKEND coroutine backend. Supported option=
s:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ucontext, sigaltstack, windows<br>
-- <br>
2.31.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--000000000000fa7e1a05cdc94db7--

