Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B186F4C46
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 23:37:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptxfG-0005FW-KX; Tue, 02 May 2023 17:36:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1ptxfC-0005F3-ET
 for qemu-devel@nongnu.org; Tue, 02 May 2023 17:35:58 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1ptxfA-0007Fz-Cf
 for qemu-devel@nongnu.org; Tue, 02 May 2023 17:35:58 -0400
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f00d41df22so276765e87.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 14:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1683063354; x=1685655354;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zu87AQAqb1Vj1c5MMRl9Zfr99rslOJ9jbOtUtnLrQHA=;
 b=BtjcH8hVwoTA+UeH4dRJiIuhLcz4aOpdNgjbslQ9ERzY3cQnDEM6SOkugUDUpjKPhQ
 6fggpzWSCPfoCS092Fif8SU/QRMmMw/HopG3JP3+5xs3PYCMkfh0zDloVu9dGwJ1TyaX
 cfJ1VwExkEwvO3RbZpAzAqS+H7s4WVbDVd65WqDpia8Namph5TNtjEmWutCgSgz7E6HK
 Mddk76sE4Bc41+uVtYJQLR7b2vz6vode+gfJGjW1eEwV1vIrCwuK+TnH+gwJK+0odVig
 uOZH4M9+VNq39ZRmvlvG7t8SKlQgRyuGDAEenkFoF8d3ZPOwWsNYFXKAs9I+lr05s9YJ
 d3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683063354; x=1685655354;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zu87AQAqb1Vj1c5MMRl9Zfr99rslOJ9jbOtUtnLrQHA=;
 b=I0uwMUbX7Tp9fI8l87OFUja3VA7rT1M4GMkWDsASN95rRj68/iMXsxyFD7SPl+uZkt
 tpNX0F75bwDqb/jnKNCnzrgTrw4wGfopgf3yRAuN3+tVdW1aFqSDg1oNAB6hBqYchGtH
 xWDsSfxp5A/+spSYJJg4ic3SJTs1zN8rEOwoVpnVPOGfGJoFjfTQq6tMB+HKtVfr+goj
 Q5pRyLG5fDCbMvfLgVzMqpf5e+k+kOYsq4OaXjTLV80WG/vv/mvJzh4jEQ6SYC7P/5XB
 I/5q7s5iecV3iMiDeOmd2seotr1cZ7FJ6QMOGzA5UmF37BtWQwvsj7d/2hp0APXOhW1P
 6/Pg==
X-Gm-Message-State: AC+VfDznOIOFCzVhP/4L2y2klZaGvHbC49mn2Ha+X+Qi85LPkBr6yRhC
 Uyf9+rE1tJN4QDP+JKRp0FF0pIkiGGskVd0uDMYoWg==
X-Google-Smtp-Source: ACHHUZ5u761KupNgKMQw9HlLiYcSTOrxsVyQqlu01BcGoTK3ouZEyNjLdBhkj4p2OyvEHSIuyBF/uAz0TXA+a2y6PyM=
X-Received: by 2002:a2e:7008:0:b0:2a9:fa39:235e with SMTP id
 l8-20020a2e7008000000b002a9fa39235emr5143600ljc.26.1683063354020; Tue, 02 May
 2023 14:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230424112147.17083-1-viktor@daynix.com>
 <20230424112147.17083-2-viktor@daynix.com>
 <f169bd76-c638-edd6-a356-4ce69c19debc@redhat.com>
In-Reply-To: <f169bd76-c638-edd6-a356-4ce69c19debc@redhat.com>
From: Viktor Prutyanov <viktor@daynix.com>
Date: Wed, 3 May 2023 00:35:43 +0300
Message-ID: <CAPv0NP7SpdD7L1QSKKkW+EvZ_qK0NNe+xVTDXGYQzaMi0kos+A@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] pci: add handling of Enable bit in ATS Control
 Register
To: Jason Wang <jasowang@redhat.com>
Cc: mst@redhat.com, marcel.apfelbaum@gmail.com, pbonzini@redhat.com, 
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, qemu-devel@nongnu.org, 
 yan@daynix.com, yuri.benditovich@daynix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::12b;
 envelope-from=viktor@daynix.com; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Apr 26, 2023 at 8:32=E2=80=AFAM Jason Wang <jasowang@redhat.com> wr=
