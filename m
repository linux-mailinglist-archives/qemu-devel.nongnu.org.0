Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BAB4E9F34
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 20:54:13 +0200 (CEST)
Received: from localhost ([::1]:56632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYuVH-0003es-AU
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 14:54:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nYuRb-0002pi-43
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 14:50:23 -0400
Received: from [2a00:1450:4864:20::433] (port=38628
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nYuRZ-0007OW-GQ
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 14:50:22 -0400
Received: by mail-wr1-x433.google.com with SMTP id i4so2847901wrb.5
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 11:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ILbInULJzbNhnrPFBrP/UjuPoXL9yVv41KSvwsOfIW4=;
 b=Z3bpj1UlteS5vBRqsvofEPQwYD93ndbK4UPa1VrqrLWOuo+61+DSSDaVtS5b4aOtwg
 50X4rAVaPMReU8HZ8x8lXdYEyOogkjcqglt5LvBMDrPOgEagwxKWE3aeFhEKVGHhyjuN
 sNNWRe1Uzu8Syyty5pOyCpBrr9+bPu2Xj2bcONRi3lFq9mSt161w0deU5CoFNlesMKKO
 NkrVGraj9BTS/9qWShe01NrjLdQqZEAvk81aZl9+KCUHwzCo7Rj84R1m7+I0H+jBbjMX
 qDNomtJV6TdBKvcB5JwWzr68ts1ugc9N07vwV4649ZPTnZ2cFQhO9zwTXk2ZRCXtINIB
 nWkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ILbInULJzbNhnrPFBrP/UjuPoXL9yVv41KSvwsOfIW4=;
 b=lZtyclNAaAutKp9bDXbeQ/lYeniceZjdL4d+iKd3fiMIG8kCM/D/P4hnkfT4gdXd04
 7YY65BmPvW7D0vqoGu7crmOsk4yKWULSNjdEgP7GjXJszOgrhRykuZBOGwUMJplyhLw/
 R850QoIvYmCBFptq7cIU3kMfbn43oZ61dcSDHlyqEg5nu3oFgxoxUmVNWtyVEbPrVCkS
 FaKF/Eo1gYty65fla/tObgT3xVig+hY7QjZ9bjmi2kDDH9Ma84lJS044A+eC82rlMYY9
 unbVevKwH2DDatcUn7d24eanp4PL23aniHcDwRITeGjLmSKD6sr334Ftnh4mG/QO0kwG
 DoEQ==
X-Gm-Message-State: AOAM530St/b44ZQbBAoH55j3a+MUZkMIfhBH9bFhkLqsaXVkQJlNn5t5
 y30s6lRToxzYY2c+GTDfEbI=
X-Google-Smtp-Source: ABdhPJxuJu9uw9ksyDuLJR+0xmkY+MT8DEHceX1teubOwpw2HDmBM5quWpZQSLvA41Dy23mfPRZLgA==
X-Received: by 2002:adf:a41c:0:b0:203:daeb:165f with SMTP id
 d28-20020adfa41c000000b00203daeb165fmr26096291wra.188.1648493417712; 
 Mon, 28 Mar 2022 11:50:17 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:3c84:1cd:456b:b750?
 ([2600:70ff:f07f:0:3c84:1cd:456b:b750])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a7bcc0b000000b0037e0c362b6dsm249484wmh.31.2022.03.28.11.50.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 11:50:17 -0700 (PDT)
Message-ID: <49ed4ad0-0b9a-79ae-2e6a-a534db10d106@gmail.com>
Date: Mon, 28 Mar 2022 20:50:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v2] coreaudio: Notify error in coreaudio_init_out
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>
References: <20220226115953.60335-1-akihiko.odaki@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220226115953.60335-1-akihiko.odaki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/2/22 12:59, Akihiko Odaki wrote:
> Otherwise, the audio subsystem tries to use the voice and
> eventually aborts due to the maximum number of samples in the
> buffer is not set.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>   audio/coreaudio.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/audio/coreaudio.c b/audio/coreaudio.c
> index d8a21d3e507..d7cfdcc4fc4 100644
> --- a/audio/coreaudio.c
> +++ b/audio/coreaudio.c
> @@ -604,6 +604,8 @@ static int coreaudio_init_out(HWVoiceOut *hw, struct audsettings *as,
>               coreaudio_playback_logerr(status,
>                                         "Could not remove voice property change listener\n");
>           }
> +
> +        return -1;
>       }
>   
>       return 0;

Merged as commit bd7819de22.

