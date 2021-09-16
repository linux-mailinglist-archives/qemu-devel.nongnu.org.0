Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F7040DA7C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 14:59:53 +0200 (CEST)
Received: from localhost ([::1]:44444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQqzY-0000Jh-83
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 08:59:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mQqy2-0007tX-1x
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 08:58:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mQqxy-0002hr-GV
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 08:58:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631797093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1CXN/aC60ZTrnmCfROIqgO90TOo0jpccr9arq0R4LrQ=;
 b=Gb5S3s1KiExMmVooLSNIaZ4XoilQoETFHLq6kzISe9J/ojl98y1E7uPQA+TO+5v/cl6DN3
 irPVlkV/6hykNxKzH02EVAvYrobZFOwdXpGFaxFfo1OlT6/oDUp//0xRHuw2DjlDM4O/1p
 i5lBpCpFpUy/EseQSx+1FvJEq/MUgw0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-qL6ddL7COCu3bgyevLd4dg-1; Thu, 16 Sep 2021 08:58:11 -0400
X-MC-Unique: qL6ddL7COCu3bgyevLd4dg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A77D6802C8A;
 Thu, 16 Sep 2021 12:58:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9029B19C79;
 Thu, 16 Sep 2021 12:57:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 24B39113865F; Thu, 16 Sep 2021 14:57:46 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH RFC 0/5] Subject: [PATCH RFC 0/5] qapi: Add feature
 flags to enum members
References: <20210915192425.4104210-1-armbru@redhat.com>
 <5b9b9fe9-12e2-c6f3-8430-450f55255d55@virtuozzo.com>
Date: Thu, 16 Sep 2021 14:57:46 +0200
In-Reply-To: <5b9b9fe9-12e2-c6f3-8430-450f55255d55@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Thu, 16 Sep 2021 10:18:20 +0300")
Message-ID: <87r1do65kl.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 libvir-list@redhat.com, eblake@redhat.com, mdroth@linux.vnet.ibm.com,
 qemu-devel@nongnu.org, marcandre.lureau@redhat.com, jsnow@redhat.com,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> Great! Thanks for working on this!
>
> 15.09.2021 22:24, Markus Armbruster wrote:
>> PATCH 1+2 add feature flags to enum members.  Awkward due to an
>> introspection design mistake; see PATCH 1 for details.  Feedback
>> welcome, in particular from management application guys.
>> PATCH 3+4 implement policy deprecated-input={reject,crash} for enum
>> values.
>>
>> Policy deprecated-output=hide is not implemented, because we can't
>> hide a value without hiding the entire member, which is almost
>> certainly more than the requester of this policy bargained for.
>> Perhaps we want a new policy deprecated-output=crash to help us catch
>> unwanted use of deprecated enum values.  Thoughts?
>
> I think crash policy for output is doubtful. If we have query-*
> command that returns a lot of things and some of them are deprecated
> the whole command will always crash..

Policy "crash" is not quite as crazy as it may look :)

The non-default policies for handling deprecated interfaces are intended
for testing users of these interfaces.

Input policy reject and output policy hide enable "testing the future".

Input policy crash is a robust way to double-check "management
application does not send deprecated input".  This is not quite the same
as "testing the future".  A management application may choose to send
deprecated input, detect the failure and recover.  Testing that should
pass with input policy reject, but not with input policy crash.

Output policy crash could be a way to double-check "the management
application does not make QEMU send deprecated output".

Example: Say we deprecate BlockdevDriver member 'vvfat'.  We know that
output of query-named-block-nodes can contain 'vvfat' only if something
creates such nodes.  Input policy reject will reject attempts to use
this driver with blockdev-add.  But what if the management application
uses some other way to create such nodes, not (yet) covered by input
policy?  Output policy crash could be used to double-check it doesn't.

Except it doesn't actually work, because as you said, testing will
likely produce *other* deprecated output that should *not* crash the
test.

Perhaps a policy hide-or-else-crash could work.

>                                        Deprecated is "use" of the
> deprecated field, but we can't control does user use a specific field
> or not.
>
> If some deprecated output is a consequence of deprecated input, we'd
> better always show it.. Or in other words, we shouldn't deprecate such
> output, deprecating of the corresponding input is enough.

Deprecating only input may require duplicating definitions used both for
input and output, unless we replace today's feature flags by something
more sophisticated.

Example: BlockdevDriver is used both as input of blockdev-add and as
output of query-named-block-nodes.  Deprecate member 'vvfat' affects
both input and output.

> So, we are saying about showing some internal state to the user. And
> part of this state becomes deprecated because internal implementation
> changed. I think the only correct thing to do is handle
> deprecated=hide by hand, in the place where we set this deprecated
> field. Only at this place we can decide, should we simulate old
> deprecated output value or not. For this we'll need a possibility to
> get current policy at any place, but that doesn't seem to be a
> problem, I see, it's just a global variable compat_policy.

I'm not sure I fully got this.

Compat policies are not about optionally providing older versions of an
interface ("simulate old deprecated output value").  They try to help
with testing users of interfaces.  One aspect of that is optionally
approximating expected future interfaces.


