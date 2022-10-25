Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C96C160CD91
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 15:33:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onK1A-0005cr-TU; Tue, 25 Oct 2022 09:30:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onK12-0005Yj-9Y
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 09:30:48 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onK0w-0002yr-4W
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 09:30:48 -0400
Received: by mail-wr1-x436.google.com with SMTP id v1so20979343wrt.11
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 06:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0ONiAMRjS6sBzn3UPrvRvOwNFeWtCBDZcLoXuZLukCg=;
 b=oYzr+gXec/++EQ8awQWdNDeIYUkpwb3522acVwx6qnHXE/H+DR57az4/CaJkVVoqmg
 Wcm0J5Dloj0PSUHwgaynOKGII0m08MRZlP8ybpgz4s7AMhcNrMaRO3j5itCxzS0zjviq
 oAvYr0rZtyH73/JZZZSxBiviqmrLMdKaLGLhim0JeHitP28SprIUBGoj0K08dvFTqQht
 yEY0eiWi9NVdXrB3y8Y09ou46gfK4gmxdkEH4JMoL2PdsBG72Z7ez7hJ+SDqK3ZyOHiN
 +v8IIYAzWS5w6opKFT7nBt4EmtNT4TG+NwyHhJm8SuSwL6gZ/btRXZKYY9+0f4unvt3N
 qyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0ONiAMRjS6sBzn3UPrvRvOwNFeWtCBDZcLoXuZLukCg=;
 b=AqvqkK8HTI0TmXPgKMRH9wHcHAyDwlSezjreXFjtWRpjX8hBqADw9DC51Ssld4W1jM
 9n1Pxp+0o2uu/fqy0V5FFyUWq1ttVQZ8G2vTXfD+iS++7nhXNBl8F7IKOgubPZb9Ama/
 FfWM6Qwb8mhzHiYKCCWhTB+SKUL9xaVYq65hORdC7+blbQ/DP+dzOu4yOGfs57URZUxq
 YzlK/iHdNIHlLRcYK/hb1YPJRimOsGArs5Em8A/nAi9tnbWdJ02uDMzHnlwzDOxigfIL
 1/ZpwnTqlcvaJ5Q4ueRyl8A5LoxUIy3Mz3qFzC60KGknKn6Za8kCv2sBeMfIH1sEH87B
 eBQw==
X-Gm-Message-State: ACrzQf3A7DYSOUjAXxjAVji1cD6RECpWCPba7GXmM2yjAdE4r8AVK40u
 Iym8VuBcS/mohWdAabOdx01jEg==
X-Google-Smtp-Source: AMsMyM6fGV1CszVQmFw24Wjq4n3ZHesdgfQOr+tPgvTQOQ8phKGSEJMgy8NBUo9EN/m4Dpy2RDy28g==
X-Received: by 2002:a1c:a1c3:0:b0:3c6:b709:aa49 with SMTP id
 k186-20020a1ca1c3000000b003c6b709aa49mr26336588wme.197.1666704630205; 
 Tue, 25 Oct 2022 06:30:30 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 y1-20020adff141000000b0022cc0a2cbecsm2541744wro.15.2022.10.25.06.30.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 06:30:29 -0700 (PDT)
Message-ID: <6fcfcf5a-55bc-e77e-2a36-4ac68f56bdfa@linaro.org>
Date: Tue, 25 Oct 2022 15:30:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v4 02/11] device-tree: add re-randomization helper function
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, peter.maydell@linaro.org,
 pbonzini@redhat.com, qemu-devel@nongnu.org, richard.henderson@linaro.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20221025004327.568476-1-Jason@zx2c4.com>
 <20221025004327.568476-3-Jason@zx2c4.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221025004327.568476-3-Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 25/10/22 02:43, Jason A. Donenfeld wrote:
> When the system reboots, the rng-seed that the FDT has should be
> re-randomized, so that the new boot gets a new seed. Several
> architectures require this functionality, so export a function for
> injecting a new seed into the given FDT.
> 
> Cc: Alistair Francis <alistair.francis@wdc.com>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>   include/sysemu/device_tree.h |  9 +++++++++
>   softmmu/device_tree.c        | 21 +++++++++++++++++++++
>   2 files changed, 30 insertions(+)

> +void qemu_fdt_randomize_seeds(void *fdt)
> +{
> +    int noffset, poffset, len;
> +    const char *name;
> +    uint8_t *data;
> +
> +    for (noffset = fdt_next_node(fdt, 0, NULL);
> +         noffset >= 0;
> +         noffset = fdt_next_node(fdt, noffset, NULL)) {
> +        for (poffset = fdt_first_property_offset(fdt, noffset);
> +             poffset >= 0;
> +             poffset = fdt_next_property_offset(fdt, poffset)) {
> +            data = (uint8_t *)fdt_getprop_by_offset(fdt, poffset, &name, &len);

Is this non-const cast is safe?

> +            if (!data || strcmp(name, "rng-seed"))
> +                continue;
> +            qemu_guest_getrandom_nofail(data, len);

Shouldn't we read to the stack and fill with fdt_setprop_inplace()?

> +        }
> +    }
> +}


