Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAF840AB6B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 12:07:18 +0200 (CEST)
Received: from localhost ([::1]:41030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ5LR-0007vh-Io
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 06:07:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mQ5KH-0007Bq-12
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 06:06:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mQ5KF-0002qO-EJ
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 06:06:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631613962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k+M65kGbxX6X3XRM63qAv4pvb7EekXPTfUjWIEF1nJg=;
 b=ajr2oKYH42FpQn6d4F16kJs2wXuOn4842uFKE15v9PxBg+bOtLl4wLuWwMdONGqcurtUkl
 T62zKaChpbVTW8SyVcrF/evhsYa5WqLLMtYMN7Fm4hOwkEqQfK9CA9oXXPbUKOwIpO4OvE
 pFotqojLquGr0px3MmI1TofXcyYW2Bo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-NyXMOhtNPS2nHHfCLKopcA-1; Tue, 14 Sep 2021 06:06:00 -0400
X-MC-Unique: NyXMOhtNPS2nHHfCLKopcA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3079A1808300
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 10:06:00 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C9817A8DB;
 Tue, 14 Sep 2021 10:05:59 +0000 (UTC)
Date: Tue, 14 Sep 2021 12:05:57 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3 6/6] tests/qapi-schema: Test cases for aliases
Message-ID: <YUB0BcZUwwwecrFl@redhat.com>
References: <20210812161131.92017-1-kwolf@redhat.com>
 <20210812161131.92017-7-kwolf@redhat.com>
 <878s09d8pe.fsf@dusky.pond.sub.org> <YTt0G1cs+BweXOMD@redhat.com>
 <87bl4vedma.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87bl4vedma.fsf@dusky.pond.sub.org>
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

Am 14.09.2021 um 10:59 hat Markus Armbruster geschrieben:
> >> > +    /* You can't use more than one option at the same time */
> >> > +    v = visitor_input_test_init(data, "{ 'foo': 42, 'nested': { 'foo': 42 } }");
> >> > +    visit_type_AliasStruct3(v, NULL, &tmp, &err);
> >> > +    error_free_or_abort(&err);
> >> 
> >> "Parameter 'foo' is unexpected".  Say what?  It *is* expected, it just
> >> clashes with 'nested.foo'.
> >> 
> >> I figure this is what happens:
> >> 
> >> * visit_type_AliasStruct3()
> >> 
> >>   - visit_start_struct()
> >> 
> >>   - visit_type_AliasStruct3_members()
> >> 
> >>     • visit_type_AliasStruct1() for member @nested.
> >> 
> >>       This consumes consumes input nested.foo.
> >> 
> >>   - visit_check_struct()
> >> 
> >>     Error: input foo has not been consumed.
> >> 
> >> Any ideas on how to report this error more clearly?
> >
> > It's a result of the logic that wildcard aliases are silently ignored
> > when they aren't needed. The reason why I included this is that it would
> > allow you to have two members with the same name in the object
> > containing the alias and in the aliased object without conflicting as
> > long as both are given.
> 
> *brain cramp*
> 
> Example?

Let's use the real-world example I mentioned below:

{ 'union': 'ChardevBackend',
  'data': { ...,
            'socket': 'ChardevSocket',
            ... },
  'aliases': [ { 'source': ['data'] } ] }

{ 'struct': 'ChardevSocket',
  'data': { 'addr': 'SocketAddressLegacy',
            ... },
  'base': 'ChardevCommon',
  'aliases': [ { 'source': ['addr'] } ] }

{ 'union': 'SocketAddressLegacy',
  'data': {
    'inet': 'InetSocketAddress',
    'unix': 'UnixSocketAddress',
    'vsock': 'VsockSocketAddress',
    'fd': 'String' },
  'aliases': [
    { 'source': ['data'] },
    { 'name': 'fd', 'source': ['data', 'str'] }
  ] }

We have two simple unions there, and wildcard aliases all the way
through, so that you can have things like "hostname" on the top level.
However, two simple unions mean that "type" could refer to either
ChardevBackend.type or to SocketAddressLegacy.type.

Even though strictly speaking 'type=socket' is ambiguous, you don't want
to error out, but interpret it as a value for the outer one.

> > Never skipping wildcard aliases makes the code simpler and results in
> > the expected error message here. So I'll do that for v4.
> 
> Trusting your judgement.
> 
> > Note that parsing something like '--chardev type=socket,addr.type=unix,
> > path=/tmp/sock,id=c' now depends on the order in the generated code. If
> > the top level 'type' weren't parsed and removed from the input first,
> > visiting 'addr.type' would now detect a conflict. For union types, we
> > know that 'type' is always parsed first, so it's not a problem, but in
> > the general case you need to be careful with the order.
> 
> Uff!  I think I'd like to understand this better.  No need to delay v4
> for that.
> 
> Can't yet say whether we need to spell out the limitation in commit
> message and/or documentation.

The point where we could error out is when parsing SocketAddressLegacy,
because there can be two possible providers for "type".

The idea in the current code of this series was that we'll just ignore
wildcard aliases if we already have a value, because then the value must
be meant for somewhere else. So it doesn't error out and leaves the
value in the QDict for someone else to pick it up. If nobody picks it
up, it's an error "'foo' is unexpected".

If we change it and do error out when there are multiple possible values
through wildcard aliases, then the only thing that makes it work is that
ChardevBackend.type is parsed first and is therefore not a possible
value for SocketAddressLegacy.type any more.

Kevin


