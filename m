Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC90344CE4
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 18:11:46 +0100 (CET)
Received: from localhost ([::1]:48310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOO5h-0002It-3z
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 13:11:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adam@l4re.org>) id 1lOO3B-00015c-Em
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 13:09:09 -0400
Received: from os.inf.tu-dresden.de ([141.76.48.99]:58354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adam@l4re.org>) id 1lOO38-0004ob-Q0
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 13:09:09 -0400
Received: from erwin.inf.tu-dresden.de ([141.76.48.80] helo=l4re.org)
 by os.inf.tu-dresden.de with esmtps (TLS1.3:TLS_AES_256_GCM_SHA384:256) (Exim
 4.94) id 1lOO35-0006bH-6s; Mon, 22 Mar 2021 18:09:03 +0100
Date: Mon, 22 Mar 2021 18:09:00 +0100
From: Adam Lackorzynski <adam@l4re.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: Arm: VFP regression
Message-ID: <YFjPLDQAOVTnfHqs@l4re.org>
References: <YFZ5YgPWLraY5v3o@os.inf.tu-dresden.de>
 <CAFEAcA-=7y1g8D7Hk_bYe5F9Q51WufbC3RKw9wN8=PoefN9K2w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <CAFEAcA-=7y1g8D7Hk_bYe5F9Q51WufbC3RKw9wN8=PoefN9K2w@mail.gmail.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
Received-SPF: none client-ip=141.76.48.99; envelope-from=adam@l4re.org;
 helo=os.inf.tu-dresden.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On Sun Mar 21, 2021 at 12:56:12 +0000, Peter Maydell wrote:
> On Sat, 20 Mar 2021 at 22:38, Adam Lackorzynski <adam@l4re.org> wrote:
> >
> > Hi,
> >
> > I'm seeing a regression in Arm's vfp handling, giving an undefined
> > instruction when reading mvfr1 in PL2/armv7 although the FPU is enabled.
> > The following makes it work again for me, however this just looks like a
> > band-aid. Thanks for taking a look.
> 
> Could you provide a test case, please (QEMU command line and
> image/etc files needed to reproduce) ?

Turns out I was missing one path in my code wrt FPU state and due to
unfortunate and unforeseen timing I was hitting this case. Apologies and
sorry for the noise.


Thanks,
Adam

