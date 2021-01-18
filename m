Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 392D92F97E1
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 03:39:05 +0100 (CET)
Received: from localhost ([::1]:59946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1KRc-0001RR-89
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 21:39:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1l1KQ1-0000Kq-O8
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 21:37:25 -0500
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:33568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1l1KPw-0001IG-Ml
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 21:37:25 -0500
Received: by mail-qk1-x732.google.com with SMTP id f26so17523513qka.0
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 18:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BWKg7T7AA1RzsOwaQQUFuuTXCdkP25EHCTH2JCANgdc=;
 b=sVO1M0FqkaEygJw5WOoSgbcPQq2Cv/fsO0oR/ZkUJPRwUhkesbmoU30Vw9AJ8aDfLO
 +art65/UFzeosiPasZKtBvbJiX+DgJD9HJ+nGRGp03lvZmz1+XoZvYGOcUDYHiJZ2838
 OpBeQlFfAXKD+dlnjwHzmuyvvMRZzQWq3EjCKAUtN2hXSXINRt5YvNBVfqh/5pLVnuki
 Jw/UASmW9XRT6kGeWCaNP+Tbi6EzLXyGae0pc7b8mLHBZbSqXB1YaLHLJCcQakbex0ST
 fJCT2Nv6m8R+W2PDVRDcbTF5twtyGUGJqpbTUT7hrUOqVjL6wYRyyA4JHfqR/yPropr7
 2cxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BWKg7T7AA1RzsOwaQQUFuuTXCdkP25EHCTH2JCANgdc=;
 b=Jd3+BQMIFC0Zjn57X69Zwgli7Gst0GDegqZ7tyc7lpAGijrdGCMZAMNQtb1qz2Qq0A
 vrhKiqKVqm+WpwV2a0ePjPYSTW6KGaC2/5c/BRqzU2ioD9NQGLqlUxlhrqwo1QIHMM+i
 5okHvWWMAItWdAd2SyuvrJuhetcu2d1oknlPzAqIUsJE5twDC86OoJunLy9nm177HJos
 q7oU6nSoJTGz94oeQ3T8bI87MvycmpY/I4GijulA8/Lh3NPb0df734zAnRdPbmyBQlGI
 5kZB0iYtNsW3ZfmazRbFiFu6CU9gNKJuBgTkhYCV4AwCS1a3+c2eeTycHlMbo8+6hlNt
 rj/g==
X-Gm-Message-State: AOAM533GTfNsSiv5pWbxxESiP3h1EHndtmh3Kgzk2cbi2fCP5+5pWZ3c
 F1ge9s5vwlBSWLkU6P6oIVNeXAxnAHVxIjARA3+doQ==
X-Google-Smtp-Source: ABdhPJyADGd4X3LyGzQ9j47+di79LIiXcWIRXVZAVHPofCc1Kf4dPJsJbuPt9Z+txRSwFJd8ppfgCRO9WDwz3UtLicI=
X-Received: by 2002:a37:8505:: with SMTP id h5mr22721502qkd.44.1610937439662; 
 Sun, 17 Jan 2021 18:37:19 -0800 (PST)
MIME-Version: 1.0
References: <c75512b3-0665-d686-5ea4-248a9819355d@huawei.com>
 <2d69a2e7-67a2-3660-8ffe-de0962a046af@huawei.com>
In-Reply-To: <2d69a2e7-67a2-3660-8ffe-de0962a046af@huawei.com>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 17 Jan 2021 19:37:07 -0700
Message-ID: <CANCZdfqQhc_aP6vQ8GKnDwKJ6nhoR3H1Q08w4v2VdKS7=GY50Q@mail.gmail.com>
Subject: Re: [PATCH V4 3/4] bsd-user: do not use C99 // comments
To: shiliyang <shiliyang@huawei.com>
Content-Type: multipart/alternative; boundary="000000000000d8cad305b9239963"
Received-SPF: none client-ip=2607:f8b0:4864:20::732;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x732.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: alex.chen@huawei.com, Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, hunongda@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d8cad305b9239963
Content-Type: text/plain; charset="UTF-8"

Same: please submit this via http://github.com/qemu-bsd-user...

Warner

On Sun, Jan 17, 2021, 7:20 PM shiliyang <shiliyang@huawei.com> wrote:

> This patch fixes error messages found by checkpatch.pl:
> ERROR: do not use C99 // comments
>
> Signed-off-by: Liyang Shi <shiliyang@huawei.com>
> ---
>  bsd-user/elfload.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
> index d5cab25607..2842dfe56b 100644
> --- a/bsd-user/elfload.c
> +++ b/bsd-user/elfload.c
> @@ -390,7 +390,7 @@ static const char *lookup_symbolxx(struct syminfo *s,
> target_ulong orig_addr)
>      struct elf_sym *syms = s->disas_symtab.elf64;
>  #endif
>
> -    // binary search
> +    /* binary search */
>      struct elf_sym *sym;
>
>      sym = bsearch(&orig_addr, syms, s->disas_num_syms, sizeof(*syms),
> symfind);
> @@ -465,7 +465,7 @@ found:
>      i = 0;
>      while (i < nsyms) {
>          bswap_sym(syms + i);
> -        // Throw away entries which we do not need.
> +        /* Throw away entries which we do not need. */
>          if (syms[i].st_shndx == SHN_UNDEF ||
>                  syms[i].st_shndx >= SHN_LORESERVE ||
>                  ELF_ST_TYPE(syms[i].st_info) != STT_FUNC) {
> --
> 2.29.1.59.gf9b6481aed
>
>

--000000000000d8cad305b9239963
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Same: please submit this via <a href=3D"http://github.com=
/qemu-bsd-user.">http://github.com/qemu-bsd-user.</a>..<div dir=3D"auto"><b=
r></div><div dir=3D"auto">Warner</div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jan 17, 2021, 7:20 PM shiliya=
ng &lt;<a href=3D"mailto:shiliyang@huawei.com">shiliyang@huawei.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">This patch fixes error mess=
ages found by <a href=3D"http://checkpatch.pl" rel=3D"noreferrer noreferrer=
" target=3D"_blank">checkpatch.pl</a>:<br>
ERROR: do not use C99 // comments<br>
<br>
Signed-off-by: Liyang Shi &lt;<a href=3D"mailto:shiliyang@huawei.com" targe=
t=3D"_blank" rel=3D"noreferrer">shiliyang@huawei.com</a>&gt;<br>
---<br>
=C2=A0bsd-user/elfload.c | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c<br>
index d5cab25607..2842dfe56b 100644<br>
--- a/bsd-user/elfload.c<br>
+++ b/bsd-user/elfload.c<br>
@@ -390,7 +390,7 @@ static const char *lookup_symbolxx(struct syminfo *s, t=
arget_ulong orig_addr)<br>
=C2=A0 =C2=A0 =C2=A0struct elf_sym *syms =3D s-&gt;disas_symtab.elf64;<br>
=C2=A0#endif<br>
<br>
-=C2=A0 =C2=A0 // binary search<br>
+=C2=A0 =C2=A0 /* binary search */<br>
=C2=A0 =C2=A0 =C2=A0struct elf_sym *sym;<br>
<br>
=C2=A0 =C2=A0 =C2=A0sym =3D bsearch(&amp;orig_addr, syms, s-&gt;disas_num_s=
yms, sizeof(*syms), symfind);<br>
@@ -465,7 +465,7 @@ found:<br>
=C2=A0 =C2=A0 =C2=A0i =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0while (i &lt; nsyms) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bswap_sym(syms + i);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 // Throw away entries which we do not need.<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Throw away entries which we do not need. */=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (syms[i].st_shndx =3D=3D SHN_UNDEF ||<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0syms[i].st_sh=
ndx &gt;=3D SHN_LORESERVE ||<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ELF_ST_TYPE(s=
yms[i].st_info) !=3D STT_FUNC) {<br>
-- <br>
2.29.1.59.gf9b6481aed<br>
<br>
</blockquote></div>

--000000000000d8cad305b9239963--

