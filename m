Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19208326AB3
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Feb 2021 01:20:29 +0100 (CET)
Received: from localhost ([::1]:41928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFnLP-000316-Lk
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 19:20:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <asmadeus@gaia.codewreck.org>)
 id 1lFnKW-0002Zv-2G
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 19:19:32 -0500
Received: from nautica.notk.org ([91.121.71.147]:39520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <asmadeus@gaia.codewreck.org>)
 id 1lFnKT-0005hO-5g
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 19:19:31 -0500
Received: by nautica.notk.org (Postfix, from userid 108)
 id CEF97C01E; Sat, 27 Feb 2021 01:04:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org; s=2;
 t=1614384242; bh=gZ+rgJ3UihBISUAot2sePawG8XzFfR7OqVRAAigwTBI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bihkVzetvx+UGlhsFTGUtXtHWuMr4eUlD3WWK2Cw+sVrItCusn/kzLMWGkrU0/FF3
 V855iX2GLDXNno9lCViDVgr+gh1T7rHQZFM+NY6QoQfwG6RXv8CNV4kZRNXm47PkNJ
 oJxFHC5AQIH7yAsoBKl7U3WQceu9Qadc5JunjGmUVaemEVWVbyMJbvYOCn6DMBfxzv
 UEuBQehIyUFLWctXfogLWrrq2C1r5+HvP/a+zMhFb80tmD+bZDgF+NDXN2YdrYscxB
 jsftSe2D4n3BaeGd8HPJ8XXX94RkuqcY97N4haUwcZIJweLbabkVwzpPs3w6TPLlaB
 Xe3BTdZfN7sLQ==
Received: from odin.codewreck.org (localhost [127.0.0.1])
 by nautica.notk.org (Postfix) with ESMTPS id 76862C009;
 Sat, 27 Feb 2021 01:03:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org; s=2;
 t=1614384241; bh=gZ+rgJ3UihBISUAot2sePawG8XzFfR7OqVRAAigwTBI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R1hQmsD7cXOP2C2E5tRZPGfZOlY48ge6tacMMKMEc4gIXSJf4UjdEOfLBN8JaW3uB
 SW8hA6Kgt4L2vipe00siK7iDxCQjkHuwvdeAT+nGoLjvkgEswOTaHB7GZmJZIoVcYN
 pVKlP0jQf3ZqwHNLRGr1Bg3/zChZshbdoGn0/0/NJ8+UKrPNeUqNhUkcv9ql5XwacA
 1MmUTW56GrYcFmoISDpevSuFn+qQwNNvDEHVI7iCLkSCgNK2G+Ba/Z7S7Qk3Fkxfrk
 xKzB/rDzrKRFo9frzH21Yg3N7TqR6YioTPRB0QGWzXJxu6j+861V5oYFqe0H7ze9Xy
 ythfv4is9dpMg==
Received: from localhost (odin.codewreck.org [local])
 by odin.codewreck.org (OpenSMTPD) with ESMTPA id aa018e7b;
 Sat, 27 Feb 2021 00:03:55 +0000 (UTC)
Date: Sat, 27 Feb 2021 09:03:40 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: Can not set high msize with virtio-9p (Was: Re: virtiofs vs 9p
 performance)
Message-ID: <YDmMXCxxOqo1xKgq@odin>
References: <20200918213436.GA3520@redhat.com> <2006960.IAZaadA1hq@silver>
 <20210224154357.GA12207@tyr> <1918692.k70u9Ml6kK@silver>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1918692.k70u9Ml6kK@silver>
Received-SPF: none client-ip=91.121.71.147;
 envelope-from=asmadeus@gaia.codewreck.org; helo=nautica.notk.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: "Shinde, Archana M" <archana.m.shinde@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, "Venegas Munoz,
 Jose Carlos" <jose.carlos.venegas.munoz@intel.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, virtio-fs-list <virtio-fs@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, v9fs-developer@lists.sourceforge.net,
 "cdupontd@redhat.com" <cdupontd@redhat.com>, Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Christian Schoenebeck wrote on Fri, Feb 26, 2021 at 02:49:12PM +0100:
