Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAF9C42A4
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 23:24:36 +0200 (CEST)
Received: from localhost ([::1]:48320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFPdL-0002W0-29
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 17:24:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60229)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1iFOpe-0001gM-71
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 16:33:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1iFOpc-0006cQ-0h
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 16:33:13 -0400
Received: from mail.ilande.co.uk ([46.43.2.167]:48110
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1iFOpb-0006Z2-Pb
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 16:33:11 -0400
Received: from host86-133-194-221.range86-133.btcentralplus.com
 ([86.133.194.221] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1iFOpp-00088I-Vd; Tue, 01 Oct 2019 21:33:26 +0100
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190930202125.21064-1-richard.henderson@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Openpgp: preference=signencrypt
Autocrypt: addr=mark.cave-ayland@ilande.co.uk; keydata=
 mQENBFQJuzwBCADAYvxrwUh1p/PvUlNFwKosVtVHHplgWi5p29t58QlOUkceZG0DBYSNqk93
 3JzBTbtd4JfFcSupo6MNNOrCzdCbCjZ64ik8ycaUOSzK2tKbeQLEXzXoaDL1Y7vuVO7nL9bG
 E5Ru3wkhCFc7SkoypIoAUqz8EtiB6T89/D9TDEyjdXUacc53R5gu8wEWiMg5MQQuGwzbQy9n
 PFI+mXC7AaEUqBVc2lBQVpAYXkN0EyqNNT12UfDLdxaxaFpUAE2pCa2LTyo5vn5hEW+i3VdN
 PkmjyPvL6DdY03fvC01PyY8zaw+UI94QqjlrDisHpUH40IUPpC/NB0LwzL2aQOMkzT2NABEB
 AAG0ME1hcmsgQ2F2ZS1BeWxhbmQgPG1hcmsuY2F2ZS1heWxhbmRAaWxhbmRlLmNvLnVrPokB
 OAQTAQIAIgUCVAm7PAIbAwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQW8LFb64PMh9f
 NAgAuc3ObOEY8NbZko72AGrg2tWKdybcMVITxmcor4hb9155o/OWcA4IDbeATR6cfiDL/oxU
 mcmtXVgPqOwtW3NYAKr5g/FrZZ3uluQ2mtNYAyTFeALy8YF7N3yhs7LOcpbFP7tEbkSzoXNG
 z8iYMiYtKwttt40WaheWuRs0ZOLbs6yoczZBDhna3Nj0LA3GpeJKlaV03O4umjKJgACP1c/q
 T2Pkg+FCBHHFP454+waqojHp4OCBo6HyK+8I4wJRa9Z0EFqXIu8lTDYoggeX0Xd6bWeCFHK3
 DhD0/Xi/kegSW33unsp8oVcM4kcFxTkpBgj39dB4KwAUznhTJR0zUHf63LkBDQRUCbs8AQgA
 y7kyevA4bpetM/EjtuqQX4U05MBhEz/2SFkX6IaGtTG2NNw5wbcAfhOIuNNBYbw6ExuaJ3um
 2uLseHnudmvN4VSJ5Hfbd8rhqoMmmO71szgT/ZD9MEe2KHzBdmhmhxJdp+zQNivy215j6H27
 14mbC2dia7ktwP1rxPIX1OOfQwPuqlkmYPuVwZP19S4EYnCELOrnJ0m56tZLn5Zj+1jZX9Co
 YbNLMa28qsktYJ4oU4jtn6V79H+/zpERZAHmH40IRXdR3hA+Ye7iC/ZpWzT2VSDlPbGY9Yja
 Sp7w2347L5G+LLbAfaVoejHlfy/msPeehUcuKjAdBLoEhSPYzzdvEQARAQABiQEfBBgBAgAJ
 BQJUCbs8AhsMAAoJEFvCxW+uDzIfabYIAJXmBepHJpvCPiMNEQJNJ2ZSzSjhic84LTMWMbJ+
 opQgr5cb8SPQyyb508fc8b4uD8ejlF/cdbbBNktp3BXsHlO5BrmcABgxSP8HYYNsX0n9kERv
 NMToU0oiBuAaX7O/0K9+BW+3+PGMwiu5ml0cwDqljxfVN0dUBZnQ8kZpLsY+WDrIHmQWjtH+
 Ir6VauZs5Gp25XLrL6bh/SL8aK0BX6y79m5nhfKI1/6qtzHAjtMAjqy8ChPvOqVVVqmGUzFg
 KPsrrIoklWcYHXPyMLj9afispPVR8e0tMKvxzFBWzrWX1mzljbBlnV2n8BIwVXWNbgwpHSsj
 imgcU9TTGC5qd9g=
Message-ID: <010a361d-ae39-8462-8b92-68127c51ea31@ilande.co.uk>
Date: Tue, 1 Oct 2019 21:33:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190930202125.21064-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.133.194.221
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v7 00/22] tcg/ppc: Add vector opcodes
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.43.2.167
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
Cc: amarkovic@wavecomp.com, hsp.cat7@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/09/2019 21:21, Richard Henderson wrote:

> Changes since v6:
>   * The have_foo tests have been split so that VSX is not
>     combined with ISA revision.
>   * The power{7,8,9} patches have been split by isa extension.
>   * Force the [TABC]X bits on within the VSX instruction defines,
>     making the usage of the VSX insns clearer, since we have no
>     additional or'ing of seemingly random bits.
> 
> Changes since v5:
>   * Disable runtime altivec detection until all of the required
>     opcodes are implemented.
>     Because dup2 was last, that really means all of the pure altivec
>     bits, so the initial patches are not bisectable in any meaningful
>     sense.  I thought about reshuffling dup2 earlier, but that created
>     too many conflicts and I was too lazy.
>   * Rearranged the patches a little bit to make sure that each
>     one actually builds, which was not the case before.
>   * Folded in the fix to tcg_out_mem_long, as discussed in the
>     followup within the v4 thread.
> 
> Changes since v4:
>   * Patch 1, "tcg/ppc: Introduce Altivec registers", is divided into
>     ten smaller patches.
>   * The net result (code-wise) is not changed between former patch 1
>     and ten new patches.
>   * Remaining (2-7) patches from v4 are applied verbatim.
>   * This means that code-wise v5 and v4 do not differ.
>   * v5 is devised to help debugging, and to better organize the code.
> 
> Changes since v3:
>   * Add support for bitsel, with the vsx xxsel insn.
>   * Rely on the new relocation overflow handling, so
>     we don't require 3 insns for a vector load.
> 
> Changes since v2:
>   * Several generic tcg patches to improve dup vs dupi vs dupm.
>     In particular, if a global temp (like guest r10) is not in
>     a host register, we should duplicate from memory instead of
>     loading to an integer register, spilling to stack, loading
>     to a vector register, and then duplicating.
>   * I have more confidence that 32-bit ppc host should work
>     this time around.  No testing on that front yet, but I've
>     unified some code sequences with 64-bit ppc host.
>   * Base altivec now supports V128 only.  Moved V64 support to
>     Power7 (v2.06), which has 64-bit load/store.
>   * Dropped support for 64-bit vector multiply using Power8.
>     The expansion was too large compared to using integer regs.
> 
> Richard Henderson (22):
>   tcg/ppc: Introduce Altivec registers
>   tcg/ppc: Introduce macro VX4()
>   tcg/ppc: Introduce macros VRT(), VRA(), VRB(), VRC()
>   tcg/ppc: Create TCGPowerISA and have_isa
>   tcg/ppc: Replace HAVE_ISA_2_06
>   tcg/ppc: Replace HAVE_ISEL macro with a variable
>   tcg/ppc: Enable tcg backend vector compilation
>   tcg/ppc: Add support for load/store/logic/comparison
>   tcg/ppc: Add support for vector maximum/minimum
>   tcg/ppc: Add support for vector add/subtract
>   tcg/ppc: Add support for vector saturated add/subtract
>   tcg/ppc: Support vector shift by immediate
>   tcg/ppc: Support vector multiply
>   tcg/ppc: Support vector dup2
>   tcg/ppc: Enable Altivec detection
>   tcg/ppc: Update vector support for VSX
>   tcg/ppc: Update vector support for v2.07 Altivec
>   tcg/ppc: Update vector support for v2.07 VSX
>   tcg/ppc: Update vector support for v2.07 FP
>   tcg/ppc: Update vector support for v3.00 Altivec
>   tcg/ppc: Update vector support for v3.00 load/store
>   tcg/ppc: Update vector support for v3.00 dup/dupi
> 
>  tcg/ppc/tcg-target.h     |   51 +-
>  tcg/ppc/tcg-target.opc.h |   13 +
>  tcg/ppc/tcg-target.inc.c | 1118 +++++++++++++++++++++++++++++++++++---
>  3 files changed, 1101 insertions(+), 81 deletions(-)
>  create mode 100644 tcg/ppc/tcg-target.opc.h

I've just tried this version with my OS X/MacOS 9 CDROM boot tests and it looks good
here: no crashes or visible artefacts AFAICT:

Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> (PPC32)


ATB,

Mark.

