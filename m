Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA3A32A07E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 14:22:23 +0100 (CET)
Received: from localhost ([::1]:56304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH4yk-0000UN-5u
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 08:22:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lH4xB-0007re-6o
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 08:20:46 -0500
Received: from indium.canonical.com ([91.189.90.7]:38830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lH4x8-0000rr-Rc
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 08:20:44 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lH4x5-00074k-IY
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 13:20:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 728CF2E8085
 for <qemu-devel@nongnu.org>; Tue,  2 Mar 2021 13:20:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Mar 2021 13:13:07 -0000
From: John Arbuckle <1917161@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: programmingkidx th-huth
X-Launchpad-Bug-Reporter: John Arbuckle (programmingkidx)
X-Launchpad-Bug-Modifier: John Arbuckle (programmingkidx)
References: <161444687583.24678.13238506356231835061.malonedeb@wampee.canonical.com>
 <161466706443.24730.17819384228094224450.malone@wampee.canonical.com>
Message-Id: <23D98F73-E92D-49B0-88F3-383C1A287E39@gmail.com>
Subject: Re: [Bug 1917161] Parameter 'type' expects a netdev backend type
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="cd61f0bfc5208dd4b58a15e953892eaabba1e0b8"; Instance="production"
X-Launchpad-Hash: b9580fec8ec567e2d985fc33b50a234c6a15444a
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1917161 <1917161@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I see 14 files in the src folder in the slirp folder.
I am using git.
This is what I see when I run git submodule:

objc[1854]: Class AMSupportURLConnectionDelegate is implemented in both ?? =
(0x203eaf8f0) and ?? (0x1147702b8). One of the two will be used. Which one =
is undefined.
objc[1854]: Class AMSupportURLSession is implemented in both ?? (0x203eaf94=
0) and ?? (0x114770308). One of the two will be used. Which one is undefine=
d.
 f8b1b833015a4ae47110ed068e0deb7106ced66d capstone (4.0.1-548-gf8b1b833)
 85e5d839847af54efab170f2b1331b2a6421e647 dtc (v1.6.0-4-g85e5d83)
 776acd2a805c9b42b4f0375150977df42130317f meson (0.55.3)
-90c488d5f4a407342247b9ea869df1c2d9c8e266 roms/QemuMacDrivers
-e18ddad8516ff2cfe36ec130200318f7251aa78c roms/SLOF
-06dc822d045c2bb42e497487935485302486e151 roms/edk2
-4bd064de239dab2426b31c9789a1f4d78087dc63 roms/ipxe
-7f28286f5cb1ca682e3ba0a8706d8884f12bc49e roms/openbios
-a98258d0b537a295f517bbc8d813007336731fa9 roms/opensbi
-a5300c4949b8d4de2d34bedfaed66793f48ec948 roms/qboot
-bf0e13698872450164fa7040da36a95d2d4b326f roms/qemu-palcode
-155821a1990b6de78dde5f98fa5ab90e802021e0 roms/seabios
-73b740f77190643b2ada5ee97a9a108c6ef2a37b roms/seabios-hppa
-cbaee52287e5f32373181cff50a00b6c4ac9015a roms/sgabios
-3a6fdede6ce117facec0108afe716cf5d0472c3f roms/skiboot
-d3689267f92c5956e09cc7d1baa4700141662bff roms/u-boot
-60b3916f33e617a815973c5a6df77055b2e3a588 roms/u-boot-sam460ex
-0c37a43527f0ee2b9584e7fb2fdc805e902635ac roms/vbootrom
 8f43a99191afb47ca3f3c6972f6306209f367ece slirp (v4.2.0-26-g8f43a99)
 b64af41c3276f97f0e181920400ee056b9c88037 tests/fp/berkeley-softfloat-3 (he=
ads/master)
 5a59dcec19327396a011a17fd924aed4fec416b3 tests/fp/berkeley-testfloat-3 (re=
motes/origin/HEAD)
 6119e6e19a050df847418de7babe5166779955e4 ui/keycodemapdb (remotes/origin/H=
EAD)


> On Mar 2, 2021, at 1:37 AM, Thomas Huth <1917161@bugs.launchpad.net> wrot=
e:
> =

> Yes, QEMU should come with the libslirp sources. Are you using git? Then
> maybe something went wrong with the checkout of the submodule. Is there
> something in your "slirp" folder? What do you get when you run "git
> submodule" ?
> =

> -- =

> You received this bug notification because you are subscribed to the bug
> report.
> https://bugs.launchpad.net/bugs/1917161
> =

> Title:
>  Parameter 'type' expects a netdev backend type
> =

> Status in QEMU:
>  Incomplete
> =

> Bug description:
>  When using QEMU on an M1 Mac with Mac OS 11.1, I see this error
>  message when trying to enable networking for a guest:
> =

>  Parameter 'type' expects a netdev backend type
> =

>  Example command:
>  qemu-system-i386 -m 700 -hda <Windows XP HD file> -netdev user,id=3Dn0 -=
device rtl8139,netdev=3Dn0
> =

>  What should happen is networking should work when issuing the above
>  command. What actually happens is QEMU exits immediately.
> =

> To manage notifications about this bug go to:
> https://bugs.launchpad.net/qemu/+bug/1917161/+subscriptions

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1917161

Title:
  Parameter 'type' expects a netdev backend type

Status in QEMU:
  Incomplete

Bug description:
  When using QEMU on an M1 Mac with Mac OS 11.1, I see this error
  message when trying to enable networking for a guest:

  Parameter 'type' expects a netdev backend type

  Example command:
  qemu-system-i386 -m 700 -hda <Windows XP HD file> -netdev user,id=3Dn0 -d=
evice rtl8139,netdev=3Dn0

  What should happen is networking should work when issuing the above
  command. What actually happens is QEMU exits immediately.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1917161/+subscriptions

