Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6F25F064A
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 10:15:05 +0200 (CEST)
Received: from localhost ([::1]:42552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeBAm-0007YK-PL
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 04:15:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1oeB3e-0008Jk-67
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 04:07:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1oeB3a-0002hy-AM
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 04:07:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664525257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lg4t+LjLNpHVLo3OciLrjTTmTgB4HyE5e5DE0VyU6BA=;
 b=EEdB6+uImc+k+VM11x0/z9gkCv2XlteoJ+5ttQdmkzbHT1GNMljVmW+R3Brp8eROWOf00f
 iyT3z8tUj7ihTEIKaKqe4789dn12zWE035UFRQWPQvy5EPtZiCSq8SCKIoJes90S0aSbW8
 FMGgdF3him/X8wezvkuvEjnJuPqJ2UI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-474-QuLmEWoXOS-lXPVZxful7A-1; Fri, 30 Sep 2022 04:07:36 -0400
X-MC-Unique: QuLmEWoXOS-lXPVZxful7A-1
Received: by mail-ed1-f72.google.com with SMTP id
 t13-20020a056402524d00b00452c6289448so3073299edd.17
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 01:07:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Lg4t+LjLNpHVLo3OciLrjTTmTgB4HyE5e5DE0VyU6BA=;
 b=xWTXXpd1Uw2Hr8r4JJNQwofDvlodwsXuOEXaOJWbyZeO4PV8t6eX+vh78etQosmskd
 Us+UhfybwxDE4QBfETTb2FoBmnUb9e8ytRhgMOenDLtNbjdQI5QMFJqVK9qdurpJbMhM
 Okgy+N0PUuG+Se5L9lZ9uzHyPyRmTwmuTNSZIGBuYJPMXLAGfUubU5Uz1jzLqdafoYhv
 VVCPyAvD1/bPVcI8BZAUGlKYsEJGUiC3BS0I8zqHzhLaraNbDiTqK5bcKjjWpl7r3zdP
 7Qs/OS/SMdiPAUFPfUCL32juuzUGL8VAG7pMc+g7hvm34AnnXdVu+ks6vcdgkUFS3rkj
 rGDg==
X-Gm-Message-State: ACrzQf0uSNWUTjeArTk3l/6yMDNO5N6j4EBybcVQ1ipIrgoh/LHGroCp
 tl+pphZT3jM6e4aG+PIDelOxbso/9sWxS737PgpVuxxzobR/ALn45DK5XAyuOK+Tu3tavchS/iE
 AvMXP4nyUW2OEK2k=
X-Received: by 2002:a05:6402:204:b0:458:8868:d453 with SMTP id
 t4-20020a056402020400b004588868d453mr988077edv.257.1664525255136; 
 Fri, 30 Sep 2022 01:07:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM777R3r4pM1rKfVgfDJmxAEpbovjBXsm4Maxa2jgiNwuGiCX2WELepA9SacXF69hHPXmZ+CvA==
X-Received: by 2002:a05:6402:204:b0:458:8868:d453 with SMTP id
 t4-20020a056402020400b004588868d453mr988046edv.257.1664525254897; 
 Fri, 30 Sep 2022 01:07:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 z23-20020a50cd17000000b004570cbdb38csm1164657edi.96.2022.09.30.01.07.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Sep 2022 01:07:34 -0700 (PDT)
Message-ID: <aec4e9d1-b70e-2e8d-6503-b3e550c6d5ea@redhat.com>
Date: Fri, 30 Sep 2022 10:07:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] pci-ids: sync docs + header
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, peter.maydell@linaro.org,
 jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20220930073553.1626190-1-kraxel@redhat.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20220930073553.1626190-1-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.099, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Gerd,

On 9/30/22 09:35, Gerd Hoffmann wrote:
> docs/specs/pci-ids.txt and include/hw/pci/pci.h are out of sync,
> fix that.  Try improve the comment which points to pci-ids.txt.
> 
> Also drop the list of modern virtio devices and explain how they
> are calculated instead.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  docs/specs/pci-ids.txt | 19 ++++++++++---------
>  include/hw/pci/pci.h   |  7 ++++++-
>  2 files changed, 16 insertions(+), 10 deletions(-)
> 
> diff --git a/docs/specs/pci-ids.txt b/docs/specs/pci-ids.txt
> index dd6859d039d0..6be7bc108d66 100644
> --- a/docs/specs/pci-ids.txt
> +++ b/docs/specs/pci-ids.txt
> @@ -22,16 +22,17 @@ maintained as part of the virtio specification.
>  1af4:1004  SCSI host bus adapter device (legacy)
>  1af4:1005  entropy generator device (legacy)
>  1af4:1009  9p filesystem device (legacy)
> +1af4:1012  vsock device (legacy)
> +1af4:1013  pmem device (legacy)
> +1af4:1014  iommu device (legacy)
> +1af4:1015  mem device (legacy)
While I understand the 1af4:1040 range, I do not get where the above ids
come from. Could we add an explanation in the intro. Also there, we may
fix s/Note that this allocation separate/Note that this allocation is
separate. Also why do we have a hole inbetween 1009 and 1012?
>  
> -1af4:1041  network device (modern)
> -1af4:1042  block device (modern)
> -1af4:1043  console device (modern)
> -1af4:1044  entropy generator device (modern)
> -1af4:1045  balloon device (modern)
> -1af4:1048  SCSI host bus adapter device (modern)
> -1af4:1049  9p filesystem device (modern)
> -1af4:1050  virtio gpu device (modern)
> -1af4:1052  virtio input device (modern)
> +1af4:1040  Start of id range for modern virtio devices.  The pci device
> +           id is is calculated from the virtio device id by adding the
s/is is/is
> +           0x1040 offset.  The virtio ids are defined in the virtio
> +           specification.  The linux kernel has a header file with
> +           defines for all virtio ids (linux/virtio_ids.h), qemu has a
> +           copy in include/standard-headers/.
>  
>  1af4:10f0  Available for experimental usage without registration.  Must get
>     to      official ID when the code leaves the test lab (i.e. when seeking
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index b54b6ef88fc3..3b852199660c 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -71,7 +71,12 @@ extern bool pci_available;
>  #define PCI_DEVICE_ID_INTEL_82557        0x1229
>  #define PCI_DEVICE_ID_INTEL_82801IR      0x2922
>  
> -/* Red Hat / Qumranet (for QEMU) -- see pci-ids.txt */
> +/*
> + * Red Hat / Qumranet (for QEMU)
> + *
> + * These are documented in docs/specs/pci-ids.txt
> + * PLEASE KEEP HEADER + DOCS IN SYNC
> + */
>  #define PCI_VENDOR_ID_REDHAT_QUMRANET    0x1af4
>  #define PCI_SUBVENDOR_ID_REDHAT_QUMRANET 0x1af4
>  #define PCI_SUBDEVICE_ID_QEMU            0x1100

Adding Jean in copy as we discussed that in
https://lore.kernel.org/qemu-devel/5641321a-4bec-2ca9-bb14-d5ed883a9ded@redhat.com/

Thanks

Eric


