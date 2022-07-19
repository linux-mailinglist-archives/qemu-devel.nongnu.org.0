Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCA4579241
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 06:58:05 +0200 (CEST)
Received: from localhost ([::1]:49790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDfJ6-0007i9-5i
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 00:58:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1oDfH1-00064b-SA
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 00:55:55 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:35383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1oDfGz-00010B-HO
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 00:55:55 -0400
Received: by mail-pg1-x532.google.com with SMTP id r186so12486705pgr.2
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 21:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=gifMuAJ4eogAHUec71pdUYTkUZ6hkjvPEFWz4IM6agw=;
 b=wngm9oAy7MIfjSuhmbjfyP6vClp5qDJbf6I333GXwjS8TScbKhyBOOvUxdQNqAXx/g
 IFgQEJ3dYG4J7zFES/UNoEvPd5JnmtUceKeg7ZQqX8eDllu2f+xyWrp/85V0L/MQGJ8l
 0vk5zgyqo/x8c8fwQ6CIVz/WS9d/bzSMGoIz8FQJMYsU9uutWu59JJQK7DBvHh4Be9AO
 w/MNaGLMCci19j6PPjezWfIvkqgMtXGJdMVmqee8qYt31FIPol41hgdeDmN2qDZ/pN16
 7j4A4M85wCq6bNaXLamKg3Ov3QRUNQbZX+LZHzYezesbkVj8PeO6HF0+fAAneTXna0hy
 lrHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gifMuAJ4eogAHUec71pdUYTkUZ6hkjvPEFWz4IM6agw=;
 b=uqmQarT1TraJVl5rtmjyqHA5/ZU0AxuUuFd7PvkbwO43MFk8ozN16K+T8RGPU+8Vfy
 LXw5OrZVRSYLjuh5IEfpL+83M6HbyN52SV3pbuOYpehmwZY4zFjB1YcPsnRTEXYaS75T
 lUfsgogncRZPRyZxKu9O95iBMudzFMwzF3THsBo5H54tsQ9eWtkltyQ4RW86A9qyJauN
 IsgFg42i32/ApybdsuZp1k+SFohhK+IN8OxA2tL5eZq9MWjgQTrEhhmaUT7JWjhbz2WF
 nhTPDTcNbRa+3zTftnT5k7G5090fEPF4Ocf7MIeEm64wclh5gJ3buiPWCxut1ZjLxjzC
 9imA==
X-Gm-Message-State: AJIora9DEXei94yQ7JWgm2laJeAw26meylCYD1xMnbzGcV1gJuHynDHG
 odsZSrbk0/t9RPwCpIo7KWc5Ag==
X-Google-Smtp-Source: AGRyM1siZCoCXtOJIRuaaroDgBzvZtTML0xDfcYcf4O8wd1j+zyyDPFWJcC/nhFjl//ViWfo0//K/w==
X-Received: by 2002:a05:6a00:23c7:b0:52b:3246:3cc6 with SMTP id
 g7-20020a056a0023c700b0052b32463cc6mr23087718pfc.10.1658206550581; 
 Mon, 18 Jul 2022 21:55:50 -0700 (PDT)
Received: from [192.168.10.153] (203-7-124-83.dyn.iinet.net.au. [203.7.124.83])
 by smtp.gmail.com with ESMTPSA id
 e125-20020a621e83000000b005292729cc5csm10121017pfe.160.2022.07.18.21.55.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 21:55:49 -0700 (PDT)
Message-ID: <914fa41e-e563-a294-4b46-8fd7a2ce8184@ozlabs.ru>
Date: Tue, 19 Jul 2022 14:55:44 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:103.0) Gecko/20100101
 Thunderbird/103.0
Subject: Re: [PULL SUBSYSTEM qemu-pseries] pseries: Update SLOF firmware image
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
References: <20220110050454.3689863-1-aik@ozlabs.ru>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20220110050454.3689863-1-aik@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=aik@ozlabs.ru; helo=mail-pg1-x532.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I just pushed another update to SLOF but before I do pull request - I 
usually wait for it to sync up with git.qemu.org but the syncing does 
not seem happening this time, is that still supposed to work like that 
with gitlab too?


On 10/01/2022 16:04, Alexey Kardashevskiy wrote:
> The following changes since commit 0625c7760d5451d7436ef0738f763c6bb5141919:
> 
>    target/ppc: do not call hreg_compute_hflags() in helper_store_mmcr0() (2022-01-04 07:55:35 +0100)
> 
> are available in the Git repository at:
> 
>    git@github.com:aik/qemu.git tags/qemu-slof-20220110
> 
> for you to fetch changes up to 1c127fa8e2ff2b034ebf8e50faea2bbc5136afd2:
> 
>    pseries: Update SLOF firmware image (2022-01-10 15:31:14 +1100)
> 
> ----------------------------------------------------------------
> Alexey Kardashevskiy (1):
>        pseries: Update SLOF firmware image
> 
>   pc-bios/README   |   2 +-
>   pc-bios/slof.bin | Bin 991920 -> 992384 bytes
>   roms/SLOF        |   2 +-
>   3 files changed, 2 insertions(+), 2 deletions(-)
> 
> 
> *** Note: this is not for master, this is for pseries
> 
> The only change is that SLOF is compiled with -mcpu=power5
> to make it work on PPC970 too.
> 

-- 
Alexey

