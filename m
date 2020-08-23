Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B41E24ED48
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Aug 2020 15:01:18 +0200 (CEST)
Received: from localhost ([::1]:35120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k9pcb-00036y-7y
	for lists+qemu-devel@lfdr.de; Sun, 23 Aug 2020 09:01:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1k9pbc-0002Vg-GN
 for qemu-devel@nongnu.org; Sun, 23 Aug 2020 09:00:16 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:46963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1k9pba-0003Sw-FM
 for qemu-devel@nongnu.org; Sun, 23 Aug 2020 09:00:16 -0400
Received: from [192.168.100.1] ([82.252.135.186]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MnFps-1kt2KM2q3g-00jJFk; Sun, 23 Aug 2020 15:00:11 +0200
Subject: Re: [PATCH v2] linux-user: detect mismatched ELF ABI in
 qemu-mips[n32][el]
To: =?UTF-8?Q?Carlo_Marcelo_Arenas_Bel=c3=b3n?= <carenas@gmail.com>,
 qemu-devel@nongnu.org
References: <20200823101703.18451-1-carenas@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <dc73ce82-df23-d3c8-7b33-03dbbb7fc792@vivier.eu>
Date: Sun, 23 Aug 2020 15:00:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200823101703.18451-1-carenas@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:X++bX0NxxqJboG1hWPf56YLSpdcGNJVYmmwn8WE+4ziwMcHIT/y
 C6q1FjwygxM/H0gMOzIx5HY3dibH30rMK/yTzM6px86wAsx72mR3NeIpmRGJZK/j+4XdrQy
 0NYoZ3U0vewbwLI+96FZ+j4Mic+ZXsX++GfVKOj8GVDMtAWzwbKoDbbF7j+0dpmMx3a4sKz
 /CWLjecqyHhnWN5YfEUpA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7G7ZlLgro2g=:HELLG4sxoLSIyg3t53qXXv
 KsxOr4Mf4a0DbLBPzmCYP0bQwSHe9FftMJ+rkDt9pAAzploRTtDwELbNl01awgGzObMf54pYb
 e73L4/D+IMzGplBlwiQcwgVn3u+0Hq2cgKxA9ea1ftmcT3XAFFNEc1DFdo4KWprv/3hScVFn/
 s67vd+hOiR2pBjpugcIFH5anVJ1kZav91e9k2T9xqqKrC9egC8Kg6JWIMfS1za0i07bzRNVz9
 5Th8o96TOtxksORTQaaiwujA+SVj0nWKT+gFjny4NbNVgHyW9lm8RASb/7cXmGIVsi9EPNZ11
 3aHYTtLtcGPn4e3EDT3HaoeSamwOvro9ZSRKp/yQlax7aRwpy2fad9I7PsjelVWRdfv1Xrnz9
 YbyJX1tWpCgJer0fFuSnKkOryVCyJZuLAQ2zXpDA6MsGv64DVQ5sPEjSbBObZvveRrQNGR25J
 Id9TgXG2Khs/EiKC2sYLJReqvn/BhIJ7mbahK6zgzS+e1HncmFW7f7LiMcsfFQFiP5leVrhSS
 JPc83/t+UtoFVqfly1j2e5Gzu6mkeBSt2bGD7upQVlpVn8htLf3La4WQZSlhJlM1ifdmCeLMY
 n90Wk/OVMsWRId23rXChOpsUbIoAQ3awD+O6qYZUVjjco4Phhp/DcSCI14gscLnF/2GwH+3Ys
 5QGEvQm4GMoHkyh8YtfEibiZKAtiPLuZd5sUljor9ILPq2KGdLrJJVrLf/iSB4bFPXnrVvonl
 kpRRymkanRSBQfVZl+FMDt+i+Urn0p592Zm+GyQy34AweFCgfWNIQUdZykpTSdkeg38cpQYEc
 eApFJeNTOJqLAjJ2qDaen8V+b7UU4GWSApr0HavfeHQ6xWfcFE+27UKoKbNcb2SNxeIe8E5
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/23 09:00:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.381,
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
Cc: macro@linux-mips.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 23/08/2020 à 12:17, Carlo Marcelo Arenas Belón a écrit :
> MIPS provides 2 ILP32 ABIs, and therefore 4 possible qemu-mips binaries
> with 2 pairs using the same endianess and bitness.
> 
> This could lead to an O32 image loading in the N32 binary or vice versa
> and in cryptic errors (if lucky that the CPU doesn't match the FPU used)
> like :
> 
>   qemu: Unexpected FPU mode       (o32 ELF loaded to qemu-mipsn32[el])
>   ELF binary's NaN mode not supported by CPU    (n32 -> qemu-mips[el])
> 
> Add an ABI check macro that could be used while checking the ELF header
> that relies in the ABI2 flag to identify n32 binaries and abort instead
> early with a more descriptive error :
> 
>   Invalid ELF image for this architecture
> 
> Signed-off-by: Carlo Marcelo Arenas Belón <carenas@gmail.com>
> ---
> Changes since v1:
> - Use the provided definition from include/elf.h (per Laurent)
> - Abort instead of warning (per Laurent, not using a custom error though)
> - Expand the check to all other combinations (per Aleksandar)
> 
>  linux-user/elfload.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index fe9dfe795d..69936dcd45 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -918,6 +918,12 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUPPCState *en
>  
>  #define elf_check_arch(x) ((x) == EM_MIPS || (x) == EM_NANOMIPS)
>  
> +#ifdef TARGET_ABI_MIPSN32
> +#define elf_check_abi(x) ((x) & EF_MIPS_ABI2)
> +#else
> +#define elf_check_abi(x) (!((x) & EF_MIPS_ABI2))
> +#endif
> +
>  static inline void init_thread(struct target_pt_regs *regs,
>                                 struct image_info *infop)
>  {
> @@ -1487,6 +1493,10 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs,
>  #define elf_check_arch(x) ((x) == ELF_ARCH)
>  #endif
>  
> +#ifndef elf_check_abi
> +#define elf_check_abi(x) (1)
> +#endif
> +
>  #ifndef ELF_HWCAP
>  #define ELF_HWCAP 0
>  #endif
> @@ -1644,6 +1654,7 @@ static bool elf_check_ident(struct elfhdr *ehdr)
>  static bool elf_check_ehdr(struct elfhdr *ehdr)
>  {
>      return (elf_check_arch(ehdr->e_machine)
> +            && elf_check_abi(ehdr->e_flags)
>              && ehdr->e_ehsize == sizeof(struct elfhdr)
>              && ehdr->e_phentsize == sizeof(struct elf_phdr)
>              && (ehdr->e_type == ET_EXEC || ehdr->e_type == ET_DYN));
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

