Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EF7563865
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 19:04:38 +0200 (CEST)
Received: from localhost ([::1]:42216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7K4L-0004rt-3t
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 13:04:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o7K2k-0003zL-Qc
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 13:02:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o7K2h-0001M3-5r
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 13:02:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656694973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6SVP22+B1fEe9VF09Lg1culELQT1E0tGCwwcZqVTtog=;
 b=Fz1aFlnQ1bHe42h2v1yKAQCrhkqBv0bu5QEZUAghwlAI7dTkBAiBCOS1Yu6yxUbjXiVgp/
 CxuSCag9dXhmSi5/nltt97e5i0XegdlC+eAKxPqDdiSlCoCLn53/7hxWuMuXv0Kr+Ay8i4
 eAMU1/u23nE8/TSBW0QXnixZcs8hEgs=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-Oxbq6eHrOYegmn7ROHzPQQ-1; Fri, 01 Jul 2022 13:02:52 -0400
X-MC-Unique: Oxbq6eHrOYegmn7ROHzPQQ-1
Received: by mail-ua1-f72.google.com with SMTP id
 r21-20020ab070d5000000b00381cadf91a5so938570ual.23
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 10:02:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6SVP22+B1fEe9VF09Lg1culELQT1E0tGCwwcZqVTtog=;
 b=Tef7DWCekQ4cyiXv1FCBIqA0Ym6MHXfnjkLAymGiWpLIsVIOCFTYcmGDi5tetpZ61V
 VLjYHGC4LHJ3etd5lKWLqNg7kkExDtVKci66MvBVdgNPOlyglOC+Qhca86d0VnB6s33J
 FrX0+cYOjVUT40pTjPnBgzg+2d4j7KvaiptyiVRPS0W/xQkSqybuRO1QVWFz55Uc35kz
 ceKobIBEVSC8KGSTkmL3ApO5snjPwYpvWCVseVJmhNWr8NIqkIkTqQzuDc7yg5GmfwcN
 Dxx4q1P5op2mQBoTgvN5LuWnnEIAXqimP98hHpngbXmF6yV8cwPkg8t2w5inXU7/Kg5a
 j/sQ==
X-Gm-Message-State: AJIora906zFz7lA/Lpv4Om2Fx0bLurVyCrbK9jMg0fXTGUWdK87y8nB0
 MohS9BJuWUMj4Mhwd8VbE9N25d/pTybDn5zrijdAo5OMGX03ZlV7H+BXYg0LeSJMYLzFddjUk+c
 p6pYWBNmc7UhRXZXNXkpbJqKrfi6iVs0=
X-Received: by 2002:a9f:358e:0:b0:382:202:c6bc with SMTP id
 t14-20020a9f358e000000b003820202c6bcmr8967406uad.100.1656694971748; 
 Fri, 01 Jul 2022 10:02:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s8sRQi6nIepCZDxzkJ0fXqOxRTz9SiwVgxEDroMs5g1NF5eC+rt5aSODApHmhF6bc+BWo16pkOe9BLnnoqR3I=
X-Received: by 2002:a9f:358e:0:b0:382:202:c6bc with SMTP id
 t14-20020a9f358e000000b003820202c6bcmr8967359uad.100.1656694971438; Fri, 01
 Jul 2022 10:02:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220629081517.446432-1-vsementsov@yandex-team.ru>
 <230922ea-a0ae-06f3-af17-0964dabd13fa@linaro.org>
In-Reply-To: <230922ea-a0ae-06f3-af17-0964dabd13fa@linaro.org>
From: John Snow <jsnow@redhat.com>
Date: Fri, 1 Jul 2022 13:02:40 -0400
Message-ID: <CAFn=p-Y9BVujsBzeoVswWQeA-rfNJPbS3_hT+npjOo_LqKd9rg@mail.gmail.com>
Subject: Re: [PULL v2 0/9] Block jobs & NBD patches
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Qemu-block <qemu-block@nongnu.org>, 
 qemu-devel <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 29, 2022 at 7:18 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/29/22 13:45, Vladimir Sementsov-Ogievskiy wrote:
> > The following changes since commit ad4c7f529a279685da84297773b4ec8080153c2d:
> >
> >    Merge tag 'pull-semi-20220628' of https://gitlab.com/rth7680/qemu into staging (2022-06-28 10:24:31 +0530)
> >
> > are available in the Git repository at:
> >
> >    https://gitlab.com/vsementsov/qemu.git tags/pull-block-2022-06-14-v2
> >
> > for you to fetch changes up to 1b8f777673985af366de099ad4e41d334b36fb12:
> >
> >    block: use 'unsigned' for in_flight field on driver state (2022-06-29 10:57:02 +0300)
> >
> > ----------------------------------------------------------------
> > Block jobs & NBD patches
> >
> > v2: - add arguments to QEMUMachine constructor in test, to make it work
> >        on arm in gitlab pipeline
> >      - use bdrv_inc_in_flight() / bdrv_dec_in_flight() instead of direct
> >        manipulation with bs->in_flight
>
> Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.
>
>
> r~
>
>
> >
> > - add new options for copy-before-write filter
> > - new trace points for NBD
> > - prefer unsigned type for some 'in_flight' fields
> >
> > Denis V. Lunev (2):
> >    nbd: trace long NBD operations
> >    block: use 'unsigned' for in_flight field on driver state
> >
> > Vladimir Sementsov-Ogievskiy (7):
> >    block/copy-before-write: refactor option parsing
> >    block/copy-before-write: add on-cbw-error open parameter
> >    iotests: add copy-before-write: on-cbw-error tests
> >    util: add qemu-co-timeout
> >    block/block-copy: block_copy(): add timeout_ns parameter
> >    block/copy-before-write: implement cbw-timeout option
> >    iotests: copy-before-write: add cases for cbw-timeout option
> >
> >   block/block-copy.c                            |  33 ++-
> >   block/copy-before-write.c                     | 110 ++++++---
> >   block/mirror.c                                |   2 +-
> >   block/nbd.c                                   |   8 +-
> >   block/trace-events                            |   2 +
> >   include/block/block-copy.h                    |   4 +-
> >   include/qemu/coroutine.h                      |  13 ++
> >   nbd/client-connection.c                       |   2 +
> >   nbd/trace-events                              |   3 +
> >   qapi/block-core.json                          |  31 ++-
> >   tests/qemu-iotests/pylintrc                   |   5 +
> >   tests/qemu-iotests/tests/copy-before-write    | 216 ++++++++++++++++++
> >   .../qemu-iotests/tests/copy-before-write.out  |   5 +
> >   util/meson.build                              |   1 +
> >   util/qemu-co-timeout.c                        |  89 ++++++++
> >   15 files changed, 482 insertions(+), 42 deletions(-)
> >   create mode 100755 tests/qemu-iotests/tests/copy-before-write
> >   create mode 100644 tests/qemu-iotests/tests/copy-before-write.out
> >   create mode 100644 util/qemu-co-timeout.c
> >
>
>

iotests: copy-before-write: add cases for cbw-timeout option

- This is causing the FreeBSD VM tests to regress for me, because the
new iotest is failing there. Haven't diagnosed further yet, but I will
update this thread if I get better info.

--js


