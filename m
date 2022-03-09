Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A99974D3DA8
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 00:41:42 +0100 (CET)
Received: from localhost ([::1]:33948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nS5w5-0000WV-9k
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 18:41:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nS5vC-0008Eh-7p
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 18:40:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nS5v8-0003s2-Km
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 18:40:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646869241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+TUSIHqCGJmabwLWB8aDYJVU3fT5o0iChDiGsi6s7GA=;
 b=FqRT2ivj/X3Qa/vi/sLsi6L0i5Ewhpohb9gdM3BcZTQExqwX+PY+QKNSCIqpF/TsWz+ok3
 l53UXL32tH9HG0xAuQh5GSzrusvFUc05TMCChqaVp7l24hB+3TXxaNBWNpCkledta3M/3s
 OVAXHD5qcLF5bKdz4UO+ePwTwA7S5RI=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-rYCyo133M6ymwPQ_5RhZ_w-1; Wed, 09 Mar 2022 18:40:39 -0500
X-MC-Unique: rYCyo133M6ymwPQ_5RhZ_w-1
Received: by mail-oo1-f71.google.com with SMTP id
 r5-20020a4aad05000000b00320df2f7f4dso2930221oon.3
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 15:40:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=+TUSIHqCGJmabwLWB8aDYJVU3fT5o0iChDiGsi6s7GA=;
 b=rIShHIDrOe9zffY2PLTVWsi9aKO7CTGsUEuim7zrW4NTi7yBvOuklyugJjT7K76RNo
 y2VIM4O3S9tdVDp3S8xu5pH29jDbz41LNcVMNB3JaNVED7crO0bqxP+pd2N5h8RY+Zz5
 1i/LIDh4kC8pOklakd0phxrPFDqFy8uao3ZAeT0ePmo2CzG3B9aIfUjGiniDo1KfmWPa
 jYqt2a3QXhGjd8lV8NAbg4IRGZ8wEi9DeXv5EGpx2m/4/yKfEUCDPuhlLBv6oA8O2j6Z
 IPVL75VVBaC4kv4UwpJpiUZilnsW5DghBnwdlGH+ys40fcDw0y5tjOmzw8fOfkeuZ+Od
 YowQ==
X-Gm-Message-State: AOAM5328jGg7W4u48yfl1qy9kCuoCJWQUdG+AIsLGx330qmpiN9ZyEFz
 w6oy2ZTRkmkc0MEhUFX0dKx0SswDIPJE7zgJmjhn89XOS8r7a1SYQedHlQEvnG7j6vqW6UxQAhM
 1rCuFfZIwhFUUNO4=
X-Received: by 2002:a9d:ed7:0:b0:5b2:236c:b6cd with SMTP id
 81-20020a9d0ed7000000b005b2236cb6cdmr1174020otj.31.1646869238674; 
 Wed, 09 Mar 2022 15:40:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyFTAZKmYSd7Itrj4uNu4WMJx1anR+1YxvQQLi7OmLBgZRu6Fo8gvn0KE/2/LCzydxbVf0BIA==
X-Received: by 2002:a9d:ed7:0:b0:5b2:236c:b6cd with SMTP id
 81-20020a9d0ed7000000b005b2236cb6cdmr1174006otj.31.1646869238341; 
 Wed, 09 Mar 2022 15:40:38 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 16-20020a9d0490000000b005ad3c83e927sm1600747otm.60.2022.03.09.15.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 15:40:38 -0800 (PST)
Date: Wed, 9 Mar 2022 16:40:36 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: John Johnson <john.g.johnson@oracle.com>
Subject: Re: [RFC v4 04/21] vfio-user: add region cache
Message-ID: <20220309164036.3c598e92.alex.williamson@redhat.com>
In-Reply-To: <719c102ca37546208637f479054da1ebf00957d5.1641584316.git.john.g.johnson@oracle.com>
References: <cover.1641584316.git.john.g.johnson@oracle.com>
 <719c102ca37546208637f479054da1ebf00957d5.1641584316.git.john.g.johnson@oracle.com>
Organization: Red Hat
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 11 Jan 2022 16:43:40 -0800
John Johnson <john.g.johnson@oracle.com> wrote:

> diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c
> index 0cf69a8..223bd02 100644
> --- a/hw/vfio/pci-quirks.c
> +++ b/hw/vfio/pci-quirks.c
> @@ -1601,16 +1601,14 @@ int vfio_pci_nvidia_v100_ram_init(VFIOPCIDevice *vdev, Error **errp)
>  
>      hdr = vfio_get_region_info_cap(nv2reg, VFIO_REGION_INFO_CAP_NVLINK2_SSATGT);
>      if (!hdr) {
> -        ret = -ENODEV;
> -        goto free_exit;
> +        return -ENODEV;
>      }
>      cap = (void *) hdr;
>  
>      p = mmap(NULL, nv2reg->size, PROT_READ | PROT_WRITE,
>               MAP_SHARED, vdev->vbasedev.fd, nv2reg->offset);
>      if (p == MAP_FAILED) {
> -        ret = -errno;
> -        goto free_exit;
> +        return -errno;
>      }
>  
>      quirk = vfio_quirk_alloc(1);
> @@ -1623,7 +1621,7 @@ int vfio_pci_nvidia_v100_ram_init(VFIOPCIDevice *vdev, Error **errp)
>                          (void *) (uintptr_t) cap->tgt);
>      trace_vfio_pci_nvidia_gpu_setup_quirk(vdev->vbasedev.name, cap->tgt,
>                                            nv2reg->size);
> -free_exit:
> +
>      g_free(nv2reg);

Shouldn't this g_free() be removed as well?

>  
>      return ret;
> @@ -1651,16 +1649,14 @@ int vfio_pci_nvlink2_init(VFIOPCIDevice *vdev, Error **errp)
>      hdr = vfio_get_region_info_cap(atsdreg,
>                                     VFIO_REGION_INFO_CAP_NVLINK2_SSATGT);
>      if (!hdr) {
> -        ret = -ENODEV;
> -        goto free_exit;
> +        return -ENODEV;
>      }
>      captgt = (void *) hdr;
>  
>      hdr = vfio_get_region_info_cap(atsdreg,
>                                     VFIO_REGION_INFO_CAP_NVLINK2_LNKSPD);
>      if (!hdr) {
> -        ret = -ENODEV;
> -        goto free_exit;
> +        return -ENODEV;
>      }
>      capspeed = (void *) hdr;
>  
> @@ -1669,8 +1665,7 @@ int vfio_pci_nvlink2_init(VFIOPCIDevice *vdev, Error **errp)
>          p = mmap(NULL, atsdreg->size, PROT_READ | PROT_WRITE,
>                   MAP_SHARED, vdev->vbasedev.fd, atsdreg->offset);
>          if (p == MAP_FAILED) {
> -            ret = -errno;
> -            goto free_exit;
> +            return -errno;
>          }
>  
>          quirk = vfio_quirk_alloc(1);
> @@ -1690,8 +1685,6 @@ int vfio_pci_nvlink2_init(VFIOPCIDevice *vdev, Error **errp)
>                          (void *) (uintptr_t) capspeed->link_speed);
>      trace_vfio_pci_nvlink2_setup_quirk_lnkspd(vdev->vbasedev.name,
>                                                capspeed->link_speed);
> -free_exit:
> -    g_free(atsdreg);

Like was done for this equivalent usage.  Thanks,

Alex


