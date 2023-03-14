Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8603E6B9778
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 15:14:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc52t-0001PY-Mt; Tue, 14 Mar 2023 09:50:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pc52n-0001PC-Vc
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 09:50:26 -0400
Received: from sonic313-19.consmr.mail.gq1.yahoo.com ([98.137.65.82])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pc52l-00031t-GH
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 09:50:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1678801819; bh=68FbTqoQyuQCMDNkknI+EpWSaNjKI2PznCP4lTkgxzw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To;
 b=VoaP3QZEbwtt4H7vDqRA+f+YH4zDSXrtmdeRp+nHI3kU5PYpnC5CKyCVTjsoskhDWGBfiwc9piFOC7HsbyweArdNaWqHZIEKtcvgazyOgk/TPiBarzUN10ibqBKdRMyLWHiNU0W0dSvoDxHa8uUlw6sOH4ULEvVvcHq1a1IQQXWmUYrJnjhgRIPQ/5AIr4i2YN+lKn+9+AuaM96l89V38lEsEdY0pBccoO0mIfNGf6HEsK1HBpMTiqZS0YHu4JpELgqKCqUHy5ci0rMWrvz3eFN4Bwqs9FYDO4KF+Kz5HxGZpkr2iEbF7r+lgmBiJ1coAYCHZ+a7QxCaAl5NQ2yrFA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1678801819; bh=FWxlO0x8n+yjUcWZX4+n+2Jq0FYpK3q+HIz2sYStS6f=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=FyPS1kg+opzhhAW80tTnKpM4olICiQ3qh05qdqi5nLaNo800OUg+hcUycQDbvoZdaZzr3d95Hxl07knKPJxrDNCFKcLUcrl5p2ShDuCOc+36PwKQmYHZGft0c9QJ7h6s49kkUiWQmu03JJUzOcCJjS+UENKFxbg+JX98Hg4+H7DpedHEN+9u/iPKE9LPw1xD4m45tlhPq+mQONx7ll5+9I7LB29bVxy8d9sUC8EY49I+HmdDpjEqkLTRLoNiU2T+iXVH6+KRWh238kxvP5+X0c3OaXmft0mQVfjIeX6aYs2BxLEgRpV/cP0rQ8/8sR5HVpv9JhshrGNYGAm5avVKCA==
