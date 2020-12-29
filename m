Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC5B2E70FC
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 14:48:50 +0100 (CET)
Received: from localhost ([::1]:44440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuFMn-0008QP-Bw
	for lists+qemu-devel@lfdr.de; Tue, 29 Dec 2020 08:48:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kuFLr-000812-E5
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 08:47:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kuFLo-0001Yy-W1
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 08:47:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609249667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LGoLWJHMyVmt0bqDOizt/l/3m7iQ+wxv3WTt50tO/oI=;
 b=UJb9vq0MWK4k6Vzc+Al0SQ5deWF0dm56alcAZQL7XawdO/MyfluB5G95CmYI1JA8TEmKEk
 UwgG45CJMV/nny5C4DZzIYwUaveawdtflhVUwhk9Bm+Yec1unA2XUBfMiHlbKcP6Gj+ZKD
 DWqqtClew8F1wuHWa0NFK0UQm9iP1hM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-tKI3s_eqO4mv-h3Hkl_Oiw-1; Tue, 29 Dec 2020 08:47:46 -0500
X-MC-Unique: tKI3s_eqO4mv-h3Hkl_Oiw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CAE48015C6;
 Tue, 29 Dec 2020 13:47:44 +0000 (UTC)
Received: from localhost (unknown [10.40.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D97360BE5;
 Tue, 29 Dec 2020 13:47:36 +0000 (UTC)
Date: Tue, 29 Dec 2020 14:47:35 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Jiahui Cen <cenjiahui@huawei.com>
Subject: Re: [PATCH v3 5/8] acpi/gpex: Append pxb devs in ascending order
Message-ID: <20201229144735.42faddad@redhat.com>
In-Reply-To: <20201223090836.9075-6-cenjiahui@huawei.com>
References: <20201223090836.9075-1-cenjiahui@huawei.com>
 <20201223090836.9075-6-cenjiahui@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 "Michael S. Tsirkin" <mst@redhat.com>, Ard Biesheuvel <ard.biesheuvel@arm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 wu.wubin@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 23 Dec 2020 17:08:33 +0800
Jiahui Cen <cenjiahui@huawei.com> wrote:

> The overlap check of IO resource window would fail when Linux kernel
> registers an IO resource [b, c) earlier than another resource [a, b).
> Though this incorrect check could be fixed by [1], it would be better to
> append pxb devs into DSDT table in ascending order.
> 
> [1]: https://lore.kernel.org/lkml/20201218062335.5320-1-cenjiahui@huawei.com/

considering there is acceptable fix for kernel I'd rather avoid
workarounds on QEMU side. So I suggest dropping this patch.

it also should reduce noise in [8/8] masking other changes.

> Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
> ---
>  hw/pci-host/gpex-acpi.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
> index 4bf1e94309..95a7a0f12b 100644
> --- a/hw/pci-host/gpex-acpi.c
> +++ b/hw/pci-host/gpex-acpi.c
> @@ -141,7 +141,7 @@ static void acpi_dsdt_add_pci_osc(Aml *dev)
>  void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>  {
>      int nr_pcie_buses = cfg->ecam.size / PCIE_MMCFG_SIZE_MIN;
> -    Aml *method, *crs, *dev, *rbuf;
> +    Aml *method, *crs, *dev, *rbuf, *pxb_devs[nr_pcie_buses];
>      PCIBus *bus = cfg->bus;
>      CrsRangeSet crs_range_set;
>      CrsRangeEntry *entry;
> @@ -149,6 +149,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>  
>      /* start to construct the tables for pxb */
>      crs_range_set_init(&crs_range_set);
> +    memset(pxb_devs, 0, sizeof(pxb_devs));
>      if (bus) {
>          QLIST_FOREACH(bus, &bus->child, sibling) {
>              uint8_t bus_num = pci_bus_num(bus);
> @@ -190,7 +191,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>  
>              acpi_dsdt_add_pci_osc(dev);
>  
> -            aml_append(scope, dev);
> +            pxb_devs[bus_num] = dev;
>          }
>      }
>  
> @@ -278,5 +279,11 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>      aml_append(dev, dev_res0);
>      aml_append(scope, dev);
>  
> +    for (i = 0; i < ARRAY_SIZE(pxb_devs); i++) {
> +        if (pxb_devs[i]) {
> +            aml_append(scope, pxb_devs[i]);
> +        }
> +    }
> +
>      crs_range_set_free(&crs_range_set);
>  }


