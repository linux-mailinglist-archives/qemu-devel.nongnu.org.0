Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 033724D9A2D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 12:16:59 +0100 (CET)
Received: from localhost ([::1]:44564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU5Ag-0000WE-31
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 07:16:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU558-0000qz-BZ
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 07:11:14 -0400
Received: from [2607:f8b0:4864:20::102f] (port=42920
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU552-0006Ng-Ox
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 07:11:14 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 rm8-20020a17090b3ec800b001c55791fdb1so2100435pjb.1
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 04:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=0lQPfA2w0XLK+PeJJT6YJrZWmtZ6iTWFsGlDnwbBRTg=;
 b=IMTsUqInBUaW/M6w7wmxpHBjnr+vT4+G5CuwXx3lcvwVyZn+tISGT1UzWBPKHBK87Q
 gvcvsJDq1RXpyuAARVihOd1FiwIfAzykS8jdoi2/+Asl5S0pAJEkJlqN6pLfGUZRAbuD
 D7o6KuHdQpegKI0g/ZbTtpyxKq7Kd8U+Qc3si7vXAusXB9TZ/077uNizZ20B4Wsehzbn
 F4pCja1V0SMJIFzOkViy+M8wO17py0rPIrQCYildzojpwubBiGY5f1VnPYVX0FNVV3t3
 9GQ1j3/5Si71RCiHlhk8tSNovqfYpyt/XUVmFBq+4aekIx2kMknwO/8SPZ82+crgz1qH
 lNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0lQPfA2w0XLK+PeJJT6YJrZWmtZ6iTWFsGlDnwbBRTg=;
 b=wMCaiU9O45MRZcWCfralQjc93en+tX4ELXCD8QAUv+QcD7QgRC7uTU/X8v0I0HkYPj
 xs+1mhzfm5Bms/PuhpuDOGOhX7gycib1kXsQRQgTzC+pQpAjuFMg+yAiac0FdVOgpLQS
 WyRdtCdwRX57Zkp7lWFMoVaqQYNghZ0/U+Ncq5WQSeEkoY2ThuSp9OwQMXw9dKdaNcIP
 rOLBGzwbGrDxryT5onzWbF577PBjxzlYMJEdgKPuzoPiU1mPAsuUitsXqYMM4l4dc6Fp
 Xf20uDXKg41rnQ995F/7chTbHt7OfllfDjXOEW9PSbhy01lJX1E9mq0tMtIUVDK2hHAu
 RhIQ==
X-Gm-Message-State: AOAM531llCMyjnrySpBk3G6Eei4cf1JGq1iEXX8Dh/mEnGEzpW4jlqNV
 QFkaz7gP7fAMsqjK+qLxoE/TooTeKsg=
X-Google-Smtp-Source: ABdhPJwGnpygyU3y4thzSekqT82RijbZoVpiev5e8H8dhwbkoIIk+EwoyYntQprp3vZOfuudTEMr7A==
X-Received: by 2002:a17:902:ec8e:b0:152:939:ac4a with SMTP id
 x14-20020a170902ec8e00b001520939ac4amr26846884plg.5.1647342666676; 
 Tue, 15 Mar 2022 04:11:06 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j11-20020a63230b000000b00372a08b584asm19825836pgj.47.2022.03.15.04.11.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 04:11:06 -0700 (PDT)
Message-ID: <2334bd32-0494-37e1-e0ec-7ccb48928c0d@gmail.com>
Date: Tue, 15 Mar 2022 12:11:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH-for-7.0 v3] softmmu: List CPU types again
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20220314140108.26222-1-philippe.mathieu.daude@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220314140108.26222-1-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Paolo,

Could you take this patch?

On 14/3/22 15:01, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Commit e0220bb5b2 made cpus.c target-agnostic but didn't notice
> the cpu_list() function is only defined in target-specific code
> in "cpu.h". Move list_cpus() declaration to "exec/cpu-common.h"
> because this function is not softmmu-specific and can also be
> used by user-mode, along with moving its implementation to cpu.c,
> which is compiled per target.
> 
> Fixes: e0220bb5b2 ("softmmu: Build target-agnostic objects once")
> Reported-by: Max Filippov <jcmvbkbc@gmail.com>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Tested-by: Max Filippov <jcmvbkbc@gmail.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Since v2:
> - include exec/cpu-all.h -> exec/cpu-common.h (thuth)
> ---
>   cpu.c                     | 9 +++++++++
>   include/exec/cpu-common.h | 2 ++
>   include/sysemu/cpus.h     | 2 --
>   softmmu/cpus.c            | 8 --------
>   4 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/cpu.c b/cpu.c
> index d564886149..be1f8b074c 100644
> --- a/cpu.c
> +++ b/cpu.c
> @@ -35,6 +35,7 @@
>   #include "sysemu/tcg.h"
>   #include "sysemu/kvm.h"
>   #include "sysemu/replay.h"
> +#include "exec/cpu-common.h"
>   #include "exec/exec-all.h"
>   #include "exec/translate-all.h"
>   #include "exec/log.h"
> @@ -266,6 +267,14 @@ const char *parse_cpu_option(const char *cpu_option)
>       return cpu_type;
>   }
>   
> +void list_cpus(const char *optarg)
> +{
> +    /* XXX: implement xxx_cpu_list for targets that still miss it */
> +#if defined(cpu_list)
> +    cpu_list();
> +#endif
> +}
> +
>   #if defined(CONFIG_USER_ONLY)
>   void tb_invalidate_phys_addr(target_ulong addr)
>   {
> diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
> index 7f7b5943c7..50a7d2912e 100644
> --- a/include/exec/cpu-common.h
> +++ b/include/exec/cpu-common.h
> @@ -158,4 +158,6 @@ int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
>   /* vl.c */
>   extern int singlestep;
>   
> +void list_cpus(const char *optarg);
> +
>   #endif /* CPU_COMMON_H */
> diff --git a/include/sysemu/cpus.h b/include/sysemu/cpus.h
> index 868f1192de..b5c87d48b3 100644
> --- a/include/sysemu/cpus.h
> +++ b/include/sysemu/cpus.h
> @@ -55,6 +55,4 @@ extern int smp_cores;
>   extern int smp_threads;
>   #endif
>   
> -void list_cpus(const char *optarg);
> -
>   #endif
> diff --git a/softmmu/cpus.c b/softmmu/cpus.c
> index e1d84c8ccb..7b75bb66d5 100644
> --- a/softmmu/cpus.c
> +++ b/softmmu/cpus.c
> @@ -728,14 +728,6 @@ int vm_stop_force_state(RunState state)
>       }
>   }
>   
> -void list_cpus(const char *optarg)
> -{
> -    /* XXX: implement xxx_cpu_list for targets that still miss it */
> -#if defined(cpu_list)
> -    cpu_list();
> -#endif
> -}
> -
>   void qmp_memsave(int64_t addr, int64_t size, const char *filename,
>                    bool has_cpu, int64_t cpu_index, Error **errp)
>   {


