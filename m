Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44606302602
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 15:07:51 +0100 (CET)
Received: from localhost ([::1]:46586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l42X0-0005xQ-8k
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 09:07:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@crypt.co.nz>) id 1l42TU-0004s3-IV
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 09:04:12 -0500
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:36403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter@crypt.co.nz>) id 1l42TN-00088k-5e
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 09:04:08 -0500
Received: by mail-oi1-x233.google.com with SMTP id d18so5511252oic.3
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 06:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crypt.nz; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=5bGMOtO3DCDaqHgiQazNRak39S5mHeDGRVBJgZ9/mCw=;
 b=F6m9GIdkvFYlkF8vsdpkM9M5IjHkUpXnFb0H2z5bbr52dJDd40Y6BP5h/T7FzZnL4x
 iAvCfzjkdo+3Hqp3XHQsg20+fOA19a4O/1F9iC4CAFcaJDKvPbRDSXL1CZwrXFShOoHA
 PAvb8XJSBtVHWz31F7buzidQywPyqKtZ1AnEekFOGW9GMfc6LMByZ0jhivpx8P9W7EbU
 TqohhHlcW1GfvXMJovz3B691Pst421KbtfMI+EOyVQzvNjvYpN65/X+3IQ4n3UoVoRjM
 QhML7rAOLyG8B3maKGMif73kln0//G5mBtgAt89VSP6sZFaD+sTxp36Q0KJI/ZrBYBgi
 4wJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=5bGMOtO3DCDaqHgiQazNRak39S5mHeDGRVBJgZ9/mCw=;
 b=hTP9l40yDGbh+/hom8oyHaD6uI41ywTyVK5HwT26ajtvzSPHL6Ca1bpIwSNGA8N84l
 G/Q8Mjg7i+Fiih9kV6HQTXN5gI79Cd9N7+A/ApgxvWRGQ50DGMaX3+Baz9iEL2kATQwh
 zTnoybvcLXTAgiyjttzwGYD50vWAn8WIB26EQP6VauG0iUEi9CMDhvpgNp5cksHEsC/5
 JrZbG+x90IzyyXsHOca/64E9zdBHWmjMACVkToXGvH5t72gawEFxuyfoz8DMBJYOlAKE
 91ympdgzkgJ6e+c3afj66OKYI+UilcNkKU/jEjjp/9puMh9hl1siuafUpamijlshYhi8
 8+VA==
X-Gm-Message-State: AOAM5310lNJMeVRWM3MDR4pRINm1jVnjDtYSP6hLDgHy4Erg/T6PEAl0
 6MuR5T+3E5ojbg8C0wPwaVmUEDBjFUWrqjvyalYBR8Fny/niAQ==
X-Google-Smtp-Source: ABdhPJzCBC2pe0GrqAKptO1+EYnH7iJId1JRyuARRTLp36jad98bSbMiVWt+alikyukwVvC6PeRYGgiewZEdotFydSg=
X-Received: by 2002:a05:6808:4d7:: with SMTP id
 a23mr207756oie.38.1611583440500; 
 Mon, 25 Jan 2021 06:04:00 -0800 (PST)
MIME-Version: 1.0
From: Peter Lambrechtsen <peter@crypt.nz>
Date: Tue, 26 Jan 2021 03:03:49 +1300
Message-ID: <CACJd5cHt_oweFmv0wGJoBPb67sTe6=aYEes4oBwQp85QrV3h+A@mail.gmail.com>
Subject: MIPS support for PIC32 and GPIOs
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000007f497e05b9ba0217"
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=peter@crypt.co.nz; helo=mail-oi1-x233.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000007f497e05b9ba0217
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

I am using this fork of qemu that has pic32 support in it.

https://github.com/sergev/qemu/

When I boot a firmware image I get these errors as I don=E2=80=99t think th=
e gpios
have been defined.

