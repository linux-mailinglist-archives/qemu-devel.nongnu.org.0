Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D603DDDB3
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 18:30:37 +0200 (CEST)
Received: from localhost ([::1]:33078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAapo-0002CA-5l
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 12:30:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <macro@orcam.me.uk>) id 1mAaoy-0001QS-IQ
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 12:29:44 -0400
Received: from angie.orcam.me.uk ([2001:4190:8020::34]:45442)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <macro@orcam.me.uk>) id 1mAaow-000807-K3
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 12:29:44 -0400
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id C490592009C; Mon,  2 Aug 2021 18:29:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id BD83D92009B;
 Mon,  2 Aug 2021 18:29:38 +0200 (CEST)
Date: Mon, 2 Aug 2021 18:29:38 +0200 (CEST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH-for-6.1?] target/mips: Remove MOVZ/MOVN opcodes from
 Loongson 2E
In-Reply-To: <0fa9bc3e-e057-5516-c234-6c98ca8f1a0e@amsat.org>
Message-ID: <alpine.DEB.2.21.2108021828150.62025@angie.orcam.me.uk>
References: <20210731144155.2738493-1-f4bug@amsat.org>
 <47f2912c-4933-aa78-de1d-f85884fddded@amsat.org>
 <alpine.DEB.2.21.2108021412470.62025@angie.orcam.me.uk>
 <0fa9bc3e-e057-5516-c234-6c98ca8f1a0e@amsat.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Received-SPF: none client-ip=2001:4190:8020::34;
 envelope-from=macro@orcam.me.uk; helo=angie.orcam.me.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 yangxiaojuan@loongson.cn, Song Gao <gaosong@loongson.cn>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2 Aug 2021, Philippe Mathieu-Daudé wrote:

> >  At least this trivial program:
> > 
> > int main(void)
> > {
> > 	asm volatile(".set push; .set mips4; movn $0,$0,$0; .set pop");
> > 	return 0;
> > }
> > 
> > does not trap on actual hardware.
> 
> Thank you very much for your time and testing!

 You're welcome!  I'm glad to be of help.

  Maciej

