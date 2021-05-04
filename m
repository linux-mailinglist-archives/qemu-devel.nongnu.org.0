Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A5B3731F7
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 23:34:50 +0200 (CEST)
Received: from localhost ([::1]:33870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1le2gs-0005sE-0w
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 17:34:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1le2fj-0005S2-4W
 for qemu-devel@nongnu.org; Tue, 04 May 2021 17:33:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1le2ff-0006JP-6w
 for qemu-devel@nongnu.org; Tue, 04 May 2021 17:33:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620164013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QV6y8PAMwKtCoZPhbuFGJWF9oy9AL/9TG7l0DmISJHA=;
 b=HEg/jXJEt5eyr+sJjmdtsDCrGs9TW7+Vsz/NJ6fKIG47FdJu/K5m8RN0v4RBvys+fvluaC
 Jvwn2aI/ab8ozwP2Ggh08gEh5hIh20ZTkJvEFYAzQquFJxF+2DGI43mxWmVMo7Zp5UCpDL
 XGHUn+zL6ukoTbUaV74czFNFwTP3qA8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-4J7RFgfZOa-YCTLAa9p-DA-1; Tue, 04 May 2021 17:33:32 -0400
X-MC-Unique: 4J7RFgfZOa-YCTLAa9p-DA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 452C518B9ECD;
 Tue,  4 May 2021 21:33:31 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 809F95D9C0;
 Tue,  4 May 2021 21:33:29 +0000 (UTC)
Subject: Re: Gitlab Issue Tracker - Proposed Workflow
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <166fe72a-c209-fd08-5f31-db15e4f3a8b9@redhat.com>
 <YJGX4RanOnmxPtr7@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <77127df4-9c38-8d0e-41b6-bce14db28b59@redhat.com>
Date: Tue, 4 May 2021 17:33:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJGX4RanOnmxPtr7@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/4/21 2:52 PM, Daniel P. Berrangé wrote:
> On Tue, May 04, 2021 at 02:33:58PM -0400, John Snow wrote:
>> I'm seeking feedback on our Gitlab issue handling workflow.
>> (There's a TLDR at the bottom of the mail.)

>> - In Progress: For issues that a developer is actively working on. The
>> intent was to be able to mark bugs in such a way that contributors would not
>> assume they are available to be hacked on. For instance, if a non-gitlab
>> contributor submits patches for an issue, we might mark it as In Progress so
>> that it does not appear to be going unaddressed.
> 
> If someone is actively working on it, they could just stick a comment
> on the issue, possibly with a mailing list posting.
> 
> With a simple "in progress" flag you can end up marking things as if
> someone is working on it, but then they go off and do other things.
> 
> If you just have a mailing list posting/comment, you can at least
> see how up2date that comment was and judge whether the person is
> still caring about the bug.
> 

I can see this critique. OTOH, and as Peter has written, it's also a 
fine way to find a list of candidate bugs that we may have forgotten about.

Ideally people still post a link to the patch if they move it to "in 
progress" so we get the benefits of both methods. I usually try to link 
to a mailing list thread whenever I update a BZ/LP like this. I can keep 
that habit alive here.

It might be fine as simply an informational state that we just don't 
treat as authoritative/exhaustive.

>> - Similarly to the above concern, "Released" is extra paperwork for us to
>> maintain. I recommend instead we drop the label and begin using "Milestones"
>> for each release, and attaching issues we have fixed or want to fix to
>> specific Milestones. This will give us a way to track pending issues for
>> release candidates as well as a convenient list, in the end, of which bugs
>> were fixed in which specific release, which is far more useful than a
>> "Released" tag anyway.
> 
> Yeah, if we really wnat to record release info against bugs, then the
> milestones looks more useful, but....
> 
> Generating a list of bugs in the release is only useful if that list
> is reasonably complete. That means we need someone who really cares
> about this because most people will never bother to set a milestone
> and so some janitor will have to cleanup for each release. I'm loathe
> to define a system that creates busy-work for someone unless they
> definitely want that work.
> 
> IOW, in abence of a janitor volunteering, I'd just keep life simple
> and let bugs be marked closed as they get merged via the commit message.
> 
> We can query bugs linked to commits in this way, and I feel we'll have
> more luck getting maintainers to reliably add bug links in commits
> than playing with milestones.
> 

Yeah, I don't expect us to do all of our release planning in Gitlab. 
This is merely a convenient way to associate an issue with a release.

I'm personally willing to do SOME of the janitoring here; in that I can 
associate closed issues with a release milestone and -- when preparing 
for rc0 freeze -- punt off any bugs that aren't blockers/in-progress to 
the next milestone.

I don't expect it would become an *exhaustive* list of changes, just 
merely a way to associate the things that DID make it into the issue 
tracker with a release.

It may allow us to publish a nice list in the changelog with links to 
the gitlab issue tracker each release, which might be nice because issue 
tracker bugs are often ones that end-users filed, so it's a way to pay 
very visible attention to that feedback.

>> - Let's add "Workflow::Confirmed" to help distinguish lightly-triaged
>>    bugs from serious, actionable bugs.
> 
> I wonder if instead of that we could just have some prioritization
> tags eg
> 
>    - "Regression" - something that previously worked and we broke
> 
>    - "Release blocker" - we decided we must have this fixed in the
>      next relaase - currently we paste such bugs into the planning
>      page wiki for a release
> 
>    - "Important" - something that's high priority to address
> 
> 
> This confer more useful meaning that a "Confirmed" tag I think.
> 

Definitely nothing stopping us from adding those labels outside of the 
Workflow scope.

"Regression" might be nice for highlighting issues for inclusion into 
the next stable release.

"Release blocker" could be just as well served by inclusion in the 
upcoming Milestone. (Granted: there would be no difference between stuff 
that's puntable or not-puntable, so there may indeed be some use to a 
"Blocker" label.)

"Important" might be best served by the "weight" fields, and might be a 
bit too subjective.

> Anything else without those tags can be considered a "normal" bug
> that may or may not be dealt.
> 
> 
> So I wonder if it just suffices to have standalone "workflow:triaged" and
> "workflow:needinfo" flags, possibly as prefixed labels, not scoped labels.
> 

I think I am rather fond of having the scoped labels for the sake of 
making the "Board" view interesting to look at.

Open --> Triaged --> Confirmed --> In Progress --> Closed

In this view, each column suggests work that can be done to help move it 
along the pipeline. Tagging open bugs will be an important step in 
making this issue tracker useful to everyone.

We *could* move everything to individual labels, but I find a benefit to 
scoped labels is that you can't mis-use them by applying more than one, 
so there's less janitoring to do.

I also like that scoped labels suggest the full lifecycle of the issue, 
so you don't have to dig through the full list of labels.

(Also: if you don't know about ANY of the Workflow labels, the board 
view provides a canonical overview, so it's a fairly discoverable process.)

> Regards,
> Daniel
> 

Thanks for the feedback today, on IRC and now on-list. :~)

--js


