Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E34642FB1B
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 20:37:14 +0200 (CEST)
Received: from localhost ([::1]:52150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbS4v-0005RK-DZ
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 14:37:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbS0z-00027i-3W
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 14:33:10 -0400
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d]:42760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbS0s-0000JS-5o
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 14:33:08 -0400
Received: by mail-ua1-x92d.google.com with SMTP id j8so19792173uak.9
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 11:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zD7xvEHQzA5g0sfaPuGnNDx2bFfI7KLINKAzV4fLDbg=;
 b=TgwMWXvjNPxSEnYrBCYJGHEU2jhU/yOFPGhdXRHzzbiY4femxbFGNCMWlJoklRL9bY
 QcVcJj0WDPXc20REliAtHEF7jxGljsUdDdiyJ8q6UzEvTvco8i5VxiyjEf41scNhsaMB
 O04z9z2Udmz0AHMj9zmuT+0NE3qUJ7MaCB9NDdSw5Kwq5IJOorCp/C93gNXkc+WpIdDX
 RqzASuWxZXuF9Z7PxRdaNSPo9AnpOlPgtEC7Uaj2QvT2HZ1K/EKe2HL515L/ZGD4dLhM
 1WbsgoRn1G74Ro8sgSgDCa0rHmpIMKDQtVnfkTS2z1F7lHL0Z5U/LMeMKI3MtDNAHTEI
 zTMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zD7xvEHQzA5g0sfaPuGnNDx2bFfI7KLINKAzV4fLDbg=;
 b=D/hT1rOF/D0i9q+F674R0G3GeDTy5AaeBbK2omIloJIbFByP8WTcoVHQGSQQAmkQox
 EHjNj5lbH8XY5ln3F6TieW7ZtW4FI3CbMSznQQ1kJDj73fqpW5hl7m3MZmYZf446dxmh
 rbEJYYuKbw9mLPJ2bVZmgf32MfVxHwboD2OtcVc0lfj1Kq/vWNfl7+Syjl3pP70mPDTi
 fIEiCUp/sqm1rk0gpST90vBnz4c79bcneMICQT6iGh0opg9yiW1ES6cXpSrgHJSXK6k6
 SiLWUViP1TZ+IalkR0oMGJcpq9NbS2fK0Nlza1lTL7Xvtkc+9VhB4fRokEk7aKm0UMq+
 LItQ==
X-Gm-Message-State: AOAM532Wz0qWChI/2Qv1osHxmk86cLzChH8KsVFsSGKu4PXMYT6gnGF+
 6BSkoYRUbxsuSsOji38lndw1PqFB38VFlBg1uyB4Ng==
X-Google-Smtp-Source: ABdhPJwvHy4/Yzid+sa4/hhtf1e+0W/oZjsPNP7FtoKtkBgAdkTT1Bl165dR6WPeektkAqTJqk/hQaSDzZ48J+6obMw=
X-Received: by 2002:a67:d28f:: with SMTP id z15mr15382259vsi.44.1634322779550; 
 Fri, 15 Oct 2021 11:32:59 -0700 (PDT)
MIME-Version: 1.0
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
 <20211015041053.2769193-17-richard.henderson@linaro.org>
In-Reply-To: <20211015041053.2769193-17-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 15 Oct 2021 12:32:48 -0600
Message-ID: <CANCZdfrnen=ppeRdJO7xMr18ZWHpaoD1aZp9T46SXdNBU+1Lkw@mail.gmail.com>
Subject: Re: [PATCH v5 16/67] target/arm: Fixup comment re handle_cpu_signal
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000b94d8705ce686cff"
Received-SPF: none client-ip=2607:f8b0:4864:20::92d;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92d.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b94d8705ce686cff
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 14, 2021 at 10:11 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> The named function no longer exists.
> Refer to host_signal_handler instead.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sve_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index dab5f1d1cd..07be55b7e1 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -6118,7 +6118,7 @@ DO_LDN_2(4, dd, MO_64)
>   * linux-user/ in its get_user/put_user macros.
>   *
>   * TODO: Construct some helpers, written in assembly, that interact with
> - * handle_cpu_signal to produce memory ops which can properly report
> errors
> + * host_signal_handler to produce memory ops which can properly report
> errors
>   * without racing.
>   */
>
> --
> 2.25.1
>
>

--000000000000b94d8705ce686cff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 14, 2021 at 10:11 PM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">The named function no longer exists.<br>
Refer to host_signal_handler instead.<br>
<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0target/arm/sve_helper.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br></blockquote><div><b=
r></div><div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp=
.com">imp@bsdimp.com</a>&gt;</div></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c<br>
index dab5f1d1cd..07be55b7e1 100644<br>
--- a/target/arm/sve_helper.c<br>
+++ b/target/arm/sve_helper.c<br>
@@ -6118,7 +6118,7 @@ DO_LDN_2(4, dd, MO_64)<br>
=C2=A0 * linux-user/ in its get_user/put_user macros.<br>
=C2=A0 *<br>
=C2=A0 * TODO: Construct some helpers, written in assembly, that interact w=
ith<br>
- * handle_cpu_signal to produce memory ops which can properly report error=
s<br>
+ * host_signal_handler to produce memory ops which can properly report err=
ors<br>
=C2=A0 * without racing.<br>
=C2=A0 */<br>
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000b94d8705ce686cff--

