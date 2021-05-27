Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F22D3392AEA
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 11:36:56 +0200 (CEST)
Received: from localhost ([::1]:48794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmCRj-0000iK-Ke
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 05:36:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lmCPI-0007n5-Cm
 for qemu-devel@nongnu.org; Thu, 27 May 2021 05:34:24 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:35837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lmCPA-0007OO-4O
 for qemu-devel@nongnu.org; Thu, 27 May 2021 05:34:20 -0400
Received: by mail-ed1-x529.google.com with SMTP id y7so99601eda.2
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 02:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XSlFPWnITwgvY9GnhEgvfFmGNKC3hwkREGHbhIhW9qA=;
 b=Wlx5o/Nj1pJneYGARWdzPEB3+SM5ij3OOj/KGZIIZxrlk3upKS4Wv1DdTcs9XBuxl8
 lzyX1KDynywvMinf6km3j3lNCONkiJtbDpvGmWxFG1ZPNB62J0KpDvQ7JTga2RwjRNRc
 q+Mrij4u0KHxS7D9/cLHe6pYnQdvvwa14WNeH3WepXMMP0mS66ZqBHEozhNlhlQF89l+
 aHq+Ql8no+my4WjpuwhaZ1CLAfE7pMSxCqHt1RK283k986lcPeRGztyCf8zT7l+7mcuG
 TdU6IavLM7+USjH4HMRMky1SDngS+I+sUSDKPMtHvquMyvZMlCHvnL1/OKlTtIdMVwUd
 W4lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XSlFPWnITwgvY9GnhEgvfFmGNKC3hwkREGHbhIhW9qA=;
 b=ZSODs1+B3dMK51D7TKR0GZKTSaXBGfO+lhvb5KT7NaDneJmghTGWgBR+q+98nzsmCM
 aWN/9C5keTATfCxe9zzyO8aqSf6HLCMHl0GONECjDgVYiTANhxr60f0WfPg+M6MMFOe9
 C3g7yhTOQ8yDO1YlC7KPLL3o0Z9NnQ3kSu2pkDMAwEeJkaGuX4QtAzEISkhkKVozpehM
 H8trjr58PfHCgnsFvEQjaFsyk+XbS+QH9meGW9IR1nVdCQVCp6W2UMdVfdjMJ5xFKDcM
 4CftHQRObdrG+cJTRVz2idHssFaNligacKs6Lz0refgNpOXFcl9pbrMPrZevpga1eFGo
 +aPA==
X-Gm-Message-State: AOAM532q+2qAUSNWNJyWM7ZSmDFQuLjBrH0Q+gxJEc8nEkyp5FokUXo7
 gfzbz24SHcpHRqYZRhVrBXTW06h2cooG81jYRYMXtA==
X-Google-Smtp-Source: ABdhPJwz5bIHu5bS8tezhkBhy3BWvQystqVkWyQFVWyVx9QKSiwWyUtZV1XPLzqn0bxvGOVNBHnTU3S65wH377vA4Us=
X-Received: by 2002:a05:6402:190e:: with SMTP id
 e14mr3148634edz.146.1622108053126; 
 Thu, 27 May 2021 02:34:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210518194704.764241-1-venture@google.com>
 <20210518194704.764241-2-venture@google.com>
In-Reply-To: <20210518194704.764241-2-venture@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 May 2021 10:33:47 +0100
Message-ID: <CAFEAcA-WMC4OkzkyvH-wabcLsjThjZikLMxO5O9ALGknoY3=jg@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/arm: add quanta-gbs-bmc machine
To: Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>,
 CS20 KFTing <kfting@nuvoton.com>, Brandon Kim <brandonkim@google.com>,
 qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 18 May 2021 at 20:54, Patrick Venture <venture@google.com> wrote:
>
> Adds initial quanta-gbs-bmc machine support.
>
> Tested: Boots to userspace.
> Signed-off-by: Patrick Venture <venture@google.com>
> Reviewed-by: Brandon Kim <brandonkim@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> ---
>  hw/arm/npcm7xx_boards.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>
> diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
> index d4553e3786..34a214fe79 100644
> --- a/hw/arm/npcm7xx_boards.c
> +++ b/hw/arm/npcm7xx_boards.c
> @@ -29,6 +29,7 @@
>
>  #define NPCM750_EVB_POWER_ON_STRAPS 0x00001ff7
>  #define QUANTA_GSJ_POWER_ON_STRAPS 0x00001fff
> +#define QUANTA_GBS_POWER_ON_STRAPS 0x000017ff /* TODO: Get real values. */

Any chance you could fix this TODO ? If it's not fixed now before
the code goes in it seems unlikely that it'll ever be fixed -- you're
probably in the best position to know the right value...

>  static const char npcm7xx_default_bootrom[] = "npcm7xx_bootrom.bin";
>
> @@ -268,6 +269,22 @@ static void quanta_gsj_init(MachineState *machine)
>      npcm7xx_load_kernel(machine, soc);
>  }
>
> +static void quanta_gbs_init(MachineState *machine)
> +{
> +    NPCM7xxState *soc;
> +
> +    soc = npcm7xx_create_soc(machine, QUANTA_GBS_POWER_ON_STRAPS);
> +    npcm7xx_connect_dram(soc, machine->ram);
> +    qdev_realize(DEVICE(soc), NULL, &error_fatal);
> +
> +    npcm7xx_load_bootrom(machine, soc);
> +
> +    npcm7xx_connect_flash(&soc->fiu[0], 0, "mx66u51235f",
> +                          drive_get(IF_MTD, 0, 0));
> +
> +    npcm7xx_load_kernel(machine, soc);
> +}
> +
>  static void npcm7xx_set_soc_type(NPCM7xxMachineClass *nmc, const char *type)
>  {
>      NPCM7xxClass *sc = NPCM7XX_CLASS(object_class_by_name(type));
> @@ -316,6 +333,18 @@ static void gsj_machine_class_init(ObjectClass *oc, void *data)
>      mc->default_ram_size = 512 * MiB;
>  };
>
> +static void gbs_bmc_machine_class_init(ObjectClass *oc, void *data)
> +{
> +    NPCM7xxMachineClass *nmc = NPCM7XX_MACHINE_CLASS(oc);
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +
> +    npcm7xx_set_soc_type(nmc, TYPE_NPCM730);
> +
> +    mc->desc = "Quanta GBS (Cortex A9)";

"Cortex-A9", with a hyphen.


thanks
-- PMM

