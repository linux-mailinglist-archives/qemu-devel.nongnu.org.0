Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 063A5553047
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 12:56:32 +0200 (CEST)
Received: from localhost ([::1]:45760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3bYd-0000Nw-4e
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 06:56:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@fluff.org>)
 id 1o3bX7-0007Ro-Gv; Tue, 21 Jun 2022 06:54:57 -0400
Received: from test-v6.fluff.org ([2a01:4f8:222:2004::3]:37374
 helo=hetzy.fluff.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@fluff.org>)
 id 1o3bX5-0001Nu-Fr; Tue, 21 Jun 2022 06:54:57 -0400
Received: from ben by hetzy.fluff.org with local (Exim 4.89)
 (envelope-from <ben@fluff.org>)
 id 1o3bWt-000771-0S; Tue, 21 Jun 2022 11:54:43 +0100
Date: Tue, 21 Jun 2022 11:54:42 +0100
From: Ben Dooks <qemu@ben.fluff.org>
To: Alistair Francis <alistair23@gmail.com>
Cc: Ben Dooks <qemu@ben.fluff.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Subject: Re: [PATCH 4/4] hw/riscv: use qemu_fdt_setprop_strings() in sifive_u.c
Message-ID: <20220621105442.6aghfhqgrx546hlm@hetzy.fluff.org>
References: <20220618201433.240973-1-qemu@ben.fluff.org>
 <20220618201433.240973-5-qemu@ben.fluff.org>
 <CAKmqyKMWz7qgYXjHJLTHbMMkW=Amv0CZqTBg72iHW2Ntx0+HYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKmqyKMWz7qgYXjHJLTHbMMkW=Amv0CZqTBg72iHW2Ntx0+HYg@mail.gmail.com>
X-Disclaimer: These are my views alone.
X-URL: http://www.fluff.org/
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: ben@fluff.org
X-SA-Exim-Scanned: No (on hetzy.fluff.org); SAEximRunCond expanded to false
Received-SPF: pass client-ip=2a01:4f8:222:2004::3; envelope-from=ben@fluff.org;
 helo=hetzy.fluff.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 20, 2022 at 04:47:44PM +1000, Alistair Francis wrote:
> On Sun, Jun 19, 2022 at 6:14 AM Ben Dooks <qemu@ben.fluff.org> wrote:
> >
> > Use the qemu_fdt_setprop_strings() in sifve_u.c to simplify
> > the code.
> >
> > Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
> 
> Do you mind updating the other machines as well?

I can do, I was wondering if anyone had a good guide how to use cocci
to do it automatiically as I have been finding it really difficult to
work out how to automate API changes.

-- 
Ben Dooks, ben@fluff.org, http://www.fluff.org/ben/

Large Hadron Colada: A large Pina Colada that makes the universe disappear.