> Right now the client uses a hard coded amount of 128 elements. So what about
> replacing VIRTQUEUE_NUM by a variable which is initialized with a value
> according to the user's requested 'msize' option at init time?
> 
> According to the virtio specs the max. amount of elements in a virtqueue is
> 32768. So 32768 * 4k = 128M as new upper limit would already be a significant
> improvement and would not require too many changes to the client code, right?

The current code inits the chan->sg at probe time (when driver is
loader) and not mount time, and it is currently embedded in the chan
struct, so that would need allocating at mount time (p9_client_create ;
either resizing if required or not sharing) but it doesn't sound too
intrusive yes.

I don't see more adherenences to VIRTQUEUE_NUM that would hurt trying.

> > On the 9p side itself, unrelated to virtio, we don't want to make it
> > *too* big as the client code doesn't use any scatter-gather and will
> > want to allocate upfront contiguous buffers of the size that got
> > negotiated -- that can get ugly quite fast, but we can leave it up to
> > users to decide.
> 
> With ugly you just mean that it's occupying this memory for good as long as
> the driver is loaded, or is there some runtime performance penalty as well to
> be aware of?

The main problem is memory fragmentation, see /proc/buddyinfo on various
systems.
After a fresh boot memory is quite clean and there is no problem
allocating 2MB contiguous buffers, but after a while depending on the
workload it can be hard to even allocate large buffers.
I've had that problem at work in the past with a RDMA driver that wanted
to allocate 256KB and could get that to fail quite reliably with our
workload, so it really depends on what the client does.

In the 9p case, the memory used to be allocated for good and per client
(= mountpoint), so if you had 15 9p mounts that could do e.g. 32
requests in parallel with 1MB buffers you could lock 500MB of idling
ram. I changed that to a dedicated slab a while ago, so that should no
longer be so much of a problem -- the slab will keep the buffers around
as well if used frequently so the performance hit wasn't bad even for
larger msizes


> > One of my very-long-term goal would be to tend to that, if someone has
> > cycles to work on it I'd gladly review any patch in that area.
> > A possible implementation path would be to have transport define
> > themselves if they support it or not and handle it accordingly until all
> > transports migrated, so one wouldn't need to care about e.g. rdma or xen
> > if you don't have hardware to test in the short term.
> 
> Sounds like something that Greg suggested before for a slightly different,
> even though related issue: right now the default 'msize' on Linux client side
> is 8k, which really hurts performance wise as virtually all 9p messages have
> to be split into a huge number of request and response messages. OTOH you
> don't want to set this default value too high. So Greg noted that virtio could
> suggest a default msize, i.e. a value that would suit host's storage hardware
> appropriately.

We can definitely increase the default, for all transports in my
opinion.
As a first step, 64 or 128k?

> > The next best thing would be David's netfs helpers and sending
> > concurrent requests if you use cache, but that's not merged yet either
> > so it'll be a few cycles as well.
> 
> So right now the Linux client is always just handling one request at a time;
> it sends a 9p request and waits for its response before processing the next
> request?

Requests are handled concurrently just fine - if you have multiple
processes all doing their things it will all go out in parallel.

The bottleneck people generally complain about (and where things hurt)
is if you have a single process reading then there is currently no
readahead as far as I know, so reads are really sent one at a time,
waiting for reply and sending next.

> If so, is there a reason to limit the planned concurrent request handling
> feature to one of the cached modes? I mean ordering of requests is already
> handled on 9p server side, so client could just pass all messages in a
> lite-weight way and assume server takes care of it.

cache=none is difficult, we could pipeline requests up to the buffer
size the client requested, but that's it.
Still something worth doing if the msize is tiny and the client requests
4+MB in my opinion, but nothing anything in the vfs can help us with.

cache=mmap is basically cache=none with a hack to say "ok, for mmap
there's no choice so do use some" -- afaik mmap has its own readahead
mechanism, so this should actually prefetch things, but I don't know
about the parallelism of that mechanism and would say it's linear.

Other chaching models (loose / fscache) actually share most of the code
so whatever is done for one would be for both, the discussion is still
underway with David/Willy and others mostly about ceph/cifs but would
benefit everyone and I'm following closely.

-- 
Dominique

