Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2F73BF1F4
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 00:19:26 +0200 (CEST)
Received: from localhost ([::1]:49248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Ft6-0007oL-Kh
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 18:19:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1m1Fry-00077X-Tx
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 18:18:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1m1Fru-0004Zm-NR
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 18:18:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625696288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WRZ4jISY00Eyjc4K9kPmM5pWq4Lr6zHdez9vJurhrUM=;
 b=ROrlTBjkHgbrYWgaikKpDW2kW4nf6Un0VdvjPVim96AI0NxtQe9Hqmr1wtn5cff3Ui8h+3
 8cyB8ClNbh6uM73BALMAXlIluXKVPUAXokzvuTobbk+rXKKytRHffOJDBIS2Zrj8WcpiCr
 zEOWr/Zml46uOpNJc8L0ZmIqnidm6Oc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-fvGvDfyWP4eV7baZiD_qiA-1; Wed, 07 Jul 2021 18:18:06 -0400
X-MC-Unique: fvGvDfyWP4eV7baZiD_qiA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 335C51005E4C;
 Wed,  7 Jul 2021 22:18:05 +0000 (UTC)
Received: from starship (unknown [10.40.192.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5548D10016F4;
 Wed,  7 Jul 2021 22:17:51 +0000 (UTC)
Message-ID: <a4006a17ddd5d2a4092c7b64b73ca69f62defb35.camel@redhat.com>
Subject: Re: [PATCH v2] docs: Add '-device intel-iommu' entry
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
Date: Thu, 08 Jul 2021 01:17:50 +0300
In-Reply-To: <20210707154114.197580-1-peterx@redhat.com>
References: <20210707154114.197580-1-peterx@redhat.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Cc: Yi Liu <yi.l.liu@intel.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
 Lei Yang <leiyang@redhat.com>, Jing Zhao <jinzhao@redhat.com>,
 Chao Yang <chayang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2021-07-07 at 11:41 -0400, Peter Xu wrote:
> The parameters of intel-iommu device are non-trivial to understand.  Add an
> entry for it so that people can reference to it when using.
> 
> There're actually a few more options there, but I hide them explicitly because
> they shouldn't be used by normal QEMU users.
> 
> Cc: Chao Yang <chayang@redhat.com>
> Cc: Lei Yang <leiyang@redhat.com>
> Cc: Jing Zhao <jinzhao@redhat.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Reviewed-by: Jason Wang <jasowang@redhat.com>
> Reviewed-by: Yi Liu <yi.l.liu@intel.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
> v2:
> - Drop "in the guest" in intremap entry [Jason]
> - Explain how the default value of intremap is chosen [Eric]
> - Add r-bs for Jason and Yi
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  qemu-options.hx | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 8965dabc83..0fcc8973dd 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -926,6 +926,39 @@ SRST
>  
>  ``-device pci-ipmi-bt,bmc=id``
>      Like the KCS interface, but defines a BT interface on the PCI bus.
> +
> +``-device intel-iommu[,option=...]``
> +    This is only supported by ``-machine q35``, which will enable Intel VT-d
> +    emulation within the guest.  It supports below options:
> +
> +    ``intremap=on|off`` (default: auto)
> +        This enables interrupt remapping feature.  It's required to enable
> +        complete x2apic.  Currently it only supports kvm kernel-irqchip modes
> +        ``off`` or ``split``, while full kernel-irqchip is not yet supported.
> +        The default value is "auto", which will be decided by the mode of
> +        kernel-irqchip.
> +
> +    ``caching-mode=on|off`` (default: off)
> +        This enables caching mode for the VT-d emulated device.  When
> +        caching-mode is enabled, each guest DMA buffer mapping will generate an
> +        IOTLB invalidation from the guest IOMMU driver to the vIOMMU device in
> +        a synchronous way.  It is required for ``-device vfio-pci`` to work
> +        with the VT-d device, because host assigned devices requires to setup
> +        the DMA mapping on the host before guest DMA starts.
> +
> +    ``device-iotlb=on|off`` (default: off)
> +        This enables device-iotlb capability for the emulated VT-d device.  So
> +        far virtio/vhost should be the only real user for this parameter,
> +        paired with ats=on configured for the device.
> +
> +    ``aw-bits=39|48`` (default: 39)
> +        This decides the address width of IOVA address space.  The address
> +        space has 39 bits width for 3-level IOMMU page tables, and 48 bits for
> +        4-level IOMMU page tables.
> +
> +    Please also refer to the wiki page for general scenarios of VT-d
> +    emulation in QEMU: https://wiki.qemu.org/Features/VT-d.
> +
>  ERST
>  
>  DEF("name", HAS_ARG, QEMU_OPTION_name,

As far as I know this looks very good.
Thanks for doing this!

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky



