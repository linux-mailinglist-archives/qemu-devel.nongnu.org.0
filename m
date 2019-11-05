Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 326A4EFC40
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Nov 2019 12:21:36 +0100 (CET)
Received: from localhost ([::1]:43034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iRwty-0000nO-N9
	for lists+qemu-devel@lfdr.de; Tue, 05 Nov 2019 06:21:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42673)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iRwsj-0000Cg-Iw
 for qemu-devel@nongnu.org; Tue, 05 Nov 2019 06:20:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iRwsi-0000Gv-85
 for qemu-devel@nongnu.org; Tue, 05 Nov 2019 06:20:17 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:45843)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iRwsi-0000D7-16
 for qemu-devel@nongnu.org; Tue, 05 Nov 2019 06:20:16 -0500
Received: by mail-wr1-x444.google.com with SMTP id q13so20890375wrs.12
 for <qemu-devel@nongnu.org>; Tue, 05 Nov 2019 03:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ilgO7SfmihSmTh5BQJrg1fDf0Z9tdYBptuuIxp/vml0=;
 b=mmOHbfQ0tYi/Cxp5cWQ75UuwQKOk/K9YmlBacKYhwlap7L9Xev74XLI7GIJ/GLZkv3
 DhR5qcrfRW0lzFFeVFnnWXlolahuUDi2+nuUKf6O+DJz3BSYV4hH9oX0QBbojm9/N7jg
 KEsk0KyUlk9hMSIiNoPtLbEIha1ETqvl/MNbpP8eLsqZCH7lY4HLPBGrmyWB3MgoZ7qk
 vw0nmA3EURzlDFET5aMMgfkC730QNk5g5pAIxxXLrFMYx3SEnQtIrWnJw8+J3wffasJ/
 z2zVtUyEtC94L7m+LOlWpNTZUGhpFpQESfsVmVulvAjRqmnbL9TsLQIbSJyDctCY255z
 Vr6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ilgO7SfmihSmTh5BQJrg1fDf0Z9tdYBptuuIxp/vml0=;
 b=aoUlsNw6ovLtHleCByOr5dmBR+1MNQIm3323VtA2tKFtroaPS92eyghGkagUONJr7j
 p8ilwR5ImyZTPdVBMJvrJRmR2xwdvvl4wTjeLbtM1dEWsmGTfaT+cuoxBKWCLFpha/v8
 epe7b2Y5SZFuIA/T8Xmd62alj5EcEwCINvmRs9xm0JwfffvrZsjIUTpBQ/H7dVhOfnPk
 PKIvUULEfIBwv/tVKGkJo9vqvlH47yMnL5EanrPCbkI9dRZoB9zDoKmBtx+iCPuvKHC0
 rN9AhSRJqw748+g+G+mqFjEhAGYCzZhuB3bkjX85MLdxYlgw6JYTunbetRQrm2LWu5cP
 Uc7g==
X-Gm-Message-State: APjAAAVFIrWFkuCgsWclJhhF0TDi/JUYHbYD43DVpvma7yNNCEz2ZOu/
 24jwRxqahrYWHHWWpgEkX+G+BWMXEE9lJQ==
X-Google-Smtp-Source: APXvYqyXzbn21kN9R042Uz6h/18pqxBW7E44VD9AnS3f6e1s9yYNU9dztMucrvZv0yabDQswlA160A==
X-Received: by 2002:a5d:6706:: with SMTP id o6mr28212692wru.54.1572952814601; 
 Tue, 05 Nov 2019 03:20:14 -0800 (PST)
Received: from [192.168.8.102] (228.red-2-141-116.dynamicip.rima-tde.net.
 [2.141.116.228])
 by smtp.gmail.com with ESMTPSA id t10sm21683653wrw.23.2019.11.05.03.20.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 Nov 2019 03:20:13 -0800 (PST)
Subject: Re: [PATCH] hw/arm/pxa2xx: rebuild hflags cache when modifying CPU
 state
To: Peter Maydell <peter.maydell@linaro.org>,
 Luc Michel <luc.michel@greensocs.com>
References: <20191101103232.3692818-1-luc.michel@greensocs.com>
 <CAFEAcA96tfJNVrnQzKyzooy7sJ__WKWWHXdAy_TNy=hSB_DOQQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <aff8e672-e0c7-a0f5-9c53-403a2e57524d@linaro.org>
Date: Tue, 5 Nov 2019 12:20:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA96tfJNVrnQzKyzooy7sJ__WKWWHXdAy_TNy=hSB_DOQQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/1/19 11:42 AM, Peter Maydell wrote:
> The other place that might need checking is the PSCI/etc
> code for doing CPU power on/off (and other callers to the
> power up/down functions like the imx6 power control regs).
> Richard, did you look at that code to see if it needed hflags updates?

I had a quick grovel through hw/misc/imx6_src.c and didn't see anything; was
there something more specific you were thinking of?


r~

