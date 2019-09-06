Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1072AB011
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Sep 2019 03:20:34 +0200 (CEST)
Received: from localhost ([::1]:50776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i62vR-0004RJ-9a
	for lists+qemu-devel@lfdr.de; Thu, 05 Sep 2019 21:20:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58966)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1i62sB-0003Wz-Q4
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 21:17:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1i62sA-0008En-Ku
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 21:17:11 -0400
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741]:36075)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1i62s7-00086j-Fu; Thu, 05 Sep 2019 21:17:07 -0400
Received: by mail-qk1-x741.google.com with SMTP id s18so4164813qkj.3;
 Thu, 05 Sep 2019 18:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bkIbC9kLBWNJAFXoYR6IXfcc8WNbQurNRzah/yIoSjw=;
 b=R8sl6cxgFi54BYBE/YM1na9Qq+lq6IsiDJkyldqxmHfO1t5vodzD35epk5EGp8rVc6
 ALERrFKO5Lzxf8Haa+v0oZ1Qma61f3fllCQzlwU02kTUsSN7NL8sjcFjkNB92VQKLqqJ
 KBhTPDZ5ryqW7eA2VWx5XCgU3bCTkgNiecqk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bkIbC9kLBWNJAFXoYR6IXfcc8WNbQurNRzah/yIoSjw=;
 b=TUPs5sRAL2rBMWTmCJXmdO6OTRtxocM7D4eyq5AkBN7N7DQ3DNn1o/2EudTlWmCaDW
 JuUaqNYUmmAemOZCdUrex5S6VsVrSDZ8uI0lBSCQZdpQcsGuud6EFE5Qvt1yKUYe5aAB
 rd5eoKbgbQ/kzTo5pdYclzFRQKLnrQpBaFtIin3ERlR3gk5nchzAlACvsNBW1NbKs1YB
 0EYHuS6Yr4zh/DRBrv/x6dFbXzsylEgaUtZFkS+VSk6DWAkK6BAmu38NVRDaGW29oDGJ
 HjzVI1KeIxL6qTURDV0UMKZbClCP0mw+sv3zrS7f1Kp0t/LuTQ+2MqpcFaGCo1td6/ya
 G6eA==
X-Gm-Message-State: APjAAAXGmonJ/29IlljxszjZqtmcXs04yCCt3hdgNJYtcXFlwDuAjGfY
 ZoygUjPxI8fjmbng1sFMwE1dvuC08VlfNzL6TW8=
X-Google-Smtp-Source: APXvYqxhGVN1WwJOzLhZEigyc8YfDDbaYCDee/skQKU1HLnd/Z6rYyvHKS7ap1nRgiS0FPEU44r5k3EWwdJ+p4r3/rE=
X-Received: by 2002:a37:4f4c:: with SMTP id d73mr6360215qkb.171.1567732626054; 
 Thu, 05 Sep 2019 18:17:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190906011010.1135084-1-amithash@fb.com>
In-Reply-To: <20190906011010.1135084-1-amithash@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 6 Sep 2019 01:16:54 +0000
Message-ID: <CACPK8Xds26gq=e=7D9qtPJ4FOvhHb0Q-_Chj_MFHcWO99EBcwg@mail.gmail.com>
To: Amithash Prasad <amithash@fb.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::741
Subject: Re: [Qemu-devel] [PATCH] Check correct register for clock source
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 6 Sep 2019 at 01:10, Amithash Prasad <amithash@fb.com> wrote:
>
> When WDT_RESTART is written, the data is not the contents
> of the WDT_CTRL register. Hence ensure we are looking at
> WDT_CTRL to check if bit WDT_CTRL_1MHZ_CLK is set or not.
>
> Signed-off-by: Amithash Prasad <amithash@fb.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

Thanks for the patch!

> ---
>  hw/watchdog/wdt_aspeed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
> index 9b93213417..f710036535 100644
> --- a/hw/watchdog/wdt_aspeed.c
> +++ b/hw/watchdog/wdt_aspeed.c
> @@ -140,7 +140,7 @@ static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
>      case WDT_RESTART:
>          if ((data & 0xFFFF) == WDT_RESTART_MAGIC) {
>              s->regs[WDT_STATUS] = s->regs[WDT_RELOAD_VALUE];
> -            aspeed_wdt_reload(s, !(data & WDT_CTRL_1MHZ_CLK));
> +            aspeed_wdt_reload(s, !(s->regs[WDT_CTRL] & WDT_CTRL_1MHZ_CLK));
>          }
>          break;
>      case WDT_CTRL:
> --
> 2.21.0
>

