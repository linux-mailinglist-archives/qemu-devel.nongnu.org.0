Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A32A3FEA33
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 09:48:35 +0200 (CEST)
Received: from localhost ([::1]:35124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLhSc-0005fI-Fk
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 03:48:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mLhQJ-0003TN-87
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:46:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mLhQH-00042S-JM
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:46:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630568768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/dWSt5IAhUhwWtlIzOf6rE4qZUKOWlTXcVm5vhjr4V4=;
 b=F2ZuXS/GWWGU4IBKPFa7JyZYk4u99GLrEWF30SyktZPgSUf6uGA+xWa/uaBBAQjH+6MsB0
 h3t2FAlI7x0O3f7R+nb9X6+FkKPmB29p65akRiwAEpPMKL7Kh24GNcT+BZ6JjJgNVPSMRs
 M4n3h0H3Df6CEAJm2MWLCeWH9goE+PE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-21S1auN_OH239XuK7kv1-A-1; Thu, 02 Sep 2021 03:46:07 -0400
X-MC-Unique: 21S1auN_OH239XuK7kv1-A-1
Received: by mail-wm1-f72.google.com with SMTP id
 r4-20020a1c4404000000b002e728beb9fbso610125wma.9
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 00:46:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/dWSt5IAhUhwWtlIzOf6rE4qZUKOWlTXcVm5vhjr4V4=;
 b=H2ol1rZwIdt0egO+9kYNmzjfWMD7FgZC0Bqib+VGXqh39oyQe/LaSpdL8AegoHONDo
 CN/W/Z4ZUeDSqdMLTfF/IUkJgneu3CK0rVhkcJComk+Wr2FUDES5hgU2XqNB+VSL1HIX
 xo03F+M0jHbnDS5pvXQhEsdRKyFdi7nGl/ATTI2dTmrJAb7mqMHRUiRB2o3VbUgoh30e
 xiXLwli84KxVb0yPG2Ly88u3i4AYKB+kEzHRo7CQ5SOw7pgWmzadWsHoOgrp2VPZ/Fzc
 EMOB68rcp+Qu9qDOtBcIumDU6VM1dBhZ8Yw+9gMQCXpgxqNGPC+tDl1PdShEosg+GR38
 8F4Q==
X-Gm-Message-State: AOAM532OGwWDdWXqNsTl1t/lW/65GoLiExSDfllX7ehkfjJ4eI8CKwkp
 Avq7AwyRvbr3qxgzskGJxNSuXo8ZfZFEcSCngjRoQ+V4lgA3eetR2/B1/NSRjCjbL81ldkHgfoF
 d8FgPf5t6vJ2snEk=
X-Received: by 2002:a1c:751a:: with SMTP id o26mr1720567wmc.94.1630568766460; 
 Thu, 02 Sep 2021 00:46:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGL8Ev0AhGC9MF3kyjWczj+PAKRNMDtZMSK6ni3fayg3+WWPkomo7geo5ez7YgewSbhzIA+A==
X-Received: by 2002:a1c:751a:: with SMTP id o26mr1720539wmc.94.1630568766286; 
 Thu, 02 Sep 2021 00:46:06 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id c9sm1032678wrf.77.2021.09.02.00.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 00:46:05 -0700 (PDT)
Date: Thu, 2 Sep 2021 09:46:04 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 4/4] vl: Prioritize realizations of devices
Message-ID: <20210902094604.5bde8f5f@redhat.com>
In-Reply-To: <YSean3PIkslbTHeU@t490s>
References: <20210823210703.cikdkhvyeqqypaqa@habkost.net>
 <YSQTwth0elaz4T8W@t490s>
 <20210823215623.bagyo3oojdpk3byj@habkost.net>
 <YSQp0Nh6Gs5equAG@t490s> <8735qxhnhn.fsf@dusky.pond.sub.org>
 <87h7fdg12w.fsf@dusky.pond.sub.org> <YSa7H3wGUHgccCrU@t490s>
 <YScPg0cYYGxxTz+b@xz-m1.local> <87y28oy6rm.fsf@dusky.pond.sub.org>
 <20210826133629.2ddd3b88@redhat.com> <YSean3PIkslbTHeU@t490s>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: "Daniel P . =?UTF-8?B?QmVycmFu?=
 =?UTF-8?B?Z8Op?=" <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Wang Xingang <wangxingang5@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Aug 2021 09:43:59 -0400
Peter Xu <peterx@redhat.com> wrote:

> On Thu, Aug 26, 2021 at 01:36:29PM +0200, Igor Mammedov wrote:
> > On Thu, 26 Aug 2021 10:01:01 +0200
> > Markus Armbruster <armbru@redhat.com> wrote:
> >   
> > > Peter Xu <peterx@redhat.com> writes:
> > >   
> > > > On Wed, Aug 25, 2021 at 05:50:23PM -0400, Peter Xu wrote:    
> > > >> On Wed, Aug 25, 2021 at 02:28:55PM +0200, Markus Armbruster wrote:    
> > > >> > Having thought about this a bit more...  
> > ...  
> > > > Any further thoughts will be greatly welcomed.    
> > > 
> > > I'd like to propose a more modest solution: detect the problem and fail.  
> > That's or proper dependency tracking (which stands chance to work with QMP,
> > but like it was said it's complex)
> >   
> > > A simple state machine can track "has IOMMU" state.  It has three states
> > > "no so far", "yes", and "no", and two events "add IOMMU" and "add device
> > > that needs to know".  State diagram:
> > > 
> > >                           no so far
> > >                    +--- (start state) ---+
> > >                    |                     |
> > >          add IOMMU |                     | add device that
> > >                    |                     |  needs to know
> > >                    v                     v
> > >              +--> yes                    no <--+
> > >              |     |   add device that   |     |
> > >              +-----+    needs to know    +-----+
> > > 
> > > "Add IOMMU" in state "no" is an error.  
> > 
> > question is how we distinguish "device that needs to know"
> > from device that doesn't need to know, and then recently
> > added feature 'bypass IOMMU' adds more fun to this.  
> 
> Maybe we can start from "no device needs to know"? Then add more into it when
> the list expands.
> 
> vfio-pci should be a natural fit because we're sure it won't break any valid
> old configurations.  However we may need to be careful on adding more devices,
> e.g. when some old configuration might work on old binaries, but I'm not sure.

 
> Off-topic: I'm wondering whether bypass_iommu is just a work-around of not
> using iommu=pt in the guest cmdlines?  Is there any performance comparison of
> using bypass_iommu against having iommu but with iommu=pt?  At least intel
> iommu has pt enabled explicitly, i.e. it shouldn't even need a shadow iommu
> pgtable in the guest but only a single bit in device context entry showing that
> "this device wants to pass-through iommu", so I would expect the perf can be
> similar to explicitly bypass iommu in the qemu cmdline.
They wanted to have a mix of iommu and non-iommu devices in VM
(last merged revision was: [PATCH v5 0/9] IOMMU: Add support for IOMMU Bypass Feature)
But 'why' reasoning was lost somewhere, CCing author.


> 
> Thanks,
> 


