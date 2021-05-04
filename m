Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2353731FC
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 23:40:43 +0200 (CEST)
Received: from localhost ([::1]:36968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1le2mY-0007Nj-8q
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 17:40:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1le2lO-0006yS-AH
 for qemu-devel@nongnu.org; Tue, 04 May 2021 17:39:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1le2lL-0001b1-UN
 for qemu-devel@nongnu.org; Tue, 04 May 2021 17:39:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620164366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n+4osqERdkMaa09brODGBUDvBIp6zaL1/7VN7ZsB30s=;
 b=XWctiEbh9CVEkUHSK7jcjxAZ9wDAMFW25guFChZyy+gdd3yAW1mdnP7P3oLlKtMRTBm5DD
 K0c6mhiDSLvTZqa+II8u8VkzXIcFr9XNJuUK2Nqp4Jp9kAQXX26Ip+qc94qm+0hcQfSdsv
 7ftiYabtOCKTD0/sFvpuKt/bFNnySvE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-Uu2xvZkoMKqAcXBx7MsbUg-1; Tue, 04 May 2021 17:39:25 -0400
X-MC-Unique: Uu2xvZkoMKqAcXBx7MsbUg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09A9C824FA6;
 Tue,  4 May 2021 21:39:24 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24E7719C44;
 Tue,  4 May 2021 21:39:23 +0000 (UTC)
Subject: Re: Gitlab Issue Tracker - Proposed Workflow
To: Peter Maydell <peter.maydell@linaro.org>
References: <166fe72a-c209-fd08-5f31-db15e4f3a8b9@redhat.com>
 <CAFEAcA_zB8OGfdCNgwXiEmUc0_rTnkFwbmyLv1TKwZndBZwn6g@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <049f561a-e009-dfbd-d26a-eadbf9d78033@redhat.com>
Date: Tue, 4 May 2021 17:39:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_zB8OGfdCNgwXiEmUc0_rTnkFwbmyLv1TKwZndBZwn6g@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/4/21 4:24 PM, Peter Maydell wrote:
> On Tue, 4 May 2021 at 19:34, John Snow <jsnow@redhat.com> wrote:
>> # Some concerns on the above scheme:
>>
>> - "In Progress" is not likely to be used faithfully and will fall out of
>> sync often. It's not clear if there should be a difference between a bug
>> having an assignee and a bug labeled "In Progress". I don't want to get
>> in the business of managing people's time and forcing them to track
>> their work.
>>
>> At the same time, for bugs being actively fixed by a contributor on-list
>> who is not [known to be] present on gitlab, it's still possibly a nice
>> courtesy to mark a bug as not 'free for the taking'.
>>
>> Meanwhile, there are several bugs I "own" but I am not actually actively
>> working on. These are the sorts of things that I wouldn't mind someone
>> taking from me if they wanted to, so the "In Progress" label provides
>> some useful distinction there if someone wished to use it.
>>
>> I think I am inclined to keep it for now, at least until gitlab adoption
>> rate is higher and bugs can be assigned more faithfully.
> 
> I like "In Progress" because I use it largely to track "I wrote a
> patch for this and submitted it to the list, but it hasn't gone in
> yet". This means that later on when a release is more imminent I
> can easily scan through a list of "in progress" bug reports to find
> the "we just forgot to update the bug state when the patch was
> committed" ones and the "somebody submitted a patch but it fell
> through the cracks" ones. That's a lot harder if you have to look
> through the whole pile of "new" bugs.
> 

Yeah, I think that's something that winds up being nice. As an 
informational/non-exhaustive label, you can at least quickly search them 
to see if you can close any of those bugs if we missed 'em.

Good argument for keeping that state for now.

>> - Gitlab will automatically close issues that reference the gitlab issue
>> tracker from the commit message, but it won't apply the "Merged" label,
>> so it's at risk of falling out of sync.
>>
>> Closed issues retain their "Workflow::" labels, but won't show up in the
>> issue search by default unless you ask to include closed issues as well.
>>
>> I think we can likely just drop this label, and have bugs go directly
>> from whatever state they're in to "Closed". The issue board will look
>> cleaner and there's less custodial work for maintainers.
> 
>> - Similarly to the above concern, "Released" is extra paperwork for us
>> to maintain. I recommend instead we drop the label and begin using
>> "Milestones" for each release, and attaching issues we have fixed or
>> want to fix to specific Milestones. This will give us a way to track
>> pending issues for release candidates as well as a convenient list, in
>> the end, of which bugs were fixed in which specific release, which is
>> far more useful than a "Released" tag anyway.
> 
> I guess so. I dunno how much our old fixed/released distinction
> was helping users anyway. I do think that using Milestones both
> for "I want to fix this bug for release X" and "this bug is fixed
> in release X" is going to mean that it's not reliable for the latter
> because we're going to have bugs where somebody optimistically set
> the milestone and then the patches didn't land in time for the release.
> But unless we care enough to write a bot that auto-updates milestones
> we'll just have to live with that.
> 

Not a huge problem to punt "I want to fix" issues off to the next 
release during the rc0 phase. Writing a script to do this should be 
pretty easy:

Just look for any issues in Milestone 6.1.0 that are still Open and not 
marked 'Blocker/Regression/In Progress' (as examples) and either punt 
them to 6.2.0 or simply delete their milestone association and allow 
someone who cares to re-assess.

> -- PMM
> 

Thanks!

--js


