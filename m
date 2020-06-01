Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7361EA45E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jun 2020 15:02:53 +0200 (CEST)
Received: from localhost ([::1]:44010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jfk5c-0004RG-Cl
	for lists+qemu-devel@lfdr.de; Mon, 01 Jun 2020 09:02:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adam@l4re.org>) id 1jfk4b-00040z-Ru
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 09:01:49 -0400
Received: from os.inf.tu-dresden.de ([2002:8d4c:3001:48::99]:42448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adam@l4re.org>) id 1jfk4a-0000qT-AB
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 09:01:49 -0400
Received: from erwin.inf.tu-dresden.de ([141.76.48.80]
 helo=os.inf.tu-dresden.de)
 by os.inf.tu-dresden.de with esmtps (TLS1.3:TLS_AES_256_GCM_SHA384:256) (Exim
 4.93.0.3) id 1jfk4S-0004Ok-3Q; Mon, 01 Jun 2020 15:01:40 +0200
Date: Mon, 1 Jun 2020 15:01:35 +0200
From: Adam Lackorzynski <adam@l4re.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] target/arm: Init GIC CPU IF regs for A15/A7
Message-ID: <20200601130135.GA284778@os.inf.tu-dresden.de>
References: <20200529230653.GD776951@os.inf.tu-dresden.de>
 <CAFEAcA--vg0iPZmHacGUxkF7tOP9iFeei4rSksQO_fFh3wjtMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <CAFEAcA--vg0iPZmHacGUxkF7tOP9iFeei4rSksQO_fFh3wjtMA@mail.gmail.com>
User-Agent: Mutt/1.14.0 (2020-05-02)
Received-SPF: none client-ip=2002:8d4c:3001:48::99; envelope-from=adam@l4re.org;
 helo=os.inf.tu-dresden.de
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On Mon Jun 01, 2020 at 13:36:13 +0100, Peter Maydell wrote:
> On Sat, 30 May 2020 at 00:07, Adam Lackorzynski <adam@l4re.org> wrote:
> >
> > Initialize the CPU interface registers also
> > for Cortex-A15 and Cortex-A7 CPU models, in
> > the same way as done for 64bit CPU models.
> > This fixes usage of GICv3 in virtualization
> > contexts in 32bit configurations.
> >
> > Signed-off-by: Adam Lackorzynski <adam@l4re.org>
> 
> Hi; I'm confused by this patch. The Cortex-A15 and Cortex-A7
> do not have or support the GICv3, so why would we need
> to set GICv3-specific settings for them?
> 
> We're probably missing a sanity-check somewhere
> to forbid user attempts to use non-GICv3 CPUs with
> the GICv3.

Indeed that's another option. Besides that A15+GICv3 currently just
works with this.
So I guess the alternative is to switch to 32bit from EL3 when using an A57?


Thanks,
Adam

