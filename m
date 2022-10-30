Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0939E612C5E
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 20:06:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opDcc-0003Hx-9I; Sun, 30 Oct 2022 15:05:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1opDcZ-00038M-7X
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 15:05:23 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1opDcL-0001jY-7U
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 15:05:22 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-333a4a5d495so90992997b3.10
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 12:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZPqxD8wQ8izFx5lR9LwVqQTHSuG+XF202fMp4KDIVw8=;
 b=QrZuMXaOqlC+/+xg8sdrLyS4G/OoBmEANVGVzvgoklfcEWNT2duXn4TwWQdFWpXD+i
 +zj1fuWuIU9Pb6H8zxVX3rfdMFxgyOUyUEmZYX5AGlP5/0eARfpQWbfWAUafl2icSjP+
 RfLJSfNQgD9Klo37bIcbXvQmWV3jFkrnUwEogBbAYMc1U48Dii/9YCRXTEKbK+HvgKSf
 rHSntr9pJuqEbRrILdRfdLdvKweBecyXjTybAu7/gsR92Ou9tqcX5TmSgGHcOoFEF91w
 iWATKgVEwspm5aVDPlDWuNrd3Gvnx3d5sPtvTEmOYTFnZZIICUOcLWoW1JpUkysWgjzu
 iffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZPqxD8wQ8izFx5lR9LwVqQTHSuG+XF202fMp4KDIVw8=;
 b=y91zXnASeaQFTvuzzobmP9yXDs++un/SECjdhn/Ze4Hvsdt074uH7Qdjz5WrejeN/y
 F7U21l8k94Y8Dn1ivukNDrPuIWuSnxBgbERdNpt9bC7ya7ngBkXNaQXJ1qUAmm7eraMm
 28oJBGEjs9rzadFjU1qHC0sBSRTUEbYAOpjkQ3wQmd9Ca0ZAUCnDnlS8CEXVi6FhpKRt
 U8VKM8vAppPR1K/SlPd546ckTOTBobY1FUcGGNifLNSsg6MkzcrqlW7rr+bCLm3e66Qk
 I+9emaZeyD+CZp3/2Xjz+hgOJ5b5gmyQkxk8Fal3WbhNy6Z7odzDYil5QguY2OvocW/S
 fXpQ==
X-Gm-Message-State: ACrzQf38v8tc9mdpgbqSIV+eBlBZ+fuGD9AlEQkkd77essipwe7DhnSZ
 zguEVSTr73rDH9taMzXDqo7h864USL8xpPrcha4=
X-Google-Smtp-Source: AMsMyM6M5zYTUD42jtExQTN4p+jpdlWI16fTEaBLgyKb2wHEmqi/m2TyY1e7jcd3vKecEucmMLhtaUAilnuwn1hVGto=
X-Received: by 2002:a81:8445:0:b0:36c:c302:8926 with SMTP id
 u66-20020a818445000000b0036cc3028926mr9879127ywf.296.1667156707874; Sun, 30
 Oct 2022 12:05:07 -0700 (PDT)
MIME-Version: 1.0
References: <20221026183532.487708-1-armbru@redhat.com>
In-Reply-To: <20221026183532.487708-1-armbru@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Sun, 30 Oct 2022 15:04:55 -0400
Message-ID: <CAJSP0QV0_jwZWU93VKNjycicD8ng2NPczzXmCU4QCNJm+nvB+w@mail.gmail.com>
Subject: Re: [PULL v2 00/28] QAPI patches patches for 2022-10-25
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 26 Oct 2022 at 14:44, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit e750a7ace492f0b450653d4ad368a77d6f660fb8:
>
>   Merge tag 'pull-9p-20221024' of https://github.com/cschoenebeck/qemu into staging (2022-10-24 14:27:12 -0400)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/armbru.git tags/pull-qapi-2022-10-25-v2
>
> for you to fetch changes up to c0f24f8f31ca82e34ef037bfe34ef71eeecb401d:
>
>   qapi: Drop temporary logic to support conversion step by step (2022-10-26 20:08:52 +0200)
>
> ----------------------------------------------------------------
> QAPI patches patches for 2022-10-25
>
> ----------------------------------------------------------------
> Markus Armbruster (28):
>       docs/devel/qapi-code-gen: Update example to match current code
>       qapi: Tidy up whitespace in generated code
>       docs/devel/qapi-code-gen: Extend example for next commit's change
>       qapi: Start to elide redundant has_FOO in generated C
>       qapi tests: Elide redundant has_FOO in generated C
>       qapi acpi: Elide redundant has_FOO in generated C
>       qapi audio: Elide redundant has_FOO in generated C
>       qapi block: Elide redundant has_FOO in generated C

