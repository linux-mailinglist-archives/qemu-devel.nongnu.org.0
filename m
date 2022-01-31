Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC9D4A3E12
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 08:08:39 +0100 (CET)
Received: from localhost ([::1]:47060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEQnl-000212-FM
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 02:08:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEQPe-0006iZ-7U
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 01:43:46 -0500
Received: from [2607:f8b0:4864:20::102c] (port=52092
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEQPZ-00010l-Ix
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 01:43:38 -0500
Received: by mail-pj1-x102c.google.com with SMTP id q63so12994291pja.1
 for <qemu-devel@nongnu.org>; Sun, 30 Jan 2022 22:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=O3KWhBCDPYFSkCGhIBtPmmlCDjr3D1zTasIv/6/wYd8=;
 b=NJYIwiqkmUf43a8dAf7ML/19uujVldprdmhE8QVjci3qb9s6Y5cQKeBkkWab0bIZtx
 EKRI8degL981YBudPltTuYSVlR2foBUDlEdWDzVLqwbqmZ4w1VJoo01tw0pzPosFXmnM
 0SO1TDQ9dGkp9hqPKK1LpQ3GM+6cOTh9PVll5oFS5Uf6+HMJn+70QBcuJdwXMEekod9A
 3fGLjUHHX0yNY7EV5zrPelYRxUkoAQwiAaDep9C2bp+rUADTG/sJTd4SnGJXnSCW+vtb
 1Wzn9NH59QQVFCy5gqM/rKIM2LCB0j1Pe1KKBsw4vQ8779GApNO20QKKYef8w188VeUy
 3QpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=O3KWhBCDPYFSkCGhIBtPmmlCDjr3D1zTasIv/6/wYd8=;
 b=bggjs/ZqyChF4bp8tQjFin1PepN5NXEkQN3oGhxtOHxt1vLYWSBdU6NH8eT6RZ4DT6
 CFKtXGeQ3RdQ+4VexeAbwB0ckqZEcFiaSnjqF0noK7JgoAftpQBkx621NUzLRuIU20dP
 YXD2CFUTu9RRTtdrahIiIuwf0yUHyh1SvmAlm67pA8Iu900S75mNaRr0bRWBKj9UNkcL
 js4aRRQRm2gxd4sCwLJCrW3bHUUcD80NNeBYGo5GoEgK4KJJ0ok3zJOIUKghFKFHb0ae
 1GrqX3a0/2Sc32UYR/BLWcY3HvzHbEUATkXcCY2ET8FsZb+uLH1wQiLTQrb0Z2NcbNOM
 3NOg==
X-Gm-Message-State: AOAM530xYJD1VZfBZOzcokHjP38WoENsyAwvm796IBwx+UqKY7fn9hIe
 uzur0gEEyiuIZ/vTP6WrWdVYvQ==
X-Google-Smtp-Source: ABdhPJygD+nohy2962Qqkkfeei6Lkl7y03kAslDCSs944Hjm0pG+obMAV9J65eFQQzRz22dl39ziBw==
X-Received: by 2002:a17:90a:8c8b:: with SMTP id
 b11mr434051pjo.197.1643611415092; 
 Sun, 30 Jan 2022 22:43:35 -0800 (PST)
Received: from [192.168.15.130] ([60.231.85.5])
 by smtp.gmail.com with ESMTPSA id h17sm11695068pfv.198.2022.01.30.22.43.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jan 2022 22:43:34 -0800 (PST)
Message-ID: <63a2ba3b-18fd-5a55-34f2-f9aa20466edf@linaro.org>
Date: Mon, 31 Jan 2022 17:43:23 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 04/16] hw/arm: imx: Don't enable PSCI conduit when booting
 guest in EL3
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
 <20220127154639.2090164-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220127154639.2090164-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
> Change the iMX-SoC based boards to use the new boot.c functionality
> to allow us to enable psci-conduit only if the guest is being booted
> in EL1 or EL2, so that if the user runs guest EL3 firmware code our
> PSCI emulation doesn't get in its way.
> 
> To do this we stop setting the psci-conduit property on the CPU
> objects in the SoC code, and instead set the psci_conduit field in
> the arm_boot_info struct to tell the common boot loader code that
> we'd like PSCI if the guest is starting at an EL that it makes
> sense with.
> 
> This affects the mcimx6ul-evk and mcimx7d-sabre boards.
> 
> Note that for the mcimx7d board, this means that when running guest
> code at EL3 there is currently no way to power on the secondary CPUs,
> because we do not currently have a model of the system reset
> controller module which should be used to do that for the imx7 SoC,
> only for the imx6 SoC.  (Previously EL3 code which knew it was
> running on QEMU could use a PSCI call to do this.) This doesn't
> affect the imx6ul-evk board because it is uniprocessor.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> I don't have the i.mx7 manual to hand, so I'm partly making
> assumptions based on the i.mx6 behaviour. If somebody with the
> manual could double-check that it does indeed start up with the
> secondary CPUs powered down via the SRC that would be great.
> ---
>   hw/arm/fsl-imx6ul.c    | 2 --
>   hw/arm/fsl-imx7.c      | 8 ++++----
>   hw/arm/mcimx6ul-evk.c  | 1 +
>   hw/arm/mcimx7d-sabre.c | 1 +
>   4 files changed, 6 insertions(+), 6 deletions(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

