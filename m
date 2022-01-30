Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9694A3AAC
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Jan 2022 23:18:59 +0100 (CET)
Received: from localhost ([::1]:43280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEIXC-0007cr-0B
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 17:18:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEIUH-0004rO-LO
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 17:15:57 -0500
Received: from [2607:f8b0:4864:20::52f] (port=45569
 helo=mail-pg1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEIUB-0008P8-FK
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 17:15:55 -0500
Received: by mail-pg1-x52f.google.com with SMTP id z131so10512810pgz.12
 for <qemu-devel@nongnu.org>; Sun, 30 Jan 2022 14:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hTBvTaxCwRtCqwxIprtOuuKoCPAExvByAvPKwtkc1dY=;
 b=uthbLygFpxwP+rr6edEegmXDQZIxuC+G+UxE6WeCHf0d64dW3e7dqP9ZX41G+Ip8dH
 XcM0Lmj4acdgbCJHlRl4AlKfaX8uop37tBQQDXI2YH7xg4EMYtQUEXuJgUc3k99sMjnS
 2ZDcAy7xWfRsNgE7zG46U27gcO8E7Y3gEWSrzHeCJ7M/RNeVNQiCeCSqA2upKRE5PAbv
 UTPwt2cQNGNM98L3HhdBLj2m+xvkKgeyw7GGjnkkNW3lDvwVLvgAvjkm9iVyNBnNdac1
 7kwdd3AoHoARkvNZj6owlXQYBDV0gfX1tBFQ1scIT4sQitAHxtkqjSRGvtYHuVl0hnwL
 EoCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hTBvTaxCwRtCqwxIprtOuuKoCPAExvByAvPKwtkc1dY=;
 b=af9hz0JAiS4uVLiJ4uAf2GXjX4bZDJVafdlgkpA659vNN1oCTBMmzSg26XOf8/p8yY
 9wfaqIhdRDYrjF9IhtfLzgF/glHHgHIHRJOi8GSsMm0h0vZvZjfgh/S9otyAXRFkh6c+
 wVJ8hMnrZJuPQj6tQCIT0MkzruqRcPzjYXvnZOuFaE+++oQ6+Ck3RpDGoUVK0Yl5+r6i
 HI06ouHWI8zwVGj3vfi5CX8/qbAV/HfdQDtalPbpX0usfK570aBS8YKxmqFyl3MNMhX2
 zdwHTcH1zP3LpqAlu9doDq23pHBTgrL0ggw/AhY2VfI4krszB0Ra35yKg8a6bKKAaBzj
 HGwA==
X-Gm-Message-State: AOAM533F3TnRqKKNhz1t2nrZwWiO5+/3lyb61INdbEYs2zh6BCUw/cdZ
 wMkTvQpZrLC/zdBjxrcqrIyKUw==
X-Google-Smtp-Source: ABdhPJwdmI6tQpC6Ruy3hWmh8UJ95AzJCxFx5p906FXw/X4AnJnUBBRv9NB5YsEaYFL64rangP31xw==
X-Received: by 2002:a05:6a00:8d2:: with SMTP id
 s18mr17429512pfu.5.1643580927992; 
 Sun, 30 Jan 2022 14:15:27 -0800 (PST)
Received: from [192.168.2.37] (240.194.168.125.sta.wbroadband.net.au.
 [125.168.194.240])
 by smtp.gmail.com with ESMTPSA id l26sm26671388pgm.73.2022.01.30.14.15.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jan 2022 14:15:27 -0800 (PST)
Message-ID: <7d4dff61-f75b-4243-9008-506c9c715dea@linaro.org>
Date: Mon, 31 Jan 2022 09:15:15 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 03/16] hw/arm/boot: Support setting psci-conduit based on
 guest EL
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
 <20220127154639.2090164-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220127154639.2090164-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <eduardo@habkost.net>, Rob Herring <robh@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Andre Przywara <andre.przywara@arm.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Beniamino Galvani <b.galvani@gmail.com>, Tyrone Ting <kfting@nuvoton.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Alexander Graf <agraf@csgraf.de>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/22 02:46, Peter Maydell wrote:
> Currently we expect board code to set the psci-conduit property on
> CPUs and ensure that secondary CPUs are created with the
> start-powered-off property set to false, if the board wishes to use
> QEMU's builtin PSCI emulation.  This worked OK for the virt board
> where we first wanted to use it, because the virt board directly
> creates its CPUs and is in a reasonable position to set those
> properties.  For other boards which model real hardware and use a
> separate SoC object, however, it is more awkward.  Most PSCI-using
> boards just set the psci-conduit board unconditionally.
> 
> This was never strictly speaking correct (because you would not be
> able to run EL3 guest firmware that itself provided the PSCI
> interface, as the QEMU implementation would overrule it), but mostly
> worked in practice because for non-PSCI SMC calls QEMU would emulate
> the SMC instruction as normal (by trapping to guest EL3).  However,
> we would like to make our PSCI emulation follow the part of the SMCC
> specification that mandates that SMC calls with unknown function
> identifiers return a failure code, which means that all SMC calls
> will be handled by the PSCI code and the "emulate as normal" path
> will no longer be taken.
> 
> We tried to implement that in commit 9fcd15b9193e81
> ("arm: tcg: Adhere to SMCCC 1.3 section 5.2"), but this
> regressed attempts to run EL3 guest code on the affected boards:
>   * mcimx6ul-evk, mcimx7d-sabre, orangepi, xlnx-zcu102
>   * for the case only of EL3 code loaded via -kernel (and
>     not via -bios or -pflash), virt and xlnx-versal-virt
> so for the 7.0 release we reverted it (in commit 4825eaae4fdd56f).
> 
> This commit provides a mechanism that boards can use to arrange that
> psci-conduit is set if running guest code at a low enough EL but not
> if it would be running at the same EL that the conduit implies that
> the QEMU PSCI implementation is using.  (Later commits will convert
> individual board models to use this mechanism.)
> 
> We do this by moving the setting of the psci-conduit and
> start-powered-off properties to arm_load_kernel().  Boards which want
> to potentially use emulated PSCI must set a psci_conduit field in the
> arm_boot_info struct to the type of conduit they want to use (SMC or
> HVC); arm_load_kernel() will then set the CPUs up accordingly if it
> is not going to start the guest code at the same or higher EL as the
> fake QEMU firmware would be at.
> 
> Board/SoC code which uses this mechanism should no longer set the CPU
> psci-conduit property directly.  It should only set the
> start-powered-off property for secondaries if EL3 guest firmware
> running bare metal expects that rather than the alternative "all CPUs
> start executing the firmware at once".
> 
> Note that when calculating whether we are going to run guest
> code at EL3, we ignore the setting of arm_boot_info::secure_board_setup,
> which might cause us to run a stub bit of guest code at EL3 which
> does some board-specific setup before dropping to EL2 or EL1 to
> run the guest kernel. This is OK because only one board that
> enables PSCI sets secure_board_setup (the highbank board), and
> the stub code it writes will behave the same way whether the
> one SMC call it makes is handled by "emulate the SMC" or by
> "PSCI default returns an error code". So we can leave that stub
> code in place until after we've changed the PSCI default behaviour;
> at that point we will remove it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/arm/boot.h | 10 +++++++++
>   hw/arm/boot.c         | 50 +++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 60 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

