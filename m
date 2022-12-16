Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F08B764EFA8
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 17:46:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Dek-0008Hd-QK; Fri, 16 Dec 2022 11:33:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p6Dei-0008H1-BS; Fri, 16 Dec 2022 11:33:52 -0500
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p6Dee-000340-PA; Fri, 16 Dec 2022 11:33:52 -0500
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-14455716674so3895999fac.7; 
 Fri, 16 Dec 2022 08:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ikyShjz8bCnOuVG2FrXIyeFfnEFNbKtS3+YKrJrfDzk=;
 b=C5FlGKQVSe83KlYXSW/Rb5Ao+TYgwLxKdXSSk7bG4r9JB5CXEx8h09YRBonS3QUcPY
 KKm0+86REt6Y1+4XiPzS9+WopZZxE8fFo6tD/Ov90PWn3idLCzoL6IvACXl8etGvLHql
 Bho40ZGJSTG/KnnfOhCsj2NXU7m197/EXdi7KHsoj7/kJeqJBmkIyBASAroCRZ/TktAC
 +RwlTr9NfAPKvaRgfzaT2KqM3JL04y50fqWGnZ0nBVfFogXgQYUZ7QZWBMH5qe4lhaom
 2Koj6vuL3alc4934XpFrJYYuhmqgfuV1DViXWAVkRNtIzPL1ir8zObSI+Qe0AWJIqBt9
 hEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ikyShjz8bCnOuVG2FrXIyeFfnEFNbKtS3+YKrJrfDzk=;
 b=qezLxC3hqYP5n6KeYVMsky7Z4E9WzJwqqqFjpKukdHQRzTyRuppND3+oAtNhZ4ErBi
 XL7eO6FMDHfk8Pc2SICeTbpCYCTwkybrD+WctvLYKrmNyr20/ujfvGn8K+m9X0wXfrs8
 1mNg750YKGWNMGuhwnLjNtHRnHm+LDvu/iW0IdL0gJqPym3VAk1Z+6ic4K6h4Z/p6orC
 osMfdvBmu71VPb3H8oJa1UHxzvwhg83EAIH8JDi0OlwXtpDIjXo+pFbPSFCUdkEMYAcx
 JIIrfGATIQWodxhjefuYEt3bOLP+C6tWZPXQWfynTnogX5Sci6ppqi7JDYxMU0Okhd8H
 Q5HQ==
X-Gm-Message-State: AFqh2koCcxAAk6dibdgSZluTqWcxbSWH3Y9WwxfSn3yRl1H4/RufY7wV
 6WaWVHdO4ql08Z1iQXGo0mQ=
X-Google-Smtp-Source: AMrXdXtaiWb9g3+Gs/cXcWNJFII9MVarhj/56xxwQ1vf3Jy8KOWR0uBC25GlRt2Dn6pS0/xaPcSOZw==
X-Received: by 2002:a05:6870:e246:b0:14b:da26:5248 with SMTP id
 d6-20020a056870e24600b0014bda265248mr894039oac.19.1671208424005; 
 Fri, 16 Dec 2022 08:33:44 -0800 (PST)
Received: from [192.168.68.106] (201-43-103-101.dsl.telesp.net.br.
 [201.43.103.101]) by smtp.gmail.com with ESMTPSA id
 w23-20020a056870b39700b0014b8347e1e3sm1141099oap.12.2022.12.16.08.33.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 08:33:43 -0800 (PST)
Message-ID: <47b89df9-4977-75b2-6f60-092e147b1305@gmail.com>
Date: Fri, 16 Dec 2022 13:33:39 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH-for-8.0 1/4] target/ppc/kvm: Add missing "cpu.h" and
 "exec/hwaddr.h"
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 kvm@vger.kernel.org, Alexey Kardashevskiy <aik@ozlabs.ru>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, Greg Kurz
 <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20221213123550.39302-1-philmd@linaro.org>
 <20221213123550.39302-2-philmd@linaro.org>
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20221213123550.39302-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x35.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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



On 12/13/22 09:35, Philippe Mathieu-Daudé wrote:
> kvm_ppc.h is missing various declarations from "cpu.h":
> 
>    target/ppc/kvm_ppc.h:128:40: error: unknown type name 'CPUPPCState'; did you mean 'CPUState'?
>    static inline int kvmppc_get_hypercall(CPUPPCState *env,
>                                           ^~~~~~~~~~~
>                                           CPUState
>    include/qemu/typedefs.h:45:25: note: 'CPUState' declared here
>    typedef struct CPUState CPUState;
>                            ^
>    target/ppc/kvm_ppc.h:134:40: error: unknown type name 'PowerPCCPU'
>    static inline int kvmppc_set_interrupt(PowerPCCPU *cpu, int irq, int level)
>                                           ^
>    target/ppc/kvm_ppc.h:285:38: error: unknown type name 'hwaddr'
>                                         hwaddr ptex, int n)
>                                         ^
>    target/ppc/kvm_ppc.h:220:15: error: unknown type name 'target_ulong'
>    static inline target_ulong kvmppc_configure_v3_mmu(PowerPCCPU *cpu,
>                  ^
>    target/ppc/kvm_ppc.h:286:38: error: unknown type name 'ppc_hash_pte64_t'
>    static inline void kvmppc_read_hptes(ppc_hash_pte64_t *hptes,
>                                         ^
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   target/ppc/kvm_ppc.h | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
> index ee9325bf9a..5fd9753953 100644
> --- a/target/ppc/kvm_ppc.h
> +++ b/target/ppc/kvm_ppc.h
> @@ -9,6 +9,9 @@
>   #ifndef KVM_PPC_H
>   #define KVM_PPC_H
>   
> +#include "exec/hwaddr.h"
> +#include "cpu.h"
> +
>   #define TYPE_HOST_POWERPC_CPU POWERPC_CPU_TYPE_NAME("host")
>   
>   #ifdef CONFIG_KVM

