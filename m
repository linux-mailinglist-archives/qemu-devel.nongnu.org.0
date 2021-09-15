Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E97AC40C2C1
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 11:28:29 +0200 (CEST)
Received: from localhost ([::1]:35036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQRDQ-0000XP-Il
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 05:28:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mQR9r-0007yi-Uw
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 05:24:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mQR9o-0005OE-St
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 05:24:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631697884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Btno7VFSbEKRCBYKMAzYV5lgees2sTR0A0YjNbj/EY=;
 b=Wk4p855aCz2M1jUw+s9dWru2PXA5S8YYiuDPdS8nhZQ5M7PsGlMKvq+IuRZ1o69zjLXkXf
 vSjDPPRuI1Z1d1Yp09IkBwA0gzxD+P5WCRzdqPPopTMWaYX4DLHxUrMeGkxUEAr86rEDre
 XDIcOo/2OMEZbhdtsXyHvWj1bg0YQdg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-GJA5jWD1PWCZqpFA5jym2w-1; Wed, 15 Sep 2021 05:24:41 -0400
X-MC-Unique: GJA5jWD1PWCZqpFA5jym2w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5A6D802935
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 09:24:40 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA424226E9;
 Wed, 15 Sep 2021 09:24:39 +0000 (UTC)
Date: Wed, 15 Sep 2021 11:24:38 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3 6/6] tests/qapi-schema: Test cases for aliases
Message-ID: <YUG71uATYCwpRyQH@redhat.com>
References: <20210812161131.92017-1-kwolf@redhat.com>
 <20210812161131.92017-7-kwolf@redhat.com>
 <878s09d8pe.fsf@dusky.pond.sub.org> <YTt0G1cs+BweXOMD@redhat.com>
 <87bl4vedma.fsf@dusky.pond.sub.org> <YUB0BcZUwwwecrFl@redhat.com>
 <87k0jj8evk.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87k0jj8evk.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 14.09.2021 um 15:29 hat Markus Armbruster geschrieben:
> Kevin Wolf <kwolf@redhat.com> writes:
> 
> > Am 14.09.2021 um 10:59 hat Markus Armbruster geschrieben:
> >> >> > +    /* You can't use more than one option at the same time */
> >> >> > +    v = visitor_input_test_init(data, "{ 'foo': 42, 'nested': { 'foo': 42 } }");
> >> >> > +    visit_type_AliasStruct3(v, NULL, &tmp, &err);
> >> >> > +    error_free_or_abort(&err);
> >> >> 
> >> >> "Parameter 'foo' is unexpected".  Say what?  It *is* expected, it just
> >> >> clashes with 'nested.foo'.
> >> >> 
> >> >> I figure this is what happens:
> >> >> 
> >> >> * visit_type_AliasStruct3()
> >> >> 
> >> >>   - visit_start_struct()
> >> >> 
> >> >>   - visit_type_AliasStruct3_members()
> >> >> 
> >> >>     • visit_type_AliasStruct1() for member @nested.
> >> >> 
> >> >>       This consumes consumes input nested.foo.
> >> >> 
> >> >>   - visit_check_struct()
> >> >> 
> >> >>     Error: input foo has not been consumed.
> >> >> 
> >> >> Any ideas on how to report this error more clearly?
> >> >
> >> > It's a result of the logic that wildcard aliases are silently ignored
> >> > when they aren't needed. The reason why I included this is that it would
> >> > allow you to have two members with the same name in the object
> >> > containing the alias and in the aliased object without conflicting as
> >> > long as both are given.
> >> 
> >> *brain cramp*
> >> 
> >> Example?
> >
> > Let's use the real-world example I mentioned below:
> >
> > { 'union': 'ChardevBackend',
> >   'data': { ...,
> >             'socket': 'ChardevSocket',
> >             ... },
> >   'aliases': [ { 'source': ['data'] } ] }
> 
> To pretend the simple union was flat, i.e. peel off its 'data', because
> that nesting doesn't exist in the CLI you want to QAPIfy.
> 
> >
> > { 'struct': 'ChardevSocket',
> >   'data': { 'addr': 'SocketAddressLegacy',
> >             ... },
> >   'base': 'ChardevCommon',
> >   'aliases': [ { 'source': ['addr'] } ] }
> 
> To unbox struct SocketAddressLegacy, i.e. peel off its 'addr', for the
> same reason.
> 
> >
> > { 'union': 'SocketAddressLegacy',
> >   'data': {
> >     'inet': 'InetSocketAddress',
> >     'unix': 'UnixSocketAddress',
> >     'vsock': 'VsockSocketAddress',
> >     'fd': 'String' },
> >   'aliases': [
> >     { 'source': ['data'] },
> 
> To pretend the simple union was flat, i.e. peel off its 'data',
> 
> >     { 'name': 'fd', 'source': ['data', 'str'] }
> 
> To unbox struct String, i.e. peel off its 'data'.
> 
> >   ] }
> 
> Okay, I understand what you're trying to do.  However:
> 
> > We have two simple unions there, and wildcard aliases all the way
> > through, so that you can have things like "hostname" on the top level.
> > However, two simple unions mean that "type" could refer to either
> > ChardevBackend.type or to SocketAddressLegacy.type.
> 
> Yup.  In ChardevBackend, we have both a (common) member @type, and a
> chain of aliases that resolves @type to data.addr.data.type.
> 
> > Even though strictly speaking 'type=socket' is ambiguous, you don't want
> > to error out, but interpret it as a value for the outer one.
> 
> I'm not sure.

