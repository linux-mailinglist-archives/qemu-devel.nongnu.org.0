Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E77D062A19F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 19:59:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ov18C-00006H-2T; Tue, 15 Nov 2022 13:58:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ov189-00005f-5N; Tue, 15 Nov 2022 13:57:57 -0500
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ov186-00021b-SY; Tue, 15 Nov 2022 13:57:56 -0500
Received: by mail-yb1-xb32.google.com with SMTP id 205so3773040ybe.7;
 Tue, 15 Nov 2022 10:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QxX2rBcAL8aKt5qWCOv+ZU81c/fF/ceAnCzVGa4aveo=;
 b=ZRE5KtiWCxLEY14GkwYX9XnFx/1H0tfaL1WgF7bY+3mrrOSTV6MCSBkshUNiWOcxZn
 xxzFakWzviktsBbZ7TvdZ1IwwUvsz3806StiOg/GKBp8UmwbIM6BfUIIUAbtX2hen7ZD
 vaa/2qT7vwEjjGKkpFIKqVhDxw1GgjKaifBL0NaxZiSlHsiTAlUX6toYimxOAo9wmqkT
 Zw5IEFiood3EVD6dUPj7ovXju9g4wdhVWYW81q6Uqrf/wY+O7JkThULExCebrB3vj/Ao
 QBVa6Vpb+zAeT21ca78pw1HmGkXr5GD4Vc+S+vQl34byXIbHbMnI9Jn14Y/fa22pBs1y
 pDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QxX2rBcAL8aKt5qWCOv+ZU81c/fF/ceAnCzVGa4aveo=;
 b=syqXeytXBkm4KK80iLr2WVqGcJVcIRi/ZJESkwfu/gK56Wc2YPyKI/Gwclmiz0f3GA
 1pnL70KDrV9gacRy3cHoY4Qqx9ZQ37svP2V9F8XEekvFSqjtlkyzw3Y5ZIE4jMG5Ae3k
 cBvUQnzwUnxxXHozycWKraBar78u6eiRh8wjt5NOxotjgkNwuLT2B9omyDMew/uvN01K
 tsrk2vCMqXa45vyqBAkV6G36F/sEFh1AEsK5mGQxTGmpIqgAV0QRn4GAZ52AeV14wgkP
 kxxKukhunUeoLqvdpC7VkZKEKjqLkuRhdOJKKeazjUCnyOUIPg4uMoIub89gGNGBqb0S
 T7XQ==
X-Gm-Message-State: ANoB5pmby/FCYZuW1PIfDIS1Y+AK7fiyidcc6gf7vFIn3765rhUspqD2
 +mRTkDIDNxMhrt39kbRbmq+TedUjiSu4FiRsYmE=
X-Google-Smtp-Source: AA0mqf6eCiQIWTfOVkOv/xKmRAJdce76luyyM2HCIbIc7Lh+2WmuA8IAoxCqeE7EpliaxubacpaRRJavsPqUhPBojD8=
X-Received: by 2002:a25:344f:0:b0:6c9:e3ba:b37a with SMTP id
 b76-20020a25344f000000b006c9e3bab37amr18453192yba.642.1668538673007; Tue, 15
 Nov 2022 10:57:53 -0800 (PST)
MIME-Version: 1.0
References: <20221115153514.28003-1-quintela@redhat.com>
In-Reply-To: <20221115153514.28003-1-quintela@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 15 Nov 2022 13:57:41 -0500
Message-ID: <CAJSP0QXFMx3dopk7iXZAM75J-JYyiTFjsRkfNGLQoQEVa2f=HQ@mail.gmail.com>
Subject: Re: [PULL 00/30] Next patches
To: Juan Quintela <quintela@redhat.com>, ling xu <ling1.xu@intel.com>, 
 Zhou Zhao <zhou.zhao@intel.com>, Jun Jin <jun.i.jin@intel.com>
Cc: qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 David Hildenbrand <david@redhat.com>, Laurent Vivier <laurent@vivier.eu>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Fam Zheng <fam@euphon.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 15 Nov 2022 at 10:40, Juan Quintela <quintela@redhat.com> wrote:
>
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

This commit causes the following CI failure:

cc -m64 -mcx16 -Ilibauthz.fa.p -I. -I.. -Iqapi -Itrace -Iui/shader
-I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include
-fdiagnostics-color=auto -Wall -Winvalid-pch -Werror -std=gnu11 -O2 -g
-isystem /builds/qemu-project/qemu/linux-headers -isystem
linux-headers -iquote . -iquote /builds/qemu-project/qemu -iquote
/builds/qemu-project/qemu/include -iquote
/builds/qemu-project/qemu/tcg/i386 -pthread -U_FORTIFY_SOURCE
-D_FORTIFY_SOURCE=2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64
-D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef
-Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common
-fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-limits
-Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers
-Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined
-Wimplicit-fallthrough=2 -Wno-missing-include-dirs
-Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIE
-MD -MQ libauthz.fa.p/authz_simple.c.o -MF
libauthz.fa.p/authz_simple.c.o.d -o libauthz.fa.p/authz_simple.c.o -c
../authz/simple.c
In file included from ../authz/simple.c:23:
../authz/trace.h:1:10: fatal error: trace/trace-authz.h: No such file
or directory
1 | #include "trace/trace-authz.h"
| ^~~~~~~~~~~~~~~~~~~~~

