Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D7938B233
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 16:49:23 +0200 (CEST)
Received: from localhost ([::1]:40528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljjzG-0004hc-AN
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 10:49:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ljjak-0008WQ-DB
 for qemu-devel@nongnu.org; Thu, 20 May 2021 10:24:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ljjah-0006MG-FH
 for qemu-devel@nongnu.org; Thu, 20 May 2021 10:24:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621520638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KTi//mjCqnBzz6Y3sA+wHLQW/qw0zDc8rhE7GVTCcuA=;
 b=R8K+/G95eoNwitN8u/O31JqpgLwbB8P0EKQxw6gLa9Gq+uuZMNMsNMv967RYdgFVnwK83A
 R/trSeJ0OW1EW8hx+0nPXmgCdn5CuSzBTdQG/nfWF31NRyppLYZXBrxcK/hHPecygP3xBN
 /Ku3/Z8MOtBLDgwjrqAS5j5GxvkbH+Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-oyZfSQYLMPOspQJkmGhfTA-1; Thu, 20 May 2021 10:23:54 -0400
X-MC-Unique: oyZfSQYLMPOspQJkmGhfTA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0F9780295C
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 14:23:43 +0000 (UTC)
Received: from localhost (unknown [10.40.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44EBD648A9;
 Thu, 20 May 2021 14:23:42 +0000 (UTC)
Date: Thu, 20 May 2021 16:23:41 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Julia Suvorova <jusual@redhat.com>
Subject: Re: [RFC PATCH v4 6/7] hw/acpi/ich9: Set ACPI PCI hot-plug as
 default on Q35
Message-ID: <20210520162341.3a5f549c@redhat.com>
In-Reply-To: <20210513062642.3027987-7-jusual@redhat.com>
References: <20210513062642.3027987-1-jusual@redhat.com>
 <20210513062642.3027987-7-jusual@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 13 May 2021 08:26:41 +0200
Julia Suvorova <jusual@redhat.com> wrote:

> Q35 has three different types of PCI devices hot-plug: PCIe Native,
> SHPC Native and ACPI hot-plug. This patch changes the default choice
> for cold-plugged bridges from PCIe Native to ACPI Hot-plug with
> ability to use SHPC and PCIe Native for hot-plugged bridges.
> 
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
>     * fixes or reduces the likelihood of the bug:
>         * https://bugzilla.redhat.com/show_bug.cgi?id=1833187
>         * https://bugzilla.redhat.com/show_bug.cgi?id=1657077
>         * https://bugzilla.redhat.com/show_bug.cgi?id=1669931
>         * https://bugzilla.redhat.com/show_bug.cgi?id=1678290
> 
> To return to PCIe Native hot-plug:
>     -global ICH9-LPC.acpi-pci-hotplug-with-bridge-support=off
> 
> Signed-off-by: Julia Suvorova <jusual@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/ich9.c | 2 +-
>  hw/i386/pc.c   | 4 +++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> index f6819c4f2a..e7b2cd9719 100644
> --- a/hw/acpi/ich9.c
> +++ b/hw/acpi/ich9.c
> @@ -425,7 +425,7 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
>      pm->disable_s3 = 0;
>      pm->disable_s4 = 0;
>      pm->s4_val = 2;
> -    pm->use_acpi_hotplug_bridge = false;
> +    pm->use_acpi_hotplug_bridge = true;
>  
>      object_property_add_uint32_ptr(obj, ACPI_PM_PROP_PM_IO_BASE,
>                                     &pm->pm_io_base, OBJ_PROP_FLAG_READ);
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 8cfaf216e7..5c2d3d11a2 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -94,7 +94,9 @@
>  #include "trace.h"
>  #include CONFIG_DEVICES
>  
> -GlobalProperty pc_compat_6_0[] = {};
> +GlobalProperty pc_compat_6_0[] = {
> +    { "ICH9-LPC", "acpi-pci-hotplug-with-bridge-support", "off" },
> +};
>  const size_t pc_compat_6_0_len = G_N_ELEMENTS(pc_compat_6_0);
>  
>  GlobalProperty pc_compat_5_2[] = {


