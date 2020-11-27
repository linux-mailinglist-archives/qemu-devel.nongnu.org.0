Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 472A82C6900
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 16:56:56 +0100 (CET)
Received: from localhost ([::1]:40912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kig7D-0007YQ-AO
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 10:56:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eldon-qemu@eldondev.com>)
 id 1kig3Y-0003qz-2Q; Fri, 27 Nov 2020 10:53:08 -0500
Received: from [209.195.0.149] (port=40118 helo=npcomp.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eldon-qemu@eldondev.com>)
 id 1kig3V-0001Sk-PL; Fri, 27 Nov 2020 10:53:07 -0500
Received: by npcomp.net (Postfix, from userid 1000)
 id 50B28FD8BF; Fri, 27 Nov 2020 15:43:15 +0000 ()
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=eldondev.com;
 s=eldondev; t=1606491795;
 bh=8DCdgTjjdl6mzx383lMulSKdvH6MJim5RnaLe2bPrkc=;
 h=Date:From:To:Subject;
 b=q4XOx+AS+Y/wKiXjY5kK9B8h5pUaps99gl6txogWHH9Duis/lAfbcERRNzNV8c2gc
 OIdaz16vePGPS9FXyUTpB7+Ce0vUyhVVcBPkc04clfM7bxWf6cF/j1M7GpDC8um1bY
 Z9t5eu/k8deCJuCZUyV7PKvVTTNUSFFMJQo0vJcE=
Date: Fri, 27 Nov 2020 15:43:15 +0000
From: Eldon Stegall <eldon-qemu@eldondev.com>
To: qemu-discuss@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 libvir-list@redhat.com
Subject: QEMU Advent Calendar 2020 Call for Images
Message-ID: <X8Eeaxj9Ekd++SI7@invalid>
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


Hi,
QEMU Advent Calendar 2020 is around the corner and we are looking for
volunteers to contribute disk images that showcase something cool, bring
back retro computing memories, or simply entertain with a puzzle or game.

QEMU Advent Calendar publishes a QEMU disk image each day from
December 1-24. Each image is a surprise designed to delight an audience
consisting of the QEMU community and beyond. You can see previous
years here:

  https://www.qemu-advent-calendar.org/

You can help us make this year's calendar awesome by:
 * Sending disk images ( or links to larger images )
 * Replying with ideas for disk images (reply off-list to avoid spoilers!)

If you have an idea after the start of the advent, go ahead and send it. We may
find space to include it, or go ahead and get a jump on 2021!

Here are the requirements for disk images:
 * Content must be freely redistributable (i.e. no proprietary
   license that prevents distribution). For GPL based software,
   you need to provide the source code, too.
 * Provide a name and a short description of the disk image
   (e.g. with hints on what to try)
 * Provide a ./run shell script that prints out the name and
   description/hints and launches QEMU
 * Provide a 320x240 screenshot/image/logo for the website
 * Size should be ideally under 100 MB per disk image
   (but if some few images are bigger, that should be OK, too)

Check out this disk image as an example of how to distribute an image:
https://www.qemu-advent-calendar.org/2018/download/day24.tar.xz

PS: QEMU Advent Calendar is a secular calendar (not
religious). The idea is to create a fun experience for the QEMU
community which can be shared with everyone. You don't need
to celebrate Christmas or another religious festival to participate!

Thanks, and best wishes!
Eldon

