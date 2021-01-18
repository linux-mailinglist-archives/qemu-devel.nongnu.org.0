Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8051A2FA8FA
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 19:38:09 +0100 (CET)
Received: from localhost ([::1]:35812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1ZPj-0003xp-Ci
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 13:38:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l1ZO3-0003BO-4d
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 13:36:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l1ZO0-0000bn-6P
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 13:36:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610994978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cXiPEamr78+vn/BwVAnoagPvSn++LJcggWAuP5mgI0A=;
 b=dGcRoiW22+4K8g32EKyd5/u5W+VH6gOjOuRca6JkjWAQksvBjlteWLTfGXpvCgb4Y9Gdh8
 lm7Ou1KW53woavkNMcI5FydwwUNsn/Y1kV91Z2q719r0m37ODK8lwQcDFA4PLoR6Azstl+
 U1Jg/LhRRRfRlNqNuibW1LmFHA+SVos=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-pkSKffTnMMWe7hmpBI16bA-1; Mon, 18 Jan 2021 13:36:14 -0500
X-MC-Unique: pkSKffTnMMWe7hmpBI16bA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5FFB59;
 Mon, 18 Jan 2021 18:36:12 +0000 (UTC)
Received: from localhost (ovpn-118-239.rdu2.redhat.com [10.10.118.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3D6B5C260;
 Mon, 18 Jan 2021 18:36:09 +0000 (UTC)
Date: Mon, 18 Jan 2021 13:36:08 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 06/12] qapi/source: Add builtin null-object sentinel
Message-ID: <20210118183608.GB1227584@habkost.net>
References: <20201217015927.197287-1-jsnow@redhat.com>
 <20201217015927.197287-7-jsnow@redhat.com>
 <878s8wyhgc.fsf@dusky.pond.sub.org>
 <a486ba8b-3250-93d5-fb7f-b6a6d74d62d6@redhat.com>
 <87eeinab8o.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87eeinab8o.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 14, 2021 at 02:39:35PM +0100, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
> > On 1/13/21 10:39 AM, Markus Armbruster wrote:
> >> Spelling nitpick: s/builtin/built-in/ in the title.
> >> 
> >
> > Sure.
> >
> >> John Snow <jsnow@redhat.com> writes:
> >> 
> >>> We use None to represent an object that has no source information
> >>> because it's a builtin. This complicates interface typing, since many
> >>> interfaces expect that there is an info object available to print errors
> >>> with.
> >>>
> >>> Introduce a special QAPISourceInfo that represents these built-ins so
> >>> that if an error should so happen to occur relating to one of these
> >>> builtins that we will be able to print its information, and interface
> >>> typing becomes simpler: you will always have a source info object.
> >>>
> >>> This object will evaluate as False, so "if info" remains a valid
> >>> idiomatic construct.
> >>>
> >>> NB: It was intentional to not allow empty constructors or similar to
> >>> create "empty" source info objects; callers must explicitly invoke
> >>> 'builtin()' to pro-actively opt into using the sentinel. This should
> >>> prevent use-by-accident.
> >>>
> >>> Signed-off-by: John Snow <jsnow@redhat.com>
> >> 
> >> As I pointed out in review of v1, this patch has two aspects mixed up:
> >> 
> >> 1. Represent "no source info" as special QAPISourceInfo instead of
> >>     None
> >> 
> >> 2. On error with "no source info", don't crash.
> >> 
> >> The first one is what de-complicates interface typing.  It's clearly
> >> serving this patch series' stated purpose: "static typing conversion".
> >> 
> >> The second one is not.  It sidetracks us into a design discussion that
> >> isn't related to static typing.  Maybe it's something we should discuss.
> >> Maybe the discussion will make us conclude we want to do this.  But
> >> letting the static typing work get delayed by that discussion would be
> >> stupid, and I'll do what I can to prevent that.
> >> 
> >
> > It's not unrelated. It's about finding the most tactical incision to 
> > make the types as we actually use them correct from a static analysis 
> > context.
> >
> > Maybe there's another tactical incision to make that's "smaller", for 
> > some perception of "smaller", but it's not unrelated.
> 
> We don't have to debate, let alone agree on relatedness.
> 
> >> The stupidest possible solution that preserves the crash is adding an
> >> assertion right where it crashes before this patch: in
> >> QAPISourceInfo.__str__().  Yes, crashing in a __str__() method is not
> >> nice, but it's no worse than before.  Making it better than before is a
> >> good idea, and you're quite welcome to try, but please not in this
> >> series.  Add a TODO comment asking for "make it better", then sit on
> >> your hands.
> >
> > I'm recently back from a fairly long PTO, so forgive me if I am 
> > forgetting something, but I am not really sure I fundamentally 
> > understand the nature of this critique.
> >
> > Making functions not "crash" is a side-effect of making the types 
> > correct. I don't see it as scope-creep, it's a solution to a problem 
> > under active consideration.
> 
> I disagree.
> 
> The crash you "fix" is *intentional*.  I was too lazy to write something
> like
> 
>     assert self.info
> 
> and instead relied in self.info.whatever to crash.  I don't care how it
> crashes, as long as it does crash.
> 
> I *like* qapi-gen to crash on such internal errors.  It's easy, and
> makes "this is a bug, go report it" perfectly clear.
> 
> I'd also be fine with reporting "internal error, this is a bug, go
> report it".  Not in this series, unless it's utterly trivial, which I
> doubt.
> 
> I'm *not* fine with feeding made-up info objects to the user error
> reporting machinery without proof that it'll actually produce a useful
> error message.  Definitely not trivial, thus not in this series.

If you really don't want to change the existing behavior of the
code, I believe we have only two options:

1) Annotate self.info as QAPISourceInfo (not Optional),
   and add a hack to make the expression `self.info` crash if the
   argument to __init__() was None.

2) Annotate self.info as Optional[QAPISourceInfo], and adding
   manual asserts everywhere self.info is used.

Which of those two options do you find acceptable, Markus?

-- 
Eduardo


