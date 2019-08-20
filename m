Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B2C96AE0
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Aug 2019 22:48:38 +0200 (CEST)
Received: from localhost ([::1]:41340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0B3W-0001pN-2V
	for lists+qemu-devel@lfdr.de; Tue, 20 Aug 2019 16:48:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50719)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nsoffer@redhat.com>) id 1i0B20-0001NQ-AY
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 16:47:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nsoffer@redhat.com>) id 1i0B1y-0007qv-Ii
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 16:47:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52684)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <nsoffer@redhat.com>) id 1i0B1y-0007qf-Ah
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 16:47:02 -0400
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C13AC20ABB
 for <qemu-devel@nongnu.org>; Tue, 20 Aug 2019 20:47:00 +0000 (UTC)
Received: by mail-ot1-f69.google.com with SMTP id t26so24289otp.17
 for <qemu-devel@nongnu.org>; Tue, 20 Aug 2019 13:47:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ytutxBJdek24N+tZqYDQCD3TB5iRpCH1Y5s9OfnZY5w=;
 b=uBlHmI4Fan16Ex9/txITyVHjJUfMykcaL3PtlKP1fuA6oMLZXg/PDegfwjx4jBJB7N
 rvmS+me5yUSMbuIIqgicDBflXsogT7h59COl2Nh81O0ccr621xEYlO9NYkHSgOQZ8z+K
 lKMgE6ZV/dcDbS5wtyv4bIS8q+Vx/1EmCe9Y/Y71mRie9gN41fRYRfNURgOEEpP1IkR7
 O2ECbzFAmxfgJVGrqzvPdxepaKcJlWxJqWzy+8uRyA10ya8WJbdXMk0lS2Mn6ZXRksAO
 AivhTfwkwS8vwMTW1AveeKbsGPpEnbSW/X8CwPeXXOsyhHWpE5Hydt85SwODBRdFfGR0
 kieQ==
X-Gm-Message-State: APjAAAUf3DDmpekhzxsvd4iCrxq3E8fkGbEqV0ewILPit0oHWvxLjeOh
 3G8gQswpjuCpzA7jvJQQ9bt7FfHdjeVqj2XvMHZ3ydZaH++3Ahca4UQCT/vPj+hrTV+cIg9gZ/8
 Vuayzh9vGdukPq8FoThTR41/1GR/SyTE=
X-Received: by 2002:aca:3fc4:: with SMTP id m187mr1354469oia.156.1566334020179; 
 Tue, 20 Aug 2019 13:47:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzcdotgisBjmwwGmvbXCIAoA6wSaR01hk5N3DjzwSGFEbUd7MZ058NOKZyssNCNxwenSbWe32M7aCrao5FUPo4=
X-Received: by 2002:aca:3fc4:: with SMTP id m187mr1354456oia.156.1566334019838; 
 Tue, 20 Aug 2019 13:46:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190817175346.12518-1-nsoffer@redhat.com>
 <0d8c2c6a-55ef-3517-b93c-05d9a04e5d26@redhat.com>
In-Reply-To: <0d8c2c6a-55ef-3517-b93c-05d9a04e5d26@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Tue, 20 Aug 2019 23:46:49 +0300
Message-ID: <CAMRbyytuCKqVbuZxtbz9rthYdO-w+CrEy-hHe9nrYVZ=j8P04g@mail.gmail.com>
To: Max Reitz <mreitz@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] [PATCH] block: Use QEMU_IS_ALIGNED instead of
 reinventing it
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Nir Soffer <nirsof@gmail.com>, qemu-block <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 20, 2019 at 10:51 PM Max Reitz <mreitz@redhat.com> wrote:

> On 17.08.19 19:53, Nir Soffer wrote:
> > Replace instances of:
> >
> >     (n & (BDRV_SECTOR_SIZE - 1)) == 0)
> >
> > With:
> >
> >     QEMU_IS_ALIGNED(n, BDRV_SECTOR_SIZE)
> >
> > Which reveals the intent of the code better, and makes it easier to
> > locate the code checking alignment.
> >
> > QEMU_IS_ALIGNED is implemented using %, which may be less efficient but
> > it is used only in assert() except one instance, so it should not
> > matter.
> >
> > Signed-off-by: Nir Soffer <nsoffer@redhat.com>
> > ---
> >  block/bochs.c | 4 ++--
> >  block/cloop.c | 4 ++--
> >  block/dmg.c   | 4 ++--
> >  block/io.c    | 8 ++++----
> >  block/qcow2.c | 4 ++--
> >  block/vvfat.c | 8 ++++----
> >  qemu-img.c    | 2 +-
> >  7 files changed, 17 insertions(+), 17 deletions(-)
>
> Because John was speaking about a magical incantation, I found
> BDRV_SECTOR_MASK.  There are two places in block/qcow2-cluster.c that
> use that to check alignment, I think those should be amended as well.
>

$ git grep BDRV_SECTOR_MASK
block/qcow2-cluster.c:        assert((offset_in_cluster &
~BDRV_SECTOR_MASK) == 0);
block/qcow2-cluster.c:        assert((bytes & ~BDRV_SECTOR_MASK) == 0);

Right, should use QEMU_IS_ALIGNED

include/block/block.h:#define BDRV_SECTOR_MASK   ~(BDRV_SECTOR_SIZE - 1)
include/block/block.h:#define BDRV_BLOCK_OFFSET_MASK  BDRV_SECTOR_MASK
migration/block.c:        flags = addr & ~BDRV_SECTOR_MASK;

This could use (BDRV_SECTOR_SIZE - 1).
In Linux SECTOR_MASK is defined as:

drivers/block/null_blk_main.c:#define SECTOR_MASK
(PAGE_SECTORS - 1)

It seems that qemu use use the same.

I will try to handle these in v2.

Nir
