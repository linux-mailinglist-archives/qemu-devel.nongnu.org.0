Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BE969D3CE
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 20:07:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUBU0-0001uD-BE; Mon, 20 Feb 2023 14:05:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUBTu-0001pv-Mb
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 14:05:46 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUBTr-0000oT-PJ
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 14:05:45 -0500
Received: by mail-pl1-x631.google.com with SMTP id q11so2890778plx.5
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 11:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Cp9uKmWSef+07nF/2nAqBmzxGyGYY3axMHMWFHKB1SY=;
 b=WCmthzqOHQenuWPQkusZo5n7F18Khiuy6k25u7ODq7SbNx+5V71pz20nhvhP5HZBbh
 Avj31P9bT6UQGRkRP7FGDhUfMFs8siwmoV0qsBPSUcaXMQfpIt2v0LWhEzauN10l6BIE
 PP+68Bw96jZrIfu+Sodi7fg4uUZ3bmJs+VFpa7mj/tR33Ocbxh03sgreVchcbr8mN8Qe
 OxPY5fvB80ueVWs2Fl9DYnITjGCrhuwE5z639O2sjmCZyMMiCGyRmX+s1PGqGmj1xVqz
 vVgFepQUH8Boy10vHjW/dr2fX4Ks44jQ+ZwpYGz6bHFxkax5RfteVuGmiJrloPsjCvr5
 /Gfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Cp9uKmWSef+07nF/2nAqBmzxGyGYY3axMHMWFHKB1SY=;
 b=ztl4asEYrlhbJ+EpbqE3Dp7nJtxrxHIPkXgnAVSia0SbWhMylFX7YYaYK/ojkAE8Qg
 8Cb9vgMymWQzVm8scZ7OOleNnZTsIb46gKb3Wh8go6L5d8osdu8p2INc6xxld+E3WBtK
 MKvtsx80MXuTsyYDMLcEptgTIYkj/Wwp2qhEPs+dITI8FNP6r2pm3noryVTcnfa5yITs
 PghdtHlwRcgPjC0sB7JUV5kFh26/6R4czZtsdZTXQeXu0c/HxAhbTy5aefkN0fDnp35p
 6SM9QlcQ5WjytzgnrhXlZZIPssZFvsN+ZoqrA77xGuVvd4ir43iP6Wu/iVXB4h8PMQWC
 /oYg==
X-Gm-Message-State: AO0yUKWSNG7S6oeQ2B40LQ+BnRnEYncT0StKQpDmHuFwv/tGK098GohA
 qYZcw/KVCvhWec+XpMKkDh6rDA==
X-Google-Smtp-Source: AK7set9Q18QHINPwNd6zoJ/y+Tsu0IUeJWCrYYUf3J4gYe8/ez34fHkGmRKitsMSXw9D2A7PHCY9hw==
X-Received: by 2002:a17:90b:350b:b0:234:f3c:17cd with SMTP id
 ls11-20020a17090b350b00b002340f3c17cdmr3948781pjb.43.1676919942044; 
 Mon, 20 Feb 2023 11:05:42 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 d6-20020a17090a498600b00231261061a5sm1482954pjh.5.2023.02.20.11.05.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 11:05:41 -0800 (PST)
Message-ID: <82d751cc-9375-17d9-ec91-61f17ca7df0f@linaro.org>
Date: Mon, 20 Feb 2023 09:05:37 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/5] hw/audio/es1370: Replace container_of() by ES1370()
 QOM cast macro
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <20230220131837.26292-1-philmd@linaro.org>
 <20230220131837.26292-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230220131837.26292-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/20/23 03:18, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/audio/es1370.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

