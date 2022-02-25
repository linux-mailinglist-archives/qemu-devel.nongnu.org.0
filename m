Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3B04C4124
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 10:18:19 +0100 (CET)
Received: from localhost ([::1]:55358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNWjy-0001Rq-Kr
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 04:18:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nNVoI-0000N8-Mp
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 03:18:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nNVoD-00007D-Nk
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 03:18:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645777116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f2DdWXMnv49Pfp74VbFLTeX2kBQDDMR+vGozzPCIx/g=;
 b=UdRtD7TBz8Ztd+oYUvJTz4ToYV7s82qTfsJMlDtDPsAEuzm1beyYlq0EaAOoxg8ct9O6yh
 28iNp1xL+E24i6BsxNO7AmhJxk7uMXRWT0Z9/Pbx2mOA6oUSCc+HW66+OsWvhJlDlSQ356
 vBNfovZMLrXWQ30NW6lc7XLBaDPFKJI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-5hEKVPnjNkaa2PLBh_Gv0Q-1; Fri, 25 Feb 2022 03:18:34 -0500
X-MC-Unique: 5hEKVPnjNkaa2PLBh_Gv0Q-1
Received: by mail-ej1-f69.google.com with SMTP id
 mp5-20020a1709071b0500b0069f2ba47b20so2268930ejc.19
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 00:18:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f2DdWXMnv49Pfp74VbFLTeX2kBQDDMR+vGozzPCIx/g=;
 b=InW7Z4W4Mz4WQnAZjs3+UtCBgACwXQaIafAQOKrBiOJIh+PPDpraeR4S5UXOf8epv7
 NsxyNWoawh4FRgk1/PtFPq+eHgUKTZAlcTDHfvbmTumCqP6ZTBVSFRKO7b4CVDsC0GDW
 qKsonjx4LkTzQrM8yEnvBTOt/FM3rCvuJZjyQoznztKTyTzTg4VDfu8bSy2LhITfaZTI
 t8MwlaNIHw6JfqXyxYZ8ETE8/gv8uamkwUaswGUTETEui+EsjEceqsRVKWW+/CsjxubS
 Pqr8rGoDO1HpTuj9eKfAVyYDLwXhvt2cMKrJ0uJ8DGeg66tJBGcJLbvlrWm3R5RHxzkc
 6F0w==
X-Gm-Message-State: AOAM5304hjrgpth/TbxMUKWeyPtMBusg0mT5jXmaEr9mHxAyR4kF8II2
 DAvRxvMPIvICTFTBgleE2g7D5B7XRLR5d9JmS68pB5vYNc+pxfjhnVYWdecTmC7HrJZzxoyxxIo
 j7P5IH71+zwsGjMs=
X-Received: by 2002:a17:906:a057:b0:6cf:2736:ba65 with SMTP id
 bg23-20020a170906a05700b006cf2736ba65mr5222287ejb.171.1645777113621; 
 Fri, 25 Feb 2022 00:18:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxdUxtropKIZwXJg6VjVgw071PgfdfV0VvqBhTt/0sqPxUNyd5jngWNVg/8XjiWbrukA0Uw2w==
X-Received: by 2002:a17:906:a057:b0:6cf:2736:ba65 with SMTP id
 bg23-20020a170906a05700b006cf2736ba65mr5222273ejb.171.1645777113347; 
 Fri, 25 Feb 2022 00:18:33 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 dt24-20020a170906b79800b006d57e9289f2sm718142ejb.49.2022.02.25.00.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 00:18:32 -0800 (PST)
Date: Fri, 25 Feb 2022 09:18:30 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 2/4] pcie: update slot power status only is power
 control is enabled
Message-ID: <20220225091830.2f684997@redhat.com>
In-Reply-To: <20220224125928-mutt-send-email-mst@kernel.org>
References: <20220224174411.3296848-1-imammedo@redhat.com>
 <20220224174411.3296848-3-imammedo@redhat.com>
 <20220224125928-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 24 Feb 2022 13:05:07 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Thu, Feb 24, 2022 at 12:44:09PM -0500, Igor Mammedov wrote:
