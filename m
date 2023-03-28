Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BF36CC169
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 15:52:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph9jL-00086P-HX; Tue, 28 Mar 2023 09:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ph9jF-000862-I2
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 09:51:13 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ph9jC-0000QL-Hw
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 09:51:13 -0400
Received: by mail-wr1-x434.google.com with SMTP id l12so12273345wrm.10
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 06:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680011468;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rENj8MVNKcMfNBbfRp2S1C1Ohenz/Q/BPeFv9lqoVV8=;
 b=bTJBCJgIk9LN5oNyINZD+SmCOEpsvF0QL6bmklrZJ4tIftk5DlY6FAOPVh7TAipc6a
 jzWgkRVH7iR930FNjmhjuhgo19zbcX6F0iGnAalH/C/juOPCNEu+L6jeUOnR1fX0a/To
 1iKsvefHMt9zVBg998qgeLi7NtgFPR0jdGKK8BALtf34PJalw8GurZS/Oy5UZVSQLAeM
 qZ/UM8VsVtt8GwLLVEiCUEq41yCqxFnREeEv8gvLmdcvgWsJAXU8riorBsCM7vNKgHY2
 Lxdqz9q3iTMwoWTFMrPOOdG5dmrYFk9O22gRzGa7nPX1MPBpBJNXuJWhgwLV+guRhwHy
 +A+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680011468;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rENj8MVNKcMfNBbfRp2S1C1Ohenz/Q/BPeFv9lqoVV8=;
 b=r8Nn0L1rDVtWgxsUAzo2BpR9H/67Y9LL+X9X6wCNqvaBvSMbaXWbRzIbi3vIHVvQj2
 poxaR/PKKuusIkMOdu3LpDAsruZPj9zqE3yiBHuXSC7BlIJ32nmCNgeYRjrBBCPOQ51w
 dX3cTZJXXso2HuuScu3isV4Pk8nKs76ECqS9qdY2RGJ9BEQDiFIHVQIehWJoyk6M3Pp8
 YG04W2tPb+CX8Bm/YcXGuUinnrHBJzM6uN5j/gD2cfxCm3eCb2eYStdOe/J6rTrhUduT
 DTnOciwHBDJXVf2fc8FYPbsocrFuYcfK6l/ATPdlTJlzdLFdcfxJqxbgX6T7j7fv3nuZ
 xo7g==
X-Gm-Message-State: AAQBX9ex734UYKqGXdRTfOC7blgR3ZGzNUsne31Hz/zxBctSkFxB3ka2
 dOoOS7i8D6AaqAPdI8WFE2XIWg==
X-Google-Smtp-Source: AKy350ba8DkKpuRQEnUalyD3W0Pe05wYMyIOceGUUMujIlgzlXvl5IvF282i1N4+/HDoSyAAuigZ2w==
X-Received: by 2002:a5d:448a:0:b0:2cf:e29f:d7e1 with SMTP id
 j10-20020a5d448a000000b002cfe29fd7e1mr12325132wrq.45.1680011468470; 
 Tue, 28 Mar 2023 06:51:08 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.210.212])
 by smtp.gmail.com with ESMTPSA id
 a3-20020adffb83000000b002c561805a4csm27664415wrr.45.2023.03.28.06.51.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 06:51:08 -0700 (PDT)
Message-ID: <c6273091-da88-03b9-4137-8ad19f4cf9e3@linaro.org>
Date: Tue, 28 Mar 2023 15:51:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH for-8.0 v2 10/12] linux-user: Pass last not end to
 probe_guest_base
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, Laurent Vivier <laurent@vivier.eu>
References: <20230327211824.1785547-1-richard.henderson@linaro.org>
 <20230327211824.1785547-11-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230327211824.1785547-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

Hi Richard,

