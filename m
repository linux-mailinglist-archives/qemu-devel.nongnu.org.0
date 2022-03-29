Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3B04EB1E0
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 18:34:46 +0200 (CEST)
Received: from localhost ([::1]:48708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZEnu-0007Jt-2z
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 12:34:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nZEmO-0006WU-1d
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 12:33:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nZEmL-0002h9-JO
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 12:33:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648571588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W8UKTIYCx+myOxAGmaSWe0/8QKIeB/Rhl147GNXz5fc=;
 b=CjXQOnTkiE5nkwuYYVrOYJAvnd7EMyiQb65/Xqh1LyLGlg3KyFWYKOQTz04Ipd/1nqigpS
 S8PoISzS8TVR9725vSM1HfVu/vFBRmXktUWbWCRZVOA7yp1RuAHRzL5nBXIRDsPrAJj9WK
 pSHikAXGDF/9WBZHL5SBQVtmWRJl/Ck=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-crCvnOHIMC68XiyvaZi9qQ-1; Tue, 29 Mar 2022 12:32:09 -0400
X-MC-Unique: crCvnOHIMC68XiyvaZi9qQ-1
Received: by mail-vk1-f198.google.com with SMTP id
 a188-20020a1f66c5000000b0033e52f60923so3509605vkc.7
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 09:32:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W8UKTIYCx+myOxAGmaSWe0/8QKIeB/Rhl147GNXz5fc=;
 b=HfL07rPbHwaHiy155K03wvLe0MgdGuuq3ZbhqBlMa9jYZQQ5cKeNvr5DO16ymEkzBa
 0WRgHhOTq3u30ovFLJrJ+NCDlO5jENEBDvkI/36Ar61WEUmvKgM+Jk5+LYNoFd8S2vvJ
 4gmLu7aa/q3gTu6Grt3uxi4W8PqT0J2nMCHGcHPr2VDFHyx35k8KAHRlJ/rssDfdUMGx
 1VHSX7qgBKlPYDTiPYWBGBSdL1OIkh67NlSUFP8Gao4zmTB8M4A+m578qD1UxVc4MpQ/
 pyPKeC7ihECkM7mnXTrQs20Ot6vY41hZRv+0PjI6/yDQIPVEAoeeM0l3csDU0xu7+tv1
 P3Cg==
X-Gm-Message-State: AOAM530nTI/6z+m5g7WyOEX09ZgVi9BRRJJUAl+FtnVdq33grx6fvlSu
 5+1DDREhaHFJtPWa4LxaiLjjx5V/cwrgXoNjLsZPv41OhO4B1vT7wO2sHOIT6HTLc+jEMhIJt/8
 CeF5B2yldatADN6yekRUvO3l4jrAb9xU=
X-Received: by 2002:a67:1a02:0:b0:320:a51f:8067 with SMTP id
 a2-20020a671a02000000b00320a51f8067mr17923700vsa.38.1648571513893; 
 Tue, 29 Mar 2022 09:31:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz04kwJzlxb6iBhaqGiNGSVDYv/1WQZRTwzAzUOEqNee4ht6s7j0ZdSWDQw5Ed91OoIC9pxsZ3sVgcexGpgPyo=
X-Received: by 2002:a67:1a02:0:b0:320:a51f:8067 with SMTP id
 a2-20020a671a02000000b00320a51f8067mr17923670vsa.38.1648571513580; Tue, 29
 Mar 2022 09:31:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220324175015.232794-1-victortoso@redhat.com>
 <20220324175015.232794-2-victortoso@redhat.com> <87tubmnrde.fsf@pond.sub.org>
 <CAFn=p-bS-at1xvCok2LZzXhgFtc14E-2GfTCZf6Se2Fm6Q6PWA@mail.gmail.com>
 <20220325204724.g4utzgpmqk4skgm6@tapioca> <87lewubjtr.fsf_-_@pond.sub.org>
In-Reply-To: <87lewubjtr.fsf_-_@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Tue, 29 Mar 2022 12:31:42 -0400
Message-ID: <CAFn=p-Y289CktRSLiEu-PHGQw7hK4NgMM4=Or8X_bpcRz72inw@mail.gmail.com>
Subject: Re: "Future directions" vs. "TODO" in doc comments (was: [PATCH
 01/14] qapi: BlockExportRemoveMode: move comments to TODO)
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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
Cc: Eric Blake <eblake@redhat.com>, Victor Toso <victortoso@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 28, 2022 at 3:46 AM Markus Armbruster <armbru@redhat.com> wrote:
>
> Victor Toso <victortoso@redhat.com> writes:
>
> > Hi,
> >
> > On Fri, Mar 25, 2022 at 11:11:23AM -0400, John Snow wrote:
> >> On Fri, Mar 25, 2022, 8:33 AM Markus Armbruster <armbru@redhat.com> wrote:
>
> [...]
>
> >> > Doc comments embed user documentation in the source code.  The doc
> >> > generator extracts it.
> >> >
> >> > TODOs are generally for developers.  Should the doc generator suppress
> >> > TODO sections?
> >>
> >> Needs an audit to make sure we're using it consistently with
> >> that semantic, but broadly it's probably a good idea to squelch
> >> "internal" todos, yes.
> >>
> >> Things like "Watch out, were definitely gonna deprecate this
> >> soon probably maybe!" can stay outside of the TODO section.
> >> (Sometimes heads up are legitimate, even if most won't read
> >> them. the faithful and diligent will be rewarded with painless
> >> upgrades.)
>
> This is "future directions", not quite the same as "TODO".
>
> Would a section tag "Future directions" make sense?
>

If we're leaving these kinds of warnings already, sure. I was just
speaking generically.
I didn't actually audit all of our docs to see what types of notes
we've left so far.

> > There are 5 TODO sections in QAPI (including this patch):
>
> Let me try to sort them into "TODO" and "future directions" buckets.
> The former are of interest for developers only, and thus should be
> elided from documentation meant for users.
>

Oh, but it looks like *you* did the audit ;)

