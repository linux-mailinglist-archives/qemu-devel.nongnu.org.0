Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8736ECA64
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 12:34:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqtVA-0007gV-My; Mon, 24 Apr 2023 06:32:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pqtV7-0007g8-O0
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 06:32:53 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pqtUy-0002yJ-SX
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 06:32:53 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f1e2555b5aso8296485e9.0
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 03:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682332363; x=1684924363;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HekhlNECns07R44Z9K5TIYVtdNSMvGMR7D7aXuLTW4w=;
 b=KqZvlooGqzPbFnYyoDT9FR0u1PhaTgbn10imLe1nJE+SRYop93wiiDtVO/ojxVwXND
 wYjg/iNbNfOxJobCSTYOX+yOxRdzaYbFnTQvB5hk9qI/MxAle4JMicOwxCgOjABOX0K1
 tzn/rTk6Row7ti33PB193CSA1cFJajtI4NXNYCLmX1Dq1BXyYNWQRxeOQhtr0fNAI230
 lB6HU89tg4MuAM0LxgLshhaLgF5xWVdfIkBebwjg1cJ1tkhNvZ9+MzgD36LcXmOzer3m
 A3/KCRvhNJNALRLc/vZnP/4LbU2lalgM8BSjIPMws/AF+35MLA3GerCfppzA5nN2mYEU
 nqxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682332363; x=1684924363;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HekhlNECns07R44Z9K5TIYVtdNSMvGMR7D7aXuLTW4w=;
 b=cYf4LehNMty/K35ah0EjnrMmC8YuKgF8Uh3ef0wrjvh8p0nIo6QpVGIMUoMSUzoqG2
 5FMjmmj/gQEvbfvQ6evvlBBp+jpVy2RhAbmkiOdDagnQNpiEqwTM4887uMhMtF+XQMzG
 2Cc8Ur0vs0rXnYThMAhRBxfV2FG1oT/vAEPPZ4cf0q+A/5k+ttc4MtmJ54n1zygrSOzI
 ybjpQrbktHrMKTZTe5s7rAabhdnqNiJqrN6o4BK7mzA6pTJu9sej1IV/BjVHFfjEIq6y
 1ryAEa+hLtv2fX0RylvR0TGlvoOCD/zt2ofszgWtrVZN90meghNyZsPu7OS82hPQBb4B
 KUAA==
X-Gm-Message-State: AAQBX9cWTw01xr+EQyidD8bmyAWYZNIUug6VIMOcj8WtDR3Yd6z63X7P
 +PqClGuI2p+dyrzoAsPgmQM=
X-Google-Smtp-Source: AKy350aHtxscROpY+5mNq4W2uKR9Is2yVrdGfKhbjlxYoDFPfS5Ov6f3mTC72TrqfIGT+sUwMQsshQ==
X-Received: by 2002:a7b:cb8a:0:b0:3ee:1acd:b039 with SMTP id
 m10-20020a7bcb8a000000b003ee1acdb039mr7454121wmi.34.1682332362824; 
 Mon, 24 Apr 2023 03:32:42 -0700 (PDT)
Received: from [192.168.22.129] (54-240-197-234.amazon.com. [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a05600c4f0200b003ee74c25f12sm15346187wmq.35.2023.04.24.03.32.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 03:32:42 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <54a37172-cad5-3b27-36fc-3b7768e39df8@xen.org>
Date: Mon, 24 Apr 2023 11:32:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 RESEND] xen: Fix SEGV on domain disconnect
Content-Language: en-US
To: mark.syms@citrix.com, qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230420110205.688689-1-mark.syms@citrix.com>
Organization: Xen Project
In-Reply-To: <20230420110205.688689-1-mark.syms@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-2.143, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 20/04/2023 12:02, mark.syms@citrix.com wrote:
> From: Mark Syms <mark.syms@citrix.com>
> 
> Ensure the PV ring is drained on disconnect. Also ensure all pending
> AIO is complete, otherwise AIO tries to complete into a mapping of the
> ring which has been torn down.
> 
> Signed-off-by: Mark Syms <mark.syms@citrix.com>
> ---
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Anthony Perard <anthony.perard@citrix.com>
> CC: Paul Durrant <paul@xen.org>
> CC: xen-devel@lists.xenproject.org
> 
> v2:
>   * Ensure all inflight requests are completed before teardown
>   * RESEND to fix formatting
> ---
>   hw/block/dataplane/xen-block.c | 31 +++++++++++++++++++++++++------
>   1 file changed, 25 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/block/dataplane/xen-block.c b/hw/block/dataplane/xen-block.c
> index 734da42ea7..d9da4090bf 100644
> --- a/hw/block/dataplane/xen-block.c
> +++ b/hw/block/dataplane/xen-block.c
> @@ -523,6 +523,10 @@ static bool xen_block_handle_requests(XenBlockDataPlane *dataplane)
>   
>       dataplane->more_work = 0;
>   
> +    if (dataplane->sring == 0) {
> +        return done_something;
> +    }
> +

I think you could just return false here... Nothing is ever going to be 
done if there's no ring :-)

>       rc = dataplane->rings.common.req_cons;
>       rp = dataplane->rings.common.sring->req_prod;
>       xen_rmb(); /* Ensure we see queued requests up to 'rp'. */
> @@ -666,14 +670,35 @@ void xen_block_dataplane_destroy(XenBlockDataPlane *dataplane >   void xen_block_dataplane_stop(XenBlockDataPlane *dataplane)
>   {
>       XenDevice *xendev;
> +    XenBlockRequest *request, *next;
>   
>       if (!dataplane) {
>           return;
>       }
>   
> +    /* We're about to drain the ring. We can cancel the scheduling of any
> +     * bottom half now */
> +    qemu_bh_cancel(dataplane->bh);
> +
> +    /* Ensure we have drained the ring */
> +    aio_context_acquire(dataplane->ctx);
> +    do {
> +        xen_block_handle_requests(dataplane);
> +    } while (dataplane->more_work);
> +    aio_context_release(dataplane->ctx);
> +

I don't think we want to be taking new requests, do we?

> +    /* Now ensure that all inflight requests are complete */
> +    while (!QLIST_EMPTY(&dataplane->inflight)) {
> +        QLIST_FOREACH_SAFE(request, &dataplane->inflight, list, next) {
> +            blk_aio_flush(request->dataplane->blk, xen_block_complete_aio,
> +                        request);
> +        }
> +    }
> +

I think this could possibly be simplified by doing the drain after the 
call to blk_set_aio_context(), as long as we set dataplane->ctx to 
qemu_get_aio_context(). Alos, as long as more_work is not set then it 
should still be safe to cancel the bh before the drain AFAICT.

   Paul

>       xendev = dataplane->xendev;
>   
>       aio_context_acquire(dataplane->ctx);
> +
>       if (dataplane->event_channel) {
>           /* Only reason for failure is a NULL channel */
>           xen_device_set_event_channel_context(xendev, dataplane->event_channel,
> @@ -684,12 +709,6 @@ void xen_block_dataplane_stop(XenBlockDataPlane *dataplane)
>       blk_set_aio_context(dataplane->blk, qemu_get_aio_context(), &error_abort);
>       aio_context_release(dataplane->ctx);
>   
> -    /*
> -     * Now that the context has been moved onto the main thread, cancel
> -     * further processing.
> -     */
> -    qemu_bh_cancel(dataplane->bh);
> -
>       if (dataplane->event_channel) {
>           Error *local_err = NULL;
>   


