Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A102D439
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 05:25:30 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46323 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVpDV-0005yt-Ly
	for lists+qemu-devel@lfdr.de; Tue, 28 May 2019 23:25:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35904)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hVpC3-0005NH-Ji
	for qemu-devel@nongnu.org; Tue, 28 May 2019 23:24:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hVpC2-0003ZY-F3
	for qemu-devel@nongnu.org; Tue, 28 May 2019 23:23:59 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:44504)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mst@redhat.com>) id 1hVpC2-0003YZ-8i
	for qemu-devel@nongnu.org; Tue, 28 May 2019 23:23:58 -0400
Received: by mail-qt1-f195.google.com with SMTP id m2so830433qtp.11
	for <qemu-devel@nongnu.org>; Tue, 28 May 2019 20:23:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=XDiVx4dNcGN10uwsUhaP3aSGBwRGZYzs7Ur5X5fPj90=;
	b=ZsQ7v+szLpwiyRZ9MZFWJhZMhhB1DieJeMv7oH1cZZitNilY+2rbhEP7vJPRMx5ban
	Gy4EOPVmSdLFDes8b/oOpCBw/4TNp/X+ggvyGQDo2LD8cv8EYdQ1nzjYShB71ZAodPB2
	+2jHXmFFyjrswArirxej/B+jsLf2boT2QVuoV4w19Fb+3Kd9Z6VZaooSd39bYIjPVsbG
	wrpsqlcsOK/G3EEGR4LSluAluDs9bN/49tCsSeaG9dJrhIzHE225LUdbIBeiEfRW8Kv2
	SSUjx6FTDUqCtfIWFoshgT42u6/8MEs2TVJfN1fVOXe6YhlKM4HdPxvYbeVw/5eAl79E
	XsSw==
X-Gm-Message-State: APjAAAWjM4XxrZ7zYd42Q+MqRid3cNY4dIpSGaMCGzjdp/BgDVBEDcJt
	Dd/9IyV0A5PbkPlF/tSw5XxOpw==
X-Google-Smtp-Source: APXvYqzJ6an2liucV/n2EiLtEAvhaE8QYoNSar6nxs36mNIzluHxsbUjV78rlNklStHkUZKpfim4cQ==
X-Received: by 2002:ad4:45a8:: with SMTP id y8mr205030qvu.101.1559100237823;
	Tue, 28 May 2019 20:23:57 -0700 (PDT)
Received: from redhat.com (pool-100-0-197-103.bstnma.fios.verizon.net.
	[100.0.197.103]) by smtp.gmail.com with ESMTPSA id
	x22sm1552446qtm.97.2019.05.28.20.23.56
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 28 May 2019 20:23:56 -0700 (PDT)
Date: Tue, 28 May 2019 23:23:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Message-ID: <20190528232250-mutt-send-email-mst@kernel.org>
References: <20190523052918.1129-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190523052918.1129-1-david@gibson.dropbear.id.au>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.160.195
Subject: Re: [Qemu-devel] [PATCH 1/8] spapr: Clean up device node name
 generation for PCI devices
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, mdroth@linux.ibm.com, qemu-ppc@nongnu.org,
	groug@kaod.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 23, 2019 at 03:29:11PM +1000, David Gibson wrote:
> spapr_populate_pci_child_dt() adds a 'name' property to the device tree
> node for PCI devices.  This is never necessary for a flattened device tree,
> it is implicit in the name added when the node is constructed.  In fact
> anything we do add to a 'name' property will be overwritten with something
> derived from the structural name in the guest firmware (but in fact it is
> exactly the same bytes).
> 
> So, remove that.  In addition, pci_get_node_name() is very simple, so fold
> it into its (also simple) sole caller spapr_create_pci_child_dt().
> 
> While we're there rename pci_find_device_name() to the shorter and more
> accurate dt_name_from_class().
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>

The threading is broken here btw.

