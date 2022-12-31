Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC92665A4B6
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Dec 2022 14:44:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBc9h-0000AG-2B; Sat, 31 Dec 2022 08:44:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBc9e-0000A6-Pz
 for qemu-devel@nongnu.org; Sat, 31 Dec 2022 08:44:06 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBc9d-0006Kw-3M
 for qemu-devel@nongnu.org; Sat, 31 Dec 2022 08:44:06 -0500
Received: by mail-wr1-x432.google.com with SMTP id y8so22410603wrl.13
 for <qemu-devel@nongnu.org>; Sat, 31 Dec 2022 05:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CN+DB5qaFYYEw8DQYsdst303hQ9tPrMxbKByi1m+4xg=;
 b=naEpZJwwLw1BxK1G1wG1S9qLh4pZQEyTxidrKLS6JEe3ZGeuwLrATYBCXlPpMmqVZb
 KqxTVnBvXpazZrNIRXGBbjbaMZ5oF7zoAqAs1HODWhicU84e9RFUN0CI27ZvGZGhJoI6
 qRTlUafaD91G2NUA2qjaU/aLxt4lAWLawwiJGdIBvxSYfLiP2u8eg0D/gBButQWzX7x4
 LFGoleCJSnQmMEw+nY/ako1M8AxPe3p8rN5HgBty2IIL3S6+mlxQIFVMOWB5l/GHzcuR
 UmeQs+frNArwAkPPBTwiXUssmxdeA/25jUYd5pLLawfCRBtnSXzJWValbi3aERYYTZX0
 LdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CN+DB5qaFYYEw8DQYsdst303hQ9tPrMxbKByi1m+4xg=;
 b=RaTVH+O0zyuc7EEYQ37kWipwWkyhUsxZ88sehRaz46Dtg2uyfSI9FDiRuWda60hc2L
 qVomkadFOyFd8qIaCqKt/nkxTHsZfiRTquCKkSK8/PcFg4sEbPBSKPkfUKzf6jPR0Yzp
 0+AhZMtqoTrG0GHjHfOpzoWOm0ce+KPwdKQv1iKi4c5FHWjZjh1f0TvpMNfhGYXJi3+M
 LvUwtIRebLEh63KhZ+l0wXHTU4OYpJqN3RvJhm6THCdT+FYnz5vW1/T1fK4B9vcM8eFs
 4Bvbbq3YpOqXPVyWpuUmsSA712BCorNouF4GiH2DCJDonFlbHEbzSApVqIIc9tFhRDUl
 AnJg==
X-Gm-Message-State: AFqh2krgfffde5L7mVtc3LP94U0VxsVCoIJ6z9R/pJBbiiuU62bSB2XP
 0Wdzjqg40JebWV1loVzcDIqWGw==
X-Google-Smtp-Source: AMrXdXv/Cn6TnWmstmZfBGc/o6if8HdD3pjUo1QPlJXnucFmGfcvQoWArN6YuIOI0vQJ/vJmdKSbQQ==
X-Received: by 2002:adf:d4c7:0:b0:242:30c8:c368 with SMTP id
 w7-20020adfd4c7000000b0024230c8c368mr23586612wrk.14.1672494242738; 
 Sat, 31 Dec 2022 05:44:02 -0800 (PST)
Received: from [192.168.115.175] (27.red-88-29-181.dynamicip.rima-tde.net.
 [88.29.181.27]) by smtp.gmail.com with ESMTPSA id
 r17-20020adfdc91000000b0027973315213sm18530660wrj.89.2022.12.31.05.44.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 31 Dec 2022 05:44:02 -0800 (PST)
Message-ID: <65f602e2-9067-f1e7-0c94-430e2b75e182@linaro.org>
Date: Sat, 31 Dec 2022 14:44:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/3] hw/mips/malta: Set PIIX4 IRQ routes in embedded
 bootloader
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
References: <20221027204720.33611-1-philmd@linaro.org>
 <20221027204720.33611-3-philmd@linaro.org>
 <9F566248-59DA-46E2-BD56-5DB98E9DB446@gmail.com>
 <2E4C442C-9057-4006-AE8D-123B513ED894@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <2E4C442C-9057-4006-AE8D-123B513ED894@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.153,
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

On 31/12/22 10:53, Bernhard Beschow wrote:
> 
> 
> Am 21. November 2022 15:34:05 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
>>
>>
>> Am 27. Oktober 2022 20:47:19 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
>>> Linux kernel expects the northbridge & southbridge chipsets
>>> configured by the BIOS firmware. We emulate that by writing
>>> a tiny bootloader code in write_bootloader().
>>>
>>> Upon introduction in commit 5c2b87e34d ("PIIX4 support"),
>>> the PIIX4 configuration space included values specific to
>>> the Malta board.
>>>
>>> Set the Malta-specific IRQ routing values in the embedded
>>> bootloader, so the next commit can remove the Malta specific
>>> bits from the PIIX4 PCI-ISA bridge and make it generic
>>> (matching the real hardware).
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>> FIXME: Missing the nanoMIPS counter-part!
>>
>> Who will be taking care of this? I have absolutely no clue how the write_bootloader functions work, so I don't see how to fix it.
> 
> Ping

This comment has been taken care of:
https://lore.kernel.org/qemu-devel/a3c3f639-dbb1-88a7-43fe-547a234c5890@linaro.org/

However while testing the MIPS pull request I prepared I
found a bug in the GT64120 which I'm trying to fix since
various days... Unfortunately your series depends on it,
so this is a blocking issue. Sorry for this long delay...

Phil.