/usr/local/qemu-mips/bin/qemu-system-mipsel -machine pic32mx7-max32
-nographic -serial file:serial1.log -serial file:serial2.log -bios boot.hex
-kernel pfm.hex
QEMU 2.3.50 monitor - type 'help' for more information
(qemu) Board: chipKIT Max32
Processor: M4K
RAM size: 128 kbytes
Load file: 'boot.hex', 2344 bytes
Load file: 'pfm.hex', 287440 bytes
--- Read 1f800810: peripheral register not supported
--- Write 00000001 to 1f800008: peripheral register not supported
--- Write 00000001 to ???: readonly register
--- Read 1f800600: peripheral register not supported
--- Write 00000030 to 1f800600: peripheral register not supported
--- Write 00000030 to ???: readonly register
--- Write 0000ffff to 1f800620: peripheral register not supported
--- Write 0000ffff to ???: readonly register
--- Write 00000000 to 1f800610: peripheral register not supported
--- Write 00000000 to ???: readonly register
--- Read 1f800c00: peripheral register not supported
--- Write 00000070 to 1f800c00: peripheral register not supported
--- Write 00000070 to ???: readonly register
--- Write 0000003f to 1f800c20: peripheral register not supported
--- Write 0000003f to ???: readonly register
--- Write 00000000 to 1f800c10: peripheral register not supported
--- Write 00000000 to ???: readonly register
--- Read 1f800600: peripheral register not supported
--- Write 00008000 to 1f800600: peripheral register not supported
--- Write 00008000 to ???: readonly register
--- Read 1f800c00: peripheral register not supported
--- Write 00008000 to 1f800c00: peripheral register not supported
--- Write 00008000 to ???: readonly register
--- Write 00000000 to 1f800800: peripheral register not supported
--- Write 00000000 to ???: readonly register
--- Write 00000000 to 1f800810: peripheral register not supported
--- Write 00000000 to ???: readonly register
--- Write 00000000 to 1f800a10: peripheral register not supported
--- Write 00000000 to ???: readonly register
--- Write 0000ffff to 1f800a20: peripheral register not supported
--- Write 0000ffff to ???: readonly register
--- Write 00000078 to 1f800800: peripheral register not supported
--- Write 00000078 to ???: readonly register
--- Write 00000000 to 1f800810: peripheral register not supported
--- Write 00000000 to ???: readonly register
--- Write ffffffff to 1f800820: peripheral register not supported
--- Write ffffffff to ???: readonly register
--- Write 00008000 to 1f800808: peripheral register not supported
--- Write 00008000 to ???: readonly register
--- Read 1f800810: peripheral register not supported
--- Write 1d07e000 to 1f80f420: peripheral register not supported
--- Write 1d07e000 to ???: readonly register
--- Write 00004004 to 1f80f400: peripheral register not supported
--- Write 00004004 to ???: readonly register
--- Write aa996655 to 1f80f410: peripheral register not supported
--- Write aa996655 to ???: readonly register
--- Write 556699aa to 1f80f410: peripheral register not supported
--- Write 556699aa to ???: readonly register
--- Write 00008000 to 1f80f408: peripheral register not supported
--- Write 00008000 to ???: readonly register
--- Read 1f80f400: peripheral register not supported
--- Write 00004000 to 1f80f404: peripheral register not supported
--- Write 00004000 to ???: readonly register
--- Read 1f80f400: peripheral register not supported
--- Write 1d07e000 to 1f80f420: peripheral register not supported
--- Write 1d07e000 to ???: readonly register
--- Write 0000c608 to 1f80f440: peripheral register not supported
--- Write 0000c608 to ???: readonly register
--- Write 00004003 to 1f80f400: peripheral register not supported
--- Write 00004003 to ???: readonly register
--- Write aa996655 to 1f80f410: peripheral register not supported
--- Write aa996655 to ???: readonly register
--- Write 556699aa to 1f80f410: peripheral register not supported
--- Write 556699aa to ???: readonly register
--- Write 00008000 to 1f80f408: peripheral register not supported
--- Write 00008000 to ???: readonly register
--- Read 1f80f400: peripheral register not supported
--- Write 00004000 to 1f80f404: peripheral register not supported
--- Write 00004000 to ???: readonly register
--- Read 1f80f400: peripheral register not supported
--- Write 1d07e200 to 1f80f420: peripheral register not supported
--- Write 1d07e200 to ???: readonly register
--- Write 0000c808 to 1f80f440: peripheral register not supported
--- Write 0000c808 to ???: readonly register
--- Write 00004003 to 1f80f400: peripheral register not supported
--- Write 00004003 to ???: readonly register
--- Write aa996655 to 1f80f410: peripheral register not supported
--- Write aa996655 to ???: readonly register
--- Write 556699aa to 1f80f410: peripheral register not supported
--- Write 556699aa to ???: readonly register
--- Write 00008000 to 1f80f408: peripheral register not supported
--- Write 00008000 to ???: readonly register
--- Read 1f80f400: peripheral register not supported
--- Write 00004000 to 1f80f404: peripheral register not supported
--- Write 00004000 to ???: readonly register
--- Read 1f80f400: peripheral register not supported
--- Write 1d07e400 to 1f80f420: peripheral register not supported
--- Write 1d07e400 to ???: readonly register
--- Write 0000ca08 to 1f80f440: peripheral register not supported
--- Write 0000ca08 to ???: readonly register
--- Write 00004003 to 1f80f400: peripheral register not supported
--- Write 00004003 to ???: readonly register
--- Write aa996655 to 1f80f410: peripheral register not supported
--- Write aa996655 to ???: readonly register
--- Write 556699aa to 1f80f410: peripheral register not supported
--- Write 556699aa to ???: readonly register
--- Write 00008000 to 1f80f408: peripheral register not supported
--- Write 00008000 to ???: readonly register
--- Read 1f80f400: peripheral register not supported
--- Write 00004000 to 1f80f404: peripheral register not supported
--- Write 00004000 to ???: readonly register
--- Read 1f80f400: peripheral register not supported
--- Write 1d07e600 to 1f80f420: peripheral register not supported
--- Write 1d07e600 to ???: readonly register
--- Write 0000cc08 to 1f80f440: peripheral register not supported
--- Write 0000cc08 to ???: readonly register
--- Write 00004003 to 1f80f400: peripheral register not supported
--- Write 00004003 to ???: readonly register
--- Write aa996655 to 1f80f410: peripheral register not supported
--- Write aa996655 to ???: readonly register
--- Write 556699aa to 1f80f410: peripheral register not supported
--- Write 556699aa to ???: readonly register
--- Write 00008000 to 1f80f408: peripheral register not supported
--- Write 00008000 to ???: readonly register
--- Read 1f80f400: peripheral register not supported
--- Write 00004000 to 1f80f404: peripheral register not supported
--- Write 00004000 to ???: readonly register
--- Read 1f80f400: peripheral register not supported
--- Write 1d07e800 to 1f80f420: peripheral register not supported
--- Write 1d07e800 to ???: readonly register
--- Write 0000ce08 to 1f80f440: peripheral register not supported
--- Write 0000ce08 to ???: readonly register
--- Write 00004003 to 1f80f400: peripheral register not supported
--- Write 00004003 to ???: readonly register
--- Write aa996655 to 1f80f410: peripheral register not supported
--- Write aa996655 to ???: readonly register
--- Write 556699aa to 1f80f410: peripheral register not supported
--- Write 556699aa to ???: readonly register
--- Write 00008000 to 1f80f408: peripheral register not supported
--- Write 00008000 to ???: readonly register
--- Read 1f80f400: peripheral register not supported
--- Write 00004000 to 1f80f404: peripheral register not supported
--- Write 00004000 to ???: readonly register
--- Read 1f80f400: peripheral register not supported
--- Write 1d07ea00 to 1f80f420: peripheral register not supported
--- Write 1d07ea00 to ???: readonly register
--- Write 0000d008 to 1f80f440: peripheral register not supported
--- Write 0000d008 to ???: readonly register
--- Write 00004003 to 1f80f400: peripheral register not supported
--- Write 00004003 to ???: readonly register
--- Write aa996655 to 1f80f410: peripheral register not supported
--- Write aa996655 to ???: readonly register
--- Write 556699aa to 1f80f410: peripheral register not supported
--- Write 556699aa to ???: readonly register
--- Write 00008000 to 1f80f408: peripheral register not supported
--- Write 00008000 to ???: readonly register
--- Read 1f80f400: peripheral register not supported
--- Write 00004000 to 1f80f404: peripheral register not supported
--- Write 00004000 to ???: readonly register
--- Read 1f80f400: peripheral register not supported
--- Write 1d07ec00 to 1f80f420: peripheral register not supported
--- Write 1d07ec00 to ???: readonly register
--- Write 0000d208 to 1f80f440: peripheral register not supported
--- Write 0000d208 to ???: readonly register
--- Write 00004003 to 1f80f400: peripheral register not supported
--- Write 00004003 to ???: readonly register
--- Write aa996655 to 1f80f410: peripheral register not supported
--- Write aa996655 to ???: readonly register
--- Write 556699aa to 1f80f410: peripheral register not supported
--- Write 556699aa to ???: readonly register
--- Write 00008000 to 1f80f408: peripheral register not supported
--- Write 00008000 to ???: readonly register
--- Read 1f80f400: peripheral register not supported
--- Write 00004000 to 1f80f404: peripheral register not supported
--- Write 00004000 to ???: readonly register
--- Read 1f80f400: peripheral register not supported
--- Write 1d07ee00 to 1f80f420: peripheral register not supported
--- Write 1d07ee00 to ???: readonly register
--- Write 0000d408 to 1f80f440: peripheral register not supported
--- Write 0000d408 to ???: readonly register
--- Write 00004003 to 1f80f400: peripheral register not supported
--- Write 00004003 to ???: readonly register
--- Write aa996655 to 1f80f410: peripheral register not supported
--- Write aa996655 to ???: readonly register
--- Write 556699aa to 1f80f410: peripheral register not supported
--- Write 556699aa to ???: readonly register
--- Write 00008000 to 1f80f408: peripheral register not supported
--- Write 00008000 to ???: readonly register
--- Read 1f80f400: peripheral register not supported
--- Write 00004000 to 1f80f404: peripheral register not supported
--- Write 00004000 to ???: readonly register
--- Read 1f80f400: peripheral register not supported
--- Read 1f800810: peripheral register not supported