I was CC'd but it's mostly PPC stuff.
I like how pci_XX functions that are not in pci.c are
going away :)

Acked-by: Michael S. Tsirkin <mst@redhat.com>


> ---
>  hw/ppc/spapr_pci.c | 43 +++++++++++++++++--------------------------
>  1 file changed, 17 insertions(+), 26 deletions(-)
> 
> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> index 97961b0128..b2db46ef1d 100644
> --- a/hw/ppc/spapr_pci.c
> +++ b/hw/ppc/spapr_pci.c
> @@ -1173,8 +1173,8 @@ static const PCIClass pci_classes[] = {
>      { "data-processing-controller", spc_subclass },
>  };
>  
> -static const char *pci_find_device_name(uint8_t class, uint8_t subclass,
> -                                        uint8_t iface)
> +static const char *dt_name_from_class(uint8_t class, uint8_t subclass,
> +                                      uint8_t iface)
>  {
>      const PCIClass *pclass;
>      const PCISubClass *psubclass;
> @@ -1216,23 +1216,6 @@ static const char *pci_find_device_name(uint8_t class, uint8_t subclass,
>      return name;
>  }
>  
> -static gchar *pci_get_node_name(PCIDevice *dev)
> -{
> -    int slot = PCI_SLOT(dev->devfn);
> -    int func = PCI_FUNC(dev->devfn);
> -    uint32_t ccode = pci_default_read_config(dev, PCI_CLASS_PROG, 3);
> -    const char *name;
> -
> -    name = pci_find_device_name((ccode >> 16) & 0xff, (ccode >> 8) & 0xff,
> -                                ccode & 0xff);
> -
> -    if (func != 0) {
> -        return g_strdup_printf("%s@%x,%x", name, slot, func);
> -    } else {
> -        return g_strdup_printf("%s@%x", name, slot);
> -    }
> -}
> -
>  static uint32_t spapr_phb_get_pci_drc_index(SpaprPhbState *phb,
>                                              PCIDevice *pdev);
>  
> @@ -1300,11 +1283,6 @@ static void spapr_populate_pci_child_dt(PCIDevice *dev, void *fdt, int offset,
>          _FDT(fdt_setprop(fdt, offset, "udf-supported", NULL, 0));
>      }
>  
> -    _FDT(fdt_setprop_string(fdt, offset, "name",
> -                            pci_find_device_name((ccode >> 16) & 0xff,
> -                                                 (ccode >> 8) & 0xff,
> -                                                 ccode & 0xff)));
> -
>      buf = spapr_phb_get_loc_code(sphb, dev);
>      _FDT(fdt_setprop_string(fdt, offset, "ibm,loc-code", buf));
>      g_free(buf);
> @@ -1348,10 +1326,23 @@ static int spapr_create_pci_child_dt(SpaprPhbState *phb, PCIDevice *dev,
>                                       void *fdt, int node_offset)
>  {
>      int offset;
> -    gchar *nodename;
> +    const gchar *basename;
> +    char *nodename;
> +    int slot = PCI_SLOT(dev->devfn);
> +    int func = PCI_FUNC(dev->devfn);
> +    uint32_t ccode = pci_default_read_config(dev, PCI_CLASS_PROG, 3);
> +
> +    basename = dt_name_from_class((ccode >> 16) & 0xff, (ccode >> 8) & 0xff,
> +                                  ccode & 0xff);
> +
> +    if (func != 0) {
> +        nodename = g_strdup_printf("%s@%x,%x", basename, slot, func);
> +    } else {
> +        nodename = g_strdup_printf("%s@%x", basename, slot);
> +    }
>  
> -    nodename = pci_get_node_name(dev);
>      _FDT(offset = fdt_add_subnode(fdt, node_offset, nodename));
> +
>      g_free(nodename);
>  
>      spapr_populate_pci_child_dt(dev, fdt, offset, phb);
> -- 
> 2.21.0

