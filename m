Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7F517BFBD
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Mar 2020 14:59:04 +0100 (CET)
Received: from localhost ([::1]:37040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jADVH-0006rk-2l
	for lists+qemu-devel@lfdr.de; Fri, 06 Mar 2020 08:59:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35980)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pr0f3ss0r1492@yahoo.com>) id 1jADTs-000575-Hn
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 08:57:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pr0f3ss0r1492@yahoo.com>) id 1jADTr-0003j1-9k
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 08:57:36 -0500
Received: from sonic307-56.consmr.mail.ne1.yahoo.com ([66.163.190.31]:44562)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pr0f3ss0r1492@yahoo.com>)
 id 1jADTr-0003Tg-2D
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 08:57:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1583503054; bh=8KndwukGcs4eu5RHDhQRwW+z5XukBHFaafK1Gnjz9IU=;
 h=From:Date:Subject:To:Cc:References:From:Subject;
 b=RzQrM1ej4P9Vgw4kEozVySyuJU8Qo4Dn//o+4XRvTaFkX+CDKS/MlPMyIdZjl+rcT9sEMqRtRFgfi39dkO584mRjQ3ACm9N88KQUQn1X8Nq2dAw7+gENOW+JqXz0FVt7Oa+E2XGMnUznA65/K0K5qaR8v41x+YY4ulBqKvZ45aM23P2tQ9mbg4lz7M5QxddX4bOfYt+y7UFtgfNq8xC+S3qHC+uYd7IQvhFKSh27Z0SBwvRkalcu9mharbqn5QVSb7MoC6eW0rpPnFTtx8RKVl34D4JIhskkKkVQAErHPLOKNk3Py3cxuNR3FFnrtUm+OgVyJk1lhHAerEE7Ijr/Aw==
X-YMail-OSG: LHZSGEIVM1l.nyS1GK2A6_GFD02E8TXLNvmmqvxoGfS6Zd8bkXfRZ0K_07LWDse
 MVYb1webWElhXNs5FlDE5A5ooSSxDALBCOriz1nXiAsVjN1P9kUduq8f6FdEuzrOZKtK6WZVAhNH
 fV7LDOdZSuS8o4Ng4bJzR1QGwE5vBzjtiEbX0QoADHcDSICEXNd5AuAUm9r2hHSMXv7VsAdim3_9
 6QaVt9cGKJ8G7vnB.qVnMI_ftkq7XtErwkYQOwb5cpgtrk3dFUWpzjPnAiuRoRWa3P8AcJwMLwy2
 cjKQc4LtE1NQW1VseDq0K3O9uht7h28fTqAibjPdZTEH5EWAhtRTHUzWZxBUGKVJfY2YjBAb2xuD
 EcLt2caGBKakr8shQ3EFYROTEUTLvIITy2U2WeIWdAqkTD9R.yDtPlJdZoTyxae6eEIka1_8DohT
 rg51DCsygYZq3oNNACwRLwvw2dZxEJ.Fw469KAXCpwFzOkJ7iz35N09Mv_fByrwwDrE6Hs0q8_hC
 _zBprfEB7Jko.fnQ0druTq5kGITbnGlVrj3a3PIzU2tPtL3hINtFvWOyUH4eaNNq88hXXkoSQADe
 wcAtyw9LqEmCLMjP3E6UYiQftnsyRaTJmUFo4PUdJXtpMvMA5TkX3oHgNrXHzG5lWpL8tx5YaoxU
 4yJd0oM8K5617K4aO6Z9eXoKpRtILPKtCiVEWPAb56uDp8HNo_iR79v1wBYw4xpdZQZMcZVslh96
 Q3UkzKyMw3jQ6AHfiPp7qWxtWMYUAPcgvpBPQh9I3PSxxDztyMHhpNdPoe88T3wmjR4FAh2k_Sv6
 vpnMqsijcwsMHgYK84v4o5EgRLDNQFxh2gjY9CyZsLkI6RadXI2_gRozjGaR8jWjvnKqp_ObKKzO
 eo9BkcbRoSw2GajSa8mKYc_RZOkh0y3goTCpBnS8bAxYspTPA8gF0VpUjL_oPmZHlCf_JaI9IH6O
 MGl_ioaB7zbKgAdTg1ulyaXmILfBpVp88pTEcP9NE0EJVCpfk0qhg48LGSNUNv1AAMrSqsdKzBpT
 k.MA1ej_HfJr.cKtYcw_amF8_cWM25MJ4CQMhmG63ST6tXgHxtQ8ENfAYmRK5y2uv9dKUVyp6MFs
 zHa4DPwQ7hLnHnwHAco8Ygqb2M00oCbQ5TYzYBgaZHuT0UNwNmIDrkla4SnerInMN2EmFZDl8dhd
 AIYGud4cCMYO4cnMx35FLuTHT_jU6eK5nNtCz5JDDQO1TgTjz_qPhOqZT3MQ1ma1umkkdlUHe8Hk
 Q85BC1nsyrz7AB1lzw2TGSFzkWmUmAKgRDBj8D752WCPXRqdgYfAkcoMBdyAh2bNL6U3iPfSz7L4
 PMyqGOQJFHYeubchp8nRKeiyvOmrwjugveqzFCryGh6Q1EE4EsorriLhiTXONzM0Y6.QEfDp8M8F
 iE3sdRF5jLZU0eEndNN6ScnNTL8Dd1sDWBjUuwq2DVmjNmvRKHU6Cc30NXrbT7MpEL1Z950Q48tY
 -
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.ne1.yahoo.com with HTTP; Fri, 6 Mar 2020 13:57:34 +0000
Received: by smtp410.mail.ne1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
 ID 3185bdbfb9686638fd6020e72b5daf9f; 
 Fri, 06 Mar 2020 13:57:32 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id w65so615942pfb.6
 for <qemu-devel@nongnu.org>; Fri, 06 Mar 2020 05:57:32 -0800 (PST)
X-Gm-Message-State: ANhLgQ2QeCDNfjDJFh2dyNrrCwSYIAqS0AvjNRgskYGKIT5JIcyRNHpB
 FqnfgDOEvRvVLpDhf1UgYjB+XUzs4zsv6mK5S9k=
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

