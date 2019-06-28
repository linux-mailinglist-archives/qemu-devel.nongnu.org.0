Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D8C59D68
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jun 2019 15:59:10 +0200 (CEST)
Received: from localhost ([::1]:60208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgrPB-0004MM-Ek
	for lists+qemu-devel@lfdr.de; Fri, 28 Jun 2019 09:59:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47602)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <berto@igalia.com>) id 1hgqXP-0004Ix-2T
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 09:03:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1hgqXN-0004UF-Ov
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 09:03:34 -0400
Received: from fanzine.igalia.com ([91.117.99.155]:52386)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1hgqXN-0004Rr-38; Fri, 28 Jun 2019 09:03:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=Uzf0RtOypqe529VX+xBQ9zRRoyzlf6AH+FmaTGcdqxI=; 
 b=HC80KulBh9OFM0KmV6l34STvyMHtEE9E2O6uNDw/97k++qCtxqfoGcCilGStGckucGlBMMd5FHYGDttsHzi7y+y8mLy521UJsCh1Bj8nFc2H9UihmYg9DH1N6xz6xp4qj1BNba0Jf0Q9lMdOMZhIe4QCJ4hziglI5AlBV/t0bxsZgdJi0YLnqmSyn82YrkQW0KrGgaKK/leQQIGYFqE4zct9zW3N8rW0JUyyBV+blNeCATqS+/eM/4XvnFh296wos/tsbOYZnsTZsKmDEK75MtbyeFfT8klwDJ0ov+ImsI9c6Ari0kkjbAuH2LS41nUPJ6tLuCcCtMVHZZLyuuyRcQ==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1hgqXK-0004VT-Bk; Fri, 28 Jun 2019 15:03:30 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1hgqXK-0001mm-94; Fri, 28 Jun 2019 15:03:30 +0200
From: Alberto Garcia <berto@igalia.com>
To: Kevin Wolf <kwolf@redhat.com>
In-Reply-To: <w5136jtkgtn.fsf@maestria.local.igalia.com>
References: <20190627135914.xlzohrdwr6mz2aq3@perseus.local>
 <20190627165434.GE5618@localhost.localdomain>
 <w5136jtkgtn.fsf@maestria.local.igalia.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Fri, 28 Jun 2019 15:03:30 +0200
Message-ID: <w51y31lj1zx.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic] [fuzzy]
X-Received-From: 91.117.99.155
Subject: Re: [Qemu-devel] [RFC] Re-evaluating subcluster allocation for
 qcow2 images
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
Cc: Anton Nefedov <anton.nefedov@virtuozzo.com>,
 "Denis V. Lunev" <den@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I pressed "send" too early, here's the last part of my reply:

On Fri 28 Jun 2019 02:57:56 PM CEST, Alberto Garcia wrote:
>> I also ran some tests on a rotating HDD drive. Here having
>> subclusters doesn't make a big difference regardless of whether there
>> is a backing image or not, so we can ignore this scenario.

> Interesting, this is kind of unexpected. Why would avoided COW not
> make a difference on rotating HDDs? (All of this is cache=none,
> right?)

The 32K/4K with no COW is obviously much faster (it's also faster with
1MB and 2MB clusters), it's the rest of the scenarios that show no
improvement.

>> === Changes to the on-disk format ===
>> 
>> In my original proposal I described 3 different alternatives for
>> storing the subcluster bitmaps. I'm naming them here, but refer to
>> that message for more details.
>> 
>> (1) Storing the bitmap inside the 64-bit entry
>> (2) Making L2 entries 128-bit wide.
>> (3) Storing the bitmap somewhere else
>> 
>> I used (1) for this implementation for simplicity, but I think (2) is
>> probably the best one.
>
> Which would give us 32 bits for the subclusters, so you'd get 128k/4k
> or 2M/64k. Or would you intend to use some of these 32 bits for
> something different?

No, 32 bits for subclusters, or 64 if we don't have the 'all zeroes' bit
(we discussed this in a separate message).

> I think (3) is the worst because it adds another kind of metadata
> table that we have to consider for ordering updates. So it might come
> with more frequent cache flushes.

Yes I agree.

Berto

