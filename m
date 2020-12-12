Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AC72D85D2
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 11:20:20 +0100 (CET)
Received: from localhost ([::1]:49688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ko20f-0004VF-NJ
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 05:20:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noring@nocrew.org>) id 1ko1zh-00045X-RG
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 05:19:17 -0500
Received: from ste-pvt-msa1.bahnhof.se ([213.80.101.70]:52952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noring@nocrew.org>) id 1ko1zf-0006lP-Va
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 05:19:17 -0500
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 5CB9B3F557;
 Sat, 12 Dec 2020 11:19:13 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Score: -1.9
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z5-k5_-PYOcQ; Sat, 12 Dec 2020 11:19:12 +0100 (CET)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id E04A73F27D;
 Sat, 12 Dec 2020 11:19:11 +0100 (CET)
Date: Sat, 12 Dec 2020 11:19:11 +0100
From: Fredrik Noring <noring@nocrew.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [Qemu-devel] [PULL v2 12/12] target/mips: Introduce 32 R5900
 multimedia registers
Message-ID: <X9SZH9gbjjiucaB0@sx9>
References: <1547830785-7079-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1547830785-7079-13-git-send-email-aleksandar.markovic@rt-rk.com>
 <CAAdtpL7TtuFBRcB0no8EQLcyuRd+YLR12Mv-q2wb0MBPkEdw0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAdtpL7TtuFBRcB0no8EQLcyuRd+YLR12Mv-q2wb0MBPkEdw0g@mail.gmail.com>
Received-SPF: softfail client-ip=213.80.101.70; envelope-from=noring@nocrew.org;
 helo=ste-pvt-msa1.bahnhof.se
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
 Peter Maydell <peter.maydell@linaro.org>,
 "Maciej W. Rozycki" <macro@linux-mips.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Nov 14, 2020 at 07:23:10PM +0100, Philippe Mathieu-Daudé wrote:
> Hi Fredrik and Aleksandar,
> 
> On Fri, Jan 18, 2019 at 6:10 PM Aleksandar Markovic
> <aleksandar.markovic@rt-rk.com> wrote:
> >
> > From: Fredrik Noring <noring@nocrew.org>
> >
> > The 32 R5900 128-bit registers are split into two 64-bit halves:
> > the lower halves are the GPRs and the upper halves are accessible
> > by the R5900-specific multimedia instructions.
> >
> > Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
> > Signed-off-by: Fredrik Noring <noring@nocrew.org>
> > Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
> > ---
> >  target/mips/cpu.h       |  3 +++
> >  target/mips/translate.c | 16 ++++++++++++++++
> >  2 files changed, 19 insertions(+)
> >
> > diff --git a/target/mips/cpu.h b/target/mips/cpu.h
> > index 21daf50..c4da7df 100644
> > --- a/target/mips/cpu.h
> > +++ b/target/mips/cpu.h
> > @@ -429,6 +429,9 @@ struct TCState {
> >
> >      float_status msa_fp_status;
> >
> > +    /* Upper 64-bit MMRs (multimedia registers); the lower 64-bit are GPRs */
> > +    uint64_t mmr[32];
> 
> FYI using MMI then migrating fails because these registers are not migrated.

We can postpone the R5900 MMIs, in my opinion, because they are not (yet)
supported by modern 5.x R5900 Linux kernels anyway. The details of R5900
psABIs having them need to be sorted out too.

Fredrik

