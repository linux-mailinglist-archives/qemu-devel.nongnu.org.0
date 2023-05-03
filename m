Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A746F5A8D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 17:01:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puDzL-0003tv-41; Wed, 03 May 2023 11:01:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1puDzB-0003nR-1x
 for qemu-devel@nongnu.org; Wed, 03 May 2023 11:01:41 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1puDz9-0006ar-8I
 for qemu-devel@nongnu.org; Wed, 03 May 2023 11:01:40 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1aaea43def7so31118085ad.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 08:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1683126097; x=1685718097; 
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=TBzTsPmmOJPxxHzi51LocCCc+3Mj5lgyiM4aBXyIoPc=;
 b=J4zbo3vD+26WpSY/Y32Seo1V+LdhPBBGpEE5Nwk6QtbbvefrOKV2dUzymiac0ne1Bs
 CTUBJas8lr70ipXLnv/6l+f2zsgKjvo8/UshhHyib5QpooPvde4ydecM/59bXVvxVdZ3
 ObXabNhtz0+KQFyqhJzje/312TWQQat9msTMZ0ntcbel4mNg6APrnzs9KZRl/9K7e56w
 MGRwT8N6dVratGBejs67vmJKSRPEfZJarN+A1mZxj4AC7k2s7IU09JJMSCWYcocbWVlc
 PlY2RF++JdN8gExD/QiA2eS6FbSO+ZM7QQOCtG7Dg/wxZl2iU7Eq3hTQsLo0lmSqNeti
 KHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683126097; x=1685718097;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TBzTsPmmOJPxxHzi51LocCCc+3Mj5lgyiM4aBXyIoPc=;
 b=PXeRXhy46Zz2STBgmS4ELxO2SLRej+B9w9lcCwINd7BhqjmVjInhf0B308IzH0IM22
 /VNF6pO5xQmgwoy6Am6OQCH0eF3g3YFlHbeQF8GTGSaRpEV2S1dhS4QwPC/sRqilbaCN
 7ED3NcQthyTGZ8+QxqZJ85DHWP+OBr3UT8bxY+jvFB2TfGYQeCgbaK9GaQEBxCIn7fCp
 uR8adhu+RdizIyaSlC1FvUoPA9zOtUv8x0qyX1fSsqDPr6cErFBjTm5kNr7UTUhwQqt3
 Sk9VJFiSgP9z/vFcSUIlyhMRVK8NAhZoNj3X+5lgW1q5XuwDhtrcgEsrrrgSrgFY74nM
 ZPJw==
X-Gm-Message-State: AC+VfDylXya+rdrHyEjrdAx1D38UMHP51383cFN4NW3wMeyGux+8A0HK
 0x9n7kyp49SpgMCZazOfd+NfBg==
X-Google-Smtp-Source: ACHHUZ4GQQYfjI+Kwz6oivxZ7ZI4laKll8dpD7foTOy9qRy7emQYYKEyOMOV4fS9zkDhRL7txRwrOQ==
X-Received: by 2002:a17:902:b40f:b0:19e:839e:49d8 with SMTP id
 x15-20020a170902b40f00b0019e839e49d8mr283437plr.59.1683126096130; 
 Wed, 03 May 2023 08:01:36 -0700 (PDT)
Received: from localhost ([135.180.227.0]) by smtp.gmail.com with ESMTPSA id
 s18-20020a170902ea1200b001a4edbabad3sm6836585plg.230.2023.05.03.08.01.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 08:01:35 -0700 (PDT)
