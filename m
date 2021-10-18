Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 459024313CE
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 11:49:14 +0200 (CEST)
Received: from localhost ([::1]:54510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcPGb-0006WJ-DO
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 05:49:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcPEe-0004GO-Kk; Mon, 18 Oct 2021 05:47:12 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:51028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcPEc-0005Rf-GP; Mon, 18 Oct 2021 05:47:11 -0400
Received: by mail-wm1-x32f.google.com with SMTP id o24so753254wms.0;
 Mon, 18 Oct 2021 02:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TV8AWJAvr4x/pA9yXDfFoHorQ5cDEAuYXqUVmw1SKCA=;
 b=WtcfheA5TNYYjil6DOIluqN/wzbYmr5PjCHUKAAK+xzsIY/0fGUfcLfxcSEqYjSt/Z
 ta2AVOjNZC5g9VHnoC3TU+YSUEr47F4errrzjeFbhjp8RTZTEctRYja0p/LnwV1DUfLm
 tcYcMDQYr9gB+vURnTSl6JR1wXm07VBj/gHWWv7wOtreTrXhzO6AITEX1hdHf0e/UPNr
 J0PG6UGgnrOl776ZaWi7fzOKkU+t+leMDinHE9D9CMbwfhitWSz9t413X9RFxQbKCiad
 qxJIKyobXmm6iz1inR6aRYuRwPdR3HH0DtOzhPqsR/Gy5U/m9xw6JA0cwvOWEXZlNJv+
 T7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TV8AWJAvr4x/pA9yXDfFoHorQ5cDEAuYXqUVmw1SKCA=;
 b=o6rTOp9EkB0CP9y0QNJ8oKtbTOvuMtb7tmoACnRBeB03umLVCc3Hfz8+o3+QabHyvX
 r/dFX2P6LhIUpIj8LhDOPPZBrGP860/w3LALOeWnEPtmBxGrdaezir5FHxKCNz1tpz+y
 9zzGiXwYhFuI4q9cZxvDlf6qUXL4zY11o/nZlkXhY7821I17Nj6FH/GJXvRrdHZRPKji
 8YwVN2f+q70YWZHLCrUbjEW0D9CHJza9z67Sja6LRHR2DtsYtIwIISuxdR+QSfMfkUl6
 xetXOBed+Hk7ohO33aBy6rmPpMORCNhYKTBE1GBUUv/bIUor16dH5vL65hSZ/DovBHXJ
 J1tg==
X-Gm-Message-State: AOAM532fFt3PrtQ0GzSAfGUzupNwzAcFp73hx/whIQDATF2GMWtP6BMN
 1mSAQaT9tTMU6WeOs9xRqSE=
X-Google-Smtp-Source: ABdhPJy0JKTfk/EeAprJrzKgurMqpnKmo79c5OpOPIzUnO8tMAgnkNgHrNnwNLdb0zF8ZwBtiid++w==
X-Received: by 2002:a05:600c:892:: with SMTP id
 l18mr29806135wmp.89.1634550428618; 
 Mon, 18 Oct 2021 02:47:08 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id n12sm12544165wms.27.2021.10.18.02.47.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 02:47:08 -0700 (PDT)
Message-ID: <353c1b30-7621-54c5-5294-ebf1d8b3f8b8@amsat.org>
Date: Mon, 18 Oct 2021 11:47:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/2] hw/misc/bcm2835_property: Fix framebuffer with recent
 RPi kernels
Content-Language: en-US
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, qemu-devel@nongnu.org, 
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <5283e2811498034cc2de77f10eb16b9cd67a0698.camel@kernel.crashing.org>
 <0615f4a3-fba0-bb59-2405-4e1a080f8166@amsat.org>
 <4bab811367b2c1e813061d6f1048bbf9b4a2a606.camel@kernel.crashing.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <4bab811367b2c1e813061d6f1048bbf9b4a2a606.camel@kernel.crashing.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/18/21 02:41, Benjamin Herrenschmidt wrote:
> On Sun, 2021-10-17 at 17:08 +0200, Philippe Mathieu-Daudé wrote:
>> Hi Benjamin,
>>
>> On 10/17/21 09:48, Benjamin Herrenschmidt wrote:
>>> The framebuffer driver fails to initialize with recent Raspberry Pi
>>> kernels, such as the ones shipped in the current RaspiOS images
>>> (with the out of tree bcm2708_fb.c driver)
>>
>> Which particular version?
> 
> The one I dug out of 2021-05-07-raspios-buster-arm64-lite.img (note
> that this then fails to boot some time after the fb is setup, even
> after the fix, in the vchip driver init (before serial is up even).
> 
> That said, the same fb problem happens with 5.10.60-v8+ from raspbian.
> 
> I'm not sure your fix will work on these, see below:
> 
>> +        case 0x00040013: /* Get number of displays */
>> +            stl_le_phys(&s->dma_as, value + 12, 0 /* old fw: unique display */);
>> +            resplen = 4;
>> +            break;
>>
> This should have been equivalen to not having the property. However,
> the failure path in the driver looks like this (note the mismatch
> between the comment and the code.. this is rpi 5.10.73 from the rpi
> repo :
> 
> 	ret = rpi_firmware_property(fw,
> 				    RPI_FIRMWARE_FRAMEBUFFER_GET_NUM_DISPLAYS,
> 				    &num_displays, sizeof(u32));
> 
> 	/* If we fail to get the number of displays, or it returns 0, then
> 	 * assume old firmware that doesn't have the mailbox call, so just
> 	 * set one display
> 	 */
> 	if (ret || num_displays == 0) {
> 		dev_err(&dev->dev,
> 			"Unable to determine number of FBs. Disabling driver.\n");
> 		return -ENOENT;
> 	} else {
> 		fbdev->firmware_supports_multifb = 1;
> 	}
> 
> So it appears that the intention at some stage was to set only one display but
> the code as written will fail to initialize the drive if the properly is absent
> *or* if it returns 0.
> 
> I've just checked the rpi-5.15.y branch and it's the same.

Indeed. I stopped testing recent kernels because they use too many
features QEMU don't implement.

Our model should generate the DTB blob of devices implemented, instead
of giving false expectations to the guest by passing an unmodified dtb.

This is on my TODO, I might give it a try next WE.

