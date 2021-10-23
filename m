Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FCA438537
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 22:18:47 +0200 (CEST)
Received: from localhost ([::1]:47474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meNTb-0004AG-1c
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 16:18:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1meNQQ-0002Po-M9
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 16:15:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1meNQN-0002iN-RB
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 16:15:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635020126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x4lw/D2Z0BwMVWS3v/gOzlpN4mtplpXUc8tzVz0y/BI=;
 b=jHoYbvyIIsyHZmXRtiEi5ggC4WwVhoB+aOSBzdI9HpF3eZuFxnvqSsquwypcIe1HINksMh
 beqNQGM04M05GHan00EDEyJxkF6ubXscNwqWr+wMBw4PpUCbE0sqVCeUUh2pNDASiIkwCj
 hMLmbg+nKuFK/2ddYFC9xjsK0iSL1sI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-VYX7nBZPPFKOuSJx8rmh9g-1; Sat, 23 Oct 2021 16:15:25 -0400
X-MC-Unique: VYX7nBZPPFKOuSJx8rmh9g-1
Received: by mail-wm1-f69.google.com with SMTP id
 a18-20020a1cf012000000b0032ca3eb2ac3so1899612wmb.0
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 13:15:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=x4lw/D2Z0BwMVWS3v/gOzlpN4mtplpXUc8tzVz0y/BI=;
 b=1C/8CQAC3yZDJdJ+gfrh6x6xLo1Krm6QhSb20sfqUpiJLY5maCA+clcAF7fOgKY3UC
 Lrt+aH7O3ypZm8XuoVaXKiiaOZ3oMEHRZqDZItNNeRVxMc+abEhRuNP1V5sRJ8aIcxvz
 Vo9JDN1rKVFt3Txxk7UOlg7WD3b5ko9QB4A1HMgjuDo2T3NLZi0lkciWWEZm9JpULEJ5
 emrwrWMOm+MABZwEp91BV+03rOiUXmADfUFDYog0QAgVBF+4RcQwl3V/WJylFzA6GZSY
 v8YRSAduEGva7Gs08+UHWO1E6lQpqPJ7AlXBrGHP/V5fIMGvfi87zJXMoiiMaXSlzbKM
 vB3A==
X-Gm-Message-State: AOAM530HxrBKGdQw1SkU4qs2WsSyR9Kf1RLoTQpIVvrpbQOOhbwxW41/
 tiWz9iA51YRk0+beQ2cMgnLiXkc4o49MnRcoqWTtk0tPgEbyoTuYXdtbZDaANErOCQIgTcHkHVV
 PpStyIznwFpdxNEM=
X-Received: by 2002:adf:e5c8:: with SMTP id a8mr10646983wrn.167.1635020124275; 
 Sat, 23 Oct 2021 13:15:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGFsbhDJKjn9ybGJyuCObdoSMiaxRV7E05Vqb3d6qNw3XTjLn6MJU/DhMWnKKff7mM9TwKMA==
X-Received: by 2002:adf:e5c8:: with SMTP id a8mr10646969wrn.167.1635020124130; 
 Sat, 23 Oct 2021 13:15:24 -0700 (PDT)
Received: from redhat.com ([2.55.9.147])
 by smtp.gmail.com with ESMTPSA id u1sm5071986wrt.97.2021.10.23.13.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 13:15:23 -0700 (PDT)
Date: Sat, 23 Oct 2021 16:15:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [RESEND PATCH 2/2] hw/i386: Rename default_bus_bypass_iommu
Message-ID: <20211023161502-mutt-send-email-mst@kernel.org>
References: <20211013160607.649990-1-jean-philippe@linaro.org>
 <20211013160607.649990-3-jean-philippe@linaro.org>
 <20211022104510-mutt-send-email-mst@kernel.org>
 <YXLRlLD1VkEyLm4b@myrica>
MIME-Version: 1.0
In-Reply-To: <YXLRlLD1VkEyLm4b@myrica>
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

On Fri, Oct 22, 2021 at 03:58:28PM +0100, Jean-Philippe Brucker wrote:
> On Fri, Oct 22, 2021 at 10:46:08AM -0400, Michael S. Tsirkin wrote:
> > On Wed, Oct 13, 2021 at 05:06:08PM +0100, Jean-Philippe Brucker wrote:
> > > Since commit d8fb7d0969d5 ("vl: switch -M parsing to keyval"), machine
> > > parameter definitions cannot use underscores, because keyval_dashify()
> > > transforms them to dashes and the parser doesn't find the parameter.
> > > 
> > > This affects option default_bus_bypass_iommu which was introduced in the
> > > same release:
> > > 
> > > $ qemu-system-x86_64 -M q35,default_bus_bypass_iommu=on
> > > qemu-system-x86_64: Property 'pc-q35-6.1-machine.default-bus-bypass-iommu' not found
> > > 
> > > Rename the parameter to "default-bus-bypass-iommu". Passing
> > > "default_bus_bypass_iommu" is still valid since the underscore are
> > > transformed automatically.
> > > 
> > > Fixes: c9e96b04fc19 ("hw/i386: Add a default_bus_bypass_iommu pc machine option")
> > > Reviewed-by: Eric Auger <eric.auger@redhat.com>
> > > Tested-by: Eric Auger <eric.auger@redhat.com>
> > > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > 
> > I can merge this one but I think it's independent of the
> > ARM patch, right? So just two independent patches.
> 
> Yes they are independent
> 
> Thanks,
> Jean

Ok just post them separately pls then.

> > 
> > > ---
> > >  hw/i386/pc.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> > > index 86223acfd3..54e4c00dce 100644
> > > --- a/hw/i386/pc.c
> > > +++ b/hw/i386/pc.c
> > > @@ -1718,7 +1718,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
> > >      object_class_property_add_bool(oc, "hpet",
> > >          pc_machine_get_hpet, pc_machine_set_hpet);
> > >  
> > > -    object_class_property_add_bool(oc, "default_bus_bypass_iommu",
> > > +    object_class_property_add_bool(oc, "default-bus-bypass-iommu",
> > >          pc_machine_get_default_bus_bypass_iommu,
> > >          pc_machine_set_default_bus_bypass_iommu);
> > >  
> > > -- 
> > > 2.33.0
> > 


