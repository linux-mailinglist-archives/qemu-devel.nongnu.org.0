Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CCF5D6E2
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 21:26:31 +0200 (CEST)
Received: from localhost ([::1]:56530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiOQB-0002sY-3r
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 15:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55484)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mst@redhat.com>) id 1hiNQ8-00045I-2S
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 14:22:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1hiNQ6-00017M-Pd
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 14:22:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50024)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1hiNQ6-00011s-EC
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 14:22:22 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E6FA83084021;
 Tue,  2 Jul 2019 18:22:15 +0000 (UTC)
Received: from redhat.com (ovpn-124-209.rdu2.redhat.com [10.10.124.209])
 by smtp.corp.redhat.com (Postfix) with SMTP id 080325D6A9;
 Tue,  2 Jul 2019 18:22:14 +0000 (UTC)
Date: Tue, 2 Jul 2019 14:22:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190702142058-mutt-send-email-mst@kernel.org>
References: <20190702150606.24851-1-mst@redhat.com>
 <CAFEAcA-Qcq1ZmfDO_dkh_H9-aeQVU83ceLKU1NXM3VpW8g5sPQ@mail.gmail.com>
 <20190702124823-mutt-send-email-mst@kernel.org>
 <CAFEAcA-UFks7CmtcMT15KzK3TzRqGjwXWtFa8K6XZ=Bks92CJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-UFks7CmtcMT15KzK3TzRqGjwXWtFa8K6XZ=Bks92CJw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Tue, 02 Jul 2019 18:22:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PULL 00/22] virtio, pc, pci: features, fixes,
 cleanups
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

On Tue, Jul 02, 2019 at 06:20:01PM +0100, Peter Maydell wrote:
> On Tue, 2 Jul 2019 at 18:01, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Tue, Jul 02, 2019 at 04:56:05PM +0100, Peter Maydell wrote:
> > > On Tue, 2 Jul 2019 at 16:06, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > Hi. This header sync doesn't look like it was a proper
> > > sync made with the update-headers script against some
> > > upstream kernel -- at least the commit message doesn't
> > > say what the sync was against and the fact that it only
> > > changes the virtio-pmem headers looks suspicious.
> > >
> > > Can you respin with a proper header sync against upstream
> > > mainline, please?
> 
> > This isn't from mainline. We have a bit of a deadlock with linux merge
> > window opening soon. I think it's reasonable temporarily
> > and then before release either virtio-pmem gets there or I will
> > revert it and drop the header.
> 
> It's definitely not ideal: until the headers are actually
> upstream there's no guarantee that they won't change ABI.

But then I'm watching it, if I see that I'll drop the device from qemu for
now.

> Are the headers at least in some kvm-next or equivalent tree ?


Yes - libnvdimm maintainer's tree.

> When are they expected to hit mainline?

Next merge window.

> 
> thanks
> -- PMM