ote:
>
>
> =E5=9C=A8 2023/4/24 19:21, Viktor Prutyanov =E5=86=99=E9=81=93:
> > According to PCIe Address Translation Services specification 5.1.3.,
> > ATS Control Register has Enable bit to enable/disable ATS.
> > Add a new field for a trigger function which is called at the Enable
> > bit change, so that PCIe devices can handle ATS enable/disable.
> >
> > Signed-off-by: Viktor Prutyanov <viktor@daynix.com>
> > ---
> >   hw/pci/pci.c                |  1 +
> >   hw/pci/pcie.c               | 21 +++++++++++++++++++++
> >   include/hw/pci/pci_device.h |  3 +++
> >   include/hw/pci/pcie.h       |  4 ++++
> >   4 files changed, 29 insertions(+)
> >
> > diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> > index 208c16f450..79a47d2589 100644
> > --- a/hw/pci/pci.c
> > +++ b/hw/pci/pci.c
> > @@ -1550,6 +1550,7 @@ void pci_default_write_config(PCIDevice *d, uint3=
2_t addr, uint32_t val_in, int
> >       msi_write_config(d, addr, val_in, l);
> >       msix_write_config(d, addr, val_in, l);
> >       pcie_sriov_config_write(d, addr, val_in, l);
> > +    pcie_ats_config_write(d, addr, val_in, l);
> >   }
> >
> >   /***********************************************************/
> > diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> > index 924fdabd15..e0217161e5 100644
> > --- a/hw/pci/pcie.c
> > +++ b/hw/pci/pcie.c
> > @@ -1057,6 +1057,27 @@ void pcie_ats_init(PCIDevice *dev, uint16_t offs=
et, bool aligned)
> >       pci_set_word(dev->wmask + dev->exp.ats_cap + PCI_ATS_CTRL, 0x800f=
);
> >   }
> >
> > +void pcie_ats_config_write(PCIDevice *dev, uint32_t address, uint32_t =
val,
> > +                           int len)
> > +{
> > +    uint32_t off;
> > +    uint16_t ats_cap =3D dev->exp.ats_cap;
> > +
> > +    if (!ats_cap || address < ats_cap) {
> > +        return;
> > +    }
> > +    off =3D address - ats_cap;
> > +    if (off >=3D PCI_EXT_CAP_ATS_SIZEOF) {
> > +        return;
> > +    }
> > +
> > +    if (range_covers_byte(off, len, PCI_ATS_CTRL + 1)) {
>
>
> Do we really need +1 here?

The Enable bit is the 15th in the ATS Control Register, so it is in a
byte next to PCI_ATS_CTRL. Although I'm not sure that this is the
best way to test this bit.

All other comments I tried to take into account in the v2.

Thanks,
Viktor Prutyanov

>
> The rest looks good.
>
> Thanks
>
>
> > +        if (dev->ats_ctrl_trigger) {
> > +            dev->ats_ctrl_trigger(dev, !!(val & PCI_ATS_CTRL_ENABLE));
> > +        }
> > +    }
> > +}
> > +
> >   /* ACS (Access Control Services) */
> >   void pcie_acs_init(PCIDevice *dev, uint16_t offset)
> >   {
> > diff --git a/include/hw/pci/pci_device.h b/include/hw/pci/pci_device.h
> > index d3dd0f64b2..2bb1d68f3b 100644
> > --- a/include/hw/pci/pci_device.h
> > +++ b/include/hw/pci/pci_device.h
> > @@ -160,6 +160,9 @@ struct PCIDevice {
> >       /* ID of standby device in net_failover pair */
> >       char *failover_pair_id;
> >       uint32_t acpi_index;
> > +
> > +    /* PCI ATS enable/disable trigger */
> > +    void (*ats_ctrl_trigger)(PCIDevice *dev, bool enable);
> >   };
> >
> >   static inline int pci_intx(PCIDevice *pci_dev)
> > diff --git a/include/hw/pci/pcie.h b/include/hw/pci/pcie.h
> > index 798a262a0a..5f2dbd87cf 100644
> > --- a/include/hw/pci/pcie.h
> > +++ b/include/hw/pci/pcie.h
> > @@ -154,4 +154,8 @@ void pcie_cap_slot_unplug_cb(HotplugHandler *hotplu=
g_dev, DeviceState *dev,
> >                                Error **errp);
> >   void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_dev,
> >                                        DeviceState *dev, Error **errp);
> > +
> > +void pcie_ats_config_write(PCIDevice *dev, uint32_t address, uint32_t =
val,
> > +                           int len);
> > +
> >   #endif /* QEMU_PCIE_H */
>

