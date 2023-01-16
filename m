Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F1666B932
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 09:42:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHL42-0002x1-16; Mon, 16 Jan 2023 03:41:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHL3w-0002wi-L0
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 03:41:54 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHL3u-00041X-UF
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 03:41:52 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 o17-20020a05600c511100b003db021ef437so170470wms.4
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 00:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5iw2oHjnF1Z45d2IA5PDwr0m/gLBD7J0oRSa9dwB8Rg=;
 b=ywv/dsg9eoQtWJcLSmZHtRLXt6UoAt5JD64usPN506+XrH31X93xKioCNIk3rk335F
 rACcwIqYsbhV7qDKlODTI5GOCFOyP0Vz/G7clq7OEaTa51b8o5QPEMUbRMMvSpnhlPJh
 o6L7k7B95fvGDm+8iRJubqAHm1UJQgiP/TONt6tMqY+ziqHbRPNBdP+jX9Y2lNAZCp+2
 DqiUAjG6gdionTrPtbIjitrM+/4tTsNDpI/557W/Rr8mJ5c7LglqEIGs1pNgVJhKmi64
 lVbWiFJ3jV5v4wW7aZqcp7CnOMi1hnGT44iPELZCnhRhJmICAZQX6nd6KtuR+6ev5dDZ
 0Jpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5iw2oHjnF1Z45d2IA5PDwr0m/gLBD7J0oRSa9dwB8Rg=;
 b=ImJrEnt4BF0EZBRfoZE54ynsJNNZkwu7S/olhAEVyB6+s11pdCbAnSGElamCf1tR3S
 puAI8kDtcgn8zVm9FIix1XozLvD4OSFXZQ363Jo/xv9G5Sz/DEItdsxK+pdh+IiE/iD7
 suHJq9KM8RaeAV8O3RVVWrjGUEjKETUeopCRk3JcrIGQYRmpN4QkE9Y1l9YgKPh56ZIR
 8oXsAOmfcDKWBqfL73l76v4Atk+gyCjZSqU9geWx6a4J68Y8Flj41j6yQMleCZu+rOxv
 rVCttW54CIfv6ppWJCNnqA55lav8TtoXZbaOoPLvGVvEK4c0gh2MO+1KZpASo9esjo+5
 aaLQ==
X-Gm-Message-State: AFqh2kqMM7eKz5+ZBokOwF2idu7pCj7PrTg5s8RoQlquGT/mzXuJ6hHy
 ItU2rNO+Cvtc/rwkW1fSUkfyQw==
X-Google-Smtp-Source: AMrXdXt4lFKxK3BX9dl1T4/UgLPwRLpJIwSzN7XVDU0Y99Z+BW1MjURKWlsANl2uU6k0LcdqtVgnVQ==
X-Received: by 2002:a05:600c:250:b0:3d2:2043:9cbf with SMTP id
 16-20020a05600c025000b003d220439cbfmr64917321wmj.10.1673858508561; 
 Mon, 16 Jan 2023 00:41:48 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n10-20020a5d6b8a000000b002425787c5easm25651908wrx.96.2023.01.16.00.41.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 00:41:48 -0800 (PST)
Message-ID: <20148a60-bc97-5c66-06f8-81cace4027a7@linaro.org>
Date: Mon, 16 Jan 2023 09:41:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 01/21] hw/block: Rename TYPE_PFLASH_CFI02 'width'
 property as 'device-width'
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: BALATON Zoltan <balaton@eik.bme.hu>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20230109120833.3330-1-philmd@linaro.org>
 <20230109120833.3330-2-philmd@linaro.org>
 <791cd783-4f27-dd18-c6bd-b9a316bb42cd@eik.bme.hu>
 <8507ed0d-fc90-8ce3-2d7d-82c106b20231@linaro.org>
 <CAFEAcA-h49eXgS63LARX0aMgBknNcaURGxqammQh5U9OZQ7v4A@mail.gmail.com>
 <875yd7vv6o.fsf@pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <875yd7vv6o.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 16/1/23 07:40, Markus Armbruster wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
>> On Mon, 9 Jan 2023 at 14:19, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>>
>>> On 9/1/23 14:33, BALATON Zoltan wrote:
>>>> On Mon, 9 Jan 2023, Philippe Mathieu-Daudé wrote:
>>>>> Use the same property name than the TYPE_PFLASH_CFI01 model.
>>>>
>>>> Nothing uses it? Can this break command lines and if so do we need
>>>> deprecation or some compatibility function until everybody changed their
>>>> usage?
>>>
>>> Good point... I missed that :/
>>
>> That should not be possible, because the cfi02 device
>> is a sysbus device that must be mapped into memory. There's
>> no useful way to use it on the QEMU commandline; the only
>> users are those creating it from C code within QEMU.
> 
> I'd say beware of -global, but "fortunately" cfi.pflash01 cannot work
> with it, since its '.' sabotages the -global's syntax.

But we use it in tests...:

$ git grep global.*cfi.pflash
tests/qtest/pflash-cfi02-test.c:266:    " -global driver=cfi.pflash02,"
tests/qtest/pflash-cfi02-test.c:268:    " -global driver=cfi.pflash02,"
...

> Related prior discussion in the cover letter of "[PATCH RFC 0/1] QOM
> type names and QAPI" and the replies to it:
> 
>      Message-Id: <20210129081519.3848145-1-armbru@redhat.com>
>      https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg07541.html
> 
> The patch there became commit e178113ff6 "hw: Replace anti-social QOM
> type names".
> 
> [...]
> 