On 27/3/23 23:18, Richard Henderson wrote:
> Pass the address of the last byte of the image, rather than
> the first address past the last byte.  This avoids overflow
> when the last page of the address space is involved.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/elfload.c  | 24 ++++++++++++------------
>   linux-user/flatload.c |  2 +-
>   2 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index fa4cc41567..dfae967908 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -2504,7 +2504,7 @@ static void pgb_have_guest_base(const char *image_name, abi_ulong guest_loaddr,
>           if (guest_hiaddr > reserved_va) {
>               error_report("%s: requires more than reserved virtual "
>                            "address space (0x%" PRIx64 " > 0x%lx)",
> -                         image_name, (uint64_t)guest_hiaddr, reserved_va);
> +                         image_name, (uint64_t)guest_hiaddr + 1, reserved_va);
>               exit(EXIT_FAILURE);
>           }
>       } else {
> @@ -2512,7 +2512,7 @@ static void pgb_have_guest_base(const char *image_name, abi_ulong guest_loaddr,
>           if ((guest_hiaddr - guest_base) > ~(uintptr_t)0) {
>               error_report("%s: requires more virtual address space "
>                            "than the host can provide (0x%" PRIx64 ")",
> -                         image_name, (uint64_t)guest_hiaddr - guest_base);
> +                         image_name, (uint64_t)guest_hiaddr + 1 - guest_base);
>               exit(EXIT_FAILURE);
>           }
>   #endif
> @@ -2525,18 +2525,18 @@ static void pgb_have_guest_base(const char *image_name, abi_ulong guest_loaddr,
>       if (reserved_va) {
>           guest_loaddr = (guest_base >= mmap_min_addr ? 0
>                           : mmap_min_addr - guest_base);
> -        guest_hiaddr = reserved_va;
> +        guest_hiaddr = reserved_va - 1;
>       }
>   
>       /* Reserve the address space for the binary, or reserved_va. */
>       test = g2h_untagged(guest_loaddr);
> -    addr = mmap(test, guest_hiaddr - guest_loaddr, PROT_NONE, flags, -1, 0);
> +    addr = mmap(test, guest_hiaddr - guest_loaddr + 1, PROT_NONE, flags, -1, 0);
>       if (test != addr) {
>           pgb_fail_in_use(image_name);
>       }
>       qemu_log_mask(CPU_LOG_PAGE,
> -                  "%s: base @ %p for " TARGET_ABI_FMT_ld " bytes\n",
> -                  __func__, addr, guest_hiaddr - guest_loaddr);
> +                  "%s: base @ %p for %" PRIu64 " bytes\n",
> +                  __func__, addr, (uint64_t)guest_hiaddr - guest_loaddr + 1);
>   }
>   
>   /**
> @@ -2680,7 +2680,7 @@ static void pgb_static(const char *image_name, abi_ulong orig_loaddr,
>       if (hiaddr != orig_hiaddr) {
>           error_report("%s: requires virtual address space that the "
>                        "host cannot provide (0x%" PRIx64 ")",
> -                     image_name, (uint64_t)orig_hiaddr);
> +                     image_name, (uint64_t)orig_hiaddr + 1);
>           exit(EXIT_FAILURE);
>       }
>   
> @@ -2694,7 +2694,7 @@ static void pgb_static(const char *image_name, abi_ulong orig_loaddr,
>            * arithmetic wraps around.
>            */
>           if (sizeof(uintptr_t) == 8 || loaddr >= 0x80000000u) {
> -            hiaddr = (uintptr_t) 4 << 30;
> +            hiaddr = UINT32_MAX;
>           } else {
>               offset = -(HI_COMMPAGE & -align);
>           }
> @@ -2702,7 +2702,7 @@ static void pgb_static(const char *image_name, abi_ulong orig_loaddr,
>           loaddr = MIN(loaddr, LO_COMMPAGE & -align);
>       }
>   
> -    addr = pgb_find_hole(loaddr, hiaddr - loaddr, align, offset);
> +    addr = pgb_find_hole(loaddr, hiaddr - loaddr + 1, align, offset);
>       if (addr == -1) {
>           /*
>            * If HI_COMMPAGE, there *might* be a non-consecutive allocation
> @@ -2755,7 +2755,7 @@ static void pgb_reserved_va(const char *image_name, abi_ulong guest_loaddr,
>       if (guest_hiaddr > reserved_va) {
>           error_report("%s: requires more than reserved virtual "
>                        "address space (0x%" PRIx64 " > 0x%lx)",
> -                     image_name, (uint64_t)guest_hiaddr, reserved_va);
> +                     image_name, (uint64_t)guest_hiaddr + 1, reserved_va);
>           exit(EXIT_FAILURE);
>       }
>   
> @@ -3021,7 +3021,7 @@ static void load_elf_image(const char *image_name, int image_fd,
>               if (a < loaddr) {
>                   loaddr = a;
>               }
> -            a = eppnt->p_vaddr + eppnt->p_memsz;
> +            a = eppnt->p_vaddr + eppnt->p_memsz - 1;
>               if (a > hiaddr) {
>                   hiaddr = a;
>               }
> @@ -3112,7 +3112,7 @@ static void load_elf_image(const char *image_name, int image_fd,
>        * In both cases, we will overwrite pages in this range with mappings
>        * from the executable.
>        */
> -    load_addr = target_mmap(loaddr, hiaddr - loaddr, PROT_NONE,
> +    load_addr = target_mmap(loaddr, (size_t)hiaddr - loaddr + 1, PROT_NONE,
>                               MAP_PRIVATE | MAP_ANON | MAP_NORESERVE |
>                               (ehdr->e_type == ET_EXEC ? MAP_FIXED : 0),
>                               -1, 0);
> diff --git a/linux-user/flatload.c b/linux-user/flatload.c
> index e99570ca18..5efec2630e 100644
> --- a/linux-user/flatload.c
> +++ b/linux-user/flatload.c
> @@ -448,7 +448,7 @@ static int load_flat_file(struct linux_binprm * bprm,
>        * Allocate the address space.
>        */
>       probe_guest_base(bprm->filename, 0,
> -                     text_len + data_len + extra + indx_len);
> +                     text_len + data_len + extra + indx_len - 1);

Per linux-user/user-internals.h:

/**
  * probe_guest_base:
  * @image_name: the executable being loaded
  * @loaddr: the lowest fixed address in the executable
  * @hiaddr: the highest fixed address in the executable
  *
  * Creates the initial guest address space in the host memory space.
  *
  * If @loaddr == 0, then no address in the executable is fixed,
  * i.e. it is fully relocatable.  In that case @hiaddr is the size
  * of the executable.
  *
  * This function will not return if a valid value for guest_base
  * cannot be chosen.  On return, the executable loader can expect
  *
  *    target_mmap(loaddr, hiaddr - loaddr, ...)
  *
  * to succeed.
  */

Since here @loaddr == 0, "@hiaddr is the size of the executable",
not "the first address past the last byte".

So we can not "Pass the address of the last byte of the image"
to this API. Maybe the API description is incorrect, in that
case your patch is right. Otherwise we might need to tune
probe_guest_base().

>   
>       /*
>        * there are a couple of cases here,  the separate code/data


