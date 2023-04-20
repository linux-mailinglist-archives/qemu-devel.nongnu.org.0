Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1AC6E964C
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:50:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUaX-0000i2-VL; Thu, 20 Apr 2023 09:44:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppUa5-0000eU-7V
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:44:13 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppUa3-0007A7-37
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:44:12 -0400
Received: by mail-wm1-x331.google.com with SMTP id v10so1245232wmn.5
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 06:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681998249; x=1684590249;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+LSn1h+77W6+OZnHZu4E525LVI4dAj+WkAvi+DNuqyE=;
 b=iDFxq6eqjhE1XWK9UcrB/+SZtqwGYurx9DHYMWprhSoXu45S5ZlBXfjx23UdcwFgcR
 Rf2Vu7nQa7bIdWWZeqn0YZBoxOkWUsMPeHvJfQMs8ZGzbubr0rREVxnqZ2+Q3RdRoKQ8
 7wy+Ak8UxyRO1kedfDjejEfRYz6MvppST4csFyhSC+HrXaOA56WUaXKz7SwJ86144TmZ
 KNlKfU384iDAGrNgMyMeS3O+nX8z1zYlirjfNlS/ZTuMY7qrEnFGFnhA3Wjv/+7ZWmib
 UVGYdWt7/uGuwFgNgHH/jQvs4qlfp22uZcgEUuOUO9jIaebdOM/cy6UNdbyYpK0/pnGy
 fY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681998249; x=1684590249;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+LSn1h+77W6+OZnHZu4E525LVI4dAj+WkAvi+DNuqyE=;
 b=GRhESJk8O7sLkhD3W7U0cXf5lxjnpc1CFaX1Ftp0+AaWUndAOv7MPzduhEbQkSpgNR
 CCqAJCg78PaL6J0L449+XD6DrAxZa1ZEQD0caU7rBYeTcKcd5yXM/VimDVGU5z14la6a
 g40WlIFVtxLq4NONHDmEVm8HEGQC3TFSllWiMuEyPJe3x47HzTV1ceaQGyKm3F/ljYTD
 LBvMZc0RL/2y1G6DpayU35a6dT1myQmEOz1pPrYGdzHDilt65y7aMSst7wTIn0BwSQg2
 vC8QjeCPFT1I+KTJmMmlOwp5SoAMnwf3wCLVXceZ3DfRTL7uQ4QkGK1uPnelkWlBj5hc
 dwbA==
X-Gm-Message-State: AAQBX9eLokJveQt8S0dbvYtd2BL2ZiJzF9PVWt6CHkoPyMMHv8xX9zGR
 MsBetbneHcwO7LMA2C0FygUsBg==
X-Google-Smtp-Source: AKy350ZgSUF5d1AFXHG6+3IeU9w8lo38tMgINImldFbcXq1hqE8YiduWy58P4owV8AtE8lb/zPy7wQ==
X-Received: by 2002:a05:600c:2055:b0:3f0:9ff5:79fb with SMTP id
 p21-20020a05600c205500b003f09ff579fbmr1214996wmg.39.1681998249527; 
 Thu, 20 Apr 2023 06:44:09 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 14-20020a05600c028e00b003f18b942338sm1754424wmk.3.2023.04.20.06.44.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 06:44:08 -0700 (PDT)
Message-ID: <f7b20c96-be06-2299-5589-11dbf23251f8@linaro.org>
Date: Thu, 20 Apr 2023 15:44:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 20/20] aio: remove aio_disable_external() API
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Lieven <pl@kamp.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Xie Yongji <xieyongji@bytedance.com>, Juan Quintela <quintela@redhat.com>,
 qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>, Stefan Weil <sw@weilnetz.de>,
 Fam Zheng <fam@euphon.net>, Julia Suvorova <jusual@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, xen-devel@lists.xenproject.org,
 Hanna Reitz <hreitz@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, eesposit@redhat.com, Kevin Wolf <kwolf@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Anthony Perard <anthony.perard@citrix.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>
References: <20230420113732.336620-1-stefanha@redhat.com>
 <20230420113732.336620-21-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230420113732.336620-21-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 20/4/23 13:37, Stefan Hajnoczi wrote:
