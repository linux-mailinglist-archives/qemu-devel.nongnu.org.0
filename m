Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B20273A6D40
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 19:33:24 +0200 (CEST)
Received: from localhost ([::1]:46036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsqSh-0004ih-Ak
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 13:33:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lsqRu-000443-T1
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 13:32:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lsqRr-000405-Bf
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 13:32:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623691949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SSxgj6ZIzM6QsaTwHliWMpwu021sFGM0SEyezG4+Hyo=;
 b=iwQTOjzn2oKFOazbLoXRpxp3396m7axR+0OyE7pyOXlC8+P6l89Ho9e8ps7Ae5Lsir4lYd
 1ijN+AuBeM9EvqBbpxevz5UAfcvuPEvE1xsGSNIZOR7ERqSfaQDYYC/3Gwgp2DFRmRoDa8
 UN7Slpm5ewHMyKN5YgbHbpfgDNj4GlM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-ya84Qm-HPiejP9au8lqh9A-1; Mon, 14 Jun 2021 13:32:25 -0400
X-MC-Unique: ya84Qm-HPiejP9au8lqh9A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02AC810C1ADC;
 Mon, 14 Jun 2021 17:32:22 +0000 (UTC)
Received: from [10.10.113.126] (ovpn-113-126.rdu2.redhat.com [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 12DE35D6A8;
 Mon, 14 Jun 2021 17:32:11 +0000 (UTC)
To: QEMU Developers <qemu-devel@nongnu.org>
From: John Snow <jsnow@redhat.com>
Subject: [RFC] GitLab issue tracker labeling process: arch/target, os, and
 accel labels
Message-ID: <0a19af15-2f34-4934-c6c9-113e49f5f1f2@redhat.com>
Date: Mon, 14 Jun 2021 13:32:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
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
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, I'd like to work out our collective preferences for how we triage 
issues that concern the execution environment; namely the arch (now 
"target", os, and accel labels.

If you're CC'd on this mail, you're either listed as a TCG maintainer, a 
target maintainer, or have been heavily involved in the GitLab issue 
tracker migration process. You might care about how we triage and file 
these issues.

I'm sending the mail because I've been (so far) responsible for a lot of 
the labeling as we move over from Launchpad. I'll need to change my 
process to accommodate what our maintainers want to see. (And to 
encourage others to join in on the triage process.)

As of right now, there's no formal process or document for how we use 
any of the labels -- Thomas and I had been only informally collaborating 
in our usage of them as we migrated from Launchpad. Thomas has a script 
he uses to move the bugs, so I usually don't edit these labels until I 
give him a heads up so I don't break his script.

Let's discuss what changes we need to make and collaborate on when and 
how we'll make them.


# Accel

Currently "accel: XXX", for HAX, HVF, KVM, TCG, WHPX and Xen.

https://gitlab.com/qemu-project/qemu/-/labels?subscribed=&search=accel%3A

Multiple accel labels can be applied to an issue, not just one. The 
intent was to allow for issues that may impact multiple accelerators, 
though that case may be rare.

I think these are reasonably straightforward and unambiguous, though for 
some qemu-system reports it's not always evident which accelerator 
applies right away without more info. The accel tag is often omitted 
because of this uncertainty.

I'd like to keep the mapping here 1:1 against ACCEL_CLASS_NAME if I can. 
It makes the mapping from CLI to accel tag fairly straightforward.

We technically lack a "qtest" accel tag for that parity. It could be 
added, but it's likely not actually useful versus the "tests" label. 
It's not really a user-facing accelerator.

I see we also have a new "nvmm" accelerator, too, which should now be 
added here.

RTH raises the issue of the "TCI" subsystem of TCG, which is not a full 
accelerator in its own right, but (I think) a special case of TCG. If I 
keep the 1:1 mapping to ACCEL_CLASS_NAME, "accel: TCI" is inappropriate.

Some suggestions:
- "TCI" by itself, simple enough.
- "TCG-TCI" or "TCG: TCI" or "TCG/TCI" or similar, so that it shows up 
in label search when you search for 'tcg'.
- "accel: TCG:TCI". Similar to above but uses the "accel:" prefix too.

My only concern here is completeness of the label: this one seems like 
it's at particular risk of being forgotten or lost. It works perfectly 
well as an organizational bucket for people working on TCI, but I wonder 
if it will work well as an "issue inbox". Intended use begins to matter 
here. Your thoughts, Stefan?


# OS

Currently "os: XXX" for BSD, Linux, Windows, and macOS.

https://gitlab.com/qemu-project/qemu/-/labels?subscribed=&search=os%3A

Multiple OS labels can be applied to an issue.

Originally, we kept this label somewhat vague and have been using it to 
identify both the host AND guest involved with an issue.

Stefan Weil has requested that we refactor this to separate the concerns 
so that he can identify issues where Windows is the host without wading 
through numerous reports where Windows is merely the guest. Reasonable 
request.

Shall we split it into "host: XXX" and "guest: XXX" for {BSD, Linux, 
Windows, macOS}?

This isn't too hard to do at initial triage time, but we'll need to sift 
through the bugs we've labeled so far and re-label them. Help on this 
would be appreciated. I would prefer we create a *new* set of labels and 
then draw down on the old labels instead of just renaming them. That 
way, the old label can be used as a re-triage queue.


# arch/target

Currently "target: XXX" for alpha, arm, avr, cris, hexagon, hppa, i386, 
m68k, microblaze, mips, nios2, openrisc, ppc, riscv, rx, s390x, sh4, 
sparc, tricore, xtensa.

https://gitlab.com/qemu-project/qemu/-/labels?subscribed=&search=target%3A

The names map 1:1 to the directories in target/.
The names in [square brackets] in the label descriptions correspond 1:1 
with the SysEmuTarget QAPI enum defined in qapi/machine.json.

Multiple target labels can be applied to an issue. Originally, this was 
named "arch", so this was to allow multiple architectures to be 
specified to cover the host/guest environment. If we disentangle this, 
we may still want to allow multiple labels to cover bugs that might 
affect multiple targets, though that case might be rare.

Recently, we renamed this from "arch: XXX" to "target: XXX", though the 
label had been being used for both the host and guest architecture, so 
this will need to be re-audited to remove cases where the label had been 
applied for the host architecture.

We probably want to keep a set of labels that apply to the host 
architecture. These are useful for build failures, environment setup 
issues, or just documenting the exact environment on which an issue was 
observed.

We won't likely require the full set of targets to be duplicated for 
this purpose: possibly just the most common ones. I assume those are:

arm, i386, ppc, s390x

How should we tag those? "host-arch: XXX"?

What I would like to avoid is creating labels like "host: windows-i386" 
where the cross matrix of ({host,guest} X OS x ARCH) starts to require 
ever-increasing specificity of initial triage labels and may increase 
the risk of overly-specified bugs going unnoticed. Maybe my concern is 
unfounded, but I think the over-specificity will hurt more than help at 
this stage.


# Current Plan

- Add "accel: NVVM" label
- Don't add "accel: qtest".
- Add "host: {Windows, BSD, Linux, macOS}" and "guest: {Windows, BSD, 
Linux, macOS}" labels.
- Migrate "os: XXX" labels to the above split. Help wanted.
- Remove the "os: XXX" labels when the above is done.
- Re-audit "target: XXX" labels and remove usages that applied to the 
host instead of the guest. Help wanted. Possibly assign new host-arch 
labels.
- Create a document in /docs/devel/gitlab-process.rst based on the 
outcome of this thread to formalize our decisions and reasonings. Future 
patches to this doc can serve as the discussion point for changing that 
process. There are other topics to discuss beyond these labels as well, 
but these three topics felt like the most pressing to address given 
where we are in our Launchpad migration process.


Less sure:

- Create host-arch: XXX labels (Unsure of name, which platforms are
   important to track? see above.)
- Create "TCG: TCI" label (Unsure of naming)


Thanks,
--js


