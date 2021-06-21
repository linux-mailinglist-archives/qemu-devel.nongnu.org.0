Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 186863AE2D6
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 07:42:38 +0200 (CEST)
Received: from localhost ([::1]:60780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvChh-0002FI-65
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 01:42:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1lvCfd-0000CQ-Ga
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 01:40:29 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:44741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1lvCfb-0008UD-6O
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 01:40:29 -0400
Received: by mail-qt1-x834.google.com with SMTP id d9so12557161qtp.11
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 22:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H18no8rwOwep5EM/qCes24/Dr5M502fsac8OlvlWGP4=;
 b=AdPX2mZzG5YgA/+bovdEiMEIanl4/urm9lcaafchrztIjxj4vyQjO1gtrLFoO0B8tQ
 12IwSWr0yp5KywgfgGbPmbH0K1HBiMQxtJDV5IY+Yogg/4Vj3WthKi+xE46r0ABOStDP
 KFyOlAZqt4MVfcYvj7aur3htCl1jIMCoG2m0eRlI5YxyE1xpI/wObuozwr22Xlr3wTjb
 TVlEv1DLthPsnCOSwlK8gExVphqKexRg2P+JeIThEILFKUt6t5dxH0KZW8Xya780QfBw
 Lud0jF2oXiNNC2+Ew+2oq+VXJ0s7mV00V0sPcb+iqf/6etWjU5CG+dY13LG6uT5LFeOr
 8riw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H18no8rwOwep5EM/qCes24/Dr5M502fsac8OlvlWGP4=;
 b=MB+ocoukg7yMZsFnA4vKBeKOFd7Lmu1VZwGJMe64nrypIInoaRWcSk0d+Z8Lh5/2A3
 0PG95e+3UEDeWsrzOHqvdD75QF2X17PfN1GjQVXpPe2EW9KgyY2ffIbCnlmPuKeY5Qyh
 itiukWjPBnhj49t0JbaYMasX1hxmgxKBTwP60CRXuXVKagQEDZTWQjy6UmQGNegFFsL8
 4gb9XgRthAdGCBhGB+u5IfKxBfmoQAZTLxhDVtqT5laPV15Mm+JJJudadqtTQDPIi1rY
 ofjwTG623MX2xVMyidTMoCUP4A9gcRUYIsZ/y/DrlSrSM4pJKRUzQEa0lES7NaDIkkAz
 idbQ==
X-Gm-Message-State: AOAM530nvXxj7vXpxRiVvNgTa9175LJG6grotiECSciTWW7YJ5FRr92E
 W1/1/z9n94AHLV+g2SA11QKeA2KlEyk15lFHDRY=
X-Google-Smtp-Source: ABdhPJzBfFor5bklWvGtWrLq6zVj3a+tGq5xVNRJHqJp6U7ai2CDdpljxnGGhYXacLc9XgKJoghg5hs6g+LuGxId38c=
X-Received: by 2002:ac8:6b42:: with SMTP id x2mr22480662qts.382.1624254026242; 
 Sun, 20 Jun 2021 22:40:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210621013439.1791385-1-richard.henderson@linaro.org>
 <20210621013439.1791385-8-richard.henderson@linaro.org>
In-Reply-To: <20210621013439.1791385-8-richard.henderson@linaro.org>
From: Michael Rolnik <mrolnik@gmail.com>
Date: Mon, 21 Jun 2021 08:39:50 +0300
Message-ID: <CAK4993hWnOK1t2=cPsYLFYMv-MpeLMJOEafz-qCWK4u33jdo6Q@mail.gmail.com>
Subject: Re: [PATCH 07/26] target/avr: Mark some helpers noreturn
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000425d8f05c5401cf3"
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=mrolnik@gmail.com; helo=mail-qt1-x834.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000425d8f05c5401cf3
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Michael Rolnik <mrolnik@gmail.com>


On Mon, Jun 21, 2021 at 4:34 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> All of these helpers end with cpu_loop_exit.
>
> Cc: Michael Rolnik <mrolnik@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/avr/helper.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/target/avr/helper.h b/target/avr/helper.h
> index 8e1ae7fda0..4d02e648fa 100644
> --- a/target/avr/helper.h
> +++ b/target/avr/helper.h
> @@ -19,10 +19,10 @@
>   */
>
>  DEF_HELPER_1(wdr, void, env)
> -DEF_HELPER_1(debug, void, env)
> -DEF_HELPER_1(break, void, env)
> -DEF_HELPER_1(sleep, void, env)
> -DEF_HELPER_1(unsupported, void, env)
> +DEF_HELPER_1(debug, noreturn, env)
> +DEF_HELPER_1(break, noreturn, env)
> +DEF_HELPER_1(sleep, noreturn, env)
> +DEF_HELPER_1(unsupported, noreturn, env)
>  DEF_HELPER_3(outb, void, env, i32, i32)
>  DEF_HELPER_2(inb, tl, env, i32)
>  DEF_HELPER_3(fullwr, void, env, i32, i32)
> --
> 2.25.1
>
>

-- 
Best Regards,
Michael Rolnik

--000000000000425d8f05c5401cf3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Michael Rolnik &lt;<a href=3D"mailto:mrolnik@=
gmail.com">mrolnik@gmail.com</a>&gt;<div><br></div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 21, 2021 at =
4:34 AM Richard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.or=
g">richard.henderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">All of these helpers end with cpu_loop_exi=
t.<br>
<br>
Cc: Michael Rolnik &lt;<a href=3D"mailto:mrolnik@gmail.com" target=3D"_blan=
k">mrolnik@gmail.com</a>&gt;<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0target/avr/helper.h | 8 ++++----<br>
=C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/target/avr/helper.h b/target/avr/helper.h<br>
index 8e1ae7fda0..4d02e648fa 100644<br>
--- a/target/avr/helper.h<br>
+++ b/target/avr/helper.h<br>
@@ -19,10 +19,10 @@<br>
=C2=A0 */<br>
<br>
=C2=A0DEF_HELPER_1(wdr, void, env)<br>
-DEF_HELPER_1(debug, void, env)<br>
-DEF_HELPER_1(break, void, env)<br>
-DEF_HELPER_1(sleep, void, env)<br>
-DEF_HELPER_1(unsupported, void, env)<br>
+DEF_HELPER_1(debug, noreturn, env)<br>
+DEF_HELPER_1(break, noreturn, env)<br>
+DEF_HELPER_1(sleep, noreturn, env)<br>
+DEF_HELPER_1(unsupported, noreturn, env)<br>
=C2=A0DEF_HELPER_3(outb, void, env, i32, i32)<br>
=C2=A0DEF_HELPER_2(inb, tl, env, i32)<br>
=C2=A0DEF_HELPER_3(fullwr, void, env, i32, i32)<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Best Regards,<br>Michael Rolnik</div>

--000000000000425d8f05c5401cf3--

