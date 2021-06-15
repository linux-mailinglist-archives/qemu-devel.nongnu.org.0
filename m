Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A52A3A897C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 21:29:38 +0200 (CEST)
Received: from localhost ([::1]:55702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltEki-0002qP-CU
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 15:29:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ltEj2-0001dx-UR
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 15:27:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ltEiz-0002c0-56
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 15:27:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623785267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TqBVd4fIuQ314lFbvgzKTZFlDvaCn2nXMh4hQaJ5I00=;
 b=DdL2Ni5Dqe4Kp/x5HyhaRwfZSEzJcTQvNvgYQN3bTbw7EXElAY8dUFTD1AD20fYhTfPYHq
 ByybIGeE96gdr/b8ygzu3Nlkns1fwolcJCWSdnOKV3lYLxXVD3nLhc0l5IDppVBCz8PAt3
 2U7ALIX2djEwX1yY8qd52j4UqxdpItM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-UBu2IniOOmuN0nLFJy-txw-1; Tue, 15 Jun 2021 15:27:45 -0400
X-MC-Unique: UBu2IniOOmuN0nLFJy-txw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D2341084F4A;
 Tue, 15 Jun 2021 19:27:42 +0000 (UTC)
Received: from [10.10.113.126] (ovpn-113-126.rdu2.redhat.com [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2FF1C5C22A;
 Tue, 15 Jun 2021 19:27:28 +0000 (UTC)
Subject: Re: [RFC] GitLab issue tracker labeling process: arch/target, os, and
 accel labels
To: David Gibson <david@gibson.dropbear.id.au>
References: <0a19af15-2f34-4934-c6c9-113e49f5f1f2@redhat.com>
 <YMgLha7YL8XYrShS@yekko>
From: John Snow <jsnow@redhat.com>
Message-ID: <05a484e7-bbd3-ca9f-5642-ef98d92ad4b3@redhat.com>
Date: Tue, 15 Jun 2021 15:27:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YMgLha7YL8XYrShS@yekko>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/21 10:08 PM, David Gibson wrote:
> On Mon, Jun 14, 2021 at 01:32:11PM -0400, John Snow wrote:
>> Hi, I'd like to work out our collective preferences for how we triage issues
>> that concern the execution environment; namely the arch (now "target", os,
>> and accel labels.

[...]

> In general, what's the convention when a bug is independent of (say)
> the accel: does it get none of the accel tags, or all of them?
> Likewise with OS and the other categories.

So far, I have been labeling bugs reported against a specific 
accel/guest/host combination with those bugs. It doesn't necessarily 
mean they are bugs *in* those components. They might be, they might not be.

Generally I have been treating these labels as descriptors of the 
problem environment and not necessarily descriptors of the root cause. 
At a glance I often have no clue what the root cause might be. In just a 
few minutes, translating some of the details of the environment into 
labels in the hopes that it floats by someone with more knowledge in one 
or more of those areas is the best I can do.

This *does* mean that for TCG developers, there's a high ambiguity here 
because "accel: TCG" && "target: i386" applies to a pretty broad 
category of reports, not all of them necessarily bugs primarily 
suspected to be *about* TCG. Maybe, maybe not.

Phil sometimes removes these labels once it becomes apparent to him that 
the bug doesn't actually involve the system mentioned. Maybe it was 
filed under i386 but impacts all architectures, so we'd remove that label.

(Open to suggestions...)

>> # Accel
>>
>> Currently "accel: XXX", for HAX, HVF, KVM, TCG, WHPX and Xen.
>>
>> https://gitlab.com/qemu-project/qemu/-/labels?subscribed=&search=accel%3A

[...]

>> # OS
>>
>> Currently "os: XXX" for BSD, Linux, Windows, and macOS.
>>
>> https://gitlab.com/qemu-project/qemu/-/labels?subscribed=&search=os%3A
>>
>> Multiple OS labels can be applied to an issue.
>>
>> Originally, we kept this label somewhat vague and have been using it to
>> identify both the host AND guest involved with an issue.
>>
>> Stefan Weil has requested that we refactor this to separate the concerns so
>> that he can identify issues where Windows is the host without wading through
>> numerous reports where Windows is merely the guest. Reasonable request.
>>
>> Shall we split it into "host: XXX" and "guest: XXX" for {BSD, Linux,
>> Windows, macOS}?
> 
> I think that would be a good idea.  Except maybe "host-os" and
> "guest-os", because "host" in particular is ambiguous with host
> architecture. (not relevant that often, but sometimes).

Easy enough.


>> # arch/target
>>
>> Currently "target: XXX" for alpha, arm, avr, cris, hexagon, hppa, i386,
>> m68k, microblaze, mips, nios2, openrisc, ppc, riscv, rx, s390x, sh4, sparc,
>> tricore, xtensa.
>>
>> https://gitlab.com/qemu-project/qemu/-/labels?subscribed=&search=target%3A
>>
>> The names map 1:1 to the directories in target/.
>> The names in [square brackets] in the label descriptions correspond 1:1 with
>> the SysEmuTarget QAPI enum defined in qapi/machine.json.
>>
>> Multiple target labels can be applied to an issue. Originally, this was
>> named "arch", so this was to allow multiple architectures to be specified to
>> cover the host/guest environment. If we disentangle this, we may still want
>> to allow multiple labels to cover bugs that might affect multiple targets,
>> though that case might be rare.
> 
> Agreed.  I think mixing host and guest properties together is a bad
> idea.  These are relatively rarely related to each other.
> Bugs affecting multiple, but not all targets are uncommon, but not
> super rare (mostly due to chunks of code shared across several target
> archs, like ACPI and device tree).

Right. It's not super common, but I see no real reason to *enforce* that 
a bug only ever has zero-or-one target label.

>> We probably want to keep a set of labels that apply to the host
>> architecture. These are useful for build failures, environment setup issues,
>> or just documenting the exact environment on which an issue was observed.
> 
> Ah.. that's another general question.  Are the labels supposed to
> document where the problem has been definitely observed, or a best
> estimate at where it will appear.  It would be very common for a bug
> to be observed initially on only one, but quickly turn out to be
> independent of host and/or target arch.

This is a triage problem. In an ideal world, as I see it:

1. Maintainers (in general) look at the queue of "open" bugs that have 
not yet been marked as triaged/confirmed/in-progress/closed/assigned/etc

2. They spend no more than a few minutes assessing the issue and 
assigning some fairly broad topic labels. Ideally, at least one of these 
labels will be one that a Maintainer who knows more about that area 
actively receives reports for.

3. Specific subsystem maintainers watching certain labels re-label bugs 
that catch their eye with far more explicit labels as they desire.

e.g. I kick a lot of things into broad labels like "Graphics", "Audio", 
"Storage". At a glance, and quickly, it can be hard to get more specific 
than that.

However, as an example, maybe I would glance at the Storage tag and 
occasionally add a label like 'block:ATA' to pull things into a queue I 
would watch more closely.

So for right now, these labels under question (accel, target, os) don't 
differentiate between "observed on" and "have been definitely identified 
as a problem with". They're more like hints that might wind up being wrong.

Is that the wrong idea? Maybe!

>> # Current Plan
>>
>> - Add "accel: NVVM" label
>> - Don't add "accel: qtest".
>> - Add "host: {Windows, BSD, Linux, macOS}" and "guest: {Windows, BSD, Linux,
>> macOS}" labels. >
> Again, I suggest "host-os" and "guest-os"
>

ACK

[...]

>> Less sure:
>>
>> - Create host-arch: XXX labels (Unsure of name, which platforms are
>>    important to track? see above.)
> 
> Maybe leave and see if looks like it would be useful?

At a glance from other feedback, that looks like the likely route. Just 
kill it off and see if anyone wants it badly enough to bring it back.

--js


