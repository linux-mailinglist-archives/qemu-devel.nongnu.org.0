Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC84C2B433E
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 13:03:00 +0100 (CET)
Received: from localhost ([::1]:42508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kedDn-00021b-NH
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 07:02:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kedBz-0001CR-6M; Mon, 16 Nov 2020 07:01:07 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:35138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kedBt-0003Rp-4v; Mon, 16 Nov 2020 07:01:06 -0500
Received: by mail-pl1-x62b.google.com with SMTP id x15so8286762pll.2;
 Mon, 16 Nov 2020 04:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=fd/QpRXCRiOzarTc81TBEC1Uw4U9FHHqbv8ckg7bVBY=;
 b=PH4vRllBNw5wiY7LzJEGK5kWD0pIN2aGxHzF9i/G4hpaqmUppEULT3YmELsXorfxNZ
 3FtGd9M105wrH+73vKc427Dn4flBcOVhyV5xb3HhjSAXDvjUdKV5CW0vTryltxzzxnXm
 R/yda08LPcquwbWDX0mjrVylvwxb68ZmwYM4Y9/o428c0tx/XLAqHdysNI2cKDa7attQ
 Or0ezqqEB1oyNRGO4cub5e75Ljjk5uKtFbpH7qAopYzSEOQB4kWmAwghRx+ozyo5CfIY
 6Ly2jxu1KE/HAg2yUwe3eDiSmr2hNeuxwj4LQWVQ/0GKbkUYzQfoipDg+uxr4E3ZyxQp
 qJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=fd/QpRXCRiOzarTc81TBEC1Uw4U9FHHqbv8ckg7bVBY=;
 b=YWkWDCrSGzEK6+Djtq3TPHGnDkJUVg2TXoHGuxMBOiY1X3Bk3unmnL4PJQ6n53cV87
 e2ZZoXBlO7Lb4Ylhsy7bw6P2dL6T+iIIEFNQtaiuItfFRF/yCrZJK0Gt8b1fAlyciEbU
 b9ElwJJTUt1GTeP2eg/AAzlYQCuY1EmDHmMn7DYhT3gabI/e0H1uwkelpg58qNhDnozt
 0EMmc1V8BAO8W3vHcG4+HCXwAex1uOWHLpzA5Phkt8Dh4gowt0Z3LVJ+ZsjKQiM5MX45
 JUCjQNq5kGFKI/1srl4QgGeu5wlAWlVkTsQkIkwIhYu7r10uRROtfD9iwbAtW2qHQLS9
 q9qw==
X-Gm-Message-State: AOAM532RoinwGx9LItd0nk0WKlkdsWyTaZ7zUiA4xleHjJ4Bsb37ImEI
 C2cws4K1l4BfV+lYiz0zjdIjrZemmXtm+MyZJcbEl6/b0kVdR9kX
X-Google-Smtp-Source: ABdhPJxeoMjYVcU1dN+s+KKZv0eKEcbYZVTk1rIp4bCuUbYA8FphMb/mHnooJ7pMxLMmNLe7Xa+1uldLZ2RfsPYma0Y=
X-Received: by 2002:a17:902:b90c:b029:d6:868d:f566 with SMTP id
 bf12-20020a170902b90cb02900d6868df566mr13040502plb.2.1605528052392; Mon, 16
 Nov 2020 04:00:52 -0800 (PST)
MIME-Version: 1.0
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 16 Nov 2020 12:00:41 +0000
Message-ID: <CAJSP0QX6oz8AOSTgHLshp_cm3Owg6-jkT+2hSdZLVByevSVZLw@mail.gmail.com>
Subject: Want to run QEMU Advent Calendar 2020?
To: qemu-devel <qemu-devel@nongnu.org>, qemu_mail <qemu-discuss@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=stefanha@gmail.com; helo=mail-pl1-x62b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kashyap Chamarthy <kashyapc@fedoraproject.org>,
 Thomas Huth <huth@tuxfamily.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,
It's time for a QEMU Advent Calendar again where the QEMU community
shares a disk image every day from December 1st to 24th. The advent
calendar is a fun project we do to showcase cool disk images and QEMU.
You can view previous years here:
https://www.qemu-advent-calendar.org/

This year we are looking for a new organizer to run the advent
calendar. Please get in touch if you want to help make this QEMU
tradition happen!

You can also reply off-list with ideas for disk images that you'd like
to contribute, but we need to find someone to run the advent calendar
first.

You might be wondering what the role involves? Don't worry, you don't
need to create 24 disk images yourself. People will contribute them
but a person needs to organize the whole effort:
1. Reaching out to QEMU and related communities for disk images. (We
can help with this!)
2. Deciding the schedule for images with the contributors who will contact you.
3. Reviewing disk image contributions, trying them out, and checking
they meet the software license requirements.
4. Announcing QEMU Advent Calendar at the end of November. (We can
help with this!)
5. Posting accepted disk images to the qemu-advent-calendar.org website.

Details of the disk image requirements are below if you want an idea
of the format of disk images that people contribute.

Have time? Want to get involved in the QEMU community? Please reply
and help make QEMU Advent Calendar 2020 happen!

Stefan
---
Disk image requirements:
 * We need 24 disk images (for the first 24 days of December)
 * Content must be freely redistributable (i.e. no proprietary
   license that prevents distribution). For GPL based software,
   you need to provide the source code, too.
 * Provide a name and a short description of the disk image
   (e.g. with hints on what to try)
 * Provide a ./run shell script that prints out the name and
   description/hints and launches QEMU
 * Provide a screenshot/image/logo for the website
   (preferred resolution of the image is 320x240)
 * Size should be ideally under 100 MB per disk image
   (but if some few images are bigger, that should be OK, too)

