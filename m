Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE7DABAFD
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Sep 2019 16:34:19 +0200 (CEST)
Received: from localhost ([::1]:57020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i6FJZ-0003xG-WF
	for lists+qemu-devel@lfdr.de; Fri, 06 Sep 2019 10:34:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54390)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1i6FIY-0003Pm-Bm
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 10:33:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1i6FIX-0007ip-0X
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 10:33:14 -0400
Received: from mail.ilande.co.uk ([46.43.2.167]:33690
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1i6FIW-000786-Pe
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 10:33:12 -0400
Received: from host86-168-80-252.range86-168.btcentralplus.com
 ([86.168.80.252] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1i6FFY-0001rx-5J; Fri, 06 Sep 2019 15:30:10 +0100
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20190801183012.17564-1-peter.maydell@linaro.org>
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
Message-ID: <25efcf4b-8b34-11a0-a6d5-992b363ce474@ilande.co.uk>
Date: Fri, 6 Sep 2019 15:29:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190801183012.17564-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.168.80.252
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: No (on mail.default.ilande.uk0.bigv.io); Unknown failure
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.43.2.167
Subject: Re: [Qemu-devel] [PATCH 0/7] target/sparc: Convert to
 do_transaction_failed hook
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/08/2019 19:30, Peter Maydell wrote:

> This patchset converts the SPARC target away from the old
> broken do_unassigned_access hook to the new (added in 2017...)
> do_transaction_failed hook. In the process it fixes a number
> of bugs in corner cases.
> 
> The SPARC ld/st-with-ASI helper functions are odd in that they
> make use of the cpu_unassigned_access() function as a way of
> raising an MMU fault. We start by making them just directly
> call a new sparc_raise_mmu_fault() function so they don't go
> through the hook function. This in-passing fixes a bug where
> the hook was using GETPC(), which won't work inside a function
> several levels deep in the callstack from a helper function.
> 
> The next four patches convert places that were using ld*_phys()
> and st*_phys() and thus getting "implicitly causes an exception
> via do_unassigned_access if it gets a bus error" behaviour.
> We make them all use address_space_ld*/st* functions instead,
> and explicitly handle the transaction-failure case. Variously:
>  * for MMU passthrough, this doesn't change behaviour
>  * for the MXCC stream source/destination ASI accesses,
>    this doesn't change behaviour, but the current behaviour
>    looks a bit weird, so a TODO comment is left in case anybody
>    wants to chase up the actual right behaviour in future
>  * for page table walks this fixes a bug where we would take
>    an exception instead of reporting the page table walk failure
>    with the correct fault status register information
>  * for the page table walk in mmu_probe() this fixes a bug where
>    we would take an exception when we are supposed to just report
>    failure. Note that the spec says that MMU probe operations
>    are supposed to set the fault status registers, but we do not;
>    again I leave this pre-existing bug as a TODO note.
> Next, we remove one entirely pointless and unused ldl_phys()
> call from dump_mmu().
> 
> Finally, the last patch can do the very small amount of work to
> change over to the new hook function. This will cause all the
> "handle error" code paths in the preceding patches to become
> active (when a do_unassigned_access hook is present the load
> or store functions will never return an error, because the hook
> will get called and throw an exception first).
> 
> I have tested that I can boot a sparc32 debian image, and
> that sparc64 boots up to the firmware prompt, but this could
> certainly use more extensive testing than I have given it.
> 
> (After SPARC, the only remaining unassigned-access-hook users
> are RISCV, which crept in while I wasn't looking, and MIPS,
> which is doing something complicated with the Jazz board that
> I haven't yet investigated.)
> 
> thanks
> --PMM
> 
> Peter Maydell (7):
>   target/sparc: Factor out the body of sparc_cpu_unassigned_access()
>   target/sparc: Check for transaction failures in MMU passthrough ASIs
>   target/sparc: Check for transaction failures in MXCC stream ASI
>     accesses
>   target/sparc: Correctly handle bus errors in page table walks
>   target/sparc: Handle bus errors in mmu_probe()
>   target/sparc: Remove unused ldl_phys from dump_mmu()
>   target/sparc: Switch to do_transaction_failed() hook
> 
>  target/sparc/cpu.h         |   8 +-
>  target/sparc/cpu.c         |   2 +-
>  target/sparc/ldst_helper.c | 319 +++++++++++++++++++++----------------
>  target/sparc/mmu_helper.c  |  57 +++++--
>  4 files changed, 238 insertions(+), 148 deletions(-)

I've just run this through my SPARC test images with a fairly recent git master and I
don't see any obvious regressions so:

Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Thanks for taking the time to do the conversion for the SPARC target.


ATB,

Mark.

