Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 119B72CC3EC
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 18:36:33 +0100 (CET)
Received: from localhost ([::1]:53048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkW3L-0003M4-JG
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 12:36:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kkW2H-0002rt-KK
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 12:35:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kkW2E-0001b0-Cp
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 12:35:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606930520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wc5f2ZtOjA2eNehJJ3ax4T8leKldiBiCbMaY+h0Wiyk=;
 b=CUMgV/1VqZC7Doy4YGueoWnBztXI91w1WxK5YiOktUvfhGctjM9O4KFyRrgJMAeQhgLbPt
 hhdDin2WiI45bDedgvSRynEMS5ZnL28tszsrzsUtle8QMTfrgzssJbaqzlosQgc8KOdEfe
 3vi8OjQBK1YqTPLr5L1WPoKcFE8AzHs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-9D3NjLDNOVubhU6RI3a-tQ-1; Wed, 02 Dec 2020 12:35:18 -0500
X-MC-Unique: 9D3NjLDNOVubhU6RI3a-tQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED433805BEC;
 Wed,  2 Dec 2020 17:35:17 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-199.ams2.redhat.com [10.36.113.199])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD3BB60855;
 Wed,  2 Dec 2020 17:35:07 +0000 (UTC)
Date: Wed, 2 Dec 2020 18:35:06 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 00/18] qapi/qom: QAPIfy object-add
Message-ID: <20201202173506.GH16765@merkur.fritz.box>
References: <db61f61a-1ffa-6185-10dc-3109ff111a35@redhat.com>
 <20201201193528.GC6264@merkur.fritz.box>
 <3449b5d6-d094-84c8-a0ea-4cd25364db2d@redhat.com>
 <20201201220854.GC3836@habkost.net>
 <17afbbfe-209f-e4b2-e9e1-b50abe1fce3c@redhat.com>
 <20201202125124.GD3836@habkost.net>
 <69dff34f-d87b-3a8d-640f-35f6bf5db75c@redhat.com>
 <20201202135451.GE3836@habkost.net>
 <20201202151713.GE16765@merkur.fritz.box>
 <20201202160554.GG3836@habkost.net>
MIME-Version: 1.0
In-Reply-To: <20201202160554.GG3836@habkost.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, qemu-block@nongnu.org, libvir-list@redhat.com,
 armbru@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, kraxel@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 02.12.2020 um 17:05 hat Eduardo Habkost geschrieben:
> > > Looks nice as end goal.  Then, these are a few questions I would
> > > have about the transition plan:
> > > 
> > > Would it require changing both device implementation and device
> > > users in lockstep?  Should we have a compatibility layer to allow
> > > existing qdev_new()+qdev_prop_set_*() code to keep working after
> > > the devices are converted to the new system?  If not, why not?
> > 
> > Technically, it doesn't strictly require a lockstep update. You can have
> > two code paths leading to a fully initialised device, one being the
> > traditional way of setting properties and finally calling dc->realize,
> > the other being a new method that takes the configuration in its
> > parameters and also sets dev->realized = true at the end.
> > 
> > If at all possible, I would however prefer a lockstep update because
> > having two paths is a weird intermediate state and the code paths could
> > easily diverge. Keeping the old way around for a device also means that
> > property setters are still doing two different jobs (initial
> > configuration and updates at runtime).
> 
> I'd like to understand better how that intermediate state would
> look like and why there's risk of separate code paths diverging.
>
> Could we have an intermediate state that doesn't require any
> duplication and thus have no separate code paths that could
> diverge?

The one requirement we have for an intermediate state is that it
supports both interfaces: The well-know create/set properties/realize
dance, and a new DeviceClass method, say .create(), that takes the
configuration in parameters instead of relying on previously set
properties.

I assumed two separate implementations of transferring the configuration
into the internal state. On second thought, this assumption is maybe
wrong.

You can implement the new method as wrapper around the old way: It could
just set all the properties and call realize. Of course, you don't win
much in terms of improving the class implementation this way, but just
support the new interface, but I guess it can be a reasonable
intermediate step to resolve complicated dependencies etc.

