Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4342B94FF
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 15:42:25 +0100 (CET)
Received: from localhost ([::1]:52112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfl8i-0003X8-Bz
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 09:42:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kfl6N-0002WJ-NS
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 09:39:59 -0500
Received: from indium.canonical.com ([91.189.90.7]:43586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kfl6L-0003Ab-IN
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 09:39:59 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kfl6J-0001TF-OM
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 14:39:55 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id AC6672E813E
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 14:39:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2020 14:26:08 -0000
From: Eric Blake <498523@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: eblake sq2d3bipy0t2o-paul th-huth theosib
X-Launchpad-Bug-Reporter: Timothy Miller (theosib)
X-Launchpad-Bug-Modifier: Eric Blake (eblake)
References: <20091219150703.18215.63221.malonedeb@palladium.canonical.com>
 <160577877517.17269.4220550038917552817.malone@chaenomeles.canonical.com>
Message-Id: <58556133-af2a-ef20-00c0-7dbb1b907bf7@redhat.com>
Subject: Re: [Bug 498523] Re: Add on-line write compression support to qcow2
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: c5c99a611e29aa60f0991def533f455fee017993
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 09:30:48
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 498523 <498523@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/20 3:39 AM, Thomas Huth wrote:
> As far as I know, QEMU v5.1 now has support for compression filters,
> e.g. by creating a qcow2 image with:
> =

>  qemu-img create -f qcow2 -o compression_type=3Dzlib image.qcow2 1G
> =

> ... so I think we can finally mark this ticket here as done.

That says what compression type to use when writing the entire disk in
one pass, but not online write compression. I think we may be a bit
premature in calling this 'fix released', although I'm not certain we
will ever try to add the feature requested.

> =

> ** Changed in: qemu
>        Status: Confirmed =3D> Fix Released
> =


-- =

Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/498523

Title:
  Add on-line write compression support to qcow2

Status in QEMU:
  Fix Released

Bug description:
  This is a wishlist item.  Launchpad really need a way for the
  submitter to indicate this.

  It would be really cool if qemu were to support disk compression on-
  line for writes.

  I know this wouldn't be really easy.  Although most OS's use blocks,
  you can really only count on being able to compress 512-byte sectors,
  which doesn't give much room for a good compression ratio.  Moreover,
  the index indicating where in the image file each sector is located
  would be complex to manage, since the compressed blocks would be
  variable sized, and you'd be wanting to do some kind of best-fit
  allocation of space in the image file.  (If you were to make the image
  file compressed block size granularity, say, 64 bytes, you could
  probably do this best fit O(1).)  If you were to buffer enough writes,
  you could group arbitrary sequences of written sectors into blocks to
  compress (which with writeback could be sent to a helper thread on
  another CPU, so the throughput would be good).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/498523/+subscriptions

