Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1082ECDCF
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 11:30:38 +0100 (CET)
Received: from localhost ([::1]:39312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxSYu-0003VQ-Kt
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 05:30:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kxSVc-0000Z1-1F
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 05:27:12 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:33708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kxSVY-0008OY-7U
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 05:27:11 -0500
Received: by mail-ej1-x630.google.com with SMTP id b9so9078588ejy.0
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 02:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L3iXYKlu4lJ9piR6xjfS0rUfzziVWMoSAJpCt79rtFE=;
 b=POSNpIK1bQFxipcOiqe9qXkYg4GTgfRnf2zV0/QxqGJc6bA/8IJ99eJuTlZ4mdiPau
 f4Kx4wyI+q3xnMW8bJDnCt7ibcts+qmC5BDtmg9d6cwNGnesFKotkj9h2Ihbn9B9eJgD
 Uc9ijH0MfyU6VSpD3CoyBqFY3Iy0eMLqt92efgImf3F4uQHQBda3LyUWN/pSvz1i7VJ3
 9OnWEB47lFvGnLOu36lGDrtKcU2sM952I8he4dtAGH1VoC7qYNOS7zR47pqK31kFmVc0
 183eAQX4vSWKvfbDA96mdTFepf8N+IIBJXSAjSGuPTajNOYGV6ncwfSqTwAEOE6HLNeK
 m68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L3iXYKlu4lJ9piR6xjfS0rUfzziVWMoSAJpCt79rtFE=;
 b=kDA6ETdxGp0pIMgj4y84IGpEuW0pP5fpbgips5zbENd/d1RC99MGhBP1fh59evXqQG
 yqpx3L2on7i72ryzJajn5Az/rQexI0uY9ps9pgAQ+LHrg0T5CCTBFY9q9ZP/ty6r3qim
 m9/0TRgR1mmWTiyZwv6Z5IfEC12NNG3a9Y2vwoj9i1332yG1U10MC7fC0RVMZJ6fHWdK
 PzSoxInSY953HilFx8n+LGLvyCJig1KWmoYGl1TH8EXA35NpofASglFtTJ4xw4AbdlCt
 xRLWKzxpJTkRLubwNFxgyxUn4klwjz6F+6naJ6kDa80oCnFFATXB8VH0/+bQKPII98KG
 /JQw==
X-Gm-Message-State: AOAM531rMiGu8F41zbqInlK7Dwq1sM5tD0SFG8GOSHvC8gj2bpOXgtDI
 GkiL+sz+V3jw3TXiRN+qL55nO0unTy7V5QcMuiA=
X-Google-Smtp-Source: ABdhPJz0X3RPOiGNB0EPF+EJHptJ1jTOw3Fu7iF02/T98VTpCpuc3azBHx/9JbFW0vzoY7ODoqhD3ZXS947oqhwpu28=
X-Received: by 2002:a17:906:98d4:: with SMTP id
 zd20mr5757427ejb.532.1610015226449; 
 Thu, 07 Jan 2021 02:27:06 -0800 (PST)
MIME-Version: 1.0
References: <20210107101919.80-1-luoyonggang@gmail.com>
 <20210107101919.80-5-luoyonggang@gmail.com>
In-Reply-To: <20210107101919.80-5-luoyonggang@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 7 Jan 2021 14:26:54 +0400
Message-ID: <CAJ+F1CKNhvp4pgW6Vsqq0nzm_61zPRD2OaECgiFWb0-uHeUp4w@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] whpx: Fixes include of whp-dispatch.h in whpx.h
To: Yonggang Luo <luoyonggang@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000a7d62805b84ce160"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x630.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Ed Maste <emaste@freebsd.org>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a7d62805b84ce160
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Jan 7, 2021 at 2:23 PM Yonggang Luo <luoyonggang@gmail.com> wrote:

> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  include/sysemu/whpx.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/sysemu/whpx.h b/include/sysemu/whpx.h
> index 9346fd92e9..4f38784d7e 100644
> --- a/include/sysemu/whpx.h
> +++ b/include/sysemu/whpx.h
> @@ -15,7 +15,7 @@
>
>  #ifdef CONFIG_WHPX
>
> -#include "whp-dispatch.h"
> +#include <WinHvPlatformDefs.h>
>
>  struct whpx_state {
>      uint64_t mem_quota;
> --
> 2.29.2.windows.3
>

I submitted a similar patch, then Paolo did a different approach which
didn't land yet:
https://patchew.org/QEMU/20201219090637.1700900-1-pbonzini@redhat.com/


--=20
Marc-Andr=C3=A9 Lureau

--000000000000a7d62805b84ce160
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 7, 2021 at 2:23 PM Yong=
gang Luo &lt;<a href=3D"mailto:luoyonggang@gmail.com">luoyonggang@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Signed-off-by: Yonggang Luo &lt;<a href=3D"mailto:luoyonggang@gmail.com" ta=
rget=3D"_blank">luoyonggang@gmail.com</a>&gt;<br>
---<br>
=C2=A0include/sysemu/whpx.h | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/include/sysemu/whpx.h b/include/sysemu/whpx.h<br>
index 9346fd92e9..4f38784d7e 100644<br>
--- a/include/sysemu/whpx.h<br>
+++ b/include/sysemu/whpx.h<br>
@@ -15,7 +15,7 @@<br>
<br>
=C2=A0#ifdef CONFIG_WHPX<br>
<br>
-#include &quot;whp-dispatch.h&quot;<br>
+#include &lt;WinHvPlatformDefs.h&gt;<br>
<br>
=C2=A0struct whpx_state {<br>
=C2=A0 =C2=A0 =C2=A0uint64_t mem_quota;<br>
-- <br>
2.29.2.windows.3<br></blockquote><div><br></div><div>I submitted a similar =
patch, then Paolo did a different approach which didn&#39;t land yet:</div>=
<div><a href=3D"https://patchew.org/QEMU/20201219090637.1700900-1-pbonzini@=
redhat.com/">https://patchew.org/QEMU/20201219090637.1700900-1-pbonzini@red=
hat.com/</a> </div></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" clas=
s=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000a7d62805b84ce160--

