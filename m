Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E2037075A
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 15:14:08 +0200 (CEST)
Received: from localhost ([::1]:60034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcpRf-0005OW-7S
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 09:14:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1lcpPt-0004Nk-Hn; Sat, 01 May 2021 09:12:17 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:44907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1lcpPr-0003YZ-OI; Sat, 01 May 2021 09:12:17 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 z25-20020a9d65d90000b02902a560806ca7so983682oth.11; 
 Sat, 01 May 2021 06:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8MiVVkIZNW/ltqxDo5KpIq5+cCUCDJhuFtfHkkPt4Iw=;
 b=j5l6L/0Za9rNlEDBDJE5g2NOtDcOPY+s2Mu3uW1G5DYTM5QYaPUQx9HMO4OGzD4eAb
 ZOPRNvDGAZ5KsKLFLu6BbwTa8x83d6MEwR8F52hgr8ix05AXoDM9KfrF+3KMPWng27w1
 d58pd/jiN02ljsHHJkSXLKMjNH0R94a3X8y95tJS9rncHZuAgWnHAVQutH9HsR3NIY2M
 xAYXPVbzCyyo0gBBPmqWZkK+tycnFmBvDrVnvg9YGpOhjpE1xmvOTwp0qVyGgwbsBlRx
 5vQAnEfQiTv/0sl9eJ+1CNMr9xcg51C2zcF8D7phrnER0DNjQwIPXbu/sJH01aOCB7Yf
 Mhgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8MiVVkIZNW/ltqxDo5KpIq5+cCUCDJhuFtfHkkPt4Iw=;
 b=eXEPlas0W493T4X2Zrw9oQYtKCDneQ3zw//0+UBqbHsjKcDsSo6XToIJcQMaW5/TVE
 HaGg9D3gamnQmZMkoUw5NtfJEoADtndbCAEfh5Bc80azrzr4FjhfyzSybBMDgej8i7p2
 zwvN6bp/UgxDNSIhe/Xbk72/XKqhJUWeXNH44KKPFP11h3q73FgVS6O3pyT6ED8TV6en
 ljH0bSQQSXZ6GdheCP3RSe3HNkwy4rX8RzGFap+ioNz7tmZXnD178YEf0y1/429Mx4ak
 NJ9yp4kamcOYgklMg49lmRDT6j9LizZbzfUpCvwe2mIgNRkdyfz/N5rfvmvfjzQqaMYt
 2n4g==
X-Gm-Message-State: AOAM531zbzO/qPWAEgS4tBd3I07vJt5mWTwqHju7XjGafEa8IYtAY1t8
 VAODzFO0bmgILhLtGaLW4sc=
X-Google-Smtp-Source: ABdhPJyvpDTnjkPP0oggjVJWAblGQLBtFnf+wyw/4gxTp49rCSMI+7nmoTd72NnN4EgGefjzRSJhQg==
X-Received: by 2002:a9d:5a4:: with SMTP id 33mr7491285otd.328.1619874734130;
 Sat, 01 May 2021 06:12:14 -0700 (PDT)
Received: from server.roeck-us.net
 (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id y8sm1472460oie.28.2021.05.01.06.12.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 May 2021 06:12:13 -0700 (PDT)
Subject: Re: [PATCH v3 3/4] hw/arm: sabrelite: Connect the Ethernet PHY at
 address 6
To: Bin Meng <bmeng.cn@gmail.com>
References: <20210106063504.10841-1-bmeng.cn@gmail.com>
 <20210106063504.10841-4-bmeng.cn@gmail.com>
 <20210430144136.GA2880420@roeck-us.net>
 <CAEUhbmUTLecMcr0=vmBeYJZeK6CdZY4SZcYiOu0E9AawY41+Cg@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <c57026be-01fb-41ad-b7c2-093a3704bf16@roeck-us.net>
Date: Sat, 1 May 2021 06:12:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAEUhbmUTLecMcr0=vmBeYJZeK6CdZY4SZcYiOu0E9AawY41+Cg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=groeck7@gmail.com; helo=mail-ot1-x333.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/30/21 9:28 PM, Bin Meng wrote:
> On Fri, Apr 30, 2021 at 10:41 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> Hi,
>>
>> On Wed, Jan 06, 2021 at 02:35:03PM +0800, Bin Meng wrote:
>>> From: Bin Meng <bin.meng@windriver.com>
>>>
>>> At present, when booting U-Boot on QEMU sabrelite, we see:
>>>
>>>   Net:   Board Net Initialization Failed
>>>   No ethernet found.
>>>
>>> U-Boot scans PHY at address 4/5/6/7 (see board_eth_init() in the
>>> U-Boot source: board/boundary/nitrogen6x/nitrogen6x.c). On the real
>>> board, the Ethernet PHY is at address 6. Adjust this by updating the
>>> "fec-phy-num" property of the fsl_imx6 SoC object.
>>>
>>> With this change, U-Boot sees the PHY but complains MAC address:
>>>
>>>   Net:   using phy at 6
>>>   FEC [PRIME]
>>>   Error: FEC address not set.
>>>
>>> This is due to U-Boot tries to read the MAC address from the fuse,
>>> which QEMU does not have any valid content filled in. However this
>>> does not prevent the Ethernet from working in QEMU. We just need to
>>> set up the MAC address later in the U-Boot command shell, by:
>>>
>>>   => setenv ethaddr 00:11:22:33:44:55
>>>
>>
>> With this patch in place, the standard Ethernet interface no longer works when
>> booting sabrelite Linux images directly (without u-boot) using the following
>> qemu command.
>>         qemu-system-arm -M sabrelite -kernel arch/arm/boot/zImage
>>         ...
>>
>> The Ethernet interface still instantiates, but packet transfer to the host
>> no longer works. Reverting this patch fixes the problem for me.
>>
>> Is there a qemu command line parameter that is now necessary to instantiate
>> the Ethernet interface when booting Linux ?
> 
> Enabling "guest_errors" shows that Linux kernel fec driver is trying
> to read PHY at address 0, which is not what we want.
> 
> [imx.fec.phy]imx_phy_read: Bad phy num 0
> 
> The device tree blob of the sabrelite does not contain a node for the
> ethernet phy specifying phy address, so I suspect Linux kernel driver
> is using default phy address 0 instead.
> 
> Could you please test on a real hardware to see what happens?
> 

I don't have access to real hardware, sorry.

Guenter


