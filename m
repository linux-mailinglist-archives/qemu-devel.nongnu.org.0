Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCDAF2C5
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Apr 2019 11:26:16 +0200 (CEST)
Received: from localhost ([127.0.0.1]:42076 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLP1j-0000wI-Da
	for lists+qemu-devel@lfdr.de; Tue, 30 Apr 2019 05:26:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53820)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1hLP0P-0000MK-Gs
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 05:24:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1hLP0O-0002A3-9n
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 05:24:53 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36687)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1hLP0N-00029S-OB
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 05:24:51 -0400
Received: by mail-wm1-f67.google.com with SMTP id h18so3041093wml.1
	for <qemu-devel@nongnu.org>; Tue, 30 Apr 2019 02:24:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=b+iiayVemfzXRQEyfpx3MyjTGylx/7rlkIflGUJQ0GE=;
	b=ZmUXLYfVKtO/IofNbboM8b7/yG+DeDG0GMOgyE9mKOoPiMEokEqMu2GcwbtF5IQQWG
	BPul+fkxLs9E1IjJiJZQIpX8xu2HfBWYtFAfNZNpn3CMK4mqfh4WlNqyNlCaugMrE+i2
	nz6T6bqrQ3oaXm9eu1GxL6cQwbGgPDj9xMqGWstO6sc1nn67CHxv9Ndyd5Vo4mgH9wdv
	XqUu0G6vonuP6Lo/o4NSKh/bPJLQIERu0vbCT0kYoQhjhZRl2UsIuHu/AlswpbeNtomq
	jjbHZWqPLXqs3wclFjpLHiAyNIUh1eZ8C/1L4fXnvueafy7EWCP5u80YL0iKB0+fSr+K
	+MgQ==
X-Gm-Message-State: APjAAAWr3tGUSLkOw9pVFJOGa4wLckaPqD6R7S4Wj3vXqzSzfqUMxx9U
	5ZxHnAqkrseoElE0YOuuoLOlAg==
X-Google-Smtp-Source: APXvYqwkHsKdLjjHpVJrHHBK43q21s5w409pI5P6rSvJ5NNvOLJvkKlgPcyiOjFx2yYD0FQLKP2JHA==
X-Received: by 2002:a1c:a384:: with SMTP id m126mr2174175wme.99.1556616290617; 
	Tue, 30 Apr 2019 02:24:50 -0700 (PDT)
Received: from steredhat (host35-203-static.12-87-b.business.telecomitalia.it.
	[87.12.203.35])
	by smtp.gmail.com with ESMTPSA id y4sm1776189wmj.20.2019.04.30.02.24.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 30 Apr 2019 02:24:49 -0700 (PDT)
Date: Tue, 30 Apr 2019 11:24:37 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <20190430092437.jbecehdkqa4zdavd@steredhat>
References: <20190423125706.26989-1-vsementsov@virtuozzo.com>
	<20190423125706.26989-3-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190423125706.26989-3-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20180716
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-devel] [PATCH v5 2/3] block/io: bdrv_pdiscard: support
 int64_t bytes parameter
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, fam@euphon.net, den@virtuozzo.com, qemu-block@nongnu.org,
	qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 23, 2019 at 03:57:05PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> This fixes at least one overflow in qcow2_process_discards, which
> passes 64bit region length to bdrv_pdiscard where bytes (or sectors in
> the past) parameter is int since its introduction in 0b919fae.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  include/block/block.h |  4 ++--
>  block/io.c            | 16 ++++++++--------
>  2 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/include/block/block.h b/include/block/block.h
> index c7a26199aa..69fa18867e 100644
> --- a/include/block/block.h
> +++ b/include/block/block.h
> @@ -432,8 +432,8 @@ void bdrv_drain_all(void);
>      AIO_WAIT_WHILE(bdrv_get_aio_context(bs_),              \
>                     cond); })
>  
> -int bdrv_pdiscard(BdrvChild *child, int64_t offset, int bytes);
> -int bdrv_co_pdiscard(BdrvChild *child, int64_t offset, int bytes);
> +int bdrv_pdiscard(BdrvChild *child, int64_t offset, int64_t bytes);
> +int bdrv_co_pdiscard(BdrvChild *child, int64_t offset, int64_t bytes);
>  int bdrv_has_zero_init_1(BlockDriverState *bs);
>  int bdrv_has_zero_init(BlockDriverState *bs);
>  bool bdrv_unallocated_blocks_are_zero(BlockDriverState *bs);
> diff --git a/block/io.c b/block/io.c
> index dfc153b8d8..16b6c5d855 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -2653,7 +2653,7 @@ int bdrv_flush(BlockDriverState *bs)
>  typedef struct DiscardCo {
>      BdrvChild *child;
>      int64_t offset;
> -    int bytes;
> +    int64_t bytes;
>      int ret;
>  } DiscardCo;
>  static void coroutine_fn bdrv_pdiscard_co_entry(void *opaque)
> @@ -2664,14 +2664,15 @@ static void coroutine_fn bdrv_pdiscard_co_entry(void *opaque)
>      aio_wait_kick();
>  }
>  
> -int coroutine_fn bdrv_co_pdiscard(BdrvChild *child, int64_t offset, int bytes)
> +int coroutine_fn bdrv_co_pdiscard(BdrvChild *child, int64_t offset,
> +                                  int64_t bytes)
>  {
>      BdrvTrackedRequest req;
>      int max_pdiscard, ret;
>      int head, tail, align;
>      BlockDriverState *bs = child->bs;
>  
> -    if (!bs || !bs->drv) {
> +    if (!bs || !bs->drv || !bdrv_is_inserted(bs)) {

Should we describe this change in the commit message?
IIUC you added this check because you removed bdrv_check_byte_request()
below,

Maybe we can also remove '!bs->drv', since it is checked in
bdrv_is_inserted().

>          return -ENOMEDIUM;
>      }
>  
> @@ -2679,9 +2680,8 @@ int coroutine_fn bdrv_co_pdiscard(BdrvChild *child, int64_t offset, int bytes)
>          return -EPERM;
>      }
>  
> -    ret = bdrv_check_byte_request(bs, offset, bytes);
> -    if (ret < 0) {
> -        return ret;
> +    if (offset < 0 || bytes < 0 || bytes > INT64_MAX - offset) {
> +        return -EIO;
>      }

Should we check if 'bytes' is greater than
'BDRV_REQUEST_MAX_SECTORS << BDRV_SECTOR_BITS'?

Thanks,
Stefano

