Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F50C67F45E
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 04:41:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLc4B-0006jD-6P; Fri, 27 Jan 2023 22:39:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pLc48-0006j5-Ph
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 22:39:44 -0500
Received: from sonic316-55.consmr.mail.gq1.yahoo.com ([98.137.69.31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pLc44-0000v7-Tl
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 22:39:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1674877175; bh=xJgT0EKIUs9OoKRBlwG0K9dSM5s61x/O6FDn0BXnJww=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From:Subject:Reply-To;
 b=T96R6trkxWqKWAMFQ68/7YhuBCMZbIy6D9r2GOYgCnn+H6I1DUO93U93tyjHL7A2dsI8TbIWxubBilMyMMMvMMFDqGjV7UdlysvRGJPTUpMEYSsM2iE0xN1yVDD2TBfYPD6YO4Fk9HxggNXyLjYMW3wSo5UEzBGYWRempKx5vwimdVUz4EA6q41o6sQJsj0VCEGz+F1WC0cvYMuntjAycKM/IigoZ8vSQzHemqOAWU10gcwbbqv3ToDj/0EPEV6qsANrFWPiMmuonXcdzO2kViXwmZ+oJYjOzySuLSnT0NZG/uaalki1hI0GOi17BofkEGX/NjPWAE464VmQ7xBIzw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1674877175; bh=grl84qUGLZyl053AZ5bchr6S6NgV+j7ZQhii0d9SBBh=;
 h=X-Sonic-MF:Date:From:Subject:To:From:Subject;
 b=a5cUFBRbACSNSO8m88NtI9eaIr7pImyq8sIFsdeRrLoPAZzyZ/rIhhMwOrmdI0pwzKZiWQofFvmJ4CcBIIvLzue1Ts2mN4zRwohJ3Se0WMoUUdAZFEL++cG6NQCh0kgO8IGZdFdgpOPveXzTs7LslF2U0Xzz0L+jFBH/g8UArqjmJHUg22LNK2Jj+pzoT6mXdC7RiHl8JQagpL+Olh7L4qqdBdvlVQcZGtwFIkgSQHQw+Jp6JWAI/h7qNHrvpMXi8Y7vxncWg6jsZETmwDE5exQhrII/GWIYfl2fgqCOmNpns0SwBh8i9f9l5PMzcbhRqcX0ns7ylAt0scVkEqk2EQ==
X-YMail-OSG: 7Wh_RpIVM1nMpDSKpRxHNn7SKrJui4NV_ykjInP4MFQz01J1XMc21hW3lBCFW_p
 Ykv10Z9OuCba0Kbg54_K9r.UjVNiXuJ9IvYgaHjZYpxP0VjvAX1wZ4VzUlPT_dsOzR.Y4lLyeerR
 7BT47TGCX59fdi85JhWP4HJl6frjK.qi4OoWC8bfgYfTELqdYKX9dfl2V6dFeQeS8bOqtPTQCv9j
 8j2nI58G2GF4XX0IXI7F1TK35HW6x_FpAsGSoWy79kb4jKzVlNKs_Dltbyv3OUHZmNy5bwX_iWNV
 W8Rm1dIMpp1ILL.NTp.D13tvCgf0ALMDsKtY56pdUrb9VlwETGLWLIEw7ikEuIdRuuuZMJCe.LLC
 SQ5HK3dJYgvBInj9LNhSQpMI00w7Aztt9loxu.2urbN1hMT3pGykRqSAT524aJHq.vcXBgFqBH7j
 D6JwQ67TX6gfAyNagMUn4ZrTK07cQgQ7C.5y9oM6O3v2iQRAVE9OmOhOsW8BgXLBwEWiJPjYMSNG
 azgaN2HBBF3pb2kZeh1228Ifppy_ETKroAhQyIZrEqqgUIlOxMvIcVXFWXO97bu60LIokohG39fG
 xBPVRYTrhreVmDB.03ccHkVGW7VJXrV4VJqnR7iN.5Ru1dKvA6OJMQwbfRTv6Hg3WPH2JymUyA.z
 rwluWPj3xMmArI9Fp4Uo3p2QXk0U41zHC9sTIO4ejuUOQPNa2BERwt5edu6O8y70E_.gCHVZbs7V
 e3z37g.VL4AeRwbB7CrYmkTWIoSFtSB.bMIjypfI.oFmEw0ptCB4H91fko3NvOWeIKlPDIo2sSRR
 0O9hCvqsNkQQILK7fUeN3dEgQ2Dd1ZoyWE88FsfKEgrEaEDJCigGag31En6l9sYf3.q_5qpjK8ZH
 siP9DR.Rh0eAhyj0LIC1Qlwgdt8KWKgtN78xoa9DhGbOiemE3xFri6msOfUzCY8agZOrxntCwTrL
 2DA6hDdRQb8IU.mnMUcoC3.pD78pvqwyZ.it6pkaPGtXSZapJkXSEeg8t4RyBpKksJrlM4Q9UEuT
 PUVT54efq_OwFF5QobRDGQ_rbBImX9Ze90pMtG844Xg4EPx6JQJugS63V5N38Pvb7v_Ggix9akmw
 RWhXMwGcK2bD6HjmZPZ66NE7Nl9DvR_TQeO4R7P03vrsLcx4fsYrfxveIop5QCe_H89OPnoCy920
 pY7KEqIaHZGEYfYM6QJG0r4Bcm2atWNeBJ9KDd9XMrBplv5Q2c6YQfpDx.ARCjS_O.lCDDUpalsv
 a6hbPfrPPnFYyWvaXzPSLGLUFftNtRM6zZ_4KMzXSAGTEVf1faFqQCMbMvUXnbNV0UV10qS.OnNQ
 aHSVV9sKn_ERz7uqVJ_wqpmEMCtCyQ4_VKIU9cvhyZDC6WOAcYLDFT0gm4jukdSnRL9QAGUdGJ7X
 QUmq4Jgo1lR0yoVGYWXG.iGmdi7b8ehvF9TbSzRDWD4z7lC75hA3JZQhmNGwmNIE9JO6BsKoLKgq
 pA4NtsuykLh8yX42EYP905ID9emGyvw06jQCdSFZSBsRK7.9fFOa1LNP2LZO2deXA5zkeAt6MN4T
 bnGj5OMfbVELbN_TsmEpPQCP3nAjU9mOo.En.HsbOoc.gVJgn8TbtpQc56cJDrOjFiIBSU77jQgW
 If17ywMFNqJ51mIkn_nNcUts4gpGnh8qXpztsQ_MyCZftVJTXNQwxzXnN_fgA.fCNL5ePFLsPeDu
 9Gb9HogoH0Xp4.BipM0LYwOWk0gID73FEG4GDzaJcdLaBQmfIvdPH2uKqdtEzzKaQLBFXkLV0O1J
 LRmwNeobvTQUqeRsKGro5xZzPpjiEOJJpbfCOTAANUhRi01cHobIhhwF7lm298TphQvdo936h3SH
 wqJGiVL8lVRRnqL0oxUDk0pyihSExB9LbzH4U.9ZkHX2hTaiX54xRcdzWGXlKSHtEcCxfaciPHP6
 AAcV._UYL6Ucg.SXQ3Q_3QNOBjcGfs6iUQrwgn8ViJa_3YAoLdstCjJ0OwctGQ9iD3xwcbfluDJn
 LIqcPTqZ57Gs8ukxwn5UXgOCFaq.DD9QLdZc2orSu8wBdigqlQ7QhX8VI0A6n7sAmooiOGCf_Uhl
 QNLu8NTrZ2qg_5XfIlN3cpJ7tVfYt.M7vsae6jbsjfSFA6TDbUWV.qYUJ3aLJDG2JEx9YRVgLbE4
 tFhXnHKjgpMeYsOabF48wUgDO8ca2Xlp30mqDPAELp7uxw9FIwA0qJfZ9Sy1JXDugTBnCwJoRcES
 GilE-
X-Sonic-MF: <brchuckz@aim.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.gq1.yahoo.com with HTTP; Sat, 28 Jan 2023 03:39:35 +0000
Received: by hermes--production-bf1-57c96c66f6-97q92 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID aacbb96ec2022e34ef7d81ce8c8a6116; 
 Sat, 28 Jan 2023 03:39:30 +0000 (UTC)
Message-ID: <ddac019e-28bc-9e0b-c6d7-5bd54d0239f3@aol.com>
Date: Fri, 27 Jan 2023 22:39:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Chuck Zmudzinski <brchuckz@aol.com>
Subject: Re: [PATCH] pci: add enforce_slot_reserved_mask_manual property
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Daniel P. Berrange"
 <berrange@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <ad5f5cf8bc4bd4a720724ed41e47565a7f27adf5.1673829387.git.brchuckz.ref@aol.com>
 <ad5f5cf8bc4bd4a720724ed41e47565a7f27adf5.1673829387.git.brchuckz@aol.com>
 <20230127082240-mutt-send-email-mst@kernel.org>
Content-Language: en-US
In-Reply-To: <20230127082240-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.21123
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
Received-SPF: pass client-ip=98.137.69.31; envelope-from=brchuckz@aim.com;
 helo=sonic316-55.consmr.mail.gq1.yahoo.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.15,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/27/2023 8:28 AM, Michael S. Tsirkin wrote:
> On Sun, Jan 15, 2023 at 07:49:51PM -0500, Chuck Zmudzinski wrote:
> > The current reserved slot check in do_pci_register_device(), added with
> > commit 8b8849844fd6
>
> add ("subject here") please
>
> > ,is done even if the pci device being added is
> > configured manually for a particular slot. The new property, when set
> > to false, disables the check when the device is configured to request a
> > particular slot. This allows an administrator or management tool to
> > override slot_reserved_mask for a pci device by requesting a particular
> > slot for the device. The new property is initialized to true which
> > preserves the existing behavior of slot_reserved_mask by default.
> > 
> > Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
>
> Thanks!
> I'm trying to think of the best default for this.

I think it would be better for the default value of
enforce_slot_reserved_mask_manual to be false, so that a
user-specified slot will by default override slot_reserved_mask.
But doing that would change the current behavior of
slot_reserved_mask.

Currently, this is the only place where slot_reserved_mask is used in all
of the Qemu source (code from hw/sparc64/sun4u.c):

------ snip -------
    /* Only in-built Simba APBs can exist on the root bus, slot 0 on busA is
       reserved (leaving no slots free after on-board devices) however slots
       0-3 are free on busB */
    pci_bus->slot_reserved_mask = 0xfffffffc;
    pci_busA->slot_reserved_mask = 0xfffffff1;
    pci_busB->slot_reserved_mask = 0xfffffff0;
------ snip -------

I think we could safely change the default value of
enforce_slot_reserved_mask_manual to false but set
it to true for the sparc64 sun4u board here to preserve
the current behavior of the only existing board in Qemu
that uses slot_reserved_mask.

What do you think?

> Users is trying to configure a specific device on a reserved
> slot. Should we 
> CC a bunch more people for visibility. Input, anyone?
>
>
> > ---
> >  hw/pci/pci.c             | 9 ++++++++-
> >  include/hw/pci/pci_bus.h | 1 +
> >  2 files changed, 9 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> > index c2fb88f9a3..5e15f08036 100644
> > --- a/hw/pci/pci.c
> > +++ b/hw/pci/pci.c
> > @@ -467,6 +467,7 @@ static void pci_root_bus_internal_init(PCIBus *bus, DeviceState *parent,
> >      assert(PCI_FUNC(devfn_min) == 0);
> >      bus->devfn_min = devfn_min;
> >      bus->slot_reserved_mask = 0x0;
> > +    bus->enforce_slot_reserved_mask_manual = true;
> >      bus->address_space_mem = address_space_mem;
> >      bus->address_space_io = address_space_io;
> >      bus->flags |= PCI_BUS_IS_ROOT;
> > @@ -1074,6 +1075,12 @@ static bool pci_bus_devfn_reserved(PCIBus *bus, int devfn)
> >      return bus->slot_reserved_mask & (1UL << PCI_SLOT(devfn));
> >  }
> >  
> > +static bool pci_bus_devfn_reserved_manual(PCIBus *bus, int devfn)
> > +{
> > +    return bus->enforce_slot_reserved_mask_manual &&
> > +            (bus->slot_reserved_mask & (1UL << PCI_SLOT(devfn)));
> > +}
> > +
> >  /* -1 for devfn means auto assign */
> >  static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
> >                                           const char *name, int devfn,
> > @@ -1107,7 +1114,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
> >                     "or reserved", name);
> >          return NULL;
> >      found: ;
> > -    } else if (pci_bus_devfn_reserved(bus, devfn)) {
> > +    } else if (pci_bus_devfn_reserved_manual(bus, devfn)) {
> >          error_setg(errp, "PCI: slot %d function %d not available for %s,"
> >                     " reserved",
> >                     PCI_SLOT(devfn), PCI_FUNC(devfn), name);
>
> Should this be a device property or a bus property?
> And maybe now mention the property name so users know how
> to override this?

If we implement the change to make the default value of
enforce_slot_reserved_mask_manual false, the only  case
when the user will not be able to override it simply by specifying
a particular slot would be when it is a user of the sparc64 sun4u
board who wants to put a device in a slot that board does not
allow. In that case, it would be nice to report an error here that
explains why the slot is reserved even with a manual configuration
of the slot. I could add another property to the bus which will allow
for providing a reason the slot is reserved that can be used in the
error message instead of the current generic message that says the
slot is reserved without explaining why.

I will also think about overriding slot_reserved_mask using
a device property instead of a bus property, but I think keeping
it as a bus property, making it false by default, and adding a
reason for having reserved slots even with manually configured
slots (as in the case of the sparc64 sun4u board) in the form of
an error message string would improve the error message here
without changing the current behavior of the sparc64 sun4u board
and make the slot_reserved_mask useful for the case when it is
necessary to reserve a slot for a particular device when device slots
are auto-assigned but it is not necessary to reserve the slot when
the slot addresses are manually assigned. Since there is only the one
case in Qemu (the sparc64 sun4u board) where a specific error message
would be needed to be added, it is not too much work to implement this
change.

Does that make sense?

> > diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
> > index 5653175957..e0f15ee9be 100644
> > --- a/include/hw/pci/pci_bus.h
> > +++ b/include/hw/pci/pci_bus.h
> > @@ -37,6 +37,7 @@ struct PCIBus {
> >      void *iommu_opaque;
> >      uint8_t devfn_min;
> >      uint32_t slot_reserved_mask;
> > +    bool enforce_slot_reserved_mask_manual;
> >      pci_set_irq_fn set_irq;
> >      pci_map_irq_fn map_irq;
> >      pci_route_irq_fn route_intx_to_irq;
> > -- 
> > 2.39.0
>


