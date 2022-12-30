Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F336595C5
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 08:33:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pB9sJ-00059G-J8; Fri, 30 Dec 2022 02:32:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pB9sG-00058D-48
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 02:32:16 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pB9sD-00051G-Mg
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 02:32:15 -0500
Received: by mail-wm1-x32e.google.com with SMTP id m3so5773569wmq.0
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 23:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XnzO3TBJoJn3HA39CYqEdMaFkpfkwjLYTxBh9vk6FwM=;
 b=Bsfz0jY6G/yPb8tl7GCIUHXt63+4bGAhOw7vHSZD7pJwEEFTUkPzWs3xLwQ5LUYUfW
 r4T37yI957xyNV5XzySuNEWhtwsqTsU25OLNz5h5wAWSKb9BvS+KXGZx6OaEwN5e65hN
 R84f//zs74p9DfCGtP6ir4R1EWjmWH3/gsXrwrj3HRwqn9/K8ZHu2Ei+EhJJ67431XgN
 SOVUxImlPdCrcBWxJjdA9qKDjPSvANXa8VVSp4Zsl2eYXxpjup54/U4/yHWBHxNv4HTj
 0YNxSz0i0tfrvz1Vf0FfLqL7jOe/IIKQP7A2NPyVyQBlXn44gfMcKe5x03Foqy7bEupI
 /qYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XnzO3TBJoJn3HA39CYqEdMaFkpfkwjLYTxBh9vk6FwM=;
 b=kUE95bfGqrUVn5O9MU5q9WL9bbqA+4PuRjTAXNqoRRQ6cExW+ATCYa6oOFilm5fi8Q
 luXrbn995U4/wbLQ7itr2YmApGFhOqk9sq+FvB1WTh8Y1Y1RMbflVJceSLv6EGKLk+RQ
 ZJ2RSa2fJisDA//kqdMZxSrJcBZEN0MvFNVAhB7rgrTTdNOmXQIC2wqSHG92kGrZq8RQ
 NdXXLPODtfFNYOdeqsxk4vmnMnLh2k9sjaZnBfYmoQheKUabOCKuKFnQPZW8g3Kq3OzB
 iyjntAZKHr7JwMJKF/3MyqraZ9oaN5+vlLz10FC0lTQlBEekKijpLJ0TVJy2/AwZHWV1
 w5Hg==
X-Gm-Message-State: AFqh2krnDI6YeVHAjwMwE1dLbC/jYXzihFq/8sIWviNeZ38JMtM8Rr23
 nrvphRa/DkbI739r11MAywqHkQ==
X-Google-Smtp-Source: AMrXdXt0gOKJeAu3dSGRKVxzmvVKb/W913XgdsiKMEMUIWT2L57zJAuvrEBLGZuaEsaaHm20qWLBcA==
X-Received: by 2002:a1c:770b:0:b0:3cf:a18d:399c with SMTP id
 t11-20020a1c770b000000b003cfa18d399cmr22829053wmi.1.1672385531041; 
 Thu, 29 Dec 2022 23:32:11 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k5-20020a05600c080500b003d208eb17ecsm25477712wmp.26.2022.12.29.23.32.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Dec 2022 23:32:10 -0800 (PST)
Message-ID: <fcb05260-8723-690a-52c8-db72c7372f65@linaro.org>
Date: Fri, 30 Dec 2022 08:32:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 1/9] hw/watchdog/wdt_aspeed: Map the whole MMIO range
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
Cc: qemu-devel@nongnu.org, Steven Lee <steven_lee@aspeedtech.com>,
 Peter Delevoryas <pdel@meta.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Troy Lee <troy_lee@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Peter Delevoryas <pdel@fb.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
References: <20221229152325.32041-1-philmd@linaro.org>
 <20221229152325.32041-2-philmd@linaro.org>
 <Y637mlYosU4ULh9b@pdel-mbp.dhcp.thefacebook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y637mlYosU4ULh9b@pdel-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 29/12/22 21:42, Peter Delevoryas wrote:
> On Thu, Dec 29, 2022 at 04:23:17PM +0100, Philippe Mathieu-Daudé wrote:
>> Avoid confusing two different things:
>> - the WDT I/O region size ('iosize')
>> - at which offset the SoC map the WDT ('offset')
>> While it is often the same, we can map smaller region sizes at
>> larger offsets.
>>
>> Here we are interested in the I/O region size. Rename as 'iosize'
>> and map the whole range, not only the first implemented registers.
>> Unimplemented registers accesses are already logged as guest-errors.
>>
>> Otherwise when booting the demo in [*] we get:
>>
>>    aspeed.io: unimplemented device write (size 4, offset 0x1851a8, value 0x030f1ff1)
>>    aspeed.io: unimplemented device write (size 4, offset 0x1851ac, value 0x03fffff1)
>>    aspeed.io: unimplemented device write (size 4, offset 0x185128, value 0x030f1ff1)
>>    aspeed.io: unimplemented device write (size 4, offset 0x18512c, value 0x03fffff1)
>>
>> [*] https://github.com/AspeedTech-BMC/zephyr/releases/tag/v00.01.07
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/arm/aspeed_ast10x0.c          |  2 +-
>>   hw/arm/aspeed_ast2600.c          |  2 +-
>>   hw/arm/aspeed_soc.c              |  2 +-
>>   hw/watchdog/wdt_aspeed.c         | 12 +++++++-----
>>   include/hw/watchdog/wdt_aspeed.h |  2 +-
>>   5 files changed, 11 insertions(+), 9 deletions(-)


>> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
>> index d753693a2e..c1311ce74c 100644
>> --- a/hw/watchdog/wdt_aspeed.c
>> +++ b/hw/watchdog/wdt_aspeed.c
>> @@ -260,6 +260,7 @@ static void aspeed_wdt_realize(DeviceState *dev, Error **errp)
>>   {
>>       SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>>       AspeedWDTState *s = ASPEED_WDT(dev);
>> +    AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(dev);
>>   
>>       assert(s->scu);
>>   
>> @@ -270,8 +271,9 @@ static void aspeed_wdt_realize(DeviceState *dev, Error **errp)
>>        */
>>       s->pclk_freq = PCLK_HZ;
>>   
>> +    assert(awc->iosize >= ASPEED_WDT_REGS_MAX * 4);
>>       memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_wdt_ops, s,
>> -                          TYPE_ASPEED_WDT, ASPEED_WDT_REGS_MAX * 4);
>> +                          TYPE_ASPEED_WDT, awc->iosize);
> 
> Does this fix the unimplemented thing you referred to in the commit message?

Yes, I'll reword the description to be clearer.

> I'm not sure which part of this diff actually removes the unimplemented traces.

Having:

   #define ASPEED_WDT_REGS_MAX        (0x20 / 4)

Before this patch, we map regions of 0x20 ...

>> @@ -392,7 +394,7 @@ static void aspeed_1030_wdt_class_init(ObjectClass *klass, void *data)
>>       AspeedWDTClass *awc = ASPEED_WDT_CLASS(klass);
>>   
>>       dc->desc = "ASPEED 1030 Watchdog Controller";
>> -    awc->offset = 0x80;
>> +    awc->iosize = 0x80;

... every span of 0x80, so there is a gap of 0x60, apparently accessed
by the Zephyr WDT driver (address 0x28 - register #10 - is accessed in
the traces).

 From the driver source we can see [1] added in [2]:

     #define WDT_RELOAD_VAL_REG          0x0004
     #define WDT_RESTART_REG             0x0008
     #define WDT_CTRL_REG                0x000C
     #define WDT_TIMEOUT_STATUS_REG      0x0010
     #define WDT_TIMEOUT_STATUS_CLR_REG  0x0014
     #define WDT_RESET_MASK1_REG         0x001C
     #define WDT_RESET_MASK2_REG         0x0020
     #define WDT_SW_RESET_MASK1_REG      0x0028   <------
     #define WDT_SW_RESET_MASK2_REG      0x002C
     #define WDT_SW_RESET_CTRL_REG       0x0024

So the traces likely correspond to this code:

   static int aspeed_wdt_init(const struct device *dev)
   {
     const struct aspeed_wdt_config *config = dev->config;
     struct aspeed_wdt_data *const data = dev->data;
     uint32_t reg_val;

     /* disable WDT by default */
     reg_val = sys_read32(config->ctrl_base + WDT_CTRL_REG);
     reg_val &= ~WDT_CTRL_ENABLE;
     sys_write32(reg_val, config->ctrl_base + WDT_CTRL_REG);

     sys_write32(data->rst_mask1,
                 config->ctrl_base + WDT_SW_RESET_MASK1_REG);
     sys_write32(data->rst_mask2,
                 config->ctrl_base + WDT_SW_RESET_MASK2_REG);

     return 0;
   }

After this patch, we map (in this case) a MMIO region of 0x80.
Accesses to address 0x28 hits this device model but is handled
as 'WDT register not covered'.

Better would be to extend the Aspeed WDT model in QEMU, or at
least report the valid-but-unimplemented registers as UNIMP instead
of GUEST_ERRORS.

[1] 
https://github.com/AspeedTech-BMC/zephyr/blob/v00.01.08/drivers/watchdog/wdt_aspeed.c#L31
[2] https://github.com/AspeedTech-BMC/zephyr/commit/2e99f10ac27b

>> diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_aspeed.h
>> index dfa5dfa424..db91ee6b51 100644
>> --- a/include/hw/watchdog/wdt_aspeed.h
>> +++ b/include/hw/watchdog/wdt_aspeed.h
>> @@ -40,7 +40,7 @@ struct AspeedWDTState {
>>   struct AspeedWDTClass {
>>       SysBusDeviceClass parent_class;
>>   
>> -    uint32_t offset;
>> +    uint32_t iosize;
> 
> Oh yeah, iosize is a way better name for this. +1. But to be honest, I don't
> understand how this is changing the unimplemented traces?
> 
> Reviewed-by: Peter Delevoryas <peter@pjd.dev>

Thanks!

Phil.


