Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C580B37171C
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 16:53:46 +0200 (CEST)
Received: from localhost ([::1]:58414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldZxB-0001c9-TL
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 10:53:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ldZvt-0000xL-UF
 for qemu-devel@nongnu.org; Mon, 03 May 2021 10:52:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ldZvr-0001qB-I8
 for qemu-devel@nongnu.org; Mon, 03 May 2021 10:52:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620053541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q9lRygg3O1Vna+CjcMEDBmDYghtC/Tzs5YmF25gcO04=;
 b=d7MwfW2dM5DhfOczENoVtWs7N8zpwR3VQUgBj7xkgvKIdFi3lARwYGYVIpm0Nak1c3WoXr
 WDbawpMlAONsxMHwWMcUJsFMnY+9V2Z6ifm+Ob9/Z77s4IdYnFtTmF/rh3bI0vDmig2Oq5
 BBfjflu1/yXvjkXlaes3R8I2dVUFokQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-6QEEGhAmNTanxkCqStVgJQ-1; Mon, 03 May 2021 10:52:18 -0400
X-MC-Unique: 6QEEGhAmNTanxkCqStVgJQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58419189DF50;
 Mon,  3 May 2021 14:52:17 +0000 (UTC)
Received: from localhost (unknown [10.40.208.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E88360C5C;
 Mon,  3 May 2021 14:52:11 +0000 (UTC)
Date: Mon, 3 May 2021 16:52:09 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Subject: Re: [PATCH RESEND] pc-dimm: remove unnecessary
 get_vmstate_memory_region() method
Message-ID: <20210503165209.1debdb06@redhat.com>
In-Reply-To: <f42da25471dc4b967796642388294e61e6587047.1619303649.git.maciej.szmigiero@oracle.com>
References: <f42da25471dc4b967796642388294e61e6587047.1619303649.git.maciej.szmigiero@oracle.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 25 Apr 2021 14:11:36 +0200
"Maciej S. Szmigiero" <mail@maciej.szmigiero.name> wrote:

> From: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
> 
> The get_vmstate_memory_region() method from PCDIMMDeviceClass is only
> ever called from this class and is never overridden, so it can be converted
> into an ordinary function.
> This saves us from having to do an indirect call in order to reach it.
> 
> Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/mem/pc-dimm.c         | 33 ++++++++++++++-------------------
>  include/hw/mem/pc-dimm.h |  5 -----
>  2 files changed, 14 insertions(+), 24 deletions(-)
> 
> diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
> index 12b655eda8b8..a3a2560301cb 100644
> --- a/hw/mem/pc-dimm.c
> +++ b/hw/mem/pc-dimm.c
> @@ -34,6 +34,16 @@
>  
>  static int pc_dimm_get_free_slot(const int *hint, int max_slots, Error **errp);
>  
> +static MemoryRegion *pc_dimm_get_memory_region(PCDIMMDevice *dimm, Error **errp)
> +{
> +    if (!dimm->hostmem) {
> +        error_setg(errp, "'" PC_DIMM_MEMDEV_PROP "' property must be set");
> +        return NULL;
> +    }
> +
> +    return host_memory_backend_get_memory(dimm->hostmem);
> +}
> +
>  void pc_dimm_pre_plug(PCDIMMDevice *dimm, MachineState *machine,
>                        const uint64_t *legacy_align, Error **errp)
>  {
> @@ -66,9 +76,8 @@ void pc_dimm_pre_plug(PCDIMMDevice *dimm, MachineState *machine,
>  
>  void pc_dimm_plug(PCDIMMDevice *dimm, MachineState *machine)
>  {
> -    PCDIMMDeviceClass *ddc = PC_DIMM_GET_CLASS(dimm);
> -    MemoryRegion *vmstate_mr = ddc->get_vmstate_memory_region(dimm,
> -                                                              &error_abort);
> +    MemoryRegion *vmstate_mr = pc_dimm_get_memory_region(dimm,
> +                                                         &error_abort);
>  
>      memory_device_plug(MEMORY_DEVICE(dimm), machine);
>      vmstate_register_ram(vmstate_mr, DEVICE(dimm));
> @@ -76,9 +85,8 @@ void pc_dimm_plug(PCDIMMDevice *dimm, MachineState *machine)
>  
>  void pc_dimm_unplug(PCDIMMDevice *dimm, MachineState *machine)
>  {
> -    PCDIMMDeviceClass *ddc = PC_DIMM_GET_CLASS(dimm);
> -    MemoryRegion *vmstate_mr = ddc->get_vmstate_memory_region(dimm,
> -                                                              &error_abort);
> +    MemoryRegion *vmstate_mr = pc_dimm_get_memory_region(dimm,
> +                                                         &error_abort);
>  
>      memory_device_unplug(MEMORY_DEVICE(dimm), machine);
>      vmstate_unregister_ram(vmstate_mr, DEVICE(dimm));
> @@ -205,16 +213,6 @@ static void pc_dimm_unrealize(DeviceState *dev)
>      host_memory_backend_set_mapped(dimm->hostmem, false);
>  }
>  
> -static MemoryRegion *pc_dimm_get_memory_region(PCDIMMDevice *dimm, Error **errp)
> -{
> -    if (!dimm->hostmem) {
> -        error_setg(errp, "'" PC_DIMM_MEMDEV_PROP "' property must be set");
> -        return NULL;
> -    }
> -
> -    return host_memory_backend_get_memory(dimm->hostmem);
> -}
> -
>  static uint64_t pc_dimm_md_get_addr(const MemoryDeviceState *md)
>  {
>      return object_property_get_uint(OBJECT(md), PC_DIMM_ADDR_PROP,
> @@ -266,7 +264,6 @@ static void pc_dimm_md_fill_device_info(const MemoryDeviceState *md,
>  static void pc_dimm_class_init(ObjectClass *oc, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(oc);
> -    PCDIMMDeviceClass *ddc = PC_DIMM_CLASS(oc);
>      MemoryDeviceClass *mdc = MEMORY_DEVICE_CLASS(oc);
>  
>      dc->realize = pc_dimm_realize;
> @@ -274,8 +271,6 @@ static void pc_dimm_class_init(ObjectClass *oc, void *data)
>      device_class_set_props(dc, pc_dimm_properties);
>      dc->desc = "DIMM memory module";
>  
> -    ddc->get_vmstate_memory_region = pc_dimm_get_memory_region;
> -
>      mdc->get_addr = pc_dimm_md_get_addr;
>      mdc->set_addr = pc_dimm_md_set_addr;
>      /* for a dimm plugged_size == region_size */
> diff --git a/include/hw/mem/pc-dimm.h b/include/hw/mem/pc-dimm.h
> index 3d3db82641f8..1473e6db6254 100644
> --- a/include/hw/mem/pc-dimm.h
> +++ b/include/hw/mem/pc-dimm.h
> @@ -56,9 +56,6 @@ struct PCDIMMDevice {
>   * PCDIMMDeviceClass:
>   * @realize: called after common dimm is realized so that the dimm based
>   * devices get the chance to do specified operations.
> - * @get_vmstate_memory_region: returns #MemoryRegion which indicates the
> - * memory of @dimm should be kept during live migration. Will not fail
> - * after the device was realized.
>   */
>  struct PCDIMMDeviceClass {
>      /* private */
> @@ -66,8 +63,6 @@ struct PCDIMMDeviceClass {
>  
>      /* public */
>      void (*realize)(PCDIMMDevice *dimm, Error **errp);
> -    MemoryRegion *(*get_vmstate_memory_region)(PCDIMMDevice *dimm,
> -                                               Error **errp);
>  };
>  
>  void pc_dimm_pre_plug(PCDIMMDevice *dimm, MachineState *machine,
> 


