Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DACB41C881
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 17:32:52 +0200 (CEST)
Received: from localhost ([::1]:35004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVbZj-000250-3G
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 11:32:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVbVc-0000VT-4z
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 11:28:36 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:33231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVbVV-0003EP-0D
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 11:28:35 -0400
Received: from [192.168.100.1] ([82.142.21.142]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M6DnM-1mTQiF0sPo-006ecs; Wed, 29 Sep 2021 17:28:15 +0200
Subject: Re: [PATCH-for-6.2 1/2] disas/nios2: Fix style in print_insn_nios2()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210807110939.95853-1-f4bug@amsat.org>
 <20210807110939.95853-2-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <d41d0802-51a3-b540-84e2-f8d0a5646d8f@vivier.eu>
Date: Wed, 29 Sep 2021 17:28:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807110939.95853-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:vYvd07wFxt+xtRGOv/68PgE9AfAMYHP0dxUdWonF23rYo4yPYVu
 caD+pS5efyg7IfNw5u2e+zmyVfTsDvb4SJZ3e8ilG9/eUBDX/yiNMw9TUU45ytWSoJRTNoY
 6/a+rIrjXc0hQZb0YZab8LNEeM5uqwlSfS1J6MWoZknlUW+cJtMRL3hli2weP5wG41EHKij
 /K251XJdOhHD0XDqy1/zw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4SDJlfGSOH8=:JgTwcT+UgzM9ggdvoRdSor
 S0mNqhV0xFOmrV/xrhDpV+wmY3WTBC4J2935nLnAFkoQcLb/ejYnHXPLU7QHKHVknds78y6ut
 dv0/XPfYs3hhz3hOPiLSLQlRGDkJCmgPBgHCRpzh911laeLpnSQe1qkRx7OG9dNvzhz3jJpyu
 6zLXOtPE11A/tlWdrvn/V+jQhGLd9VctzVVKlh02ajXcR9l3HYU6SPJE+0rHehP/hCCblA41A
 BvZuRsKNDjaCkTEL2gOXANKpQrFkshTO73lekqOOQq6dkatOA+xf7KnUKi3y9eWKNLRTAZz8L
 RtElw0kzKu2+9eUpDwJId1S1IEAvqkakHopE6outBkleimuLlMqQD8E5nJh7lPoZEmnQaFBCQ
 FggP7kn56yu0V4pP0FQJliMZs7yZgonpl1Ikzt0wC0/Klo8R/1aLXo1PdaJcz08g8C2BQoqq/
 lHs4+TeGerpYe1YwqwNgY97Z3vlRnkQQQ8pTkSkbs+DkvoQla60/Z7ozwD4FFvGY+MxMM9FwE
 RjuyEQd8ts1snH6A2iT6kgqgSV7coI6iT/bMZoKmIBMybEGSU3+Yk/XpnzLWuc+pDiVxv7Yqr
 ygY5WOkwXm3HNcUoYMnepBcLw/0HzDabbXmgM/N7ytP793WuD0OxM3Le4lolcAVo107Ow2RYY
 33+nNg0UUchCG22lig6edHkzqW65dV0byeEBsLcLOfXGxL/fiHrOyK5QKLObXkeWgQniew8fa
 xqcvD6ykrJBKp54jzLwo1CZ6Aa/N5tFbpF0oUw==
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
> We are going to modify this function, fix its style first.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  disas/nios2.c | 53 +++++++++++++++++++++++++--------------------------
>  1 file changed, 26 insertions(+), 27 deletions(-)
> 
> diff --git a/disas/nios2.c b/disas/nios2.c
> index c3e82140c79..d124902ae3e 100644
> --- a/disas/nios2.c
> +++ b/disas/nios2.c
> @@ -3482,38 +3482,37 @@ static int
>  print_insn_nios2 (bfd_vma address, disassemble_info *info,
>  		  enum bfd_endian endianness)
>  {
> -  bfd_byte buffer[INSNLEN];
> -  int status;
> +    bfd_byte buffer[INSNLEN];
> +    int status;
>  
> -  status = (*info->read_memory_func) (address, buffer, INSNLEN, info);
> -  if (status == 0)
> -    {
> -      unsigned long insn;
> -      if (endianness == BFD_ENDIAN_BIG)
> -	insn = (unsigned long) bfd_getb32 (buffer);
> -      else
> -	insn = (unsigned long) bfd_getl32 (buffer);
> -      return nios2_disassemble (address, insn, info);
> +    status = (*info->read_memory_func)(address, buffer, INSNLEN, info);
> +    if (status == 0) {
> +        unsigned long insn;
> +        if (endianness == BFD_ENDIAN_BIG) {
> +            insn = (unsigned long) bfd_getb32(buffer);
> +        } else {
> +            insn = (unsigned long) bfd_getl32(buffer);
> +        }
> +        return nios2_disassemble(address, insn, info);
>      }
>  
> -  /* We might have a 16-bit R2 instruction at the end of memory.  Try that.  */
> -  if (info->mach == bfd_mach_nios2r2)
> -    {
> -      status = (*info->read_memory_func) (address, buffer, 2, info);
> -      if (status == 0)
> -	{
> -	  unsigned long insn;
> -	  if (endianness == BFD_ENDIAN_BIG)
> -	    insn = (unsigned long) bfd_getb16 (buffer);
> -	  else
> -	    insn = (unsigned long) bfd_getl16 (buffer);
> -	  return nios2_disassemble (address, insn, info);
> -	}
> +    /* We might have a 16-bit R2 instruction at the end of memory. Try that. */
> +    if (info->mach == bfd_mach_nios2r2) {
> +        status = (*info->read_memory_func)(address, buffer, 2, info);
> +        if (status == 0) {
> +            unsigned long insn;
> +            if (endianness == BFD_ENDIAN_BIG) {
> +                insn = (unsigned long) bfd_getb16(buffer);
> +            } else {
> +                insn = (unsigned long) bfd_getl16(buffer);
> +            }
> +            return nios2_disassemble(address, insn, info);
> +        }
>      }
>  
> -  /* If we got here, we couldn't read anything.  */
> -  (*info->memory_error_func) (status, address, info);
> -  return -1;
> +    /* If we got here, we couldn't read anything.  */
> +    (*info->memory_error_func)(status, address, info);
> +    return -1;
>  }
>  
>  /* These two functions are the main entry points, accessed from
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

