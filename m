Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCCD486233
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 10:37:37 +0100 (CET)
Received: from localhost ([::1]:53760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5PDE-0002FW-VW
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 04:37:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5PAn-0000e3-Ak
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 04:35:05 -0500
Received: from [2a00:1450:4864:20::431] (port=42969
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5PAl-0000hl-Gm
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 04:35:04 -0500
Received: by mail-wr1-x431.google.com with SMTP id w20so3562848wra.9
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 01:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=V67VP8mhb3N7T64RUb0hr+rmPoV7L+sITddMvv4xJH0=;
 b=ArFSh9/kBXqajkgeeHgQPNyDOON8x7L0CtvicuuHW8C8ri/WbBISq96g16z4UW0DOo
 VpXYwCuGnSQjJMHey/pf8g+bCYmk8i+uIPY+T8KBCOgGVj4sLh58dw/NfKCz6XWGcir2
 QWEH4+CdlWtL2gO4cmHlPEUp5+CDv45TfffzKKm9DdU6WRPtvmxZ4sr9fBRA5I2X/uzp
 RRvGlkC9jOcS92xAh7nJRCtisnWzL91/x6kVcH7p0UC2VEuZ6oOnEaOrYRZBP1FFqoij
 VX8+bfw1JSvsB+8c5viRuIly6H2R0AMZFbmsEqrWJJ3nD3n0Mf9MdbN2DfLwIqkJIUKk
 CgLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=V67VP8mhb3N7T64RUb0hr+rmPoV7L+sITddMvv4xJH0=;
 b=2OQD0Y1sirZkbGpbGdKPeZr+f5WjA9NX8m177A7uhlPx1YZ/S33bMVO+c+Pr6cMSgc
 60VzRvH3iAqY1T1u+pRDvwFsqdkpg1UD31aWMxUAj26N6mtiF7T9RmDIHAlkwixSwH39
 AS7UAVOpioX4ySQeN7xXo9gq6T9D67biiGWYa9QQvAg34gqsVZOcgQ3Ry93bn26NUXfG
 Sbf6L3e3QfUHRBGJIX5Uv/jJlkjnwcHhnyuho7VobhPQOcWOphslSl1VOsOuGI3N51h8
 161YLtsFWzm21PBuscMGB+N8y1BaLoMx+rQXP4Nj5A/6AxQ9X11me7SFro8AB2aCGK8q
 j+PQ==
X-Gm-Message-State: AOAM532atI7OUaQ3r2p8uLihiiPSY+xdDMIVPiw3v8MCBXqpXLBxNqAO
 nE/3axjXN2enrG3Zw+CaO+Q=
X-Google-Smtp-Source: ABdhPJxzy6xdK+wmpOtqZOhB9zxkORqa2UacugF+g117xoGY15mCle02fUDutgZFuer4Z4tWtcniTg==
X-Received: by 2002:a05:6000:144f:: with SMTP id
 v15mr49116914wrx.400.1641461702185; 
 Thu, 06 Jan 2022 01:35:02 -0800 (PST)
Received: from [192.168.1.33] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id z22sm1225514wmi.26.2022.01.06.01.35.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 01:35:01 -0800 (PST)
Message-ID: <c42361ee-c746-4d89-5992-d1589f67c7d3@amsat.org>
Date: Thu, 6 Jan 2022 10:35:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH 1/1] util: adjust coroutine pool size to virtio block queue
Content-Language: en-US
To: Hiroki Narukawa <hnarukaw@yahoo-corp.jp>, qemu-devel@nongnu.org
References: <20220106082057.968-1-hnarukaw@yahoo-corp.jp>
 <20220106082057.968-2-hnarukaw@yahoo-corp.jp>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220106082057.968-2-hnarukaw@yahoo-corp.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: aoiwa@yahoo-corp.jp, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Stefan / Paolo.

On 6/1/22 09:20, Hiroki Narukawa wrote:
> Coroutine pool size was 64 from long ago, and the basis was organized in the commit message in c740ad92.
> 
> At that time, virtio-blk queue-size and num-queue were not configuable, and equivalent values were 128 and 1.
> 
> Coroutine pool size 64 was fine then.
> 
> Later queue-size and num-queue got configuable, and default values were increased.
> 
> Coroutine pool with size 64 exhausts frequently with random disk IO in new size, and slows down.
> 
> This commit adjusts coroutine pool size adaptively with new values.
> 
> This commit adds 64 by default, but now coroutine is not only for block devices,
> 
> and is not too much burdon comparing with new default.
> 
> pool size of 128 * vCPUs.
> 
> Signed-off-by: Hiroki Narukawa <hnarukaw@yahoo-corp.jp>
> ---
>   hw/block/virtio-blk.c    |  3 +++
>   include/qemu/coroutine.h |  5 +++++
>   util/qemu-coroutine.c    | 15 +++++++++++----
>   3 files changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> index f139cd7cc9..726dbe14de 100644
> --- a/hw/block/virtio-blk.c
> +++ b/hw/block/virtio-blk.c
> @@ -32,6 +32,7 @@
>   #include "hw/virtio/virtio-bus.h"
>   #include "migration/qemu-file-types.h"
>   #include "hw/virtio/virtio-access.h"
> +#include "qemu/coroutine.h"
>   
>   /* Config size before the discard support (hide associated config fields) */
>   #define VIRTIO_BLK_CFG_SIZE offsetof(struct virtio_blk_config, \
> @@ -1222,6 +1223,8 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
>       for (i = 0; i < conf->num_queues; i++) {
>           virtio_add_queue(vdev, conf->queue_size, virtio_blk_handle_output);
>       }
> +    qemu_coroutine_increase_pool_batch_size(conf->num_queues * conf->queue_size
> +                                            / 2);
>       virtio_blk_data_plane_create(vdev, conf, &s->dataplane, &err);
>       if (err != NULL) {
>           error_propagate(errp, err);
> diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
> index 4829ff373d..e52ed76ab2 100644
> --- a/include/qemu/coroutine.h
> +++ b/include/qemu/coroutine.h
> @@ -331,6 +331,11 @@ void qemu_co_sleep_wake(QemuCoSleep *w);
>    */
>   void coroutine_fn yield_until_fd_readable(int fd);
>   
> +/**
> + * Increase coroutine pool size
> + */
> +void qemu_coroutine_increase_pool_batch_size(unsigned int additional_pool_size);
> +
>   #include "qemu/lockable.h"
>   
>   #endif /* QEMU_COROUTINE_H */
> diff --git a/util/qemu-coroutine.c b/util/qemu-coroutine.c
> index 38fb6d3084..080a1e0126 100644
> --- a/util/qemu-coroutine.c
> +++ b/util/qemu-coroutine.c
> @@ -20,12 +20,14 @@
>   #include "qemu/coroutine_int.h"
>   #include "block/aio.h"
>   
> +/** Initial batch size is 64, and is increased on demand */
>   enum {
> -    POOL_BATCH_SIZE = 64,
> +    POOL_INITIAL_BATCH_SIZE = 64,
>   };
>   
>   /** Free list to speed up creation */
>   static QSLIST_HEAD(, Coroutine) release_pool = QSLIST_HEAD_INITIALIZER(pool);
> +static unsigned int pool_batch_size = POOL_INITIAL_BATCH_SIZE;
>   static unsigned int release_pool_size;
>   static __thread QSLIST_HEAD(, Coroutine) alloc_pool = QSLIST_HEAD_INITIALIZER(pool);
>   static __thread unsigned int alloc_pool_size;
> @@ -49,7 +51,7 @@ Coroutine *qemu_coroutine_create(CoroutineEntry *entry, void *opaque)
>       if (CONFIG_COROUTINE_POOL) {
>           co = QSLIST_FIRST(&alloc_pool);
>           if (!co) {
> -            if (release_pool_size > POOL_BATCH_SIZE) {
> +            if (release_pool_size > pool_batch_size) {
>                   /* Slow path; a good place to register the destructor, too.  */
>                   if (!coroutine_pool_cleanup_notifier.notify) {
>                       coroutine_pool_cleanup_notifier.notify = coroutine_pool_cleanup;
> @@ -86,12 +88,12 @@ static void coroutine_delete(Coroutine *co)
>       co->caller = NULL;
>   
>       if (CONFIG_COROUTINE_POOL) {
> -        if (release_pool_size < POOL_BATCH_SIZE * 2) {
> +        if (release_pool_size < pool_batch_size * 2) {
>               QSLIST_INSERT_HEAD_ATOMIC(&release_pool, co, pool_next);
>               qatomic_inc(&release_pool_size);
>               return;
>           }
> -        if (alloc_pool_size < POOL_BATCH_SIZE) {
> +        if (alloc_pool_size < pool_batch_size) {
>               QSLIST_INSERT_HEAD(&alloc_pool, co, pool_next);
>               alloc_pool_size++;
>               return;
> @@ -202,3 +204,8 @@ AioContext *coroutine_fn qemu_coroutine_get_aio_context(Coroutine *co)
>   {
>       return co->ctx;
>   }
> +
> +void qemu_coroutine_increase_pool_batch_size(unsigned int additional_pool_size)
> +{
> +    qatomic_add(&pool_batch_size, additional_pool_size);
> +}


