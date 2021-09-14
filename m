Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5778240AFA7
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 15:53:02 +0200 (CEST)
Received: from localhost ([::1]:50828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ8rt-0001xK-A1
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 09:53:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mQ8j3-0007Af-TI
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:43:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mQ8V4-0000z0-4e
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:29:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631626164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Pqq3FfZnNe1rhg4kkhLxEdFiH2q+6aQewFtfhPiZmI=;
 b=JYimd8mpC/dg3QYp7cBXUuNv3bumMDl+H/2pkAfqJZERd2CIGn6xJ3LpMHs9vL0r2KujU6
 oALLLSV7Py8vHhMJ/9S7lHwWbOemJydY7NvIIIWISg+Di3wrWiWZERU3FMvWuYP/ROjefA
 s82FMpMlPrndDBgMmO59tK4X1uqBrvo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-yfBRE7TVM7Cq1HajyrDrvw-1; Tue, 14 Sep 2021 09:29:22 -0400
X-MC-Unique: yfBRE7TVM7Cq1HajyrDrvw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 865B318D6A35
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 13:29:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 318196A908;
 Tue, 14 Sep 2021 13:29:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AD6AE113865F; Tue, 14 Sep 2021 15:29:19 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v3 6/6] tests/qapi-schema: Test cases for aliases
References: <20210812161131.92017-1-kwolf@redhat.com>
 <20210812161131.92017-7-kwolf@redhat.com>
 <878s09d8pe.fsf@dusky.pond.sub.org> <YTt0G1cs+BweXOMD@redhat.com>
 <87bl4vedma.fsf@dusky.pond.sub.org> <YUB0BcZUwwwecrFl@redhat.com>
Date: Tue, 14 Sep 2021 15:29:19 +0200
In-Reply-To: <YUB0BcZUwwwecrFl@redhat.com> (Kevin Wolf's message of "Tue, 14
 Sep 2021 12:05:57 +0200")
Message-ID: <87k0jj8evk.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
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

Kevin Wolf <kwolf@redhat.com> writes:

> Am 14.09.2021 um 10:59 hat Markus Armbruster geschrieben:
>> >> > +    /* You can't use more than one option at the same time */
>> >> > +    v =3D visitor_input_test_init(data, "{ 'foo': 42, 'nested': { =
'foo': 42 } }");
>> >> > +    visit_type_AliasStruct3(v, NULL, &tmp, &err);
>> >> > +    error_free_or_abort(&err);
>> >>=20
>> >> "Parameter 'foo' is unexpected".  Say what?  It *is* expected, it jus=
t
>> >> clashes with 'nested.foo'.
>> >>=20
>> >> I figure this is what happens:
>> >>=20
>> >> * visit_type_AliasStruct3()
>> >>=20
>> >>   - visit_start_struct()
>> >>=20
>> >>   - visit_type_AliasStruct3_members()
>> >>=20
>> >>     =E2=80=A2 visit_type_AliasStruct1() for member @nested.
>> >>=20
>> >>       This consumes consumes input nested.foo.
>> >>=20
>> >>   - visit_check_struct()
>> >>=20
>> >>     Error: input foo has not been consumed.
>> >>=20
>> >> Any ideas on how to report this error more clearly?
>> >
>> > It's a result of the logic that wildcard aliases are silently ignored
>> > when they aren't needed. The reason why I included this is that it wou=
ld
>> > allow you to have two members with the same name in the object
>> > containing the alias and in the aliased object without conflicting as
>> > long as both are given.
>>=20
>> *brain cramp*
>>=20
>> Example?
>
> Let's use the real-world example I mentioned below:
>
> { 'union': 'ChardevBackend',
>   'data': { ...,
>             'socket': 'ChardevSocket',
>             ... },
>   'aliases': [ { 'source': ['data'] } ] }

To pretend the simple union was flat, i.e. peel off its 'data', because
that nesting doesn't exist in the CLI you want to QAPIfy.

