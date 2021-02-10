Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CF1316933
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 15:34:21 +0100 (CET)
Received: from localhost ([::1]:52176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9qZQ-00043x-Kp
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 09:34:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berardi.dav@gmail.com>)
 id 1l9qXc-00031x-NH; Wed, 10 Feb 2021 09:32:28 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:35475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berardi.dav@gmail.com>)
 id 1l9qXa-00024O-St; Wed, 10 Feb 2021 09:32:28 -0500
Received: by mail-wm1-x332.google.com with SMTP id n10so148496wmq.0;
 Wed, 10 Feb 2021 06:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=l6LZ6aM2GsCm8qIVLfFuDOqLW3QUaWdw+Cv85kJu8CQ=;
 b=kYsMsGHK8gzNzQ1rBBtV4LhrUsEeb4NFd7QB9BB2LRuUgGyXBb7pu1u0DYqF0EQOjk
 0kOsfLqU5zlN4RF6xlO/v0P/FP0dptazzLUgRC6+Aqnb+rjOLMC8vigJG26btC4fNsyF
 1Mw2XN+Hv2GkBtkgQTsdsSPZZAISqOTxTqypteuSc77oePI76s1mHsQJ2wT+rwSo/8Pt
 c615IoVJ7anQN/KtYXCl7aSbKCtz1iIeQlOAcW1krM2pUD4DDUt0dYGgd5wsgckYeeSJ
 2e/h59WBW8CSV9b9GKDInaohWhZIPEsJrfL8Xm0jFI9Pkel49ndo2HYDqBnzTZVlND+c
 W93Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=l6LZ6aM2GsCm8qIVLfFuDOqLW3QUaWdw+Cv85kJu8CQ=;
 b=izDJZoNXMKXt+A148VutZRHvMAgClTfaY/cjdoFkY3HJRHRbW76euA9VkLHE3v5vMW
 oR1OkQLFnsU0zb5blhqVI/mJzzmoPhDCmamVCUj6iZSH04edJiAUQof/DNtOgxMHCTeh
 SZCz5ly7S0PM0y7zXCcM6rw7LGm+WXxVA8kMA5/uXQyxgUJjEv3+meI0JRJsROpJv2io
 vwozY9cCyGrYS4pyU2ascdTiaxTSc5uyEJrPc/2XlRk2P/ZcPY+IHlBbfXFm3sKOq9eP
 URsUFJTifJxg1MNxarl0LzNiD8h9xG0umWw6MJ14Mg8vWRq7Gu+ebsKj3ZDLHxi8DwgA
 BTRA==
X-Gm-Message-State: AOAM532F5YOn0EMn2KPn+DH/iersnoeOxxmNznOgJn825MnyJPiKLGy4
 b/Z64YSKYtw9C9aXt768TH0=
X-Google-Smtp-Source: ABdhPJwObbdnmN1RPeD0CU/WDJA5/vL7ISMVS2tdKqVznE9s8pIYRjjreSaWeU+TBA6uOEWDHbE4cw==
X-Received: by 2002:a05:600c:d9:: with SMTP id
 u25mr3261931wmm.49.1612967544230; 
 Wed, 10 Feb 2021 06:32:24 -0800 (PST)
Received: from localhost ([37.162.14.172])
 by smtp.gmail.com with ESMTPSA id 64sm4117249wrc.50.2021.02.10.06.32.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 06:32:23 -0800 (PST)
Date: Wed, 10 Feb 2021 15:32:19 +0100
From: Davide Berardi <berardi.dav@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH] Raspberry PI GPIO interrupt support
Message-ID: <20210210143219.GA95384@carpenter.lan>
References: <20210209110252.GA14409@carpenter.lan>
 <355f1271-09c9-715a-a909-c0f05060dfe5@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <355f1271-09c9-715a-a909-c0f05060dfe5@amsat.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=berardi.dav@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Dear Philippe, thank you for your kind response.

I will send a new version for the patch with the modifications you've
highlighted, but first I've some question on the best way to implement
them.

On Tue, Feb 09, 2021 at 12:30:32PM +0100, Philippe Mathieu-Daud=E9 wrote:
>Hi Davide,
>On 2/9/21 12:02 PM, Davide Berardi wrote:
>> The bcm2835 GPIOs now generate interrupts.
>> This modification enables QTEST clients to trigger interrupt-based
>> interfaces.
>
>Thanks for your patch!
>
>Can you provide QTEST client example? Even better would be a qtest!
>
The minimal client I've developed can be found at
https://github.com/berdav/qemu-rpi-gpio

As I have introduced, I'm building a qtest but I've found a problem: In
my test, I want to check if the IRQs of the named GPIOs
/machine/soc/peripherals/ic/gpu-irq are correctly handled by the
controller.  I was thinking to use irq_intercept_in to get the status of
the IRQ lines using something similar to the following:

qtest_irq_intercept_in(s, "/machine/soc/peripherals/ic");

And then check it using

qtest_get_irq(s, 49 + irqline);

But it isn't triggering.

Looking in the source of qtest I've found this check in the
qtest_irq_intercept_in function:

          QLIST_FOREACH(ngl, &dev->gpios, node) {
              /* We don't support intercept of named GPIOs yet */
              if (ngl->name) {
                  continue;
              }

I've removed the if and the qtests seems to work just fine.
Is there particular caveats or details to implement this part of the
framework?

I can send separated patches if you have some details on the desiderata
of the support, or maybe start a new thread with this question.

Otherwise, I can remove the part of my qtest to not check the
IRQs, but I don't know if it would be the best choice.

>
>I wonder how you generated your patch, it doesn't apply:
>
>Applying: Raspberry PI GPIO interrupt support
>error: patch failed: hw/arm/bcm2835_peripherals.c:114
>error: hw/arm/bcm2835_peripherals.c: patch does not apply
>error: patch failed: hw/gpio/bcm2835_gpio.c:7
>error: hw/gpio/bcm2835_gpio.c: patch does not apply
>error: patch failed: hw/intc/bcm2835_ic.c:57
>error: hw/intc/bcm2835_ic.c: patch does not apply
>error: patch failed: include/hw/gpio/bcm2835_gpio.h:7
>error: include/hw/gpio/bcm2835_gpio.h: patch does not apply
>Patch failed at 0001 Raspberry PI GPIO interrupt support
>
>You can find the guidelines here:
>https://wiki.qemu.org/Contribute/SubmitAPatch#Submitting_your_Patches
>
I have just created the patch using git format patch -s , it does not
give me any error applying it over the master branch on
https://github.com/qemu/QEMU . I will take more care and apply it on the
master branch of https://git.qemu.org/git/qemu.git/ , thank you.

> [... cut ...]
>
>Regards,
>
>Phil.
I'm adapting the patch using the Coding style script now.
I've also introduced a new costant for the number of GPIOs.

Thank you for your time,
D.

