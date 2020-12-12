Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A682D85A3
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 11:05:18 +0100 (CET)
Received: from localhost ([::1]:44414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ko1m9-0001FJ-Hb
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 05:05:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noring@nocrew.org>) id 1ko1lJ-0000pz-3X
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 05:04:25 -0500
Received: from ste-pvt-msa2.bahnhof.se ([213.80.101.71]:51115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noring@nocrew.org>) id 1ko1lH-0001N2-5a
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 05:04:24 -0500
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 0B9013F712;
 Sat, 12 Dec 2020 11:03:57 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Score: -1.9
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PFhLXEewppCX; Sat, 12 Dec 2020 11:03:55 +0100 (CET)
Received: by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id D228E3F5A7;
 Sat, 12 Dec 2020 11:03:54 +0100 (CET)
Date: Sat, 12 Dec 2020 11:04:18 +0100
From: Fredrik Noring <noring@nocrew.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [Qemu-devel] [PULL 8/8] target/mips: Preparing for adding MMI
 instructions
Message-ID: <X9SVovtcemt9CClm@sx9>
References: <1551276045-19143-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1551276045-19143-9-git-send-email-aleksandar.markovic@rt-rk.com>
 <8c3ac05a-91d4-6830-4ede-6574aca8af94@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c3ac05a-91d4-6830-4ede-6574aca8af94@amsat.org>
Received-SPF: softfail client-ip=213.80.101.71; envelope-from=noring@nocrew.org;
 helo=ste-pvt-msa2.bahnhof.se
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>,
 peter.maydell@linaro.org, "Maciej W. Rozycki" <macro@linux-mips.org>,
 qemu-devel@nongnu.org, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 13, 2020 at 10:39:42AM +0100, Philippe Mathieu-Daudé wrote:
> On 2/27/19 3:00 PM, Aleksandar Markovic wrote:
> > From: Mateja Marjanovic <Mateja.Marjanovic@rt-rk.com>
> > 
> > Set up MMI code to be compiled only for TARGET_MIPS64. This is
> > needed so that GPRs are 64 bit, and combined with MMI registers,
> > they will form full 128 bit registers.
> > 
> > Signed-off-by: Mateja Marjanovic <mateja.marjanovic@rt-rk.com>
> > Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
> > Reviewed-by: Aleksandar Rikalo <arikalo@wavecomp.com>
> > Message-Id: <1551183797-13570-2-git-send-email-mateja.marjanovic@rt-rk.com>
> > ---
> >  target/mips/translate.c | 43 +++++++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 41 insertions(+), 2 deletions(-)
> ...
> 
> >  static void decode_opc_special3(CPUMIPSState *env, DisasContext *ctx)
> >  {
> >      int rs, rt, rd, sa;
> > @@ -28796,10 +28828,11 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
> >          decode_opc_special(env, ctx);
> >          break;
> >      case OPC_SPECIAL2:
> > +#if defined(TARGET_MIPS64)
> >          if ((ctx->insn_flags & INSN_R5900) && (ctx->insn_flags & ASE_MMI)) {
> >              decode_mmi(env, ctx);
> 
> This change is incorrect, you removed support for the
> MADD[U] and MULT[U] instructions on TXx9 32-bit targets
> (TX79 still works).

The 128-bit MMIs and R5900 specific registers are always valid on R5900
hardware regardless of 32- and 64-bit operation modes[1]. CP0.Status.UX
isn't implemented[2]. In other MIPS ISA implementations, attempting to
execute 64-bit operations in 32-bit user or supervisor mode may cause a
reserved instruction exception.

It would be wise to limit any R5900 specific psABIs, while permitting
useful features such as the MMIs. GCC emits MULT[U] for R5900 o32.

Fredrik

References:

[1] "EE Core User's Manual", version 6.0, Sony Computer Entertainment Inc.,
    p. 107.

[2] "TX System RISC TX79 Core Architecture" manual, revision 2.0,
    Toshiba Corporation, p. 4-16, https://wiki.qemu.org/File:C790.pdf

