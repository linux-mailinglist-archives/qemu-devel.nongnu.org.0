Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE66B6A0CB3
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 16:17:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVDLQ-0005KM-2a; Thu, 23 Feb 2023 10:17:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVDLF-0005HV-3s
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:17:14 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVDLB-0007Ar-Eh
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:17:04 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 m14-20020a7bce0e000000b003e00c739ce4so8461881wmc.5
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 07:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NDoVbaEdDwZxADo1xOV1/b4oQaQbqK+u93KXakOvZXs=;
 b=dDWk4m6trrncZjI6JEyu7YsBqQOSkmA6408+aqx2CvtaOna4G1K9IfK9CkYhHsGlaA
 820rK53O53NvZ8NsrGdc5AWHY/F/hwkDTgUTXdxTyXh12WsfcnXFcc9Zbt/KwxvblAjM
 d1vfAmWT6ghYRkRXwwRXgGyHGqtE5vuvs6bANIEMUQLql22WnQWdb1wIE5iLmT/wNzv5
 GzMUG8j5q9I+cbwmQp+vcK4tka56ltWqiYD2nBYiSOrFwohq7pqHkp2XnG+X6XT44yvl
 DTJSWNO42o1ouPshBtdRof/pGOoIarmLcCd/94vIlJMEV278xIUA5zlNnIxF5B/dJ+Xl
 3Kzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NDoVbaEdDwZxADo1xOV1/b4oQaQbqK+u93KXakOvZXs=;
 b=oRRxWa6Bb2dnO1MechA0jMWEeIUF698FYF/X7NKZLpy+ZkKCvEDNSI48KN4y3Ho2FE
 lpFKhWrEsNQ8NJtLP9dekRC3TMMahm5zO5XB7yzzUNApliaBoDqtariju/jtwzw60iaU
 wqXHEepUjDAr4UaOz3rRHXrfohLPn+DQp88WwRXK+G37jS82C6NQLh+jKlJAm9tXjRbp
 BFNK0Pw97w8VzeBxuKMDrmC/wlJ5y5v4/cxK8viLpdTGFelGYOb7JhspAlJ+ztcb7NAa
 bIWp7ZG5IG3Rybnyg7JSAjDghzN+GmCS164SFRc9a61VKaxhOKp9KxGHivjPXIdY9oZn
 D1CQ==
X-Gm-Message-State: AO0yUKXdJBy0CEJqRmneLimaHn7ZK8zDiA3GW0NVBYF6rBeWRQHtGyvn
 iz2lPlSab4mFY+iDsqTat7Eu1OMN+5Orl3vI
X-Google-Smtp-Source: AK7set98W5xOljBJGR444X1+QhypPEdqZwj8EyV7oFriTzNxYzUXSeTv/7FAUpYqAuYHoCb9T3lKpQ==
X-Received: by 2002:a05:600c:3093:b0:3dc:5c86:12f3 with SMTP id
 g19-20020a05600c309300b003dc5c8612f3mr3595238wmn.1.1677165419659; 
 Thu, 23 Feb 2023 07:16:59 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q31-20020a05600c331f00b003e2243cfe15sm5335113wmp.39.2023.02.23.07.16.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 07:16:59 -0800 (PST)
Message-ID: <e1ef056b-b033-91f1-df48-c8cd7530ac6d@linaro.org>
Date: Thu, 23 Feb 2023 16:16:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] target/i386: Remove pointless env_archcpu() in
 helper_rdmsr()
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
References: <20230210125700.13474-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230210125700.13474-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

ping

On 10/2/23 13:57, Philippe Mathieu-Daudé wrote:
> We have a X86CPU *cpu pointer available at the start of the function.
> 
> Inspired-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/i386/tcg/sysemu/misc_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/i386/tcg/sysemu/misc_helper.c b/target/i386/tcg/sysemu/misc_helper.c
> index e1528b7f80..e47db9376e 100644
> --- a/target/i386/tcg/sysemu/misc_helper.c
> +++ b/target/i386/tcg/sysemu/misc_helper.c
> @@ -326,7 +326,7 @@ void helper_rdmsr(CPUX86State *env)
>           val = env->sysenter_eip;
>           break;
>       case MSR_IA32_APICBASE:
> -        val = cpu_get_apic_base(env_archcpu(env)->apic_state);
> +        val = cpu_get_apic_base(x86_cpu->apic_state);
>           break;
>       case MSR_EFER:
>           val = env->efer;


