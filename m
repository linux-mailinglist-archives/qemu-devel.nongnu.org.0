Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A66659867
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 13:45:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBEYH-0004mz-QE; Fri, 30 Dec 2022 07:31:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBEY2-0004jV-Fe
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 07:31:44 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBEY0-0001MW-71
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 07:31:41 -0500
Received: by mail-wr1-x429.google.com with SMTP id w1so7676190wrt.8
 for <qemu-devel@nongnu.org>; Fri, 30 Dec 2022 04:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oJzcBFzg7pIOQa/da8s6FCBWPV6la6FFq85YAwtjEko=;
 b=Rkdy2g/t19ardE78uL2TaNMWOUNABfhpBxF+atSH8Y1Fkcaf6zsEUQW8ufdGBnq5Ky
 zp6aRtBdZ+gkuImGv5w7q9lc8tisgvKzzNZPyqwMlBfgTPBEgWprKSoYhmi7urdjDOHr
 omz0pyqhhYRhNkrTqZppOhoxOopcZb9vxGrCT5sXGonFwBU4i3O4H9qnHhZJFKiy/wCD
 /UV7MuWPTJh3SQGFQkuzXvIPGb/BucSzwovcoGikB24afLz3bjcTRAyOG+qqMZjhqEiY
 dlHX6G/ZVtTaFRGH6fFOXpW397gZGAs+lp7twH2u4W+PUTo12KnhO3DOyFwC6dmG27pd
 R8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oJzcBFzg7pIOQa/da8s6FCBWPV6la6FFq85YAwtjEko=;
 b=yl2eKMhePfJUY6JZxYevzSUhlkztTC9XELvml6Pxki62WSUECyh3K6RecmRhskApP3
 RNPY78xajDZ78af4JgqSBxM7LZBXfu2xUGl+8wAChxk8j+kQ7l/UrX7zKj2CzfcyzpJW
 7o7iKTL/AtCt3GOiAyZ8nzeFa++29TiIGOiQvIOR1rIXgVXnJOYE/6hf03QU7pZTzwBI
 U8rol8ERn7VdWfV7Iq66BjJlxprGDPOfQBiYMVPYQxkPi8hPHURSCgr1zuv8JtDkf+2r
 POYCWTbDRHBcoTiZyRHO4t8/LkQ+1yqroHes9oDDqfgxFk3185IfKRQTYHXPNB90X//q
 cu8g==
X-Gm-Message-State: AFqh2kra7SLvrWd6zSD2JpgerZwUcYNyG68Plnnmz5y/LqQHy/CFQW14
 vcF5WrzSvYX28LOO1F0ToUGpxETomdeQdj2U
X-Google-Smtp-Source: AMrXdXt2VC9O0iPOsrq1HhzOy/l0i8go3r4fGaOQUcOfL74WYjUhDFw+hHV1oxoZGE0dyzmLgWtl6Q==
X-Received: by 2002:a5d:6b87:0:b0:26f:8bfc:98ff with SMTP id
 n7-20020a5d6b87000000b0026f8bfc98ffmr17077342wrx.38.1672403498306; 
 Fri, 30 Dec 2022 04:31:38 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 ay19-20020a5d6f13000000b0022cdeba3f83sm1251568wrb.84.2022.12.30.04.31.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Dec 2022 04:31:37 -0800 (PST)
Message-ID: <90de6d57-25e1-d20f-15e3-069e06ef2f00@linaro.org>
Date: Fri, 30 Dec 2022 13:31:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 02/11] hw/watchdog/wdt_aspeed: Extend MMIO range to
 cover more registers
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Troy Lee <troy_lee@aspeedtech.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Peter Delevoryas <peter@pjd.dev>, Steven Lee <steven_lee@aspeedtech.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Peter Delevoryas <pdel@fb.com>,
 Peter Delevoryas <pdel@meta.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>
References: <20221230113504.37032-1-philmd@linaro.org>
 <20221230113504.37032-3-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221230113504.37032-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 30/12/22 12:34, Philippe Mathieu-Daudé wrote:
