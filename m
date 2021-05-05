Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA6E37433D
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 19:02:12 +0200 (CEST)
Received: from localhost ([::1]:35372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leKuY-0005Um-Sf
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 13:02:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1leKE2-0002Pu-An
 for qemu-devel@nongnu.org; Wed, 05 May 2021 12:18:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1leKDx-0000XR-U8
 for qemu-devel@nongnu.org; Wed, 05 May 2021 12:18:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620231488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TzdwuCu5nUcJQlnfYzW09cZrm8ejAYlQAT7bZW2EuUE=;
 b=K135iLzXkOg583FNfgaIedPFEHOOwAXWFqWXfwDHa4io88vjIzx+s1eO+mgULE/Ol1Itk2
 XMgvXJs+4cBMcIwqWG9GV9oQ2fC7vFeGLG31W+HgWT59mAXLyfe1oPW5gqhoVUvIb+H47D
 AtGSwvcUNCppPHQ73ivx+D7zDerT1N4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-smVCwe4LOfCH3XF11FS-xg-1; Wed, 05 May 2021 12:18:06 -0400
X-MC-Unique: smVCwe4LOfCH3XF11FS-xg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0E77824FA6;
 Wed,  5 May 2021 16:18:04 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BC6459456;
 Wed,  5 May 2021 16:18:04 +0000 (UTC)
Subject: Re: Gitlab Issue Tracker - Proposed Workflow
To: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
References: <166fe72a-c209-fd08-5f31-db15e4f3a8b9@redhat.com>
 <c278c5cb-f9d2-081f-3451-9ae38cd33bcf@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <a4f08237-f5f9-a5a4-1657-8fb9ce65d0fd@redhat.com>
Date: Wed, 5 May 2021 12:18:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c278c5cb-f9d2-081f-3451-9ae38cd33bcf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/5/21 4:49 AM, Thomas Huth wrote:
> On 04/05/2021 20.33, John Snow wrote:
> [...]
>> - Gitlab will automatically close issues that reference the gitlab 
>> issue tracker from the commit message, but it won't apply the "Merged" 
>> label, so it's at risk of falling out of sync.
>>
>> Closed issues retain their "Workflow::" labels, but won't show up in 
>> the issue search by default unless you ask to include closed issues as 
>> well.
>>
>> I think we can likely just drop this label, and have bugs go directly 
>> from whatever state they're in to "Closed". The issue board will look 
>> cleaner and there's less custodial work for maintainers.
>>
>> - Similarly to the above concern, "Released" is extra paperwork for us 
>> to maintain.
> Others replied already, but I wanted to add some of my personal views 
> here, too: 

Since I suspect it will be you and I doing the janitoring, I think your 
opinion matters quite a bit :)

>            Hunting down the issues to close them after we published a 
> new release was a very tedious and time consuming task. Most people 
> simply forget to close tickets that they've opened or solved. So I was 
> always doing most of the dirty work here, using a script to hunt down 
> bug URLs in commit messages and looking for bugs that were stuck in "Fix 
> committed" state - but honestly, I feel like I've also got better things 
> to do in my spare time.

Agree.

> So from my point of view: Let's close bugs automatically with the 
> "Resolves:" keyword in the commit messages. I think users are smart 
> enough to realize that the fix will then be available with the next 
> release. So we really don't need a "Merged" and "Release" state anymore 
> and I vote for dropping them.

Dropping Merged/Released seems noncontroversial, so I am doing that. 
Keeping it as simple as possible will be good for adoption. If we find 
we need more complexity, there's nothing stopping us from adding it later.

Thank you for your diligence on maintaining the Launchpad for so long! 
This migration would absolutely not be feasible without the care you've 
put into maintaining that tracker. (Or without your migration script! 
Thank you thank you!)

--js


