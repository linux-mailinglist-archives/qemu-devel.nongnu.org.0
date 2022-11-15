Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5339062A117
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 19:09:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ov0LL-00066f-OX; Tue, 15 Nov 2022 13:07:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ov0Kp-0005sF-IN
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 13:07:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ov0Kn-0000AT-Ey
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 13:06:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668535615;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=wLFVxskAtfRCt0VbZH3NOHtmAV81HJWEQRhQIy6av5E=;
 b=NVxuMWFV9Y0BWXL0ubz1eJUmKKaBlXgq9Er05ntGwJuLrh1u9EzpebUXQYOo724O9nbDYf
 vptk2NYxaz5jxnwo1dE+5eEpEd9YDgx42DHU0Uvw+WOmYiKT7XUEfnmw5nuL/tAoAaxAl+
 PPUvRpKOU9+aIqFewDvaw9H8gdk8UAM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-393-dvGclg9mPBqRTlTujjOQgA-1; Tue, 15 Nov 2022 13:06:53 -0500
X-MC-Unique: dvGclg9mPBqRTlTujjOQgA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B81E7811E84;
 Tue, 15 Nov 2022 18:06:51 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1723440C6EC3;
 Tue, 15 Nov 2022 18:06:48 +0000 (UTC)
Date: Tue, 15 Nov 2022 18:06:44 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fam Zheng <fam@euphon.net>
Subject: Re: [PULL 00/30] Next patches
Message-ID: <Y3PVNNl9+TQD/9fc@redhat.com>
References: <20221115153514.28003-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221115153514.28003-1-quintela@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Please don't merge this PULL request,

It contains changes to the "io" subsystem in patch 3 that I
have not reviewed nor acked yet, and which should be been
split as a separate patch from the migration changes too.

With regards,
Daniel

On Tue, Nov 15, 2022 at 04:34:44PM +0100, Juan Quintela wrote:
> The following changes since commit 98f10f0e2613ba1ac2ad3f57a5174014f6dcb03d:
> 
>   Merge tag 'pull-target-arm-20221114' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-11-14 13:31:17 -0500)
> 
> are available in the Git repository at:
> 
>   https://gitlab.com/juan.quintela/qemu.git tags/next-pull-request
> 
> for you to fetch changes up to d896a7a40db13fc2d05828c94ddda2747530089c:
> 
>   migration: Block migration comment or code is wrong (2022-11-15 10:31:06 +0100)
> 
> ----------------------------------------------------------------
> Migration PULL request (take 2)
> 
> Hi
> 
> This time properly signed.
> 
> [take 1]
> It includes:
> - Leonardo fix for zero_copy flush
> - Fiona fix for return value of readv/writev
> - Peter Xu cleanups
> - Peter Xu preempt patches
> - Patches ready from zero page (me)
> - AVX2 support (ling)
> - fix for slow networking and reordering of first packets (manish)
> 
> Please, apply.
> 
> ----------------------------------------------------------------
> 
> Fiona Ebner (1):
>   migration/channel-block: fix return value for
>     qio_channel_block_{readv,writev}
> 
> Juan Quintela (5):
>   multifd: Create page_size fields into both MultiFD{Recv,Send}Params
>   multifd: Create page_count fields into both MultiFD{Recv,Send}Params
>   migration: Export ram_transferred_ram()
>   migration: Export ram_release_page()
>   migration: Block migration comment or code is wrong
> 
> Leonardo Bras (1):
>   migration/multifd/zero-copy: Create helper function for flushing
> 
> Peter Xu (20):
>   migration: Fix possible infinite loop of ram save process
>   migration: Fix race on qemu_file_shutdown()
>   migration: Disallow postcopy preempt to be used with compress
>   migration: Use non-atomic ops for clear log bitmap
>   migration: Disable multifd explicitly with compression
>   migration: Take bitmap mutex when completing ram migration
>   migration: Add postcopy_preempt_active()
>   migration: Cleanup xbzrle zero page cache update logic
>   migration: Trivial cleanup save_page_header() on same block check
>   migration: Remove RAMState.f references in compression code
>   migration: Yield bitmap_mutex properly when sending/sleeping
>   migration: Use atomic ops properly for page accountings
>   migration: Teach PSS about host page
>   migration: Introduce pss_channel
>   migration: Add pss_init()
>   migration: Make PageSearchStatus part of RAMState
>   migration: Move last_sent_block into PageSearchStatus
>   migration: Send requested page directly in rp-return thread
>   migration: Remove old preempt code around state maintainance
>   migration: Drop rs->f
> 
> ling xu (2):
>   Update AVX512 support for xbzrle_encode_buffer
>   Unit test code and benchmark code
> 
> manish.mishra (1):
>   migration: check magic value for deciding the mapping of channels
> 
>  meson.build                   |  16 +
>  include/exec/ram_addr.h       |  11 +-
>  include/exec/ramblock.h       |   3 +
>  include/io/channel.h          |  25 ++
>  include/qemu/bitmap.h         |   1 +
>  migration/migration.h         |   7 -
>  migration/multifd.h           |  10 +-
>  migration/postcopy-ram.h      |   2 +-
>  migration/ram.h               |  23 +
>  migration/xbzrle.h            |   4 +
>  io/channel-socket.c           |  27 ++
>  io/channel.c                  |  39 ++
>  migration/block.c             |   4 +-
>  migration/channel-block.c     |   6 +-
>  migration/migration.c         | 109 +++--
>  migration/multifd-zlib.c      |  14 +-
>  migration/multifd-zstd.c      |  12 +-
>  migration/multifd.c           |  69 +--
>  migration/postcopy-ram.c      |   5 +-
>  migration/qemu-file.c         |  27 +-
>  migration/ram.c               | 794 +++++++++++++++++-----------------
>  migration/xbzrle.c            | 124 ++++++
>  tests/bench/xbzrle-bench.c    | 465 ++++++++++++++++++++
>  tests/unit/test-xbzrle.c      |  39 +-
>  util/bitmap.c                 |  45 ++
>  meson_options.txt             |   2 +
>  scripts/meson-buildoptions.sh |  14 +-
>  tests/bench/meson.build       |   4 +
>  28 files changed, 1379 insertions(+), 522 deletions(-)
>  create mode 100644 tests/bench/xbzrle-bench.c
> 
> -- 
> 2.38.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


