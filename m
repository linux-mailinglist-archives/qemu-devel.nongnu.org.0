Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B40140513
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 09:14:14 +0100 (CET)
Received: from localhost ([::1]:53908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isMlh-0000pZ-Ij
	for lists+qemu-devel@lfdr.de; Fri, 17 Jan 2020 03:14:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38821)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <coiby.xu@gmail.com>) id 1isMka-0008Kd-JG
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 03:13:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <coiby.xu@gmail.com>) id 1isMkZ-0000sj-C6
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 03:13:04 -0500
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:41408)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <coiby.xu@gmail.com>) id 1isMkZ-0000rj-4V
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 03:13:03 -0500
Received: by mail-lf1-x143.google.com with SMTP id m30so17621871lfp.8
 for <qemu-devel@nongnu.org>; Fri, 17 Jan 2020 00:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y0V/tTjoM8AFer+TBdEuIq6Cp0YR068T/7oI66w7h2s=;
 b=NSyQ8tCFw5diNbRVcxhHonvmtRewOJMYDvLiBZYOqWgJL6aT44LTawGFVNmSEYO4B2
 mY98dpgx6vx62cf/kllvA6wIaLJFaMXnOquKujLxCVLrqj5T4ZoDBtDhmAXpuJGtIMxr
 Hj+z9CT1AN8QRYfT2Yqe1uwjVgGvB2JylMS8hCvgHBk7npFpW/ghRvfFZMiF+FKOIY+2
 O6f7MLMf7FyVjuNQgsrMI4OAKe0ttvbeAAmxHJ9FkLX0QpSt61uzzxWfUVVW49rKSsEa
 hSZCeL0WuuQnhVl/zM4CYo97TKWJ+qyV9fgqfHccDymF0udjebz4P38VfktSdpGrb5VS
 lUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y0V/tTjoM8AFer+TBdEuIq6Cp0YR068T/7oI66w7h2s=;
 b=JhJJiNdSwOX5LvxzNC/Y9c36o5KsbnUn5ZdsMHm4+hFGDWpLoLm8TWHMeW7RXuhZ5L
 YCeYzi8J7p5buafTch0XYLo/Q3Ace0zrLDoleujEKZwsnxfj6a0c49NU5jYIvPS0v1Zc
 84OW1c5HoefvaYf2hYABTkXarcwNVflIE2LaKtnYyyLn7DOw/51DM4WEh8TlmSKrLYNE
 SytCPHz922U7id0vz439AJ+YqGpZfTmtRaHnyJFBIGv8+hy/3G2N5tnVjeCYROw+NEiS
 GshslN0GSNgVpk+oJvSDd6+yXyooDxR7RSc6BgLJILW+RPjWhQVfQSXIxDkSRZM6lkQc
 PAJg==
X-Gm-Message-State: APjAAAUE2OP+cM9iQDw28VOpqgoR9+dnIwRShijrPdnXGbyM8jnA+LaJ
 1g0RbHIMwkVKcPoGMWEbDOf8kmNkFU7f7z8SX+4=
X-Google-Smtp-Source: APXvYqztqmGO2aH2JIwbySHRVCtKV+m2etNcWvRgft6EWWYp661JucmSIZxsfmHlLqKK8EQDwyW6ex6yY32T2QDgUyU=
X-Received: by 2002:a19:4901:: with SMTP id w1mr4703887lfa.168.1579248780859; 
 Fri, 17 Jan 2020 00:13:00 -0800 (PST)
MIME-Version: 1.0
References: <20200114140620.10385-1-coiby.xu@gmail.com>
 <20200114140620.10385-4-coiby.xu@gmail.com>
 <20200116140429.GJ163546@stefanha-x1.localdomain>
In-Reply-To: <20200116140429.GJ163546@stefanha-x1.localdomain>
From: Coiby Xu <coiby.xu@gmail.com>
Date: Fri, 17 Jan 2020 16:12:24 +0800
Message-ID: <CAJAkqrVhvi-8MZ-mPjZ67yfjOaick5Gu_g3GxYAeYvH3Cp6QVw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] a standone-alone tool to directly share disk image
 file via vhost-user protocol
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::143
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
Cc: kwolf@redhat.com, bharatlkmlkvm@gmail.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Excellent! I will add an option (or object property) for
vhost-user-blk server oject which will tell the daemon process to exit
when the client disconnects, thus "make check-qtest" will not get held
by this daemon process. After that since Kevin's qemu-storage-daemon
support "-object" option
(https://patchew.org/QEMU/20191017130204.16131-1-kwolf@redhat.com/20191017130204.16131-3-kwolf@redhat.com/)
and vhost-user-server is a user-creatable QOM object, it will work out
of the box.

I'm curious when will be formal version of qemu-storage-daemon
finished so I can take advantage of it? Or should I apply the RFC
PATCHes to my working branch directly and submit them together with
the patches on vhost-user-blk server feature when posting v3?



On Thu, Jan 16, 2020 at 10:04 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Tue, Jan 14, 2020 at 10:06:18PM +0800, Coiby Xu wrote:
> > vhost-user-blk can have played as vhost-user backend but it only supports raw file and don't support VIRTIO_BLK_T_DISCARD and VIRTIO_BLK_T_WRITE_ZEROES operations on raw file (ioctl(fd, BLKDISCARD) is only valid for real block device).
> >
> > Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
> > ---
> >  qemu-vu.c | 264 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 264 insertions(+)
> >  create mode 100644 qemu-vu.c
>
> Kevin has been working on qemu-storage-daemon, a tool for running NBD
> exports, block jobs, and other storage features that are not part of a
> guest.  I think qemu-storage-daemon would be the appropriate tool for
> running vhost-user-blk servers.  A dedicated binary is not necessary.
>
> Stefan



--
Best regards,
Coiby