> >  qapi/block-export.json:222:# TODO: Potential additional modes to be added in the future:
>
> Do we believe our thoughts on evolving of this enum are relevant for
> users of the affected QMP commands (nbd-server-remove and
> block-export-del)?
>
> If yes, it's "future directions".
>

Presumably this evolves compatibly like QMP always does, and doesn't
necessarily warrant a special note. "future directions" feels
reasonable.

> >  qapi/introspect.json:300:# TODO: @success-response (currently irrelevant, because it's QGA, not QMP)
>
> As phrased, this is only useful for developers, and even for them, it's
> rather terse.
>
> If we add introspection to QGA, we'll want to add a @success-response
> member.
>
> So, if we intend to add introspection to QGA, *and* we think current
> users of (QMP-only) introspection need to know about a future addition
> of @success-response, then this should be rephrased as "future
> directions".
>
> I doubt it.
>

I'll defer to your judgment on this one. The last time I tried to bark
into QGA I got more than I bargained for. :')

> >  qapi/machine.json:913:# TODO: Better documentation; currently there is none.
>
> Clearly TODO.
>

Yuh

> >  qapi/migration.json:933:# TODO either fuse back into MigrationParameters, or make
>
> Clearly TODO.  Note that this one is *not* in a doc comment, and does
> *not* appear in generated documentation.
>
> Once we have concrete plans on how to address the TODO, these plans may
> motivate "future directions", namely if they involve user-visible change
> users need to know about in advance.
>
> >  qapi/qdev.json:70:# TODO: This command effectively bypasses QAPI completely due to its
>
> Likewise.
>
> I think this shows that we have a few comments just for developers in
> the middle of user documentation.
>
> We could simply keep these outside doc comments, like the TODO in
> qapi/migration.json.
>
> This can occasionally be awkward.  For instance, TODO @success-response
> is right where @success-response ought to be.  Moving it outside the doc
> comment would lose that.  Not the end of the world, just awkward.
>
> If this annoys us enough, we could provide means to let us have elide
> parts of doc comments from generated docs.  The simplest one is probably
> eliding certain sections, say the TODO sections.
>
> Thoughts?
>

I'm fine with it, maybe pending the spelling of such a section.
Keeping the docs clean and useful on generation sounds like a noble
endeavor. I don't think it's urgent, but I'm willing to let Victor
tell me which pieces are annoying and getting in his way.

(I still want to redo our docstring handling, but it wound up being a
bigger project than I could bite off in a week or two. It's extremely
high on my list of things to do, but I am already in debt to you on
the typing project I wanted to engage on, so ... I will sit on my
hands for right now.)