> When booting the Zephyr demo in [1] we get:
> 
>    aspeed.io: unimplemented device write (size 4, offset 0x185128, value 0x030f1ff1) <--
>    aspeed.io: unimplemented device write (size 4, offset 0x18512c, value 0x03fffff1)
> 
> This corresponds to this Zephyr code [2]:
> 
>    static int aspeed_wdt_init(const struct device *dev)
>    {
>      const struct aspeed_wdt_config *config = dev->config;
>      struct aspeed_wdt_data *const data = dev->data;
>      uint32_t reg_val;
> 
>      /* disable WDT by default */
>      reg_val = sys_read32(config->ctrl_base + WDT_CTRL_REG);
>      reg_val &= ~WDT_CTRL_ENABLE;
>      sys_write32(reg_val, config->ctrl_base + WDT_CTRL_REG);
> 
>      sys_write32(data->rst_mask1,
>                  config->ctrl_base + WDT_SW_RESET_MASK1_REG);   <------
>      sys_write32(data->rst_mask2,
>                  config->ctrl_base + WDT_SW_RESET_MASK2_REG);
> 
>      return 0;
>    }
> 
> The register definitions are [3]:
> 
>    #define WDT_RELOAD_VAL_REG          0x0004
>    #define WDT_RESTART_REG             0x0008
>    #define WDT_CTRL_REG                0x000C
>    #define WDT_TIMEOUT_STATUS_REG      0x0010
>    #define WDT_TIMEOUT_STATUS_CLR_REG  0x0014
>    #define WDT_RESET_MASK1_REG         0x001C
>    #define WDT_RESET_MASK2_REG         0x0020
>    #define WDT_SW_RESET_MASK1_REG      0x0028   <------
>    #define WDT_SW_RESET_MASK2_REG      0x002C
>    #define WDT_SW_RESET_CTRL_REG       0x0024
> 
> Currently QEMU only cover a MMIO region of size 0x20:
> 
>    #define ASPEED_WDT_REGS_MAX        (0x20 / 4)
> 
> Change to map the whole 'iosize' which might be bigger, covering
> the other registers. The MemoryRegionOps read/write handlers will
> report the accesses as out-of-bounds guest-errors, but the next
> commit will report them as unimplemented.

I'll amend here for clarity:

---

Memory layout before this change:

   (qemu) info mtree -f
     ...
     000000007e785000-000000007e78501f (prio 0, i/o): aspeed.wdt
     000000007e785020-000000007e78507f (prio -1000, i/o): aspeed.io 
@0000000000185020
     000000007e785080-000000007e78509f (prio 0, i/o): aspeed.wdt
     000000007e7850a0-000000007e7850ff (prio -1000, i/o): aspeed.io 
@00000000001850a0
     000000007e785100-000000007e78511f (prio 0, i/o): aspeed.wdt
     000000007e785120-000000007e78517f (prio -1000, i/o): aspeed.io 
@0000000000185120
     000000007e785180-000000007e78519f (prio 0, i/o): aspeed.wdt
     000000007e7851a0-000000007e788fff (prio -1000, i/o): aspeed.io 
@00000000001851a0

After:

   (qemu) info mtree -f
     ...
     000000007e785000-000000007e78507f (prio 0, i/o): aspeed.wdt
     000000007e785080-000000007e7850ff (prio 0, i/o): aspeed.wdt
     000000007e785100-000000007e78517f (prio 0, i/o): aspeed.wdt
     000000007e785180-000000007e7851ff (prio 0, i/o): aspeed.wdt
     000000007e785200-000000007e788fff (prio -1000, i/o): aspeed.io 
@0000000000185200
---

> [1] https://github.com/AspeedTech-BMC/zephyr/releases/tag/v00.01.07
> [2] https://github.com/AspeedTech-BMC/zephyr/commit/2e99f10ac27b
> [3] https://github.com/AspeedTech-BMC/zephyr/blob/v00.01.08/drivers/watchdog/wdt_aspeed.c#L31
> 
> Reviewed-by: Peter Delevoryas <peter@pjd.dev>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/watchdog/wdt_aspeed.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
> index 958725a1b5..eefca31ae4 100644
> --- a/hw/watchdog/wdt_aspeed.c
> +++ b/hw/watchdog/wdt_aspeed.c
> @@ -260,6 +260,7 @@ static void aspeed_wdt_realize(DeviceState *dev, Error **errp)
>   {
>       SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>       AspeedWDTState *s = ASPEED_WDT(dev);
> +    AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(dev);
>   
>       assert(s->scu);
>   
> @@ -271,7 +272,7 @@ static void aspeed_wdt_realize(DeviceState *dev, Error **errp)
>       s->pclk_freq = PCLK_HZ;
>   
>       memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_wdt_ops, s,
> -                          TYPE_ASPEED_WDT, ASPEED_WDT_REGS_MAX * 4);
> +                          TYPE_ASPEED_WDT, awc->iosize);
>       sysbus_init_mmio(sbd, &s->iomem);
>   }
>   


