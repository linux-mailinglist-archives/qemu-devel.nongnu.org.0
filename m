Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDC740DCB4
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 16:31:02 +0200 (CEST)
Received: from localhost ([::1]:40972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQsPl-0004v1-5O
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 10:31:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mQs8K-0003Ya-A0
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 10:13:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mQs8G-0007Yq-M6
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 10:12:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631801575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UxOo1dZZFfMX7PPqVJlHZnMdGobRmH02PkX3+EuHZBQ=;
 b=YiTZxT0q1IiosqxbHFtHjk0PzxwsScdwKuCulLPfSUBuwbTdqVEcwnRe5sRrJKPEthuxTS
 0lSqtNZVpN3ZpTTJebIvqwRVam7P8XII0SRjsk1iXMXCUJzPcxmdbkpQrirMMH9O1C4gsU
 Q8uWAzlYDEwYDrkFju+Lvg0wqCUso0g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-y-GQdPSKOgagNfS74UtjBQ-1; Thu, 16 Sep 2021 10:12:52 -0400
X-MC-Unique: y-GQdPSKOgagNfS74UtjBQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22AD1801B3D;
 Thu, 16 Sep 2021 14:12:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D5065C1CF;
 Thu, 16 Sep 2021 14:12:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C2B1F113865F; Thu, 16 Sep 2021 16:12:37 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH RFC 0/5] Subject: [PATCH RFC 0/5] qapi: Add feature
 flags to enum members
References: <20210915192425.4104210-1-armbru@redhat.com>
 <5b9b9fe9-12e2-c6f3-8430-450f55255d55@virtuozzo.com>
 <87r1do65kl.fsf@dusky.pond.sub.org>
 <1df50f40-1385-9119-126a-56938fde9a92@virtuozzo.com>
Date: Thu, 16 Sep 2021 16:12:37 +0200
In-Reply-To: <1df50f40-1385-9119-126a-56938fde9a92@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Thu, 16 Sep 2021 16:28:40 +0300")
Message-ID: <87ee9o4nje.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
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

> 16.09.2021 15:57, Markus Armbruster wrote:
>> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
>> 
>>> Great! Thanks for working on this!
>>>
>>> 15.09.2021 22:24, Markus Armbruster wrote:
>>>> PATCH 1+2 add feature flags to enum members.  Awkward due to an
>>>> introspection design mistake; see PATCH 1 for details.  Feedback
>>>> welcome, in particular from management application guys.
>>>> PATCH 3+4 implement policy deprecated-input={reject,crash} for enum
>>>> values.
>>>>
>>>> Policy deprecated-output=hide is not implemented, because we can't
>>>> hide a value without hiding the entire member, which is almost
>>>> certainly more than the requester of this policy bargained for.
>>>> Perhaps we want a new policy deprecated-output=crash to help us catch
>>>> unwanted use of deprecated enum values.  Thoughts?
>>>
>>> I think crash policy for output is doubtful. If we have query-*
>>> command that returns a lot of things and some of them are deprecated
>>> the whole command will always crash..
>> 
>> Policy "crash" is not quite as crazy as it may look :)
>> 
>> The non-default policies for handling deprecated interfaces are intended
>> for testing users of these interfaces.
>> 
>> Input policy reject and output policy hide enable "testing the future".
>> 
>> Input policy crash is a robust way to double-check "management
>> application does not send deprecated input".  This is not quite the same
>> as "testing the future".  A management application may choose to send
>> deprecated input, detect the failure and recover.  Testing that should
>> pass with input policy reject, but not with input policy crash.
>> 
>> Output policy crash could be a way to double-check "the management
>> application does not make QEMU send deprecated output".
>> 
>> Example: Say we deprecate BlockdevDriver member 'vvfat'.  We know that
>> output of query-named-block-nodes can contain 'vvfat' only if something
>> creates such nodes.  Input policy reject will reject attempts to use
>> this driver with blockdev-add.  But what if the management application
>> uses some other way to create such nodes, not (yet) covered by input
>> policy?  Output policy crash could be used to double-check it doesn't.
>> 
>> Except it doesn't actually work, because as you said, testing will
>> likely produce *other* deprecated output that should *not* crash the
>> test.
>> 
>> Perhaps a policy hide-or-else-crash could work.
>> 
>>>                                         Deprecated is "use" of the
>>> deprecated field, but we can't control does user use a specific field
>>> or not.
>>>
>>> If some deprecated output is a consequence of deprecated input, we'd
>>> better always show it.. Or in other words, we shouldn't deprecate such
>>> output, deprecating of the corresponding input is enough.
>> 
>> Deprecating only input may require duplicating definitions used both for
>> input and output, unless we replace today's feature flags by something
>> more sophisticated.
>> 
>> Example: BlockdevDriver is used both as input of blockdev-add and as
>> output of query-named-block-nodes.  Deprecate member 'vvfat' affects
>> both input and output.
>
>
> If we deprecate a vvfat, but still have some not deprecated ways to
> create vvfat node, that's a kind of bug[1] in deprecation system: if
> vvfat is deprecated, all ways to create vvfat should go through input
> compat policy.

We need to distinguish between three separate things:

(1) Deprecating certain interface usage

(2) QAPI feature flag 'deprecated'

(3) Policy for handling deprecated interface usage

Note that (2) cannot cover all of (1) for two reasons, only one of them
fixable:

* Some interfaces still aren't QAPI-based.  QAPIfying them all is hard.

* Feature flags only apply to *syntactic* elements, such as a command
  argument.

  Example for a deprecation where they don't apply: we deprecated use of
  chardev-add argument "wait" together with "server": false in v4.0
  (it's an error since v6.0).  Use without "server": false remains okay.

Note further that (3) may cover both less and more than (2).

Before this series, it covers exactly (2).  Afterwards, there is a hole:

    # Limitation: deprecated-output policy @hide is not implemented for
    # enumeration values.  They behave the same as with policy @accept.

But it could also go beyond (2) in the future:

    # Limitation: covers only syntactic aspects of QMP, i.e. stuff tagged
    # with feature 'deprecated'.  We may want to extend it to cover
    # semantic aspects, CLI, and experimental features.

> So, making qemu crash on trying to output "vvfat" for me looks like a
> workaround for that bug[1]. And it's strange to create and interface
> to workaround the internal bug..
>
> May be, we can just enable hide-or-else-crash behavior automatically,
> when user choose input=crash and output=hide?

Hmm, interesting idea.  Needs to be documented, obviously.

[...]


