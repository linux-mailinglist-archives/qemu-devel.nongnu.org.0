Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E97F23B276C
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 08:32:55 +0200 (CEST)
Received: from localhost ([::1]:34554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwIv0-0006Ij-FT
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 02:32:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwIuE-0005cX-8H
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 02:32:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwIuA-0003Yb-MW
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 02:32:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624516320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WxTqOPBzp0JYfCU34peAjjLYT1yBxNYJFjFqbCloOYg=;
 b=QZ5WLV8fpDzbC9704A85CyfkWyVPV/p1xfFB5uSNfAkZtm0ls0P2JuIn4d6JnvdYNviowd
 4c6mmZ2aYD69mtuF9CRlYnMRsqmCHCuMs6MKPDq63lTPwal+P2BBlY7nmsbOX9omIpe4dA
 dtSbdzdWWbVPHQFlnLQVKfyYY8eZKxY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-sYjYHndCN561FgXC10NYQQ-1; Thu, 24 Jun 2021 02:31:58 -0400
X-MC-Unique: sYjYHndCN561FgXC10NYQQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 714CF18D6A38;
 Thu, 24 Jun 2021 06:31:57 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D683100AE35;
 Thu, 24 Jun 2021 06:31:56 +0000 (UTC)
Date: Thu, 24 Jun 2021 08:31:55 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Julia Suvorova <jusual@redhat.com>
Subject: Re: [PATCH] hw/pci/pcie_port: Rename "enable-native-hotplug" property
Message-ID: <20210624083155.5a69e5d1@redhat.com>
In-Reply-To: <20210623144747.285302-1-jusual@redhat.com>
References: <20210617190739.3673064-1-jusual@redhat.com>
 <20210623144747.285302-1-jusual@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 23 Jun 2021 16:47:47 +0200
Julia Suvorova <jusual@redhat.com> wrote:

> PCIE_SLOT property renamed to "native-hotplug" to be more concise
> and consistent with other properties.
> 
> Signed-off-by: Julia Suvorova <jusual@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/i386/pc_q35.c   | 4 ++--
>  hw/pci/pcie_port.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index a0ec7964cc..04b4a4788d 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -243,8 +243,8 @@ static void pc_q35_init(MachineState *machine)
>                                            NULL);
>  
>      if (acpi_pcihp) {
> -        object_register_sugar_prop(TYPE_PCIE_SLOT, "enable-native-hotplug",
> -                                  "false", true);
> +        object_register_sugar_prop(TYPE_PCIE_SLOT, "native-hotplug",
> +                                   "false", true);
>      }
>  
>      /* irq lines */
> diff --git a/hw/pci/pcie_port.c b/hw/pci/pcie_port.c
> index a410111825..da850e8dde 100644
> --- a/hw/pci/pcie_port.c
> +++ b/hw/pci/pcie_port.c
> @@ -148,7 +148,7 @@ static Property pcie_slot_props[] = {
>      DEFINE_PROP_UINT8("chassis", PCIESlot, chassis, 0),
>      DEFINE_PROP_UINT16("slot", PCIESlot, slot, 0),
>      DEFINE_PROP_BOOL("hotplug", PCIESlot, hotplug, true),
> -    DEFINE_PROP_BOOL("enable-native-hotplug", PCIESlot, native_hotplug, true),
> +    DEFINE_PROP_BOOL("native-hotplug", PCIESlot, native_hotplug, true),
>      DEFINE_PROP_END_OF_LIST()
>  };
>  