https://gitlab.com/qemu-project/qemu/-/jobs/3326576115

I think the issue is that the test links against objects that aren't
present when qemu-user only build is performed. That's my first guess,
I might be wrong but it is definitely this commit that causes the
failure (I bisected it).

There is a second CI failure here:

clang -m64 -mcx16 -Itests/bench/xbzrle-bench.p -Itests/bench
-I../tests/bench -I. -Iqapi -Itrace -Iui -Iui/shader
-I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include
-I/usr/include/sysprof-4 -flto -fcolor-diagnostics -Wall -Winvalid-pch
-Werror -std=gnu11 -O2 -g -isystem
/builds/qemu-project/qemu/linux-headers -isystem linux-headers -iquote
. -iquote /builds/qemu-project/qemu -iquote
/builds/qemu-project/qemu/include -iquote
/builds/qemu-project/qemu/tcg/i386 -pthread -D_GNU_SOURCE
-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes
-Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes
-fno-strict-aliasing -fno-common -fwrapv -Wold-style-definition
-Wtype-limits -Wformat-security -Wformat-y2k -Winit-self
-Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels
-Wexpansion-to-defined -Wno-initializer-overrides
-Wno-missing-include-dirs -Wno-shift-negative-value
-Wno-string-plus-int -Wno-typedef-redefinition
-Wno-tautological-type-limit-compare -Wno-psabi
-Wno-gnu-variable-sized-type-not-at-end -fstack-protector-strong
-fsanitize=safe-stack -fsanitize=cfi-icall
-fsanitize-cfi-icall-generalize-pointers -fno-sanitize-trap=cfi-icall
-fPIE -MD -MQ tests/bench/xbzrle-bench.p/xbzrle-bench.c.o -MF
tests/bench/xbzrle-bench.p/xbzrle-bench.c.o.d -o
tests/bench/xbzrle-bench.p/xbzrle-bench.c.o -c
../tests/bench/xbzrle-bench.c
../tests/bench/xbzrle-bench.c:84:15: error: implicit declaration of
function 'xbzrle_encode_buffer_avx512' is invalid in C99
[-Werror,-Wimplicit-function-declaration]
dlen512 = xbzrle_encode_buffer_avx512(buffer512, buffer512, XBZRLE_PAGE_SIZE,
^
../tests/bench/xbzrle-bench.c:84:15: note: did you mean 'xbzrle_encode_buffer'?
./../migration/xbzrle.h:17:5: note: 'xbzrle_encode_buffer' declared here
int xbzrle_encode_buffer(uint8_t *old_buf, uint8_t *new_buf, int slen,
^
../tests/bench/xbzrle-bench.c:146:15: error: implicit declaration of
function 'xbzrle_encode_buffer_avx512' is invalid in C99
[-Werror,-Wimplicit-function-declaration]
dlen512 = xbzrle_encode_buffer_avx512(test512, test512, XBZRLE_PAGE_SIZE,
^
../tests/bench/xbzrle-bench.c:205:15: error: implicit declaration of
function 'xbzrle_encode_buffer_avx512' is invalid in C99
[-Werror,-Wimplicit-function-declaration]
dlen512 = xbzrle_encode_buffer_avx512(buffer512, test512, XBZRLE_PAGE_SIZE,
^
../tests/bench/xbzrle-bench.c:268:13: error: implicit declaration of
function 'xbzrle_encode_buffer_avx512' is invalid in C99
[-Werror,-Wimplicit-function-declaration]
rc512 = xbzrle_encode_buffer_avx512(buffer512, test512, XBZRLE_PAGE_SIZE,
^
../tests/bench/xbzrle-bench.c:345:15: error: implicit declaration of
function 'xbzrle_encode_buffer_avx512' is invalid in C99
[-Werror,-Wimplicit-function-declaration]
dlen512 = xbzrle_encode_buffer_avx512(test512, buffer512, XBZRLE_PAGE_SIZE,
^
../tests/bench/xbzrle-bench.c:414:15: error: implicit declaration of
function 'xbzrle_encode_buffer_avx512' is invalid in C99
[-Werror,-Wimplicit-function-declaration]
dlen512 = xbzrle_encode_buffer_avx512(test512, buffer512, XBZRLE_PAGE_SIZE,
^

https://gitlab.com/qemu-project/qemu/-/jobs/3326576144

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
>

