Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEE9698EFD
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 09:48:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSZvN-0001rD-0i; Thu, 16 Feb 2023 03:47:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSZvA-0001fq-5i
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 03:47:17 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSZv7-0005OK-2x
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 03:47:15 -0500
Received: by mail-wr1-x431.google.com with SMTP id k5so817904wrh.3
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 00:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=L53jxAlOJ60aToYJSLmC+njUIySw2Uc0DI2JzNp7hec=;
 b=lBDwofmrw2l7/5id7o4uQ8HtBRU+R+zMyb9S+legSkjJ/kQ3KrWjKS+MKOAkAPXjp1
 Z60WISygu5AEJNSTx2p68JVaF/dgAcJWnMTC+4AP95+t36jR17aIT8qKqbF5inPOsYPg
 PquIBUsff0T/15GWHe3CvXskYpPPE1ZOMmX4EfG3ROCosug5PW2d3gdCpfag7JPaREMH
 GwV7oDtHxOqryk76sC8E4LSK1WC3o1k6Pl1OUNOhjAcdAve2AtNkgT3e93jOaJUkVIgv
 bacP8LrgAMABm8BpekUCCU28NkWwyVbSiXDTgikmQ1SkdCYXJGSlOERIWhOqP5LhAg8t
 GZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L53jxAlOJ60aToYJSLmC+njUIySw2Uc0DI2JzNp7hec=;
 b=2E+I0yD+oZfgdnPAWTLV8DU8ktCFbaW/H35AsEDAO6XlU0IoFqmi59j2Ynt6wpujBa
 C+P8Obhgtko2uDii8PGtjrBZRJsBE++mnMfVoFnLYzRW/QLejDOQqtxJbtB4CTEpUm9E
 MDYtg47wdVWSaaZMSN9+I/VxamsBSglZfkeHEeQet68RdcSloT3Ze61EZpJBrFfJxfmR
 lSV9bGO1aQIzeeNJbWkfRJ8mU6wyFNKAIYg8UDTNdZoQltdAhMQDL030255ZqD6lGXGV
 qT0WcSfYklFUjWtxxpQe97IGLGh5J6ZB72Wvy3QWQ3KwNrbHCXQHAgjeJfEdsVSaWY3H
 t6ZQ==
X-Gm-Message-State: AO0yUKXH1Hmo/WbAHPJxfO6REp5xVL+7km85vJL2OqoSfR5oMsLjK1tZ
 fUqt34pDdw4X0gKY3IT3qsEeUA==
X-Google-Smtp-Source: AK7set9jnkRq7T5QCHDjPx9Oz7g2tUC18G6vr7x9CqVEYqjXW6DjRWn6xO78XCKZRrEO8BAzCIfr0w==
X-Received: by 2002:a05:6000:2ca:b0:2c5:4dbd:dfa3 with SMTP id
 o10-20020a05600002ca00b002c54dbddfa3mr1367019wry.21.1676537229594; 
 Thu, 16 Feb 2023 00:47:09 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 e4-20020a5d5004000000b002c5706f7c6dsm885629wrt.94.2023.02.16.00.47.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 00:47:09 -0800 (PST)
Message-ID: <a3970b81-89e6-66c3-4a62-13bd610096b6@linaro.org>
Date: Thu, 16 Feb 2023 09:47:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 1/8] m25p80: Improve error when the backend file size does
 not match the device
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, qemu-block <qemu-block@nongnu.org>,
 Xiang Zheng <zhengxiang9@huawei.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20230214171830.681594-1-clg@kaod.org>
 <20230214171830.681594-2-clg@kaod.org>
 <Y+038bMA0BaPLUr8@pdel-mbp.dhcp.thefacebook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y+038bMA0BaPLUr8@pdel-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 15/2/23 20:52, Peter Delevoryas wrote:
> On Tue, Feb 14, 2023 at 06:18:23PM +0100, Cédric Le Goater wrote:
>> Currently, when a block backend is attached to a m25p80 device and the
>> associated file size does not match the flash model, QEMU complains
>> with the error message "failed to read the initial flash content".
>> This is confusing for the user.
>>
>> Use blk_check_size_and_read_all() instead of blk_pread() to improve
>> the reported error.

Could you reference commit 06f1521795?

>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Reviewed-by: Peter Delevoryas <peter@pjd.dev>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> Message-Id: <20221115151000.2080833-1-clg@kaod.org>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>
>>    breakage with commit a4b15a8b9e ("pflash: Only read non-zero parts
>>    of backend image") when using -snaphot.
> 
> 
> I guess it's not obvious to me, what broke?
> 
> 1. BlockBackend *blk = -drive file=blob.mtd,format=raw,if=mtd,snapshot=on
> 2. uint8_t *storage = malloc(...)
> 3. blk_check_size_and_read_all(blk, storage, size)
> 4. commit a4b15a8b9e
>      for sector in blk:
>          if any(b != 0 for b in sector):
>              memcpy(&storage[...], sector, sizeof(sector))
>          else:
>              # Skip memcpy of zeroes
> 
> But this is probably a regression for us because we actually expect the zeroes
> to be copied?

Yes... Commit a4b15a8b9e mostly considered cloud payload optimization.

Since EEPROMs are usually "small", this could be kludged as:

-- >8 --
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -1615,6 +1615,7 @@ static void m25p80_realize(SSIPeripheral *ss, 
Error **errp)
          trace_m25p80_binding(s);
          s->storage = blk_blockalign(s->blk, s->size);

+        memset(s->storage, ERASED_BYTE, s->size);
          if (blk_pread(s->blk, 0, s->size, s->storage, 0) < 0) {
              error_setg(errp, "failed to read the initial flash content");
              return;
---

On emulation, it is simpler to ask the user to provide a block image
with the same size of the emulated device. See commit 06f1521795
("pflash: Require backend size to match device, improve errors") for
more information.

>> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
>> index 802d2eb021..dc5ffbc4ff 100644
>> --- a/hw/block/m25p80.c
>> +++ b/hw/block/m25p80.c
>> @@ -24,6 +24,7 @@
>>   #include "qemu/osdep.h"
>>   #include "qemu/units.h"
>>   #include "sysemu/block-backend.h"
>> +#include "hw/block/block.h"
>>   #include "hw/qdev-properties.h"
>>   #include "hw/qdev-properties-system.h"
>>   #include "hw/ssi/ssi.h"
>> @@ -1615,8 +1616,7 @@ static void m25p80_realize(SSIPeripheral *ss, Error **errp)
>>           trace_m25p80_binding(s);
>>           s->storage = blk_blockalign(s->blk, s->size);
>>   
>> -        if (blk_pread(s->blk, 0, s->size, s->storage, 0) < 0) {
>> -            error_setg(errp, "failed to read the initial flash content");
>> +        if (!blk_check_size_and_read_all(s->blk, s->storage, s->size, errp)) {
>>               return;
>>           }
>>       } else {
>> -- 
>> 2.39.1
>>