Date: Wed, 03 May 2023 08:01:35 -0700 (PDT)
X-Google-Original-Date: Wed, 03 May 2023 08:01:33 PDT (-0700)
Subject: Re: [PATCH v2] linux-user: Add /proc/cpuinfo handler for RISC-V
In-Reply-To: <mvmv8h93bme.fsf@suse.de>
CC: laurent@vivier.eu, qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: schwab@suse.de
Message-ID: <mhng-e7adacc2-fc20-4dd6-912a-3dcb8c659ccf@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=palmer@dabbelt.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, 03 May 2023 04:20:09 PDT (-0700), schwab@suse.de wrote:
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
> v2: dynmically compute the isa string
>
>  linux-user/syscall.c | 55 ++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 53 insertions(+), 2 deletions(-)
>
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 69f740ff98..6df138c8b6 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8231,7 +8231,8 @@ void target_exception_dump(CPUArchState *env, const char *fmt, int code)
>  }
>
>  #if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN || \
> -    defined(TARGET_SPARC) || defined(TARGET_M68K) || defined(TARGET_HPPA)
> +    defined(TARGET_SPARC) || defined(TARGET_M68K) || defined(TARGET_HPPA) || \
> +    defined(TARGET_RISCV)
>  static int is_proc(const char *filename, const char *entry)
>  {
>      return strcmp(filename, entry) == 0;
> @@ -8309,6 +8310,56 @@ static int open_cpuinfo(CPUArchState *cpu_env, int fd)
>  }
>  #endif
>
> +#if defined(TARGET_RISCV)
> +static int open_cpuinfo(CPUArchState *cpu_env, int fd)
> +{
> +    int i, num_cpus;
> +    char isa[32];
> +
> +#if defined(TARGET_RISCV32)
> +    strcpy (isa, "rv32");
> +#endif
> +#if defined(TARGET_RISCV64)
> +    strcpy (isa, "rv64");
> +#endif
> +    i = strlen (isa);
> +    if (riscv_has_ext (cpu_env, RVI))
> +        isa[i++] = 'i';
> +    if (riscv_has_ext (cpu_env, RVE))
> +        isa[i++] = 'e';
> +    if (riscv_has_ext (cpu_env, RVM))
> +        isa[i++] = 'm';
> +    if (riscv_has_ext (cpu_env, RVA))
> +        isa[i++] = 'a';
> +    if (riscv_has_ext (cpu_env, RVF))
> +        isa[i++] = 'f';
> +    if (riscv_has_ext (cpu_env, RVD))
> +        isa[i++] = 'd';
> +    if (riscv_has_ext (cpu_env, RVV))
> +        isa[i++] = 'v';
> +    if (riscv_has_ext (cpu_env, RVC))
> +        isa[i++] = 'c';

Oddly enough, pretty much the only "must" in the ISA string rules is the 
ordering of extensions and it's C before V

    \caption{Standard ISA extension names.  The table also defines the
      canonical order in which extension names must appear in the name
      string, with top-to-bottom in table indicating first-to-last in the
      name string, e.g., RV32IMACV is legal, whereas RV32IMAVC is not.}

I guess that assumes figure captions are normative?  I'm not sure we get 
into that level of detail, though.

> +    isa[i] = 0;
> +
> +    num_cpus = sysconf(_SC_NPROCESSORS_ONLN);
> +    for (i = 0; i < num_cpus; i++) {
> +        dprintf(fd, "processor\t: %d\n", i);
> +        dprintf(fd, "hart\t\t: %d\n", i);
> +        dprintf(fd, "isa\t\t: %s\n", isa);
> +#if defined(TARGET_RISCV32)
> +        dprintf(fd, "mmu\t\t: sv32\n");
> +#endif
> +#if defined(TARGET_RISCV64)
> +        dprintf(fd, "mmu\t\t: sv57\n");
> +#endif
> +        dprintf(fd, "mvendorid\t: 0x0\n");
> +        dprintf(fd, "marchid\t\t: 0x0\n");
> +        dprintf(fd, "mimpid\t\t: 0x0\n\n");
> +    }
> +    return 0;
> +}
> +#endif
> +
>  #if defined(TARGET_M68K)
>  static int open_hardware(CPUArchState *cpu_env, int fd)
>  {
> @@ -8333,7 +8384,7 @@ static int do_openat(CPUArchState *cpu_env, int dirfd, const char *pathname, int
>  #if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN
>          { "/proc/net/route", open_net_route, is_proc },
>  #endif
> -#if defined(TARGET_SPARC) || defined(TARGET_HPPA)
> +#if defined(TARGET_SPARC) || defined(TARGET_HPPA) || defined(TARGET_RISCV)
>          { "/proc/cpuinfo", open_cpuinfo, is_proc },
>  #endif
>  #if defined(TARGET_M68K)

Aside from that,

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

Thanks!

