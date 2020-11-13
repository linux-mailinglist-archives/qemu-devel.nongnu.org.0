Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6482B2B1899
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 10:47:21 +0100 (CET)
Received: from localhost ([::1]:49730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdVfs-0002iH-Fr
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 04:47:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdVep-0002GN-Bu
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 04:46:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdVem-000172-TJ
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 04:46:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605260771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DZ4IRHsUgtsxzj6LeKVE9uxp2esRwI5cgPY1P4wQTyo=;
 b=f5jpBCwgvKEbeGaPwNlzNTzbHnx9fK5/GD+MrIw1gwWM2CmFq4NF3CjW3HATzNT0qS2sAL
 iox57YwyjmOGSJK2IBQMZFmtsTkR5zfnd6mkO3Z4fabEnTpBe2qE8nsu9AQjQ3EAFx4qZ9
 +PY6Jyn2erSJTWS7IdajKWR2I8vH8nI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-cUG6-r1nNJaYfkHyopiiqA-1; Fri, 13 Nov 2020 04:46:09 -0500
X-MC-Unique: cUG6-r1nNJaYfkHyopiiqA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4A2C6D246
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 09:46:08 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-99.ams2.redhat.com [10.36.114.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C0BB55795;
 Fri, 13 Nov 2020 09:46:03 +0000 (UTC)
Date: Fri, 13 Nov 2020 10:46:02 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 5/6] qapi: Add support for aliases
Message-ID: <20201113094602.GB5834@merkur.fritz.box>
References: <20201112172850.401925-1-kwolf@redhat.com>
 <20201112172850.401925-6-kwolf@redhat.com>
 <7864bd70-5567-134f-9238-bbed8a5fbfdb@redhat.com>
MIME-Version: 1.0
In-Reply-To: <7864bd70-5567-134f-9238-bbed8a5fbfdb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: libvir-list@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 12.11.2020 um 19:34 hat Eric Blake geschrieben:
> On 11/12/20 11:28 AM, Kevin Wolf wrote:
> > Introduce alias definitions for object types (structs and unions). This
> > allows using the same QAPI type and visitor for many syntax variations
> > that exist in the external representation, like between QMP and the
> > command line. It also provides a new tool for evolving the schema while
> > maintaining backwards compatibility during a deprecation period.
> 
> Cool! Obvious followup patch series: deprecate all QAPI members spelled
> with _ by making them aliases of new members spelled with -, so that we
> can finally have consistent spellings.

Ah, that's a nice one, too. I didn't even think of it. Another one I'd
like to see is deprecation of SocketAddressLegacy.

There is one part missing in this series that we would first need to
address before we can actually use it to evolve parts of the schema that
are visible in QMP: Exposing aliases in introspection and expressing
that the original name of something is deprecated, but the alias will
stay around (and probably also deprecating an alias without the original
name or other aliases).

If we can easily figure out a way to express this that everyone agrees
with, I'm happy to include it in this series. Otherwise, since the first
user is the command line and not QMP, I'd leave that for the future.

For example, imagine we have an option 'foo' with a new alias 'bar'. If
we just directly expose the alias rule (which would be the simplest
solution from the QEMU perspective), management will check if the alias
exists before accessing 'bar'. But in the final state, we remove 'foo'
and 'bar' is not an alias any more, so the introspection for 'bar' would
change. Is this desirable?

On the other hand, we can't specify both as normal options because you
must set (at most) one of them, but not both. Also exposing things as
normal options becomes hard with wildcard aliases (mapping all fields
from a nested struct), especially if unions are involved where some
options exist in one or two variants, but not in others.

Given this, I think just exposing the alias rules and letting the
management tool check both alternatives - if the alias rule or the
future option exists - might actually still be the least bad option.

Hmm, I guess I should CC libvirt for this discussion, actually. :-)

> > +=== Aliases ===
> > +
> > +Object types, including structs and unions, can contain alias
> > +definitions.
> > +
> > +Aliases define alternative member names that may be used in the
> > +external representation to provide a value for a member in the same
> > +object or in a nested object.
> > +
> > +Syntax:
> > +    ALIAS = { '*alias': STRING,
> > +              'source': [ STRING, ... ] }
> > +
> > +'source' is a list of member names representing the path to an object
> > +member, starting from the type where the alias definition is
> > +specified.  It may refer to another alias name.  It is allowed to use
> > +a path that doesn't necessarily match an existing member in every
> > +variant or even at all; in this case, the alias remains unused.
> > +
> > +If 'alias' is present, then the single member referred to by 'source'
> > +is made accessible with the name given in 'alias' in the type where
> > +the alias definition is specified.
> > +
> > +If 'alias' is not present, then all members in the object referred to
> > +by 'source' are made accessible in the type where the alias definition
> > +is specified with the same name as they have in 'source'.
> 
> Is it worth an example of how to use this?

Yes, I should have included an example. Or actually, probably one
example for aliasing a single field and another one for a wildcard alias
that maps all fields in a struct.

Kevin


