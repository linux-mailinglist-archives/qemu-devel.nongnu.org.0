Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 597FE6D40B7
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 11:34:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjGYt-0006fL-W9; Mon, 03 Apr 2023 05:33:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=450632f3c=anthony.perard@citrix.com>)
 id 1pjGYb-0006eg-V3
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 05:33:06 -0400
Received: from esa4.hc3370-68.iphmx.com ([216.71.155.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=450632f3c=anthony.perard@citrix.com>)
 id 1pjGYX-0008Rx-US
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 05:32:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1680514373;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=T2DC+/OPrwDbeBS4v/+rJb1xT1/fC0TmvToGkyyaFpk=;
 b=fdUGg+qYMIIew3IUdJZfcweVBVTsARbMxwr9b78j4ugkW/AE4cw/Z25X
 PokLCjG7cUSsTiTfVyHJPoCdvjJ96aJeUfeBPY7179VDsJGSmMiEg0f3E
 jGa+xQODXE24MiyP1L1FHtdA+3KHxCJtUjd6Jd9qYj1yK0GOb7dpLkUQC 4=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 106520249
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:l8VL2aqdlaonzn1/kayP8Vs8ttleBmILYhIvgKrLsJaIsI4StFCzt
 garIBmAOPvcZ2OmL4t3YI6x8kIE6sXTz9MyQFFk/CFnEC8Qo5uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WNwUmAWP6gR5weCzyJNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABdKNTOanOKn+oKASfhF1uYpF5jFPKpK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVRrk6VoqwmpXDe1gVr3JDmMcbPe8zMTsJQ9qqdj
 jueoTmjWktGZbRzzxKp+XLrhtfQkRn7e6g1KIGU/+ZYvEaqkzl75Bo+CgLg/KjRZlSFc8lfJ
 koI9zsGoq079UjtRd74NzWhrXuZ+xIRRddUO+s97g6L1+zT+QnxLm0NVDVMbJovrME7QTYjy
 1qhkNbgBDgpu7qQIVqF/LCSvzK0OAAPIGMCbDNCRgwAi/Hvv4QsphvKR8RkFui+iZvoGlnYw
 yiNsTMlhrM7l8MC3Lm85hbAmT3EjpHUVAMx5wjRdmu49A59P9TjYYG0gXDW4etJNoqeZlmIt
 nsDgNTY6u0SZbmVnTGJaPUAGveu/fntGC3RhxtjEocs8xyp+mW/ZsZA7TdmPkBrP80YPzjzb
 yf7vBhNzIVeMHujcel8ZIfZI98x0aHqGNDhV/bVRtlDeJ58cEmA5i4GTVSR1GDkikRqkaw5N
 ZqBasGqJXIbD619y3yxXeh1+acrxyQ7yUvXRJby1RPh1qCRDFafU7wFLVCNfMgw66fCqwLQm
 /5WL8aQwg9TePH/aCLQt4UUKDg3wWMTXM6s7ZYNL6jaf1QgQTt6YxPM/V8/U6sixIdMjefZx
 EGGWV5xmHj1vizpKSzfPxiPd4jTsYZDQWMTZHJ8ZQzzhyh+Me5D/49EKcJpIOBPGPhLiKctE
 qJbI5jo7uFnEGyvxtgLUXXqQGWOnjyPjBnGASeqaSNXk3VIF12QoY+MkucCGUAz4suLWSgW+
 efIOvvzG8ZreuibJJ++hAiT512wp2MBv+l5QlHFJNJeEG21rtgyd3Kp0qFueptVQfkm+td9/
 1/PaSr0WMGX+9NlmDU3rfvsQ3iV/xtWQRMBQjizAUeePijG5GuzqbJ9vBKzVWmFDgvcofzyD
 di5OtmgaJXran4W6dsje1uqpIpij+bSS0hylVg1RiSVNQ3zUtuN4BCuhKFyi0GE/ZcB0SPeZ
 65F0oMy1WmhUC89LGMsGQ==
IronPort-HdrOrdr: A9a23:MrQ0wais0fnonQkgXQQkTigvOnBQXisji2hC6mlwRA09TyXPrb
 HJoB17726XtN91YhpLpTnuAtj5fZqiz+8P3WB8B9qftUzd2FdAT7sSiLcKoQeAJ8SWzIc06U
 4jSdkcNDSXNzRHZK3BjjVQfexO/DCPytHTuc7ui01pRQtpL41m8gtjEx2aCEEzZCQuP+tcKL
 OsovBDrzCjPVAadN6yCHVAf8WrnayzqLvWJSQCDxQkrDSDhTftyJOSKWn+4isj
X-IronPort-AV: E=Sophos;i="5.98,314,1673931600"; d="scan'208";a="106520249"
Date: Mon, 3 Apr 2023 10:32:37 +0100
To: Bernhard Beschow <shentey@gmail.com>
CC: <qemu-devel@nongnu.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Woodhouse <dwmw@amazon.co.uk>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>, Aurelien Jarno
 <aurelien@aurel32.net>, Eduardo Habkost <eduardo@habkost.net>, Paul Durrant
 <paul@xen.org>, <xen-devel@lists.xenproject.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Richard
 Henderson <richard.henderson@linaro.org>, Philippe
 =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Chuck Zmudzinski
 <brchuckz@aol.com>
Subject: Re: [PATCH v3 2/6] hw/isa/piix3: Reuse piix3_realize() in
 piix3_xen_realize()
Message-ID: <622b9674-fffd-4634-ac30-d0db3230478e@perard>
References: <20230312120221.99183-1-shentey@gmail.com>
 <20230312120221.99183-3-shentey@gmail.com>
 <f52c41f7-e662-4afd-8ac9-ce2c0da2b1be@perard>
 <7F45B51F-F1E3-4F04-A46F-4C80509C7195@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7F45B51F-F1E3-4F04-A46F-4C80509C7195@gmail.com>
Received-SPF: pass client-ip=216.71.155.144;
 envelope-from=prvs=450632f3c=anthony.perard@citrix.com;
 helo=esa4.hc3370-68.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, Apr 01, 2023 at 10:36:45PM +0000, Bernhard Beschow wrote:
> 
> 
> Am 30. März 2023 13:00:25 UTC schrieb Anthony PERARD <anthony.perard@citrix.com>:
> >On Sun, Mar 12, 2023 at 01:02:17PM +0100, Bernhard Beschow wrote:
> >> This is a preparational patch for the next one to make the following
> >> more obvious:
> >> 
> >> First, pci_bus_irqs() is now called twice in case of Xen where the
> >> second call overrides the pci_set_irq_fn with the Xen variant.
> >
> >pci_bus_irqs() does allocates pci_bus->irq_count, so the second call in
> >piix3_xen_realize() will leak `pci_bus->irq_count`. Could you look if
> >pci_bus_irqs_cleanup() can be called before the second pci_bus_irqs()
> >call, or maybe some other way to avoid the leak?
> 
> Thanks for catching this! I'll post a v4.
> 
> I think the most fool-proof way to fix this is to free irq_count just before the assignment. pci_bus_irqs_cleanup() would then have to NULL the attribute such that pci_bus_irqs() can be called afterwards.
> 
> BTW: I tried running qemu-system-x86_64 with PIIX4 rather than PIIX3 as Xen guest with my pc-piix4 branch without success. This branch essentially just provides slightly different PCI IDs for PIIX. Does xl or something else in Xen check these? If not then this means I'm still missing something. Under KVM this branch works just fine. Any idea?

Maybe the ACPI tables provided by libxl needs to be updated.
Or maybe something in the firmware (SeaBIOS or OVMF/OvmfXen) check the
id (I know that the PCI id of the root bus is checked, but I don't know
if that's the one that's been changed).

Thanks,

-- 
Anthony PERARD

