Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8ED628E40
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:24:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouiou-00013G-6A; Mon, 14 Nov 2022 18:24:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ouig2-0002R9-As
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:15:43 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ouUuH-0005So-CB
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 03:33:30 -0500
Received: by mail-wr1-x430.google.com with SMTP id k8so16764746wrh.1
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 00:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C/egVMX1NnI4nB5gIbQgedVIjzsW82wYoVwjKIp2VOw=;
 b=S2OcXEzwWwyVOO8A6Zvhi9Rhs1oHM5uBpggVQkAu4rzzBx/9tfVHgtBuBMp9+9RvrI
 a+71rcESpoPUUPKkRBiigJkIx8lwJsJW0cyqaRG6VsN3AYVBKUsgx+8+J5PcS9u8ggrI
 h/FLuZddp3qfBNzVqqQfvhtETgBWD++WseSD8QVPeLuP08BJxGB6YC4I4ZdpTfVe3HNj
 wlsC4KnEI45pJvdBAL5Emzh0ZUvfKV7efVvpa/0WovH4D5BEIx/Ocb7qzsKuF9ENDbrI
 FVOS1kWwFQrH+iLgMQh9knnKD7S1Mgl+XmsXnQVuiQD6SVuvmiFRcjQacdUtBIXyjd2T
 xs6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C/egVMX1NnI4nB5gIbQgedVIjzsW82wYoVwjKIp2VOw=;
 b=BACLoWF3rcsi6e4Zi70nMEKudLxjkJ/L8d4b5VXMJ3c8woFzP9eXEMvpAiIfJB17ht
 ODqQZa3TT4B99S1D/OrW2AWngne/uAG2G/jBOsH9aGLsFxlOEOvDnUG+h9hrPCQJJGvv
 oxPYZVcGrcvbYXEiMaFyEG/80LNk4Eez0JZEbJubjMFLO0k49JNWhkwCpMQN9LOEUREV
 +jaGjee1BH8oRliB2vOwHWZZUyhAthiAb5TbKm/a0FRdgGBF3xQAgaGPpN5lQXl0OSCL
 GarhLugUeYhdvRdRHwKId2xIMpCFgYaiA6DBIdZd+fPhV1eA5+Ii/zHFCsTmsyQx8C+9
 rpJw==
X-Gm-Message-State: ANoB5pkfOzURu3vsd8tRKz/8bU8zKXjN9miL7oBi64io/+x18vhj8Hb/
 phFJlgrCtwxUKRxmfeedKUUf0w==
X-Google-Smtp-Source: AA0mqf6lDIPPO5quYM8hc8l53dn7PihCu/NnDdxKmNF7m/WH/nlEJYElOQR8D9HpXMNL5yHeod2mvw==
X-Received: by 2002:a5d:4562:0:b0:241:8103:769e with SMTP id
 a2-20020a5d4562000000b002418103769emr3908067wrc.240.1668414807115; 
 Mon, 14 Nov 2022 00:33:27 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a5d4c84000000b00236733f0f98sm8818311wrs.107.2022.11.14.00.33.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Nov 2022 00:33:26 -0800 (PST)
Message-ID: <eb028963-2d05-bef2-dea2-5d8461617058@linaro.org>
Date: Mon, 14 Nov 2022 09:33:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v4] qapi/qom: Memory backend property prealloc-threads doc
 fix
Content-Language: en-US
To: Zhenyu Zhang <zhenyzha@redhat.com>, qemu-devel@nongnu.org
Cc: gshan@redhat.com, imammedo@redhat.com, armbru@redhat.com,
 eric.auger@redhat.com, lijin@redhat.com
References: <20221114032431.195098-1-zhenyzha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221114032431.195098-1-zhenyzha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 14/11/22 04:24, Zhenyu Zhang wrote:
> Commit ffac16fab3 "hostmem: introduce "prealloc-threads" property"
> (v5.0.0) changed the default number of threads from number of CPUs
> to 1.  This was deemed a regression, and fixed in commit f8d426a685
> "hostmem: default the amount of prealloc-threads to smp-cpus".
> Except the documentation remained unchanged.
> 
> Update 'qapi/qom.json' to reflect the change in commit f8d426a6852c.
> 
> Signed-off-by: Zhenyu Zhang <zhenyzha@redhat.com>
> ---
> 
> v4: Fix the line exceeding 80 characters limitation issue  (Gavin)
> v3: Covers historical descriptions                         (Markus)
> v2: The property is changed to smp-cpus since 5.0          (Phild)
> 
> ---
>   qapi/qom.json | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



