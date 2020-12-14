Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 794D22D9A51
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:53:49 +0100 (CET)
Received: from localhost ([::1]:35152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kopES-0007F6-Ha
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:53:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kopCU-0005wD-6X
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:51:46 -0500
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:40806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kopCS-0001AL-GY
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:51:45 -0500
Received: by mail-lf1-x142.google.com with SMTP id m12so30768883lfo.7
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=liR0GwWTjLEGQkBP4jYyypjhFn/RlU3SaUA00wlcoRI=;
 b=bgw4j6VIcrd3E+62l2+ermCfqzNydXpGE0L8vELLDZp7ITggYKMbcPv6y9xJMHKwtD
 WLrOF6xLAXmWjD1iWAICWNFHMlZusgNOFPBZPTfG3JXRcuFpmTm8HOY3sWw0Nrv95DvJ
 9gM2Kl5LK6gnDLR8nIZlSsSUIaNw9W8f6e6xg3AKJveAX0+WjFex6qIMsI+him9i2PX9
 VuLqhGIT7+XdoPUTdPr5BkdtBc2oXmskkR6NJJSiCxlEAPnUTvLgAYFR+a3LStDYUNtQ
 ioKvkSHZjfih8cwiQLbUzY2RYDLKQ2jLDxhUwkvfMlBUUNEx36vBLh6PEDXyj76JwzKb
 CzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=liR0GwWTjLEGQkBP4jYyypjhFn/RlU3SaUA00wlcoRI=;
 b=Xk7uPxeWH0WP2zf/ESe0xzaLdaTUY/YrcZ4xgZ/xgk1rmYmyq/lmVg307WpQNrt+r9
 V6e5jndG/EqdPzVCqiS97b1Q707+ZeSGMp0Ni/ZSiamxdZEV383TnK6NQayUmdF7GkQe
 Yb1jhxShcDTcXPe6aICjASvmwG7P/W5y6+jDZDah1OnTG1vd2GSOwfgCbMsHZUn+moSU
 5nkFRWfqgVoD9hpS53fT2DqZrD+AodU4MzpORaZSGn/XM5zk6jnupueEefn7uDQ9Qqfm
 GFQZZHVJ+/8oCUu4QNiklLzArelaWRw38SWavvNiYWhZYCFq6bzSxRQZ4yN4Qy46Jy/O
 tJwg==
X-Gm-Message-State: AOAM533K4Lx3m7XQlJHeH9aZSLfWZrqPfyroJ/FK/RqAznelf8yEtanr
 UuGInfcaI7METI7N1aUa9B+1z7hxcYDL6vDzMro=
X-Google-Smtp-Source: ABdhPJy67jUv8WUyUMQp7LZGGbfiWazNIX0jvnGU5q3Em0Sb7RRXZkOEM7oumTiy//eos97Y6c88THXm201bWEmsZd0=
X-Received: by 2002:a19:6547:: with SMTP id c7mr5479171lfj.14.1607957501878;
 Mon, 14 Dec 2020 06:51:41 -0800 (PST)
MIME-Version: 1.0
References: <20201206233949.3783184-1-f4bug@amsat.org>
 <20201206233949.3783184-12-f4bug@amsat.org>
 <ac8afc12-2ab4-a2a3-81b5-b9d75314bf6f@linaro.org>
In-Reply-To: <ac8afc12-2ab4-a2a3-81b5-b9d75314bf6f@linaro.org>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Mon, 14 Dec 2020 22:51:30 +0800
Message-ID: <CAE2XoE_WzMzCbvxtPdQfbU2rs-wd26GXpds9VypW7B-ik7qWJA@mail.gmail.com>
Subject: Re: [PATCH 11/19] target/mips: Extract common helpers from helper.c
 to common_helper.c
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000b6a74105b66dc7fa"
Received-SPF: pass client-ip=2a00:1450:4864:20::142;
 envelope-from=luoyonggang@gmail.com; helo=mail-lf1-x142.google.com
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
Reply-To: luoyonggang@gmail.com
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-level <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b6a74105b66dc7fa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 9, 2020 at 6:09 AM Richard Henderson <
richard.henderson@linaro.org> wrote:
>
> On 12/6/20 5:39 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > The rest of helper.c is TLB related. Extract the non TLB
> > specific functions to a new file, so we can rename helper.c
> > as tlb_helper.c in the next commit.
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > ---
> > Any better name? xxx_helper.c are usually TCG helpers.
>
> *shrug* perhaps cpu_common.c, no "helper" at all?
> Perhaps just move these bits to cpu.c?
>
>
> r~
>
Does these are general cpu bits or misp_cpu bits?
if only misp cpu related, prefer misp_cpu.c
or cpu.c under misp folder.

--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--000000000000b6a74105b66dc7fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Wed, Dec 9, 2020 at 6:09 AM Richard Henderson &=
lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.henderson@linaro=
.org</a>&gt; wrote:<br>&gt;<br>&gt; On 12/6/20 5:39 PM, Philippe Mathieu-Da=
ud=C3=A9 wrote:<br>&gt; &gt; The rest of helper.c is TLB related. Extract t=
he non TLB<br>&gt; &gt; specific functions to a new file, so we can rename =
helper.c<br>&gt; &gt; as tlb_helper.c in the next commit.<br>&gt; &gt;<br>&=
gt; &gt; Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f=
4bug@amsat.org">f4bug@amsat.org</a>&gt;<br>&gt; &gt; ---<br>&gt; &gt; Any b=
etter name? xxx_helper.c are usually TCG helpers.<br>&gt;<br>&gt; *shrug* p=
erhaps cpu_common.c, no &quot;helper&quot; at all?<br>&gt; Perhaps just mov=
e these bits to cpu.c?<br>&gt;<br>&gt;<br>&gt; r~<br>&gt;<br>Does these are=
 general cpu bits or misp_cpu bits?<div>if only misp cpu related, prefer mi=
sp_cpu.c</div><div>or cpu.c under misp folder.<br><br>--<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=
=E5=88=9A<br>Yours<br>=C2=A0 =C2=A0 sincerely,<br>Yonggang Luo</div></div>

--000000000000b6a74105b66dc7fa--

