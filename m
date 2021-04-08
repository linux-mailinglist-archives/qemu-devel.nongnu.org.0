Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF93C357AA5
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 05:08:25 +0200 (CEST)
Received: from localhost ([::1]:42946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUL1s-0002Oh-VH
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 23:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lUL17-0001tw-Bg; Wed, 07 Apr 2021 23:07:37 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:35382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lUL15-0000lc-HQ; Wed, 07 Apr 2021 23:07:37 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id o198so1041478yba.2;
 Wed, 07 Apr 2021 20:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xq3bEPw8h18IpXoAuvcRbjyJ+Sg9rgD0sEcag5aCINY=;
 b=lPhqsPSX+b+puDFAevxm6DcZ+pbH7vUPfKlTJmnH+X1kxvJg8FD6C4l1BE/wLb4ZTI
 f1EhBU9NywTRum8MzC0TQemHRS2Hd7LNOxEp978px7/B5u/GsDWxJXgIEVBBfRypIMgK
 xwzNrvor/PIRCYt9ovRttrWocUW4ecAx3y7cwpjfEEPtOxuEvN1wG0xAUIhC6JboE2f6
 ftcZoIDcDC9lprfuL5WwVRbNMeu3P66c1rd78CV9z1tHWexKdF+/Po4G2wfCGYDaSYkb
 pATJ4W+M61W76XkNWvgqC3SkVhr9fur2Sd5w3dTjzpaGk47M0Xt/p3f6OwBMzYvgqfHM
 mdQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xq3bEPw8h18IpXoAuvcRbjyJ+Sg9rgD0sEcag5aCINY=;
 b=oIJ7nFHv2p3C2iHJG13bkoqQyN/4XehB46/gDeAr7jgm42DPsfzGs/EOFv1tC3Ba2+
 mr23AvwDD27GfCA3RszJb+rqIjPLif1YsginAHa6po2+Lha+LZgxF7oT4AQ9x0A7N61c
 DAVqi7GKagtmA6kjrjBcKKfzuQlRULOw8l8wOWMDgOjVC5TO28CiBejhEmUA1B0q2/F1
 uFjZ2ZW+yEMxpkDcIT4765g8OkxfMHsRd2tdgLoPN57WkBKciq8lYS4hKHdmiM1pZ4wb
 uMsFSNuJb1/gublde+h+1mBAeOoWVJasm77dmXtNIcfu2kJxs0Q2uel5MCUFzb3ZHkjD
 8JTQ==
X-Gm-Message-State: AOAM532NYrDbn5hsM2Bdo/RMsXO/G/oT0cE9bvQBlrqkRiKFnAfFOP2+
 jOhO/1OaCf+Pfmo41QzSqjbbCU1JoQsk0zxYOXIIXJtl
X-Google-Smtp-Source: ABdhPJye3+6LS+pE8WzoN8GLDiHrjcIDeIq56NpSOp3eEN3jqSQLJjOZOdpHDQzCLiJ7JKGnMLCKGJLTRfQCnFkzFIk=
X-Received: by 2002:a25:4154:: with SMTP id o81mr9219554yba.239.1617851253775; 
 Wed, 07 Apr 2021 20:07:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210406081513.1013372-1-bmeng.cn@gmail.com>
 <YG5s0nGaArqTicXD@yekko.fritz.box>
In-Reply-To: <YG5s0nGaArqTicXD@yekko.fritz.box>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 8 Apr 2021 11:07:22 +0800
Message-ID: <CAEUhbmW1ZCsY2z3yjOukxbj3kKJk-CdPj1KUVQFRey0WZR3U9g@mail.gmail.com>
Subject: Re: [for-6.0 PATCH 0/3] ppc: e500: Bump ppce500 u-boot to v2021.04
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2b.google.com
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi David,

On Thu, Apr 8, 2021 at 10:39 AM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Tue, Apr 06, 2021 at 04:15:10PM +0800, Bin Meng wrote:
> > This series bumps the u-boot.e500 to v2021.04, which fixed a long
> > overdue broken pci issue caused by QEMU changes since Nov 2014.
> >
> > While we are here, add a reST documentation for the ppce500 machine.
> >
> > Please pull the full contents (binary) from https://github.com/lbmeng/qemu/
> > ppc branch.
>
> This is much to late to go into ppc-for-6.0, but I'm happy to queue it
> for 6.1.

I think this should go 6.0 because it is a bug fix for the long
overdue broken pci support in the U-Boot binary that QEMU ships.

> However, I'm not sure which branch from your site I need to pull in.
>

It's the ppc branch, as I mentioned in this cover letter.

> >
> >
> > Bin Meng (3):
> >   roms/Makefile: Update ppce500 u-boot build directory name
> >   roms/u-boot: Bump ppce500 u-boot to v2021.04 to fix broken pci support
> >   docs/system: ppc: Add documentation for ppce500 machine
> >

Regards,
Bin