X-YMail-OSG: uW..HREVM1lCeyWxcPicU0XBKNQZ9tipeww.ETk4rDR9bwGd8ZEqQT2I7lblN2k
 Y5uN6ljqtWgXC8KPtw387FXLQuUH.7Fx5qdU61zj6JczGA9p1bzCOauLY.OTQuI37K_U1sUyb5xa
 fwEwalQTW6O5C5e.mpP_I6M1_WlJM4ea0qJupYLEzBrSUDNuZnevek8IUNLRpC7rcmCqRK96X5JV
 eiJEzGWIGJlSIct_kGKKpM3zYPeBeNigaqzLaQevgbAOcqvgQ.wR27g9YgNK5_aGGEB.atHwcO2g
 b21lcdbTKnEEPEmR077.GAImcHXuruNEXq3egKTHLRQdBS2ZsZufYCnW1TUXrCVbd.aNaGam3n9r
 alsaMUNjzM76OvL6VaFkv37LFSlNEvmLS.m2Gg3S7Lh_jBpanlxYSb.LEOBwBvffBzmuuuNXNA5m
 LqD2A.3vle2NuYHVq0gq1gvsxPeYXpKCwu33lyIpPs2rW3d.sWd8e0giU9Bg7W47vSWDd9jbFJ6Y
 3jOKHuMMQKXza0oXyCLznpsOZyf..sHBjXTCsNDovUIp3ZnrYNQkkBFNeUb8o0uaBQBDZd6SPWht
 juozJkXyleCo_zv_80wvy3lMjgpjHgQ_ESPKcahs0TM24Tw3k9Ggi0CMMJNe5pNWDGCVGz65khVw
 tdUjmhpUh.bXGrUqklOf9VXom3WkoAudl2rlHsqJRnZPe46ysl7Q.tdx5t.Yw8mRHhN_kxoTmH6n
 Up.6zssnc9zFJ6nc09YphjuFD7zURRKrKMSvZ7.s2BUf9DEq3CvaP7zN4C3ouIy44Ft8Mjl_yeRx
 71H9M0JvbXBbyA4yZY1SbHuV6bN_AZg80sTKOt7j7LAqjqPS8UyxN1ksnX3c6F4aeGP_K7B2rM3c
 Z0CieGk_MhUE1Vlubl5vXeOF0UzUvAbdafMp8Bqo_uVndCCydG3IGMsXkIJxWlYxtt_XWaXkVMwb
 NcfBFrpZnLZTta368FVZX_TB_7gooAHaJZGtZY0Mj6a_2DfQEHsMxcK4n5zf5pHXnfO3VGNUpKYE
 TKamLUL2lkxex0nbjFgneuuAacXGTQ0WTYrvZjMaCvDXzR2IWa2AjQSiiNUy7Jn8BccS3SAtM8I2
 GaboRfl1Ae1p8CEu8RSvcx4uUJngrjdcjVBZqwhEfxglPxSnIdkpf.qhoGEy54p96nJctJn9iIA1
 DhKDsBLrV2epq87NATsTZ1nnR9y7NuZbsKN9WMtnSzNtsbju0eiwXgi24nrPFuNPAO81Q8i0WxOl
 h5Iw9Ox9Wlt0ZoEh81A9fZqNhzRwrGKSExdvZm2MJ25Ot5iIP9qQ15oQzbMPyRx765SXV1AS9li7
 H.YG8EhKP.bgSPQ6k3FBh154FbAZASUG5VM.4KHWBHQaPQs0M.XeRSHNBmdBVGLjbJKn8BJQD6.l
 Qs_ZPvneS4CWcpJh65abymK_v2z9CbNOhdkBAlTi4b_jp_3PBMplIiyp11ncPUVCqZ7jdptJsIid
 R8VFBbTtLXBC9Lsu2VZUThZaF.qCxG.4qvymlfcPqD.S2mkZPtyDC2IvsAcLCtY9xems7L5KkeQg
 MMZIiYFzRF6YsJvGBpY7AF1OLTRQ2NdETBdU4vEfLJDg2D4Z56peuOcYVyN_ytBUWtpaHEnmwBfY
 Iklx2O0KI0rJ9dpV3KA0JerkTgElItm8gSE0Rp6uh6pWybQyibRFoFBHeLRCbmF03RrsJqiADI18
 td0EfHvtKZ7uqdysPxom87KJ3qMhvJ0.j0vwyNdSiZ7Bq3LT57bPrRagPiKb_yDRPo5qg8cpXE8o
 t55orStm6T8EjkMkAt5I9O1QsxM7ZsqSCYum_wNMiU5ISbtHeKBgH3dR_RjmfIGEZAwvunMRqYld
 6bTDu_siMI8ajJM5Nt1hyNfe3MxGN0qqpicZebcVyBQz3j8RTwmWa4989ozneIjMeGMdSd4AC3XB
 wctCNJIxLS5T5WUx82u5FrGwKY71Lk1y41sVSbFoiv8lBRn2eAQ88xkUFecPgTOIpQrQvWogroeX
 ybb4OkgTxVvKmRz7M.PQAqrOcj1xDTWWRpZBWU0EoTG6C_6hcsvYlYskzOdqOVCjpxmecfpKnHBy
 U756svtQdpSp3wphp2TkEy7yMXHEsYs0LwBCuXNc7Iezc57bqnHHTe3aLpk_EN7Grws.uaTCm.91
 LqKDHqU5q8o2lXeCkQo7_2r9UtH7SCaknujzk_M87QYCOIwlnRLHfESHn5BGnq4TV396MPpcW6.8
 zTEJTxFstTWQi7gQCtf4KaQ--