>
> { 'struct': 'ChardevSocket',
>   'data': { 'addr': 'SocketAddressLegacy',
>             ... },
>   'base': 'ChardevCommon',
>   'aliases': [ { 'source': ['addr'] } ] }

To unbox struct SocketAddressLegacy, i.e. peel off its 'addr', for the
same reason.

>
> { 'union': 'SocketAddressLegacy',
>   'data': {
>     'inet': 'InetSocketAddress',
>     'unix': 'UnixSocketAddress',
>     'vsock': 'VsockSocketAddress',
>     'fd': 'String' },
>   'aliases': [
>     { 'source': ['data'] },

To pretend the simple union was flat, i.e. peel off its 'data',

>     { 'name': 'fd', 'source': ['data', 'str'] }

To unbox struct String, i.e. peel off its 'data'.

>   ] }

Okay, I understand what you're trying to do.  However:

> We have two simple unions there, and wildcard aliases all the way
> through, so that you can have things like "hostname" on the top level.
> However, two simple unions mean that "type" could refer to either
> ChardevBackend.type or to SocketAddressLegacy.type.

Yup.  In ChardevBackend, we have both a (common) member @type, and a
chain of aliases that resolves @type to data.addr.data.type.

> Even though strictly speaking 'type=3Dsocket' is ambiguous, you don't wan=
t
> to error out, but interpret it as a value for the outer one.

I'm not sure.

When exactly are collisions an error?  How exactly are non-erroneous
collisions resolved?  qapi-code-gen.rst needs to answer this.

Back to the example.  If 'type' resolves to ChardevBackend's member, how
should I specify SocketAddressLegacy's member?  'addr.type'?

Aside: existing -chardev infers SocketAddressLegacy's tag addr.type from
the presence of variant members, but that's a separate QAPIfication
problem.

I figure aliases let me refer to these guys at any level I like:
'data.addr.data.FOO', 'data.addr.FOO', 'addr.data.FOO', 'addr.FOO', or
just 'FOO'.  Except for 'type', where just 'type' means something else.
Bizarre...

We actually require much less: for QMP chardev-add, we need
'data.addr.data.FOO' and nothing else, and for CLI -chardev, we need
'FOO' and nothing else (I think).  The unneeded ones become accidental
parts of the external interface.  If experience is any guide, we'll have
plenty of opportunity to regret such accidents :)

Can we somehow restrict external interfaces to what we actually need?

>> > Never skipping wildcard aliases makes the code simpler and results in
>> > the expected error message here. So I'll do that for v4.
>>=20
>> Trusting your judgement.
>>=20
>> > Note that parsing something like '--chardev type=3Dsocket,addr.type=3D=
unix,
>> > path=3D/tmp/sock,id=3Dc' now depends on the order in the generated cod=
e. If
>> > the top level 'type' weren't parsed and removed from the input first,
>> > visiting 'addr.type' would now detect a conflict. For union types, we
>> > know that 'type' is always parsed first, so it's not a problem, but in
>> > the general case you need to be careful with the order.
>>=20
>> Uff!  I think I'd like to understand this better.  No need to delay v4
>> for that.
>>=20
>> Can't yet say whether we need to spell out the limitation in commit
>> message and/or documentation.
>
> The point where we could error out is when parsing SocketAddressLegacy,
> because there can be two possible providers for "type".
>
> The idea in the current code of this series was that we'll just ignore
> wildcard aliases if we already have a value, because then the value must
> be meant for somewhere else. So it doesn't error out and leaves the
> value in the QDict for someone else to pick it up. If nobody picks it
> up, it's an error "'foo' is unexpected".
>
> If we change it and do error out when there are multiple possible values
> through wildcard aliases, then the only thing that makes it work is that
> ChardevBackend.type is parsed first and is therefore not a possible
> value for SocketAddressLegacy.type any more.

You wrote you're picking the alternative with the simpler code for v4.
Fine with me, as long as it's reasonably easy to explain, in
qapi-code-gen.rst.


