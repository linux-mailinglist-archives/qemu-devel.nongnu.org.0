Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99439411270
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 11:59:17 +0200 (CEST)
Received: from localhost ([::1]:57080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSG4x-0001rz-Sl
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 05:59:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1mSG3o-0001BH-LH
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 05:58:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1mSG3k-0002zj-QO
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 05:58:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632131879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jEa5XYyrLi2hB3Ix3WIdeAY3phUZbfYHHgV6RmGT2tc=;
 b=i5m6dSlgICr6uoJdY5qmLPRVyOaZ4IUvj/XpZpk+ZB5De56/4/dRkKi/xRcL3d5xr/J2tb
 PjjyiuY1xMm2zJJTEJNc5n9FHOtJvZsfMDKcQy3gl7Cbvmnjb5tVPg4eNMWa9Mc2P9piXl
 KidG55HzEJbKpd3wVNOyDabKoloSUSw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-20R69-F8PSGTMIk3UN4oOw-1; Mon, 20 Sep 2021 05:57:56 -0400
X-MC-Unique: 20R69-F8PSGTMIk3UN4oOw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05A8B1800D41;
 Mon, 20 Sep 2021 09:57:55 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CB5221F41F;
 Mon, 20 Sep 2021 09:57:06 +0000 (UTC)
Date: Mon, 20 Sep 2021 11:57:03 +0200
From: Peter Krempa <pkrempa@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH RFC 1/5] qapi: Enable enum member introspection to show
 more than name
Message-ID: <YUha7xwblG1cqeNx@angien.pipo.sk>
References: <20210915192425.4104210-1-armbru@redhat.com>
 <20210915192425.4104210-2-armbru@redhat.com>
 <YUSq/ZDfLPInPIc8@angien.pipo.sk>
 <87zgs7bolw.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87zgs7bolw.fsf@dusky.pond.sub.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.476,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berrange@redhat.com,
 libvir-list@redhat.com, eblake@redhat.com, mdroth@linux.vnet.ibm.com,
 qemu-devel@nongnu.org, marcandre.lureau@redhat.com, jsnow@redhat.com,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 20, 2021 at 11:08:59 +0200, Markus Armbruster wrote:
> Peter Krempa <pkrempa@redhat.com> writes:
> 
> > On Wed, Sep 15, 2021 at 21:24:21 +0200, Markus Armbruster wrote:
> >> The next commit will add feature flags to enum members.  There's a
> >> problem, though: query-qmp-schema shows an enum type's members as an
> >> array of member names (SchemaInfoEnum member @values).  If it showed
> >> an array of objects with a name member, we could simply add more
> >> members to these objects.  Since it's just strings, we can't.
> >> 
> >> I can see three ways to correct this design mistake:
> >> 
> >> 1. Do it the way we should have done it, plus compatibility goo.
> >> 
> >>    We want a ['SchemaInfoEnumMember'] member in SchemaInfoEnum.  Since
> >>    changing @values would be a compatibility break, add a new member
> >>    @members instead.
> >> 
> >>    @values is now redundant.  We should be able to get rid of it
> >>    eventually.
> >> 
> >>    In my testing, output of qemu-system-x86_64's query-qmp-schema
> >>    grows by 11% (18.5KiB).
> >
> > I prefer this one. While the schema output grows, nobody is really
> > reading it manually.
> 
> True, but growing schema output can only slow down client startup.
> Negligible for libvirt, I presume?

Libvirt employs caching, so unless it's the first VM started after a
qemu/libvirt upgrade, the results are already processed and cached.

In fact we don't even keep the full schema around, we just extract
information and store them as capability bits. For now we didn't run
into the need to have the full schema around when starting a VM.

[...]

> >> 3. Versioned query-qmp-schema.
> >> 
> >>    query-qmp-schema provides either @values or @members.  The QMP
> >>    client can select which version it wants.
> >
> > At least for libvirt this poses a chicken & egg problem. We'd have to
> > query the schema to see that it has the switch to do the selection and
> > then probe with the modern one.
> 
> The simplest solution is to try the versions the management application
> can understand in order of preference (newest to oldest) until one
> succeeds.  I'd expect the first try to work most of the time.  Only when
> you combine new libvirt with old QEMU, the fallback has to kick in.
> 
> Other parts of the management application should remain oblivous of the
> differences.

That would certainly work and be reasonably straightforward for libvirt
to implement, but:
 1) libvirt's code for using the QMP schema would be exactly the same as
    with approach 1), as we need to handle old clients too and the new
    way is simply a superset of what we have
 2) qemu's deprecation approach itself wouldn't be any easier in either
    of those scenarios

Basically the only thing this would gain us is that if the deprecation
period is over old clients which were not fixed could fail silently:

Assuming that 'query-qmp-schema' gains a boolean option such as
'fancier-enums' and setting that to true returns the new format of
schema, after the deprecation is over you could simply return an error
if a caller omits 'fancier-enums' or sets it to false, which creates a
clean cut for the removal.

With approach 1) itself, clients which were not adapted would start
lacking information based on enum values.

Now for those it depends on how they actually handled it until now. E.g.
old libvirt would report that the QMP schema is broken if 'values' would
be missing.

Whether that's a worthwhile thing to do? I'm not really persuaded. (And
I'm biased since libvirt handles it correctly).

> We could of course try to reduce the number of roundtrips, say by
> putting sufficient information into the QMP greeting (one roundtrip), or
> the output of query-qmp-schema (try oldest to find the best one, then
> try the best one unless it's the oldest).  I doubt that's worthwhile.

In this particular scenario, I'd doubt that it's worthwhile as the
change isn't really fundamental and issuing one extra QMP call isn't as
problematic as other cases, e.g probing of CPU features which results in
a QMP call per feature when starting a VM.

Currently libvirt issues 50 + 5 QMP commands(kvm, and non-kvm) for
probing capabilities.

> I'm not trying to talk you into this solution.  We're just exploring the
> solution space together, and with an open mind.

The idea of unconditionally trying a newer approach is a good one to
hold onto when we'll need it in the future!