I think I need to add a new case at this point to stub the gpios
https://github.com/sergev/qemu/blob/a2e0277dfe4b399a074f2124c0326be31b34a6e=
8/hw/mips/mips_pic32mx7.c#L833


But have never had any experience with how qemu works or building up
objects.

Is there any pointers that could help me along this journey?

Cheers Peter

--0000000000007f497e05b9ba0217
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi<div dir=3D"auto"><br></div><div dir=3D"auto">I am using this fork of qem=
u that has pic32 support in it.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><div><a href=3D"https://github.com/sergev/qemu/">https://github.c=
om/sergev/qemu/</a></div><br></div><div dir=3D"auto">When I boot a firmware=
 image I get these errors as I don=E2=80=99t think the gpios have been defi=
ned.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div dir=3D"a=
uto" style=3D"border-color:rgb(255,255,255)">/usr/local/qemu-mips/bin/qemu-=
system-mipsel -machine pic32mx7-max32 -nographic -serial file:serial1.log -=
serial file:serial2.log -bios boot.hex -kernel pfm.hex</div><div dir=3D"aut=
o" style=3D"border-color:rgb(255,255,255)">QEMU 2.3.50 monitor - type &#39;=
help&#39; for more information</div><div dir=3D"auto" style=3D"border-color=
:rgb(255,255,255)">(qemu) Board: chipKIT Max32</div><div dir=3D"auto" style=
=3D"border-color:rgb(255,255,255)">Processor: M4K</div><div dir=3D"auto" st=
yle=3D"border-color:rgb(255,255,255)">RAM size: 128 kbytes</div><div dir=3D=
"auto" style=3D"border-color:rgb(255,255,255)">Load file: &#39;boot.hex&#39=
;, 2344 bytes</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)=
">Load file: &#39;pfm.hex&#39;, 287440 bytes</div><div dir=3D"auto" style=
=3D"border-color:rgb(255,255,255)">--- Read 1f800810: peripheral register n=
ot supported</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)"=
>--- Write 00000001 to 1f800008: peripheral register not supported</div><di=
v dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Write 00000001 t=
o ???: readonly register</div><div dir=3D"auto" style=3D"border-color:rgb(2=
55,255,255)">--- Read 1f800600: peripheral register not supported</div><div=
 dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Write 00000030 to=
 1f800600: peripheral register not supported</div><div dir=3D"auto" style=
=3D"border-color:rgb(255,255,255)">--- Write 00000030 to ???: readonly regi=
ster</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Wri=
te 0000ffff to 1f800620: peripheral register not supported</div><div dir=3D=
"auto" style=3D"border-color:rgb(255,255,255)">--- Write 0000ffff to ???: r=
eadonly register</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,2=
55)">--- Write 00000000 to 1f800610: peripheral register not supported</div=
><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Write 000000=
00 to ???: readonly register</div><div dir=3D"auto" style=3D"border-color:r=
gb(255,255,255)">--- Read 1f800c00: peripheral register not supported</div>=
<div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Write 0000007=
0 to 1f800c00: peripheral register not supported</div><div dir=3D"auto" sty=
le=3D"border-color:rgb(255,255,255)">--- Write 00000070 to ???: readonly re=
gister</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- W=
rite 0000003f to 1f800c20: peripheral register not supported</div><div dir=
=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Write 0000003f to ???=
: readonly register</div><div dir=3D"auto" style=3D"border-color:rgb(255,25=
5,255)">--- Write 00000000 to 1f800c10: peripheral register not supported</=
div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Write 000=
00000 to ???: readonly register</div><div dir=3D"auto" style=3D"border-colo=
r:rgb(255,255,255)">--- Read 1f800600: peripheral register not supported</d=
iv><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Write 0000=
8000 to 1f800600: peripheral register not supported</div><div dir=3D"auto" =
style=3D"border-color:rgb(255,255,255)">--- Write 00008000 to ???: readonly=
 register</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--=
- Read 1f800c00: peripheral register not supported</div><div dir=3D"auto" s=
tyle=3D"border-color:rgb(255,255,255)">--- Write 00008000 to 1f800c00: peri=
pheral register not supported</div><div dir=3D"auto" style=3D"border-color:=
rgb(255,255,255)">--- Write 00008000 to ???: readonly register</div><div di=
r=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Write 00000000 to 1f=
800800: peripheral register not supported</div><div dir=3D"auto" style=3D"b=
order-color:rgb(255,255,255)">--- Write 00000000 to ???: readonly register<=
/div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Write 00=
000000 to 1f800810: peripheral register not supported</div><div dir=3D"auto=
" style=3D"border-color:rgb(255,255,255)">--- Write 00000000 to ???: readon=
ly register</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">=
--- Write 00000000 to 1f800a10: peripheral register not supported</div><div=
 dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Write 00000000 to=
 ???: readonly register</div><div dir=3D"auto" style=3D"border-color:rgb(25=
5,255,255)">--- Write 0000ffff to 1f800a20: peripheral register not support=
ed</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Write=
 0000ffff to ???: readonly register</div><div dir=3D"auto" style=3D"border-=
color:rgb(255,255,255)">--- Write 00000078 to 1f800800: peripheral register=
 not supported</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255=
)">--- Write 00000078 to ???: readonly register</div><div dir=3D"auto" styl=
e=3D"border-color:rgb(255,255,255)">--- Write 00000000 to 1f800810: periphe=
ral register not supported</div><div dir=3D"auto" style=3D"border-color:rgb=
(255,255,255)">--- Write 00000000 to ???: readonly register</div><div dir=
=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Write ffffffff to 1f8=
00820: peripheral register not supported</div><div dir=3D"auto" style=3D"bo=
rder-color:rgb(255,255,255)">--- Write ffffffff to ???: readonly register</=
div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Write 000=
08000 to 1f800808: peripheral register not supported</div><div dir=3D"auto"=
 style=3D"border-color:rgb(255,255,255)">--- Write 00008000 to ???: readonl=
y register</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">-=
-- Read 1f800810: peripheral register not supported</div><div dir=3D"auto" =
style=3D"border-color:rgb(255,255,255)">--- Write 1d07e000 to 1f80f420: per=
ipheral register not supported</div><div dir=3D"auto" style=3D"border-color=
:rgb(255,255,255)">--- Write 1d07e000 to ???: readonly register</div><div d=
ir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Write 00004004 to 1=
f80f400: peripheral register not supported</div><div dir=3D"auto" style=3D"=
border-color:rgb(255,255,255)">--- Write 00004004 to ???: readonly register=
</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Write a=
a996655 to 1f80f410: peripheral register not supported</div><div dir=3D"aut=
o" style=3D"border-color:rgb(255,255,255)">--- Write aa996655 to ???: reado=
nly register</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)"=
>--- Write 556699aa to 1f80f410: peripheral register not supported</div><di=
v dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Write 556699aa t=
o ???: readonly register</div><div dir=3D"auto" style=3D"border-color:rgb(2=
55,255,255)">--- Write 00008000 to 1f80f408: peripheral register not suppor=
ted</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Writ=
e 00008000 to ???: readonly register</div><div dir=3D"auto" style=3D"border=
-color:rgb(255,255,255)">--- Read 1f80f400: peripheral register not support=
ed</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Write=
 00004000 to 1f80f404: peripheral register not supported</div><div dir=3D"a=
uto" style=3D"border-color:rgb(255,255,255)">--- Write 00004000 to ???: rea=
donly register</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255=
)">--- Read 1f80f400: peripheral register not supported</div><div dir=3D"au=
to" style=3D"border-color:rgb(255,255,255)">--- Write 1d07e000 to 1f80f420:=
 peripheral register not supported</div><div dir=3D"auto" style=3D"border-c=
olor:rgb(255,255,255)">--- Write 1d07e000 to ???: readonly register</div><d=
iv dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Write 0000c608 =
to 1f80f440: peripheral register not supported</div><div dir=3D"auto" style=
=3D"border-color:rgb(255,255,255)">--- Write 0000c608 to ???: readonly regi=
ster</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Wri=
te 00004003 to 1f80f400: peripheral register not supported</div><div dir=3D=
"auto" style=3D"border-color:rgb(255,255,255)">--- Write 00004003 to ???: r=
eadonly register</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,2=
55)">--- Write aa996655 to 1f80f410: peripheral register not supported</div=
><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Write aa9966=
55 to ???: readonly register</div><div dir=3D"auto" style=3D"border-color:r=
gb(255,255,255)">--- Write 556699aa to 1f80f410: peripheral register not su=
pported</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- =
Write 556699aa to ???: readonly register</div><div dir=3D"auto" style=3D"bo=
rder-color:rgb(255,255,255)">--- Write 00008000 to 1f80f408: peripheral reg=
ister not supported</div><div dir=3D"auto" style=3D"border-color:rgb(255,25=
5,255)">--- Write 00008000 to ???: readonly register</div><div dir=3D"auto"=
 style=3D"border-color:rgb(255,255,255)">--- Read 1f80f400: peripheral regi=
