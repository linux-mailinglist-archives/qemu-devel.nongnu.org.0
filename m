Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC29541C882
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 17:32:55 +0200 (CEST)
Received: from localhost ([::1]:35330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVbZm-0002KD-Vb
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 11:32:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVbVk-0000Xj-Jb
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 11:28:45 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:48957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVbVi-0003QH-Vq
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 11:28:44 -0400
Received: from [192.168.100.1] ([82.142.21.142]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MatmF-1n7hHj0p7D-00cOVy; Wed, 29 Sep 2021 17:28:36 +0200
Subject: Re: [PATCH-for-6.2 2/2] disas/nios2: Simplify endianess conversion
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210807110939.95853-1-f4bug@amsat.org>
 <20210807110939.95853-3-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <1fc4c146-890c-de33-de8a-9198ae11a52a@vivier.eu>
Date: Wed, 29 Sep 2021 17:28:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807110939.95853-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:sKTvBA3TOUqkhwW5gkCUqgjr0c5HNUvdIykRuSdxY4A8Bj8K3CG
 DSsT69PVzJbLXThPOs4NolzyFyHgednKC6r8VyJ5Yc014wtr/kKeyd1wLelREJNoOY2+mAs
 UIziVusJV7MLsieUGWT7ipOu5Nvb5UXpipeS/TrLI3WPKaNlRFuLjME9Us/pTZy9xTdhNeX
 6UgpZszhOeUXhptwS3yzQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ebTIfcKonoc=:2/Qvi9TG9zMB7u4UMH4/8I
 C0+0QYvmMDKziqfb+wA53cduCPwzU1EOD7+p3emm+kcMO352Y8Tq1ZCZf7YfRoXLHUgArGY03
 meSNYCT4SjxDule0bkt4HoAYGDKTRfdlZBWzluBACIVq5b2LeQwy220t09bgrzbmh/pPwqUNQ
 XTu41CJFvDcLLOga3bDnUvrQ4UuXHoX5lf6DmdZlq0BeVaufhL7eK25iyhoGu3Kyv43le1Xq7
 ai+GX5vXhm42MrN40vwkw1NggNvKPFVsUiNI+Yer4SryLp06F7athDHaAf5trKgR6jc1qQv1B
 KIDWBGEvnelcovObw0wKgxKQ22zuXU0136e5NdAkReNUcrjFDXgBZhaSKElFu09gmqXVqzhYd
 7QsjeFq8eM0cZIkKUa8ee+wRW7Aq4rBqSAvWdWY7SJWvI+rravFw3a5RoDehb99hj/ndiABZn
 c9s+T1JKRWrLtfQc/7/wrtq+YR+CXkA51zKqEVcjFx3wZeb12R9OmeA3VyNIEdUj2x632Nptt
 Hj8BhBljnG+TpxVQznzemd0abui+v7Y2G0u5DEdazCFihMFmBGkSOJsywwmxFT2nFdeUxxKEq
 vY3/7A5EDiqgFJHbOJ+4AOarE6WGpKDNGfVxA4LGJ5BlyWxw1263VLfNvAdPJOeQ6PY0bZYjb
 ZHcpK4ncziNx67pfjt23v9UQQpNhEMONhTiXw5QbRwVn+eCn/eQODrmzIG+dzRv5QVLYDeZPa
 vlZGSH+/5MKBDj/MkjJ33p/jed67pdA8aFBCGw==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.03,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Marek Vasut <marex@denx.de>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 07/08/2021 à 13:09, Philippe Mathieu-Daudé a écrit :
> Since commit 12b6e9b27d4 ("disas: Clean up CPUDebug initialization")
> the disassemble_info->bfd_endian enum is set for all targets in
> target_disas(). We can directly call print_insn_nios2() and simplify.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/disas/dis-asm.h |  3 +--
>  disas/nios2.c           | 22 +++-------------------
>  target/nios2/cpu.c      |  6 +-----
>  3 files changed, 5 insertions(+), 26 deletions(-)
> 
> diff --git a/include/disas/dis-asm.h b/include/disas/dis-asm.h
> index 524f29196d9..08e1beec854 100644
> --- a/include/disas/dis-asm.h
> +++ b/include/disas/dis-asm.h
> @@ -455,8 +455,7 @@ int print_insn_crisv32          (bfd_vma, disassemble_info*);
>  int print_insn_crisv10          (bfd_vma, disassemble_info*);
>  int print_insn_microblaze       (bfd_vma, disassemble_info*);
>  int print_insn_ia64             (bfd_vma, disassemble_info*);
> -int print_insn_big_nios2        (bfd_vma, disassemble_info*);
> -int print_insn_little_nios2     (bfd_vma, disassemble_info*);
> +int print_insn_nios2(bfd_vma, disassemble_info*);
>  int print_insn_xtensa           (bfd_vma, disassemble_info*);
>  int print_insn_riscv32          (bfd_vma, disassemble_info*);
>  int print_insn_riscv64          (bfd_vma, disassemble_info*);
> diff --git a/disas/nios2.c b/disas/nios2.c
> index d124902ae3e..98ac07d72e9 100644
> --- a/disas/nios2.c
> +++ b/disas/nios2.c
> @@ -3478,9 +3478,7 @@ nios2_disassemble (bfd_vma address, unsigned long opcode,
>     instruction word at the address given, and prints the disassembled
>     instruction on the stream info->stream using info->fprintf_func. */
>  
> -static int
> -print_insn_nios2 (bfd_vma address, disassemble_info *info,
> -		  enum bfd_endian endianness)
> +int print_insn_nios2(bfd_vma address, disassemble_info *info)
>  {
>      bfd_byte buffer[INSNLEN];
>      int status;
> @@ -3488,7 +3486,7 @@ print_insn_nios2 (bfd_vma address, disassemble_info *info,
>      status = (*info->read_memory_func)(address, buffer, INSNLEN, info);
>      if (status == 0) {
>          unsigned long insn;
> -        if (endianness == BFD_ENDIAN_BIG) {
> +        if (info->endian == BFD_ENDIAN_BIG) {
>              insn = (unsigned long) bfd_getb32(buffer);
>          } else {
>              insn = (unsigned long) bfd_getl32(buffer);
> @@ -3501,7 +3499,7 @@ print_insn_nios2 (bfd_vma address, disassemble_info *info,
>          status = (*info->read_memory_func)(address, buffer, 2, info);
>          if (status == 0) {
>              unsigned long insn;
> -            if (endianness == BFD_ENDIAN_BIG) {
> +            if (info->endian == BFD_ENDIAN_BIG) {
>                  insn = (unsigned long) bfd_getb16(buffer);
>              } else {
>                  insn = (unsigned long) bfd_getl16(buffer);
> @@ -3514,17 +3512,3 @@ print_insn_nios2 (bfd_vma address, disassemble_info *info,
>      (*info->memory_error_func)(status, address, info);
>      return -1;
>  }
> -
> -/* These two functions are the main entry points, accessed from
> -   disassemble.c.  */
> -int
> -print_insn_big_nios2 (bfd_vma address, disassemble_info *info)
> -{
> -  return print_insn_nios2 (address, info, BFD_ENDIAN_BIG);
> -}
> -
> -int
> -print_insn_little_nios2 (bfd_vma address, disassemble_info *info)
> -{
> -  return print_insn_nios2 (address, info, BFD_ENDIAN_LITTLE);
> -}
> diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
> index 5e37defef80..5b503b5bb99 100644
> --- a/target/nios2/cpu.c
> +++ b/target/nios2/cpu.c
> @@ -146,11 +146,7 @@ static void nios2_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
>  {
>      /* NOTE: NiosII R2 is not supported yet. */
>      info->mach = bfd_arch_nios2;
> -#ifdef TARGET_WORDS_BIGENDIAN
> -    info->print_insn = print_insn_big_nios2;
> -#else
> -    info->print_insn = print_insn_little_nios2;
> -#endif
> +    info->print_insn = print_insn_nios2;
>  }
>  
>  static int nios2_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

