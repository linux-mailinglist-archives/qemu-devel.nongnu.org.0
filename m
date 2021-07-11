Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 422BE3C3B41
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 11:09:52 +0200 (CEST)
Received: from localhost ([::1]:52016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2VTC-0000MO-Qa
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 05:09:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1m2VRu-00086M-56
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 05:08:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1m2VRq-00012B-RL
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 05:08:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625994504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U9zSu5mhBy1ccpaOKl/Symb0jbA/PoPV9h21JdBujDQ=;
 b=Btvmk/hoUkqXgGojTm+hLr8clu0MpprFTGJXlxOjBQwD+td1OgLwBmSNcnU9b45xEJSZ76
 EstIkbriczvhX+WmbxAcAQ/rdoCccp/y/5D4KdbvaWp0+VPOtbj934Fcsjh/RhFqqUQwZZ
 2EL9Kg03ZUh8w/3AnpUb9NiN01+pyUM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-Qy2j12eaNcSHMnxfxjJKRg-1; Sun, 11 Jul 2021 05:08:21 -0400
X-MC-Unique: Qy2j12eaNcSHMnxfxjJKRg-1
Received: by mail-wr1-f72.google.com with SMTP id
 a4-20020adffb840000b02901304c660e75so5517949wrr.19
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 02:08:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=U9zSu5mhBy1ccpaOKl/Symb0jbA/PoPV9h21JdBujDQ=;
 b=KObGnqQwz0Jupwv6BWuUDy4qDsIGJj0bDes9WSEcDMGFRq95l1ydRBLdDRgbdib9AE
 RQPsjzOMmE6twFO8LHQVo/MKFeR30p9Ga+6FtPVwbUGfoXzM1DJF0qOhgTgmWP9gQJjM
 TdbVi8vdQ+7Fw4djUeU9DyaySwzAPV4WjgDFmiskfR6vHhosEKxSQPPepzA25DjYc6jL
 rR9315CaKQRvxEOUNG8Ax0uXbmFGrpjN6Ks05WUq28T7ZyrBfW2jwXEDkia7z3+JT896
 qEuYMOElwzh7EJ3p83EeiW8DQ6mtWFA0KxZ2bPLmy+UZQDmVqcSyT+p5dPkjGlPIsKAk
 6xew==
X-Gm-Message-State: AOAM533ok4TTWy2HuTqHznfjH0EVFfW8CsrByUeOU49JoucLue+rWxhz
 E52fKAAB8VJB83HOBGQMg0d2ouk6xsiyAtULe4AAzIPoLK6kcab5ESOqdAJ1dHg6MoiXysqLuE4
 0uvu/8fiN3JMO3Ts=
X-Received: by 2002:adf:e743:: with SMTP id c3mr33034324wrn.354.1625994500019; 
 Sun, 11 Jul 2021 02:08:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwWN6vjI6X433or5hYNANxFTHFoVy51cqCrea7zE7W0LukD1qWGSWiJskojqfoqbQRYZLVjA==
X-Received: by 2002:adf:e743:: with SMTP id c3mr33034299wrn.354.1625994499795; 
 Sun, 11 Jul 2021 02:08:19 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id r16sm8486984wmg.11.2021.07.11.02.08.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Jul 2021 02:08:19 -0700 (PDT)
Subject: Re: [PATCH v2] docs: Add '-device intel-iommu' entry
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20210707154114.197580-1-peterx@redhat.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <1b3a68ea-464a-970c-30a2-0c18cf674ce9@redhat.com>
Date: Sun, 11 Jul 2021 11:08:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210707154114.197580-1-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.452,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Peter,

On 7/7/21 5:41 PM, Peter Xu wrote:
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
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

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
> 