ster not supported</div><div dir=3D"auto" style=3D"border-color:rgb(255,255=
,255)">--- Write 00004000 to 1f80f404: peripheral register not supported</d=
iv><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Write 0000=
4000 to ???: readonly register</div><div dir=3D"auto" style=3D"border-color=
:rgb(255,255,255)">--- Read 1f80f400: peripheral register not supported</di=
v><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Write 1d07e=
200 to 1f80f420: peripheral register not supported</div><div dir=3D"auto" s=
tyle=3D"border-color:rgb(255,255,255)">--- Write 1d07e200 to ???: readonly =
register</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">---=
 Write 0000c808 to 1f80f440: peripheral register not supported</div><div di=
r=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Write 0000c808 to ??=
?: readonly register</div><div dir=3D"auto" style=3D"border-color:rgb(255,2=
55,255)">--- Write 00004003 to 1f80f400: peripheral register not supported<=
/div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Write 00=
004003 to ???: readonly register</div><div dir=3D"auto" style=3D"border-col=
or:rgb(255,255,255)">--- Write aa996655 to 1f80f410: peripheral register no=
t supported</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">=
--- Write aa996655 to ???: readonly register</div><div dir=3D"auto" style=
=3D"border-color:rgb(255,255,255)">--- Write 556699aa to 1f80f410: peripher=
al register not supported</div><div dir=3D"auto" style=3D"border-color:rgb(=
255,255,255)">--- Write 556699aa to ???: readonly register</div><div dir=3D=
"auto" style=3D"border-color:rgb(255,255,255)">--- Write 00008000 to 1f80f4=
08: peripheral register not supported</div><div dir=3D"auto" style=3D"borde=
r-color:rgb(255,255,255)">--- Write 00008000 to ???: readonly register</div=
><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Read 1f80f40=
0: peripheral register not supported</div><div dir=3D"auto" style=3D"border=
-color:rgb(255,255,255)">--- Write 00004000 to 1f80f404: peripheral registe=
r not supported</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,25=
5)">--- Write 00004000 to ???: readonly register</div><div dir=3D"auto" sty=
le=3D"border-color:rgb(255,255,255)">--- Read 1f80f400: peripheral register=
 not supported</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255=
)">--- Write 1d07e400 to 1f80f420: peripheral register not supported</div><=
div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Write 1d07e400=
 to ???: readonly register</div><div dir=3D"auto" style=3D"border-color:rgb=
(255,255,255)">--- Write 0000ca08 to 1f80f440: peripheral register not supp=
orted</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Wr=
ite 0000ca08 to ???: readonly register</div><div dir=3D"auto" style=3D"bord=
er-color:rgb(255,255,255)">--- Write 00004003 to 1f80f400: peripheral regis=
ter not supported</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,=
255)">--- Write 00004003 to ???: readonly register</div><div dir=3D"auto" s=
tyle=3D"border-color:rgb(255,255,255)">--- Write aa996655 to 1f80f410: peri=
pheral register not supported</div><div dir=3D"auto" style=3D"border-color:=
rgb(255,255,255)">--- Write aa996655 to ???: readonly register</div><div di=
r=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Write 556699aa to 1f=
80f410: peripheral register not supported</div><div dir=3D"auto" style=3D"b=
order-color:rgb(255,255,255)">--- Write 556699aa to ???: readonly register<=
/div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Write 00=
008000 to 1f80f408: peripheral register not supported</div><div dir=3D"auto=
" style=3D"border-color:rgb(255,255,255)">--- Write 00008000 to ???: readon=
ly register</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">=
--- Read 1f80f400: peripheral register not supported</div><div dir=3D"auto"=
 style=3D"border-color:rgb(255,255,255)">--- Write 00004000 to 1f80f404: pe=