This commit breaks qemu-iotests 056 in CI. I have included
instructions for reproducing it locally below. I will drop this pull
request for now. Please note that the QEMU 7.2 soft freeze is on
Tuesday.

$ ./configure --target-list=x86_64-softmmu --disable-tcg
--audio-drv-list="" --with-coroutine=ucontext && make
$ (cd build && tests/qemu-iotests/check -qcow2 056)
$ coredumpctl debug
(gdb) bt
#0  __pthread_kill_implementation (threadid=<optimized out>,
signo=signo@entry=6, no_tid=no_tid@entry=0) at pthread_kill.c:44
#1  0x00007f23b81f3c73 in __pthread_kill_internal (signo=6,
threadid=<optimized out>) at pthread_kill.c:78
#2  0x00007f23b81a3986 in __GI_raise (sig=sig@entry=6) at
../sysdeps/posix/raise.c:26
#3  0x00007f23b818d7f4 in __GI_abort () at abort.c:79
#4  0x00007f23b81e7d5e in __libc_message
(action=action@entry=do_abort, fmt=fmt@entry=0x7f23b831f87c "%s\n") at
../sysdeps/posix/libc_fatal.c:155
#5  0x00007f23b81fd95c in malloc_printerr
(str=str@entry=0x7f23b8321ed0 "munmap_chunk(): invalid pointer") at
malloc.c:5659
#6  0x00007f23b81fdbdc in munmap_chunk (p=<optimized out>) at malloc.c:3055
#7  0x00007f23b820214a in __GI___libc_free
(mem=mem@entry=0x560ca9395354) at malloc.c:3376
#8  0x00007f23b9794b8d in g_free (mem=0x560ca9395354) at ../glib/gmem.c:218
#9  0x0000560ca920bf81 in qapi_dealloc_type_str (v=<optimized out>,
name=<optimized out>, obj=<optimized out>, errp=<optimized out>) at
../qapi/qapi-dealloc-visitor.c:68
#10 0x0000560ca920f1ac in visit_type_str (v=v@entry=0x560cacb85000,
name=name@entry=0x560ca93bde6c "format", obj=obj@entry=0x7ffe123a1480,
errp=errp@entry=0x0)
    at ../qapi/qapi-visit-core.c:349
