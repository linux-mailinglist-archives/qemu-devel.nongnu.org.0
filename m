Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DC14E8F4A
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 09:50:47 +0200 (CEST)
Received: from localhost ([::1]:38588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYk9G-00085M-67
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 03:50:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nYk5V-0005i3-Tp
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 03:46:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nYk5R-0002TD-I6
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 03:46:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648453608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2qO6DSc3X3H++33wTxXIWJ00szA9xBtCDFD5c6m9E6s=;
 b=WpRrM4u2xFCGYQhSp3syIfhPNF+fGhBkYzr3XEBmbmppshXJ+a/T1QcNqyJCvtLh4AhhY9
 qKVMeSV9zI5w1VJVpU21AHaPieAPAIOhsDa8zEXqySXdcd3SFx8z2zXR2mq1qcrc9twSVS
 ssNTDSD1P62LXRIjOSTN/C1DVICego0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-joR8SoLhOTiq7Asfa5FXyQ-1; Mon, 28 Mar 2022 03:46:47 -0400
X-MC-Unique: joR8SoLhOTiq7Asfa5FXyQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B33BB38009FC
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 07:46:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C6F39401475;
 Mon, 28 Mar 2022 07:46:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8FB1B21E691D; Mon, 28 Mar 2022 09:46:40 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Victor Toso <victortoso@redhat.com>
Subject: "Future directions" vs. "TODO" in doc comments (was: [PATCH 01/14]
 qapi: BlockExportRemoveMode: move comments to TODO)
References: <20220324175015.232794-1-victortoso@redhat.com>
 <20220324175015.232794-2-victortoso@redhat.com>
 <87tubmnrde.fsf@pond.sub.org>
 <CAFn=p-bS-at1xvCok2LZzXhgFtc14E-2GfTCZf6Se2Fm6Q6PWA@mail.gmail.com>
 <20220325204724.g4utzgpmqk4skgm6@tapioca>
Date: Mon, 28 Mar 2022 09:46:40 +0200
In-Reply-To: <20220325204724.g4utzgpmqk4skgm6@tapioca> (Victor Toso's message
 of "Fri, 25 Mar 2022 21:47:24 +0100")
Message-ID: <87lewubjtr.fsf_-_@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Victor Toso <victortoso@redhat.com> writes:

> Hi,
>
> On Fri, Mar 25, 2022 at 11:11:23AM -0400, John Snow wrote:
>> On Fri, Mar 25, 2022, 8:33 AM Markus Armbruster <armbru@redhat.com> wrote:

[...]

>> > Doc comments embed user documentation in the source code.  The doc
>> > generator extracts it.
>> >
>> > TODOs are generally for developers.  Should the doc generator suppress
>> > TODO sections?
>> 
>> Needs an audit to make sure we're using it consistently with
>> that semantic, but broadly it's probably a good idea to squelch
>> "internal" todos, yes.
>> 
>> Things like "Watch out, were definitely gonna deprecate this
>> soon probably maybe!" can stay outside of the TODO section.
>> (Sometimes heads up are legitimate, even if most won't read
>> them. the faithful and diligent will be rewarded with painless
>> upgrades.)

This is "future directions", not quite the same as "TODO".

Would a section tag "Future directions" make sense?

> There are 5 TODO sections in QAPI (including this patch):

Let me try to sort them into "TODO" and "future directions" buckets.
The former are of interest for developers only, and thus should be
elided from documentation meant for users.

>  qapi/block-export.json:222:# TODO: Potential additional modes to be added in the future:

Do we believe our thoughts on evolving of this enum are relevant for
users of the affected QMP commands (nbd-server-remove and
block-export-del)?

If yes, it's "future directions".

>  qapi/introspect.json:300:# TODO: @success-response (currently irrelevant, because it's QGA, not QMP)

As phrased, this is only useful for developers, and even for them, it's
rather terse.

If we add introspection to QGA, we'll want to add a @success-response
member.

So, if we intend to add introspection to QGA, *and* we think current
users of (QMP-only) introspection need to know about a future addition
of @success-response, then this should be rephrased as "future
directions".

I doubt it.

>  qapi/machine.json:913:# TODO: Better documentation; currently there is none.

Clearly TODO.

>  qapi/migration.json:933:# TODO either fuse back into MigrationParameters, or make

Clearly TODO.  Note that this one is *not* in a doc comment, and does
*not* appear in generated documentation.

Once we have concrete plans on how to address the TODO, these plans may
motivate "future directions", namely if they involve user-visible change
users need to know about in advance.

>  qapi/qdev.json:70:# TODO: This command effectively bypasses QAPI completely due to its

Likewise.

I think this shows that we have a few comments just for developers in
the middle of user documentation.

We could simply keep these outside doc comments, like the TODO in
qapi/migration.json.

This can occasionally be awkward.  For instance, TODO @success-response
is right where @success-response ought to be.  Moving it outside the doc
comment would lose that.  Not the end of the world, just awkward.

If this annoys us enough, we could provide means to let us have elide
parts of doc comments from generated docs.  The simplest one is probably
eliding certain sections, say the TODO sections.

Thoughts?

[...]


