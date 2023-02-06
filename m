Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D3B68B705
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 09:02:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOwRk-0002Oc-G0; Mon, 06 Feb 2023 03:01:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOwRg-0002GA-GR
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 03:01:48 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOwRe-0002Qw-G9
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 03:01:48 -0500
Received: by mail-wr1-x42f.google.com with SMTP id d14so9490441wrr.9
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 00:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g84X+YXZv+5zRJZyg9NjsxJ8QaBmxJqzEwr0nGVTb/0=;
 b=h3gPFnXqMgjBxavpi9Cy4jbKWFiKogb51pX1S/gTPF4wtrzONxro2Z5/40UbekwA9G
 /QOiUJSbnBPKwMZiQ0XzY4jNtu+Vo+k1iIKblkvTgs/WG7AGwMcBSNk3n3T7jY10BmGW
 iLt5N5N5D3YTqrG/OGi2YcVsEdvZVlOZSMCVKytOusdB2Q4dcAGJkPb0i2vWAILXbawA
 cm6Ok0QFbFniunb0RAYul21prP9I05RlrXF4JJnYr2OOTXhMpV0Iv6oJ8l1JEKactV0i
 UAoKw1UZi7NyQA61LF7wixlvc7daAjWDfhnff/T8hFoYohIWtMtyoaAlCWg2ZM4tutjJ
 fEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g84X+YXZv+5zRJZyg9NjsxJ8QaBmxJqzEwr0nGVTb/0=;
 b=P/MGXBlsYN79FaxHDAPlBATmFPvt8//KwrAk1AfGFUxD2OvGe5dix6qSpWB3GGC+PT
 VMya1ge23+GP/ycszvZlRkJbvsmyjEazkB8JPMc+rjFJtTIuUiiwjTJDgtIIKwK4BPCH
 0C49653DIbpXW4DMj1TsSLwmu1Tw1bwA4QA4TDqgzzNV479eC36LetXpuoedj7AJLjaT
 g+jl1N76JkiiHGJrh/p1nihqxjkXJoxvVMXB2Te3fbnZFh5gYlk2W2U5pZx7yR3GsRlV
 uh89g954xqKdoxRzHNQ+lHgQ15rgrPnlzgn6bwpNqj/hQupmXkryf2pjftfy0oohZGm8
 vjuA==
X-Gm-Message-State: AO0yUKXRjzPNcjgy4fVZTl1qQOSEghA4PKbnptSykwEEjcraULPRKOA+
 r1EJYIE3ejSq6hRp55UiEaR8Jg==
X-Google-Smtp-Source: AK7set+NjMAJFOTvEE9b+19/lSOk0sdvN+gtDd9LAiBXQusDPk6SrHBlH9CGpq+ePfdV9gDD4PpAnQ==
X-Received: by 2002:adf:dbca:0:b0:2c3:d852:a952 with SMTP id
 e10-20020adfdbca000000b002c3d852a952mr9077444wrj.17.1675670504683; 
 Mon, 06 Feb 2023 00:01:44 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o2-20020a05600002c200b002bde537721dsm8308063wry.20.2023.02.06.00.01.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 00:01:44 -0800 (PST)
Message-ID: <4808b00b-3fed-233b-1f87-a6f4709062da@linaro.org>
Date: Mon, 6 Feb 2023 09:01:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 2/3] hw/isa/vt82c686: Allow PM controller to switch to
 ACPI mode
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: BALATON Zoltan <balaton@eik.bme.hu>, Bernhard Beschow
 <shentey@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Cc: qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Huacai Chen <chenhuacai@kernel.org>
References: <20230129213418.87978-1-shentey@gmail.com>
 <20230129213418.87978-3-shentey@gmail.com>
 <9611ad50-1c60-de0a-e8e0-85b487950888@eik.bme.hu>
 <78bc4dd9-f713-3824-1d87-74f3011b019d@linaro.org>
In-Reply-To: <78bc4dd9-f713-3824-1d87-74f3011b019d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

Forgot to Cc ACPI maintainers.

On 6/2/23 09:00, Philippe Mathieu-Daudé wrote:
> On 31/1/23 15:54, BALATON Zoltan wrote:
>> On Sun, 29 Jan 2023, Bernhard Beschow wrote:
>>> Adds missing functionality the real hardware supports.
>>>
>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>> ---
>>> hw/isa/vt82c686.c | 18 +++++++++++++++++-
>>> 1 file changed, 17 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
>>> index 2189be6f20..b0765d4ed8 100644
>>> --- a/hw/isa/vt82c686.c
>>> +++ b/hw/isa/vt82c686.c
>>> @@ -37,6 +37,9 @@
>>> #include "qemu/timer.h"
>>> #include "trace.h"
> 
>> Why does acpi_pm1_cnt_update() take two arguments for a bool value? 
>> Can these be both true or false at the same time?
> 
> No, this is a one-bit so boolean is enough...
> 
> Maybe unfinished refactor from commit eaba51c573 ("acpi, acpi_piix,
> vt82c686: factor out PM1_CNT logic")?


