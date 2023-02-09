Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAD7690DF4
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 17:07:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ9Rj-0004nH-0K; Thu, 09 Feb 2023 11:06:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQ9Re-0004mF-GB
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 11:06:46 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQ9Rc-000080-Rc
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 11:06:46 -0500
Received: by mail-wr1-x434.google.com with SMTP id j23so2327442wra.0
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 08:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Wdtizu36a5eXn34BesiDt7CtJbbQT6ym+8eOV1CvoK0=;
 b=gvL0IfS7pPsWvrbwkBWDf+lDuRjoAxxfvUmNotGnzFd4c+mglYQpKbk3pOMYn93biY
 +BU5MLYwXEy/ydJNW/rGyYsgDvqY27LEPbXP+ukJ3oR3cG5W6uDA8DptfOH2phAGV+dw
 uSr9nXp/f81106IOe4+kOKGvnySdafbOOuO7nMLyEhTSw0JzGCPDeB4eka8SJVhqZga9
 3rQxCcJKFCkCkDjf+Nza7nFUArDBXo0jKUtdMNTHbmmy87Y+V1nMH4t7BDXK1HTpahKg
 eVR50lBBW0sCSJaY/uF+lbBGu5QmWKf+aqXd9EQi4oEma0CgIhEYJfw9MiYdjt74J+u8
 uT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wdtizu36a5eXn34BesiDt7CtJbbQT6ym+8eOV1CvoK0=;
 b=qPd9efB3/S8pW6q/XNdvsHJMYWlCjn+GlNpyse6LqnUFZyI5lweM+zQCPlu0JG1kDA
 VDNvoXptE/bR8J91TVq12wrvFR0dSFCh2ll/DGyBqhdJUVEfidgAx1ooLdqv4yuXoIp0
 3cOAc0400BqzUTXVAsXObXxQwwKuZg5OP6zFo5efaoKgmQg72ezictYPHEMtsDJUtcnM
 gpPyLhUnKgy2TYsyWARh4/yIHYChr2TtqHgF+L/Fd5e4wREcCznx3xLcTREo2QPgCXSQ
 KRnRQ603EozemkNQgNmAducS3p/QNBcdfSL1QeyEKHKtk3pbnAyOoId192y90/Fin62w
 Boyw==
X-Gm-Message-State: AO0yUKUrr1mFIYOKtmjphrKg9D6k2vDTNyzr/vQJKhSBvT8hdSjDj1Ij
 Wc+cOp+DZICuJfzq//Xt8Fh5tw==
X-Google-Smtp-Source: AK7set+XcjmD0BOEyEvgJ3XTdXZ3zZwJRDr2wKAgjrkoOFJdLKMZWWJBfb7xR5WCkpH9PaWImWqU2Q==
X-Received: by 2002:a5d:5231:0:b0:2c3:da8a:192 with SMTP id
 i17-20020a5d5231000000b002c3da8a0192mr12185614wra.15.1675958803129; 
 Thu, 09 Feb 2023 08:06:43 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o26-20020a5d58da000000b002c3f1223059sm1583248wrf.36.2023.02.09.08.06.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 08:06:42 -0800 (PST)
Message-ID: <9ad7b26e-009f-61d3-f453-2fe982af3fbe@linaro.org>
Date: Thu, 9 Feb 2023 17:06:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH] block/file-posix: don't use functions calling
 AIO_WAIT_WHILE in worker threads
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Ninad Palsule <ninad@linux.vnet.ibm.com>, qemu-devel@nongnu.org
References: <20230209154522.1164401-1-eesposit@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230209154522.1164401-1-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 9/2/23 16:45, Emanuele Giuseppe Esposito wrote:
> When calling bdrv_getlength() in handle_aiocb_write_zeroes(), the
> function creates a new coroutine and then waits that it finishes using
> AIO_WAIT_WHILE.
> The problem is that this function could also run in a worker thread,
> that has a different AioContext from main loop and iothreads, therefore
> in AIO_WAIT_WHILE we will have in_aio_context_home_thread(ctx) == false
> and therefore
> assert(qemu_get_current_aio_context() == qemu_get_aio_context());
> in the else branch will fail, crashing QEMU.
> 
> Aside from that, bdrv_getlength() is wrong also conceptually, because
> it reads the BDS graph from another thread and is not protected by
> any lock.
> 
> Replace it with raw_co_getlength, that doesn't create a coroutine and
> doesn't read the BDS graph.

Reported-by: Ninad Palsule <ninad@linux.vnet.ibm.com>
Suggested-by: Kevin Wolf <kwolf@redhat.com>

> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block/file-posix.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index d3073a7caa..9a99111f45 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1738,7 +1738,7 @@ static int handle_aiocb_write_zeroes(void *opaque)
>   #ifdef CONFIG_FALLOCATE
>       /* Last resort: we are trying to extend the file with zeroed data. This
>        * can be done via fallocate(fd, 0) */
> -    len = bdrv_getlength(aiocb->bs);
> +    len = raw_co_getlength(aiocb->bs);
>       if (s->has_fallocate && len >= 0 && aiocb->aio_offset >= len) {
>           int ret = do_fallocate(s->fd, 0, aiocb->aio_offset, aiocb->aio_nbytes);
>           if (ret == 0 || ret != -ENOTSUP) {


