Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B62C4E3C4C
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 11:19:19 +0100 (CET)
Received: from localhost ([::1]:38500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWbbi-0004Fl-97
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 06:19:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWbZT-0001rH-LR; Tue, 22 Mar 2022 06:16:59 -0400
Received: from [2a00:1450:4864:20::32c] (port=40507
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWbZS-0006fl-1m; Tue, 22 Mar 2022 06:16:59 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 v130-20020a1cac88000000b00389d0a5c511so1321780wme.5; 
 Tue, 22 Mar 2022 03:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=uY1qwecAKkjbfoa/EKuoDdUSmFzBHTm19+p5FTH2LBU=;
 b=WI5n42NJDps03MwbqSDwBmiq1QheIt6rgk5iS16fVLPs2eMfbS3tTu9zMJtbWUWsvB
 7ljYxJ8DRoR7A/5DZ22RPz7Wc+Rhh13VTaR1VglVnx+DnKC7SB8m5nWi2fRgXqcNbmVo
 pXR8LOirk5cZSS6LQ2pNzTA+rXZIAbjLZf2lUyRIzJJBtSc6dU3gyvWokeGyGlYq7toB
 dUDeSX1AZFuRbDSLCj7kYhVaG7T3rPipzm8G6tptUd9K9bIOBm+Ey6Bv40vk1fCd05m+
 JgOQuXvck39HgzCeOeqil2QWwdIjkPjGnpMszeVU1+TDCjI/TFoW28933Zz61tbe4LFw
 +tzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uY1qwecAKkjbfoa/EKuoDdUSmFzBHTm19+p5FTH2LBU=;
 b=q5h/SX0I2bvUWwfcrTfnvYy7oS/N35EvwzwycQawllTkmygCuLOoz3+1l9GXsFxP+x
 PJpyFMWogb0tbmWGwfSAanO/mHTBEhSjtcFq3GURde20T2DcLbcbrb1Jsv+3mCECjDj7
 eC+50sWnjv0NlAHp9O6+NggClCEMlLaLtwPV+fUNBVS16FF6ysHINiRlLXQs2R4ebCx0
 YZxBi8QvNuODkx65oMPamT8eUyIvGDA5L5zetPaCZKIJZpqDPoLgy1QZWZZyyhovEBZ4
 /eGvOxFAtP1D0/mfyEj/Iby1tyycZdOwdguz6TjzrGjYXPrRME865k4PAkugTVvxgf8Q
 kmIg==
X-Gm-Message-State: AOAM531gtHWZ7KDGtCR3ON8fRnhesvls5rOmgdOpyLL/5RZG+DFZdJBz
 roPwKhrqkPs8ww4TcFTqJZ4=
X-Google-Smtp-Source: ABdhPJz+10ooDWlPsYx8vX6GdDgzfvHO/Ql6S99m4ESdyBxlVR58sZBEEQbMVN8XEUkQ/DXlkeQgpw==
X-Received: by 2002:a05:6000:2cd:b0:204:1bf4:e4f8 with SMTP id
 o13-20020a05600002cd00b002041bf4e4f8mr5109089wry.682.1647944216335; 
 Tue, 22 Mar 2022 03:16:56 -0700 (PDT)
Received: from [192.168.1.33] (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 d1-20020adffbc1000000b00203de0fff63sm15550702wrs.70.2022.03.22.03.16.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 03:16:55 -0700 (PDT)
Message-ID: <a85f9adc-1db9-860f-0194-a32a47601aa9@gmail.com>
Date: Tue, 22 Mar 2022 11:16:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH] target/avr: Drop avr_cpu_memory_rw_debug()
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, Michael Rolnik <mrolnik@gmail.com>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20220322095004.70682-1-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220322095004.70682-1-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 22/3/22 10:50, Bin Meng wrote:
> CPUClass::memory_rw_debug() holds a callback for GDB memory access.
> If not provided, cpu_memory_rw_debug() is used by the GDB stub.
> Drop avr_cpu_memory_rw_debug() which does nothing special.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
> 
>   target/avr/cpu.h    | 2 --
>   target/avr/cpu.c    | 1 -
>   target/avr/helper.c | 6 ------
>   3 files changed, 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

