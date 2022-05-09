Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C95520823
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 01:07:45 +0200 (CEST)
Received: from localhost ([::1]:57084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noCTg-0003So-HA
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 19:07:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1noCSu-0002gU-4I
 for qemu-devel@nongnu.org; Mon, 09 May 2022 19:06:56 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:56120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1noCSs-0005VQ-K3
 for qemu-devel@nongnu.org; Mon, 09 May 2022 19:06:55 -0400
Received: by mail-pj1-x1035.google.com with SMTP id n10so3312971pjh.5
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 16:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Rxeu7EvJFmv2njjemip/ohooJ5CFK5tczlVOgfiqnfU=;
 b=UmV7b3XVlyQTGBBw3tvVlKwQ5VhHUnT7njpAfnIvg1T+XcjddJYPl+TV9CTRVMdQLG
 9LstzkY+tB9qishmX4XIC3MC35ZIfQONAZXvwFzqwAapAGcdawnTEeTZWKngGUTc71wM
 iEUhu6jDIPrFuHty29w9oTbVhM+CPMfxxZ6og2yORRvIGpZ3neQhIuPthb+nB2jn+aMa
 QVSTeqPo9nmrp8IWPGmNVOEtXKwQWUFfd1kZXsTjCntSydeKgADJyBldtkfQ7cYD1+7z
 zlMyHi7MH1HIncmcVAWyhovUNa2iRuG6lVfmFPmJzgI2DHzQ350lUQq9MXzIwz10cmCM
 rBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Rxeu7EvJFmv2njjemip/ohooJ5CFK5tczlVOgfiqnfU=;
 b=51M91rEFUoaEW4oNmXmtcwrIletdadOsIWuNYljsoC7dh6jGtUNKCbBcZ4Lu2l3Gpf
 BC96hDSJYWB5muxFtWsZDxklagi9tnHftw6/bM1cgxSAPp5M0HZb67bKvWmcjXxFKYtm
 l0QvcgddNlmCL9PT6AjsVDdx8SC98iYpszuinoaOj1juaH0xljbCu7lPxqwcG8VGAQ4S
 WNo++KtkVIt9ym2vpLyrJEfX/Hyrh2gzwp1lCVrEsyILphAqx7+Id0R1MeoOR9TahgZS
 6aV4y+Fv9hVH/OGoExXSFs2yqg3wxRR/N6zwOoM0JG4fMTNT0hKu6uD45s5vGJBrn6jU
 DaGg==
X-Gm-Message-State: AOAM530Zr7XOj4Cc2R2bLsEUULMJF+c5vvHigY4NoB+73NwrrRqcpT9O
 ztHOq19NqReng7NTw+ACZ7CnLA==
X-Google-Smtp-Source: ABdhPJzCh6qRZ+1tw79sD9kS8YNtYqJbixWea/7BwKM59/lkEFEB1UUIQsvHcJjM3Q98e8+NUu0Jrg==
X-Received: by 2002:a17:902:c409:b0:15e:bdd3:1fa3 with SMTP id
 k9-20020a170902c40900b0015ebdd31fa3mr18035502plk.67.1652137612866; 
 Mon, 09 May 2022 16:06:52 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 l35-20020a635723000000b003c6e6293205sm711102pgb.74.2022.05.09.16.06.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 16:06:52 -0700 (PDT)
Message-ID: <8fcd98c9-2d94-394d-b2e2-a5d6477d618c@linaro.org>
Date: Mon, 9 May 2022 16:06:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 2/3] linux-user: Have do_syscall() use CPUArchState*
 instead of void*
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220509205728.51912-1-philippe.mathieu.daude@gmail.com>
 <20220509205728.51912-3-philippe.mathieu.daude@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220509205728.51912-3-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 5/9/22 15:57, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé<f4bug@amsat.org>
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   linux-user/strace.c         | 202 ++++++++++++++++++------------------
>   linux-user/strace.h         |   4 +-
>   linux-user/syscall.c        |  32 +++---
>   linux-user/uname.c          |   2 +-
>   linux-user/uname.h          |   2 +-
>   linux-user/user-internals.h |  16 +--
>   6 files changed, 129 insertions(+), 129 deletions(-)

This could probably be split into parts, but not worth the extra effort.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

