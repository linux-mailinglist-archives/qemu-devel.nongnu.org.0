Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D544A372FD1
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 20:35:14 +0200 (CEST)
Received: from localhost ([::1]:55882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldzt3-0003Mb-FT
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 14:35:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ldzs0-0002un-NS
 for qemu-devel@nongnu.org; Tue, 04 May 2021 14:34:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ldzrx-0000Ue-B3
 for qemu-devel@nongnu.org; Tue, 04 May 2021 14:34:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620153242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tI2GFrJ4TgdAEULq2SP3k+hS678ZYr9y85nyUaFh53o=;
 b=TFx8FvCeQ0+wlrPIKVQtTbyIUhVbkKXRouUFc4OaJ7wvWA9u4zX4KyLzTCpcCN2JpUoPJv
 75KS2UNEj/lF3+57PZPuhHvpWAdOjowbkCZ+83W4fPxPeufbO0CfzAAlbbxD4l+IxNIm6a
 6/qDELcNXTe6aVZ6EXQSZ2CRM5Xfl6U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-mkkg7DJmOd6KEu3n1rIZSQ-1; Tue, 04 May 2021 14:34:00 -0400
X-MC-Unique: mkkg7DJmOd6KEu3n1rIZSQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E37871008060;
 Tue,  4 May 2021 18:33:59 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 209A919C44;
 Tue,  4 May 2021 18:33:59 +0000 (UTC)
To: QEMU Developers <qemu-devel@nongnu.org>
From: John Snow <jsnow@redhat.com>
Subject: Gitlab Issue Tracker - Proposed Workflow
Message-ID: <166fe72a-c209-fd08-5f31-db15e4f3a8b9@redhat.com>
Date: Tue, 4 May 2021 14:33:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm seeking feedback on our Gitlab issue handling workflow.
(There's a TLDR at the bottom of the mail.)


# Background:

Last KVM Forum, I started experimenting with the Gitlab issue tracker:
https://gitlab.com/qemu-project/qemu/-/issues

At the time, I hastily added some labels to roughly approximate our 
Launchpad issue lifecycle.

Gitlab offers "Scoped" labels that allow us to set a 'category' of 
labels where only one label from that category at a time may be applied.

I created the "Workflow::" scope to create labels for our issue 
lifecycle. You can see how this looks like by visiting our issue board:
https://gitlab.com/qemu-project/qemu/-/boards

Workflow labels can be changed by manually setting or removing tags, OR 
by clicking and dragging issues from one column of the board to another.


# The Workflow:: states we have currently:

https://gitlab.com/qemu-project/qemu/-/labels?utf8=%E2%9C%93&subscribed=&search=workflow

- [Open] - For newly created issues. These show up in the far-left panel 
on the boards view and allow us to quickly see which bugs have not been 
assigned a Workflow:: label. The intent is to keep this list as empty as 
possible, aggressively moving things into "Needs Info" or "Triaged" lists.

- Needs Info: For issues that either cannot be triaged or cannot be 
verified because they lack information. The intent is to allow the CI 
Janitor to close such issues after 60 days of inactivity.

- Triaged: For issues that have been classified (Bug/Feature), and 
sorted into their appropriate topic label(s) -- e.g. Storage, Audio, 
accel: TCG, etc. The intent is that subsystem maintainers will subscribe 
to relevant topics and either re-triage, kick it back to Needs Info, 
assign someone, etc.

- In Progress: For issues that a developer is actively working on. The 
intent was to be able to mark bugs in such a way that contributors would 
not assume they are available to be hacked on. For instance, if a 
non-gitlab contributor submits patches for an issue, we might mark it as 
In Progress so that it does not appear to be going unaddressed.

- Merged: Intended for issues that have had code that is merged, but not 
yet released. This was done to mimic our Launchpad workflow.

- Released: Intended for issues that have had been fixed and packaged in 
a release. This was also added to mimic Launchpad.

- [Closed] - For issues that are resolved in one way or another.


# Some concerns on the above scheme:

- "In Progress" is not likely to be used faithfully and will fall out of 
sync often. It's not clear if there should be a difference between a bug 
having an assignee and a bug labeled "In Progress". I don't want to get 
in the business of managing people's time and forcing them to track 
their work.

At the same time, for bugs being actively fixed by a contributor on-list 
who is not [known to be] present on gitlab, it's still possibly a nice 
courtesy to mark a bug as not 'free for the taking'.

Meanwhile, there are several bugs I "own" but I am not actually actively 
working on. These are the sorts of things that I wouldn't mind someone 
taking from me if they wanted to, so the "In Progress" label provides 
some useful distinction there if someone wished to use it.

I think I am inclined to keep it for now, at least until gitlab adoption 
rate is higher and bugs can be assigned more faithfully.


- Gitlab will automatically close issues that reference the gitlab issue 
tracker from the commit message, but it won't apply the "Merged" label, 
so it's at risk of falling out of sync.

Closed issues retain their "Workflow::" labels, but won't show up in the 
issue search by default unless you ask to include closed issues as well.

I think we can likely just drop this label, and have bugs go directly 
from whatever state they're in to "Closed". The issue board will look 
cleaner and there's less custodial work for maintainers.


- Similarly to the above concern, "Released" is extra paperwork for us 
to maintain. I recommend instead we drop the label and begin using 
"Milestones" for each release, and attaching issues we have fixed or 
want to fix to specific Milestones. This will give us a way to track 
pending issues for release candidates as well as a convenient list, in 
the end, of which bugs were fixed in which specific release, which is 
far more useful than a "Released" tag anyway.


- "Triaged" is a very lightweight label that I created only to mean that 
the bug has been seen and tagged, which will hopefully deliver it to 
someone's queue that they are paying attention to. It does not 
necessarily mean "Tested and Confirmed". It's possible we may want a new 
label "Confirmed" to help us sort through reports in a way that's a 
little more meaningful than just "triaged".


# TLDR:

- Let's keep "Workflow::In Progress", but acknowledge it as informative
   instead of exhaustive.
- Let's drop "Workflow::Merged" and just rely on the auto-close feature.
- Let's drop "Workflow::Released" and use the Milestones feature to help
   us with our changelog auditing.
- Let's add "Workflow::Confirmed" to help distinguish lightly-triaged
   bugs from serious, actionable bugs.


If I don't hear back, I'll assume everyone agrees and start making the 
changes.
(Though, to manage milestones, I'll need the 'Developer' role.)

Thanks,
--js


