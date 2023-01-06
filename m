Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD14C65FC45
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 08:52:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDhW1-0005tv-7v; Fri, 06 Jan 2023 02:51:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDhVz-0005th-5r
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 02:51:47 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDhVx-0002fz-HM
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 02:51:46 -0500
Received: by mail-wr1-x433.google.com with SMTP id bn26so584462wrb.0
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 23:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I+YBJhc1MvuhOxm2a9LcigeC6jaKCcKavKXZFxpgu/w=;
 b=lpBrr2hVSMCZMwutcGg3nhwunk9OY0sZfTxCWx7aFZBerrDd9WZM998YPan6iMb8Gs
 toRBum8MazdUknAjT6lVNObLNczyQGxthCbyKua+E2QcGeLUvFYXF3JtJ5gZpi2BS25G
 g+HRPs9aRDBu9vnAujS2f0f3I9x/McrItFqhT9nr0XH6eYcd6mJCgeaAbYnkrzGWbtvD
 6cVRun35LAkV2MfsXCAOpcUknWTnXyM2Z7T4EQL25ydn+9v/Fov6yaP75bH6ytr5glGM
 BG31mrDbsBny8h6UR/648bnUfCP4x3/oOy0pNh3fgYPt/ixQq6fBvqIt/C/b7gYyWFX/
 pqKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I+YBJhc1MvuhOxm2a9LcigeC6jaKCcKavKXZFxpgu/w=;
 b=NhME7aYvdOFWmEbzYQGxtor+tQ4D2LwSvKFUM4GYgzD5qlZeoyHriNBoATDP+mib1G
 lLZXfpbNILyyuUcq+KbwHASNxGqip8ZWpM1tw5ptyCneqwGNwMEJTxzU7F8KH8P0w261
 0iy9ueDANt0usPcdP1MAZS09p336mCYokakZGZ5ywCmTH5mpxV/oAyG/nwLXTPdYuTja
 K9h8BxeNWVwjIa8JEXp9B1q9bZFX6YVFn0aKkCDfU4lixchkqS22lzdU0I8hadsOTh2c
 nPdC1GS0nwT4gLSHcCOwpYzuHGIKwhhCuDzLm00j5FrXo2h5omv00t/d+feQIAO4qK7+
 iO7A==
X-Gm-Message-State: AFqh2kpp6t3HyEbiIvPLCcQLmvtqEH61vaJ9s3oQGDzUOBqUhLYdcWn7
 5kXRduYG4tuFcTQ+r6Q9FM19RQ==
X-Google-Smtp-Source: AMrXdXvdHbHICvGjnMn27aHY+aR65qJ8fyE6mtDOyZaD4IACrioqVKqEeKPcs1mNWuCmHGUj5a80Zg==
X-Received: by 2002:adf:f290:0:b0:242:144:90c4 with SMTP id
 k16-20020adff290000000b00242014490c4mr34461969wro.28.1672991503239; 
 Thu, 05 Jan 2023 23:51:43 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m10-20020a056000008a00b002683695bf97sm391202wrx.58.2023.01.05.23.51.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 23:51:42 -0800 (PST)
Message-ID: <f8d87642-4d0b-cf6d-7423-3fb0fe3c6844@linaro.org>
Date: Fri, 6 Jan 2023 08:51:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 13/40] hw/arm/bcm2836: Set mp-affinity property in
 realize
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
References: <20230103181646.55711-1-richard.henderson@linaro.org>
 <20230103181646.55711-14-richard.henderson@linaro.org>
 <611df9d8-b3d6-9879-5d51-cc63aff1c807@linaro.org>
In-Reply-To: <611df9d8-b3d6-9879-5d51-cc63aff1c807@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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

On 5/1/23 22:48, Philippe Mathieu-Daudé wrote:
> On 3/1/23 19:16, Richard Henderson wrote:
>> There was even a TODO comment that we ought to be using a cpu
>> property, but we failed to update when the property was added.
>> Use ARM_AFF1_SHIFT instead of the bare constant 8.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   hw/arm/bcm2836.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
>> index 24354338ca..abbb3689d0 100644
>> --- a/hw/arm/bcm2836.c
>> +++ b/hw/arm/bcm2836.c
>> @@ -130,8 +130,11 @@ static void bcm2836_realize(DeviceState *dev, 
>> Error **errp)
>>           qdev_get_gpio_in_named(DEVICE(&s->control), "gpu-fiq", 0));
>>       for (n = 0; n < BCM283X_NCPUS; n++) {
>> -        /* TODO: this should be converted to a property of ARM_CPU */
>> -        s->cpu[n].core.mp_affinity = (bc->clusterid << 8) | n;
>> +        if (!object_property_set_int(OBJECT(&s->cpu[n].core), 
>> "mp-affinity",
>> +                                     (bc->clusterid << 
>> ARM_AFF1_SHIFT) | n,
>> +                                     errp)) {
>> +            return;
>> +        }

> Eh I have almost the same patch locally:

> Yours is better (ARM_AFF1_SHIFT & checks return value).

Cherry-picking your patch I had to add "target/arm/cpu-qom.h" to
avoid:

../hw/arm/bcm2836.c:146:56: error: use of undeclared identifier 
'ARM_AFF1_SHIFT'
                                  (bc->clusterid << ARM_AFF1_SHIFT) | n,
                                                    ^

This definition is not QOM related, I guess I'll move it to
"hw/arm/cpu-defs.h" along with ARM_CPU_vIRQ/FIQ and GTIMER* definitions
from "cpu.h".

