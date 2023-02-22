Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1E069F512
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 14:04:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUolW-0005kN-Oi; Wed, 22 Feb 2023 08:02:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUolP-0005hY-23
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 08:02:27 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUolN-00088J-DG
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 08:02:26 -0500
Received: by mail-wr1-x435.google.com with SMTP id v3so7565136wrp.2
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 05:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fk4C97kxnAA9h3Y9yfdr5Z6NRvZF1g311GHHL8mFEwU=;
 b=tFR6cBhrC/dnh2RlJQWrtElMHE7UnosFKTMEw2ggPq57cRADbIGfNWdXg796/VVpeJ
 bWOoD6ZYmB9mP9yPO+7B2imbvAKVjVbFtkQDgofJMJ8gIIkpJcKP4bWI1IbKCKhjDUzp
 5DoEUc8nEdKbMpzTJTGBm/3hw+++QpA0PX9WLpTVoNzQ3YkvG8TQ79KicnF4d8iRcocd
 WnbDKwDDsKbTn1sXh8ORD9qLB+tlZNf6GJ659fZls5hClUZalIn4xnorfyglvNMPQPem
 0NPKEI92G1Dfg1I8Ss8DZiA7NQyyICuvZIJqipcaFhXxsqfNl8JJUxk+YuvZwVgvkenQ
 UnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fk4C97kxnAA9h3Y9yfdr5Z6NRvZF1g311GHHL8mFEwU=;
 b=H8tlqXv2bWyLlCTp/6LrpzuibT07Xrtjd8LWkbaaHLwnih0XeabDvFBaEWpnONAl4p
 sDhCGzyiwdnA888VrzAW+tNvzD/XVj4UBTgZo6o5e7BQtGfJ2pGKQ2AwAHGiJIdh/kuc
 BmwSdRY2XHOkoFngLAe3uMfEFfCJ4UrVSTB+cQC8yovKVdNacUwVQWrSd99HkR2uoAI7
 KynSc1kime4jwm1XBDe9rPN8O7V2tzfdjPTll2MJF4TibdabBRtkGkImivKhDThNfS//
 1hWPbccyGVHMFJopPZz04AkVxNOd3LFNss5Zo+/B7GS2XDb4cxH3lL5lI3dbNByb07JH
 f5qw==
X-Gm-Message-State: AO0yUKV10PQCm2fG1DEC/+vHIOJSLXsNpcoJiZFGLVdGHeVb1O8gRy0o
 wzfW25rckmc5e4Fmv0SWiPrr8g==
X-Google-Smtp-Source: AK7set+ZFNQ13hQeuCP2iyVCTZmQhu7tlPXmmvNJ72+FLPJjJw7+65n/L48AjzlCJDE4F6V3+HVyQA==
X-Received: by 2002:a5d:68cb:0:b0:2c7:70c:2d8c with SMTP id
 p11-20020a5d68cb000000b002c7070c2d8cmr4107057wrw.35.1677070943700; 
 Wed, 22 Feb 2023 05:02:23 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c15-20020adffb4f000000b002c55b0e6ef1sm7962417wrs.4.2023.02.22.05.02.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 05:02:23 -0800 (PST)
Message-ID: <e194dc4a-50e3-af66-67f0-774b9185ee40@linaro.org>
Date: Wed, 22 Feb 2023 14:02:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 3/5] bulk: Replace [g_]assert(0) -> g_assert_not_reached()
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Rob Herring <robh@kernel.org>, Peter Maydell <peter.maydell@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Corey Minyard <minyard@acm.org>, Laurent Vivier <lvivier@redhat.com>
References: <20230221232520.14480-1-philmd@linaro.org>
 <20230221232520.14480-4-philmd@linaro.org>
 <484c6eed-cf57-14b3-ba38-3ed4cbad2df6@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <484c6eed-cf57-14b3-ba38-3ed4cbad2df6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.102,
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

On 22/2/23 12:56, Thomas Huth wrote:
> On 22/02/2023 00.25, Philippe Mathieu-Daudé wrote:
>> In order to avoid warnings such commit c0a6665c3c ("target/i386:
>> Remove compilation errors when -Werror=maybe-uninitialized"),
>> replace all assert(0) and g_assert(0) by g_assert_not_reached().
>>
>> Remove any code following g_assert_not_reached().
>>
>> See previous commit for rationale.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
> ...
>> diff --git a/hw/net/i82596.c b/hw/net/i82596.c
>> index ec21e2699a..eda0f586fb 100644
>> --- a/hw/net/i82596.c
>> +++ b/hw/net/i82596.c
>> @@ -285,7 +285,7 @@ static void command_loop(I82596State *s)
>>           case CmdDump:
>>           case CmdDiagnose:
>>               printf("FIXME Command %d !!\n", cmd & 7);
>> -            assert(0);
>> +            g_assert_not_reached();
>>           }
> 
> While looking at this patch a second time, this hunk caught my eye. It 
> looks like the guest could use these commands to crash QEMU? Should this 
> be a qemu_log_mask(LOG_UNIMP,...) + graceful return instead?

I didn't want to have to worry about that, but you are right, sigh.
I'll review each case and add a preliminary patch to clean the
dangerous ones.

