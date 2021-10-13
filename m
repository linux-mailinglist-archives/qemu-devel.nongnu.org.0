Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 471FC42BC6E
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 12:05:47 +0200 (CEST)
Received: from localhost ([::1]:52226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mab8s-0007TP-D4
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 06:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1maanq-0001Az-Jm
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:44:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1maanc-00066j-Ov
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:44:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634118228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gVKeMCzKTVLPYKcFBzM15Jh1PEN7WWvVdsY0GHYudcQ=;
 b=gmux/v2h7tlD+w3UrL1xYmB5rAfcD0Jm2Mud4O2vvSEAhlbJOI/rIHOP+a7WpjRRcYbAmS
 0Oy9GEvKK3uszs6jLKLOLOs1zA2fTt7Tzp9Po8WPuC/VZNb8JUXEIUGnqQipxuDlfgKAH9
 /xZKwlYRsu/kUrZlxdZ1ZdydKRlnneQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-tJnCunY5OyCBZaG0b1DBTw-1; Wed, 13 Oct 2021 05:43:44 -0400
X-MC-Unique: tJnCunY5OyCBZaG0b1DBTw-1
Received: by mail-ed1-f69.google.com with SMTP id
 x5-20020a50f185000000b003db0f796903so1699143edl.18
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:43:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gVKeMCzKTVLPYKcFBzM15Jh1PEN7WWvVdsY0GHYudcQ=;
 b=xWkWpOQTovl0O+tzye4R8noR4LAMtNNuBv1Ny2Any8z2fkTW3mmPMXQzhZ34PXVQF2
 FLH4yQq84LU7tXrftxRrqNAGrKNbdGnlKk3TxLw2RTE3pCGX652qAeDJ2TJvcRp+9YyJ
 ViWNB43vs5qq0QrPRoRvaRTR0gwhvX9FY5CauU9T+231HL7wj1kxrLyE/q0IRPpskQIl
 6avdySWejcpvER0gS+6eD4MViV6IsUmNpOGO+hYUjMrFTH+UiVMm95iQLdgGKVrlbJHv
 sIOUIPA/k34h/X3ipMEH+5WOCKHUI3sGPAkWrryA1MU9Uor7gKx2vhrTI5lZ91AOnuBc
 BGWA==
X-Gm-Message-State: AOAM531OuAfW/fYffsvV+4Et6lfFafcOMyDsuJmDGcTjzTXmdUWFsllC
 8usTTtVt/aT8gDfkx6YUIAdB7BUUFkzQZyDaouv9ttfQ5TWgSqIPfqIe+m4EVNtyrFQGEk7g2hw
 a3R7III4uNpEtVsc=
X-Received: by 2002:a05:6402:2748:: with SMTP id
 z8mr8151611edd.25.1634118223683; 
 Wed, 13 Oct 2021 02:43:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdg9i1VuCFbtLDlbvdRlkRp8IujkGBLpHa+t+1itrF0KcZLcX9oiNx18GGScFx2M0pPkSZKA==
X-Received: by 2002:a05:6402:2748:: with SMTP id
 z8mr8151592edd.25.1634118223530; 
 Wed, 13 Oct 2021 02:43:43 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id kd8sm6369571ejc.69.2021.10.13.02.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:43:43 -0700 (PDT)
Date: Wed, 13 Oct 2021 11:43:42 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 2/2] memory: Update description of
 memory_region_is_mapped()
Message-ID: <20211013114342.43e99dac@redhat.com>
In-Reply-To: <067a10ee-0897-df8d-2eff-b347c5958b03@redhat.com>
References: <20211011174522.14351-1-david@redhat.com>
 <20211011174522.14351-3-david@redhat.com>
 <93dead18-5ea5-0afe-18c1-de9a06773687@linaro.org>
 <8108c69d-a596-d6c9-a116-783f47904deb@amsat.org>
 <845d3d5f-f9e9-d59d-c868-5a9825eb7fba@redhat.com>
 <20211012105300.1ef25440@redhat.com>
 <a2078241-1dc9-782e-38a3-eab06c1b162c@redhat.com>
 <20211012120059.14e19dc1@redhat.com>
 <84adb9d1-6e30-7d5e-a362-0a81ea4b8b01@redhat.com>
 <067a10ee-0897-df8d-2eff-b347c5958b03@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 13 Oct 2021 09:14:35 +0200
