Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E68F520568
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 21:42:58 +0200 (CEST)
Received: from localhost ([::1]:40626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no9HV-0003YT-5B
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 15:42:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1no9GN-0002ed-3X
 for qemu-devel@nongnu.org; Mon, 09 May 2022 15:41:47 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:45952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1no9GK-0002zn-G0
 for qemu-devel@nongnu.org; Mon, 09 May 2022 15:41:46 -0400
Received: by mail-pg1-x52d.google.com with SMTP id 7so12861429pga.12
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 12:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wmWrQ047smfhdgI1yoWYZp3IyUbWNYPv0bwYBzYOiDE=;
 b=UugJ0fA/BU4lszGFQ11t9oRkPJuok09dLn6Kwoqyx0gfFJK7z/B2roRa6LUbcG5WS7
 HMNFc2K/58fmtAwH7ooNePIFjKxgpilYfTCW5lF+Yi7G2lTg9byU4RPkRQPfpPDXFmMk
 neI1CoEcK9oUgIqRogS3mWxfoic7Kb0fQsBtKJmgJ6l7Jr3pR4OeDfJucEuAzr2o8LGz
 Hze9XXBb4djZ8z5ZEtI3pauicKBRtdHe1QuRh9uuXPVV5/KyG89pc2fxfJILJQFVmFQm
 dQa7JPQtzeo+QSZFxKaBs76342SI/ReTsKriJTD55d8tyto8v7qkkU48KExUvRpc3o6p
 cZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wmWrQ047smfhdgI1yoWYZp3IyUbWNYPv0bwYBzYOiDE=;
 b=u8QYMnSqO3EVwvXFUsguYi9oO7CijiY2xOeVs5GASbj6KuBiZtYEI5bKWXrna3q5Sv
 e7u4gznNdRvt7/qDL7iN+hfMEY3NZxIPwCftJz/IK8gYdPUVff6drwrU1VucajdXJ1uv
 Q98BaF6cTbRU2Tf+ZUJwGeE+2BvpuawAvYu61TMsozpYQyhJ/gMfs7VZalcPlVuRBDNz
 edEHj1BCAE0P9KNnyFn0OdihHOFxinuCklsLnvz5F75SOEZEde65QMw6AGwUuydn5j3F
 0g/xeNWsNAD9rBrTsUdQu5R/7pFZz8lPbkkTqEBachWgdGIDZTbGiFkhW08uX2dlSVzf
 Q4Hw==
X-Gm-Message-State: AOAM531T3EX0uiJXep8HnVhMkf3y9C8HzqBN1ny8U94kbNKZA+gn/zAs
 1UW7jy+RO3KuuFlDZ+Et4yZd5Q==
X-Google-Smtp-Source: ABdhPJziSkkixnwh6/4fFsQLr1X57x44oaHcm65fnzQ4Fm9vI/pQN5ToMGhOoav5H7kAUzW24uOLsQ==
X-Received: by 2002:a62:dec4:0:b0:50f:70d1:41dd with SMTP id
 h187-20020a62dec4000000b0050f70d141ddmr17270042pfg.68.1652125302931; 
 Mon, 09 May 2022 12:41:42 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a170902eb9100b0015e8d4eb2bbsm213500plg.261.2022.05.09.12.41.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 12:41:42 -0700 (PDT)
Message-ID: <8f4a1435-e5fd-2185-a866-a1588177b14f@linaro.org>
Date: Mon, 9 May 2022 12:41:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 0/9] Block patches
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org
References: <20220509125315.3746865-1-stefanha@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220509125315.3746865-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/9/22 07:53, Stefan Hajnoczi wrote:
> The following changes since commit 554623226f800acf48a2ed568900c1c968ec9a8b:
> 
>    Merge tag 'qemu-sparc-20220508' of https://github.com/mcayland/qemu into staging (2022-05-08 17:03:26 -0500)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/stefanha/qemu.git tags/block-pull-request
> 
> for you to fetch changes up to 3dc584abeef0e1277c2de8c1c1974cb49444eb0a:
> 
>    virtio-scsi: move request-related items from .h to .c (2022-05-09 10:45:04 +0100)
> 
> ----------------------------------------------------------------
> Pull request
> 
> - Add new thread-pool-min/thread-pool-max parameters to control the thread pool
>    used for async I/O.
> 
> - Fix virtio-scsi IOThread 100% CPU consumption QEMU 7.0 regression.

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> 
> Nicolas Saenz Julienne (3):
>    Introduce event-loop-base abstract class
>    util/main-loop: Introduce the main loop into QOM
>    util/event-loop-base: Introduce options to set the thread pool size
> 
> Stefan Hajnoczi (6):
>    virtio-scsi: fix ctrl and event handler functions in dataplane mode
>    virtio-scsi: don't waste CPU polling the event virtqueue
>    virtio-scsi: clean up virtio_scsi_handle_event_vq()
>    virtio-scsi: clean up virtio_scsi_handle_ctrl_vq()
>    virtio-scsi: clean up virtio_scsi_handle_cmd_vq()
>    virtio-scsi: move request-related items from .h to .c
> 
>   qapi/qom.json                    |  43 ++++++++--
>   meson.build                      |  26 +++---
>   include/block/aio.h              |  10 +++
>   include/block/thread-pool.h      |   3 +
>   include/hw/virtio/virtio-scsi.h  |  43 ----------
>   include/hw/virtio/virtio.h       |   1 +
>   include/qemu/main-loop.h         |  10 +++
>   include/sysemu/event-loop-base.h |  41 +++++++++
>   include/sysemu/iothread.h        |   6 +-
>   event-loop-base.c                | 140 +++++++++++++++++++++++++++++++
>   hw/scsi/virtio-scsi-dataplane.c  |   2 +-
>   hw/scsi/virtio-scsi.c            | 101 +++++++++++++++-------
>   hw/virtio/virtio.c               |  13 +++
>   iothread.c                       |  68 +++++----------
>   util/aio-posix.c                 |   1 +
>   util/async.c                     |  20 +++++
>   util/main-loop.c                 |  65 ++++++++++++++
>   util/thread-pool.c               |  55 +++++++++++-
>   18 files changed, 505 insertions(+), 143 deletions(-)
>   create mode 100644 include/sysemu/event-loop-base.h
>   create mode 100644 event-loop-base.c
> 