X-Sonic-MF: <brchuckz@aim.com>
X-Sonic-ID: 1ff41cc7-38d0-4704-a2f8-3119c9174330
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic313.consmr.mail.gq1.yahoo.com with HTTP; Tue, 14 Mar 2023 13:50:19 +0000
Received: by hermes--production-ne1-759c9b8c64-2s6ww (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 9d3ca51c02ddf4ed76ac806fbc7932b6; 
 Tue, 14 Mar 2023 13:26:59 +0000 (UTC)
Message-ID: <34eda0c4-3d90-0e22-7888-81bf18e2a5f0@aol.com>
Date: Tue, 14 Mar 2023 09:26:59 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/2] pci: allow slot_reserved_mask to be ignored with
 manual slot assignment
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1678763217.git.brchuckz@aol.com>
 <d9ae459b2814425c2d9e756e45d993c824da150a.1678763217.git.brchuckz@aol.com>
 <20230314023148-mutt-send-email-mst@kernel.org>
 <0c8ee7e9-dd23-262f-f67e-359e14abf6f2@ilande.co.uk>
 <20230314091653-mutt-send-email-mst@kernel.org>
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <20230314091653-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.21284
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
Received-SPF: pass client-ip=98.137.65.82; envelope-from=brchuckz@aim.com;
 helo=sonic313-19.consmr.mail.gq1.yahoo.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 3/14/2023 9:17 AM, Michael S. Tsirkin wrote:
