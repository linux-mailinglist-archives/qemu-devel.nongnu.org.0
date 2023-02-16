Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B76BF698E4C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 09:09:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSZJW-0007NG-OW; Thu, 16 Feb 2023 03:08:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSZJU-0007N6-E3
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 03:08:20 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSZJS-0007oZ-Mw
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 03:08:19 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 g6-20020a05600c310600b003e1f6dff952so3519642wmo.1
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 00:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QvqdRC6+XZ8k4ubhK/b6H1/ScIhqLezCoBN/JCz15q0=;
 b=l1atOgqFBIDkbzeckl50iCIwjymIn9L1wasauW49WP7sN+pAu2DGAYAD9cKramDxkT
 TnuaJyyqF+M3x7WYeu1i6x3b9DBzUbfaRR2ivw17sGkdvZ47VsU5oWJiLJ5atTRn3dn5
 4EWW7O8f63yUjz3sV9zaCC2ptFUhJ6QDuMXaOEFPaCcnKz2d1vfr9v5sf6vS+CRaoq6f
 a/GKSYDIVmH27bM1qC5bAeWe5w86WVmnt1gur5kSe7wczbLhHCV/+2ReLMxs3KEqVtCS
 TCyGnk7iK9daTnCkGZ9FIdELq/ro0o6gmw2CKqML4guQa4EQMOyclKc0YOFzmL5x9AuF
 RMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QvqdRC6+XZ8k4ubhK/b6H1/ScIhqLezCoBN/JCz15q0=;
 b=elb5zij+KN3wQoS2EB8xHeuf0MoJslFJN7RVqHdzAy6V8NpCPS238qaf63Mg3t/VX5
 zUtYXFhH+BHEVliSd6Glvul6eTiZsciterlZhWd1MqidOGeDyBmtDtvv2KbkHs1caHa0
 auJ2IFYQX/DrfYs7/ftBqfLGS67Tq6ocX0GCZkuUJ3+MCJCRHlbfxsi8tt4zsTPsq54J
 i+gR2LYVfySs08iSdXOf8f89TT+XWBHK1RDVJlcVVp5OUVtev7xaLn5FWDWec2KuGpfR
 DygfkgvruRQcHIQOJ5/dmCQ2w0SmZq32v6oMJgMzTNTJJWNmFym839D2hfBndYyG+eDg
 HCkw==
X-Gm-Message-State: AO0yUKWjdaDIKUS1yYToAzYmnFU9HnxsiC0X3HOyUCVAWtzraTMhYMCB
 /TO7TgyrKRkXjI+uSsj9tewf8w==
X-Google-Smtp-Source: AK7set+jI9Vk+beznpuPN8B0xGTnJ4iQofPkLKVmG8yLwKW+YrhA86el8as4tltmjkcWzIRoe3oW5A==
X-Received: by 2002:a05:600c:4d94:b0:3df:fbc7:5b1d with SMTP id
 v20-20020a05600c4d9400b003dffbc75b1dmr3918829wmp.2.1676534897104; 
 Thu, 16 Feb 2023 00:08:17 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 hn30-20020a05600ca39e00b003db03725e86sm903311wmb.8.2023.02.16.00.08.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 00:08:16 -0800 (PST)
Message-ID: <c57ec7ad-a3b9-c698-e320-3798ffa4fdaa@linaro.org>
Date: Thu, 16 Feb 2023 09:08:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v2 3/4] target/mips: implement CP0.Config7.WII bit support
Content-Language: en-US
To: Marcin Nowakowski <marcin.nowakowski@fungible.com>, qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
References: <20230216051717.3911212-1-marcin.nowakowski@fungible.com>
 <20230216051717.3911212-4-marcin.nowakowski@fungible.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230216051717.3911212-4-marcin.nowakowski@fungible.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 16/2/23 06:17, Marcin Nowakowski wrote:
> Some pre-release 6 cores use CP0.Config7.WII bit to indicate that a
> disabled interrupt should wake up a sleeping CPU.
> Enable this bit by default for M14K(c) and P5600. There are potentially
> other cores that support this feature, but I do not have a complete
> list.
> 
> Signed-off-by: Marcin Nowakowski <marcin.nowakowski@fungible.com>
> ---
>   target/mips/cpu-defs.c.inc | 3 +++
>   target/mips/cpu.c          | 6 ++++--
>   target/mips/cpu.h          | 1 +
>   3 files changed, 8 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


