Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E86DB30AB3D
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 16:28:25 +0100 (CET)
Received: from localhost ([::1]:51840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6b7o-0004F5-Lr
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 10:28:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dan.streetman@canonical.com>)
 id 1l6b1u-0005qn-BS
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:22:19 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:54899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.90_1) (envelope-from <dan.streetman@canonical.com>)
 id 1l6b1s-00040z-K7
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:22:18 -0500
Received: from mail-io1-f69.google.com ([209.85.166.69])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <dan.streetman@canonical.com>) id 1l6b1q-0004yp-Hc
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 15:22:14 +0000
Received: by mail-io1-f69.google.com with SMTP id j2so4223597iow.18
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 07:22:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iZXToZ5DoaIvRtYBb3THcecRVdqv8izYrQHfAUveMK0=;
 b=tN95lHM0c++dEtpgoY0i2Xx+N8XFaWsrTPJlrKjuLgVyMZcqONW89NMgSYZHkxI5Ly
 xhFbFWHpecG7InzdeY+29naz/DV7nJO2FIcma5fU6QHbAsDUv4C1col/JYORvFC2h3xn
 p0c4QmdX+4fEnwfplkMsI+hZNEvq+y2RjdBByoaa/gmP5G+R31z6baO+/xnpVToUYc6V
 eNNqQye+nbt/fMnK5tF9yvZQzS5y0DH4l8n/zaG4VHCFqlK6rjoEQRrFOBjNKzpa9Ipz
 7TNs+NX6RjCuBebI0HxKqNjgJMGwJcBhHwvdpYCbi2Fuh388wE16ZQgCTuXRWJx9KFQz
 SVfw==
X-Gm-Message-State: AOAM531zNyybYp6LJdeFIDlbSLhSC5rVbo4CYqV4ni3BuKGsjiU8iaBu
 YvaAh+UzgQs+V4LHr0vAmdQO/bPviRGSBTfWSk2YfNloiUg9OaY0Lfb2vXTsdI4YfmUrQfkpYT5
 D1HrWkF7zm8K5Cx00pKWZ44Jh9nTmbA7o08pmQU64XoOI1ko2
X-Received: by 2002:a02:6402:: with SMTP id t2mr8535607jac.90.1612192933509;
 Mon, 01 Feb 2021 07:22:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYdHmdPI9vOfQhWMHuayUak0sCwxGcWV+V8lUzNh6t32LWtEweuTmRgOKRIsqVDHgl6+k1lsydqnOH3v4mrZw=
X-Received: by 2002:a02:6402:: with SMTP id t2mr8535571jac.90.1612192933143;
 Mon, 01 Feb 2021 07:22:13 -0800 (PST)
MIME-Version: 1.0
References: <B8D9E184-5C5A-4A15-BF48-927F0138F0DE@gmail.com>
 <CAOZ2QJOq6GNXMWkk_1oxqtT_GYW8FmXT8jYGHzyROXC_yoWfxA@mail.gmail.com>
 <E8A5D4D4-265A-4B16-BFBA-18BA068607E8@gmail.com>
In-Reply-To: <E8A5D4D4-265A-4B16-BFBA-18BA068607E8@gmail.com>
From: Dan Streetman <ddstreet@canonical.com>
Date: Mon, 1 Feb 2021 10:21:37 -0500
Message-ID: <CAOZ2QJOezdqu8DB1pnJmNMOwcsR05EU3UxxsH0t-0YvjNpwGGA@mail.gmail.com>
Subject: Re: Makefile has local changes that will be overwritten
To: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=91.189.89.112;
 envelope-from=dan.streetman@canonical.com; helo=youngberry.canonical.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 1, 2021 at 10:07 AM Programmingkid
<programmingkidx@gmail.com> wrote:
>
>
>
> > On Feb 1, 2021, at 9:48 AM, Dan Streetman <ddstreet@canonical.com> wrote:
> >
> > On Mon, Feb 1, 2021 at 9:23 AM Programmingkid <programmingkidx@gmail.com> wrote:
> >>
> >> When trying to build QEMU I see this error:
> >>
> >> error: Your local changes to the following files would be overwritten by checkout:
> >>        Makefile
> >> Please commit your changes or stash them before you switch branches.
> >> Aborting
> >>
> >> What I do to see this error:
> >> ./configure --target-list=i386-softmmu
> >
> > Sorry, I don't see that error, what commit are you building from?
>
> 7d7dbf9dc15be6e1465c756c2c5ae7f1ab104fc8

It doesn't fail for me, as Peter said you should check what
uncommitted changes you have in your makefile.

>

