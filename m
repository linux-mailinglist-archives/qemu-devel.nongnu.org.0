Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 912AA373001
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 20:53:47 +0200 (CEST)
Received: from localhost ([::1]:39032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1le0B0-0000ZS-4c
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 14:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1le09q-0008Hl-EI
 for qemu-devel@nongnu.org; Tue, 04 May 2021 14:52:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1le09n-00026P-HC
 for qemu-devel@nongnu.org; Tue, 04 May 2021 14:52:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620154349;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=UYJye0YUGUuYopr9xbCo9+6yl2LGh796kjo9l1U4Ck0=;
 b=NN5nbNwTPVXlsvM9W87n6rYGzPEWLSHmyJAK26266uRttzyUQ3lxLOlwcXKdJ+zLo50u39
 rKlahJ3Vo12QDDg0dQ149lM4ooll85Vbo7KiZEZ8NXbi391ej9jJyZsqYhYnyRTW9hESUI
 CoaRqhJbeXfGipZSWXtN/O7i7HFIQks=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-elLEZSKIMQmFvJTDDf_TnQ-1; Tue, 04 May 2021 14:52:24 -0400
X-MC-Unique: elLEZSKIMQmFvJTDDf_TnQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1158F9F92A;
 Tue,  4 May 2021 18:52:22 +0000 (UTC)
Received: from redhat.com (ovpn-113-37.ams2.redhat.com [10.36.113.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 97DCB5D6CF;
 Tue,  4 May 2021 18:52:20 +0000 (UTC)
Date: Tue, 4 May 2021 19:52:17 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: Gitlab Issue Tracker - Proposed Workflow
Message-ID: <YJGX4RanOnmxPtr7@redhat.com>
References: <166fe72a-c209-fd08-5f31-db15e4f3a8b9@redhat.com>
MIME-Version: 1.0
In-Reply-To: <166fe72a-c209-fd08-5f31-db15e4f3a8b9@redhat.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 04, 2021 at 02:33:58PM -0400, John Snow wrote:
> I'm seeking feedback on our Gitlab issue handling workflow.
> (There's a TLDR at the bottom of the mail.)
> 
> 
> # Background:
> 
> Last KVM Forum, I started experimenting with the Gitlab issue tracker:
> https://gitlab.com/qemu-project/qemu/-/issues
> 
> At the time, I hastily added some labels to roughly approximate our
> Launchpad issue lifecycle.
> 
> Gitlab offers "Scoped" labels that allow us to set a 'category' of labels
> where only one label from that category at a time may be applied.
> 
> I created the "Workflow::" scope to create labels for our issue lifecycle.
> You can see how this looks like by visiting our issue board:
> https://gitlab.com/qemu-project/qemu/-/boards
> 
> Workflow labels can be changed by manually setting or removing tags, OR by
> clicking and dragging issues from one column of the board to another.
> 
> 
> # The Workflow:: states we have currently:
> 
> https://gitlab.com/qemu-project/qemu/-/labels?utf8=%E2%9C%93&subscribed=&search=workflow
> 
> - [Open] - For newly created issues. These show up in the far-left panel on
> the boards view and allow us to quickly see which bugs have not been
> assigned a Workflow:: label. The intent is to keep this list as empty as
> possible, aggressively moving things into "Needs Info" or "Triaged" lists.
> 
> - Needs Info: For issues that either cannot be triaged or cannot be verified
> because they lack information. The intent is to allow the CI Janitor to
> close such issues after 60 days of inactivity.
> 
> - Triaged: For issues that have been classified (Bug/Feature), and sorted
> into their appropriate topic label(s) -- e.g. Storage, Audio, accel: TCG,
> etc. The intent is that subsystem maintainers will subscribe to relevant
> topics and either re-triage, kick it back to Needs Info, assign someone,
> etc.
> 
> - In Progress: For issues that a developer is actively working on. The
> intent was to be able to mark bugs in such a way that contributors would not
> assume they are available to be hacked on. For instance, if a non-gitlab
> contributor submits patches for an issue, we might mark it as In Progress so
> that it does not appear to be going unaddressed.

If someone is actively working on it, they could just stick a comment
on the issue, possibly with a mailing list posting.

With a simple "in progress" flag you can end up marking things as if
someone is working on it, but then they go off and do other things.

If you just have a mailing list posting/comment, you can at least
see how up2date that comment was and judge whether the person is
still caring about the bug.

> 
> - Merged: Intended for issues that have had code that is merged, but not yet
> released. This was done to mimic our Launchpad workflow.
> 
> - Released: Intended for issues that have had been fixed and packaged in a
> release. This was also added to mimic Launchpad.
> 
> - [Closed] - For issues that are resolved in one way or another.
> 
> 
> # Some concerns on the above scheme:
> 
> - "In Progress" is not likely to be used faithfully and will fall out of
> sync often. It's not clear if there should be a difference between a bug
> having an assignee and a bug labeled "In Progress". I don't want to get in
> the business of managing people's time and forcing them to track their work.
> 
> At the same time, for bugs being actively fixed by a contributor on-list who
> is not [known to be] present on gitlab, it's still possibly a nice courtesy
> to mark a bug as not 'free for the taking'.
> 
> Meanwhile, there are several bugs I "own" but I am not actually actively
> working on. These are the sorts of things that I wouldn't mind someone
> taking from me if they wanted to, so the "In Progress" label provides some
> useful distinction there if someone wished to use it.
> 
> I think I am inclined to keep it for now, at least until gitlab adoption
> rate is higher and bugs can be assigned more faithfully.
> 
> 
> - Gitlab will automatically close issues that reference the gitlab issue
> tracker from the commit message, but it won't apply the "Merged" label, so
> it's at risk of falling out of sync.
> 
> Closed issues retain their "Workflow::" labels, but won't show up in the
> issue search by default unless you ask to include closed issues as well.
> 
> I think we can likely just drop this label, and have bugs go directly from
> whatever state they're in to "Closed". The issue board will look cleaner and
> there's less custodial work for maintainers.
> 
> 
> - Similarly to the above concern, "Released" is extra paperwork for us to
> maintain. I recommend instead we drop the label and begin using "Milestones"
> for each release, and attaching issues we have fixed or want to fix to
> specific Milestones. This will give us a way to track pending issues for
> release candidates as well as a convenient list, in the end, of which bugs
> were fixed in which specific release, which is far more useful than a
> "Released" tag anyway.

Yeah, if we really wnat to record release info against bugs, then the
milestones looks more useful, but....

Generating a list of bugs in the release is only useful if that list
is reasonably complete. That means we need someone who really cares
about this because most people will never bother to set a milestone
and so some janitor will have to cleanup for each release. I'm loathe
to define a system that creates busy-work for someone unless they
definitely want that work.

IOW, in abence of a janitor volunteering, I'd just keep life simple
and let bugs be marked closed as they get merged via the commit message.

We can query bugs linked to commits in this way, and I feel we'll have
more luck getting maintainers to reliably add bug links in commits
than playing with milestones.

> - "Triaged" is a very lightweight label that I created only to mean that the
> bug has been seen and tagged, which will hopefully deliver it to someone's
> queue that they are paying attention to. It does not necessarily mean
> "Tested and Confirmed". It's possible we may want a new label "Confirmed" to
> help us sort through reports in a way that's a little more meaningful than
> just "triaged".
> 
> 
> # TLDR:
> 
> - Let's keep "Workflow::In Progress", but acknowledge it as informative
>   instead of exhaustive.

Personally I'd drop this one too

> - Let's drop "Workflow::Merged" and just rely on the auto-close feature.
> - Let's drop "Workflow::Released" and use the Milestones feature to help
>   us with our changelog auditing.


> - Let's add "Workflow::Confirmed" to help distinguish lightly-triaged
>   bugs from serious, actionable bugs.

I wonder if instead of that we could just have some prioritization
tags eg 

  - "Regression" - something that previously worked and we broke

  - "Release blocker" - we decided we must have this fixed in the
    next relaase - currently we paste such bugs into the planning
    page wiki for a release

  - "Important" - something that's high priority to address


This confer more useful meaning that a "Confirmed" tag I think.

Anything else without those tags can be considered a "normal" bug
that may or may not be dealt.


So I wonder if it just suffices to have standalone "workflow:triaged" and
"workflow:needinfo" flags, possibly as prefixed labels, not scoped labels.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


