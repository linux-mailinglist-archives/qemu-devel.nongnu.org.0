Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 513F612F69
	for <lists+qemu-devel@lfdr.de>; Fri,  3 May 2019 15:41:52 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40941 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMYRj-0007pN-G8
	for lists+qemu-devel@lfdr.de; Fri, 03 May 2019 09:41:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35556)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hMYQh-0007BC-Ve
	for qemu-devel@nongnu.org; Fri, 03 May 2019 09:40:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hMYQg-0007df-6x
	for qemu-devel@nongnu.org; Fri, 03 May 2019 09:40:47 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:38535)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hMYQf-0007d6-Ot
	for qemu-devel@nongnu.org; Fri, 03 May 2019 09:40:46 -0400
Received: by mail-oi1-x244.google.com with SMTP id t70so4433293oif.5
	for <qemu-devel@nongnu.org>; Fri, 03 May 2019 06:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uwpGvOL7gaRHC0rQNjuiSBiDmQby3JU/47HdlzAriD8=;
	b=Y8CNs+IVCea0lndYw/21jNvmUf4ubGfAnPkYjTfyX09prxGcSqoPMBbZ/ZDbc0RibY
	60KfAJGEm/iS19XgJXAwwO5fwzU6JYWqHlJmmxST5SVk1+/dIHNEaxK0qg4ZybEgMylJ
	sxDtU1q3OhjDBAVGD7l8bDw9o5OCmK1qgfIi4ZnbEFLyuo2WxGMX3fDQPxWhy9mRHgln
	9QFZ1ksm1bytZQL61Dw+FAIH+/xLdPjCudIQXMM0c91DxvPf/E/KwpK1ejZjUatUVS0v
	LB4Qt6oiIaqoPCAIjET9m6u0T+1HT6ki8I1nHpNSQO5hUxBMKQnw8tGh6fDLosfCg+oa
	tCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uwpGvOL7gaRHC0rQNjuiSBiDmQby3JU/47HdlzAriD8=;
	b=AGglYr7w0PMROZJE3D54oxNNZchljlRSS8nK1Ps9Z1X/nmt+cnN86bU6DKHvNVVsXP
	whwf+fRO+BTe90yIn3AnUu24kMYd1+medldPEfuODGBw9/jS3UwWew3P9wE1mGO1mVOK
	hAqvO9/JF6O4OFDabWXWvYnl61wXwuC5xBxEz7uDgFpNKRpofdRU8IY4Cf3dPJaM4ZAx
	z2vV+a9tAB1yWv4q//vmbYLaw9cryTTMs/yGzzVCgf9y9TifzesjY4ktlMcl2L7EG0Ld
	U1J6juMzYvzTiJhOdZz6R9dthghM5MomLIn4/R8dqWK9NZIQ628Rtnw7jDvXyKnEUPJL
	0gSA==
X-Gm-Message-State: APjAAAWXEQ/9mnEhHYM5DHp6ajFGwOPG7+EPQjvkd7Gbi2L53BtbTrP3
	0eSYjnIynAP/iUmriKKVc3VYawjRO2PHmmsuvygGWQ==
X-Google-Smtp-Source: APXvYqzdQTaYNCrNZOFJL9FX4dzfroUAcr7aEX6vj+7TuHIAfRH3+hMjaptewFYVZn/jObBTCJvioC1vh3pHJF/BT4Q=
X-Received: by 2002:aca:4b04:: with SMTP id y4mr6001138oia.170.1556890844462; 
	Fri, 03 May 2019 06:40:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1556774049.git.alistair@alistair23.me>
	<PSXP216MB027781B1165E352FF6150A09DD340@PSXP216MB0277.KORP216.PROD.OUTLOOK.COM>
In-Reply-To: <PSXP216MB027781B1165E352FF6150A09DD340@PSXP216MB0277.KORP216.PROD.OUTLOOK.COM>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 May 2019 14:40:33 +0100
Message-ID: <CAFEAcA_bjcpvDOq=p+er3Lo9G7UfVgoXCtP87SknWTr8W=3aaw@mail.gmail.com>
To: Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-devel] [PATCH v1 1/5] hw/misc: Add the STM32F4xx
 Sysconfig device
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2 May 2019 at 06:40, Alistair Francis <alistair@alistair23.me> wrote:
>
> Signed-off-by: Alistair Francis <alistair@alistair23.me>

> +static void stm32f4xx_syscfg_set_irq(void *opaque, int irq, int level)
> +{
> +    STM32F4xxSyscfgState *s = opaque;
> +    int icrreg = irq / 4;
> +    int startbit = (irq & 3) * 4;
> +    uint8_t config = config = irq / 16;;

Stray double-semicolon.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

