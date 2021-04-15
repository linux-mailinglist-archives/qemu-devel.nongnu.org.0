Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 151903602C0
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 08:53:33 +0200 (CEST)
Received: from localhost ([::1]:35644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWvsa-0005h7-61
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 02:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1lWvr0-0004ph-IT
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 02:51:54 -0400
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a]:39552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1lWvqx-00063i-3E
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 02:51:54 -0400
Received: by mail-lj1-x22a.google.com with SMTP id u4so25915877ljo.6
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 23:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J6f7rExeDcaeVqyX/x6Y/RGhrOBvlSYjbDa784miew4=;
 b=KLEme10tpGFd6crfl2otkOCbzpf27Whl8n+d0b8ZUTwbXGcJpfmAmwRxqOXY9pK8F/
 pbTdNWkGwzgsLLjfq+uDmHryw0UMDh9TTu8xaNIXQy/cdWXIHJlCWOCRTT4A3PMx9QCm
 J7GOaww3oyowcf1QsphF4xZinTfxawZosyouQu2LhWy9A0VXT8Dk4B5Xub5xaKGvgBnK
 KRoCuZ6O0shUfQuYWF+4shyPWVm+wBBrgZ9XHaBrrgI8kwe8aTXor6zPWeX9frqvWNPx
 6KkI07pnuGcEOWQ+xZ2a5Em2xUMtVda4/Vp3lmk86NWE+DuNto73eoKddniNspGal8Cu
 SBGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J6f7rExeDcaeVqyX/x6Y/RGhrOBvlSYjbDa784miew4=;
 b=FJWQEPzJW51+wfo1MuJWyFDoSbPkYk312Ty41BmUYLigFPTXBDfBLVNLVkkhEjWh0S
 oJvaVJof8WK/SmPMl3I3oLW0t6Giu2w33Q8D/VJp4SjmuZ9twbws8amri/twoZLWdZcj
 tzs8lW7ycfcRyzZ1Mz91dXt/4ntQ8Cs2keiQTbmBY22JEGw746zLDG5fhIRhqeja8q/j
 8fvB+bAu6AcVN2D0eur+isrW/uMcEZxz/YArzbsf9tIQhg5qniJDqivj7o/cAjz1PElf
 WwI7ML3IgZ08ryMpd0CginlMQKkFxNaXIWcgqj6cP5rjKuOnz6jUUXoEhn+QuG/VJV0g
 +iFQ==
X-Gm-Message-State: AOAM532jcOxZWpsRKRTzmFA09oOGm2HC5S5YyVB2sWkH7zf4tHpEo9iW
 HucogZEDP0uVHxh+yfrwzwoosheFhxWWXLvklGaODg==
X-Google-Smtp-Source: ABdhPJwE1o3Tp7WE/LSSjsdZieUB/3azTl64601wK3qlCcW6L4nLY03onGgWGvgKu6qbm9CpReRfb0VK2K6GQAfVg6U=
X-Received: by 2002:a2e:3909:: with SMTP id g9mr926910lja.385.1618469506589;
 Wed, 14 Apr 2021 23:51:46 -0700 (PDT)
MIME-Version: 1.0
References: <AM6PR01MB498093EDCD5AB2B533595611DF4E9@AM6PR01MB4980.eurprd01.prod.exchangelabs.com>
In-Reply-To: <AM6PR01MB498093EDCD5AB2B533595611DF4E9@AM6PR01MB4980.eurprd01.prod.exchangelabs.com>
From: Liviu Ionescu <ilg@livius.net>
Date: Thu, 15 Apr 2021 09:51:35 +0300
Message-ID: <CAG7hfcK89F0FiPLkPpWr98YDi9Ks2XNhRca_xKhz8WgnH4bYgg@mail.gmail.com>
Subject: Re: Mac OS - Standalone Installer
To: Richard Hill <richardmatthewhill@hotmail.com>
Content-Type: multipart/alternative; boundary="000000000000053fc005bffd4c13"
Received-SPF: none client-ip=2a00:1450:4864:20::22a;
 envelope-from=ilg@livius.net; helo=mail-lj1-x22a.google.com
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000053fc005bffd4c13
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 Apr 2021 at 01:16, Richard Hill <richardmatthewhill@hotmail.com>
wrote:

>
>   ... a standalone installer for QEMU for Mac OS?
>

The xPack QEMU Arm is distributed as standalone archives, for all
platforms, including macOS:

https://github.com/xpack-dev-tools/qemu-arm-xpack/releases

They do not even require install, simply unpacking the archives in any
location is enough; this can be further automated with xpm, which is also
very convenient for CI.

Time permitting, I plan a similar binary distribution for the latest QEMU
too.

Regards,

Liviu

-- 
Sent from my iPad via Gmail.

--000000000000053fc005bffd4c13
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, 15 Apr 2021 at 01:16, Richard Hill &lt;<a href=3D"m=
ailto:richardmatthewhill@hotmail.com">richardmatthewhill@hotmail.com</a>&gt=
; wrote:</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)" dir=3D"auto">=C2=A0 ... a standalone installer for QEMU for Ma=
c OS?</div></div></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto"=
>The xPack QEMU Arm is distributed as standalone archives, for all platform=
s, including macOS:</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div=
><a href=3D"https://github.com/xpack-dev-tools/qemu-arm-xpack/releases">htt=
ps://github.com/xpack-dev-tools/qemu-arm-xpack/releases</a></div><div><br><=
/div><div dir=3D"auto">They do not even require install, simply unpacking t=
he archives in any location is enough; this can be further automated with x=
pm, which is also very convenient for CI.<br></div><div dir=3D"auto"><br></=
div><div dir=3D"auto">Time permitting, I plan a similar binary distribution=
 for the latest QEMU too.</div><div dir=3D"auto">=C2=A0</div><div dir=3D"au=
to">Regards,</div><div dir=3D"auto"><br></div><div dir=3D"auto">Liviu</div>=
<div dir=3D"auto"><br></div></div></div></div>-- <br><div dir=3D"ltr" class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">Sent from my iPad v=
ia Gmail.</div>

--000000000000053fc005bffd4c13--