ripheral register not supported</div><div dir=3D"auto" style=3D"border-colo=
r:rgb(255,255,255)">--- Write 00004000 to ???: readonly register</div><div =
dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Read 1f80f400: per=
ipheral register not supported</div><div dir=3D"auto" style=3D"border-color=
:rgb(255,255,255)">--- Write 1d07e600 to 1f80f420: peripheral register not =
supported</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--=
- Write 1d07e600 to ???: readonly register</div><div dir=3D"auto" style=3D"=
border-color:rgb(255,255,255)">--- Write 0000cc08 to 1f80f440: peripheral r=
egister not supported</div><div dir=3D"auto" style=3D"border-color:rgb(255,=
255,255)">--- Write 0000cc08 to ???: readonly register</div><div dir=3D"aut=
o" style=3D"border-color:rgb(255,255,255)">--- Write 00004003 to 1f80f400: =
peripheral register not supported</div><div dir=3D"auto" style=3D"border-co=
lor:rgb(255,255,255)">--- Write 00004003 to ???: readonly register</div><di=
v dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Write aa996655 t=
o 1f80f410: peripheral register not supported</div><div dir=3D"auto" style=
=3D"border-color:rgb(255,255,255)">--- Write aa996655 to ???: readonly regi=
ster</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Wri=
te 556699aa to 1f80f410: peripheral register not supported</div><div dir=3D=
"auto" style=3D"border-color:rgb(255,255,255)">--- Write 556699aa to ???: r=
eadonly register</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,2=
55)">--- Write 00008000 to 1f80f408: peripheral register not supported</div=
><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Write 000080=
00 to ???: readonly register</div><div dir=3D"auto" style=3D"border-color:r=
gb(255,255,255)">--- Read 1f80f400: peripheral register not supported</div>=
<div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Write 0000400=
0 to 1f80f404: peripheral register not supported</div><div dir=3D"auto" sty=
le=3D"border-color:rgb(255,255,255)">--- Write 00004000 to ???: readonly re=
gister</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- R=
ead 1f80f400: peripheral register not supported</div><div dir=3D"auto" styl=
e=3D"border-color:rgb(255,255,255)">--- Write 1d07e800 to 1f80f420: periphe=
ral register not supported</div><div dir=3D"auto" style=3D"border-color:rgb=
(255,255,255)">--- Write 1d07e800 to ???: readonly register</div><div dir=
=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Write 0000ce08 to 1f8=
0f440: peripheral register not supported</div><div dir=3D"auto" style=3D"bo=
rder-color:rgb(255,255,255)">--- Write 0000ce08 to ???: readonly register</=
div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Write 000=
04003 to 1f80f400: peripheral register not supported</div><div dir=3D"auto"=
 style=3D"border-color:rgb(255,255,255)">--- Write 00004003 to ???: readonl=
y register</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">-=
-- Write aa996655 to 1f80f410: peripheral register not supported</div><div =
dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Write aa996655 to =
???: readonly register</div><div dir=3D"auto" style=3D"border-color:rgb(255=
,255,255)">--- Write 556699aa to 1f80f410: peripheral register not supporte=
d</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Write =
556699aa to ???: readonly register</div><div dir=3D"auto" style=3D"border-c=
olor:rgb(255,255,255)">--- Write 00008000 to 1f80f408: peripheral register =
not supported</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)=
">--- Write 00008000 to ???: readonly register</div><div dir=3D"auto" style=
=3D"border-color:rgb(255,255,255)">--- Read 1f80f400: peripheral register n=
ot supported</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)"=
>--- Write 00004000 to 1f80f404: peripheral register not supported</div><di=
v dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Write 00004000 t=
o ???: readonly register</div><div dir=3D"auto" style=3D"border-color:rgb(2=
55,255,255)">--- Read 1f80f400: peripheral register not supported</div><div=
 dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Write 1d07ea00 to=
 1f80f420: peripheral register not supported</div><div dir=3D"auto" style=
=3D"border-color:rgb(255,255,255)">--- Write 1d07ea00 to ???: readonly regi=
ster</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Wri=
te 0000d008 to 1f80f440: peripheral register not supported</div><div dir=3D=
"auto" style=3D"border-color:rgb(255,255,255)">--- Write 0000d008 to ???: r=
eadonly register</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,2=
55)">--- Write 00004003 to 1f80f400: peripheral register not supported</div=
><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Write 000040=
03 to ???: readonly register</div><div dir=3D"auto" style=3D"border-color:r=
gb(255,255,255)">--- Write aa996655 to 1f80f410: peripheral register not su=
pported</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- =
Write aa996655 to ???: readonly register</div><div dir=3D"auto" style=3D"bo=
rder-color:rgb(255,255,255)">--- Write 556699aa to 1f80f410: peripheral reg=
ister not supported</div><div dir=3D"auto" style=3D"border-color:rgb(255,25=
5,255)">--- Write 556699aa to ???: readonly register</div><div dir=3D"auto"=
 style=3D"border-color:rgb(255,255,255)">--- Write 00008000 to 1f80f408: pe=
ripheral register not supported</div><div dir=3D"auto" style=3D"border-colo=
r:rgb(255,255,255)">--- Write 00008000 to ???: readonly register</div><div =
dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Read 1f80f400: per=
ipheral register not supported</div><div dir=3D"auto" style=3D"border-color=
:rgb(255,255,255)">--- Write 00004000 to 1f80f404: peripheral register not =
supported</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--=
- Write 00004000 to ???: readonly register</div><div dir=3D"auto" style=3D"=
border-color:rgb(255,255,255)">--- Read 1f80f400: peripheral register not s=
upported</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">---=
 Write 1d07ec00 to 1f80f420: peripheral register not supported</div><div di=
