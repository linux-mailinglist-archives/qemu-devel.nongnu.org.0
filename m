Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D00C40CD3E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 21:33:13 +0200 (CEST)
Received: from localhost ([::1]:58046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQaee-0005kg-3S
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 15:33:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mQaXp-0005yl-UK
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 15:26:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mQaXo-0001kZ-5t
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 15:26:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631733967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dbgspBvgFxt9qQH1dj40rdbnpFsaK/gv5LCBDrH1SqU=;
 b=MSkcORRI2UTDI5pmKTMxY2cQzqBOsPsH4KHsLXjmo6KhNMDWC1P5ihdllDU8PCPtZCpzYA
 hGGahF6XF4F4kgAQej51BNHU96f9JCxgIAntGMkJWmuDPNSOvGTgUqXCyJtXCIMqO8vSBs
 /+H90Q8xYmge8ynVNQud86Z7/YXcX1g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-NlmInfhgMaGfw3B3koNuag-1; Wed, 15 Sep 2021 15:26:06 -0400
X-MC-Unique: NlmInfhgMaGfw3B3koNuag-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13D8379EE2;
 Wed, 15 Sep 2021 19:26:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3042B84000;
 Wed, 15 Sep 2021 19:26:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CFD66113865F; Wed, 15 Sep 2021 21:25:58 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 3/3] qapi: deprecate drive-backup
References: <20210505135803.67896-1-vsementsov@virtuozzo.com>
 <20210505135803.67896-4-vsementsov@virtuozzo.com>
 <87eedc1ugb.fsf@dusky.pond.sub.org>
 <3c1c05c3-87ec-c665-00ae-0c0ca312e5bc@virtuozzo.com>
 <874ke7s46i.fsf@dusky.pond.sub.org>
Date: Wed, 15 Sep 2021 21:25:58 +0200
In-Reply-To: <874ke7s46i.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Wed, 09 Jun 2021 12:49:57 +0200")
Message-ID: <87mtod1vzt.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 berrange@redhat.com, qemu-block@nongnu.org, kchamart@redhat.com,
 libvir-list@redhat.com, jsnow@redhat.com, xiechanglong.d@gmail.com,
 qemu-devel@nongnu.org, pkrempa@redhat.com, yur@virtuozzo.com,
 nshirokovskiy@virtuozzo.com, wencongyang2@huawei.com, den@openvz.org,
 eblake@redhat.com, dim@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
>
>> 08.06.2021 14:12, Markus Armbruster wrote:
>>> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
>>> 
>>> [...]
>>> 
>>>> TODO: We also need to deprecate drive-backup transaction action..
>>>> But union members in QAPI doesn't support 'deprecated' feature. I tried
>>>> to dig a bit, but failed :/ Markus, could you please help with it? At
>>>> least by advice?
>>> 
>>> There are two closely related things in play here: the union branch and
>>> the corresponding enum value.
>>> 
>>> So far, the QAPI schema language doesn't support tacking feature flags
>>> to either.
>>> 
>>> If an enum value is deprecated, any union branches corresponding to it
>>> must also be deprecated (because their use requires using the deprecated
>>> enum value).
>>> 
>>> The converse is not true, but I can't see a use for deprecating a union
>>> branch without also deprecating the enum member.
>>> 
>>> I think we can implement feature flags just for enum members, then
>>> document that 'deprecated' enum value implies corresponding union
>>> branches are also deprecated.
>>> 
>>> I have unfinished patches implementing feature flags for enum members.
>>> 
>>> Since TransactionAction is a simple union, the corresponding enum is
>>> implicit.  We can make it explicit by converting to a flat union.
>>> Simple unions need to die anyway.
>>
>>
>> Does BlockStatsSpecific from qapi/block-core.json a correct example of flat union you mean? I can make patch to convert TransactionAction to be similar if that helps (discriminator field should be called "type", yes?).
>
> From docs/devel/qapi-code-gen.txt:
>
>     A simple union can always be re-written as a flat union where the base
>     class has a single member named 'type', and where each branch of the
>     union has a struct with a single member named 'data'.  That is,
>
>      { 'union': 'Simple', 'data': { 'one': 'str', 'two': 'int' } }
>
>     is identical on the wire to:
>
>      { 'enum': 'Enum', 'data': ['one', 'two'] }
>      { 'struct': 'Branch1', 'data': { 'data': 'str' } }
>      { 'struct': 'Branch2', 'data': { 'data': 'int' } }
>      { 'union': 'Flat', 'base': { 'type': 'Enum' }, 'discriminator': 'type',
>        'data': { 'one': 'Branch1', 'two': 'Branch2' } }
>
> The generated C isn't identical, but adjusting the code using it should
> be straightforward.
>
>>> Does this make sense?
>>> 
>>
>> Yes if it helps)
>>
>> Did you also look at John's https://gitlab.com/jsnow/qemu/-/commits/hack-deprecate-union-branches/ ?
>
> Not yet.
>
>> I hope you and John will send patches that you have, I'll help with reviewing (keep me in CC), and finally we'll get the feature.
>
> Sounds like a plan.  I need to get my post-vacation e-mail pileup under
> control first.

Just sent:

Subject: [PATCH RFC 0/5] Subject: [PATCH RFC 0/5] qapi: Add feature flags to enum members
Message-Id: <20210915192425.4104210-1-armbru@redhat.com>

Yes, I mangled the subject %-/