> > on creation a PCIDevice has power turned on at the end of pci_qdev_realize()
> > however later on if PCIe slot isn't populated with any children
> > it's power is turned off. It's fine if native hotplug is used
> > as plug callback will power slot on among other things.
> > However when ACPI hotplug is enabled it replaces native PCIe plug
> > callbacks with ACPI specific ones (acpi_pcihp_device_*plug_cb) and
> > as result slot stays powered off. It works fine as ACPI hotplug
> > on guest side takes care of enumerating/initializing hotplugged
> > device. But when later guest is migrated, call chain introduced by [1]
> > 
> >    pcie_cap_slot_post_load()  
> >        -> pcie_cap_update_power()
> >            -> pcie_set_power_device()
> >                -> pci_set_power()
> >                    -> pci_update_mappings()  
> > 
> > will disable earlier initialized BARs for the hotplugged device
> > in powered off slot due to commit [2] which disables BARs if
> > power is off. As result guest OS after migration will be very
> > much confused [3], still thinking that it has working device,
> > which isn't true anymore due to disabled BARs.
> > 
> > Fix it by honoring PCI_EXP_SLTCAP_PCP and updating power status
> > only if capability is enabled. Follow up patch will disable
> > PCI_EXP_SLTCAP_PCP overriding COMPAT_PROP_PCP property when
> > PCIe slot is under ACPI PCI hotplug control.
> > 
> > See [3] for reproducer.
> > 
> > 1)
> > Fixes: commit d5daff7d312 (pcie: implement slot power control for pcie root ports)
> > 2)
> >        commit 23786d13441 (pci: implement power state)
> > 3)
> > Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=2053584
> >   
> 
> 
> Correct format for the last paragraph:
> 
> 
> Fixes: d5daff7d312 ("pcie: implement slot power control for pcie root ports")
> Fixes: 23786d13441 ("pci: implement power state")
> Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=2053584

ok, will fix it up on respin like this to have references:

1)
Fixes: d5daff7d312 ("pcie: implement slot power control for pcie root ports")
2)
Fixes: 23786d13441 ("pci: implement power state")
Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=2053584

> 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> >  hw/pci/pcie.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> > 
> > diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> > index d7d73a31e4..2339729a7c 100644
> > --- a/hw/pci/pcie.c
> > +++ b/hw/pci/pcie.c
> > @@ -383,10 +383,9 @@ static void pcie_cap_update_power(PCIDevice *hotplug_dev)
> >  
> >      if (sltcap & PCI_EXP_SLTCAP_PCP) {
> >          power = (sltctl & PCI_EXP_SLTCTL_PCC) == PCI_EXP_SLTCTL_PWR_ON;
> > +        pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
> > +                            pcie_set_power_device, &power);
> >      }
> > -
> > -    pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
> > -                        pcie_set_power_device, &power);  
> 
> I think this is correct. However, I wonder whether for 6.2 compatiblity
> as a hack we should sometimes skip the power update even when
> PCI_EXP_SLTCAP_PCP exists. Will that not work around the issue for
> these machine types?

pc-q35-6.2 is broken utterly.
With pc-q35-6.1, it's a mess. Here is a ping-pong migration matrix for it
            
      v6.1   |  v6.2   | Fix
v6.1   ok    | broken  | ok (#1)
v6.2         | broken  | broken (#2)

[1] has PCI_EXP_SLTCAP_PCP due to x-pcihp-enable-pcie-pcp-cap=on
    i.e. pci_config is exactly the same as in qemu-v6.1
[2] PCI_EXP_SLTCAP_PCP is enabled + empty slot is powered off
    (+ state is migrated)

there are some invariants that might work in one direction,
but it won't survive ping-pong migration. And more importantly
for upstream we care mostly care for old -> new working,
and it's direction that is broken in v6.2.

> And assuming we want bug for bug compat anyway, why not just put
> it here? It seems easier to reason about frankly ...

It should be possible hack PCI core to fixup broken power state
on incoming migration at (at postload time), but that would just
create more confusion, where in some cases migration would work
and in some would not (depending on used qemu versions).

Lets just declare v6.2 qemu broken, with upgrade/downgrade to
(7.0/6.1) as suggested solution.

PS:
I'd very much prefer avoid adding hacks for ACPI pcihp sake to
PCI core, and let PCI code behave as it's supposed to per spec.
It's already bad enough with pcihp layered on top of PCI,
making PCI code depend on pcihp will just make it more fragile.
 
> >  }
> >  
> >  /*
> > -- 
> > 2.31.1  
> 


