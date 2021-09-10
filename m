Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A34406DF5
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 17:07:25 +0200 (CEST)
Received: from localhost ([::1]:38648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOi7f-0003xj-Uz
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 11:07:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mOi5W-0002XE-4L
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 11:05:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mOi5S-0007OC-Mm
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 11:05:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631286305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QohFtX1XGTaC4jhd8LwAjE17jfftIX2V4drpHnpOhQ8=;
 b=h9zEgYIkVGG9tc3wH3jSrhxbXp+60fXr/xdgssLU8icZ1g4JAxvARHWvI/Keu3GITJ1QiV
 v2Y8UbC8WS6BQsf51xdA89c2ZMkK3ry/k9ynrDuGYSiVy6ar/XazfpwZQFcPVMHRNdhMje
 LAmoukPckOl+GtsO0/nc8EJTfm5GbPA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-9aUlxYKbOPGcOUXdrmEbCQ-1; Fri, 10 Sep 2021 11:05:03 -0400
X-MC-Unique: 9aUlxYKbOPGcOUXdrmEbCQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D1CA1835ACB
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 15:05:02 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 67E391981F;
 Fri, 10 Sep 2021 15:05:01 +0000 (UTC)
Date: Fri, 10 Sep 2021 17:04:59 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3 6/6] tests/qapi-schema: Test cases for aliases
Message-ID: <YTt0G1cs+BweXOMD@redhat.com>
References: <20210812161131.92017-1-kwolf@redhat.com>
 <20210812161131.92017-7-kwolf@redhat.com>
 <878s09d8pe.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <878s09d8pe.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 06.09.2021 um 17:28 hat Markus Armbruster geschrieben:
> Kevin Wolf <kwolf@redhat.com> writes:
> > +    /* Can still specify the real member name with alias support */
> > +    v = visitor_input_test_init(data, "{ 'foo': 42 }");
> > +    visit_type_AliasStruct1(v, NULL, &tmp, &error_abort);
> > +    g_assert_cmpint(tmp->foo, ==, 42);
> > +    qapi_free_AliasStruct1(tmp);
> > +
> > +    /* The alias is a working alternative */
> > +    v = visitor_input_test_init(data, "{ 'bar': 42 }");
> > +    visit_type_AliasStruct1(v, NULL, &tmp, &error_abort);
> > +    g_assert_cmpint(tmp->foo, ==, 42);
> > +    qapi_free_AliasStruct1(tmp);
> > +
> > +    /* But you can't use both at the same time */
> > +    v = visitor_input_test_init(data, "{ 'foo': 5, 'bar': 42 }");
> > +    visit_type_AliasStruct1(v, NULL, &tmp, &err);
> > +    error_free_or_abort(&err);
> 
> I double-checked this reports "Value for parameter foo was already given
> through an alias", as it should.
> 
> Pointing to what exactly is giving values to foo already would be nice.
> In this case, 'foo' is obvious, but 'bar' is not.  This is not a demand.

We have the name, so we could print it, but it could be in a different
StackObject. I'm not sure if we have a good way to identify a parent
StackObject, and without it the message could be very confusing.

If you have a good idea what the message should look like, I can make an
attempt.

> > +    /* You can't use more than one option at the same time */
> > +    v = visitor_input_test_init(data, "{ 'foo': 42, 'nested': { 'foo': 42 } }");
> > +    visit_type_AliasStruct3(v, NULL, &tmp, &err);
> > +    error_free_or_abort(&err);
> 
> "Parameter 'foo' is unexpected".  Say what?  It *is* expected, it just
> clashes with 'nested.foo'.
> 
> I figure this is what happens:
> 
> * visit_type_AliasStruct3()
> 
>   - visit_start_struct()
> 
>   - visit_type_AliasStruct3_members()
> 
>     • visit_type_AliasStruct1() for member @nested.
> 
>       This consumes consumes input nested.foo.
> 
>   - visit_check_struct()
> 
>     Error: input foo has not been consumed.
> 
> Any ideas on how to report this error more clearly?

It's a result of the logic that wildcard aliases are silently ignored
when they aren't needed. The reason why I included this is that it would
allow you to have two members with the same name in the object
containing the alias and in the aliased object without conflicting as
long as both are given.

Never skipping wildcard aliases makes the code simpler and results in
the expected error message here. So I'll do that for v4.

Note that parsing something like '--chardev type=socket,addr.type=unix,
path=/tmp/sock,id=c' now depends on the order in the generated code. If
the top level 'type' weren't parsed and removed from the input first,
visiting 'addr.type' would now detect a conflict. For union types, we
know that 'type' is always parsed first, so it's not a problem, but in
the general case you need to be careful with the order.

> > +
> > +    v = visitor_input_test_init(data, "{ 'tag': 'eins', 'foo': 6, 'bar': 9 }");
> > +    visit_type_AliasFlatUnion(v, NULL, &tmp, &err);
> > +    error_free_or_abort(&err);
> 
> "Value for parameter foo was already given through an alias".  Good,
> except I'm getting a feeling "already" may be confusing.  It's "already"
> only in the sense that we already got the value via alias, which is an
> implementation detail.  It may or may not be given already in the
> input.  Here it's not: 'bar' follows 'foo'.
> 
> What about "is also given through an alias"?

Sounds good.

> Positive tests look good to me, except they neglect to use any of the
> types using the alias features in QMP.  I think we need something like
> the appended incremental patch.

I'm squashing it in.

Kevin