#11 0x0000560ca919ae8a in visit_type_DriveBackup_members
(v=v@entry=0x560cacb85000, obj=obj@entry=0x7ffe123a1420,
errp=errp@entry=0x0) at qapi/qapi-visit-block-core.c:2401
#12 0x0000560ca91acee1 in qmp_marshal_drive_backup (args=<optimized
out>, ret=<optimized out>, errp=<optimized out>) at
qapi/qapi-commands-block-core.c:464
#13 0x0000560ca9213299 in do_qmp_dispatch_bh (opaque=0x7f23b2bc3ea0)
at ../qapi/qmp-dispatch.c:128
#14 0x0000560ca922efa5 in aio_bh_call (bh=0x560cabee1dd0) at ../util/async.c:150
#15 aio_bh_poll (ctx=ctx@entry=0x560cabc83300) at ../util/async.c:178
#16 0x0000560ca921c9be in aio_dispatch (ctx=0x560cabc83300) at
../util/aio-posix.c:421
#17 0x0000560ca922ec0e in aio_ctx_dispatch (source=<optimized out>,
callback=<optimized out>, user_data=<optimized out>) at
../util/async.c:320
#18 0x00007f23b9792faf in g_main_dispatch (context=0x560cabc83c60) at
../glib/gmain.c:3417
#19 g_main_context_dispatch (context=0x560cabc83c60) at ../glib/gmain.c:4135
#20 0x0000560ca923b028 in glib_pollfds_poll () at ../util/main-loop.c:297
#21 os_host_main_loop_wait (timeout=0) at ../util/main-loop.c:320
#22 main_loop_wait (nonblocking=nonblocking@entry=0) at ../util/main-loop.c:596
#23 0x0000560ca8f0ce07 in qemu_main_loop () at ../softmmu/runstate.c:734
#24 0x0000560ca8d45c96 in qemu_default_main () at ../softmmu/main.c:37
#25 0x00007f23b818e510 in __libc_start_call_main
(main=main@entry=0x560ca8d41050 <main>, argc=argc@entry=20,
argv=argv@entry=0x7ffe123a1808) at
../sysdeps/nptl/libc_start_call_main.h:58
#26 0x00007f23b818e5c9 in __libc_start_main_impl
     (main=0x560ca8d41050 <main>, argc=20, argv=0x7ffe123a1808,
init=<optimized out>, fini=<optimized out>, rtld_fini=<optimized out>,
stack_end=0x7ffe123a17f8) at ../csu/libc-start.c:389
#27 0x0000560ca8d45bc5 in _start ()
(gdb) up
#1  0x00007f23b81f3c73 in __pthread_kill_internal (signo=6,
threadid=<optimized out>) at pthread_kill.c:78
78      return __pthread_kill_implementation (threadid, signo, 0);
(gdb) up
#2  0x00007f23b81a3986 in __GI_raise (sig=sig@entry=6) at
../sysdeps/posix/raise.c:26
Downloading 0.00 MB source file
/usr/src/debug/glibc-2.35-20.fc36.x86_64/signal/../sysdeps/posix/raise.c
26      int ret = __pthread_kill (__pthread_self (), sig);
(gdb) up
#3  0x00007f23b818d7f4 in __GI_abort () at abort.c:79
Downloading 0.00 MB source file
/usr/src/debug/glibc-2.35-20.fc36.x86_64/stdlib/abort.c
79          raise (SIGABRT);
(gdb) up
#4  0x00007f23b81e7d5e in __libc_message
(action=action@entry=do_abort, fmt=fmt@entry=0x7f23b831f87c "%s\n") at
../sysdeps/posix/libc_fatal.c:155
Downloading 0.00 MB source file
/usr/src/debug/glibc-2.35-20.fc36.x86_64/libio/../sysdeps/posix/libc_fatal.c
155        abort ();
(gdb) up
#5  0x00007f23b81fd95c in malloc_printerr
(str=str@entry=0x7f23b8321ed0 "munmap_chunk(): invalid pointer") at
malloc.c:5659
Downloading 0.05 MB source file
/usr/src/debug/glibc-2.35-20.fc36.x86_64/malloc/malloc.c
5659      __libc_message (do_abort, "%s\n", str);
(gdb) up
#6  0x00007f23b81fdbdc in munmap_chunk (p=<optimized out>) at malloc.c:3055
3055        malloc_printerr ("munmap_chunk(): invalid pointer");
(gdb) up
#7  0x00007f23b820214a in __GI___libc_free
(mem=mem@entry=0x560ca9395354) at malloc.c:3376
3376          munmap_chunk (p);
(gdb) up
#8  0x00007f23b9794b8d in g_free (mem=0x560ca9395354) at ../glib/gmem.c:218
Downloading 0.00 MB source file
/usr/src/debug/glib2-2.72.3-1.fc36.x86_64/redhat-linux-build/../glib/gmem.c
218      free (mem);
(gdb) up
#9  0x0000560ca920bf81 in qapi_dealloc_type_str (v=<optimized out>,
name=<optimized out>, obj=<optimized out>, errp=<optimized out>) at
../qapi/qapi-dealloc-visitor.c:68
68            g_free(*obj);
(gdb) up
#10 0x0000560ca920f1ac in visit_type_str (v=v@entry=0x560cacb85000,
name=name@entry=0x560ca93bde6c "format", obj=obj@entry=0x7ffe123a1480,
errp=errp@entry=0x0)
    at ../qapi/qapi-visit-core.c:349
349        ok = v->type_str(v, name, obj, errp);
(gdb) up
#11 0x0000560ca919ae8a in visit_type_DriveBackup_members
(v=v@entry=0x560cacb85000, obj=obj@entry=0x7ffe123a1420,
errp=errp@entry=0x0) at qapi/qapi-visit-block-core.c:2401
2401            if (!visit_type_str(v, "format", &obj->format, errp)) {
(gdb) p *obj
$1 = {job_id = 0x0, device = 0x560cacb99c10 "\031\365&\313\tV", sync =
MIRROR_SYNC_MODE_NONE, has_speed = false, speed = 0, bitmap = 0x0,
has_bitmap_mode = false,
  bitmap_mode = BITMAP_SYNC_MODE_ON_SUCCESS, has_compress = false,
compress = false, has_on_source_error = false, on_source_error =
BLOCKDEV_ON_ERROR_REPORT, has_on_target_error = false,
  on_target_error = BLOCKDEV_ON_ERROR_REPORT, has_auto_finalize =
false, auto_finalize = true, has_auto_dismiss = false, auto_dismiss =
true, filter_node_name = 0x0, x_perf = 0x0,
  target = 0x560cabf01930 "\301\070r\314\tV", format = 0x560ca9395354
"qcow2", has_mode = false, mode = NEW_IMAGE_MODE_ABSOLUTE_PATHS}

