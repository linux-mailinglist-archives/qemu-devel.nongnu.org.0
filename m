Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C4562725C
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Nov 2022 20:53:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouJ2C-0002Al-Fe; Sun, 13 Nov 2022 14:52:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ouJ29-00026m-OT
 for qemu-devel@nongnu.org; Sun, 13 Nov 2022 14:52:49 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ouJ28-0003Ac-3S
 for qemu-devel@nongnu.org; Sun, 13 Nov 2022 14:52:49 -0500
Received: by mail-wr1-x42a.google.com with SMTP id o4so13896201wrq.6
 for <qemu-devel@nongnu.org>; Sun, 13 Nov 2022 11:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qWO23xnS3wIXo4WLaXT4GHJCm28qhVBHEppB+5gRgPM=;
 b=crIuF+eLXNjMNS8XQGjabMSQib9Hj2HW0+RyIz26h+stRJx0/3J+22qcL9fuhw3ZIM
 lLEljZNXPYGXo3nGwjlCpqtponpVkq4OJ+u7jljBFaQxHHFt58SClxDsPh7RhPj4cr7g
 iLiGYkJCnVOYeVJfnIcyYiZddK0onlu5e+2CUifh1Wvj/UWNdBGOT8zUXBOi4McJLIpB
 Lt92DfOjPi4Ic8i7NnYMbCeePUCbJKfsDRXk6L0YVimhQGN6gSeWZMWDJjlpH9fSdaXa
 Ak39k1vsAt0Ac7NjAQsr7CW8vgjBkLvkYt4M1naAiPiUo7l3zPkh1rPUMKvw4oLI8vdk
 ELiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qWO23xnS3wIXo4WLaXT4GHJCm28qhVBHEppB+5gRgPM=;
 b=5XTWWLgb02lsysS5lK6dybGXeVglR+TsuKBNydhQ6siYIIMQyJICrLAXzesropCAQB
 ivy8GcSr1HzSWao5yJFFvFYe3XgkT30fTtEHhuGgBkxGb1RE47BHqAM6XYmw4GZCxSol
 gPb4m4NR7omwrFHPyYqWVudB6E3a7jAYNOCL7TecaX0LZNfWgQ8uzrMomOWxePHE5xD8
 1BipvF/SLASfs6iKhsEuN1qD6HSQsRHBqev/v5WmRBtp0+IMtloOFBUY+aVIELQyrxd7
 f0Qn1evjSK9ayPUc0SLg8qmZit4ktl+NctbctGnKglyy3PC7F/8LARR/p7VwZPWkXp6S
 qI+A==
X-Gm-Message-State: ANoB5pklXR/RcKiaptol+aRh6aumzqEy4ZK3bqiJCuIKqJ0GWUFvP4ww
 vUyDNoo+aLqKjera3xjbSWiTsg==
X-Google-Smtp-Source: AA0mqf7sMq0OyUcSL21mAlDJhflDL8mb7VyNfAnXPSRQAIO6vZQ0Fb2fzbkHniELTUx43mfDTdojFg==
X-Received: by 2002:adf:e852:0:b0:236:8d39:6f84 with SMTP id
 d18-20020adfe852000000b002368d396f84mr5511705wrn.152.1668369166155; 
 Sun, 13 Nov 2022 11:52:46 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 b15-20020adff24f000000b002345cb2723esm7585981wrp.17.2022.11.13.11.52.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Nov 2022 11:52:45 -0800 (PST)
Message-ID: <1cba26d1-a96f-f1dd-6d58-72ffaec7efb1@linaro.org>
Date: Sun, 13 Nov 2022 20:52:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v5 15/20] hw/i386: update vapic_write to use MemTxAttrs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
 <20221111182535.64844-16-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221111182535.64844-16-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

On 11/11/22 19:25, Alex Bennée wrote:
> This allows us to drop the current_cpu hack and properly model an
> invalid access to the vapic.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   hw/i386/kvmvapic.c | 19 +++++++++++--------
>   1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/i386/kvmvapic.c b/hw/i386/kvmvapic.c
> index 43f8a8f679..a76ed07199 100644
> --- a/hw/i386/kvmvapic.c
> +++ b/hw/i386/kvmvapic.c
> @@ -635,20 +635,21 @@ static int vapic_prepare(VAPICROMState *s)
>       return 0;
>   }
>   
> -static void vapic_write(void *opaque, hwaddr addr, uint64_t data,
> -                        unsigned int size)
> +static MemTxResult vapic_write(void *opaque, hwaddr addr, uint64_t data,
> +                               unsigned int size, MemTxAttrs attrs)
>   {
>       VAPICROMState *s = opaque;
> +    CPUState *cs;
>       X86CPU *cpu;
>       CPUX86State *env;
>       hwaddr rom_paddr;
>   
> -    if (!current_cpu) {
> -        return;
> +    if (attrs.requester_type != MTRT_CPU) {
> +        return MEMTX_ACCESS_ERROR;
>       }
> -
> -    cpu_synchronize_state(current_cpu);
> -    cpu = X86_CPU(current_cpu);
> +    cs = qemu_get_cpu(attrs.requester_id);
> +    cpu_synchronize_state(cs);
> +    cpu = X86_CPU(cs);
>       env = &cpu->env;
>   
>       /*
> @@ -708,6 +709,8 @@ static void vapic_write(void *opaque, hwaddr addr, uint64_t data,
>           }
>           break;
>       }
> +
> +    return MEMTX_OK;
>   }
>   
>   static uint64_t vapic_read(void *opaque, hwaddr addr, unsigned size)
> @@ -716,7 +719,7 @@ static uint64_t vapic_read(void *opaque, hwaddr addr, unsigned size)
>   }
>   
>   static const MemoryRegionOps vapic_ops = {
> -    .write = vapic_write,
> +    .write_with_attrs = vapic_write,
>       .read = vapic_read,

Shouldn't we do the same for the read() path?

>       .endianness = DEVICE_NATIVE_ENDIAN,
>   };


