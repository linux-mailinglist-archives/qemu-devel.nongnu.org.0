Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8421C2EB03A
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 17:38:43 +0100 (CET)
Received: from localhost ([::1]:52674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwpM2-0003dp-Jo
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 11:38:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kwpHf-0007d3-D6
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:34:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kwpHd-0003d7-BE
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:34:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609864448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S2gw8mEJSc7DJMJJ12Kk50aiY/R/YH+0OL5guzAknTo=;
 b=RfUldfS5NHKvYslwIM1poVUJ+YEvIOSt7qy7Mo0lEWl5MdG6P/gU/LgOmWkKrdeI4R+bQG
 SBGENI8tTyu/GBPo4o5AKUA5qJqg/PzAjDpWOG1y5bruB3M6rnA2oS0oIBqhoN0P2In5El
 8NRTEK2OSsUJUXSp13XVFyqWrmYX4eM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-9YGqG3RuMzSh9iwc-PGnBQ-1; Tue, 05 Jan 2021 11:34:05 -0500
X-MC-Unique: 9YGqG3RuMzSh9iwc-PGnBQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3720100559A
 for <qemu-devel@nongnu.org>; Tue,  5 Jan 2021 16:33:53 +0000 (UTC)
Received: from localhost (unknown [10.40.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B85D62677;
 Tue,  5 Jan 2021 16:33:51 +0000 (UTC)
Date: Tue, 5 Jan 2021 17:33:50 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH 5/5] i386: provide simple 'hyperv=on' option to x86
 machine types
Message-ID: <20210105173350.01366101@redhat.com>
In-Reply-To: <87czyjifmb.fsf@vitty.brq.redhat.com>
References: <20201119103221.1665171-1-vkuznets@redhat.com>
 <20201119103221.1665171-6-vkuznets@redhat.com>
 <20201216205202.GJ3140057@habkost.net>
 <20201218181340.5e398280@redhat.com>
 <87r1n0j20n.fsf@vitty.brq.redhat.com>
 <20210104182906.GD18467@habkost.net>
 <20210105003650.71f39045@redhat.com>
 <20210105143431.GL18467@habkost.net>
 <87czyjifmb.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 05 Jan 2021 16:10:36 +0100
Vitaly Kuznetsov <vkuznets@redhat.com> wrote:

> Eduardo Habkost <ehabkost@redhat.com> writes:
> 
> > On Tue, Jan 05, 2021 at 12:36:50AM +0100, Igor Mammedov wrote:  
> >> 
> >> documenting is good, but if it adds new semantics to how CPU features are handled
> >> users up the stack will need code it up as well and juggle with
> >>  -machine + -cpu + -device cpu-foo
> >> not to mention poor developers who will have to figure out why we do
> >> set CPU properties in multiple different ways.
> >> 
> >> however if we add it as CPU properties that behave the same way as other
> >> properties, all mgmt has to do is expose new property to user for usage.  
> >
> > I think we need to be careful here.  Sometimes just exposing the
> > QOM properties used to implemented a feature is not the best user
> > interface.  e.g.: even if using compat_props for implementing the
> > hyperv features preset, that doesn't automatically mean we want
> > hyperv=on to be a -cpu option.
> >
> > I would even argue we shouldn't be focusing on implementation
> > details (like we are doing right now) until the desired external
> > interface is described clearly.  
> 
> I agree, the interface is definitely more important than the
> implementation here. AFAIU we have two options suggested:
> 
> 1) 'hyperv=on' option for x86 machine types.
> 
> Pros: we can use it later to create non-CPU Hyper-V devices
> (e.g. Vmbus).
> Cons: two different places for the currently existing Hyper-V features
> enablement (-cpu and -machine), non-standard way of doing things
> (code-wise).
> 
> 2) 'hv_default=on' -cpu option
> 
> Pros: Single place to enable all Hyper-V enlightenments, we can make it
> mutually exclusive with other hv_* options including hv_passthrough
> (clear semantics).
> 
> Cons: This can't be reused to create non-CPU objects in the future and
> so upper layers will (again) need to be modified.
> 
> There's probably more, please feel free to add.
#1 can be implemented on top of #2, when it becomes necessary.


> >> however in this case we are talking about a set of cpu features,
> >> if there is no way to implement it as cpu properties + compat properties
> >> and requires opencodding it within machine code it might be fine
> >> but I fail to see a very good reason for doing that at this momment.  
> >
> > The reason would be just simplicity of implementation.
> >
> > I understand there are reasons to suggest using compat_props if
> > it makes things simpler, but I don't see why we would reject a
> > patch because the implementation is not based purely on
> > compat_props.
> >
> > I will let Vitaly to decide how to proceed, based on our
> > feedback.  I encourage him to use compat_props like you suggest,
> > but I don't plan to make this a requirement.
> >  
> 
> Like I replied to Igor in a parallel thread, I hardly see how using
> compat_props can simplify things in case we decide to keep 'hyperv=on' a
> machine type option. It doesn't seem to fit our use-case when we need a
> mechanism to alter CPU properties for the current machine type as well
> as subtract some features for the old ones. If we, however, decide that
> '-cpu' option is better, then we can try to make it work (but the
> implementation won't be straitforward either). 
lets discuss it in that thread.


