Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 546DF33DA31
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 18:04:32 +0100 (CET)
Received: from localhost ([::1]:60548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMD7O-0000Tq-Rs
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 13:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMCyc-000843-Hr
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 12:55:26 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMCya-0000gL-3Y
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 12:55:26 -0400
Received: by mail-wr1-x42e.google.com with SMTP id 7so10839819wrz.0
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 09:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iD5eKMA5qck02YJpK40L1u/BinpK4jz8TdIP1ofaw9s=;
 b=bOC4wbKHOthQ4nieE9WPOsV8RZd0pISDgKMXxKTjJTNwPV8xTg9IzKm5QWqUt2s6b3
 MC1WFhzJbnfH0qeJiZDLBzdmruN8sBsAhmv483m4FenXTkEiRKaEdCtEzdhE9IMP7w2c
 kuLPiaRJ6dNJ9Ff7qrEBlXnx/4ukVxjnk7h1TPBHFZIbKgLMjpDnoyT2bCSu9YwuSIkM
 lhvf7MhMcx+06+EH435h9J6T89dtauLkAMHeMvQI92d0piCsxNy/YBvosttEayqkpX8t
 /O2dt1mbs2h4YpxGJdXRGyNFsc+JUcyDu6KOw/ZuSUrgEDXT/F3euzH/N55ADwth1B5H
 5cbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iD5eKMA5qck02YJpK40L1u/BinpK4jz8TdIP1ofaw9s=;
 b=k4LRCUNiV+6hclOJukhA11cnkjOl8BvwaWAxVD5aTVfy3FkbSbV3Bju6VYHzKgZeDU
 2kxsSfs0oxar/cvP46c/c1RagBMlc1/+GdNu2xaVssfjVlK+JqYK2cbwingvSoMPnfj9
 PR9s8lHu7Z7rCsCW+bhjD5EDasVXAAy2cGo3CMtfm92iDkfysx9NtjV1zoJ/1zuDj03X
 OV/aCWbCTnjlJv/VaEPPKznpqbYU2CgZqLhoykg95X7AyvQ0JaD7mPnXPyl4qn/6roAG
 dQb33f226LBmuzIYbB9sdmIPQoEMKmO7PqerVEEokeTEqXDjD1aUamDhvEofk45EGhiX
 XT/w==
X-Gm-Message-State: AOAM5332yUcRklNQdi9tk2WPcM5l+jz4N9ml0lWAF7EMnqfBsviXceEM
 xlpHa1UQGMxToaf3IcR2K8k=
X-Google-Smtp-Source: ABdhPJy/lPLuRQTB0KeIVIo3TKpgn/NrXCj3f3LMdaOt8yLgDlcFtNtiPnwdQ98tE0iafhZZsaZkCQ==
X-Received: by 2002:adf:ec46:: with SMTP id w6mr5826179wrn.213.1615913722281; 
 Tue, 16 Mar 2021 09:55:22 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id v189sm43110wme.39.2021.03.16.09.55.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 09:55:21 -0700 (PDT)
Subject: Re: [PATCH] target/mips: Deprecate Trap-and-Emul KVM support
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
References: <20210312010303.17027-1-jiaxun.yang@flygoat.com>
 <6169a38a-884c-ed4c-141e-4d3974b6554b@amsat.org>
Message-ID: <ecdc800f-cbb3-5cc0-30f6-8db7bdefa2c2@amsat.org>
Date: Tue, 16 Mar 2021 17:55:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <6169a38a-884c-ed4c-141e-4d3974b6554b@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jiaxun, ping for moving the section?

On 3/12/21 10:43 AM, Philippe Mathieu-Daudé wrote:
> +Paolo/Thomas/KVM
> 
> On 3/12/21 2:03 AM, Jiaxun Yang wrote:
>> Upstream kernel had removed both host[1] and guest[2] support.
>>
>> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/commit/?id=45c7e8af4a5e3f0bea4ac209eea34118dd57ac64
>> [2]: https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/commit/?id=a1515ec7204edca770c07929df8538fcdb03ad46
>>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>>  docs/system/deprecated.rst | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
>> index cfabe69846..a409c65485 100644
>> --- a/docs/system/deprecated.rst
>> +++ b/docs/system/deprecated.rst
>> @@ -496,3 +496,11 @@ nanoMIPS ISA
>>  
>>  The ``nanoMIPS`` ISA has never been upstreamed to any compiler toolchain.
>>  As it is hard to generate binaries for it, declare it deprecated.
>> +
>> +KVM features
>> +-------------------
> 
> "------------" else Sphinx complains.
> 
>> +
>> +MIPS Trap-and-Emul KVM support
> 
> Missing "since which release" information.
> 
>> +
>> +The MIPS ``Trap-and-Emul`` KVM host and guest support has been removed
>> +from upstream kernel, declare it deprecated.
>>
> 
> What about adding an accelerator section and add this as a sub-section?
> 
> -- >8 --
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index a4515d8acd3..9c702a4ea7b 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -292,6 +292,15 @@ The ``acl_show``, ``acl_reset``, ``acl_policy``,
> ``acl_add``, and
>  ``acl_remove`` commands are deprecated with no replacement. Authorization
>  for VNC should be performed using the pluggable QAuthZ objects.
> 
> +System accelerators
> +-------------------
> +
> +MIPS ``Trap-and-Emul`` KVM support (since 6.0)
> +''''''''''''''''''''''''''''''''''''''''''''''
> +
> +The MIPS ``Trap-and-Emul`` KVM host and guest support has been removed
> +from upstream kernel, declare it deprecated.
> +
>  System emulator CPUS
>  --------------------
> 
> ---
> 

