Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D263C6BD6
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 10:01:24 +0200 (CEST)
Received: from localhost ([::1]:43362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3DM4-0000UD-0m
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 04:01:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m3DKa-00088A-T3
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 03:59:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m3DKX-0002Zo-TH
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 03:59:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626163187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qOBj8/hqvY/Rkt0+TuojCwl69M5srQjaSHf++d57ykM=;
 b=WMnqhJgV8FTs2jnrdP/KYBMfyWkpM4zq6UM6Ora25FWB9ng1Rnq+I4Uk1G6EhmUrP+K/69
 WcPnZyVifVp2/1wds8kTquTX04uR3egd0NhRysy6gl2K0eM31l1XYJ6zqpc2bM7N9ERjHE
 bnvHAQGLplGN/6fLrpj7pp//JegToHg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-ZYuQV99dPO6BBCShLvm_ow-1; Tue, 13 Jul 2021 03:59:46 -0400
X-MC-Unique: ZYuQV99dPO6BBCShLvm_ow-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B5821084F55;
 Tue, 13 Jul 2021 07:59:45 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 282165C232;
 Tue, 13 Jul 2021 07:59:32 +0000 (UTC)
Date: Tue, 13 Jul 2021 09:59:31 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Julia Suvorova <jusual@redhat.com>
Subject: Re: [PATCH v6 5/6] hw/acpi/ich9: Set ACPI PCI hot-plug as default
 on Q35
Message-ID: <20210713095931.61fa1281@redhat.com>
In-Reply-To: <20210713004205.775386-6-jusual@redhat.com>
References: <20210713004205.775386-1-jusual@redhat.com>
 <20210713004205.775386-6-jusual@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: David Gibson <dgibson@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 13 Jul 2021 02:42:04 +0200
Julia Suvorova <jusual@redhat.com> wrote:

> Q35 has three different types of PCI devices hot-plug: PCIe Native,
> SHPC Native and ACPI hot-plug. This patch changes the default choice
> for cold-plugged bridges from PCIe Native to ACPI Hot-plug with
> ability to use SHPC and PCIe Native for hot-plugged bridges.

Before we flip the switch,
has the issue about not hotplug ports not getting IO (Michael)
been addressed, if not are there any plans to fix it?


> This is a list of the PCIe Native hot-plug issues that led to this
> change:
>     * no racy behavior during boot (see 110c477c2ed)
>     * no delay during deleting - after the actual power off software
>       must wait at least 1 second before indicating about it. This case
>       is quite important for users, it even has its own bug:
>           https://bugzilla.redhat.com/show_bug.cgi?id=1594168
>     * no timer-based behavior - in addition to the previous example,
>       the attention button has a 5-second waiting period, during which
>       the operation can be canceled with a second press. While this
>       looks fine for manual button control, automation will result in
>       the need to queue or drop events, and the software receiving
>       events in all sort of unspecified combinations of attention/power
>       indicator states, which is racy and uppredictable.
>     * fixes:
>         * https://bugzilla.redhat.com/show_bug.cgi?id=1752465
>         * https://bugzilla.redhat.com/show_bug.cgi?id=1690256
> 
> To return to PCIe Native hot-plug:
>     -global ICH9-LPC.acpi-pci-hotplug-with-bridge-support=off
> 
> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/acpi/ich9.c | 2 +-
>  hw/i386/pc.c   | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> index 2f4eb453ac..778e27b659 100644
> --- a/hw/acpi/ich9.c
> +++ b/hw/acpi/ich9.c
> @@ -427,7 +427,7 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
>      pm->disable_s3 = 0;
>      pm->disable_s4 = 0;
>      pm->s4_val = 2;
> -    pm->use_acpi_hotplug_bridge = false;
> +    pm->use_acpi_hotplug_bridge = true;
>  
>      object_property_add_uint32_ptr(obj, ACPI_PM_PROP_PM_IO_BASE,
>                                     &pm->pm_io_base, OBJ_PROP_FLAG_READ);
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 8e1220db72..7e03848792 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -98,6 +98,7 @@ GlobalProperty pc_compat_6_0[] = {
>      { "qemu64" "-" TYPE_X86_CPU, "family", "6" },
>      { "qemu64" "-" TYPE_X86_CPU, "model", "6" },
>      { "qemu64" "-" TYPE_X86_CPU, "stepping", "3" },
> +    { "ICH9-LPC", "acpi-pci-hotplug-with-bridge-support", "off" },
>  };
>  const size_t pc_compat_6_0_len = G_N_ELEMENTS(pc_compat_6_0);
>  


