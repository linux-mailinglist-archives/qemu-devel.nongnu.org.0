Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAE837091A
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 23:42:27 +0200 (CEST)
Received: from localhost ([::1]:43178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcxNa-0005rb-4L
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 17:42:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lcxLd-0004qZ-G4; Sat, 01 May 2021 17:40:25 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:46880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lcxLb-00081T-PJ; Sat, 01 May 2021 17:40:25 -0400
Received: by mail-wr1-x42e.google.com with SMTP id x5so1616321wrv.13;
 Sat, 01 May 2021 14:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MJlFOEX6SMfEv/Sg3eKV3dLl1BJyvIbA6xeAWdn1M6k=;
 b=ErxeFrH0rk1cYamXADcNLIWrw4w8mjy4mMKOpI6rER8SWPg0oO8zaTlw4JpLFSOS3z
 9fQ+wHmpY0Ig+uX73gEgfHuC+9f08Tu+/T5d9IjFzllSaadHPBW2quYH8jVi+hGSD129
 t+LaMHaOZtLgWojGTzPTaMXcetI57E/rnocEi+pUi5mponW5XtEFCvEONu1SjyeabPyi
 PKgUk3I1RkshDKe/X4uPPob96n0hHwptr8Xk/HOjYUBlWAdPDRN0QGeCKT8uUuXS1JEH
 FNw8zk2Sv19Nb1i4w38CK3w8934cR+06gGBPpSYKGSby+w+nt8/Mmbl7E+bb1rHz3EZW
 KsQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MJlFOEX6SMfEv/Sg3eKV3dLl1BJyvIbA6xeAWdn1M6k=;
 b=MhHI4Lui3RO+qYHKauumgw9D0oo9UyqxfYHtZPO3vwKVK9IGE9ugaPaVOgzsAWnaE+
 ShYYPvBFkMAMIJfUwFq2dWASlwzpMFJvl2v30mfsz+A+4LAml4UIf0SXe9l8jPdPoa/s
 ZADMz1p3pF7xhJDuylN77b/rzjR6mGOvj9Fm84c4/y/bm0gLzLbXtx2n/YHVLO/mJqVe
 B6oKLmpXBO5micBv4IxbetUkfzwz4XjJ7XE8x63Hrh1vDbqKzurr+L1JQD0iS+mUcKZ5
 yBt4EIeS7WqAhCfy1xQ5UwixhJgUFbk+PyIMm9fW7TYQSou++BQEN6706BDiWBXjnh4e
 u41Q==
X-Gm-Message-State: AOAM530ciCY/EeIhtJ4YiGK9FXZgJiAxm2q5cRQlrWFz5+mhnywSgrc/
 M9/LWuAyF1eNZC1SN8+FFRrwA44yJu6QxylN
X-Google-Smtp-Source: ABdhPJzib+s7sIb8F/QCAGVXdERDF0r7eYjX4CFopfEpOfLDj9tWwORIsAmgvwlYr/rQQ5Pvwy9bbw==
X-Received: by 2002:a5d:628c:: with SMTP id k12mr15308175wru.206.1619905219598; 
 Sat, 01 May 2021 14:40:19 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id z7sm7032416wrl.11.2021.05.01.14.40.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 May 2021 14:40:18 -0700 (PDT)
Subject: Re: [PATCH v3 3/4] hw/arm: sabrelite: Connect the Ethernet PHY at
 address 6
To: Guenter Roeck <linux@roeck-us.net>, Bin Meng <bmeng.cn@gmail.com>
References: <20210106063504.10841-1-bmeng.cn@gmail.com>
 <20210106063504.10841-4-bmeng.cn@gmail.com>
 <20210430144136.GA2880420@roeck-us.net>
 <CAEUhbmUTLecMcr0=vmBeYJZeK6CdZY4SZcYiOu0E9AawY41+Cg@mail.gmail.com>
 <72acebfa-be17-cca5-ce6a-443ef4d23fce@roeck-us.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6f92b247-cc78-1e26-5809-2ae4809be5c6@amsat.org>
Date: Sat, 1 May 2021 23:40:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <72acebfa-be17-cca5-ce6a-443ef4d23fce@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/1/21 10:12 PM, Guenter Roeck wrote:
> On 4/30/21 9:28 PM, Bin Meng wrote:
>> On Fri, Apr 30, 2021 at 10:41 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>>
>>> Hi,
>>>
>>> On Wed, Jan 06, 2021 at 02:35:03PM +0800, Bin Meng wrote:
>>>> From: Bin Meng <bin.meng@windriver.com>
>>>>
>>>> At present, when booting U-Boot on QEMU sabrelite, we see:
>>>>
>>>>   Net:   Board Net Initialization Failed
>>>>   No ethernet found.
>>>>
>>>> U-Boot scans PHY at address 4/5/6/7 (see board_eth_init() in the
>>>> U-Boot source: board/boundary/nitrogen6x/nitrogen6x.c). On the real
>>>> board, the Ethernet PHY is at address 6. Adjust this by updating the
>>>> "fec-phy-num" property of the fsl_imx6 SoC object.
>>>>
>>>> With this change, U-Boot sees the PHY but complains MAC address:
>>>>
>>>>   Net:   using phy at 6
>>>>   FEC [PRIME]
>>>>   Error: FEC address not set.
>>>>
>>>> This is due to U-Boot tries to read the MAC address from the fuse,
>>>> which QEMU does not have any valid content filled in. However this
>>>> does not prevent the Ethernet from working in QEMU. We just need to
>>>> set up the MAC address later in the U-Boot command shell, by:
>>>>
>>>>   => setenv ethaddr 00:11:22:33:44:55
>>>>
>>>
>>> With this patch in place, the standard Ethernet interface no longer works when
>>> booting sabrelite Linux images directly (without u-boot) using the following
>>> qemu command.
>>>         qemu-system-arm -M sabrelite -kernel arch/arm/boot/zImage
>>>         ...
>>>
>>> The Ethernet interface still instantiates, but packet transfer to the host
>>> no longer works. Reverting this patch fixes the problem for me.
>>>
>>> Is there a qemu command line parameter that is now necessary to instantiate
>>> the Ethernet interface when booting Linux ?
>>
>> Enabling "guest_errors" shows that Linux kernel fec driver is trying
>> to read PHY at address 0, which is not what we want.
>>
>> [imx.fec.phy]imx_phy_read: Bad phy num 0
>>
>> The device tree blob of the sabrelite does not contain a node for the
>> ethernet phy specifying phy address, so I suspect Linux kernel driver
>> is using default phy address 0 instead.
>>
>> Could you please test on a real hardware to see what happens?
>>
> 
> The problem is that qemu returns 0 when the OS tries to read from a
> non-existing PHY. Linux expects it to return 0xffff, and believes that
> a PHY is there if 0 is returned.

Correct.

> This helps:
> 
> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> index f03450c028..3c90c38e26 100644
> --- a/hw/net/imx_fec.c
> +++ b/hw/net/imx_fec.c
> @@ -285,7 +285,7 @@ static uint32_t imx_phy_read(IMXFECState *s, int reg)
>      if (phy != s->phy_num) {
>          qemu_log_mask(LOG_GUEST_ERROR, "[%s.phy]%s: Bad phy num %u\n",
>                        TYPE_IMX_FEC, __func__, phy);
> -        return 0;
> +        return 0xffff;
>      }
> 
> Note that this is not really a guest error; any OS can and likely
> will scan the MII bus for connected phy chips.

Correct. This should be a trace event instead.

