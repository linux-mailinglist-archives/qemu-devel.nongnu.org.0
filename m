Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA66348785
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 04:33:14 +0100 (CET)
Received: from localhost ([::1]:40652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPGkD-0000Ev-Ni
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 23:33:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dylan@andestech.com>)
 id 1lPGjA-0008Cl-9m; Wed, 24 Mar 2021 23:32:08 -0400
Received: from atcsqr.andestech.com ([60.248.187.195]:34175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dylan@andestech.com>)
 id 1lPGj5-0001Im-2E; Wed, 24 Mar 2021 23:32:06 -0400
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 12P3VKGg048451;
 Thu, 25 Mar 2021 11:31:20 +0800 (GMT-8)
 (envelope-from dylan@andestech.com)
Received: from andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Thu, 25 Mar 2021
 11:31:21 +0800
Date: Thu, 25 Mar 2021 11:31:21 +0800
From: Dylan Jhong <dylan@andestech.com>
To: Alistair Francis <alistair23@gmail.com>
Subject: Re: [PATCH] target/riscv: Align the data type of reset vector address
Message-ID: <20210325033121.GA9484@andestech.com>
References: <20210323091409.1226-1-dylan@andestech.com>
 <CAKmqyKMTkDcO9_in28QSg7Spk=K9PdsSghUVJF4i1744fNdkYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAKmqyKMTkDcO9_in28QSg7Spk=K9PdsSghUVJF4i1744fNdkYw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 12P3VKGg048451
Received-SPF: pass client-ip=60.248.187.195; envelope-from=dylan@andestech.com;
 helo=ATCSQR.andestech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Alan Quey-Liang =?utf-8?B?S2FvKOmrmOmtgeiJryk=?= <alankao@andestech.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, "qemu-devel@nongnu.org
 Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 "x5710999x@gmail.com" <x5710999x@gmail.com>,
 Ruinland Chuan-Tzu =?utf-8?B?VHNhKOiUoeWCs+izhyk=?= <ruinland@andestech.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 24, 2021 at 10:59:55PM +0800, Alistair Francis wrote:
> On Tue, Mar 23, 2021 at 5:15 AM Dylan Jhong <dylan@andestech.com> wrote:
> >
> > Although the AE350 has not been upstream (preparing for v2),
> > the reset vector of the AE350 is known to be at the 2G position,
> > so this patch is corrected in advance.
> >
> > Signed-off-by: Dylan Jhong <dylan@andestech.com>
> > Signed-off-by: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
> > ---
> >  target/riscv/cpu.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 2a990f6253..0236abf169 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -137,7 +137,7 @@ static void set_feature(CPURISCVState *env, int feature)
> >      env->features |= (1ULL << feature);
> >  }
> >
> > -static void set_resetvec(CPURISCVState *env, int resetvec)
> > +static void set_resetvec(CPURISCVState *env, uint64_t resetvec)
> 
> resetvec in env is a target_ulong so this should be as well (instead
> of a uint64_t).
> 
> Alistair
>

Hi Alistar,

Thanks for your comments.

Indeed resetvec should use target_ulong instead of uint64_t.
But in target/riscv/cpu.h:306, there is also a resetvec in struct RISCVCPU but it is defined as uint64_t.
Do you think I should change it to target_ulong together?

ref: 
commit 9b4c9b2b2a50fe4eb90d0ac2d8723b46ecb42511
https://www.mail-archive.com/qemu-devel@nongnu.org/msg730077.html

> >  {
> >  #ifndef CONFIG_USER_ONLY
> >      env->resetvec = resetvec;
> > --
> > 2.17.1
> >
> >

