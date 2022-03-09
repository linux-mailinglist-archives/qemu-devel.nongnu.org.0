Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 915324D2D04
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 11:21:51 +0100 (CET)
Received: from localhost ([::1]:52124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRtS2-00059x-MT
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 05:21:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRtQh-0003g6-CX; Wed, 09 Mar 2022 05:20:27 -0500
Received: from [2607:f8b0:4864:20::52d] (port=44687
 helo=mail-pg1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRtQf-00060L-Id; Wed, 09 Mar 2022 05:20:27 -0500
Received: by mail-pg1-x52d.google.com with SMTP id c11so1567944pgu.11;
 Wed, 09 Mar 2022 02:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4eV20m2/hSQGTIzVCpEwwitrbw+G6Fg6AbCz/i8BClM=;
 b=mHWxWirKiN2Ahdf3rMO1KfZnvh72fyKCY/dd0CYcaBCJnt5iE5hY8UaQCu7iuNtPtI
 B3xYLN6ItDBhSecUmdiEHee/nsoVCIQXVKj2oYASe+ktHePoyaaU+pd5gx9L5fVxf7id
 ZXUacqLb4G8GTubulLrKpdKxAIY7/BDvODtcmZaB6Cthx9f4HwZOCT0+mj8SeW4Z4+IU
 E3h1iF3gY7CzPGH36aduAqFe8TxgJyzpH5v7601RGZUUd95NkUZ31uCIBzz2q5ZG8Pke
 39GE2qJ04FdYA3M4lbbx7ZsifKigGE6rU+l9I4Q/75PxOf7ldutwykiQ971fD12IVxgG
 9/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4eV20m2/hSQGTIzVCpEwwitrbw+G6Fg6AbCz/i8BClM=;
 b=VZZqrsnZunRn3YqdOH+QSs9BWC/3YZt/N6w5Iq6Ri+T0NWDoobWmgcodno1i1g68EZ
 lqMI5EzScnIK9D6BmGd81F1F4MBqGdEAaKP1oL9LU/niqFE+hb0SRcvIXIZ5Y93rmCKG
 4NUCXgj2xocpEWPh2XC5+eVctROkHNA4JKB00Rj1/vhsXyuO5ixlBMBPbQ2Og2W1I1VH
 p+jFEDxAjm53JaCtWbWffSu4Vb51oqOgsPXD0rU0or9YN1SOJZzJdEVNEw3sPAOF19ch
 oxIR/gEDJcD8JNiP9oUcgs07p4m45opgFQX5O5egRpvBMUqOiHVVTpGpYlJey1rAtHGi
 Slqg==
X-Gm-Message-State: AOAM5326NZHXCPH/ZUBqFI4krllK5JByE5kVczOrIWqpuceCORpgePOG
 /3Mv4Ehqj+l/BULOSCwxhp7ch18b/ow=
X-Google-Smtp-Source: ABdhPJwFGnaFo57JZU4ku1QwNucTMb4ALyPu/sK9ZGBR/pD4dWl9VQEdwaOK2/7r85t9llDrRZawtA==
X-Received: by 2002:a62:586:0:b0:4e1:dc81:8543 with SMTP id
 128-20020a620586000000b004e1dc818543mr22844546pff.0.1646821221935; 
 Wed, 09 Mar 2022 02:20:21 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 q2-20020a056a00084200b004f761a7287dsm1216918pfk.131.2022.03.09.02.20.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 02:20:21 -0800 (PST)
Message-ID: <097ec9aa-ad9d-960e-502b-0f038ebe8a31@gmail.com>
Date: Wed, 9 Mar 2022 11:20:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v7 06/22] hvf: Fix OOB write in RDTSCP instruction decode
Content-Language: en-US
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
 <20220306231753.50277-7-philippe.mathieu.daude@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220306231753.50277-7-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Sergio Lopez <slp@redhat.com>, qemu-block@nongnu.org,
 Julian Stecklina <julian.stecklina@cyberus-technology.de>,
 Alexander Graf <agraf@csgraf.de>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Will Cohen <wwcohen@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Paolo,

I forgot to Cc you. Could you Ack this patch?

On 7/3/22 00:17, Philippe Mathieu-Daudé wrote:
> From: Cameron Esfahani <dirty@apple.com>
> 
> A guest could craft a specific stream of instructions that will have QEMU
> write 0xF9 to inappropriate locations in memory.  Add additional asserts
> to check for this.  Generate a #UD if there are more than 14 prefix bytes.
> 
> Found by Julian Stecklina <julian.stecklina@cyberus-technology.de>
> 
> Signed-off-by: Cameron Esfahani <dirty@apple.com>
> Message-Id: <20220219063831.35356-1-dirty@apple.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/i386/hvf/x86_decode.c | 12 ++++++++++--
>   target/i386/hvf/x86hvf.c     |  8 ++++++++
>   target/i386/hvf/x86hvf.h     |  1 +
>   3 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/target/i386/hvf/x86_decode.c b/target/i386/hvf/x86_decode.c
> index 062713b1a4..5d051252b4 100644
> --- a/target/i386/hvf/x86_decode.c
> +++ b/target/i386/hvf/x86_decode.c
> @@ -24,8 +24,10 @@
>   #include "vmx.h"
>   #include "x86_mmu.h"
>   #include "x86_descr.h"
> +#include "x86hvf.h"
>   
>   #define OPCODE_ESCAPE   0xf
> +#define X86_MAX_INSN_PREFIX_LENGTH (14)
>   
>   static void decode_invalid(CPUX86State *env, struct x86_decode *decode)
>   {
> @@ -541,7 +543,8 @@ static void decode_lidtgroup(CPUX86State *env, struct x86_decode *decode)
>       };
>       decode->cmd = group[decode->modrm.reg];
>       if (0xf9 == decode->modrm.modrm) {
> -        decode->opcode[decode->len++] = decode->modrm.modrm;
> +        VM_PANIC_ON(decode->opcode_len >= sizeof(decode->opcode));
> +        decode->opcode[decode->opcode_len++] = decode->modrm.modrm;
>           decode->cmd = X86_DECODE_CMD_RDTSCP;
>       }
>   }
> @@ -1847,7 +1850,8 @@ void calc_modrm_operand(CPUX86State *env, struct x86_decode *decode,
>   
>   static void decode_prefix(CPUX86State *env, struct x86_decode *decode)
>   {
> -    while (1) {
> +    /* At most X86_MAX_INSN_PREFIX_LENGTH prefix bytes. */
> +    for (int i = 0; i < X86_MAX_INSN_PREFIX_LENGTH; i++) {
>           /*
>            * REX prefix must come after legacy prefixes.
>            * REX before legacy is ignored.
> @@ -1892,6 +1896,8 @@ static void decode_prefix(CPUX86State *env, struct x86_decode *decode)
>               return;
>           }
>       }
> +    /* Too many prefixes!  Generate #UD. */
> +    hvf_inject_ud(env);
>   }
>   
>   void set_addressing_size(CPUX86State *env, struct x86_decode *decode)
> @@ -2090,11 +2096,13 @@ static void decode_opcodes(CPUX86State *env, struct x86_decode *decode)
>       uint8_t opcode;
>   
>       opcode = decode_byte(env, decode);
> +    VM_PANIC_ON(decode->opcode_len >= sizeof(decode->opcode));
>       decode->opcode[decode->opcode_len++] = opcode;
>       if (opcode != OPCODE_ESCAPE) {
>           decode_opcode_1(env, decode, opcode);
>       } else {
>           opcode = decode_byte(env, decode);
> +        VM_PANIC_ON(decode->opcode_len >= sizeof(decode->opcode));
>           decode->opcode[decode->opcode_len++] = opcode;
>           decode_opcode_2(env, decode, opcode);
>       }
> diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
> index bec9fc5814..a338c207b7 100644
> --- a/target/i386/hvf/x86hvf.c
> +++ b/target/i386/hvf/x86hvf.c
> @@ -423,6 +423,14 @@ bool hvf_inject_interrupts(CPUState *cpu_state)
>               & (CPU_INTERRUPT_INIT | CPU_INTERRUPT_TPR));
>   }
>   
> +void hvf_inject_ud(CPUX86State *env)
> +{
> +    env->exception_nr = EXCP06_ILLOP;
> +    env->exception_injected = 1;
> +    env->has_error_code = false;
> +    env->error_code = 0;
> +}
> +
>   int hvf_process_events(CPUState *cpu_state)
>   {
>       X86CPU *cpu = X86_CPU(cpu_state);
> diff --git a/target/i386/hvf/x86hvf.h b/target/i386/hvf/x86hvf.h
> index db6003d6bd..427cdc1c13 100644
> --- a/target/i386/hvf/x86hvf.h
> +++ b/target/i386/hvf/x86hvf.h
> @@ -22,6 +22,7 @@
>   
>   int hvf_process_events(CPUState *);
>   bool hvf_inject_interrupts(CPUState *);
> +void hvf_inject_ud(CPUX86State *);
>   void hvf_set_segment(struct CPUState *cpu, struct vmx_segment *vmx_seg,
>                        SegmentCache *qseg, bool is_tr);
>   void hvf_get_segment(SegmentCache *qseg, struct vmx_segment *vmx_seg);


