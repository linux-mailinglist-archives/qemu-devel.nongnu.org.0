Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9D2332B82
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 17:09:08 +0100 (CET)
Received: from localhost ([::1]:56974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJeux-0002OF-Om
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 11:09:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lJePG-0000s8-G4
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:36:22 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:63082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lJePC-0002Vx-MF
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:36:21 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D68197456E3;
 Tue,  9 Mar 2021 16:36:15 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id B1FF37456B8; Tue,  9 Mar 2021 16:36:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id B03E17456B7;
 Tue,  9 Mar 2021 16:36:15 +0100 (CET)
Date: Tue, 9 Mar 2021 16:36:15 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH RESEND 1/6] hw/mips/gt64xxx: Initialize ISD I/O memory
 region in DeviceRealize()
In-Reply-To: <20210309142630.728014-2-f4bug@amsat.org>
Message-ID: <f7f32dd5-67da-b8f0-6f5d-6c28c898b63@eik.bme.hu>
References: <20210309142630.728014-1-f4bug@amsat.org>
 <20210309142630.728014-2-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-2098251995-1615304175=:73634"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-2098251995-1615304175=:73634
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 9 Mar 2021, Philippe Mathieu-Daudé wrote:
> The ISD I/O region belongs to the TYPE_GT64120_PCI_HOST_BRIDGE,
> so initialize it before it is realized, not after.
> Rename the region as 'gt64120-isd' so it is clearer to realize
> it belongs to the GT64120 in the memory tree view.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

> ---
> hw/mips/gt64xxx_pci.c | 11 +++++++++--
> 1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
> index 588e6f99301..6eb73e77057 100644
> --- a/hw/mips/gt64xxx_pci.c
> +++ b/hw/mips/gt64xxx_pci.c
> @@ -1196,6 +1196,14 @@ static void gt64120_reset(DeviceState *dev)
>     gt64120_pci_mapping(s);
> }
>
> +static void gt64120_realize(DeviceState *dev, Error **errp)
> +{
> +    GT64120State *s = GT64120_PCI_HOST_BRIDGE(dev);
> +
> +    memory_region_init_io(&s->ISD_mem, OBJECT(dev), &isd_mem_ops, s,
> +                          "gt64120-isd", 0x1000);
> +}
> +
> PCIBus *gt64120_register(qemu_irq *pic)
> {
>     GT64120State *d;
> @@ -1214,8 +1222,6 @@ PCIBus *gt64120_register(qemu_irq *pic)
>                                      get_system_io(),
>                                      PCI_DEVFN(18, 0), 4, TYPE_PCI_BUS);
>     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> -    memory_region_init_io(&d->ISD_mem, OBJECT(dev), &isd_mem_ops, d,
> -                          "isd-mem", 0x1000);
>
>     pci_create_simple(phb->bus, PCI_DEVFN(0, 0), "gt64120_pci");
>     return phb->bus;
> @@ -1270,6 +1276,7 @@ static void gt64120_class_init(ObjectClass *klass, void *data)
>     DeviceClass *dc = DEVICE_CLASS(klass);
>
>     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
> +    dc->realize = gt64120_realize;
>     dc->reset = gt64120_reset;
>     dc->vmsd = &vmstate_gt64120;
> }
>
--3866299591-2098251995-1615304175=:73634--

