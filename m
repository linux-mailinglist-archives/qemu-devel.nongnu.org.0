Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5572629F18
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 17:31:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouyoL-00053c-IX; Tue, 15 Nov 2022 11:29:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ouyoH-00051f-BE
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 11:29:17 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ouyoF-0000xz-34
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 11:29:16 -0500
Received: by mail-ed1-x52f.google.com with SMTP id z18so22623686edb.9
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 08:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MKL3A5WWwBVEhqir2rijShdxdWvx2zhjv421ik5RtUM=;
 b=Hxq2xX/MlLrNE4iMwA2StkrnsVLuThl+Z7oqIdnMm9yGVygynvqAIu0aaqWI2bWCyP
 IfCl8GSJmPgGdW2tcI8jJr2g+IZa6LYFwZWxASVExhuaoMVp6NptewKbWpUnvzJqBZ6t
 LQzVuuF0nOR1q7Cc2g2yUcRTzQZBgjfiiVHCHNFWAqw+Kat6g+MUBGsKaG8DUfLBd3Jd
 Plxv8B1ODbu/ovv67qeAst8sEXJv4erB5QzR0qxYxVnsUSUAO/rQzTEctJkrsjQ+fR7t
 r5W2PVkqCwXpFZNBBTyJooA/0fzifW/AyCZWIH4dK69B45vCtAFhh1qdMdq3vKCWCH/j
 4Eeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MKL3A5WWwBVEhqir2rijShdxdWvx2zhjv421ik5RtUM=;
 b=0zVy+KXsG4KJazQClpypZcOQB+OcymcnlinOghoAsrShsTdzPHeYfIL9jZbyRjTqA4
 YLd3wgHsBVysiVZgnXEi4UbzSpm+tD9E8wWH/PGuKmp0k7KCoW6XcAuXo/YoGYbygClS
 i9WEwoOZh4DfKU5/FSnT/mEKSVF8bO/ByQnQubLBH2Je2JIwatL1fFtL3ofFvEhf3Nb7
 lgn9PiLHsZeOH+6F8ttKyVWSCpbk1kXY4SggJmT5aGg6TWGEHciBrgHLS6hdze0OQSfv
 i28hANjCUY+LGpqzQLlH+NOoKMRbBi+hYiVXyHXDjNKgwtfQkYTm/JvSH5iJQ+0imZ7U
 DXaA==
X-Gm-Message-State: ANoB5pl270cJBfWWhESf/48ww8p/hf02paF4+f2CVY9zVe4ZuRPkgArR
 0qC2HGIwRff25Mh809zZeJOXBQ==
X-Google-Smtp-Source: AA0mqf5l3PgmU/vgOwiOvYtESKDlz9hoD9KPPSAQllImcSXWob0zhVuyKmGOIkHWTbJM0FFs4kfm+A==
X-Received: by 2002:aa7:d798:0:b0:458:ed79:ed5 with SMTP id
 s24-20020aa7d798000000b00458ed790ed5mr15708209edq.374.1668529752508; 
 Tue, 15 Nov 2022 08:29:12 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906201200b0079800b81709sm5655788ejo.219.2022.11.15.08.29.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 08:29:11 -0800 (PST)
Message-ID: <8900f3f8-0993-b479-8080-0276d20b0c4b@linaro.org>
Date: Tue, 15 Nov 2022 17:29:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/2] hw/intc: add implementation of GICD_IIDR to Arm GIC
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20221115161736.2425584-1-alex.bennee@linaro.org>
 <20221115161736.2425584-3-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221115161736.2425584-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 15/11/22 17:17, Alex Bennée wrote:
> a66a24585f (hw/intc/arm_gic: Implement read of GICC_IIDR) implemented
> this for the CPU interface register. The fact we don't implement it
> shows up when running Xen with -d guest_error which is definitely
> wrong because the guest is perfectly entitled to read it.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>    - checkpatch fixes.
> v3
>    - re-base on re-flow with if
> v4
>    - fix the commit message
> ---
>   hw/intc/arm_gic.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index 1a04144c38..7a34bc0998 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -973,8 +973,18 @@ static uint8_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
>               /* GICD_TYPER byte 1 */
>               return (s->security_extn << 2);
>           }
> -        if (offset < 0x08)
> +        if (offset == 8) {
> +            /* GICD_IIDR byte 0 */
> +            return 0x3b; /* Arm JEP106 identity */
> +        }
> +        if (offset == 9) {
> +            /* GICD_IIDR byte 1 */
> +            return 0x04; /* Arm JEP106 identity */

Possible future cleanup, define JEP106_ID_ARM:

$ git grep 0x43b
hw/intc/arm_gic.c:1671:            *data = (s->revision << 16) | 0x43b;
hw/intc/gicv3_internal.h:743:    return 0x43b;
hw/misc/armv7m_ras.c:26:        *data = 0x43b;

> +        }
> +        if (offset < 0x0c) {
> +            /* All other bytes in this range are RAZ */
>               return 0;
> +        }

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


