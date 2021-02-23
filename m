Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE1D322C3A
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 15:28:55 +0100 (CET)
Received: from localhost ([::1]:57120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEYgI-0003xU-47
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 09:28:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lEYf1-0002uo-Go
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 09:27:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lEYez-0001TE-Dv
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 09:27:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614090452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0gilvtKA7f6+D9JKQBNnpXLkyH5kc0OgxQBMZTqEvM8=;
 b=UChK8PrAybMPOLbZK1BwtaJUKbp/bmtUMKZxGXFQo2iScWCEKLZWVLUpI8xWYSn4qlkpgU
 +vhowcLuFENlKdEILQTsFk+3IZYf+f5tBH1E/oZoIcqVf7L+HZZK6Pr7DD/4KrAp5Sxolw
 xZYE2Or72Ey4F4toS25TQOnwkGcI/Jk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-VZBul1ZWMxWquu1qIWj_2A-1; Tue, 23 Feb 2021 09:27:28 -0500
X-MC-Unique: VZBul1ZWMxWquu1qIWj_2A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 108681092128;
 Tue, 23 Feb 2021 14:22:29 +0000 (UTC)
Received: from localhost (unknown [10.40.208.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 971DF68D22;
 Tue, 23 Feb 2021 14:22:21 +0000 (UTC)
Date: Tue, 23 Feb 2021 15:22:19 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: isaku.yamahata@gmail.com
Subject: Re: [PATCH v5 03/10] ich9, piix4: add properoty, smm-compat, to
 keep compatibility of SMM
Message-ID: <20210223152219.5711d4db@redhat.com>
In-Reply-To: <47254ae0b8c6cc6945422978b6b2af2d213ef891.1613615732.git.isaku.yamahata@intel.com>
References: <cover.1613615732.git.isaku.yamahata@intel.com>
 <47254ae0b8c6cc6945422978b6b2af2d213ef891.1613615732.git.isaku.yamahata@intel.com>
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
Cc: isaku.yamahata@intel.com, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 17 Feb 2021 21:51:11 -0800
isaku.yamahata@gmail.com wrote:

subj: s/properoty/property/

perhaps Michael can fix it up when merging  

> From: Isaku Yamahata <isaku.yamahata@intel.com>
> 
> The following patch will introduce incompatible behavior of SMM.
> Introduce a property to keep the old behavior for compatibility.
> To enable smm compat, use "-global ICH9-LPC.smm-compat=on" or
> "-global PIIX4_PM.smm-compat=on"
> 
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/piix4.c        | 2 ++
>  hw/isa/lpc_ich9.c      | 1 +
>  include/hw/acpi/ich9.h | 1 +
>  3 files changed, 4 insertions(+)
> 
> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index 669be5bbf6..30dd9b2309 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -74,6 +74,7 @@ struct PIIX4PMState {
>      qemu_irq irq;
>      qemu_irq smi_irq;
>      int smm_enabled;
> +    bool smm_compat;
>      Notifier machine_ready;
>      Notifier powerdown_notifier;
>  
> @@ -642,6 +643,7 @@ static Property piix4_pm_properties[] = {
>                       use_acpi_root_pci_hotplug, true),
>      DEFINE_PROP_BOOL("memory-hotplug-support", PIIX4PMState,
>                       acpi_memory_hotplug.is_enabled, true),
> +    DEFINE_PROP_BOOL("smm-compat", PIIX4PMState, smm_compat, false),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
> index d3145bf014..3963b73520 100644
> --- a/hw/isa/lpc_ich9.c
> +++ b/hw/isa/lpc_ich9.c
> @@ -775,6 +775,7 @@ static const VMStateDescription vmstate_ich9_lpc = {
>  
>  static Property ich9_lpc_properties[] = {
>      DEFINE_PROP_BOOL("noreboot", ICH9LPCState, pin_strap.spkr_hi, true),
> +    DEFINE_PROP_BOOL("smm-compat", ICH9LPCState, pm.smm_compat, false),
>      DEFINE_PROP_BIT64("x-smi-broadcast", ICH9LPCState, smi_host_features,
>                        ICH9_LPC_SMI_F_BROADCAST_BIT, true),
>      DEFINE_PROP_BIT64("x-smi-cpu-hotplug", ICH9LPCState, smi_host_features,
> diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
> index 54571c77e0..df519e40b5 100644
> --- a/include/hw/acpi/ich9.h
> +++ b/include/hw/acpi/ich9.h
> @@ -59,6 +59,7 @@ typedef struct ICH9LPCPMRegs {
>      uint8_t disable_s4;
>      uint8_t s4_val;
>      uint8_t smm_enabled;
> +    bool smm_compat;
>      bool enable_tco;
>      TCOIORegs tco_regs;
>  } ICH9LPCPMRegs;


