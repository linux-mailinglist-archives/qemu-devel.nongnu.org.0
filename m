Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E70C3508DA3
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 18:49:04 +0200 (CEST)
Received: from localhost ([::1]:44836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhDVn-0006WQ-Pw
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 12:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhCsk-0005IS-DC
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 12:08:43 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:41521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhCsi-0006F3-Md
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 12:08:42 -0400
Received: by mail-qk1-x72f.google.com with SMTP id s70so1545637qke.8
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 09:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pnH7/v2ym2B8lZSETv7LvdjkzVSdDa95n/0GNlq5ujg=;
 b=Y+TbC0Ug/rdZPFhLXMHZKk2XK+obanZdR/0cvC6PHvyjw9rYlerSDi33A2eZiiENU4
 BaZqxnwUjiazzaio2nW51PS+2a0ffO2xHw09+M6LfUgVzZidN13av2zO0ckXl+m/hbeN
 iyJwaqHX9hF3Lma6oQo4MAkQoN8OXstdwgXVK0HwkqH4Q5IVNXeGP/LP5IW3XmL7t0Hp
 StzLIiGMT5Y2wqgJinLGbT8xCNbQ+qEKUoO3vYz0KzfrLjvzYmuxuR/y+OT9JTz8PJvF
 Nmn9lpGFA21n1LZmrX+Bs2XTrj/Jh4VFORpGdFyhryh9KCaAJZjeYyNPZs8MZQ1Kulbb
 c9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pnH7/v2ym2B8lZSETv7LvdjkzVSdDa95n/0GNlq5ujg=;
 b=BtswCaElfuzskD2lDEsZuolrkYsk5tkcOI/75kbj46xziuQ4sveOvWsEIWBXU93T4g
 KWpw11OAi/RDT41qXJPQ4H09R/Q4uD6/YZFVth0NvfhzbKMcz7/bN0CJ7likWysenCSg
 LWshm18ovhn+nzZPdZgXfuGhpNJyLxKtbze/wkTGlw4vd5ErbuKOKrZSaWqfoLU0/rpl
 YiMLwPdbOC4KkhpbLDFA25ODlIjBxOPR8bZ3sccDAi2Byr44S8/p0AeD6MTOEStO8HT2
 gx66ZF5GeTS/WUUi/r3pF8UXB4+KIBUnMoNcYjRQb9iW8jEci0nH79pIUQX8Lk+zghgd
 Sx9Q==
X-Gm-Message-State: AOAM532E1uHMplKdDLYwz5Ct0mMjjmNKxhO3q15JRAtgKVUGVLnr5b2w
 zuMrGnb7YaM7eVjkgpzNi2jf+7fh9fnEiMVYmjZyYAhXNbB1YA==
X-Google-Smtp-Source: ABdhPJyytWQM/YlSQegJU7xEHJ+gwKv1YOa/uXdmAVrrFFSoFoRalfVh3KkENBKLXWvNzhs6GqLkuZi8RWhrvRLTfBw=
X-Received: by 2002:ae9:ef4e:0:b0:69e:2403:eae8 with SMTP id
 d75-20020ae9ef4e000000b0069e2403eae8mr12676320qkg.397.1650470919785; Wed, 20
 Apr 2022 09:08:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220420153407.73926-1-pbonzini@redhat.com>
 <20220420153407.73926-7-pbonzini@redhat.com>
In-Reply-To: <20220420153407.73926-7-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 20 Apr 2022 20:08:28 +0400
Message-ID: <CAJ+F1CLx_gc=cL=VThgvLS0T3wZ7wzmD8bhr3gxffLtN3VJXJQ@mail.gmail.com>
Subject: Re: [PATCH 06/34] configure: move --enable/--disable-debug-info to
 second option parsing pass
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e2d27a05dd1834a4"
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

--000000000000e2d27a05dd1834a4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2022 at 7:40 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> $debug_info is not needed anywhere except in the final meson invocation,
> no need to special case it.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  configure | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
>
> diff --git a/configure b/configure
> index 48ae18f47f..07053e7b27 100755
> --- a/configure
> +++ b/configure
> @@ -244,7 +244,6 @@ audio_drv_list=3D"default"
>  block_drv_rw_whitelist=3D""
>  block_drv_ro_whitelist=3D""
>  host_cc=3D"cc"
> -debug_info=3D"yes"
>  lto=3D"false"
>  stack_protector=3D""
>  safe_stack=3D""
> @@ -304,6 +303,7 @@ vhost_user_fs=3D"$default_feature"
>  vhost_vdpa=3D"$default_feature"
>  rdma=3D"$default_feature"
>  pvrdma=3D"$default_feature"
> +debug_info=3D"yes"
>  debug_tcg=3D"no"
>  debug=3D"no"
>  sanitizers=3D"no"
> @@ -379,10 +379,6 @@ for opt do
>    ;;
>    --extra-ldflags=3D*) EXTRA_LDFLAGS=3D"$EXTRA_LDFLAGS $optarg"
>    ;;
> -  --enable-debug-info) debug_info=3D"yes"
> -  ;;
> -  --disable-debug-info) debug_info=3D"no"
> -  ;;
>    --cross-cc-*[!a-zA-Z0-9_-]*=3D*) error_exit "Passed bad --cross-cc-FOO
> option"
>    ;;
>    --cross-cc-cflags-*) cc_arch=3D${opt#--cross-cc-cflags-};
> cc_arch=3D${cc_arch%%=3D*}
> @@ -759,12 +755,12 @@ for opt do
>    ;;
>    --extra-ldflags=3D*)
>    ;;
> -  --enable-debug-info)
> -  ;;
> -  --disable-debug-info)
> -  ;;
>    --cross-cc-*)
>    ;;
> +  --enable-debug-info) debug_info=3D"yes"
> +  ;;
> +  --disable-debug-info) debug_info=3D"no"
> +  ;;
>    --enable-modules)
>        modules=3D"yes"
>    ;;
> --
> 2.35.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000e2d27a05dd1834a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 20, 2022 at 7:40 PM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">$deb=
ug_info is not needed anywhere except in the final meson invocation,<br>
no need to special case it.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandr=
e.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<=
/div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0configure | 14 +++++---------<br>
=C2=A01 file changed, 5 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 48ae18f47f..07053e7b27 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -244,7 +244,6 @@ audio_drv_list=3D&quot;default&quot;<br>
=C2=A0block_drv_rw_whitelist=3D&quot;&quot;<br>
=C2=A0block_drv_ro_whitelist=3D&quot;&quot;<br>
=C2=A0host_cc=3D&quot;cc&quot;<br>
-debug_info=3D&quot;yes&quot;<br>
=C2=A0lto=3D&quot;false&quot;<br>
=C2=A0stack_protector=3D&quot;&quot;<br>
=C2=A0safe_stack=3D&quot;&quot;<br>
@@ -304,6 +303,7 @@ vhost_user_fs=3D&quot;$default_feature&quot;<br>
=C2=A0vhost_vdpa=3D&quot;$default_feature&quot;<br>
=C2=A0rdma=3D&quot;$default_feature&quot;<br>
=C2=A0pvrdma=3D&quot;$default_feature&quot;<br>
+debug_info=3D&quot;yes&quot;<br>
=C2=A0debug_tcg=3D&quot;no&quot;<br>
=C2=A0debug=3D&quot;no&quot;<br>
=C2=A0sanitizers=3D&quot;no&quot;<br>
@@ -379,10 +379,6 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--extra-ldflags=3D*) EXTRA_LDFLAGS=3D&quot;$EXTRA_LDFLAGS $opt=
arg&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --enable-debug-info) debug_info=3D&quot;yes&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-debug-info) debug_info=3D&quot;no&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--cross-cc-*[!a-zA-Z0-9_-]*=3D*) error_exit &quot;Passed bad -=
-cross-cc-FOO option&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--cross-cc-cflags-*) cc_arch=3D${opt#--cross-cc-cflags-}; cc_a=
rch=3D${cc_arch%%=3D*}<br>
@@ -759,12 +755,12 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--extra-ldflags=3D*)<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --enable-debug-info)<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-debug-info)<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--cross-cc-*)<br>
=C2=A0 =C2=A0;;<br>
+=C2=A0 --enable-debug-info) debug_info=3D&quot;yes&quot;<br>
+=C2=A0 ;;<br>
+=C2=A0 --disable-debug-info) debug_info=3D&quot;no&quot;<br>
+=C2=A0 ;;<br>
=C2=A0 =C2=A0--enable-modules)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0modules=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0;;<br>
-- <br>
2.35.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000e2d27a05dd1834a4--

