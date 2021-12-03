Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E05B4467F74
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 22:44:42 +0100 (CET)
Received: from localhost ([::1]:51712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtGMD-0001Vj-Eg
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 16:44:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mtGKM-0000XD-6H; Fri, 03 Dec 2021 16:42:46 -0500
Received: from [2a00:1450:4864:20::435] (port=39716
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mtGKK-0005nD-KR; Fri, 03 Dec 2021 16:42:45 -0500
Received: by mail-wr1-x435.google.com with SMTP id a18so8473314wrn.6;
 Fri, 03 Dec 2021 13:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jSrhFH3SdFWgjH22Z5qnSeyesEtuOizI8WrELyp6Op4=;
 b=ca+2lwCL/8iwzzN/tbJgpFc9/VRsQiXuzqNkHpwOUbOYNPWyYwG0UrvVxhXHb5Gd9r
 V28M8y/g9lHH1EKQlCPzq+TrX4JaX2Jtn+Rw/f5ToavDmyIJQueJJaPMrygJOPKdfR5X
 GL5AaLc4QVCnGp6rVKOvbR5DQ5GGc/WK33yGgXH/TX4qJ57ddvi+FrWRy6rcXEOPyCCq
 ogcQzLRYpJdbFRJ/e8ubA000vwKjYZ08WxFgK/i79m/edNk588WQTKO9UITEwfCmcMgl
 N/Q68uGb8Xb9niPR5EQQ1joMrYSogXKRr0zWrwkoMrNQpV0aMHVC1EpPQ/wzmuyFklQk
 pzew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jSrhFH3SdFWgjH22Z5qnSeyesEtuOizI8WrELyp6Op4=;
 b=Tfi+7utuHbyG9ua3FbQV/mlLRS3JQB7xH+qIUWQqO11Wbl9JYde0VmgM41ia/EJnV6
 dzQAMF2/hH8l9OiRNB9kLWy+KpQLLBi7kueNggDY50MscTvGKB2MytM+aHvzMQRdx+f0
 UtPI7ddV3r2FvDvIcJz03rXCmLVbw9VEeMLKVQ8VQKH7PDR5BEm7XE4XceZZXpfgqpXR
 tcxWP0il9RkG5wj21un7kQh666QNHPTn3Gszw71Y1IPSb9fZIYna9yX6lJeQz9P5Pjgl
 czKX55BImdeG6+0hOWjgVv6XBEraR2Vs3/A1DoTGlJ4O7ktNWk6Q+SSzjvR4lUF7jcH9
 hzKg==
X-Gm-Message-State: AOAM532ylU3yHFc2+NF4H9UhPa67wq2BqCcJG+mTaRMSFGiFs0yG2zkZ
 beSiSxqgsE5je4xjYb6N4Zw=
X-Google-Smtp-Source: ABdhPJyYWlc94tyfyX6NfJnOF+hpU/rW/cD6NBF9hMgvtqb7gSFE9N7Tu+ZWM57njPTxqf/zJEB0Vw==
X-Received: by 2002:a5d:6d06:: with SMTP id e6mr2391933wrq.210.1638567762591; 
 Fri, 03 Dec 2021 13:42:42 -0800 (PST)
Received: from [192.168.1.34] (abayonne-654-1-109-18.w86-222.abo.wanadoo.fr.
 [86.222.60.18])
 by smtp.gmail.com with ESMTPSA id j18sm8074647wmq.44.2021.12.03.13.42.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 13:42:41 -0800 (PST)
Message-ID: <288266a6-755c-308b-779a-6bf5d6e41207@amsat.org>
Date: Fri, 3 Dec 2021 22:42:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] hw/net: npcm7xx_emc fix missing queue_flush
Content-Language: en-US
To: Patrick Venture <venture@google.com>, peter.maydell@linaro.org
References: <20211203212714.1714362-1-venture@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211203212714.1714362-1-venture@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.938,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: kfting@nuvoton.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 hskinnemoen@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/3/21 22:27, Patrick Venture wrote:
> The rx_active boolean change to true should always trigger a try_read
> call that flushes the queue.
> 
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
>  hw/net/npcm7xx_emc.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/net/npcm7xx_emc.c b/hw/net/npcm7xx_emc.c
> index 7c892f820f..97522e6388 100644
> --- a/hw/net/npcm7xx_emc.c
> +++ b/hw/net/npcm7xx_emc.c
> @@ -581,13 +581,6 @@ static ssize_t emc_receive(NetClientState *nc, const uint8_t *buf, size_t len1)
>      return len;
>  }
>  
> -static void emc_try_receive_next_packet(NPCM7xxEMCState *emc)
> -{
> -    if (emc_can_receive(qemu_get_queue(emc->nic))) {
> -        qemu_flush_queued_packets(qemu_get_queue(emc->nic));
> -    }
> -}

What about modifying as emc_flush_rx() or emc_receive_and_flush()
helper instead?

 static void emc_flush_rx(NPCM7xxEMCState *emc)
 {
     emc->rx_active = true;
     qemu_flush_queued_packets(qemu_get_queue(emc->nic));
 }

>  static uint64_t npcm7xx_emc_read(void *opaque, hwaddr offset, unsigned size)
>  {
>      NPCM7xxEMCState *emc = opaque;
> @@ -704,6 +697,7 @@ static void npcm7xx_emc_write(void *opaque, hwaddr offset,
>          }
>          if (value & REG_MCMDR_RXON) {
>              emc->rx_active = true;
> +            qemu_flush_queued_packets(qemu_get_queue(emc->nic));
>          } else {
>              emc_halt_rx(emc, 0);
>          }
> @@ -740,7 +734,7 @@ static void npcm7xx_emc_write(void *opaque, hwaddr offset,
>      case REG_RSDR:
>          if (emc->regs[REG_MCMDR] & REG_MCMDR_RXON) {
>              emc->rx_active = true;
> -            emc_try_receive_next_packet(emc);
> +            qemu_flush_queued_packets(qemu_get_queue(emc->nic));
>          }
>          break;
>      case REG_MIIDA:
> 