r=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Write 1d07ec00 to ??=
?: readonly register</div><div dir=3D"auto" style=3D"border-color:rgb(255,2=
55,255)">--- Write 0000d208 to 1f80f440: peripheral register not supported<=
/div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Write 00=
00d208 to ???: readonly register</div><div dir=3D"auto" style=3D"border-col=
or:rgb(255,255,255)">--- Write 00004003 to 1f80f400: peripheral register no=
t supported</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">=
--- Write 00004003 to ???: readonly register</div><div dir=3D"auto" style=
=3D"border-color:rgb(255,255,255)">--- Write aa996655 to 1f80f410: peripher=
al register not supported</div><div dir=3D"auto" style=3D"border-color:rgb(=
255,255,255)">--- Write aa996655 to ???: readonly register</div><div dir=3D=
"auto" style=3D"border-color:rgb(255,255,255)">--- Write 556699aa to 1f80f4=
10: peripheral register not supported</div><div dir=3D"auto" style=3D"borde=
r-color:rgb(255,255,255)">--- Write 556699aa to ???: readonly register</div=
><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Write 000080=
00 to 1f80f408: peripheral register not supported</div><div dir=3D"auto" st=
yle=3D"border-color:rgb(255,255,255)">--- Write 00008000 to ???: readonly r=
egister</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- =
Read 1f80f400: peripheral register not supported</div><div dir=3D"auto" sty=
le=3D"border-color:rgb(255,255,255)">--- Write 00004000 to 1f80f404: periph=
eral register not supported</div><div dir=3D"auto" style=3D"border-color:rg=
b(255,255,255)">--- Write 00004000 to ???: readonly register</div><div dir=
=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Read 1f80f400: periph=
eral register not supported</div><div dir=3D"auto" style=3D"border-color:rg=
b(255,255,255)">--- Write 1d07ee00 to 1f80f420: peripheral register not sup=
ported</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- W=
rite 1d07ee00 to ???: readonly register</div><div dir=3D"auto" style=3D"bor=
der-color:rgb(255,255,255)">--- Write 0000d408 to 1f80f440: peripheral regi=
ster not supported</div><div dir=3D"auto" style=3D"border-color:rgb(255,255=
,255)">--- Write 0000d408 to ???: readonly register</div><div dir=3D"auto" =
style=3D"border-color:rgb(255,255,255)">--- Write 00004003 to 1f80f400: per=
ipheral register not supported</div><div dir=3D"auto" style=3D"border-color=
:rgb(255,255,255)">--- Write 00004003 to ???: readonly register</div><div d=
ir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Write aa996655 to 1=
f80f410: peripheral register not supported</div><div dir=3D"auto" style=3D"=
border-color:rgb(255,255,255)">--- Write aa996655 to ???: readonly register=
</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Write 5=
56699aa to 1f80f410: peripheral register not supported</div><div dir=3D"aut=
o" style=3D"border-color:rgb(255,255,255)">--- Write 556699aa to ???: reado=
nly register</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)"=
>--- Write 00008000 to 1f80f408: peripheral register not supported</div><di=
v dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Write 00008000 t=
o ???: readonly register</div><div dir=3D"auto" style=3D"border-color:rgb(2=
55,255,255)">--- Read 1f80f400: peripheral register not supported</div><div=
 dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Write 00004000 to=
 1f80f404: peripheral register not supported</div><div dir=3D"auto" style=
=3D"border-color:rgb(255,255,255)">--- Write 00004000 to ???: readonly regi=
ster</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">--- Rea=
d 1f80f400: peripheral register not supported</div><div dir=3D"auto" style=
=3D"border-color:rgb(255,255,255)">--- Read 1f800810: peripheral register n=
ot supported</div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)"=
><br></div><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)">I thin=
k I need to add a new case at this point to stub the gpios=C2=A0</div><div =
dir=3D"auto" style=3D"border-color:rgb(255,255,255)"><div><a href=3D"https:=
//github.com/sergev/qemu/blob/a2e0277dfe4b399a074f2124c0326be31b34a6e8/hw/m=
ips/mips_pic32mx7.c#L833">https://github.com/sergev/qemu/blob/a2e0277dfe4b3=
99a074f2124c0326be31b34a6e8/hw/mips/mips_pic32mx7.c#L833</a></div><br></div=
><div dir=3D"auto" style=3D"border-color:rgb(255,255,255)"><br></div><div d=
ir=3D"auto" style=3D"border-color:rgb(255,255,255)">But have never had any =
experience with how qemu works or building up objects.=C2=A0</div><div dir=
=3D"auto" style=3D"border-color:rgb(255,255,255)"><br></div><div dir=3D"aut=
o" style=3D"border-color:rgb(255,255,255)">Is there any pointers that could=
 help me along this journey?</div><div dir=3D"auto" style=3D"border-color:r=
gb(255,255,255)"><br></div><div dir=3D"auto" style=3D"border-color:rgb(255,=
255,255)">Cheers Peter=C2=A0</div></div>

--0000000000007f497e05b9ba0217--

