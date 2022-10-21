Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9807607E7C
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 20:57:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1olx8d-0004zE-CT; Fri, 21 Oct 2022 14:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eldon-qemu@eldondev.com>)
 id 1oluU8-0003pg-8E; Fri, 21 Oct 2022 12:03:00 -0400
Received: from [209.195.0.149] (helo=npcomp.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eldon-qemu@eldondev.com>)
 id 1oluU4-0005oE-R7; Fri, 21 Oct 2022 12:02:59 -0400
Received: by npcomp.net (Postfix, from userid 1000)
 id E2D7211004B; Fri, 21 Oct 2022 15:55:06 +0000 ()
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=eldondev.com;
 s=eldondev; t=1666367706;
 bh=bjTqeV8SmCjg58QefAYb6a6rvrdipcXPk8TTR8Y86LA=;
 h=Date:From:To:Cc:Subject;
 b=bIu0JXfdg3ZGpr5Fhzi+0aEXtImY4RGaAIwE5/kb7KlPWDk/C2fPtOaPqVgEu0zAQ
 0fJQ/QyytzBZnt2pg3jprAjjKss6nipTDLYy/KoEPvlGg0b0foCCjBD5IeCpVXDBjC
 qKqTTUaFJxSSHo6rJdAEPHE4xFozJZnpGTTpadBE=
Date: Fri, 21 Oct 2022 15:55:06 +0000
From: Eldon Stegall <eldon-qemu@eldondev.com>
To: Eldon Stegall <eldon-qemu@eldondev.com>
Cc: qemu-discuss@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 libvir-list@redhat.com
Subject: QEMU Advent Calendar 2022 Call for Images
Message-ID: <Y1LA2qoQEoQ+bNMG@invalid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Host-Lookup-Failed: Reverse DNS lookup failed for 209.195.0.149 (failed)
Received-SPF: pass client-ip=209.195.0.149;
 envelope-from=eldon-qemu@eldondev.com; helo=npcomp.net
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,
We are working to make QEMU Advent Calendar 2022 happen this year, and
if you have had an interesting experience with QEMU recently, we would
love for you to contribute! QEMU invocations that showcase new functionality,
something cool, bring back retro computing memories, or simply entertain
with a puzzle or game are welcome. If you have an idea but aren't sure
if it fits, email me and we can try to put something together.

QEMU Advent Calendar publishes a QEMU disk image each day from December
1-24. Each image is a surprise designed to delight an audience
consisting of the QEMU community and beyond. You can see previous years
here:

  https://www.qemu-advent-calendar.org/

You can help us make this year's calendar awesome by:
 * Sending disk images ( or links to larger images )
 * Replying with ideas for disk images (reply off-list to avoid spoilers!)

If you have an idea after the start of the advent, go ahead and send it. We may
find space to include it, or go ahead and get a jump on 2024!

Here is the format we will work with you to create:
 * A name and a short description of the disk image
   (e.g. with hints on what to try)
 * A ./run shell script that prints out the name and
   description/hints and launches QEMU
 * A 320x240 screenshot/image/logo for the website

Content must be freely redistributable (i.e. no proprietary
license that prevents distribution). For GPL based software,
you need to provide the source code, too.

Check out this disk image as an example of how to distribute an image:
https://www.qemu-advent-calendar.org/2018/download/day24.tar.xz

PS: QEMU Advent Calendar is a secular calendar (not
religious). The idea is to create a fun experience for the QEMU
community which can be shared with everyone. You don't need
to celebrate Christmas or another religious festival to participate!

Thanks, and best wishes!
Eldon

