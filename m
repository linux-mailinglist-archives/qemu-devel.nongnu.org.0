Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 716E82E70F4
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 14:43:22 +0100 (CET)
Received: from localhost ([::1]:41542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuFHV-0006yD-BR
	for lists+qemu-devel@lfdr.de; Tue, 29 Dec 2020 08:43:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kuFGB-00061X-2i
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 08:41:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kuFG9-00083t-7p
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 08:41:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609249316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g+f0ofTtGZsLxxLL8Vf0xYLhkzVW+Plkg0sZnx0jaRM=;
 b=YnPDle0Hs8TtoIgUKFUWA1SsyYRRElBtxeoLGIkii9lEvpPqfOzaXPKuasg9tFjZH8kyXO
 b9xq0lSI+c3+SMbUZirdK3ZpiNIec33Ke8xya/6xKcFlmRgLzXRNwBwiUomxeA4E+shJoA
 X2Z1J9uZ+MbsYdj+JM5hOr6BGmVJccU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-LPvRSCF0NjOa6jyUBywhuQ-1; Tue, 29 Dec 2020 08:41:52 -0500
X-MC-Unique: LPvRSCF0NjOa6jyUBywhuQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA770800D53;
 Tue, 29 Dec 2020 13:41:50 +0000 (UTC)
Received: from localhost (unknown [10.40.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C42F110013C1;
 Tue, 29 Dec 2020 13:41:44 +0000 (UTC)
Date: Tue, 29 Dec 2020 14:41:42 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Jiahui Cen <cenjiahui@huawei.com>
Subject: Re: [PATCH v3 3/8] acpi/gpex: Inform os to keep firmware resource map
Message-ID: <20201229144142.66583852@redhat.com>
In-Reply-To: <20201223090836.9075-4-cenjiahui@huawei.com>
References: <20201223090836.9075-1-cenjiahui@huawei.com>
 <20201223090836.9075-4-cenjiahui@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: xieyingtai@huawei.com, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Ard Biesheuvel <ard.biesheuvel@arm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, wu.wubin@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 23 Dec 2020 17:08:31 +0800
Jiahui Cen <cenjiahui@huawei.com> wrote:

> There may be some differences in pci resource assignment between guest os
> and firmware.
> 
> Eg. A Bridge with Bus [d2]
>     -+-[0000:d2]---01.0-[d3]----01.0
> 
>     where [d2:01.00] is a pcie-pci-bridge with BAR0 (mem, 64-bit, non-pref) [size=256]
>           [d3:01.00] is a PCI Device with BAR0 (mem, 64-bit, pref) [size=128K]
>                                           BAR4 (mem, 64-bit, pref) [size=64M]
> 
>     In EDK2, the Resource Map would be:
>         PciBus: Resource Map for Bridge [D2|01|00]
>         Type = PMem64; Base = 0x8004000000;     Length = 0x4100000;     Alignment = 0x3FFFFFF
>            Base = 0x8004000000; Length = 0x4000000;     Alignment = 0x3FFFFFF;  Owner = PCI [D3|01|00:20]
>            Base = 0x8008000000; Length = 0x20000;       Alignment = 0x1FFFF;    Owner = PCI [D3|01|00:10]
>         Type =  Mem64; Base = 0x8008100000;     Length = 0x100; Alignment = 0xFFF
>     It would use 0x4100000 to calculate the root bus's PMem64 resource window.
> 
>     While in Linux, kernel will use 0x1FFFFFF as the alignment to calculate
>     the PMem64 size, which would be 0x6000000. So kernel would try to
>     allocate 0x6000000 from the PMem64 resource window, but since the window
>     size is 0x4100000 as assigned by EDK2, the allocation would fail.
> 
> The diffences could result in resource assignment failure.
> 
> Using _DSM #5 method to inform guest os not to ignore the PCI configuration
> that firmware has done at boot time could handle the differences.

I'm not sure about this one, 
OS should able to reconfigure PCI resources according to what and where is plugged
(and it even more true is hotplug is taken into account)

> 
> Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
> ---
>  hw/pci-host/gpex-acpi.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
> index 11b3db8f71..c189306599 100644
> --- a/hw/pci-host/gpex-acpi.c
> +++ b/hw/pci-host/gpex-acpi.c
> @@ -112,10 +112,24 @@ static void acpi_dsdt_add_pci_osc(Aml *dev)
>      UUID = aml_touuid("E5C937D0-3553-4D7A-9117-EA4D19C3434D");
>      ifctx = aml_if(aml_equal(aml_arg(0), UUID));
>      ifctx1 = aml_if(aml_equal(aml_arg(2), aml_int(0)));
> -    uint8_t byte_list[1] = {1};
> -    buf = aml_buffer(1, byte_list);
> +    uint8_t byte_list[] = {
> +                0x1 << 0 /* support for functions other than function 0 */ |
> +                0x1 << 5 /* support for function 5 */
> +                };
> +    buf = aml_buffer(ARRAY_SIZE(byte_list), byte_list);
>      aml_append(ifctx1, aml_return(buf));
>      aml_append(ifctx, ifctx1);
> +
> +    /* PCI Firmware Specification 3.1
> +     * 4.6.5. _DSM for Ignoring PCI Boot Configurations
> +     */
> +    /* Arg2: Function Index: 5 */
> +    ifctx1 = aml_if(aml_equal(aml_arg(2), aml_int(5)));
> +    /* 0 - The operating system must not ignore the PCI configuration that
> +     *     firmware has done at boot time.
> +     */
> +    aml_append(ifctx1, aml_return(aml_int(0)));
> +    aml_append(ifctx, ifctx1);
>      aml_append(method, ifctx);
>  
>      byte_list[0] = 0;


