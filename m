Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEA42D89B1
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 20:24:58 +0100 (CET)
Received: from localhost ([::1]:55350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koAVk-0000jc-Ts
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 14:24:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noring@nocrew.org>) id 1ko9YB-0006MN-Rz
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:23:25 -0500
Received: from ste-pvt-msa1.bahnhof.se ([213.80.101.70]:60775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noring@nocrew.org>) id 1ko9YA-0003bh-4D
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:23:23 -0500
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id DD92140CA2;
 Sat, 12 Dec 2020 18:03:51 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Score: -1.901
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f9khAWnkFLcs; Sat, 12 Dec 2020 18:03:51 +0100 (CET)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 06E4D3FA44;
 Sat, 12 Dec 2020 18:03:49 +0100 (CET)
Date: Sat, 12 Dec 2020 18:03:49 +0100
From: Fredrik Noring <noring@nocrew.org>
To: "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: [PATCH 3/4] default-configs: Support o32 ABI with 64-bit MIPS CPUs
Message-ID: <X9T39YSpcVb4kuWa@sx9>
References: <20201119161710.1985083-1-f4bug@amsat.org>
 <20201119161710.1985083-4-f4bug@amsat.org>
 <alpine.LFD.2.21.2011191634540.656242@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.LFD.2.21.2011191634540.656242@eddie.linux-mips.org>
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
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mathieu Malaterre <malat@debian.org>, YunQiang Su <wzssyqa@gmail.com>,
 James Cowgill <james410@cowgill.org.uk>, David Daney <ddaney.cavm@gmail.com>,
 =?utf-8?Q?J=C3=BCrgen?= Urban <JuergenUrban@gmx.de>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 19, 2020 at 04:45:29PM +0000, Maciej W. Rozycki wrote:
> On Thu, 19 Nov 2020, Philippe Mathieu-Daudé wrote:
> 
> > MIPS o32 ABI on 64-bit CPUs looks like a ILP32-on-64bit data
> > model, allowing 64-bit arithmetic and data movement instructions.
> > 
> > This is the default ABI used by the "Sony Linux Toolkit for
> > Playstation 2".
> 
>  Please don't, not at least with a generic configuration (i.e. make it 
> unambiguous that this is R5900-specific).  This only works with R5900 
> because it does not implement the MIPS ISA correctly (e.g. see what $ra is 
> set to with JAL/JALR/etc. in the kernel mode), and it is not supported by 
> the standard Linux ABI.  Use n32 instead, which has the same functionality 
> and is standard (and is also a better ABI in terms of performance).
> 
>  You'd probably need to implement all the R5900 addressing quirks for your 
> proposed hack to match hardware, or otherwise you'll end up with emulation 
> that creates its own reality.

I agree. Modern Linux kernel and GCC are important too. It seems both o32
and n32, with quirks, are generally accepted, but R5900 MMIs and other
special features are less clear:

For example, given the fact that the 128-bit MMIs are unconditionally
executable on R5900 hardware, a user may be forgiven to believe that they
always work. But unless the Linux kernel restores 128-bit registers in its
operating mode switches, which could be o32, there will be silent data
corruption (and ensuing frustration).

(For this reason I favour full register restores in all operating modes.)

Fredrik

