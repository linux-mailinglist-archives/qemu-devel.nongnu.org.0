Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B90172879DE
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Oct 2020 18:21:39 +0200 (CEST)
Received: from localhost ([::1]:46232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQYfi-0001uE-RB
	for lists+qemu-devel@lfdr.de; Thu, 08 Oct 2020 12:21:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kQYe1-00017x-53
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 12:19:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kQYdt-0007ND-Vx
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 12:19:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602173985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=88C+pzMBzlLNdKKHzw4YTD6a/pn1VpviIHe3d6PmAVA=;
 b=bHDuCLhj4nza1L9+GLhcyMmBlXYA4nYrRezZO7awME7MQ9in/+q/IDRrmlrT0vRqPHFzoZ
 JuXyTh3isvxHsBEog8/NkM9bgcfOhIuqOK/RWspWq59pfvA2LmFWrJp+27KXqCA46GhgFn
 HAuDq+jQgTYTWlbu9eOBC6gpPRmTAcc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-FrFzkHAZP2-KFGVsnzUH2Q-1; Thu, 08 Oct 2020 12:19:42 -0400
X-MC-Unique: FrFzkHAZP2-KFGVsnzUH2Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4117D88C783
 for <qemu-devel@nongnu.org>; Thu,  8 Oct 2020 16:19:41 +0000 (UTC)
Received: from [10.10.120.38] (ovpn-120-38.rdu2.redhat.com [10.10.120.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76C6410013C1;
 Thu,  8 Oct 2020 16:19:40 +0000 (UTC)
Subject: Re: [PATCH v5 19/36] qapi/events.py: add type hint annotations
To: Markus Armbruster <armbru@redhat.com>
References: <20201005195158.2348217-1-jsnow@redhat.com>
 <20201005195158.2348217-20-jsnow@redhat.com>
 <87zh4ye0fh.fsf@dusky.pond.sub.org> <87pn5ucl3n.fsf@dusky.pond.sub.org>
 <69622744-fb05-2db7-47cf-533a3a3d89ac@redhat.com>
 <87v9fl13ij.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <7bc02d33-e3ab-38cd-3620-4eee501fe311@redhat.com>
Date: Thu, 8 Oct 2020 12:19:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <87v9fl13ij.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/08 02:56:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.214, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/8/20 5:16 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> On 10/7/20 7:49 AM, Markus Armbruster wrote:
>>> Looks like commit message of PATCH 24 has an answer.
>>> Copy to all the commits that omit -> None similarly?
>>
>> Probably not needed.
>>
>> It's covered by the class basics section in the mypy manual;
>> https://mypy.readthedocs.io/en/stable/class_basics.html#annotating-init-methods
>>
>> and if you should happen to omit annotations for __init__ entirely as
>> a novice, you will be treated to messages such as these:
>>
>> qapi/source.py:18: error: Function is missing a return type annotation
>> qapi/source.py:18: note: Use "-> None" if function does not return a value
>> Found 1 error in 1 file (checked 14 source files)
>>
>> Pretty good error!
>>
>> There's no error if you DO explicitly add a -> None from __init__, but
>> at worst it's just extraneous (but correct) information.
> 
> Let me apply the zero-one-infinity rule:
> 
> * Zero: explain it in none of the commit messages, i.e. dumb down PATCH
>    24.
> 
> * One: explain it in one.  Do it in the first one, please (here, I
>    think).
> 
> * Infinity: explain it in every one.
> 
> Up to you!
> 

I'm just bad at predicting which things people will want explained. I 
know people don't read the cover letters already, so I'd rather go for 
less instead of more.

I think you and Cleber each noticed a different angle of this: Cleber 
noticed the first time I *did* annotate __init__'s return and you 
noticed the first time I *didn't*.

I'll just add it here too, but I have doubts it will be useful reference 
once it's merged. I guess it doesn't hurt to add it either, I just find 
it difficult to predict what reviewers will want.

>> I could add a note to the style guide that I prefer omitting the
>> return from __init__. I like omitting as much as I possibly can.
>>
>> (You'll notice I don't always type every local, either -- when local
>> inference is accurate, I leave it alone.)
> 
> Type inference can save us from repeating the obvious over and over, and
> that's lovely.
> 


