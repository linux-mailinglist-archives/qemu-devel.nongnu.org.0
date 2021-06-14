Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 671783A6B56
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 18:12:00 +0200 (CEST)
Received: from localhost ([::1]:59842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lspBu-0007jY-Uq
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 12:11:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lspAV-0006Ba-2H
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 12:10:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lspAM-0001vS-W6
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 12:10:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623687021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oJ6p4fgJdA/cdxzhb03njOW3sPUyd96ywVvKnlTzD6I=;
 b=AP+eROqTT1VLKZGBfCvp+Y5tUSvrUPmcjHOskGr6R216XzRHLQ8nuRqqXx2QDGKRO5+34d
 Xy6pO0PjXdYYt8cNzSgpoiVxqeo4ubTjRuRWkgjIbZBi5beSIUf4C5th5x8THfxe7oFDE2
 IbtS9yw3r8ODdzmVQmqWRXv3O2dXNyg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-8xFX0PCBMw-3zJhKqsbZ2A-1; Mon, 14 Jun 2021 12:10:20 -0400
X-MC-Unique: 8xFX0PCBMw-3zJhKqsbZ2A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2022291272;
 Mon, 14 Jun 2021 16:10:19 +0000 (UTC)
Received: from [10.10.113.126] (ovpn-113-126.rdu2.redhat.com [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94262100238C;
 Mon, 14 Jun 2021 16:10:17 +0000 (UTC)
Subject: Re: [gitlab] Renamed issue labels for target architecture
To: Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <0a102843-bb93-93b8-f502-dd0cb2a6c636@linaro.org>
 <c97f8092-0542-1fa5-1e0d-68f07ab909b9@weilnetz.de>
From: John Snow <jsnow@redhat.com>
Message-ID: <20c6a2c9-e1b1-e1f5-45aa-12d9442d29b8@redhat.com>
Date: Mon, 14 Jun 2021 12:10:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <c97f8092-0542-1fa5-1e0d-68f07ab909b9@weilnetz.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.489, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/13/21 2:52 AM, Stefan Weil wrote:
> Am 13.06.21 um 00:32 schrieb Richard Henderson:
> 
>> I've renamed arch:* to target:* as there was some amount of confusion 
>> as to what "arch" really meant without context.  I've removed labels 
>> for lm32 and unicore32 which have been removed from qemu 6.1.  I've 
>> added a label for hexagon.
>>

Thanks for removing those. I remembered we had removed some targets but 
could not remember which. I was going to get to it during freeze :) 
Saves me the trouble.

>> I have not yet added labels for host architecture, because I couldn't 
>> figure out how best to word the description, or even if all of the 
>> target:* labels need re-wording to emphasize target.
>>
>> And then there's the special case of TCI.
>>
>> Thoughts on these?
> 
> 
> A pragmatic solution for TCI could use the label "accel: TCI" as a 
> special case and instead of "accel: TCG".
> 

I might recommend just a simple "TCI" label that can be used as a 
modifier to "accel: TCG". I thought it was nice to have a 1:1 
correlation from labels to user-facing CLI arguments for the accel 
subsystem. (i.e. they correlate to ACCEL_CLASS_NAME.)

TCI feels like a modifier to TCG. So, maybe either "TCI", or "TCG: TCI" 
so that it shows up in the label search interface when you type 'tcg'.

How do I know when to label an issue as "TCI"? I've been trying to do 
the initial labeling but sometimes the best I can do is to get it in the 
rough ballpark and wait for a subject matter expert to refine the labels.

(The difference to me is the difference between which labels that other 
maintainers may expect to use as an inbox and which they may expect to 
use for their own record-keeping.)

> We have an ambiguity for "os:" because it is unclear whether it relates 
> to the host or to the target system. That could be handled by using four 
> labels "host:", "target:" (architecture), "host-os:", "target-os:" 
> (operating system). I'd prefer dropping the "os:" label and extending 
> "target:" (and the new "host:") to allow either architecture, operating 
> system or a combination of both (for example target: i386, target: 
> i386-Windows, host: Windows).
> 

We can probably do that -- it's easy for me to separate host/guest OS. 
But, we should probably start trying to define a formal process in 
docs/devel somewhere.

So far, it's just an informal process that Thomas and I somewhat loosely 
collaborate on. I've sent a few emails to ask about specific points, but 
we don't have a canonical document that describes them.

I have held off on proposing a document so far because we are still in 
the process of moving bugs over from launchpad -- my thought was that 
after Thomas and I had finished doing so, we could open up that discussion.

Maybe it's time to jump ahead and do it now, though.

Some points of feedback I have seen so far:

- We may want more specific labels in many places
- We may want to define labels for submaintainers directly in the 
MAINTAINERS file to establish a 1:1 mapping from Maintainer to Label
- arch: XXX tags (now target: XXX) mix concerns between host arch and 
guest arch.
- os: XXX tags mix concerns between host and guest.

I'm fine with creating as many labels as we want, but want to make sure 
it remains possible to easily triage bugs into at least preliminary 
queues without overcomplicating the label system.

I'm going to start a new thread to discuss accel, arch, and os labels. 
Let's sort it out.

> Stefan

Thanks,
--js


