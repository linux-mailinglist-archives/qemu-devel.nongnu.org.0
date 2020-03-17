Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C281886BE
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 15:02:13 +0100 (CET)
Received: from localhost ([::1]:33334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jECnM-0004mQ-Op
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 10:02:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39273)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jECls-0004Hl-Fv
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 10:00:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jEClq-0001Sj-2m
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 10:00:40 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:36119)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jEClp-0001IN-HM
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 10:00:38 -0400
Received: by mail-ot1-x330.google.com with SMTP id 39so6285208otu.3
 for <qemu-devel@nongnu.org>; Tue, 17 Mar 2020 07:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=28ldVA9giUV1WH9GFccgflTLGR7epTiydmvVCTXwX/E=;
 b=nhQlvvlTNocEOUhWqgw3NuswRr7VeubVahG9La1idRmFDSJEVcsXu643tYPhRfcHwI
 ANmjrSVgXI7Hht9YKDKKUQNrpNzbTFJzCEtBaTKY8rqtpk4vuHjk8MUJuMQf9erwjGix
 W8AzwfVW0cXkl0TcSv+kyqC6JltoTydSXHHhZKbqrZmZZM6vCL04e3/VFlK9F1BmnO+Y
 VWF3RRINxYvhwUzO8DSeTzTMAPBNDy6bHQF0avJidnx//hxbJqZGhtPajB9h0SMS+2Zx
 DyKnz2tgA6VJOq0OlUwyWW5MSUbja5XdFxeH1RIv0rMt8yCooic/6fedaj7IExBKH0Oc
 RUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=28ldVA9giUV1WH9GFccgflTLGR7epTiydmvVCTXwX/E=;
 b=TSKF/3Jy4zjZm4Fr/3L7ox99PAY1K5QkR63xsHDl4P7l9xT4bWj1gmfEPFfDkE30cJ
 CHp02IplZ0uqIJxoekdsr18C+UAU3jq2IYcgyylyTJrkX/DS944AXWDETMYS+lpiI4BJ
 uWoh/ttFt3aQXBarrjLm7SF8OiiQa8eI5pazmk7TIBoEnXdXAXGd8OSq9gjF9ZH0nsDU
 Zv2r+EJ/af/fd+iPHnzBcu7Bt/eTQR6oP4yWVooydUm4UYPbX5QwC+tybjnpZzNhpL4n
 xF7EW9g7Wm3WUwqgYsEKCQnuHSwXJlEkSS7XFdFnyGN2SkDZ9+AGKRnIg+5lq0RiOBj5
 aNuA==
X-Gm-Message-State: ANhLgQ3o2RxwEELCEjZtu+LL0Hzs5rFtkz7lJ7aWxZz0/XysmX0NU6jt
 1fTvQ++ky2KbFFVSbGv4WeuRcdiw71kN2xdhBX/lrA==
X-Google-Smtp-Source: ADFU+vuoGz09mfYz1OBwlrMyX3EcqXSsyox00zyrVrOJkRGwrryZFZBr73ofO72P7dEz5FhUj9rmX5Gz8d8Nt7IPpg8=
X-Received: by 2002:a9d:76c9:: with SMTP id p9mr3797117otl.135.1584453636455; 
 Tue, 17 Mar 2020 07:00:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200317043819.20197-1-jsnow@redhat.com>
In-Reply-To: <20200317043819.20197-1-jsnow@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Mar 2020 14:00:24 +0000
Message-ID: <CAFEAcA_=DHpNZ+b9Hrim39R74Jik8MKqu8MPJm80wMsQS0FADQ@mail.gmail.com>
Subject: Re: [PULL 00/10] Bitmaps patches
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::330
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Libvirt <libvir-list@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 17 Mar 2020 at 04:38, John Snow <jsnow@redhat.com> wrote:
>
> The following changes since commit 6e8a73e911f066527e775e04b98f31ebd19db600:
>
>   Merge remote-tracking branch 'remotes/stefanha/tags/block-pull-request' into staging (2020-03-11 14:41:27 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/jnsnow/qemu.git tags/bitmaps-pull-request
>
> for you to fetch changes up to 34b456d485a4df3a88116fb5ef0c418f2f12990d:
>
>   block/qcow2-bitmap: use bdrv_dirty_bitmap_next_dirty (2020-03-12 16:36:46 -0400)
>
> ----------------------------------------------------------------
> Pull request
>
> ---------------------------------------------------------------

Hi; this fails to compile with clang:

/home/petmay01/linaro/qemu-for-merges/nbd/server.c:1937:1: error:
unused function 'glib_listautoptr_cleanup_NBDExtentArray'
[-Werror,-Wunused-function]
G_DEFINE_AUTOPTR_CLEANUP_FUNC(NBDExtentArray, nbd_extent_array_free);
^
/usr/include/glib-2.0/glib/gmacros.h:462:22: note: expanded from macro
'G_DEFINE_AUTOPTR_CLEANUP_FUNC'
  static inline void _GLIB_AUTOPTR_LIST_FUNC_NAME(TypeName) (GList
**_l) { g_list_free_full (*_l, (GDestroyNotify) func); } \
                     ^
/usr/include/glib-2.0/glib/gmacros.h:443:48: note: expanded from macro
'_GLIB_AUTOPTR_LIST_FUNC_NAME'
#define _GLIB_AUTOPTR_LIST_FUNC_NAME(TypeName)
glib_listautoptr_cleanup_##TypeName
                                               ^
<scratch space>:49:1: note: expanded from here
glib_listautoptr_cleanup_NBDExtentArray
^

thanks
-- PMM