It's the only possible syntax for specifying ChardevBackend.type, so if
you don't allow this, everything breaks down.

> When exactly are collisions an error?  How exactly are non-erroneous
> collisions resolved?  qapi-code-gen.rst needs to answer this.

The strategy implemented in this version is: Collisions are generally an
error, except for wildcard aliases conflicting with a non-wildcard-alias
value. In this case the wildcard alias is ignored and the value is
assumed to belong elsewhere.

If it doesn't belong elsewhere in the end, it still sits in the QDict
when qobject_input_check_struct() runs, so you get an error.

> Back to the example.  If 'type' resolves to ChardevBackend's member, how
> should I specify SocketAddressLegacy's member?  'addr.type'?
> 
> Aside: existing -chardev infers SocketAddressLegacy's tag addr.type from
> the presence of variant members, but that's a separate QAPIfication
> problem.

So does the new -chardev in its compatibility code, but if you want to
specify it explicitly, addr.type is what you should use.

> I figure aliases let me refer to these guys at any level I like:
> 'data.addr.data.FOO', 'data.addr.FOO', 'addr.data.FOO', 'addr.FOO', or
> just 'FOO'.  Except for 'type', where just 'type' means something else.
> Bizarre...

About as bizarre as shadowing variables in C. The more local one wins.

> We actually require much less: for QMP chardev-add, we need
> 'data.addr.data.FOO' and nothing else, and for CLI -chardev, we need
> 'FOO' and nothing else (I think).  The unneeded ones become accidental
> parts of the external interface.  If experience is any guide, we'll have
> plenty of opportunity to regret such accidents :)
> 
> Can we somehow restrict external interfaces to what we actually need?

Not reasonably, I would say. Of course, you could try to cover all
paths with aliases in the top level, but the top level really shouldn't
have to know about the details of types deep inside some union variants.

The solution for reducing the allowed options here is to work on
introspection, mark 'data' deprecated everywhere and get rid of the
simple union nonsense.

> >> > Never skipping wildcard aliases makes the code simpler and results in
> >> > the expected error message here. So I'll do that for v4.
> >> 
> >> Trusting your judgement.
> >> 
> >> > Note that parsing something like '--chardev type=socket,addr.type=unix,
> >> > path=/tmp/sock,id=c' now depends on the order in the generated code. If
> >> > the top level 'type' weren't parsed and removed from the input first,
> >> > visiting 'addr.type' would now detect a conflict. For union types, we
> >> > know that 'type' is always parsed first, so it's not a problem, but in
> >> > the general case you need to be careful with the order.
> >> 
> >> Uff!  I think I'd like to understand this better.  No need to delay v4
> >> for that.
> >> 
> >> Can't yet say whether we need to spell out the limitation in commit
> >> message and/or documentation.
> >
> > The point where we could error out is when parsing SocketAddressLegacy,
> > because there can be two possible providers for "type".
> >
> > The idea in the current code of this series was that we'll just ignore
> > wildcard aliases if we already have a value, because then the value must
> > be meant for somewhere else. So it doesn't error out and leaves the
> > value in the QDict for someone else to pick it up. If nobody picks it
> > up, it's an error "'foo' is unexpected".
> >
> > If we change it and do error out when there are multiple possible values
> > through wildcard aliases, then the only thing that makes it work is that
> > ChardevBackend.type is parsed first and is therefore not a possible
> > value for SocketAddressLegacy.type any more.
> 
> You wrote you're picking the alternative with the simpler code for v4.
> Fine with me, as long as it's reasonably easy to explain, in
> qapi-code-gen.rst.

I think I've come to the conclusion that it's not easy enough to
explain. As long as the parsing order should remain an implementation
detail that schema authors shouldn't rely on, it's not possible at all.

It's a pity because the code would have been simpler and it would
probably have worked for the cases we're interested in. But it doesn't
work in all hypothetical cases and we can't document the conditions for
that without making people rely on the parsing order.

Kevin