It would be much nicer to do the wrapper the other way round, i.e.
setting properties before the device is realized would update a
configuration struct and realize would then call .create() with that
struct. To me, this sounds much harder, though also a more useful state.

As you have worked a lot with properties recently, maybe you have a good
idea how we could get an intermediate state closer to this?

> > > If we add a compatibility layer, is the end goal to convert all
> > > existing qdev_new() users to the new system?  If yes, why?  If
> > > not, why not?
> > 
> > My personal goal is covering -object and -device, i.e. the external
> > interfaces. Converting purely internally created devices is not as
> > interesting (especially as long as we focus only on object creation),
> > but might be desirable for consistency.
> 
> I wonder how much consistency we will lose and how much confusion
> we'll cause if we end up with two completely separate methods for
> creating devices.

I do think we should follow through and convert everything. It's just
not my main motivation, and if the people who work more with qdev think
it's better to leave that part unchanged (or that it won't make much of
a difference), I won't insist.

> > > What about subclasses?  Would base classes need to be converted
> > > in lockstep with all subclasses?  How would the transition
> > > process of (e.g.) PCI devices look like?
> > 
> > I don't think so.
> > 
> > If you want to convert base classes first, you may need to take the
> > path shown above where both initialisation paths coexist while the
> > children are converted because instantiation of a child class involves
> > setting properties of the base class. So you can only restrict these
> > properties to runtime-only after all children have been converted.
> > 
> > The other way around might be easier: You will need to describe the
> > properties of base classes in the QAPI schema from the beginning, but
> > that doesn't mean that their initialisation code has to change just yet.
> > The child classes will need to forward the part of their configuration
> > that belongs to the base class. The downside is that this code will have
> > to be changed again when the base class is finally converted.
> > 
> > So we have options there, and we can decide case by case which one is
> > most appropriate for the specific class to be converted (depending on
> > how many child classes exist, how many properties are inherited, etc.)
> 
> Right now it's hard for me to understand what those intermediate
> states would look like.  It sounds like it requires too many
> complicated manual changes to be done by humans, and lots of room
> for mistakes when maintaining two parallel code paths.  I'd
> prefer to delegate the translation job to a machine.

Maybe devices are in a better shape, but my conclusion from user
creatable objects is that it needs to be done by a human.

Even just writing a schema for an existing object without actually
changing its code (i.e. what this series does for user creatable
objects) involves:

* Figuring out which properties even exist.

  I guess if you know your way around QOM, this could be automatically
  be generated for the common case. If property definitions are
  conditional or dynamic, you'll probably miss them.

* Finding the right data type for each property.

  The const char *type passed to object_(class_)property_add() is often
  enough wrong that it becomes useless. If object_property_add_<type> is
  used, chances are that you know the right type, but strings might
  actually be hidden enums. If not, figuring out the type involves
  analysing the setter and getter callbacks.

* Finding out which properties are mandatory and which are optional.

  This is usually some handwritten check in complete/realize that
  returns an error. Sometimes it's just a segfault that happens sooner
  or later if the property hasn't been set.

* Finding the default for documentation.

  There are multiple ways to do this. It's code, not data.

* Writing (preferably good) documentation for the property.

I see very little opportunity for automating a significant part of this.

Once you have this information, going to the intermediate state where
.create() is just a wrapper that sets properties and calls realize is
fairly easy. Maybe we can have QAPI support for this so that you can
request generation of the wrapper function in the schema. Then you would
just have to set the pointer to it in .class_init.

> In other words, I'd prefer to have compatibility layer(s) that
> would make the same implementation work with the both old-style
> and new-style APIs for creating devices.  Maybe this would
> involve generating QAPI code from QOM/qdev property lists, and/or
> generating qdev property registration code from the QAPI schema,
> I don't know.
> 
> Providing a compatibility layer would also help us be more
> confident that there are no gaps in the abstractions provided by
> the two systems (QOM properties and QAPI schema) that we still
> need to address.

qdev properties could be more useful to generate at least a skeleton
schema from than generic QOM properties. But there will still be large
parts that a human needs to do.

My concern with the compatibility layer is just that it could happen
more easily that we're stuck with it forever.

Kevin


