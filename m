Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AD83673C2
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 21:51:07 +0200 (CEST)
Received: from localhost ([::1]:56800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZIsL-0004T6-Jr
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 15:51:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lZIpU-0003ht-5k
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 15:48:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lZIpS-0003ZB-9u
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 15:48:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619034485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DkqgsQ8q6tksv3wCcokpAQp6UIY/WRcvhYTGH/tQbfc=;
 b=YeYXDHVZ1pYYFAFLbM1YmD5jNYxSPdKgMukvM+01GWr75vThjnZk5cj9UxYfHy302I7OT8
 y0o2fOoQwOML3pRSkNF9dM7HU9rHg1RbvBQlj7sbR0Eq1vXrfoknazcmNniu0utEPvsrBN
 6LtqO2uAMMDaKvxClwMayEKJwYb7Guk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-eH6rZd2tMxStvWELeVdrhw-1; Wed, 21 Apr 2021 15:47:59 -0400
X-MC-Unique: eH6rZd2tMxStvWELeVdrhw-1
Received: by mail-ej1-f69.google.com with SMTP id
 i10-20020a1709067a4ab029037c5dba8400so6349434ejo.8
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 12:47:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DkqgsQ8q6tksv3wCcokpAQp6UIY/WRcvhYTGH/tQbfc=;
 b=cSX3Jk1C/0Xqc9OJiMqF1/D7b0bwdvktOTMnagiCU5R+IO8etBUH9mewR84qNkjN5y
 QFOYyVpkSi7WWAPQFPV0qvcWohWXW25jsXB+ub9QHLELEQdq2smG2O6QvbfiRRGkkNQr
 l3ytQrPlo5QCooKfZFrqqHzEjm/99FT36/uqBJ0D8mIrGoMQDes5DSVMJeUflrtOh6kS
 cY5sMHfVMfbLrt/KqEn1CNbAKuBXAKNl4QjrFBN9c9KRhnnnyt1lpxfsoH2YSBGT9aW7
 YpVe+FPGEGRlFxJEO1rcrK9S/f8NtyPBcWAEwKd8xSmrN3ps2LuaSjABAlnFK/KW2mAW
 /zDw==
X-Gm-Message-State: AOAM533Eug67mAvmNAVOj7JLRtIqt3FZoHhoxSzN00+klt/YWXBvA+c1
 LB6I5aLGm0ZcJbA7hICbk2DdeusmXmvAGp+ep7Cv+GpO2KaJrvXo/yeUsAMX7caNf1KgCje8qk7
 glBLm2Gx036rSBSQ=
X-Received: by 2002:a05:6402:382:: with SMTP id
 o2mr34126469edv.370.1619034477745; 
 Wed, 21 Apr 2021 12:47:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydD4BvtkAcclqBGsRIPzJW66LBx+leycWFK8yNnIZAcshYyrtQQtFNMKpfk6rMbF3kvNxVtA==
X-Received: by 2002:a05:6402:382:: with SMTP id
 o2mr34126439edv.370.1619034477423; 
 Wed, 21 Apr 2021 12:47:57 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id e11sm311556ejn.100.2021.04.21.12.47.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Apr 2021 12:47:56 -0700 (PDT)
Subject: Re: [PATCH] monitor: hmp_qemu_io: acquire aio contex, fix crash
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210421083222.72600-1-vsementsov@virtuozzo.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ede4a3b9-95f2-f8ae-6587-87542325efe5@redhat.com>
Date: Wed, 21 Apr 2021 21:47:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210421083222.72600-1-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/21/21 10:32 AM, Vladimir Sementsov-Ogievskiy wrote:
> Max reported the following bug:
> 
> $ ./qemu-img create -f raw src.img 1G
> $ ./qemu-img create -f raw dst.img 1G
> 
> $ (echo '
>    {"execute":"qmp_capabilities"}
>    {"execute":"blockdev-mirror",
>     "arguments":{"job-id":"mirror",
>                  "device":"source",
>                  "target":"target",
>                  "sync":"full",
>                  "filter-node-name":"mirror-top"}}
> '; sleep 3; echo '
>    {"execute":"human-monitor-command",
>     "arguments":{"command-line":
>                  "qemu-io mirror-top \"write 0 1G\""}}') \
> | x86_64-softmmu/qemu-system-x86_64 \
>    -qmp stdio \
>    -blockdev file,node-name=source,filename=src.img \
>    -blockdev file,node-name=target,filename=dst.img \
>    -object iothread,id=iothr0 \
>    -device virtio-blk,drive=source,iothread=iothr0
> 
> crashes:
> 
> 0  raise () at /usr/lib/libc.so.6
> 1  abort () at /usr/lib/libc.so.6
> 2  error_exit
>    (err=<optimized out>,
>    msg=msg@entry=0x55fbb1634790 <__func__.27> "qemu_mutex_unlock_impl")
>    at ../util/qemu-thread-posix.c:37
> 3  qemu_mutex_unlock_impl
>    (mutex=mutex@entry=0x55fbb25ab6e0,
>    file=file@entry=0x55fbb1636957 "../util/async.c",
>    line=line@entry=650)
>    at ../util/qemu-thread-posix.c:109
> 4  aio_context_release (ctx=ctx@entry=0x55fbb25ab680) at ../util/async.c:650
> 5  bdrv_do_drained_begin
>    (bs=bs@entry=0x55fbb3a87000, recursive=recursive@entry=false,
>    parent=parent@entry=0x0,
>    ignore_bds_parents=ignore_bds_parents@entry=false,
>    poll=poll@entry=true) at ../block/io.c:441
> 6  bdrv_do_drained_begin
>    (poll=true, ignore_bds_parents=false, parent=0x0, recursive=false,
>    bs=0x55fbb3a87000) at ../block/io.c:448
> 7  blk_drain (blk=0x55fbb26c5a00) at ../block/block-backend.c:1718
> 8  blk_unref (blk=0x55fbb26c5a00) at ../block/block-backend.c:498
> 9  blk_unref (blk=0x55fbb26c5a00) at ../block/block-backend.c:491
> 10 hmp_qemu_io (mon=0x7fffaf3fc7d0, qdict=<optimized out>)
>    at ../block/monitor/block-hmp-cmds.c:628
> 
> man pthread_mutex_unlock
> ...
>     EPERM  The  mutex type is PTHREAD_MUTEX_ERRORCHECK or
>     PTHREAD_MUTEX_RECURSIVE, or the mutex is a robust mutex, and the
>     current thread does not own the mutex.
> 
> So, thread doesn't own the mutex. And we have iothread here.
> 
> Next, note that AIO_WAIT_WHILE() documents that ctx must be acquired
> exactly once by caller. But where is it acquired in the call stack?
> Seems nowhere.
> 
> qemuio_command do acquire aio context.. But we need context acquired
> around blk_unref as well. Let's do it.
> 
> Reported-by: Max Reitz <mreitz@redhat.com>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/monitor/block-hmp-cmds.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cmds.c
> index ebf1033f31..934100d0eb 100644
> --- a/block/monitor/block-hmp-cmds.c
> +++ b/block/monitor/block-hmp-cmds.c
> @@ -559,6 +559,7 @@ void hmp_qemu_io(Monitor *mon, const QDict *qdict)
>  {
>      BlockBackend *blk;
>      BlockBackend *local_blk = NULL;
> +    AioContext *ctx;
>      bool qdev = qdict_get_try_bool(qdict, "qdev", false);
>      const char *device = qdict_get_str(qdict, "device");
>      const char *command = qdict_get_str(qdict, "command");
> @@ -615,7 +616,13 @@ void hmp_qemu_io(Monitor *mon, const QDict *qdict)
>      qemuio_command(blk, command);
>  
>  fail:
> +    ctx = blk_get_aio_context(blk);
> +    aio_context_acquire(ctx);
> +
>      blk_unref(local_blk);
> +
> +    aio_context_release(ctx);

I dare to mention "code smell" here... Not to your fix, but to
the API. Can't we simplify it somehow? Maybe we can't, I don't
understand it well. But it seems bug prone, and expensive in
human brain resources (either develop, debug or review).

>      hmp_handle_error(mon, err);
>  }
>  
> 


