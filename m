Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB69DB42D3
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Sep 2019 23:14:58 +0200 (CEST)
Received: from localhost ([::1]:40038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9yKm-00075J-Vw
	for lists+qemu-devel@lfdr.de; Mon, 16 Sep 2019 17:14:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59030)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <darkbasic@linuxsystems.it>) id 1i9yJF-0006ck-Rc
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 17:13:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <darkbasic@linuxsystems.it>) id 1i9yJE-0000TR-OR
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 17:13:21 -0400
Received: from mail.linuxsystems.it ([79.7.78.67]:48139)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <darkbasic@linuxsystems.it>)
 id 1i9yJE-0008Hq-Bf
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 17:13:20 -0400
Received: by mail.linuxsystems.it (Postfix, from userid 33)
 id 983EE20BBB5; Mon, 16 Sep 2019 23:06:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxsystems.it;
 s=linuxsystems.it; t=1568667982;
 bh=NeVXrl+B8ZDmWPvv6LpfU/CXoUWrHcygcjhMmMMdDBc=;
 h=To:Subject:Date:From:From;
 b=OGFgF6ypA10cG+gEvQqvuqEPB68rgpbL/W2ntsbgU5gBBKQ4eZqeG/Tla28nKknYi
 QUTKyb75Nc16kx/iV95j7Joim2vySUI6JHJp2Jc/0lSkJvV2zl2WFUM4/0jyFuQ1py
 kZ7gD1U6p1KlK/X96VY7o7cjZzt+NE0BF2fSI9+g=
To: qemu-devel@nongnu.org
X-PHP-Originating-Script: 0:rcube.php
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 16 Sep 2019 23:06:22 +0200
From: =?UTF-8?Q?Niccol=C3=B2_Belli?= <darkbasic@linuxsystems.it>
Message-ID: <83f649c6482bf363c38e7f3778d866f4@linuxsystems.it>
X-Sender: darkbasic@linuxsystems.it
User-Agent: Roundcube Webmail/1.1.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 79.7.78.67
Subject: [Qemu-devel] ELF load command alignment not page-aligned
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
I'm trying to use qemu-user-static to chroot into a foreign amd64 
environment from my ppc64le host.
The host has a 64k page size, while x86_64 uses 4k.
I get those errors while loading shared libraries: "ELF load command 
alignment not page-aligned"
Is there any way to fix this? I cannot simply switch to 4k page size 
because my btrfs filesystem won't mount anymore (it requires the 
sectorsize to be equal to the page size).

Bests,
Niccolo'

