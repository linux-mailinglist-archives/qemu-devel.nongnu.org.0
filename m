Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D704E3C96
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 11:40:16 +0100 (CET)
Received: from localhost ([::1]:59746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWbvz-0002oE-AK
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 06:40:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWbup-0001cA-S4; Tue, 22 Mar 2022 06:39:06 -0400
Received: from [2a00:1450:4864:20::336] (port=38900
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWbuk-0001ty-4u; Tue, 22 Mar 2022 06:39:03 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 j13-20020a05600c1c0d00b0038c8f94aac2so1463082wms.3; 
 Tue, 22 Mar 2022 03:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=VTQgPQdrLJha+Ji9rSJTUEGVJCTljrOhnRHCxEOXk8c=;
 b=lpz7G8pgEvrscSSHEOu1c5zIydglHQYhykZz1MR0vE3inDtZjyHaiyT9C1aDeO9WJy
 ItOTmxQ8jyAraxyOyxpLkchJAoU3iBajp8Jf7W+0viCNCg6G1ZEf/DM4XkzKWiwULvgo
 gSzhYkPt46gmAd5O2ytbCdl394/nuWUvFodsovn6c8X6tbWb/eFEZ3QNry8N06EkHkSj
 hxAo67PtAJ8NmcYrDdcojpoTDcM5+OKPYFwCV5U1pMN3gE7FIpJ+nJC/D3y1/60DQj/8
 UyEuwXHaCGjESuANA13hgEj43Zn9U/SqNPHfywk1a/YaKBE/uknKcxdz57CwfsxWuhX0
 SNFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VTQgPQdrLJha+Ji9rSJTUEGVJCTljrOhnRHCxEOXk8c=;
 b=teqbRFvjYkk7GsXbx4LoPX/4ZZCxiWmDEtBZ5FX3l8inKmHChWXNwmLSKlUhWmgY4+
 Tc536gFids+SaNGS5hMyqmAyzsPiqRrwkb2Ed+iivX9u+CZQgTKwqHdbu5QjDUGDoHjH
 Ix3qqWfpPci0s49a+TuOG3aCuHMyLnhu1m7/MKn2Y3X1SokXr4lAs/Ae3BHCwtxTlR3D
 /WGbhP0WclET0s84jErlhv++QcU5T/kgKtXvj8Xp0uTpsJyDpfT6PdsXHlwa854IC2Gj
 Ag6Q3tWNvWqQJ+fMvPPGiV2vfZdDxUh620jR0kQEy04mxpLha9vsnEvI+gTMpEn2c3KU
 TbWw==
X-Gm-Message-State: AOAM532bpi+e2TX7OhekWF+4aRDYC2xHxOoRoHAUYd2VcDX9p+GdTEnZ
 f9jjKHNrzgY2Xhe4WbTovxA=
X-Google-Smtp-Source: ABdhPJzLxhPH1409552s9zQNfY+RylMJNigfkB/8PWnibMMgTnt2tvtWIiPL6Pjn0yiVjgjQNK5WKw==
X-Received: by 2002:adf:dd8d:0:b0:203:f8c4:262 with SMTP id
 x13-20020adfdd8d000000b00203f8c40262mr15335573wrl.680.1647945536109; 
 Tue, 22 Mar 2022 03:38:56 -0700 (PDT)
Received: from [192.168.1.33] (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b0038c9249ffdesm1811134wmq.9.2022.03.22.03.38.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 03:38:55 -0700 (PDT)
Message-ID: <afdadedc-1d35-068b-ccde-12897f9bea34@gmail.com>
Date: Tue, 22 Mar 2022 11:38:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.0] hw/intc/arm_gicv3_its: Add missing newlines to
 process_mapc() logging
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220322102824.3474956-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220322102824.3474956-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
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

On 22/3/22 11:28, Peter Maydell wrote:
> In commit 84d43d2e82da we rearranged the logging of errors in
> process_mapc(), and inadvertently dropped the trailing newlines
> from the log messages. Restore them.
> 
> Fixes: 84d43d2e82da ("hw/intc/arm_gicv3_its: In MAPC with V=0, don't check rdbase field")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> index b96b874afdf..d9c741f5fdd 100644
> --- a/hw/intc/arm_gicv3_its.c
> +++ b/hw/intc/arm_gicv3_its.c
> @@ -524,12 +524,12 @@ static ItsCmdResult process_mapc(GICv3ITSState *s, const uint64_t *cmdpkt)
>       trace_gicv3_its_cmd_mapc(icid, cte.rdbase, cte.valid);
>   
>       if (icid >= s->ct.num_entries) {
> -        qemu_log_mask(LOG_GUEST_ERROR, "ITS MAPC: invalid ICID 0x%d", icid);
> +        qemu_log_mask(LOG_GUEST_ERROR, "ITS MAPC: invalid ICID 0x%d\n", icid);

(pre-existing: "%u" format, since icid is uint32_t)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>           return CMD_CONTINUE;
>       }
>       if (cte.valid && cte.rdbase >= s->gicv3->num_cpu) {
>           qemu_log_mask(LOG_GUEST_ERROR,
> -                      "ITS MAPC: invalid RDBASE %u ", cte.rdbase);
> +                      "ITS MAPC: invalid RDBASE %u\n", cte.rdbase);
>           return CMD_CONTINUE;
>       }
>   


