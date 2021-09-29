Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E39BB41C9BC
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 18:08:56 +0200 (CEST)
Received: from localhost ([::1]:49548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVc8d-0007aH-CH
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 12:08:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mVc6N-0005GN-3n; Wed, 29 Sep 2021 12:06:35 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:38736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mVc6B-0000ze-Gi; Wed, 29 Sep 2021 12:06:34 -0400
Received: by mail-wr1-x42f.google.com with SMTP id u18so5176444wrg.5;
 Wed, 29 Sep 2021 09:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JtPiNffr5LLfB1JPSLnSwHr2XB9mX5OjG0f1ZoGKeSo=;
 b=hti1DvLTSzR7BKBJHTzKqrkb19MzeeSb1eyoXyAdktV8yXOWD7uSsKuJQf3C9o9Xvy
 woH4mh6lgZD9zJv17GXbFpoMb5BHoKC5IaQPfibasF25Hn709w2c+EvyXWeywPKdvzFo
 HAzFILoKH9I2M4rb7C1xB/bym33zr8NTQ48QTYysCjVuiYdr1Oqp1EEsKLI3+1NZeLQz
 N/PNTzV9RqPObMxF9DogPnRcX5gZSoKbMOPuIBwxihaDlfoOZZPf3jTewXH5TBt70RhL
 tMXa4P/Rl213vCVWYVYtpdiXaVKmI1sODk6sHbuPdwvw7hMP29oHAe4H539YkNO3Cnlx
 b7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JtPiNffr5LLfB1JPSLnSwHr2XB9mX5OjG0f1ZoGKeSo=;
 b=LZh2QlR4R4cA+FlDHBn5KcOA9CZkrNrC1KggVHemm9GexzC8fbMQfQIj51Ka7v1ywH
 azt1W4X1/otEAYgyU//XoM/AoAS1YTCkKM2GgRrITV4NHqk46P5QXV+5KepAh8Magrc4
 eIR7YcyolGzMAYpDNcCcmiv+7n2ANYQ5uq370KgJK9TkAg3cVsRAwI0Lg2sYZswd0UQS
 5onnd0i9bp5GhK/MqIrESeIzYKuW3EenUw29HFVfB5a7682UreOLj1lEt363/esn9bFd
 3gWBeWl4k600iBzt0PvF75uCtGYAqclT0Ky+pVzcIL0fCdMTRO94wMBa2JK3+1KoFYKJ
 iKTw==
X-Gm-Message-State: AOAM53003bdPjHRGs1xC6wwzsz86ZWRQZfUzjcfDj93xdCxS8gE7TTWm
 2sRhOCUDnUnc6fncw2hbC7g=
X-Google-Smtp-Source: ABdhPJzQzjjqI/Bu/ESl0/InfvaLPNE4qvxfgRycWRxkCYFJKEMyJsYagB5fB9tn53yGpNvgPFUNgg==
X-Received: by 2002:a5d:5281:: with SMTP id c1mr834351wrv.92.1632931580257;
 Wed, 29 Sep 2021 09:06:20 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id d5sm323763wra.38.2021.09.29.09.06.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Sep 2021 09:06:19 -0700 (PDT)
Message-ID: <01ea5ea0-a61c-7bea-e1a6-639e3b9a2988@amsat.org>
Date: Wed, 29 Sep 2021 18:06:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] target/i386: Include 'hw/i386/apic.h' locally
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>
References: <20210902152243.386118-1-f4bug@amsat.org>
 <a4cba848-e668-7cf1-fe93-b5da3a4ac6dc@redhat.com>
 <f3e89488-0d05-657a-34f7-060a7250517d@amsat.org>
 <f9e3c54f-a7cb-a043-f7fd-9d9d0dd61c16@vivier.eu>
 <6fa5f79c-8d3b-9534-26d6-ebe1ba937491@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <6fa5f79c-8d3b-9534-26d6-ebe1ba937491@vivier.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.03,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 haxm-team@intel.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Colin Xu <colin.xu@intel.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Wenchao Wang <wenchao.wang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/29/21 17:16, Laurent Vivier wrote:
> Le 29/09/2021 à 17:00, Laurent Vivier a écrit :
>> Le 29/09/2021 à 16:08, Philippe Mathieu-Daudé a écrit :
>>> On 9/16/21 00:05, Paolo Bonzini wrote:
>>>> On 02/09/21 17:22, Philippe Mathieu-Daudé wrote:
>>>>> Instead of including a sysemu-specific header in "cpu.h"
>>>>> (which is shared with user-mode emulations), include it
>>>>> locally when required.
>>>>>
>>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>> ---
>>>>
>>>> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
>>>
>>> Thank you, Cc'ing qemu-trivial@ :)
>>>
>>
>> Applied to my trivial-patches branch.
>>
> 
> We have a problem:
> 
> .../target/i386/tcg/sysemu/seg_helper.c:145:9: error: implicit declaration of function
> 'apic_poll_irq' [-Werror=implicit-function-declaration]
>   145 |         apic_poll_irq(cpu->apic_state);
>       |         ^~~~~~~~~~~~~
> .../target/i386/tcg/sysemu/seg_helper.c:145:9: error: nested extern declaration of 'apic_poll_irq'
> [-Werror=nested-externs]

Hmm I'll check what changed since I sent that. It was working the day
Paolo Acked, because have the patch rebased / tested on top of commit
c99e34e537f ("Merge remote-tracking branch
'remotes/vivier2/tags/linux-user-for-6.2-pull-request' into staging").

I should have rebased/retested today before Cc'ing you, sorry.

