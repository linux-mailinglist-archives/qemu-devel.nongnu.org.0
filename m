Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8922D8E7E
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 17:03:49 +0100 (CET)
Received: from localhost ([::1]:35602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koTqe-0000eS-RQ
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 11:03:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koToX-0007wk-4g; Sun, 13 Dec 2020 11:01:38 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:40527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koToS-0007Eb-MO; Sun, 13 Dec 2020 11:01:36 -0500
Received: from [192.168.100.1] ([82.252.152.214]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MekrN-1kEbDv4Bxl-00akgO; Sun, 13 Dec 2020 17:01:11 +0100
Subject: Re: [PATCH] hw/xen: Don't use '#' flag of printf format
To: Xinhao Zhang <zhangxinhao1@huawei.com>, qemu-devel@nongnu.org,
 xen-devel@lists.xenproject.org
References: <20201104133709.3326630-1-zhangxinhao1@huawei.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <f6eeb660-4263-f136-537c-17b691f97b3f@vivier.eu>
Date: Sun, 13 Dec 2020 17:01:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201104133709.3326630-1-zhangxinhao1@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2y9IBdWYBnBhpPGMqUQaHTv2LpCTGAwRqyt+pUxnQ45+V86rzLj
 lrvTZfo+eBUICKMGbqYjBuDFh/PccXZwFUbeK8gAuqUPzx/nJjDUEXYKk3IsHSPoW4F4MyY
 YQHBj3JE2bd+SudANMUP8t7ErUsmnM/C/P1REVATB7O0aKyZQV6P6VaXt2RtS6JtwK8DFbU
 6Fje3V41z7HMn8btEEzjw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Zqai2xthBTc=:mOGWGHOED5IrljIXxod8ci
 vPn6Sr6Jm1sDdIqvEvUy5IgG4BVq1GOZISwnBoanQHLMYvxi/piUoZ2KcIMbwdUPFjI8O3TX8
 EFUdZSqB0EyHc+pqlyjYgLm7J0r9G8MW6uSTe9fNuxCAj6YwGrtpsnc5KTCkfWAXNVjHhx8v8
 Pue+4fBh6CyuejyhWPOlRs6caEl9gVSfwzef4QKsgEhoA9hJxniGo6V85bETEa0UN8TD8aRug
 NFfneyRSKJEAvgFKBBWYoqnLuvCwKjq8YOvYLxpAUi60lSWNP0YIiLbVfT1xSNvUYQ4OMWS1p
 hurVaMaY6PrFrElRT9VdoOPra7VX+qAvQgyQuamA/9B8XOgDo5Lq0zmp95MmkEx9Bu6ZUx9NE
 qc022BekhVMV8XVUgIMeN0chIfeEjSKm39UnHlayAB2JhUQ+31PdKvWogX+CD6Z5ZVeZMV3kt
 xyDpKc2DtA==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: sstabellini@kernel.org, paul@xen.org, qemu-trivial@nongnu.org,
 alex.chen@huawei.com, anthony.perard@citrix.com, dengkai1@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 04/11/2020 à 14:37, Xinhao Zhang a écrit :
> Fix code style. Don't use '#' flag of printf format ('%#') in
> format strings, use '0x' prefix instead
> 
> Signed-off-by: Xinhao Zhang <zhangxinhao1@huawei.com>
> Signed-off-by: Kai Deng <dengkai1@huawei.com>
> ---
>  hw/xen/xen_pt.c             | 10 +++++-----
>  hw/xen/xen_pt_config_init.c |  6 +++---
>  hw/xen/xen_pt_msi.c         | 16 ++++++++--------
>  3 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
> index 6d359ee486..a5f3dd590c 100644
> --- a/hw/xen/xen_pt.c
> +++ b/hw/xen/xen_pt.c
> @@ -489,7 +489,7 @@ static int xen_pt_register_regions(XenPCIPassthroughState *s, uint16_t *cmd)
>          pci_register_bar(&s->dev, i, type, &s->bar[i]);
>  
>          XEN_PT_LOG(&s->dev, "IO region %i registered (size=0x%08"PRIx64
> -                   " base_addr=0x%08"PRIx64" type: %#x)\n",
> +                   " base_addr=0x%08"PRIx64" type: 0x%x)\n",
>                     i, r->size, r->base_addr, type);
>      }
>  
> @@ -578,7 +578,7 @@ static void xen_pt_check_bar_overlap(PCIBus *bus, PCIDevice *d, void *opaque)
>          if (ranges_overlap(arg->addr, arg->size, r->addr, r->size)) {
>              XEN_PT_WARN(&s->dev,
>                          "Overlapped to device [%02x:%02x.%d] Region: %i"
> -                        " (addr: %#"FMT_PCIBUS", len: %#"FMT_PCIBUS")\n",
> +                        " (addr: 0x%"FMT_PCIBUS", len: 0x%"FMT_PCIBUS")\n",
>                          pci_bus_num(bus), PCI_SLOT(d->devfn),
>                          PCI_FUNC(d->devfn), i, r->addr, r->size);
>              arg->rc = true;
> @@ -618,8 +618,8 @@ static void xen_pt_region_update(XenPCIPassthroughState *s,
>      pci_for_each_device(pci_get_bus(d), pci_dev_bus_num(d),
>                          xen_pt_check_bar_overlap, &args);
>      if (args.rc) {
> -        XEN_PT_WARN(d, "Region: %d (addr: %#"FMT_PCIBUS
> -                    ", len: %#"FMT_PCIBUS") is overlapped.\n",
> +        XEN_PT_WARN(d, "Region: %d (addr: 0x%"FMT_PCIBUS
> +                    ", len: 0x%"FMT_PCIBUS") is overlapped.\n",
>                      bar, sec->offset_within_address_space,
>                      int128_get64(sec->size));
>      }
> @@ -786,7 +786,7 @@ static void xen_pt_realize(PCIDevice *d, Error **errp)
>  
>      /* register real device */
>      XEN_PT_LOG(d, "Assigning real physical device %02x:%02x.%d"
> -               " to devfn %#x\n",
> +               " to devfn 0x%x\n",
>                 s->hostaddr.bus, s->hostaddr.slot, s->hostaddr.function,
>                 s->dev.devfn);
>  
> diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
> index c8724cc7c8..c5c4e943a8 100644
> --- a/hw/xen/xen_pt_config_init.c
> +++ b/hw/xen/xen_pt_config_init.c
> @@ -1622,7 +1622,7 @@ static int xen_pt_pcie_size_init(XenPCIPassthroughState *s,
>          case PCI_EXP_TYPE_PCIE_BRIDGE:
>          case PCI_EXP_TYPE_RC_EC:
>          default:
> -            XEN_PT_ERR(d, "Unsupported device/port type %#x.\n", type);
> +            XEN_PT_ERR(d, "Unsupported device/port type 0x%x.\n", type);
>              return -1;
>          }
>      }
> @@ -1645,11 +1645,11 @@ static int xen_pt_pcie_size_init(XenPCIPassthroughState *s,
>          case PCI_EXP_TYPE_PCIE_BRIDGE:
>          case PCI_EXP_TYPE_RC_EC:
>          default:
> -            XEN_PT_ERR(d, "Unsupported device/port type %#x.\n", type);
> +            XEN_PT_ERR(d, "Unsupported device/port type 0x%x.\n", type);
>              return -1;
>          }
>      } else {
> -        XEN_PT_ERR(d, "Unsupported capability version %#x.\n", version);
> +        XEN_PT_ERR(d, "Unsupported capability version 0x%x.\n", version);
>          return -1;
>      }
>  
> diff --git a/hw/xen/xen_pt_msi.c b/hw/xen/xen_pt_msi.c
> index fb4b887b92..b71563f98a 100644
> --- a/hw/xen/xen_pt_msi.c
> +++ b/hw/xen/xen_pt_msi.c
> @@ -123,7 +123,7 @@ static int msi_msix_setup(XenPCIPassthroughState *s,
>              *ppirq = XEN_PT_UNASSIGNED_PIRQ;
>          } else {
>              XEN_PT_LOG(&s->dev, "requested pirq %d for MSI%s"
> -                       " (vec: %#x, entry: %#x)\n",
> +                       " (vec: 0x%x, entry: 0x%x)\n",
>                         *ppirq, is_msix ? "-X" : "", gvec, msix_entry);
>          }
>      }
> @@ -142,7 +142,7 @@ static int msi_msix_setup(XenPCIPassthroughState *s,
>                                       msix_entry, table_base);
>          if (rc) {
>              XEN_PT_ERR(&s->dev,
> -                       "Mapping of MSI%s (err: %i, vec: %#x, entry %#x)\n",
> +                       "Mapping of MSI%s (err: %i, vec: 0x%x, entry 0x%x)\n",
>                         is_msix ? "-X" : "", errno, gvec, msix_entry);
>              return rc;
>          }
> @@ -165,8 +165,8 @@ static int msi_msix_update(XenPCIPassthroughState *s,
>      int rc = 0;
>      uint64_t table_addr = 0;
>  
> -    XEN_PT_LOG(d, "Updating MSI%s with pirq %d gvec %#x gflags %#x"
> -               " (entry: %#x)\n",
> +    XEN_PT_LOG(d, "Updating MSI%s with pirq %d gvec 0x%x gflags 0x%x"
> +               " (entry: 0x%x)\n",
>                 is_msix ? "-X" : "", pirq, gvec, gflags, msix_entry);
>  
>      if (is_msix) {
> @@ -208,11 +208,11 @@ static int msi_msix_disable(XenPCIPassthroughState *s,
>      }
>  
>      if (is_binded) {
> -        XEN_PT_LOG(d, "Unbind MSI%s with pirq %d, gvec %#x\n",
> +        XEN_PT_LOG(d, "Unbind MSI%s with pirq %d, gvec 0x%x\n",
>                     is_msix ? "-X" : "", pirq, gvec);
>          rc = xc_domain_unbind_msi_irq(xen_xc, xen_domid, gvec, pirq, gflags);
>          if (rc) {
> -            XEN_PT_ERR(d, "Unbinding of MSI%s failed. (err: %d, pirq: %d, gvec: %#x)\n",
> +            XEN_PT_ERR(d, "Unbinding of MSI%s failed. (err: %d, pirq: %d, gvec: 0x%x)\n",
>                         is_msix ? "-X" : "", errno, pirq, gvec);
>              return rc;
>          }
> @@ -539,7 +539,7 @@ int xen_pt_msix_init(XenPCIPassthroughState *s, uint32_t base)
>      }
>  
>      if (id != PCI_CAP_ID_MSIX) {
> -        XEN_PT_ERR(d, "Invalid id %#x base %#x\n", id, base);
> +        XEN_PT_ERR(d, "Invalid id 0x%x base 0x%x\n", id, base);
>          return -1;
>      }
>  
> @@ -582,7 +582,7 @@ int xen_pt_msix_init(XenPCIPassthroughState *s, uint32_t base)
>          XEN_PT_ERR(d, "Can't open /dev/mem: %s\n", strerror(errno));
>          goto error_out;
>      }
> -    XEN_PT_LOG(d, "table_off = %#x, total_entries = %d\n",
> +    XEN_PT_LOG(d, "table_off = 0x%x, total_entries = %d\n",
>                 table_off, total_entries);
>      msix->table_offset_adjust = table_off & 0x0fff;
>      msix->phys_iomem_base =
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

