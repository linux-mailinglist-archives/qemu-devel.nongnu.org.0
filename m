Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E085D77A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 22:29:35 +0200 (CEST)
Received: from localhost ([::1]:57174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiPPC-0000Rw-LF
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 16:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42877)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mst@redhat.com>) id 1hiO0p-00054w-R2
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 15:00:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1hiO0n-0003wV-GH
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 15:00:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43506)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1hiO0f-0003rq-OH
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 15:00:11 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A22CA86671;
 Tue,  2 Jul 2019 19:00:06 +0000 (UTC)
Received: from redhat.com (ovpn-124-209.rdu2.redhat.com [10.10.124.209])
 by smtp.corp.redhat.com (Postfix) with SMTP id B36C23D8F;
 Tue,  2 Jul 2019 19:00:05 +0000 (UTC)
Date: Tue, 2 Jul 2019 15:00:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190702145826-mutt-send-email-mst@kernel.org>
References: <20190702150606.24851-1-mst@redhat.com>
 <CAFEAcA-Qcq1ZmfDO_dkh_H9-aeQVU83ceLKU1NXM3VpW8g5sPQ@mail.gmail.com>
 <20190702124823-mutt-send-email-mst@kernel.org>
 <CAFEAcA-UFks7CmtcMT15KzK3TzRqGjwXWtFa8K6XZ=Bks92CJw@mail.gmail.com>
 <20190702142058-mutt-send-email-mst@kernel.org>
 <CAFEAcA_c3UXPVy_rXR_FxyXRw5ZE1-QgumPr9B-j+pmvBGWgpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_c3UXPVy_rXR_FxyXRw5ZE1-QgumPr9B-j+pmvBGWgpQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Tue, 02 Jul 2019 19:00:06 +0000 (UTC)
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

On Tue, Jul 02, 2019 at 07:27:13PM +0100, Peter Maydell wrote:
> On Tue, 2 Jul 2019 at 19:22, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Tue, Jul 02, 2019 at 06:20:01PM +0100, Peter Maydell wrote:
> > > On Tue, 2 Jul 2019 at 18:01, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > This isn't from mainline. We have a bit of a deadlock with linux merge
> > > > window opening soon. I think it's reasonable temporarily
> > > > and then before release either virtio-pmem gets there or I will
> > > > revert it and drop the header.
> > >
> > > It's definitely not ideal: until the headers are actually
> > > upstream there's no guarantee that they won't change ABI.
> >
> > But then I'm watching it, if I see that I'll drop the device from qemu for
> > now.
> 
> OK; I guess we can take this for now if we make sure we revert
> if the headers aren't upstream by the time we get to say rc2
> (23rd July). (That is, we'd want to do any revert shortly after
> rc2, since rc3 might be the last rc before release.)

Right, that's the plan.

> > > Are the headers at least in some kvm-next or equivalent tree ?
> >
> >
> > Yes - libnvdimm maintainer's tree.
> >
> > > When are they expected to hit mainline?
> >
> > Next merge window.
> 
> When's that?

Likely opens next Sunday and lasts 2 weeks. So we'll know by July 23.

> thanks
> -- PMM

