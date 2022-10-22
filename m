Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25855608553
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Oct 2022 09:05:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1om8CW-0000FR-JD; Sat, 22 Oct 2022 02:41:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1om8CO-0000BG-BZ
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 02:41:36 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1om8CM-0006ED-Qd
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 02:41:36 -0400
Received: by mail-ed1-x535.google.com with SMTP id w8so11084694edc.1
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 23:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CkxeIRHuUMPIt0Pd5XU8pQ9NTK0HcTQQcdFbuRfsmBE=;
 b=I/ky+7F17fcPWhlW0BltMo6bJAsJEfSyLnhtYg9vEgIXILJrFPLCJjfFB/LGWcj08U
 H5b6nrTxsT8Xqafdh4raGWSIiek0Ng44qTiG1+OkvFqxxWTAHeRmIcwUIFsaaxqJG2jP
 aaDjMMJ4oj3sj6oMIZo2KPa1zI/f5z+2tNWravU0iYFgdSRI3ia8JF6ICII9ZKDnMc52
 jwsxFVq2nbeoYd7P4i3H+9OjAYhNd/y4vKIBOwRPZwzv98GsL34SIxAFxi1vyKvvyFaI
 9enzFvkMnQSgznUeW6Mf050WRgFlq+shiKSB2NP3QAl8Xq3rMoIwCgsWQkB0N8XOf3le
 uAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CkxeIRHuUMPIt0Pd5XU8pQ9NTK0HcTQQcdFbuRfsmBE=;
 b=P9VeTpfjJSKuiabMWIrU0S71oSM6PqTktBiihHmVJH8C/GHIAtptgnlQyee+yDJyT2
 JR50oblyMkOAgarSvx1z/smyQQYrdDcJpkTtp9Ak4hTtldl/idarZ6F1yuAss+OfDv3N
 zr9zhXgDxQF7qUMorxkGV6TyODQHbzChETt1CouWgXQoYAyQpz1hqAlhxvaXhmsi19bn
 GG3ChIBGC1maLHCbiHmyiUy8NdIBwxy5cJ4+9STsmbYJKDtWs7tvgAzDBwhfuYn4bV0C
 OfyDZHGD4Dkciyrh77ye8APxTLKM60FT9kKI+/S9IWeNO/Obds/9ZNPH+y3sB0ye4Ny9
 qkxA==
X-Gm-Message-State: ACrzQf2S71jOepW5TbaigqYKXm4Kie3POSwsRgnUG9oSADEd1Zci6ySg
 f7N5WFMlUP9FmqOh8TGVgMveIdCC3OWJoIwBG7wmKA==
X-Google-Smtp-Source: AMsMyM5LBlL8PDqLLiwrKOXFWV4GFU0YQyCVOQAuLJp7mhN4uot45g3oDPwYZNeXQR5GA+f8WKC2Ud7o5Wpi6rzXQuQ=
X-Received: by 2002:a17:907:7fa5:b0:791:9a5f:101a with SMTP id
 qk37-20020a1709077fa500b007919a5f101amr18763765ejc.453.1666420892215; Fri, 21
 Oct 2022 23:41:32 -0700 (PDT)
MIME-Version: 1.0
References: <fe30a5ce-f318-55f2-165f-b555e19f3160@vivier.eu>
 <20221017202952.60762-1-Jason@zx2c4.com>
 <e24ce881-2f0b-860d-05e5-a9a8a7dda3c8@vivier.eu>
In-Reply-To: <e24ce881-2f0b-860d-05e5-a9a8a7dda3c8@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Date: Sat, 22 Oct 2022 16:41:21 +1000
Message-ID: <CAFXwXrmNpYMBYC8A3kMMW3Jf3oHQurPwErHmrAh2Pjzf0==z_g@mail.gmail.com>
Subject: Re: [PATCH v4] m68k: write bootinfo as rom section and re-randomize
 on reboot
To: Laurent Vivier <laurent@vivier.eu>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: multipart/alternative; boundary="00000000000053c44105eb99d92e"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000053c44105eb99d92e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 22 Oct 2022, 08:33 Laurent Vivier, <laurent@vivier.eu> wrote:

> Le 17/10/2022 =C3=A0 22:29, Jason A. Donenfeld a =C3=A9crit :
>
>
> Notes:
> - don't send your patch as a reply to a previous version
> - add an history:
>
> v4: replace  (void *)(((unsigned long)base + 3) & ~3) by
>               (void *)(((uintptr_t)base + 3) & ~3);
>


QEMU_ALIGN_PTR_UP.


r~

--00000000000053c44105eb99d92e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div data-smartmail=3D"gmail_signature">On Sat, 22 O=
ct 2022, 08:33 Laurent Vivier, &lt;<a href=3D"mailto:laurent@vivier.eu">lau=
rent@vivier.eu</a>&gt; wrote:</div><div class=3D"gmail_quote"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">Le 17/10/2022 =C3=A0 22:29, Jason A. Donenfeld a =C3=A9cr=
it=C2=A0:<br><br>
<br>
Notes:<br>
- don&#39;t send your patch as a reply to a previous version<br>
- add an history:<br>
<br>
v4: replace=C2=A0 (void *)(((unsigned long)base + 3) &amp; ~3) by<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void *)(((uintptr_t)base =
+ 3) &amp; ~3);<br></blockquote></div></div><div dir=3D"auto"><br></div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">QEMU_ALIGN_PTR_UP.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">r~</div><=
/div>

--00000000000053c44105eb99d92e--

