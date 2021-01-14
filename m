Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C542F693B
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 19:18:59 +0100 (CET)
Received: from localhost ([::1]:54550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l07D0-0004LL-KD
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 13:18:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1l06Ap-0007qW-Pi
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:12:39 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1l06Am-0001aB-GY
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:12:39 -0500
Received: by mail-wr1-x436.google.com with SMTP id d26so6552899wrb.12
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 09:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qi9+F5K/4kbWAdzeSzPjCTkIDLkSfOKn9XAu1INEErU=;
 b=CBJCglbOg1ZzkN2oOd+oargykW76CmiV8V6EAOF3Ms/9Tahdt/G+YB04yQLW9s//Af
 VBIZlVWM+Uu7yc88FqX+tx/LhQxvcnwjRh3rkvCqISbuyOG64ECsFnu5hE6XiXiTHdFd
 Z0Qb5u9X52qFk59maTVjD1fSrG174ScIZMzCrsL9mnE5mVhEt4Y20+mdJqPTFfy//TjY
 xDnCrSiVomi/LcGsRwN5Xhi77JfUzuG+jhPDeiFu3z6RQL7RdptscshG041roSCCZZRf
 jh6ZBFrx1ifojRrC/8ULbgJsocW4RHL4kq1PPIYvLHoh4g82BjycG5AWg4kisqu7QIx0
 gNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qi9+F5K/4kbWAdzeSzPjCTkIDLkSfOKn9XAu1INEErU=;
 b=dIlcDSBAhjYhoIEt7MRVfn/EmwXH5gihZwBpvR1kagSFZZxP9V0UBDR6OwDTa9ekFm
 n54kBnfDnhNG1vo2RVJPZXLg12PdXUArcG52PA2MDHFQwP3kMTvfFTk0VbC5ZuRxcwej
 3xHeRNgMw9vqV6KDEj/uMI/BzwE7PAHo9jmRJxkSEKTbZdGRjs263WQqYGGI2eXSItTh
 aryr1ymcjdRIM9tGF2V7TaxUrqIzdYG14TBovwevy6ZqWe3KiHgIvORX6lr9mEhMyjvi
 qhD7HXmFfvtcnxfdd4/PnVM25O8lXyLDahKTn4uq+jBkjiA1eUab/WvrcGCUtXgGr77m
 DeGQ==
X-Gm-Message-State: AOAM531+0G5Otr3L3gJjkslHH8Ep/xRFdBCIO/gHCtUapqtXAx9ztIlW
 4e4FUpB5+9MYlM9b4GuEMAA4+6pn2qPF6S6cNoqhmw==
X-Google-Smtp-Source: ABdhPJxgr2+sI6fnimuRWU3Ta12/u9w/ildw8zi0lFJkJ0p0KXblIDBAsAmRaDcAaY3ud05stVEhn0pllHAdAr7NX9A=
X-Received: by 2002:a5d:61ca:: with SMTP id q10mr9076983wrv.124.1610644353449; 
 Thu, 14 Jan 2021 09:12:33 -0800 (PST)
MIME-Version: 1.0
References: <20210114150902.11515-1-bmeng.cn@gmail.com>
 <20210114150902.11515-10-bmeng.cn@gmail.com>
In-Reply-To: <20210114150902.11515-10-bmeng.cn@gmail.com>
Date: Thu, 14 Jan 2021 09:12:20 -0800
Message-ID: <CAFQmdRYeCLgv2-y8G3pnwAKgGgMOJ5E=60mVC_XdmZZy86+wZw@mail.gmail.com>
Subject: Re: [PATCH 9/9] hw/ssi: npcm7xx_fiu: Correct the dummy cycle
 emulation logic
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=hskinnemoen@google.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Tyrone Ting <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Havard Skinnemoen <hskinnemoen@google.com>
From: Havard Skinnemoen via <qemu-devel@nongnu.org>

On Thu, Jan 14, 2021 at 7:10 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> I believe send_dummy_bits() should also be fixed, but I really don't
> know how based on my pure read/guess of the codes since there is no
> public datasheet available for this NPCM7xx SoC.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Just a quick comment before I look at the rest of the patch series:
The emulated dummy bits behavior has a lot more to do with what the
m25p80 emulator seemed to expect than the actual NPCM7xx behavior. If
the m25p behavior now interprets the dummy cycles the same way as the
rest of the cycles, this change seems correct, but you're right that
send_dummy_bits probably needs some attention as well.

I _think_ it's just a matter of turning this:

        for (j = 0; j < 8; j += bits_per_clock) {
            ssi_transfer(spi, extract32(uma_cmd, field + j, bits_per_clock));
        }

into this:

        ssi_transfer(spi, extract32(uma_cmd, field, BITS_PER_BYTE));

which might have the very nice side effect of speeding up SPI flash
access quite a bit.

Thanks a lot for looking into this.

>
> ---
>
>  hw/ssi/npcm7xx_fiu.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/hw/ssi/npcm7xx_fiu.c b/hw/ssi/npcm7xx_fiu.c
> index 5040132b07..e76fb5ad9f 100644
> --- a/hw/ssi/npcm7xx_fiu.c
> +++ b/hw/ssi/npcm7xx_fiu.c
> @@ -150,7 +150,7 @@ static uint64_t npcm7xx_fiu_flash_read(void *opaque, hwaddr addr,
>      NPCM7xxFIUState *fiu = f->fiu;
>      uint64_t value = 0;
>      uint32_t drd_cfg;
> -    int dummy_cycles;
> +    int dummy_bytes;
>      int i;
>
>      if (fiu->active_cs != -1) {
> @@ -180,10 +180,8 @@ static uint64_t npcm7xx_fiu_flash_read(void *opaque, hwaddr addr,
>          break;
>      }
>
> -    /* Flash chip model expects one transfer per dummy bit, not byte */
> -    dummy_cycles =
> -        (FIU_DRD_CFG_DBW(drd_cfg) * 8) >> FIU_DRD_CFG_ACCTYPE(drd_cfg);
> -    for (i = 0; i < dummy_cycles; i++) {
> +    dummy_bytes = FIU_DRD_CFG_DBW(drd_cfg) >> FIU_DRD_CFG_ACCTYPE(drd_cfg);
> +    for (i = 0; i < dummy_bytes; i++) {
>          ssi_transfer(fiu->spi, 0);
>      }
>
> --
> 2.25.1
>