> On Tue, Mar 14, 2023 at 12:43:12PM +0000, Mark Cave-Ayland wrote:
> > On 14/03/2023 06:33, Michael S. Tsirkin wrote:
> > 
> > > On Tue, Mar 14, 2023 at 12:01:09AM -0400, Chuck Zmudzinski wrote:
> > > > Commit 4f67543bb8c5 ("xen/pt: reserve PCI slot 2 for Intel igd-passthru")
> > > > uses slot_reserved_mask to reserve slot 2 for the Intel IGD for the
> > > > xenfv machine when the guest is configured for igd-passthru.
> > > > 
> > > > A desired extension to that commit is to allow use of the reserved slot
> > > > if the administrator manually configures a device to use the reserved
> > > > slot. Currently, slot_reserved_mask is enforced unconditionally. With
> > > > this patch, the pci bus can be configured so the slot is only reserved
> > > > if the pci device to be added to the bus is configured for automatic
> > > > slot assignment.
> > > > 
> > > > To enable the desired behavior of slot_reserved_mask machine, add a
> > > > boolean member enforce_slot_reserved_mask_manual to struct PCIBus and
> > > > add a function pci_bus_ignore_slot_reserved_mask_manual which can be
> > > > called to change the default behavior of always enforcing
> > > > slot_reserved_mask so, in that case, slot_reserved_mask is only enforced
> > > > when the pci device being added is configured for automatic slot
> > > > assignment.
> > > > 
> > > > Call the new pci_bus_ignore_slot_reserved_mask_manual function after
> > > > creating the pci bus for the pc/i440fx/xenfv machine type to implement
> > > > the desired behavior of causing slot_reserved_mask to only apply when
> > > > the pci device to be added to a pc/i440fx/xenfv machine is configured
> > > > for automatic slot assignment.
> > > > 
> > > > Link: https://lore.kernel.org/qemu-devel/20230106064838-mutt-send-email-mst@kernel.org/
> > > > Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
> > > 
> > > I really dislike this.
> > > It seems that xen should not have used slot_reserved_mask,
> > > and instead needs something new like slot_manual_mask.
> > > No?
> > 
> > My suggestion was to move the validation logic to a separate callback
> > function in PCIBus (see
> > https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg03988.html) but
> > perhaps I wasn't clear enough in pointing out that I was thinking this could
> > *replace* the existing slot_reserved_mask mechanism, rather than providing a
> > hook to allow it to be manipulated.
> > 
> > Here's a very rough patch put together over lunch that attempts this for
> > pci_bus_devfn_reserved(): the idea is that sun4u and Xen would call
> > pci_bus_set_slot_reserved_fn() with a suitable pci_slot_reserved_fn
> > implementation, and slot_reserved_mask gets removed completely i.e.:
> > 
> > 
> > diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> > index def5000e7b..30b856499a 100644
> > --- a/hw/pci/pci.c
> > +++ b/hw/pci/pci.c
> > @@ -493,6 +493,13 @@ bool pci_bus_bypass_iommu(PCIBus *bus)
> >      return host_bridge->bypass_iommu;
> >  }
> > 
> > +static bool pci_bus_default_slot_reserved(PCISlotReservationType restype,
> > +                                          int devfn)
> > +{
> > +    /* All slots accessible by default */
> > +    return false;
> > +}
> > +
> >  static void pci_root_bus_internal_init(PCIBus *bus, DeviceState *parent,
> >                                         MemoryRegion *address_space_mem,
> >                                         MemoryRegion *address_space_io,
> > @@ -500,7 +507,7 @@ static void pci_root_bus_internal_init(PCIBus *bus,
> > DeviceState *parent,
> >  {
> >      assert(PCI_FUNC(devfn_min) == 0);
> >      bus->devfn_min = devfn_min;
> > -    bus->slot_reserved_mask = 0x0;
> > +    bus->slot_reserved_fn = pci_bus_default_slot_reserved;
> >      bus->address_space_mem = address_space_mem;
> >      bus->address_space_io = address_space_io;
> >      bus->flags |= PCI_BUS_IS_ROOT;
> > @@ -1111,9 +1118,15 @@ static bool pci_bus_devfn_available(PCIBus *bus, int devfn)
> >      return !(bus->devices[devfn]);
> >  }
> > 
> > -static bool pci_bus_devfn_reserved(PCIBus *bus, int devfn)
> > +static bool pci_bus_devfn_reserved(PCIBus *bus, int devfn,
> > +                                   PCISlotReservationType restype)
> > +{
> > +    return bus->slot_reserved_fn(restype, devfn);
> > +}
> > +
> > +void pci_bus_set_slot_reserved_fn(PCIBus *bus, pci_slot_reserved_fn fn)
> >  {
> > -    return bus->slot_reserved_mask & (1UL << PCI_SLOT(devfn));
> > +    bus->slot_reserved_fn = fn;
> >  }
> > 
> >  /* -1 for devfn means auto assign */
> > @@ -1141,7 +1154,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
> >          for(devfn = bus->devfn_min ; devfn < ARRAY_SIZE(bus->devices);
> >              devfn += PCI_FUNC_MAX) {
> >              if (pci_bus_devfn_available(bus, devfn) &&
> > -                   !pci_bus_devfn_reserved(bus, devfn)) {
> > +                   !pci_bus_devfn_reserved(bus, devfn, PCI_SLOT_RESERVATION_AUTO)) {
> >                  goto found;
> >              }
> >          }
> > @@ -1149,7 +1162,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
> >                     "or reserved", name);
> >          return NULL;
> >      found: ;
> > -    } else if (pci_bus_devfn_reserved(bus, devfn)) {
> > +    } else if (pci_bus_devfn_reserved(bus, devfn, PCI_SLOT_RESERVATION_MANUAL)) {
> >          error_setg(errp, "PCI: slot %d function %d not available for %s,"
> >                                         MemoryRegion *address_space_io,
> > @@ -500,7 +507,7 @@ static void pci_root_bus_internal_init(PCIBus *bus,
> > DeviceState *parent,
> >  {
> >      assert(PCI_FUNC(devfn_min) == 0);
> >      bus->devfn_min = devfn_min;
> > -    bus->slot_reserved_mask = 0x0;
> > +    bus->slot_reserved_fn = pci_bus_default_slot_reserved;
> >      bus->address_space_mem = address_space_mem;
> >      bus->address_space_io = address_space_io;
> >      bus->flags |= PCI_BUS_IS_ROOT;
> > @@ -1111,9 +1118,15 @@ static bool pci_bus_devfn_available(PCIBus *bus, int devfn)
> >      return !(bus->devices[devfn]);
> >  }
> > 
> > -static bool pci_bus_devfn_reserved(PCIBus *bus, int devfn)
> > +static bool pci_bus_devfn_reserved(PCIBus *bus, int devfn,
> > +                                   PCISlotReservationType restype)
> > +{
> > +    return bus->slot_reserved_fn(restype, devfn);
> > +}
> > +
> > +void pci_bus_set_slot_reserved_fn(PCIBus *bus, pci_slot_reserved_fn fn)
> >  {
> > -    return bus->slot_reserved_mask & (1UL << PCI_SLOT(devfn));
> > +    bus->slot_reserved_fn = fn;
> >  }
> > 
> >  /* -1 for devfn means auto assign */
> > @@ -1141,7 +1154,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
> >          for(devfn = bus->devfn_min ; devfn < ARRAY_SIZE(bus->devices);
> >              devfn += PCI_FUNC_MAX) {
> >              if (pci_bus_devfn_available(bus, devfn) &&
> > -                   !pci_bus_devfn_reserved(bus, devfn)) {
> > +                   !pci_bus_devfn_reserved(bus, devfn, PCI_SLOT_RESERVATION_AUTO)) {
> >                  goto found;
> >              }
> >          }
> > @@ -1149,7 +1162,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
> >                     "or reserved", name);
> >          return NULL;
> >      found: ;
> > -    } else if (pci_bus_devfn_reserved(bus, devfn)) {
> > +    } else if (pci_bus_devfn_reserved(bus, devfn, PCI_SLOT_RESERVATION_MANUAL)) {
> >          error_setg(errp, "PCI: slot %d function %d not available for %s,"
> >                     " reserved",
> >                     PCI_SLOT(devfn), PCI_FUNC(devfn), name);
> > diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> > index d5a40cd058..8a949f7ae1 100644
> > --- a/include/hw/pci/pci.h
> > +++ b/include/hw/pci/pci.h
> > @@ -257,10 +257,18 @@ MemoryRegion *pci_address_space_io(PCIDevice *dev);
> >   */
> >  int pci_bar(PCIDevice *d, int reg);
> > 
> > +typedef enum PCISlotReservationType {
> > +    PCI_SLOT_RESERVATION_AUTO,
> > +    PCI_SLOT_RESERVATION_MANUAL
> > +} PCISlotReservationType;
> > +
> > +typedef bool (*pci_slot_reserved_fn)(PCISlotReservationType restype, int devfn);
> >  typedef void (*pci_set_irq_fn)(void *opaque, int irq_num, int level);
> >  typedef int (*pci_map_irq_fn)(PCIDevice *pci_dev, int irq_num);
> >  typedef PCIINTxRoute (*pci_route_irq_fn)(void *opaque, int pin);
> > 
> > +void pci_bus_set_slot_reserved_fn(PCIBus *bus, pci_slot_reserved_fn fn);
> > +
> >  #define TYPE_PCI_BUS "PCI"
> >  OBJECT_DECLARE_TYPE(PCIBus, PCIBusClass, PCI_BUS)
> >  #define TYPE_PCIE_BUS "PCIE"
> > diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
> > index 5653175957..d68ea1418d 100644
> > --- a/include/hw/pci/pci_bus.h
> > +++ b/include/hw/pci/pci_bus.h
> > @@ -36,7 +36,7 @@ struct PCIBus {
> >      PCIIOMMUFunc iommu_fn;
> >      void *iommu_opaque;
> >      uint8_t devfn_min;
> > -    uint32_t slot_reserved_mask;
> > +    pci_slot_reserved_fn slot_reserved_fn;
> >      pci_set_irq_fn set_irq;
> >      pci_map_irq_fn map_irq;
> >      pci_route_irq_fn route_intx_to_irq;
> > 
> > 
> > If this approach seems reasonable, I'm happy for someone else to take this
> > over and turn it into a proper series.
> > 
> > 
> > ATB,
> > 
> > Mark.
>
> It's ok too though I think I like chuck's proposal better:
> less callbacks to chase.
>

I would be willing to pursue this if there were more use cases for
slot_reserved_mask than just the two cases we have now: xen and sun4u.
Until there is a clear demand for a more general way to manipulate the
mask, I agree with Michael that the KISS principle should apply here.

Kind regards,

Chuck

