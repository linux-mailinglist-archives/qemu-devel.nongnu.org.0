Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98149437993
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 17:04:46 +0200 (CEST)
Received: from localhost ([::1]:58050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdw69-0005xi-F0
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 11:04:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mdw0U-0006ts-HQ
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 10:58:54 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:37759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mdw0S-0002Uc-SQ
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 10:58:54 -0400
Received: by mail-wr1-x42a.google.com with SMTP id e12so80567wra.4
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 07:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=a5HGtdvYhNCzrj42rIZ03hTh1Z/vGckF8qN5zn6VpuU=;
 b=f0ePebzX1I2UfsMai35P6G0TPYW91JlxpEiFYyXDorT6UjpkkDFn5m7+AvzRc1Z8YF
 DIR0ntcw7isaaR75PtDJNIaZQoj2mEo0t+J5nYjGV/hX5FfBdT3JGrqbZveYLouOPTA+
 gg2T/Oe9H40oBUJjlg8hpIeL2AXL+iEOeaCfExGJU6Ur1A4WTNZmzHKpyP4OtEr6Wca4
 ByCJWYZl32oKXJ1C5uAaO2r/dTsuanjzUbFwNWwbJzTMS5HiX8uhaY4S6RRuQsgqciSy
 ZqQttjFBlOE7rkullgUHF34ooA5sP7LLCsOTvSIWo/Dfhk8FkiD2BZEh2BMQO/o08SZf
 aQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=a5HGtdvYhNCzrj42rIZ03hTh1Z/vGckF8qN5zn6VpuU=;
 b=5EN+yy6k7+nfQ1I33ImBzASGpa3sJ0x9UIgE4D2OZq3F9mtW6cT8E0s1wODmV0OHRD
 jOwWWDUHM300J1HlMztfaC2VWjd5tAIzVNb25IzVC635eBP06Q5y+Dx5WOaFEcyiTPjA
 yYRAUfFN8MHr0U6xhwkk951GvxAi86UAgrp8r7d0phtGW7XSsw8FppiS5ulC5ZqTGQbV
 SRduM8nYvpmIuptx60DDqU4xGDmzx1ABgTuNZBJ4ifFpICRTHFlJzTZ6LmvegwAJHDJv
 dQrhIVnTF+lJs/leawmX7Uf9Jn2ZT20+4ljUtbQnUPIQY1E6z/Q7S1FsgVoHUcFYkATO
 YLQw==
X-Gm-Message-State: AOAM530Dy21u75s4IxOfYROLk1K0VFB3z/3sNFlTSrlD589oyH696/Zd
 L8gfgi5iZVxNV7XLtqpcDB4i1w==
X-Google-Smtp-Source: ABdhPJySQGj+zPMAuQPuL82/958TF/b3+/sBCp4izz1Sf+OkXaxIOon/uGyzJm8k1+dX7CwlfcfW1A==
X-Received: by 2002:a5d:4b0f:: with SMTP id v15mr386358wrq.313.1634914731305; 
 Fri, 22 Oct 2021 07:58:51 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id v4sm1131114wrs.86.2021.10.22.07.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 07:58:50 -0700 (PDT)
Date: Fri, 22 Oct 2021 15:58:28 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RESEND PATCH 2/2] hw/i386: Rename default_bus_bypass_iommu
Message-ID: <YXLRlLD1VkEyLm4b@myrica>
References: <20211013160607.649990-1-jean-philippe@linaro.org>
 <20211013160607.649990-3-jean-philippe@linaro.org>
 <20211022104510-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211022104510-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, qemu-devel@nongnu.org,
 richard.henderson@linaro.org, armbru@redhat.com, qemu-stable@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, eauger@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 22, 2021 at 10:46:08AM -0400, Michael S. Tsirkin wrote:
> On Wed, Oct 13, 2021 at 05:06:08PM +0100, Jean-Philippe Brucker wrote:
> > Since commit d8fb7d0969d5 ("vl: switch -M parsing to keyval"), machine
> > parameter definitions cannot use underscores, because keyval_dashify()
> > transforms them to dashes and the parser doesn't find the parameter.
> > 
> > This affects option default_bus_bypass_iommu which was introduced in the
> > same release:
> > 
> > $ qemu-system-x86_64 -M q35,default_bus_bypass_iommu=on
> > qemu-system-x86_64: Property 'pc-q35-6.1-machine.default-bus-bypass-iommu' not found
> > 
> > Rename the parameter to "default-bus-bypass-iommu". Passing
> > "default_bus_bypass_iommu" is still valid since the underscore are
> > transformed automatically.
> > 
> > Fixes: c9e96b04fc19 ("hw/i386: Add a default_bus_bypass_iommu pc machine option")
> > Reviewed-by: Eric Auger <eric.auger@redhat.com>
> > Tested-by: Eric Auger <eric.auger@redhat.com>
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> I can merge this one but I think it's independent of the
> ARM patch, right? So just two independent patches.

Yes they are independent

Thanks,
Jean

> 
> > ---
> >  hw/i386/pc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> > index 86223acfd3..54e4c00dce 100644
> > --- a/hw/i386/pc.c
> > +++ b/hw/i386/pc.c
> > @@ -1718,7 +1718,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
> >      object_class_property_add_bool(oc, "hpet",
> >          pc_machine_get_hpet, pc_machine_set_hpet);
> >  
> > -    object_class_property_add_bool(oc, "default_bus_bypass_iommu",
> > +    object_class_property_add_bool(oc, "default-bus-bypass-iommu",
> >          pc_machine_get_default_bus_bypass_iommu,
> >          pc_machine_set_default_bus_bypass_iommu);
> >  
> > -- 
> > 2.33.0
> 

