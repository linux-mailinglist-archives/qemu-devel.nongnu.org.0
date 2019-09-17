Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 232C3B4CB0
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Sep 2019 13:19:13 +0200 (CEST)
Received: from localhost ([::1]:44402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iABVo-00048I-3L
	for lists+qemu-devel@lfdr.de; Tue, 17 Sep 2019 07:19:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53871)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <darkbasic@linuxsystems.it>) id 1iABSi-0002Xa-Uj
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 07:16:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <darkbasic@linuxsystems.it>) id 1iABSh-0007Cs-Rp
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 07:16:00 -0400
Received: from mail.linuxsystems.it ([79.7.78.67]:56250)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <darkbasic@linuxsystems.it>)
 id 1iABSd-00079i-8r; Tue, 17 Sep 2019 07:15:55 -0400
Received: by mail.linuxsystems.it (Postfix, from userid 33)
 id D21D520BBCD; Tue, 17 Sep 2019 13:09:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxsystems.it;
 s=linuxsystems.it; t=1568718598;
 bh=EVAGbLYhCJD18sjMflu0Rlza+eeoAOMUwL4Y7YSJWX0=;
 h=To:Subject:Date:From:Cc:In-Reply-To:References:From;
 b=V8lFINM5Ajkcevfb5Jek25qS0fpgeMKkY2e+JzxSk0HlEY7c5aXF8s+DxrEUYq9Dg
 AwkV33dP3F9l1kP5oVSSuS07Wqx5iXcFJHVkWGAvioSkr2aHeEw25koLRFfGR2EMEf
 9y/QteaA2FA5dT3GGRKbQ/Sp/nsQVbwHaDto/6fA=
To: Laurent Vivier <lvivier@redhat.com>
X-PHP-Originating-Script: 0:rcube.php
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 17 Sep 2019 13:09:58 +0200
From: =?UTF-8?Q?Niccol=C3=B2_Belli?= <darkbasic@linuxsystems.it>
In-Reply-To: <e2292382-968a-106f-b10a-e6987a9c3db1@redhat.com>
References: <83f649c6482bf363c38e7f3778d866f4@linuxsystems.it>
 <9d1ea4ff-a0df-f7c6-54ca-c03b010c5ff1@redhat.com>
 <e2292382-968a-106f-b10a-e6987a9c3db1@redhat.com>
Message-ID: <0615af7328b99d4272e0734c5eb821fa@linuxsystems.it>
X-Sender: darkbasic@linuxsystems.it
User-Agent: Roundcube Webmail/1.1.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 79.7.78.67
Subject: Re: [Qemu-devel] ELF load command alignment not page-aligned
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
Cc: "open list:sPAPR" <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org,
 Qemu-devel <qemu-devel-bounces+darkbasic=linuxsystems.it@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Il 2019-09-17 12:40 Laurent Vivier ha scritto:
> Which version of qemu do you use?
> 
> Last time I tested that on my PoweMac G5 (ppc64, qemu-4.0), it worked.

I'm using 4.1, but I also tried 3.1.1.

I can get some binaries to work, but lots of them won't.

Even debootstrapping a Debian system proves to be an issue: 
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=940183

So far I've managed to debootstrap only a "minbase" stretch.
If I chroot and try to install something like qt5-default it won't work 
anymore.

Thanks,
Niccolo'

