Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF37A3A88D7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 20:50:07 +0200 (CEST)
Received: from localhost ([::1]:41610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltE8P-0006nT-GU
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 14:50:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ltE4j-0004JP-W3
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 14:46:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ltE4e-0001kB-Kp
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 14:46:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623782766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OKdI1ZmdBopMMuSknMv9tN7qmJDQs8g1g8GkxpFqfcA=;
 b=Jf7da2fESMvd4Jh6j42Ti03dMqeptOwS/QVGiO8FJgbsatK2aA4JZCCMhb7rbytKs+coE9
 31gXKx+MskoVSbxLQUoWVBxJqWTNG4JT2zpzohdqLncXFWy6LNht6vQW624qNXb+08ovtn
 qyrp/fMf2bKZ8vKT6PlElNiq1MYI8Z4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-RfUFhPp8N_SRJAI3Hq_Wlg-1; Tue, 15 Jun 2021 14:46:05 -0400
X-MC-Unique: RfUFhPp8N_SRJAI3Hq_Wlg-1
Received: by mail-ej1-f72.google.com with SMTP id
 e11-20020a170906080bb02903f9c27ad9f5so4989951ejd.6
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 11:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OKdI1ZmdBopMMuSknMv9tN7qmJDQs8g1g8GkxpFqfcA=;
 b=H9L4sgyFuIlc0Jxa/FMP9NZnKquptIN9WYrWhgjeFHmHouaUvqSn80Pc3BOd4HH46K
 q2K8yXvQU+Quazp4pUFc5NK+JvGDQ0WxXKE0DhhIb7upc+WgZaUvasI85kjmW3MUFNWA
 WvDdXItR7HeUcuH3mrPo0i92JSHCgzuU8mmIDix5qx8frsLKzGdD1IJ0ZtJoJ0z1BqUu
 1w5DEqq7+UwwQBzW8d9uWyYbfRGjyQhmW7KOpaRibN5ozoh8hi8I89gAjyeXyFz6ZKvM
 VLozEIP69EH9Ij/ga5UCJpGqSiHu0BhfoWAKg2Md44QFBRk6nSyJOloBNVPkwM2zy8lv
 Rwdw==
X-Gm-Message-State: AOAM530aUmCbGBXmJSOM24UDhXw0zVcg8s9Rmx7esBq1i3/jChA/fnjr
 bvHMGYKcXBC/bpjkmRvgYJQlATqRPJPXcNT5gTjaPjJgYA8IsLJxT/YrpqR+rUdCjG7wyc3OgnX
 W3ayERzduC7C+B2Q=
X-Received: by 2002:a17:907:1c9e:: with SMTP id
 nb30mr1111683ejc.0.1623782764439; 
 Tue, 15 Jun 2021 11:46:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzK09/KIndMuEBexWGewMvMiyeU/V8Nz35A93W6tIMNKNMmyCuE2k3M1PvIu6psYdZruSHguA==
X-Received: by 2002:a17:907:1c9e:: with SMTP id
 nb30mr1111654ejc.0.1623782764220; 
 Tue, 15 Jun 2021 11:46:04 -0700 (PDT)
Received: from redhat.com ([77.126.22.11])
 by smtp.gmail.com with ESMTPSA id q15sm103216edr.84.2021.06.15.11.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 11:46:03 -0700 (PDT)
Date: Tue, 15 Jun 2021 14:46:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Chris Browy <cbrowy@avery-design.com>
Subject: Re: [PATCH v6 cxl2.0-v6-doe 1/6] standard-headers/linux/pci_regs:
 PCI header from Linux kernel
Message-ID: <20210615144524-mutt-send-email-mst@kernel.org>
References: <1623329999-15662-1-git-send-email-cbrowy@avery-design.com>
 <1623330943-18290-1-git-send-email-cbrowy@avery-design.com>
MIME-Version: 1.0
In-Reply-To: <1623330943-18290-1-git-send-email-cbrowy@avery-design.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: ben.widawsky@intel.com, david@redhat.com, qemu-devel@nongnu.org,
 vishal.l.verma@intel.com, jgroves@micron.com, armbru@redhat.com,
 f4bug@amsat.org, hchkuo@avery-design.com.tw, tyshao@avery-design.com.tw,
 jonathan.cameron@huawei.com, imammedo@redhat.com, dan.j.williams@intel.com,
 ira.weiny@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 10, 2021 at 09:15:43AM -0400, Chris Browy wrote:
> From: hchkuo <hchkuo@avery-design.com.tw>
> 
> Linux standard header for the registers of PCI Data Object Exchange
> (DOE). This header might be generated via script. The DOE feature
> should be added in the future Linux release so this patch can be
> removed then.
> 
> Signed-off-by: hchkuo <hchkuo@avery-design.com.tw>
> Signed-off-by: Chris Browy <cbrowy@avery-design.com>
> ---
>  include/standard-headers/linux/pci_regs.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/standard-headers/linux/pci_regs.h b/include/standard-headers/linux/pci_regs.h
> index e709ae8235..2a8df63e11 100644
> --- a/include/standard-headers/linux/pci_regs.h
> +++ b/include/standard-headers/linux/pci_regs.h
> @@ -730,7 +730,8 @@
>  #define PCI_EXT_CAP_ID_DVSEC	0x23	/* Designated Vendor-Specific */
>  #define PCI_EXT_CAP_ID_DLF	0x25	/* Data Link Feature */
>  #define PCI_EXT_CAP_ID_PL_16GT	0x26	/* Physical Layer 16.0 GT/s */
> -#define PCI_EXT_CAP_ID_MAX	PCI_EXT_CAP_ID_PL_16GT
> +#define PCI_EXT_CAP_ID_DOE	0x2E	/* Data Object Exchange */
> +#define PCI_EXT_CAP_ID_MAX	PCI_EXT_CAP_ID_DOE
>  
>  #define PCI_EXT_CAP_DSN_SIZEOF	12
>  #define PCI_EXT_CAP_MCAST_ENDPOINT_SIZEOF 40

these headers are imported from linux pls don't edit them
directly - get a patch into linux first.

For now you can add the defines to where they are used.

> -- 
> 2.17.1


