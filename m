Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F2E5A7E5E
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 15:12:32 +0200 (CEST)
Received: from localhost ([::1]:51776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTNWB-0001xc-MA
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 09:12:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTNTc-0007Vd-Qm
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 09:09:52 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:41498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTNTa-0004Vo-IN
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 09:09:52 -0400
Received: by mail-lf1-x135.google.com with SMTP id m7so10970005lfq.8
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 06:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=Tw8BIsOvLpbTK1mYSemq//V2cRs+p+i6EYZFFCMPKOQ=;
 b=o2HsB0LcRSkz1OZajSb3uQpsq48kKzLkOgeDVQsPPcq/pgtEyX4LHMLT80RzmyqTq7
 HPjYiz4rn+uxM7EfGUu6ML2xJ6uT+kYRvyjXGR7+G47mdTlT7WdK1YYfJR4SYXXvrr7M
 fA8zyZR6hB7BoXcrA0UiTstw6CQu5iWxnnH1zdA0lgCU1fLmI0zIfLgpcxh5H4JrOPFt
 2kFx+dcBbrKBOCrYwOvUEpnD/Ku93ZZM/E95Qt/+MBKMLGbrR6/06M93TLeXtWZSyVXq
 2PGPDGEdlbNsWcBoOAGzgkN2piPelee0yHUG7LsqKW4/4K0heuxuLD0+PncsWvn7Vjaq
 0ccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=Tw8BIsOvLpbTK1mYSemq//V2cRs+p+i6EYZFFCMPKOQ=;
 b=fRaao1EqRaTv6IDfkGFXoGiKbkzEV43Pv4wKRQvm+6nzQrXSu+wSRB+a1rdDYUyPrP
 YnWJjmW/0BAdwTWp/LzgYOXlGMnRyNbJQ92u9byfN+f/b+P25EnsU90aDEmv10aGI2Tm
 bqjZ/wVSlJHZTaiOYrAorh4cq6iApyWSPuVrA5dRXz7ppQ2WOj4y1oMi2z0sKPM2mV+V
 tQccdfR0ItjV023SJYmVC2e45NYBuOMydXQsdQ6UlVlOdU9lXMbu8uWlsd8DfaZU/Db6
 rZ/9mW0SO0Nrkn4PPI08cG7/ZCQ94AsCC/8zQ8lWrO+bZWxPBUERwY1bh6Wby5UVEM67
 FZzA==
X-Gm-Message-State: ACgBeo0ThqbIsoUPEtuEI25/EhfzmPbH5wXHxbRNoV+7+dtqAENxUrei
 cyJzlGHXzSNLbljXOsEgWp6AMv4HJYEi9ILMq9U=
X-Google-Smtp-Source: AA6agR5SvCkbw8jhqmUr6rv/JJPguVQOlEhV5D6OCMxLgrIagtNT3yh0L/jy9mcS7f488pTO08700/yaRKjOCkbOdkA=
X-Received: by 2002:a05:6512:2306:b0:48b:2905:21a8 with SMTP id
 o6-20020a056512230600b0048b290521a8mr10204784lfu.167.1661951387665; Wed, 31
 Aug 2022 06:09:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-11-bmeng.cn@gmail.com>
In-Reply-To: <20220824094029.1634519-11-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 31 Aug 2022 17:09:36 +0400
Message-ID: <CAJ+F1CKeTdYfhOH4-O=zO+q4d+WN-554rQi+UqUeUpKgXjzh_A@mail.gmail.com>
Subject: Re: [PATCH 10/51] hw/usb: dev-mtp: Use g_mkdir_with_parents()
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000188ed805e7893624"
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

--000000000000188ed805e7893624
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 24, 2022 at 1:48 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> Use the same g_mkdir_with_parents() call to create a directory on
> all platforms.
>
>
Same comment as earlier regarding g_mkdir() vs _with_parent().


> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  hw/usb/dev-mtp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c
> index 5831395cef..97c894f231 100644
> --- a/hw/usb/dev-mtp.c
> +++ b/hw/usb/dev-mtp.c
> @@ -1622,7 +1622,7 @@ static void usb_mtp_write_data(MTPState *s, uint32_=
t
> handle)
>          if (s->dataset.filename) {
>              path =3D g_strdup_printf("%s/%s", parent->path,
> s->dataset.filename);
>              if (s->dataset.format =3D=3D FMT_ASSOCIATION) {
> -                ret =3D mkdir(path, mask);
> +                ret =3D g_mkdir_with_parents(path, mask);
>                  if (!ret) {
>                      usb_mtp_queue_result(s, RES_OK, d->trans, 3,
>                                           QEMU_STORAGE_ID,
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000188ed805e7893624
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 24, 2022 at 1:48 PM Bin M=
eng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin M=
eng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.men=
g@windriver.com</a>&gt;<br>
<br>
Use the same g_mkdir_with_parents() call to create a directory on<br>
all platforms.<br>
<br></blockquote><div><br></div><div>Same comment as earlier regarding g_mk=
dir() vs _with_parent().</div><div>=C2=A0<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
---<br>
<br>
=C2=A0hw/usb/dev-mtp.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c<br>
index 5831395cef..97c894f231 100644<br>
--- a/hw/usb/dev-mtp.c<br>
+++ b/hw/usb/dev-mtp.c<br>
@@ -1622,7 +1622,7 @@ static void usb_mtp_write_data(MTPState *s, uint32_t =
handle)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;dataset.filename) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0path =3D g_strdup_printf(&q=
uot;%s/%s&quot;, parent-&gt;path, s-&gt;dataset.filename);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;dataset.format =
=3D=3D FMT_ASSOCIATION) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D mkdir(path=
, mask);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D g_mkdir_wi=
th_parents(path, mask);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ret) {<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0usb_mtp_queue_result(s, RES_OK, d-&gt;trans, 3,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Q=
EMU_STORAGE_ID,<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000188ed805e7893624--

