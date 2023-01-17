Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDB466D683
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 07:49:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHfkf-0003Kj-FA; Tue, 17 Jan 2023 01:47:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHfkZ-0003KO-Ve
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 01:47:16 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHfkV-0005dw-9a
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 01:47:15 -0500
Received: by mail-wr1-x432.google.com with SMTP id b5so8354335wrn.0
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 22:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FQd7INcG/xxlIZsMMLARuLEBz5TWChZoMsVbajCKuTw=;
 b=IMcAtctIhaPTmyCckr8kiEko33Dr6Pwk3KcJEyUb7HGQ5JfVo6D3MRT6W7mHMBgYYz
 pUwjrYksQOCjh3hBFfYk+yyVqnqGq4veCSn2zj0NyM0rMjfW+pHYqP8bCj2Iqb0y1eWY
 9H2vOjpohaKeTacDOmRbQY4QBRuxEqRFR+QxCLLlXwf1Y/Yuap7318KMMUHgduWBlyO/
 D2WyXmyiscZaKwK6XDr38XYenq69YcMcgGiK/RwZ/kSshd0XgjV6taOeIF37ErGqylwB
 CzU9nmPg4OdHnfFA9VNRDljbuQg+116un3RQibkWYFCyUB12cGtpk4WSjoj2grDH7Wg4
 P9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FQd7INcG/xxlIZsMMLARuLEBz5TWChZoMsVbajCKuTw=;
 b=nRFZcxBaBGhBaQBKdFWSG200203kWJjrpjvi1Et/79S48J0OKN3vO2o0rozBaLNWYy
 K/MLCSBkKAe0oqYvDuYZX4XfTDgNBSg2IHWYzLlmkU3ON5Az2U9dLMzRektXGVDoYa8n
 x69j+2FTfCXeGv8dyRCEd5EZgMZqgYR78RDUvTedYeO3+BJh1DffcxJDs7rXxHphrqm8
 qPdN0v08urV7k0kkgMm/JEHz8cuS1Zkgii3qPgaZQ9/7g9JSeAkd5h2TEDRoeyeFz6XD
 Nj8uvfzp/AarSs+0uskKR8qN6t6dKujoBmIXgazJ59RkiBGRvnb75IQN7ezGwt4o2Lxc
 nzxw==
X-Gm-Message-State: AFqh2kp2QJF50fcbcpXVkr1REA/37SXQ+HrA2ggHdomiwkjfqvX/uyOZ
 6ztWHTceIOi3DHRX8IUavRU/ew==
X-Google-Smtp-Source: AMrXdXvs7h1U/brjzH89d/BffFLJojvxVgvSPi6qM2fZf4vJueqXHX5/5INBfnhAv/fFtA3Bb9eW4g==
X-Received: by 2002:a5d:6e42:0:b0:2bd:fcd3:44c7 with SMTP id
 j2-20020a5d6e42000000b002bdfcd344c7mr1599505wrz.29.1673938028346; 
 Mon, 16 Jan 2023 22:47:08 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 u14-20020adfdd4e000000b002366e3f1497sm28334766wrm.6.2023.01.16.22.47.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 22:47:07 -0800 (PST)
Message-ID: <f098f433-24e1-5f38-b479-d41ab1c51663@linaro.org>
Date: Tue, 17 Jan 2023 07:47:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 6/6] hw/arm/aspeed: Init fby35 BMC FRUID EEPROM
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
Cc: patrick@stwcx.xyz, clg@kaod.org, peter.maydell@linaro.org,
 andrew@aj.id.au, joal@jms.id.au, hskinnemoen@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230114170151.87833-1-peter@pjd.dev>
 <20230114170151.87833-7-peter@pjd.dev>
 <0ef1b0e3-7df0-e611-0335-bf0a24690a90@linaro.org> <Y8WH+aneXr/JkEXp@pdel-mbp>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y8WH+aneXr/JkEXp@pdel-mbp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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

On 16/1/23 18:23, Peter Delevoryas wrote:
> On Mon, Jan 16, 2023 at 01:30:19PM +0100, Philippe Mathieu-Daudé wrote:
>> On 14/1/23 18:01, Peter Delevoryas wrote:
>>> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
>>> ---
>>>    hw/arm/aspeed.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
>>>    1 file changed, 49 insertions(+)
>>>
>>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>>> index c929c61d582a..4ac8ff11a835 100644
>>> --- a/hw/arm/aspeed.c
>>> +++ b/hw/arm/aspeed.c
>>> @@ -922,6 +922,52 @@ static void bletchley_bmc_i2c_init(AspeedMachineState *bmc)
>>>        i2c_slave_create_simple(i2c[12], TYPE_PCA9552, 0x67);
>>>    }
>>> +static const uint8_t fby35_bmc_fruid[] = {
>> [...]
>>
>>> +};
>>> +
>>>    static void fby35_i2c_init(AspeedMachineState *bmc)
>>>    {
>>>        AspeedSoCState *soc = &bmc->soc;
>>> @@ -1363,6 +1409,9 @@ static void fby35_reset(MachineState *state, ShutdownCause reason)
>>>        object_property_set_bool(OBJECT(gpio), "gpioB3", false, &error_fatal);
>>>        object_property_set_bool(OBJECT(gpio), "gpioB4", false, &error_fatal);
>>>        object_property_set_bool(OBJECT(gpio), "gpioB5", false, &error_fatal);
>>> +
>>> +    at24c_eeprom_write(aspeed_i2c_get_bus(&bmc->soc.i2c, 11),
>>> +                       0x54, 0, fby35_bmc_fruid, sizeof(fby35_bmc_fruid));
>>
>> Why transfer the prom content on the i2c bus at each reset?
>>
>> In particular this looks wrong if the prom is initialized with a 'drive'
>> block backend (using -global).
> 
> Yeah, it looks like this might not be the right way to model it. I'm going
> to try Cedric's suggestions.

OK, but watch out this is a PROM, not a ROM, meaning it is legitimate
for a guest to reprogram it, and expect the reprogrammed content after
reset.

Shouldn't we put the 'fill default content if no -drive provided' option
in the device's realize() handler, to avoid overwriting content possibly
updated by guest before reset?

