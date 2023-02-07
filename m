Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7431B68D1C4
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 09:51:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPJgW-0004jC-IL; Tue, 07 Feb 2023 03:50:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPJgT-0004iu-Bg
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 03:50:37 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPJgR-0004rq-Mh
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 03:50:37 -0500
Received: by mail-wr1-x42f.google.com with SMTP id o18so12783970wrj.3
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 00:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c1wmpMStD/at9Qj/mIVfu7+yS5fkgnfmx9smMKOa9n4=;
 b=JNZV05op4HZda2dO+T7sXrKklXCA3ArqGLpc8Ptv0ANHINIz+Fc3kxqu6saadoiXTc
 mM6tOt9FLQgxvIsDTlpTgvqFlasQtblVwL+8QAH/O1OCfh0333ZXkOJTQSpGlkQQDy6n
 +TFkfl4zZIauavauuRzfIfgDxLGh873q46O87RxJ/nH81bNncpFASiNx3llNENxRHIaG
 lnfpORUrd2ZaKtiwIyHl9L+5g/fdzDzMwyS2mvWvnNKGMwAnj5aA78esVLmYnihOmumi
 qDFVMn8bCyhPTFD+AmC+wjDNUH6kxlZ8CDzi+WiWKIV0Pn1VQpSH+vtI4Eadofj6fuqf
 /1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c1wmpMStD/at9Qj/mIVfu7+yS5fkgnfmx9smMKOa9n4=;
 b=U+8XzCwUkG+nrxJWrvPAF8Sq4XiGiFEK5EPWPkKPLfbeLK1WnxiQJVt/ELWzVgr+Tu
 zo2lEkf8vGGyFGWWJZjsU71W9jEHvyVO0THfwJMW1MkOwPSOMaSFv29acYXa7YPr6bWf
 dEjcyKj/y5mPlYEgscp/zAFTy6SYHi6LvvT21PSnZWgu6HDjpBGDV0ahDYhT5bpWjA9A
 oCthqea+X1xfRxmrScN6DyKXnVOU//pY/HWDJOmUi3DvHzoXLjXChDZ1v+CuOxZVPIMl
 P8WyWuDus+AqBmlH7JUhfuD6IN3TCJ/RuX/Ocgrz/2v3KZV+p28xFIxydNq5DOYU8aMu
 ZCWw==
X-Gm-Message-State: AO0yUKWj5YkKm5MSMCzhVeSWMWYscV2YYYxaeuYIzOmjCUPTOJ8onxV8
 SDbzYXfd2mezoyaL6fEhTR0u4g==
X-Google-Smtp-Source: AK7set+OiaqMBt/0rAMpqmjdCAdv7ULdCafuzt+SgiC5oqd3/qc6ucj5W3byVft44lMQ9guJDZ+eWQ==
X-Received: by 2002:a5d:6dcb:0:b0:2c3:be89:7c3c with SMTP id
 d11-20020a5d6dcb000000b002c3be897c3cmr10196251wrz.31.1675759833294; 
 Tue, 07 Feb 2023 00:50:33 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 s2-20020a5d69c2000000b002c3de83be0csm7965965wrw.87.2023.02.07.00.50.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 00:50:31 -0800 (PST)
Message-ID: <25504aa3-20e3-d7e6-4111-c956370949ba@linaro.org>
Date: Tue, 7 Feb 2023 09:50:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 02/10] hw/riscv/virt: Add a switch to enable/disable ACPI
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Andrea Bolognani <abologna@redhat.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Atish Kumar Patra
 <atishp@rivosinc.com>, Ani Sinha <ani@anisinha.ca>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Bernhard Beschow <shentey@gmail.com>
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
 <20230202045223.2594627-3-sunilvl@ventanamicro.com>
 <CABJz62PFGT1H-AArbfTkpiX24mHU=q3wk7h-bpduZhJyy7tTLw@mail.gmail.com>
 <fe3b5794-be2a-eec7-9d4e-9a13eab48378@linaro.org>
 <20230206125610.nmo2bbbd5kosihav@sirius.home.kraxel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230206125610.nmo2bbbd5kosihav@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 6/2/23 13:56, Gerd Hoffmann wrote:
> On Mon, Feb 06, 2023 at 12:18:06PM +0100, Philippe Mathieu-Daudé wrote:
>> On 6/2/23 11:54, Andrea Bolognani wrote:
>>> On Thu, Feb 02, 2023 at 10:22:15AM +0530, Sunil V L wrote:
>>>> +    object_class_property_add(oc, "acpi", "OnOffAuto",
>>>> +                              virt_get_acpi, virt_set_acpi,
>>>> +                              NULL, NULL);
>>>> +    object_class_property_set_description(oc, "acpi",
>>>> +                                          "Enable ACPI");
>>>
>>> The way this works on other architectures (x86_64, aarch64) is that
>>> you get ACPI by default and can use -no-acpi to disable it if
>>> desired. Can we have the same on RISC-V, for consistency?
>>
>> -no-acpi rather seems a x86-specific hack for the ISA PC machine, and
>> has a high maintenance cost / burden.
> 
> Under the hood it is actually a OnOffAuto machine property and -no-acpi
> is just a shortcut to set that.
> 
>> Actually, what is the value added by '-no-acpi'?
> 
> On arm(64) the linux kernel can use either device trees or ACPI to find
> the hardware.  Historical reasons mostly, when the platform started
> there was no ACPI support.  Also the edk2 firmware uses Device Trees
> for hardware discovery, likewise for historical reasons.
> 
> When ACPI is available for a platform right from the start I see little
> reason to offer an option to turn it off though ...

Yeah I concur. There is no point in disabling ACPI on the RISCV virt
machine IMO.

