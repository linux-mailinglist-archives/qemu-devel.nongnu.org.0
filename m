Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1719517BFBC
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Mar 2020 14:59:03 +0100 (CET)
Received: from localhost ([::1]:37042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jADVG-0006rn-4f
	for lists+qemu-devel@lfdr.de; Fri, 06 Mar 2020 08:59:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35979)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pr0f3ss0r1492@yahoo.com>) id 1jADTs-000574-Hz
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 08:57:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pr0f3ss0r1492@yahoo.com>) id 1jADTr-0003kQ-DP
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 08:57:36 -0500
Received: from sonic307-56.consmr.mail.ne1.yahoo.com ([66.163.190.31]:32872)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pr0f3ss0r1492@yahoo.com>)
 id 1jADTr-0003SZ-5J
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 08:57:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1583503054; bh=8KndwukGcs4eu5RHDhQRwW+z5XukBHFaafK1Gnjz9IU=;
 h=From:Date:Subject:To:Cc:References:From:Subject;
 b=RzQrM1ej4P9Vgw4kEozVySyuJU8Qo4Dn//o+4XRvTaFkX+CDKS/MlPMyIdZjl+rcT9sEMqRtRFgfi39dkO584mRjQ3ACm9N88KQUQn1X8Nq2dAw7+gENOW+JqXz0FVt7Oa+E2XGMnUznA65/K0K5qaR8v41x+YY4ulBqKvZ45aM23P2tQ9mbg4lz7M5QxddX4bOfYt+y7UFtgfNq8xC+S3qHC+uYd7IQvhFKSh27Z0SBwvRkalcu9mharbqn5QVSb7MoC6eW0rpPnFTtx8RKVl34D4JIhskkKkVQAErHPLOKNk3Py3cxuNR3FFnrtUm+OgVyJk1lhHAerEE7Ijr/Aw==
X-YMail-OSG: 5UHikiYVM1mhFoDJlDnY4jIvd0j73iiigI1bHkBK_5P3WbvGbA_eQMbR1uL7Ige
 RL6joMs0mQdHCj2uasOkYggmw0oQHqM_RbrIYBrKNcLCwNV2fC0HB1dTqfXIrp9zjyRWTfl59.f2
 oSpMcnPXjsKxlTckMe3k5wXGsMgqP__qU.oL6hJpFqgjlBAvyBtxSFpzHTi_zmPmRluSriulrTnU
 9kCW1C2mPO_jTN3nXsoiFlIOn9SxF_kTOY8fPgoVDWcu09583dvswNkAQvm6m8ORzVgyNICOKflB
 .48sKbUdDPcfx.A70_mFtqfidedDImMm1NyqPq_NJqCd3rq6sUI7sG_BarE.85kQthbEIQOmlsdx
 Z74udAv_Fhx6pfsMI1Yp6w1HPBOJajvgFQucTyNL2d5JfPFP_2SNVsTOU2xxjdFMt.n5qvstN9zy
 .3d3yyEgmc5zFVK0XefnJXGKtN_JsHmWhz2LD7XSc4mfS5SBCBh3fnkPbpw3qwKIuWfV_JI01MbJ
 4zM3eLNbz2cDbG6_NsqiaGhciKmxYOssufn.16193cBrvuU35ZZj2SHQZ9ypMNdNGXXo7wWpdxpV
 UBo_aeG3h_NFpmhVMfsxxoox.TFUkIbq2bWoBuATsHIzZWaNJaqjsgFVSBEfVPS3ceCqV.c_i8yy
 TaqCEavEwsxQ0qIyu4W80_wm9iqxrY0Lwqiu9AI3yCEFas_bAy5a.GIUFalpwF4jc72o0XJMkDgY
 16.KzxoSKf6CHErgtgmEtgPGfGLsd8_RMe5gy4Qe3U.262K.8SkI.WJFX1G3beri_o1tOsXMTh1I
 HXhejrGVcHsKTUmoCrPQ_pIYHH29wPf81vZYC19hybXXP1x.m7wKHZcZNC7Olpw1i9j_0XmLaijN
 vARj04nES1mgYXkSfGBbVFmlPlHjESnHdD586Tz50ibBU13O4tUVSwZsstQHDFGMq0.JJ7x3Q3eB
 1BBYmmL7g9zSkJdF9q9hYQVgEA3naUpw6VKkFLHBaL5igkbG4VJZhvLGgtbNcZ7wTU7Rhedf_Y48
 UfXnHZ9EihTUwRPI7ZIxtoTW3RzHMH0EK6WeBvvWzHqsCyOoFU__tdsmTQpFYRs3cIGoKabK_ec1
 d6k3wGgMU6NOSsVVVZj8heZr8vTVYRhOIoCg0DEPfpin.2lC1gi0b6Lxc1HV2FXmpVgJ5Tl9SxZc
 pmkWhhLUFKfGSy3z006O.HvYRToLQ2n8tHudT0JZOkQ_xi192ZD9I_syaQVZ9ymtiY1VVWy9wlsS
 kf_iUrrKNyho.HrDK6TXmU9eqfv3S2cCmoPLmY8FhE6RcJ1vCCFLnZfB0fei.6RoH.tV4HYQUaGV
 LfS2KYnkQhx_j.x2jp_f7lT_FsOt7DggwCXurt4YGZxN_bbirGeO4Lf6VDajd5Q9ReUvyAVW5MGG
 ..4u7H2.X.QAo67rmGXt6YvhySp0KrJn950avpXvXt78oh0k91SsdxoN4PGnPejxV39J5CRx2rrj
 D
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.ne1.yahoo.com with HTTP; Fri, 6 Mar 2020 13:57:34 +0000
Received: by smtp422.mail.bf1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
 ID aa6b944c9857331c01a90b0b2ed5e368; 
 Fri, 06 Mar 2020 13:57:32 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id m5so1137827pgg.0
 for <seabios@seabios.org>; Fri, 06 Mar 2020 05:57:32 -0800 (PST)
