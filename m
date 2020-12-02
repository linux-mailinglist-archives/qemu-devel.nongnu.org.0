Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 809362CC09F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 16:19:48 +0100 (CET)
Received: from localhost ([::1]:41912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkTv1-0002Mh-1t
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 10:19:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kkTst-0001cK-CO
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 10:17:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kkTsr-0002Yp-Gm
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 10:17:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606922252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yOIWwXyusky/u1fOr1LqW8Hn/OwA4acIj4aD9q39NeA=;
 b=YYHvLmJpkB2XqBE+nnZbqad9pLqpS/9up7a9Fvk06A40er5dbltABoCwGZMUbIRbzBX5g9
 LUe8xtSxPhh88Y4mW+fBYqbhRbzwlp/f9uc7+ivtwjJpbFaadp/2KCyNoUUaquNxhvNIil
 QEZva15siZN6glOHvJcCg7QaUb5iT5I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-a3pTdgkmOQOYYsJjFuPPnA-1; Wed, 02 Dec 2020 10:17:29 -0500
X-MC-Unique: a3pTdgkmOQOYYsJjFuPPnA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D9458042B5;
 Wed,  2 Dec 2020 15:17:27 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-199.ams2.redhat.com [10.36.113.199])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AD77660C69;
 Wed,  2 Dec 2020 15:17:14 +0000 (UTC)
Date: Wed, 2 Dec 2020 16:17:13 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 00/18] qapi/qom: QAPIfy object-add
Message-ID: <20201202151713.GE16765@merkur.fritz.box>
References: <65a9600f-ca8c-ef29-94d8-d9ea114e5e06@redhat.com>
 <20201201162042.GB6264@merkur.fritz.box>
 <db61f61a-1ffa-6185-10dc-3109ff111a35@redhat.com>
 <20201201193528.GC6264@merkur.fritz.box>
 <3449b5d6-d094-84c8-a0ea-4cd25364db2d@redhat.com>
 <20201201220854.GC3836@habkost.net>
 <17afbbfe-209f-e4b2-e9e1-b50abe1fce3c@redhat.com>
 <20201202125124.GD3836@habkost.net>
 <69dff34f-d87b-3a8d-640f-35f6bf5db75c@redhat.com>
 <20201202135451.GE3836@habkost.net>
MIME-Version: 1.0
In-Reply-To: <20201202135451.GE3836@habkost.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Am 02.12.2020 um 14:54 hat Eduardo Habkost geschrieben:
> On Wed, Dec 02, 2020 at 02:26:44PM +0100, Paolo Bonzini wrote:
> > On 02/12/20 13:51, Eduardo Habkost wrote:
> > > > > I'm liking the direction this is taking.  However, I would still
> > > > > like to have a clearer and feasible plan that would work for
> > > > > -device, -machine, and -cpu.
> > > > 
> > > > -cpu is not a problem since it's generally created with a static
> > > > configuration (now done with global properties, in the future it could be a
> > > > struct).
> > > 
> > > It is a problem if it requires manually converting existing code
> > > defining CPU properties and we don't have a transition plan.
> > 
> > We do not have to convert everything _if_ for some objects there are good
> > reasons to do programmatically-generated properties.  CPUs might be one of
> > those cases (or if we decide to convert them, they might endure some more
> > code duplication than other devices because they have so many properties).
> 
> OK, we just need to agree on what the transition will look like
> when we do it.  I think we should put as much care into
> transition/glue infrastructure as we put into the new
> infrastructure.
> 
> 
> > 
> > > Would a -device conversion also involve non-user-creatable
> > > devices, or would we keep existing internal usage of QOM
> > > properties?
> > > 
> > > Even if it's just for user-creatable devices, getting rid of QOM
> > > property usage in devices sounds like a very ambitious goal.  I'd
> > > like us to have a good transition plan, in addition to declaring
> > > what's our ideal end goal.
> > 
> > For user-creatable objects Kevin is doing work in lockstep on all classes;
> > but once we have the infrastructure for QAPI object configuration schemas we
> > can proceed in the other direction and operate on one device at a time.
> > 
> > With some handwaving, something like (see create_unimplemented_device)
> > 
> >     DeviceState *dev = qdev_new(TYPE_UNIMPLEMENTED_DEVICE);
> > 
> >     qdev_prop_set_string(dev, "name", name);
> >     qdev_prop_set_uint64(dev, "size", size);
> >     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> > 
> > might become something like
> > 
> >     { 'object': 'unimplemented-device',
> >       'config': {
> >          'name': 'str',
> >          'size': 'size'
> >       },
> >     }
> > 
> >     DeviceState *dev = qapi_Unimplemented_new(&(
> >          (UnimplementedDeviceOptions) {
> >              .name = name,
> >              .size = size
> >          }, &error_fatal);
> >     object_unref(dev);
> > 
> > (i.e. all typesafe!) and the underlying code would be something like
> [...]
> > 
> 
> Looks nice as end goal.  Then, these are a few questions I would
> have about the transition plan:
> 
> Would it require changing both device implementation and device
> users in lockstep?  Should we have a compatibility layer to allow
> existing qdev_new()+qdev_prop_set_*() code to keep working after
> the devices are converted to the new system?  If not, why not?

Technically, it doesn't strictly require a lockstep update. You can have
two code paths leading to a fully initialised device, one being the
traditional way of setting properties and finally calling dc->realize,
the other being a new method that takes the configuration in its
parameters and also sets dev->realized = true at the end.

If at all possible, I would however prefer a lockstep update because
having two paths is a weird intermediate state and the code paths could
easily diverge. Keeping the old way around for a device also means that
property setters are still doing two different jobs (initial
configuration and updates at runtime).

> If we add a compatibility layer, is the end goal to convert all
> existing qdev_new() users to the new system?  If yes, why?  If
> not, why not?

My personal goal is covering -object and -device, i.e. the external
interfaces. Converting purely internally created devices is not as
interesting (especially as long as we focus only on object creation),
but might be desirable for consistency.

> What about subclasses?  Would base classes need to be converted
> in lockstep with all subclasses?  How would the transition
> process of (e.g.) PCI devices look like?

I don't think so.

If you want to convert base classes first, you may need to take the
path shown above where both initialisation paths coexist while the
children are converted because instantiation of a child class involves
setting properties of the base class. So you can only restrict these
properties to runtime-only after all children have been converted.

The other way around might be easier: You will need to describe the
properties of base classes in the QAPI schema from the beginning, but
that doesn't mean that their initialisation code has to change just yet.
The child classes will need to forward the part of their configuration
that belongs to the base class. The downside is that this code will have
to be changed again when the base class is finally converted.

So we have options there, and we can decide case by case which one is
most appropriate for the specific class to be converted (depending on
how many child classes exist, how many properties are inherited, etc.)

Kevin


