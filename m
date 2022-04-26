Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E93B50EE30
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 03:43:25 +0200 (CEST)
Received: from localhost ([::1]:56244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njAEd-0002ox-Mt
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 21:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1njADM-0001z0-1L
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 21:42:04 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:39519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1njADK-0007gA-Eh
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 21:42:03 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2f7b90e8b37so90081027b3.6
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 18:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a0kbhv25EyGtknQyQkZWlXio/4ZXWby20rQvKZhxOYo=;
 b=GSAeBAMvi7IoE07i6YXZ4jTWcJvig9v5sTuZHekZBdgDIsMN4jgYA9V7CYptrKZhiw
 rU4tYjc1LrW/aXUD8Vsnkm3HGU5kJCWiW1uebKBIl/UBFUfj1GI6667DkPQpQI6CiLnN
 cFuB3zEaPswNprRjIqX1rDnfF5nvbch75REHucU9vyCNiMs2WdOliBiiOAVmt+Mz9Ydn
 kzW94QXlJtjfNYHU/3BKWOxH3/zGkPtstuqjO+MEQeAUV2aV1V4syl8HI7AxmztLZlB7
 kow2hYx2koYOTfVQKu+mod+pSGW7HS6TCNFiIWJSSODB+DSR/3BHwUgCYs9hNSh/xaNb
 wEFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a0kbhv25EyGtknQyQkZWlXio/4ZXWby20rQvKZhxOYo=;
 b=kO0ZFevGu14r9Oj+bUUtMzpZAmptWgFTp594ifELwxTAJ+epkX07EshgsuEYOdToFn
 8CRocJWU1Ozf9DY8Q2N3g7NFSSyxCIpr9l5P5N1xwqci0r8Mz3q5WtRoZFMZ8yeidyOs
 /gMx2s4f+4EM9fzcShH0CqITrFpqOaSHbRjlGWyONm1rZMZiTCbeTPOSBglgNUyC+F4o
 iGUlx0atMtYwm4nOem9DyACrSO1kTMhXhgatE6MYEPzP7IFfq/vYFAicpDAUvpB5GFqG
 Z1LfkAClOU5IrNZZQjDI3mxllA3uVFk1YGye26ZzXHJrfHar303Dti8XGNt1puJ2EK4s
 Hw1A==
X-Gm-Message-State: AOAM532p/gSNjBXYuuGA7O73u/1z3ac1ZUYGHcYamThUGC6g52Ka5HWR
 tZ8cbJnJOMIR6CIjNMzWZ6H9B6R4Kcmb69Wb22M=
X-Google-Smtp-Source: ABdhPJwyc9az4OTP7uLtcAqZAc0jcK8419iFOgFOHKRtvmRu6AwNo9GGBqfcHvWSnPC+Vs7tfwTHQu0+owxjCsEa6ck=
X-Received: by 2002:a81:ad7:0:b0:2e6:84de:3223 with SMTP id
 206-20020a810ad7000000b002e684de3223mr19927024ywk.209.1650937321516; Mon, 25
 Apr 2022 18:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220425142705.2099270-1-bmeng.cn@gmail.com>
In-Reply-To: <20220425142705.2099270-1-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 26 Apr 2022 09:41:49 +0800
Message-ID: <CAEUhbmV6mDnkoKfzJMgs8PSrtTjQ9SnSE3XtgOuY3qaO+F7wJA@mail.gmail.com>
Subject: Re: [PATCH 0/9] 9pfs: Add 9pfs support for Windows host
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Guohuai Shi <guohuai.shi@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Mark


On Mon, Apr 25, 2022 at 10:27 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> At present there is no Windows support for 9p file system.
> This series adds initial Windows support for 9p file system.
>
> 'local' file system backend driver is supported on Windows,
> including open, read, write, close, rename, remove, etc.
> All security models are supported. The mapped (mapped-xattr)
> security model is implemented using NTFS Alternate Data Stream
> (ADS) so the 9p export path shall be on an NTFS partition.
>
> 'synth' backend driver is updated only to build sucessuflly
> in a Windows build. Funtionalities are not tested as test
> cases do not run on Windows at present.
>
> Example command line to test:
>
>   "-fsdev local,path=c:\msys64,security_model=mapped,id=p9 -device virtio-9p-pci,fsdev=p9,mount_tag=p9fs"
>
>
> Bin Meng (2):
>   hw/9pfs: Compile 9p-local.c and 9p-proxy.c for Linux and macOS
>   qemu/xatth.h: Update for Windows build
>
> Guohuai Shi (7):
>   hw/9pfs: Extract common stuff to 9p-local.h
>   fsdev: Add missing definitions for Windows in file-op-9p.h
>   hw/9pfs: Add a 'local' file system backend driver for Windows
>   hw/9pfs: Update 9p-synth.c for Windows build
>   fsdev: Enable 'local' file system driver backend for Windows
>   meson.build: Turn on virtfs for Windows host
>   hw/9p: win32: Translate Windows error number to Linux value
>
>  meson.build              |   10 +-
>  fsdev/file-op-9p.h       |   33 +
>  hw/9pfs/9p-linux-errno.h |  151 +++++
>  hw/9pfs/9p-local.h       |   20 +
>  hw/9pfs/9p-util.h        |   41 ++
>  hw/9pfs/9p.h             |   27 +
>  include/qemu/xattr.h     |    4 +-
>  fsdev/qemu-fsdev.c       |    2 +
>  hw/9pfs/9p-local-win32.c | 1242 ++++++++++++++++++++++++++++++++++++++
>  hw/9pfs/9p-local.c       |   14 -
>  hw/9pfs/9p-synth.c       |    5 +-
>  hw/9pfs/9p-util-win32.c  |  341 +++++++++++
>  hw/9pfs/9p-xattr.c       |  113 ++++
>  hw/9pfs/9p.c             |   98 ++-
>  hw/9pfs/codir.c          |   15 +
>  fsdev/meson.build        |    1 +
>  hw/9pfs/meson.build      |   12 +-
>  17 files changed, 2103 insertions(+), 26 deletions(-)
>  create mode 100644 hw/9pfs/9p-linux-errno.h
>  create mode 100644 hw/9pfs/9p-local-win32.c
>  create mode 100644 hw/9pfs/9p-util-win32.c
>
> --
> 2.25.1
>