X-Gm-Message-State: ANhLgQ2K2SpBs0O7o/Pg9I3DSsXfNP1Cg/vlsWSca5yd1pP2ErAJ5wds
 uO8ic/V22NAB7yQ+dje93mxaMXeGghF8bEaOAGE=
X-Google-Smtp-Source: ADFU+vvTGCt9DHrYu398KByEiMp26mrXAZZpwAs+wwWXw95fsYQJIuk54FF/mzjAYWuvT5KpKRtEk+IQLj6IpRXF8xU=
X-Received: by 2002:a63:8c18:: with SMTP id m24mr3558690pgd.70.1583503051818; 
 Fri, 06 Mar 2020 05:57:31 -0800 (PST)
MIME-Version: 1.0
From: Ottavio Caruso <ottavio2006-usenet2012@yahoo.com>
Date: Fri, 6 Mar 2020 13:57:15 +0000
X-Gmail-Original-Message-ID: <CAEJNuHy_O23m0ttcPUYDeeFWLCC2dSvGk8WZPEVr9XkTaAx7Yg@mail.gmail.com>
Message-ID: <CAEJNuHy_O23m0ttcPUYDeeFWLCC2dSvGk8WZPEVr9XkTaAx7Yg@mail.gmail.com>
Subject: Re: [PATCH] sercon: vbe modeset is int 10h function 4f02 not 4f00
To: Gerd Hoffmann <kraxel@redhat.com>, seabios@seabios.org
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
References: <CAEJNuHy_O23m0ttcPUYDeeFWLCC2dSvGk8WZPEVr9XkTaAx7Yg.ref@mail.gmail.com>
X-Mailer: WebService/1.1.15302 hermes Apache-HttpAsyncClient/4.1.4
 (Java/1.8.0_241)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 66.163.190.31
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

On 06/03/2020 09:03, Gerd Hoffmann wrote:
> Fixes console redirection for NetBSD primary bootloader.
>
> https://bugs.launchpad.net/bugs/1743191
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
> src/sercon.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/src/sercon.c b/src/sercon.c
> index a5dadb7261af..66a1f2412e77 100644
> --- a/src/sercon.c
> +++ b/src/sercon.c
> @@ -464,7 +464,7 @@ static void sercon_104f(struct bregs *regs)
> regs->ax = 0x0100;
> } else {
> // Disable sercon entry point on any vesa modeset
> - if (regs->al == 0x00)
> + if (regs->al == 0x02)
> SET_LOW(sercon_enable, 0);
> }
> }
>

Unfortunately, this patch doesn't sort it for me. It also slightly
messes up with the console, see:

https://i.imgur.com/3ANAQC7.png

-- 
Ottavio Caruso