> All callers now pass is_external=false to aio_set_fd_handler() and
> aio_set_event_notifier(). The aio_disable_external() API that
> temporarily disables fd handlers that were registered is_external=true
> is therefore dead code.
> 
> Remove aio_disable_external(), aio_enable_external(), and the
> is_external arguments to aio_set_fd_handler() and
> aio_set_event_notifier().
> 
> The entire test-fdmon-epoll test is removed because its sole purpose was
> testing aio_disable_external().
> 
> Parts of this patch were generated using the following coccinelle
> (https://coccinelle.lip6.fr/) semantic patch:
> 
>    @@
>    expression ctx, fd, is_external, io_read, io_write, io_poll, io_poll_ready, opaque;
>    @@
>    - aio_set_fd_handler(ctx, fd, is_external, io_read, io_write, io_poll, io_poll_ready, opaque)
>    + aio_set_fd_handler(ctx, fd, io_read, io_write, io_poll, io_poll_ready, opaque)
> 
>    @@
>    expression ctx, notifier, is_external, io_read, io_poll, io_poll_ready;
>    @@
>    - aio_set_event_notifier(ctx, notifier, is_external, io_read, io_poll, io_poll_ready)
>    + aio_set_event_notifier(ctx, notifier, io_read, io_poll, io_poll_ready)
> 
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   include/block/aio.h           | 55 --------------------------
>   util/aio-posix.h              |  1 -
>   block.c                       |  7 ----
>   block/blkio.c                 | 15 +++----
>   block/curl.c                  | 10 ++---
>   block/export/fuse.c           |  8 ++--
>   block/export/vduse-blk.c      | 10 ++---
>   block/io.c                    |  2 -
>   block/io_uring.c              |  4 +-
>   block/iscsi.c                 |  3 +-
>   block/linux-aio.c             |  4 +-
>   block/nfs.c                   |  5 +--
>   block/nvme.c                  |  8 ++--
>   block/ssh.c                   |  4 +-
>   block/win32-aio.c             |  6 +--
>   hw/i386/kvm/xen_xenstore.c    |  2 +-
>   hw/virtio/virtio.c            |  6 +--
>   hw/xen/xen-bus.c              |  8 ++--
>   io/channel-command.c          |  6 +--
>   io/channel-file.c             |  3 +-
>   io/channel-socket.c           |  3 +-
>   migration/rdma.c              | 16 ++++----
>   tests/unit/test-aio.c         | 27 +------------
>   tests/unit/test-fdmon-epoll.c | 73 -----------------------------------
>   util/aio-posix.c              | 20 +++-------
>   util/aio-win32.c              |  8 +---
>   util/async.c                  |  3 +-
>   util/fdmon-epoll.c            | 10 -----
>   util/fdmon-io_uring.c         |  8 +---
>   util/fdmon-poll.c             |  3 +-
>   util/main-loop.c              |  7 ++--
>   util/qemu-coroutine-io.c      |  7 ++--
>   util/vhost-user-server.c      | 11 +++---
>   tests/unit/meson.build        |  3 --
>   34 files changed, 76 insertions(+), 290 deletions(-)
>   delete mode 100644 tests/unit/test-fdmon-epoll.c


> -/**
> - * aio_disable_external:
> - * @ctx: the aio context
> - *
> - * Disable the further processing of external clients.
> - */
> -static inline void aio_disable_external(AioContext *ctx)
> -{
> -    qatomic_inc(&ctx->external_disable_cnt);
> -}
> -
> -/**
> - * aio_enable_external:
> - * @ctx: the aio context
> - *
> - * Enable the processing of external clients.
> - */
> -static inline void aio_enable_external(AioContext *ctx)
> -{
> -    int old;
> -
> -    old = qatomic_fetch_dec(&ctx->external_disable_cnt);
> -    assert(old > 0);
> -    if (old == 1) {
> -        /* Kick event loop so it re-arms file descriptors */
> -        aio_notify(ctx);
> -    }
> -}
> -
> -/**
> - * aio_external_disabled:
> - * @ctx: the aio context
> - *
> - * Return true if the external clients are disabled.
> - */
> -static inline bool aio_external_disabled(AioContext *ctx)
> -{
> -    return qatomic_read(&ctx->external_disable_cnt);
> -}

Missing:

-- >8 --
diff --git a/include/block/aio.h b/include/block/aio.h
index d4ce01ea08..266be26f8e 100644
--- a/include/block/aio.h
+++ b/include/block/aio.h
@@ -224,6 +224,4 @@ struct AioContext {
      QEMUTimerListGroup tlg;

-    int external_disable_cnt;
-
      /* Number of AioHandlers without .io_poll() */
      int poll_disable_cnt;
diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index d9d3807062..5c89169e46 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -436,5 +436,4 @@ static void test_graph_change_drain_all(void)
      g_assert_cmpint(bs_b->quiesce_counter, ==, 0);
      g_assert_cmpint(b_s->drain_count, ==, 0);
-    g_assert_cmpint(qemu_get_aio_context()->external_disable_cnt, ==, 0);

      bdrv_unref(bs_b);
---

Once cleaned:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


