Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 395EE437937
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 16:47:35 +0200 (CEST)
Received: from localhost ([::1]:38730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdvpV-0000ne-Qx
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 10:47:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mdvoL-00089i-H5
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 10:46:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mdvoG-0008Dk-T5
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 10:46:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634913974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oEUJFfSAcgQr2gftQYz9t7Ix04eNtDdQy0HuYhwQG0U=;
 b=UVWiPIv5TSB8LNMZB4ohv01kax71BIyH2oGXouNZM8SPuruhP98xd0+5VdESpVU5Tgl4F4
 EwKYVTd/IvcW73YFgJ62DOAC2DXIe8U50+0f/v0H6CZhxU4sLXWVTli7GHj9BXV8h69QAh
 vQ5SQ0LS0j24J0bTdD3H+WXLljyO9nA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-_0QLHF_HNquG0le1gK8LQQ-1; Fri, 22 Oct 2021 10:46:13 -0400
X-MC-Unique: _0QLHF_HNquG0le1gK8LQQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 c5-20020a05600c0ac500b0030dba7cafc9so1096850wmr.5
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 07:46:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oEUJFfSAcgQr2gftQYz9t7Ix04eNtDdQy0HuYhwQG0U=;
 b=TAikjg4Xci/V4sj0ZcD0WOD6Q74+YIIXt4X8gnUunMVsZgbCt3Rg3o3JnmxQue0daN
 IOHuQUDYWbzsZboiuhNFAUlP0VMSeA91wOldq34ONRYGc8TMPB146lOqGGP82pPt1bcj
 RcoN2gcqds/aqnV1TF9/z6moBltv0dmWNN9eIaF5Z45rysU8iZALLCvj12jJkw5YbdnF
 g/RD55EV8hx4V2tpHvZXpSaQ4c4Ib7yGHL3+K2gnf7/V0LWOKET7lyvBGVOcUWQn4DZb
 FsEyc9DZh3T2wD4/lOsm4bFNOBYRZKH0Xvd7Zct8SG3NBNrsVi86PvjbPxSQ0rBoGX0X
 eQtA==
X-Gm-Message-State: AOAM5336yjvyArughBhSdqBQ2NxgwCyQrf2dVEUasMky1FNLCdc03rxk
 6OFuIEnjKT/IpLcIET73prZx0kK4eTCE6ibxOGwDnYUtsqcXzT5FgkGH4CLIaNMwQiZRC+NH1VH
 qLOO4/GiJcl4p2Fw=
X-Received: by 2002:a05:600c:3393:: with SMTP id
 o19mr29768697wmp.66.1634913972366; 
 Fri, 22 Oct 2021 07:46:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvMe1jzCVKap5W+QrLDjlcc+daG0fe4mlpvy/Coij3DdvzEot2NyPwp1ax/lz5UPLomNC2iw==
X-Received: by 2002:a05:600c:3393:: with SMTP id
 o19mr29768670wmp.66.1634913972180; 
 Fri, 22 Oct 2021 07:46:12 -0700 (PDT)
Received: from redhat.com ([2a10:800c:dc96:0:eb2c:7203:97de:b6f5])
 by smtp.gmail.com with ESMTPSA id r39sm2444387wmp.2.2021.10.22.07.46.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 07:46:11 -0700 (PDT)
Date: Fri, 22 Oct 2021 10:46:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [RESEND PATCH 2/2] hw/i386: Rename default_bus_bypass_iommu
Message-ID: <20211022104510-mutt-send-email-mst@kernel.org>
References: <20211013160607.649990-1-jean-philippe@linaro.org>
 <20211013160607.649990-3-jean-philippe@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20211013160607.649990-3-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, qemu-devel@nongnu.org,
 richard.henderson@linaro.org, armbru@redhat.com, qemu-stable@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, eauger@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 13, 2021 at 05:06:08PM +0100, Jean-Philippe Brucker wrote:
> Since commit d8fb7d0969d5 ("vl: switch -M parsing to keyval"), machine
> parameter definitions cannot use underscores, because keyval_dashify()
> transforms them to dashes and the parser doesn't find the parameter.
> 
> This affects option default_bus_bypass_iommu which was introduced in the
> same release:
> 
> $ qemu-system-x86_64 -M q35,default_bus_bypass_iommu=on
> qemu-system-x86_64: Property 'pc-q35-6.1-machine.default-bus-bypass-iommu' not found
> 
> Rename the parameter to "default-bus-bypass-iommu". Passing
> "default_bus_bypass_iommu" is still valid since the underscore are
> transformed automatically.
> 
> Fixes: c9e96b04fc19 ("hw/i386: Add a default_bus_bypass_iommu pc machine option")
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Tested-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

I can merge this one but I think it's independent of the
ARM patch, right? So just two independent patches.

> ---
>  hw/i386/pc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 86223acfd3..54e4c00dce 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1718,7 +1718,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>      object_class_property_add_bool(oc, "hpet",
>          pc_machine_get_hpet, pc_machine_set_hpet);
>  
> -    object_class_property_add_bool(oc, "default_bus_bypass_iommu",
> +    object_class_property_add_bool(oc, "default-bus-bypass-iommu",
>          pc_machine_get_default_bus_bypass_iommu,
>          pc_machine_set_default_bus_bypass_iommu);
>  
> -- 
> 2.33.0


