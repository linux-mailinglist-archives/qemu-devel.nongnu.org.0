Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6B85087A2
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 14:03:56 +0200 (CEST)
Received: from localhost ([::1]:45204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh93r-0001Ja-5X
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 08:03:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nh90C-0004vx-Ud
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 08:00:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nh90A-0004Ta-5r
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 08:00:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650456005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mnjACVKZjnfPx3ap+dIHZnJAZbkK0441jBwATaJ30nE=;
 b=PxfwppiPt10OBQ0faulq4SmBQ/y09IfKD9xyHwrMHerc3I1gQdJqRTY6l9JhJ7oSH/cQj+
 lq9/GJamNsYFQMwKNJO6Znsr0MJ4TnVQ/qX9bm3ptwDw8PL0A+vCEO1z1PPUDsCrXjFbOt
 7v1m5wb9sT2y+vbKxEIS/DrISowBWbg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-395-Y8fSLwu4NJ2eRFIZ4J1igw-1; Wed, 20 Apr 2022 08:00:04 -0400
X-MC-Unique: Y8fSLwu4NJ2eRFIZ4J1igw-1
Received: by mail-wm1-f70.google.com with SMTP id
 i66-20020a1c3b45000000b0038eab4e0feaso815556wma.9
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 05:00:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=mnjACVKZjnfPx3ap+dIHZnJAZbkK0441jBwATaJ30nE=;
 b=XSaFhtnoD9Mu9hx1op3Ps3qY5C0ppp7cq29qQQeTl/ZehpnPn6V8GQU+/+zVayP5s0
 RSrMw+SM0/Wk+mTnKjPdfWKvYZvDIyGDycThc3N407XoDcwzv8tEawNFqCFmwh2B8Hzj
 Iw/cMQD0Vii3TLwweqJFik3wmB4lni0U25aP0W/1LDA1MOHEyt0uB8OGW3gPZHd/caO0
 QltGu2XeSb8gCQVfe2+x3MxCD8EFstuIj1lygmozf1eeDEo6Mfijr2WLgZkVjS9V7xDr
 ukyB+sDOtrF+pjo1FlrDBSvRw2b6B0xMzzQIdP17mm7rO5/R4u8Aw8DwKQ/6wQDpjjPV
 LxfQ==
X-Gm-Message-State: AOAM532NhzUU8JKfaSnk0Txnbsd519D0L4FkxcnN3OuEgvFyBMXcHY3z
 l6N2lKvkKMb53Gu+6tfpCBkGicM/Cs2E/zPQ5VRbmH1eSXuOk3XpeB1XCHtkDtCQ37pfG4gdem8
 a1S8ZpgakKgZHyNQ=
X-Received: by 2002:a5d:6f10:0:b0:207:aa60:f59f with SMTP id
 ay16-20020a5d6f10000000b00207aa60f59fmr14810864wrb.175.1650456002976; 
 Wed, 20 Apr 2022 05:00:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvxlyg/wphsVW5t3E6AIK0Kb5HMBlLGcqrXcl2djgRq0lHCKCqCbnkhIOPJ2FYNYAR5BwN3A==
X-Received: by 2002:a5d:6f10:0:b0:207:aa60:f59f with SMTP id
 ay16-20020a5d6f10000000b00207aa60f59fmr14810847wrb.175.1650456002737; 
 Wed, 20 Apr 2022 05:00:02 -0700 (PDT)
Received: from redhat.com ([2.53.17.80]) by smtp.gmail.com with ESMTPSA id
 z18-20020a5d6552000000b00207b65f745bsm14759855wrv.83.2022.04.20.04.59.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 05:00:01 -0700 (PDT)
Date: Wed, 20 Apr 2022 07:59:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Subject: Re: [PATCH v7 12/12] hw/acpi: Make the PCI hot-plug aware of SR-IOV
Message-ID: <20220420075936-mutt-send-email-mst@kernel.org>
References: <20220318191819.1711831-1-lukasz.maniak@linux.intel.com>
 <20220318191819.1711831-13-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220318191819.1711831-13-lukasz.maniak@linux.intel.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, stefanha@redhat.com,
 qemu-block@nongnu.org, armbru@redhat.com, lukasz.gieryk@linux.intel.com,
 f4bug@amsat.org, qemu-devel@nongnu.org, kbusch@kernel.org, its@irrelevant.dk,
 hreitz@redhat.com, xypron.glpk@gmx.de, k.jensen@samsung.com, ani@anisinha.ca,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 18, 2022 at 08:18:19PM +0100, Lukasz Maniak wrote:
> From: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
> 
> PCI device capable of SR-IOV support is a new, still-experimental
> feature with only a single working example of the Nvme device.
> 
> This patch in an attempt to fix a double-free problem when a
> SR-IOV-capable Nvme device is hot-unplugged. The problem and the
> reproduction steps can be found in this thread:
> 
> https://patchew.org/QEMU/20220217174504.1051716-1-lukasz.maniak@linux.intel.com/20220217174504.1051716-14-lukasz.maniak@linux.intel.com/
> 
> Details of the proposed solution are, for convenience, included below.
> 
> 1) The current SR-IOV implementation assumes it’s the PhysicalFunction
>    that creates and deletes VirtualFunctions.
> 2) It’s a design decision (the Nvme device at least) for the VFs to be
>    of the same class as PF. Effectively, they share the dc->hotpluggable
>    value.
> 3) When a VF is created, it’s added as a child node to PF’s PCI bus
>    slot.
> 4) Monitor/device_del triggers the ACPI mechanism. The implementation is
>    not aware of SR/IOV and ejects PF’s PCI slot, directly unrealizing all
>    hot-pluggable (!acpi_pcihp_pc_no_hotplug) children nodes.
> 5) VFs are unrealized directly, and it doesn’t work well with (1).
>    SR/IOV structures are not updated, so when it’s PF’s turn to be
>    unrealized, it works on stale pointers to already-deleted VFs.
> 
> Signed-off-by: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

feel free to include when merging the rest of the patchset.

> ---
>  hw/acpi/pcihp.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index 6351bd3424d..248839e1110 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -192,8 +192,12 @@ static bool acpi_pcihp_pc_no_hotplug(AcpiPciHpState *s, PCIDevice *dev)
>       * ACPI doesn't allow hotplug of bridge devices.  Don't allow
>       * hot-unplug of bridge devices unless they were added by hotplug
>       * (and so, not described by acpi).
> +     *
> +     * Don't allow hot-unplug of SR-IOV Virtual Functions, as they
> +     * will be removed implicitly, when Physical Function is unplugged.
>       */
> -    return (pc->is_bridge && !dev->qdev.hotplugged) || !dc->hotpluggable;
> +    return (pc->is_bridge && !dev->qdev.hotplugged) || !dc->hotpluggable ||
> +           pci_is_vf(dev);
>  }
>  
>  static void acpi_pcihp_eject_slot(AcpiPciHpState *s, unsigned bsel, unsigned slots)
> -- 
> 2.25.1


