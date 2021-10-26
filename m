Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B574243B5C5
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 17:39:22 +0200 (CEST)
Received: from localhost ([::1]:50108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfOXp-0000nL-RC
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 11:39:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <knuto@ifi.uio.no>)
 id 1mfOWN-0007DF-Bc; Tue, 26 Oct 2021 11:37:54 -0400
Received: from mail-out04.uio.no ([2001:700:100:8210::76]:58355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <knuto@ifi.uio.no>)
 id 1mfOWI-0001BG-Bm; Tue, 26 Oct 2021 11:37:48 -0400
Received: from mail-mx10.uio.no ([129.240.10.27])
 by mail-out04.uio.no with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <knuto@ifi.uio.no>)
 id 1mfOW2-00ARtr-3y; Tue, 26 Oct 2021 17:37:30 +0200
Received: from 108.84-234-134.customer.lyse.net ([84.234.134.108]
 helo=[172.25.2.5])
 by mail-mx10.uio.no with esmtpsa (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 user knuto (Exim 4.94.2) (envelope-from <knuto@ifi.uio.no>)
 id 1mfOW1-0007Dm-2I; Tue, 26 Oct 2021 17:37:29 +0200
Message-ID: <545c4fe0ef00e664e2de0b1cc310ed3307017809.camel@ifi.uio.no>
Subject: Re: [PATCH 01/15] pcie: Set default and supported MaxReadReq to 512
From: Knut Omang <knuto@ifi.uio.no>
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>, "Michael S. Tsirkin"
 <mst@redhat.com>
Date: Tue, 26 Oct 2021 17:37:27 +0200
In-Reply-To: <20211026143659.GB3331@lmaniak-dev.igk.intel.com>
References: <20211007162406.1920374-1-lukasz.maniak@linux.intel.com>
 <20211007162406.1920374-2-lukasz.maniak@linux.intel.com>
 <20211007181056-mutt-send-email-mst@kernel.org>
 <20211026143659.GB3331@lmaniak-dev.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-UiO-SPF-Received: Received-SPF: neutral (mail-mx10.uio.no: 84.234.134.108 is
 neither permitted nor denied by domain of ifi.uio.no)
 client-ip=84.234.134.108; envelope-from=knuto@ifi.uio.no; helo=[172.25.2.5]; 
X-UiO-Spam-info: not spam, SpamAssassin (score=-5.0, required=5.0,
 autolearn=disabled, TVD_RCVD_IP=0.001, UIO_MAIL_IS_INTERNAL=-5)
X-UiO-Scanned: 540807B0BC167B3FC4FB9746A0077DA1DE19ACDA
X-UiOonly: EF3558B13770FD6B9EE71948893212D445727A0C
Received-SPF: pass client-ip=2001:700:100:8210::76;
 envelope-from=knuto@ifi.uio.no; helo=mail-out04.uio.no
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: =?UTF-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>,
 Knut Omang <knut.omang@oracle.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2021-10-26 at 16:36 +0200, Lukasz Maniak wrote:
> On Thu, Oct 07, 2021 at 06:12:41PM -0400, Michael S. Tsirkin wrote:
> > On Thu, Oct 07, 2021 at 06:23:52PM +0200, Lukasz Maniak wrote:
> > > From: Knut Omang <knut.omang@oracle.com>
> > > 
> > > Make the default PCI Express Capability for PCIe devices set
> > > MaxReadReq to 512.
> > 
> > code says 256
> > 
> > > Tyipcal modern devices people would want to
> > 
> > 
> > typo
> > 
> > > emulate or simulate would want this. The previous value would
> > > cause warnings from the root port driver on some kernels.
> > 
> > 
> > which specifically?
> > 
> > > 
> > > Signed-off-by: Knut Omang <knuto@ifi.uio.no>
> > 
> > we can't make changes like this unconditionally, this will
> > break migration across versions.
> > Pls tie this to a machine version.
> > 
> > Thanks!
> > > ---
> > >   hw/pci/pcie.c | 5 ++++-
> > >   1 file changed, 4 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> > > index 6e95d82903..c1a12f3744 100644
> > > --- a/hw/pci/pcie.c
> > > +++ b/hw/pci/pcie.c
> > > @@ -62,8 +62,9 @@ pcie_cap_v1_fill(PCIDevice *dev, uint8_t port, uint8_t type, uint8_t
> > > version)
> > >        * Functions conforming to the ECN, PCI Express Base
> > >        * Specification, Revision 1.1., or subsequent PCI Express Base
> > >        * Specification revisions.
> > > +     *  + set max payload size to 256, which seems to be a common value
> > >        */
> > > -    pci_set_long(exp_cap + PCI_EXP_DEVCAP, PCI_EXP_DEVCAP_RBER);
> > > +    pci_set_long(exp_cap + PCI_EXP_DEVCAP, PCI_EXP_DEVCAP_RBER | (0x1 &
> > > PCI_EXP_DEVCAP_PAYLOAD));
> > >   
> > >       pci_set_long(exp_cap + PCI_EXP_LNKCAP,
> > >                    (port << PCI_EXP_LNKCAP_PN_SHIFT) |
> > > @@ -179,6 +180,8 @@ int pcie_cap_init(PCIDevice *dev, uint8_t offset,
> > >       pci_set_long(exp_cap + PCI_EXP_DEVCAP2,
> > >                    PCI_EXP_DEVCAP2_EFF | PCI_EXP_DEVCAP2_EETLPP);
> > >   
> > > +    pci_set_word(exp_cap + PCI_EXP_DEVCTL, PCI_EXP_DEVCTL_READRQ_256B);
> > > +
> > >       pci_set_word(dev->wmask + pos + PCI_EXP_DEVCTL2, PCI_EXP_DEVCTL2_EETLPPB);
> > >   
> > >       if (dev->cap_present & QEMU_PCIE_EXTCAP_INIT) {
> > > -- 
> > > 2.25.1
> > 
> 
> Hi Michael,
> 
> The reason Knut keeps rebasing this fix along with SR-IOV patch is not
> clear for us.

Sorry for the slow response - I seem to have messed up my mail filters so this
thread slipped past my attention.

> Since we have tested the NVMe device without this fix and did not notice
> any issues mentioned by Knut on kernel 5.4.0, we decided to drop it for
> v2.

I agree, let's just drop it.

It was likely in the 3.x kernels I had to relate to back then, 
likely discovered in Oracle Linux given that I did not specifically point to a kernel
range already back then.

> However, I have posted your comments to this patch on Knut's github so
> they can be addressed in case Knut decides to resubmit it later though.

Thanks for that ping, Lukasz, and great to see the patch finally being used in a
functional device!

Knut

> Thanks,
> Lukasz



