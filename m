Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEC2402712
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 12:23:11 +0200 (CEST)
Received: from localhost ([::1]:55484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNYFy-0005RP-SV
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 06:23:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mNYEq-0003ib-Qm; Tue, 07 Sep 2021 06:22:00 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:39725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mNYEo-0002R2-PT; Tue, 07 Sep 2021 06:22:00 -0400
Received: by mail-wr1-x42e.google.com with SMTP id z4so13601494wrr.6;
 Tue, 07 Sep 2021 03:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QTa5TnsuH+B8PtZL2t3R7v717uVXFxH6V4paXHM0NsA=;
 b=FBRfWhRhYO/ijC0J7f4oHEtuFSjYw99jyVoLhCI0lQEwMfudrx9kA9gva5B+PU6BC6
 M7mlMxZGgX24AdsXxqj8NjAXh2jRV7et7ksAwBH36OMfXNUnmT+ixeLO+APf4q3cXhOk
 n2skGL3LXiWkfvp+3xKPhhRHdESG8h4RiQPqpctNeU8Mzhe97Jw5H5C39WpF2iNoKRh6
 CEQSOfTz7jMg273ul7nsk3ivh872YcGw/iL2UlTnAXW6N9gARcAFfqGFMEnpMgtUQspA
 xza6rfJk9pfpUOyx2C2AGF7XWvb2OLM9iA9a851Ty9des50mLCcrsULYTy7EPfxrBI7O
 NwGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QTa5TnsuH+B8PtZL2t3R7v717uVXFxH6V4paXHM0NsA=;
 b=Gomo6xXuzfuNHAAT0+1abzztyYt9ROdhkoahrTTj0dOlou9k8SRUX7y5WbYeeIYY0m
 cwzR+26NMriPLtHa3MbA+7UZKIHa7IgKMRsa34eSoFlHCQrigm5JA9rL7Xknm0b0HwcQ
 LeEzg7luJZfUtTRdIvrQAeTY/K5roLl3g2QXaMLZbLAQXsg1lwbYlR+wkxiCbJYAcLPJ
 GBtPPl/SvUgRDvc0yjvQdMRrOFSY+th82wFTRIRtqLJ9/NMfHarycwysA6cZ8M5r2niX
 qNSOC05PcQOXyE6vI8wKwMuT0oJKH/stX16+C6CYPAkSXsTdn5f47PNe3CxRZy6Kn1b6
 Mdrg==
X-Gm-Message-State: AOAM533Owzjh5T/aRMb5S14xnAb4ggA3PB5UrLFIhHJi1TeO2CTKLS1t
 8lOvGmkxjmmX6JK2OpOzhfY=
X-Google-Smtp-Source: ABdhPJyqU7D3swT/tmr5zr97xhwdqjvZWIN9rmgzuHOWXJwWzw8e7i6FIuQGh5to6lgdvhWGdXSxpg==
X-Received: by 2002:adf:9d42:: with SMTP id o2mr18106038wre.295.1631010115744; 
 Tue, 07 Sep 2021 03:21:55 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id z5sm1936712wmp.26.2021.09.07.03.21.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 03:21:55 -0700 (PDT)
Subject: Re: [PATCH 05/10] aspeed/smc: Remove the 'flash' attribute from
 AspeedSMCFlash
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>
References: <20210907065822.1152443-1-clg@kaod.org>
 <20210907065822.1152443-6-clg@kaod.org>
 <497a0a23-570c-964d-80cb-e590749d20f9@amsat.org>
 <31b33d22-6458-308d-afff-a76657824a52@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <63ad98d0-ecda-1c3a-1f68-1c7c32916231@amsat.org>
Date: Tue, 7 Sep 2021 12:21:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <31b33d22-6458-308d-afff-a76657824a52@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.332,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/7/21 11:40 AM, Cédric Le Goater wrote:
> On 9/7/21 10:36 AM, Philippe Mathieu-Daudé wrote:
>> On 9/7/21 8:58 AM, Cédric Le Goater wrote:
>>> There is no use for it.
>>
>> Hmmm this is not the correct justification.
>>
>> This devices sits on a bus, so its state will be released when
>> the bus is released. There is no need to release it manually,
>> so we can remove the reference.
> 
> That's what the code is doing AFAIUI.
> 
> This is just removing the AspeedSMCFlash attribute because it is 
> not used anywhere else than under aspeed_board_init_flashes().
>  
> Is there anything else ? I am bit lost by your comment.

I was thinking of d4e1d8f57eb ("hw/arm/tosa: Encapsulate misc
GPIO handling in a device"), if the device were not created on
a bus, the we'd need to keep this reference, otherwise we'd
leak it.

Anyhow this is board code where we are not releasing anything.

Maybe "There is no need to keep a reference of the flash qdev in the
AspeedSMCFlash state: the SPI bus takes ownership and will release
its resources. Remove AspeedSMCFlash::flash."?

Anyway no big deal with the comment,
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

