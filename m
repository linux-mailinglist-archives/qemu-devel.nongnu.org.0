Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAFE41A13
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jun 2019 03:52:36 +0200 (CEST)
Received: from localhost ([::1]:56168 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hasRH-0006nI-RO
	for lists+qemu-devel@lfdr.de; Tue, 11 Jun 2019 21:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53985)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <joel.stan@gmail.com>) id 1hasOE-0004M9-Mx
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 21:49:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1hasGD-0002pj-LG
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 21:41:10 -0400
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841]:33598)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1hasGC-0002pE-JT; Tue, 11 Jun 2019 21:41:08 -0400
Received: by mail-qt1-x841.google.com with SMTP id x2so16083781qtr.0;
 Tue, 11 Jun 2019 18:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=v1sFUKnJLpm0mlnXzMS7JlbJmo2Zq+U/0Md+ZJc49vo=;
 b=ma8774XlhK+h9lru9bDbyekR9GY+qfp2VHinn58C2GxSp0DFxkXdtGCjx0Z0O1p48/
 TIb718HSaSY4Y3DXI6KfkFVvlWpd102boCpNBP61k/j8EVd26xvXC7rEteRSre58WRf7
 GDNoDgHfJy0Xsptb/Kd/dmp54VJ5yPgfr/wXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=v1sFUKnJLpm0mlnXzMS7JlbJmo2Zq+U/0Md+ZJc49vo=;
 b=JOdqrj9X6W4I3Xh7M60mEy8XsQ3KC8Fq/B1LRQP+f2kU4oaf20PvH7BTyaTOesLIwI
 q7cfhbqA53B39sEawf9wD+kfMeLLCgKtcGTPHMPliKlt6SnDUjecanr7eh+VgCdlVXg6
 qnvD9yhI3wkPPL8qocq6teGl6pclS+behh2nYQUIpGphTXE4UBfRk+UYF+JcaG7vlFFs
 STFewhRz5k1k2/DD7tOk+jjbelKfNyzhSK9O8ykkSiVezUMxG14U+/OzmJL8ckzy2enW
 QX3RT9UrjjmcLTnTCziYZvcW9Ed3/Ah1KWvQnIbEkO9/CDxABSNYx18iVGyHUM9f6eC6
 vgDw==
X-Gm-Message-State: APjAAAWSUnAh8Fmcwd4iLZH4S6xEV2gQUCdp+7mIfm3g2KAKcCukjuBX
 wAlZLjXEgg1u8b55sWxxO1+7s0nef4PM3GjKKb4=
X-Google-Smtp-Source: APXvYqyuF43HT69oGyjBDMWK5gzS0/OAFzXBKitxAzG97hxe+n4SBaDDpHxtD2uXi+DT36rKzi3LbBdbhCwc98Wr8M8=
X-Received: by 2002:ac8:264a:: with SMTP id v10mr35710141qtv.255.1560303668022; 
 Tue, 11 Jun 2019 18:41:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190525151241.5017-1-clg@kaod.org>
 <20190525151241.5017-18-clg@kaod.org>
In-Reply-To: <20190525151241.5017-18-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 12 Jun 2019 01:40:56 +0000
Message-ID: <CACPK8XcobLx8qsLjxBdL+xe0c4-C0J4gEMFoVOeGGcUL+O98zQ@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::841
Subject: Re: [Qemu-devel] [PATCH 17/19] aspeed/smc: add DMA calibration
 settings
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 25 May 2019 at 15:14, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> When doing calibration, the SPI clock rate in the CE0 Control Register
> and the read delay cycles in the Read Timing Compensation Register are
> set using bit[11:4] of the DMA Control Register.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Acked-by: Joel Stanley <joel@jms.id.au>

