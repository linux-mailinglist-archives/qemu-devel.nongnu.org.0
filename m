Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEE42E80CD
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 16:12:46 +0100 (CET)
Received: from localhost ([::1]:56572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuzd6-0007rK-Pu
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 10:12:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kuzbi-0006sx-EQ
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 10:11:18 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:34235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kuzbg-0003Uk-Lx
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 10:11:18 -0500
Received: by mail-ej1-x630.google.com with SMTP id g20so25700200ejb.1
 for <qemu-devel@nongnu.org>; Thu, 31 Dec 2020 07:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iIL8RA8+YEuUI+QdTMw039PzsZZOrMWo8xJpsi7vHAc=;
 b=mmPWIxp1pVegoSl0BXY4KajKVhwyR0POU6sRk0axTTREkYu9a3/U5jEIiR3yKepB3B
 a8OJcwfWIfpbtIaubE190bXCiaSUx/zhB6fftrhoLYIfhgEYOgfnnWD9Yy2dLmBiLiNA
 mgJYaPDioUgHEE9uM3rtGiMKRLqxoTgy1B5FHO0sl9dA9jvo14kijYgmXhwPDFeUNJni
 EQwt8m7qZetMGHk+1iEgfmBX2bPbl9NByCQ3VzV2jhU8GdP1Q+jjOgOILnaHlIeUDjqv
 CS+pCdJLboIJ9RbAIhRX6IaND8Szu4r+BZUaKFnesjoau1oe5GHNJxLg6nYo/jFPP5e0
 ba6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iIL8RA8+YEuUI+QdTMw039PzsZZOrMWo8xJpsi7vHAc=;
 b=HeVaVcYaCZA71rryhkJBri5gJLnI4ZARPFLVxs+zn2aUatgH51+eHcfvIiBPnQwI+9
 jIYGJvA9Bzzs8WH3mV15V5xYe932xF25+LKsWNwl2QWKgpQmDR347sNII7RMyaVxdesS
 b0cYefCo8XzY/KZGQfPlRP6nWKBL1897ZbAsQue+eu4j1/fF0vIu/9nzfbAIor9bqzr4
 FyaJVgCnEWt7u6970NGbgNhdJPq8TKrirGUL/RM+ZXEHTFhL+2V4apEORKLtjFq4ezYZ
 2dQ/+OMGKOoS3NGCY2R7g3nXRV1bAbaN8YbBpBIiLh+MN22uDXn5uvjodQZeHJb6Shvb
 6QHA==
X-Gm-Message-State: AOAM532bt8y00h5KeZLAeWU5NTBYzM0siRNv5n1PrNCJig2Xtrfpl1a7
 0BYGUMtmCC7y3wgrZUygnIEgniKNZQpNxcYhDnBe2g==
X-Google-Smtp-Source: ABdhPJwuSbZMo2edwCqwMyz6RayLrBBt2BYnzNz6YTPeEhyt59NpFPVIHaFyDVY91H8b5/iilmj/4Y1CON81x/W9ZfA=
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr53287474ejf.407.1609427475137; 
 Thu, 31 Dec 2020 07:11:15 -0800 (PST)
MIME-Version: 1.0
References: <cover.1609413115.git.balaton@eik.bme.hu>
 <6892fc8ac57283bf7ba27fe89ea9dbdd6a37f988.1609413115.git.balaton@eik.bme.hu>
In-Reply-To: <6892fc8ac57283bf7ba27fe89ea9dbdd6a37f988.1609413115.git.balaton@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Dec 2020 15:11:04 +0000
Message-ID: <CAFEAcA96wr_+DmXfR5ba_MEPB+sBow-QR1wpvSvKawus7qzKVg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] sam460ex: Clean up irq mapping
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Guenter Roeck <linux@roeck-us.net>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 31 Dec 2020 at 11:20, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
> Avoid mapping multiple interrupts to the same irq. Instead map them to
> the 4 PCI interrupts and use an or-gate in the board to connect them
> to the interrupt controller. This does not fix any known problem but
> does not seem to cause a new problem either and may be cleaner at least.
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> Tested-by: Guenter Roeck <linux@roeck-us.net>

So, this patch is a behavioural change, but I think it's
probably a change to the right behaviour. The difference
is relatively slight, but you would see it if there are two
different PCI cards and they both assert a different PCI
interrupt, and then one of them lowers the interrupt
before the other:

device A:   _____|---------|________
device B:   ________|----------|____

With the old code, the signal values as seen by the UIC
look like this:
UIC input:  _____|---------|________
(this is because when device A says "interrupt line value 0 now"
we just pass "interrupt line value 0" through to the output).

and with an OR gate they look like:
UIC input:  _____|-------------|____
(which is probably the actual behaviour -- UIC line stays
signalled until all PCI interrupts are quelled).

For this to matter to a guest it would have to be doing something
a bit odd in its interrupt handling code, though, I suspect
(like saying "stop looking for device drivers which need to
service their device once the UIC interrupt is no longer asserted").

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

