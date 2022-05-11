Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5E1524049
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 00:31:51 +0200 (CEST)
Received: from localhost ([::1]:39132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nous3-0007Q1-0P
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 18:31:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nouq8-00061a-8k; Wed, 11 May 2022 18:29:52 -0400
Received: from mail-yb1-f178.google.com ([209.85.219.178]:45878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nouq6-0004Du-Ho; Wed, 11 May 2022 18:29:52 -0400
Received: by mail-yb1-f178.google.com with SMTP id v59so6552913ybi.12;
 Wed, 11 May 2022 15:29:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RaBhlvle6pQ2jKUbFcqlcgmp6hj6qaQqY558tU3tMnY=;
 b=w+qgIEyQnAGv6rtm6JHhSzWt8mrc65kp2BJqlOlgqr3sqTuivpg9RNLG7MmA39I0RV
 QrdlYL6BbdtxDYQz2H8eIyuJ7Nb/fVXeckSrGBfB1nG7qL4RPZTHA3yaBDXEjX3aD638
 vbeefxEQ6YVySAr/hNgoshURDVZHMrOflpVKIfw5xEh98YfIQSeGyh//11HD/ufi6PW3
 gIJpPGojpmAw0pFtCyLpKg6DVXD4mxmfWqZbQM+hoEyaPdo8FpAkMSn1iz5tes6GwobW
 xBPg9LuB/NfQU7MnYRUEeYa/LRY2o/OnhBdtRJKNki7WfFLG4nZ0xJqp+yYRmF+smL+V
 oP5w==
X-Gm-Message-State: AOAM5324txYTG90EM8i4vvz4oFuU+Z+O67/iZbPxusDSNbKrJbm/H6Yh
 K7mIiDFkOeYez9cZtjznCGyyjtbdYqaFReXijvI=
X-Google-Smtp-Source: ABdhPJx7pPdbj/h0ow8qBvDfZ1SQRNvJm60uBiNIE30H2OhJa7EoWolwpHxTKv9RowogcDTvpmCK3Fd0v6ttsxWAFCo=
X-Received: by 2002:a25:b095:0:b0:649:d59e:4c07 with SMTP id
 f21-20020a25b095000000b00649d59e4c07mr25553537ybj.627.1652308189063; Wed, 11
 May 2022 15:29:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220509125315.3746865-1-stefanha@redhat.com>
In-Reply-To: <20220509125315.3746865-1-stefanha@redhat.com>
Date: Thu, 12 May 2022 00:29:38 +0200
Message-ID: <CAAdtpL5_tY1hPYGt-=yBbqgCkSCaUGvKORZ_Eaw9p9_i=UFNsg@mail.gmail.com>
Subject: Re: [PULL 0/9] Block patches
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, 
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Nicolas Saenz Julienne <nsaenzju@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.219.178;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-yb1-f178.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-devel@nongnu.org>

Hi Stefan, Nicolas,

On Mon, May 9, 2022 at 3:14 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The following changes since commit 554623226f800acf48a2ed568900c1c968ec9a8b:
>
>   Merge tag 'qemu-sparc-20220508' of https://github.com/mcayland/qemu into staging (2022-05-08 17:03:26 -0500)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stefanha/qemu.git tags/block-pull-request
>
> for you to fetch changes up to 3dc584abeef0e1277c2de8c1c1974cb49444eb0a:
>
>   virtio-scsi: move request-related items from .h to .c (2022-05-09 10:45:04 +0100)
>
> ----------------------------------------------------------------
> Pull request
>
> - Add new thread-pool-min/thread-pool-max parameters to control the thread pool
>   used for async I/O.
>
> - Fix virtio-scsi IOThread 100% CPU consumption QEMU 7.0 regression.
>
> ----------------------------------------------------------------
>
> Nicolas Saenz Julienne (3):
>   Introduce event-loop-base abstract class
>   util/main-loop: Introduce the main loop into QOM
>   util/event-loop-base: Introduce options to set the thread pool size

I'm getting this warning on Darwin:

...
[379/1097] Linking static target libevent-loop-base.a
warning: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ranlib:
archive library: libevent-loop-base.a the table of contents is empty
(no object file members in the library define global symbols)
...

Having:

$ nm libevent-loop-base.a

libevent-loop-base.a(event-loop-base.c.o):
00000000000005d0 d _.compoundliteral
                 U ___stack_chk_fail
                 U ___stack_chk_guard
00000000000005e0 d _aio_max_batch_info
0000000000000000 t _do_qemu_init_register_types
                 U _error_setg_internal
00000000000001d4 t _event_loop_base_can_be_deleted
0000000000000054 t _event_loop_base_class_init
0000000000000138 t _event_loop_base_complete
0000000000000260 t _event_loop_base_get_param
0000000000000400 s _event_loop_base_info
000000000000001c t _event_loop_base_instance_init
00000000000002c4 t _event_loop_base_set_param
                 U _object_class_dynamic_cast_assert
                 U _object_class_property_add
                 U _object_dynamic_cast_assert
                 U _object_get_class
                 U _register_module_init
0000000000000010 t _register_types
0000000000000600 d _thread_pool_max_info
00000000000005f0 d _thread_pool_min_info
                 U _type_register_static
                 U _visit_type_int64
0000000000000468 s l_.str
0000000000000478 s l_.str.1
00000000000005a6 s l_.str.10
000000000000047f s l_.str.2
000000000000048e s l_.str.3
00000000000004d9 s l_.str.4
00000000000004e7 s l_.str.5
00000000000004eb s l_.str.6
00000000000004fb s l_.str.7
000000000000050b s l_.str.8
0000000000000574 s l_.str.9
00000000000004c9 s l___func__.EVENT_LOOP_BASE
000000000000055a s l___func__.EVENT_LOOP_BASE_GET_CLASS
0000000000000545 s l___func__.USER_CREATABLE_CLASS
000000000000058c s l___func__.event_loop_base_set_param
0000000000000000 t ltmp0
0000000000000400 s ltmp1
0000000000000468 s ltmp2
00000000000005d0 d ltmp3
0000000000000610 s ltmp4
0000000000002b78 s ltmp5

Maybe smth missing on the meson side? (+Paolo)

$ git-diff 554623226..178bacb66 meson.build
...
+event_loop_base = files('event-loop-base.c')
+event_loop_base = static_library('event-loop-base', sources:
event_loop_base + genh,
+                                 build_by_default: true)
+event_loop_base = declare_dependency(link_whole: event_loop_base,
+                                     dependencies: [qom])
...

Any clue?

