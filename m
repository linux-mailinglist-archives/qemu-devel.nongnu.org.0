Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE72923B63A
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Aug 2020 10:01:51 +0200 (CEST)
Received: from localhost ([::1]:60968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k2rtO-0008AJ-TC
	for lists+qemu-devel@lfdr.de; Tue, 04 Aug 2020 04:01:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k2rsZ-0007jc-Su
 for qemu-devel@nongnu.org; Tue, 04 Aug 2020 04:00:59 -0400
Received: from indium.canonical.com ([91.189.90.7]:41638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k2rsX-00056u-PI
 for qemu-devel@nongnu.org; Tue, 04 Aug 2020 04:00:59 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1k2rsV-00089U-Ul
 for <qemu-devel@nongnu.org>; Tue, 04 Aug 2020 08:00:55 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E422B2E804E
 for <qemu-devel@nongnu.org>; Tue,  4 Aug 2020 08:00:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2020 07:52:45 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1879672@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Opinion; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: windows
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: berrange philmd ubuntu-weilnetz
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <158996968484.21371.12685815665992748631.malonedeb@wampee.canonical.com>
Message-Id: <098d9167-c76a-5dd9-ca17-e1f99e4f1f6b@redhat.com>
Subject: [Bug 1879672] Re: [PATCH v2 0/3] testing: Build WHPX enabled binaries
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a24057fea7e4c6a98c0220d5f878da0f3c783699";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: aa4589452fcda68c8e4a887fbe3a63e888d459b4
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/04 03:31:00
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1879672 <1879672@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/4/20 9:42 AM, Stefan Weil wrote:
> Am 04.08.20 um 09:23 schrieb Philippe Mathieu-Daud=C3=A9:
> =

>> On 8/4/20 8:55 AM, Stefan Weil wrote:
>>> Am 04.08.20 um 08:43 schrieb Thomas Huth:
>>>
>>>> On 03/08/2020 22.25, Stefan Weil wrote:
>>>>> We can add a CI pipeline on Microsoft infrastructure by using a GitHub
>>>>> action.
>>>> Sorry for being ignorant, but how does that solve the legal questions
>>>> just because it is running on GitHub instead of a different CI?
>>>>
>>>>  Thomas
>>>>
>>> Sorry, I though that would be clear by looking at the included shell sc=
ript.
>>>
>>> The build does not use the Microsoft SDK. It gets the required header
>>> files from Mingw-w64. They added them in git master.
>> Oh, so we can do that with GitLab too now, we don't need to rely on the
>> GitHub 'Actions' CI in particular, right?
> =

> =

> That's right. The build script was written for Ubuntu, so depending on
> the distribution used for GitLab CI it will need some modifications. If
> GitLab already has a recent Mingw-w64, it might be sufficient to fix the
> case of the header file names. Mingw-w64 uses winhvplatform.h while QEMU
> expects WinHvPlatform.h and so on. I used symbolic links to add the
> camel case filenames.
> =

> =

>>> See
>>> https://github.com/stweil/qemu/blob/master/.github/workflows/build.sh#L=
50
>>> for code details.
>>>
>>> It's still shameful that MS is forcing developers to waste time
>>> rewriting API headers, just because the MS legal departments are not
>>> able to understand the needs of Open Source development.
>> There has be a big switch from Microsoft toward Open Source, I attended
>> some of there talk at the Open Source Summit in 2018. Maybe we simply
>> haven't contacted the right persons to make the changes...?
> =

> =

> Maybe, but it is difficult to find the right person in a large company
> like MS, and legal departments are often somehow special.

Sunil seems quite active with the WHPX development, and the section is
listed as "Supported [my Microsoft]" in MAINTAINERS. I'm confident we
have someone else able to help use finding the right contacts in the
company :)

> =

> And yes, they learned that Open Source can help them for their business,
> too.
> =

> Stefan
> =

> =

>

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1879672

Title:
  QEMU installer with WHPX support

Status in QEMU:
  Opinion

Bug description:
  People often ask the community to add WHPX support to the QEMU installer =
for Windows,
  but it is impossible due to the license limitations of the WHPX SDK.

  The WinHvEmulation.h and WinHvPlatform.h header files needed are "All
  rights reserved".

  However these headers only contain struct definitions and integer constan=
ts,
  no functional code in macros or inline functions. See:
  https://www.mail-archive.com/qemu-devel@nongnu.org/msg645815.html
  It is questionable whether the headers alone can be considered copyrighta=
ble material.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1879672/+subscriptions

