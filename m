Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68751504B0
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jun 2019 10:39:38 +0200 (CEST)
Received: from localhost ([::1]:48798 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfKVl-0004zL-0e
	for lists+qemu-devel@lfdr.de; Mon, 24 Jun 2019 04:39:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41241)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <abologna@redhat.com>) id 1hfKTx-0004Ex-63
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 04:37:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <abologna@redhat.com>) id 1hfKTu-0004Q8-4a
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 04:37:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48268)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <abologna@redhat.com>)
 id 1hfKTk-00045H-4b; Mon, 24 Jun 2019 04:37:32 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 74009A7DD;
 Mon, 24 Jun 2019 08:37:30 +0000 (UTC)
Received: from kinshicho (unknown [10.43.2.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 66EB45D721;
 Mon, 24 Jun 2019 08:37:26 +0000 (UTC)
Message-ID: <7745c47186278c1b7f1781c9173ef0e2e8a55910.camel@redhat.com>
From: Andrea Bolognani <abologna@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>
Date: Mon, 24 Jun 2019 10:37:24 +0200
In-Reply-To: <CAFEAcA-x_GSxiULrxvRj7dtCLM-r4YvRpwkVosW+1SutAUJMoA@mail.gmail.com>
References: <20190620222314.2670-1-wainersm@redhat.com>
 <CAFEAcA92m9n7FR2a6=ecnr5bn-Sq97LZRxHRuzWO-OcbdgA4fw@mail.gmail.com>
 <20190621190421.GA679@localhost.localdomain>
 <CAFEAcA-x_GSxiULrxvRj7dtCLM-r4YvRpwkVosW+1SutAUJMoA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.3 (3.32.3-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Mon, 24 Jun 2019 08:37:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [Qemu-arm] [RFC v2 PATCH] hw/arm/virt: makes virt
 a default machine type
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 2019-06-22 at 16:58 +0100, Peter Maydell wrote:
> On Fri, 21 Jun 2019 at 20:04, Cleber Rosa <crosa@redhat.com> wrote:
> > You can consider me biased (I do consider myself), but trying to wear
> > the hat of a user first interacting with QEMU, I would expect a (any)
> > reasonably capable environment that can represent the given target.
> > That will probably be a different environment than the one I may need,
> > and I think that's fine.
> 
> I'm really not sure what you're trying to suggest here; maybe
> you could clarify? If you specify a target (ie a machine type),
> you get that machine type. If you don't specify a target, then
> we can't really guess what you were hoping to run and
> magically pick something that works.
> 
> The main problem here is that users expect "all the world is a PC"
> type behaviour, ie they can just provide qemu-system-arm or
> qemu-system-aarch64 with no command line arguments except
> a guest kernel (which is half the time something they found under
> a rock or extracted from some firmware image) or a guest CDROM
> image and have it boot, because that generally works for x86. It
> doesn't and can't work for Arm, because of the much greater
> diversity of machine types and the way that kernels are often
> only compiled to work on a specific subset of machines.
> Making the user specify a machine type means they do at least
> get prompted that the world is more complicated than they
> think it is and there are decisions that have to be made.
> 
> In any case even if we did default to "virt" the user still
> has to specify a CPU type, may well also want to provide
> a GIC version (gicv3 being better than the default v2),
> likely more RAM than the very small default, they need to provide
> all the virtio devices, and so on and so on. So giving
> them one option they no longer need to specify doesn't
> really make it any easier IMHO.

Additional note on GIC: most server-grade machines you can buy today
do *not* support GICv2, so you will need to opt-in to GICv3 if you
want your guest to even start.

More generally, as someone who has worked on supporting non-x86
guests in libvirt for the past few years, I can tell you from
experience that you're always going to need some arch-specific logic
to deal with the small (and not so small :) differences in behavior
between QEMU targets: as Peter correctly says, machine type is just
a single example among many.

-- 
Andrea Bolognani / Red Hat / Virtualization


