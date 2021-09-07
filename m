Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA810402C95
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 18:07:30 +0200 (CEST)
Received: from localhost ([::1]:54894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNddB-0001Vx-NT
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 12:07:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <reinoud@gorilla.13thmonkey.org>)
 id 1mNdZ0-0003p7-7d
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 12:03:12 -0400
Received: from 13thmonkey.org ([80.100.255.32]:61509
 helo=gorilla.13thmonkey.org) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <reinoud@gorilla.13thmonkey.org>) id 1mNdYx-0001ie-LM
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 12:03:09 -0400
Received: by gorilla.13thmonkey.org (Postfix, from userid 103)
 id 398A52FF07A7; Tue,  7 Sep 2021 18:02:51 +0200 (CEST)
Date: Tue, 7 Sep 2021 18:02:51 +0200
From: Reinoud Zandijk <reinoud@13thmonkey.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: applied? Re: [PATCH v1 0/2] Update NVMM support to recent
 changes, [PATCH v1 1/2] Only check CONFIG_NVMM when NEED_CPU_H is defined,
 [PATCH v1 2/2] Fix nvmm_ram_block_added() function arguments
Message-ID: <YTeNK86WAaRy7p/z@gorilla.13thmonkey.org>
References: <20210718134650.1191-3-reinoud@NetBSD.org>
 <20210718134650.1191-2-reinoud@NetBSD.org>
 <20210718134650.1191-1-reinoud@NetBSD.org>
 <YSuwFI8vBJTDF2GW@gorilla.13thmonkey.org>
 <CAFEAcA8oLY-XYUFVguMDcQzZ+CykWnddpgdAcbrq3-2S1Q5X4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8oLY-XYUFVguMDcQzZ+CykWnddpgdAcbrq3-2S1Q5X4Q@mail.gmail.com>
Received-SPF: none client-ip=80.100.255.32;
 envelope-from=reinoud@gorilla.13thmonkey.org; helo=gorilla.13thmonkey.org
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On Sun, Aug 29, 2021 at 05:39:07PM +0100, Peter Maydell wrote:
> On Sun, 29 Aug 2021 at 17:06, Reinoud Zandijk <reinoud@13thmonkey.org> wrote:
> >
> > Hi :)
> >
> > Have these patches been applied? How can I easily check it without manually
> > checking if they are there in a git pullup? Am I notified normally when
> > patches are applied?
> 
> Generally when a submaintainer picks up a patchset they'll send
> an email reply to the patch cover letter to say they've done so.
> At that point it should get into upstream git eventually.
> Until that happens it's the initial submitter's responsibility to
> 'ping' the patch after a few weeks if nobody's replied to it
> or reviewed it.
> 
> Ccing Paolo who seems to have taken the initial nvmm patches
> through his tree.
> 
> thanks
> -- PMM