David Hildenbrand <david@redhat.com> wrote:

> On 12.10.21 12:09, David Hildenbrand wrote:
> >>
> >> The less confusing would be one where check works for any memory region
> >> involved.  
> > 
> > Exactly, so for any alias, even in-between another alias and the target.
> >   
> >>      
> >>>>
> >>>>       
> >>>>>         I am not aware of actual issues, this is rather a cleanup.
> >>>>>         
> >>>>>         Signed-off-by: David Hildenbrand <david@redhat.com>
> >>>>>
> >>>>> diff --git a/include/exec/memory.h b/include/exec/memory.h
> >>>>> index 75b4f600e3..93d0190202 100644
> >>>>> --- a/include/exec/memory.h
> >>>>> +++ b/include/exec/memory.h
> >>>>> @@ -728,6 +728,7 @@ struct MemoryRegion {
> >>>>>          const MemoryRegionOps *ops;
> >>>>>          void *opaque;
> >>>>>          MemoryRegion *container;
> >>>>> +    int mapped_via_alias; /* Mapped via an alias, container might be NULL */
> >>>>>          Int128 size;
> >>>>>          hwaddr addr;
> >>>>>          void (*destructor)(MemoryRegion *mr);
> >>>>> diff --git a/softmmu/memory.c b/softmmu/memory.c
> >>>>> index 3bcfc3899b..1168a00819 100644
> >>>>> --- a/softmmu/memory.c
> >>>>> +++ b/softmmu/memory.c
> >>>>> @@ -2535,8 +2535,13 @@ static void memory_region_add_subregion_common(MemoryRegion *mr,
> >>>>>                                                     hwaddr offset,
> >>>>>                                                     MemoryRegion *subregion)
> >>>>>      {
> >>>>> +    MemoryRegion *alias;
> >>>>> +
> >>>>>          assert(!subregion->container);
> >>>>>          subregion->container = mr;
> >>>>> +    for (alias = subregion->alias; alias; alias = alias->alias) {
> >>>>> +       alias->mapped_via_alias++;  
> >>>>
> >>>> it it necessary to update mapped_via_alias for intermediate aliases?
> >>>> Why not just update on counter only on leaf (aliased region)?  
> >>>
> >>> Assume we have alias0 -> alias1 -> region and map alias0.
> >>>
> >>> Once alias0 is mapped it will have ->container set and
> >>> memory_region_is_mapped(alias0) will return "true".
> >>>
> >>> With my patch, both, "alias1" and the region will be marked
> >>> "mapped_via_alias" and memory_region_is_mapped() will succeed on both of
> >>> them. With what you propose, memory_region_is_mapped() would only
> >>> succeed on the region (well, and on alias 0) but not on alias1.  
> >>
> >> as long as add_subregion increments counter on leaf it doesn't matter
> >> how many intermediate aliases are there. Check on every one of them
> >> should end up at the leaf counter (at expense of traversing
> >> chain on every check but less state to track/think about).
> >>  
> > 
> > Sure, we could also let memory_region_is_mapped() walk all aliases to
> > the leaf. Not sure though, if it really simplifies things. It merely
> > adds another loop and doesn't get rid of the others :) But I don't
> > particularly care.
> >   
> 
> I just realized that this might not be what we want: we could get false 
> positives when a memory region is referenced via multiple alias and only 
> one of them is mapped. memory_region_is_mapped() could return "true" for 
> an alias that isn't actually mapped.
Agreed, that would be inconsistent.


