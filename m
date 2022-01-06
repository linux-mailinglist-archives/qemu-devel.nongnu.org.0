Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63106485CF8
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 01:12:37 +0100 (CET)
Received: from localhost ([::1]:46928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5GOR-0007KF-UG
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 19:12:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5GNR-0006Ss-JE; Wed, 05 Jan 2022 19:11:33 -0500
Received: from [2607:f8b0:4864:20::635] (port=38736
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5GNP-0006mA-MV; Wed, 05 Jan 2022 19:11:33 -0500
Received: by mail-pl1-x635.google.com with SMTP id c3so916036pls.5;
 Wed, 05 Jan 2022 16:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JMe2nxqegEVujllqHoEalDyViUQfVCgRqA7Md8LAjWE=;
 b=S5tOti/NG+rtjPUi7tTNVBE2nBVVtTaePwPAvm8g+4vSvT7RnqNKSx8CMvBqItcoUS
 Zg+oodtqkNTGAjr4zYWwbRHrdvrPs2uzaz1JC5gY4BoTkdERg6cmGRiHQJnICpUvQJPc
 HFFdpnlCx518DCdIcyeYGX6maLC8smYNgOfju2MOfVpK2SIrqfVryKtJIOZIgdW8Yoka
 MpG50b9is8F2VlOP0w02DIfUicqn+aDTqGUE79JV+172bIqQpGDjSUHsiTu2tO+pk0MR
 dCLUZwMDfc2AF2171XetYOA4Lhg7WtZ3nGFPgLBa3p3s3GGfD3ZB7a6YkssFOz0/NOnM
 1/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JMe2nxqegEVujllqHoEalDyViUQfVCgRqA7Md8LAjWE=;
 b=XgZ72l7C0tLRgoHQrdzCPKtIPyjc0Cx49F8RyIZsNP5Q/+yT0/o0/o7Azb5HGhv+CC
 pJtGRGaKPUOsRqOcxqKM+6uGRQ8BXRqClbjOhDu0IsubF9WRvaqCCJ0gRgO5vkQl/P6j
 XKX3hRG3qxJ3+RnjJx26IjmwhrSUYfvtI2aKMsESeKNE8rxjQxL0dkTokih6e//YusCT
 vUjiy/LArGZOipbRC+SlcfMxV6nRoCRR4aqMXBbSVt77LXb0CVvd/Fqg1Q2g29AxVD/q
 8cvczSVRK5qF6yyPvXZwuLCXqAIx2EtEBW/nu6f7hGZ/o8dlo5Eys5g3GNQY5gUFjIKC
 bqsg==
X-Gm-Message-State: AOAM532A8l3nFRzCk3/3veIlHJa3/PtzzDAYXUT3pZfoaqmvddEIKub1
 qKIQDhwvEGbBBMi/NrTW4TA=
X-Google-Smtp-Source: ABdhPJx9g+SqkxTkMhoFUFwXzOPOyso6N8GpMJXVlxFYpd66CWh3hB7vNdUEOR0QahhE+qJYKmYnTQ==
X-Received: by 2002:a17:903:1c7:b0:149:7cab:6d7f with SMTP id
 e7-20020a17090301c700b001497cab6d7fmr44955586plh.101.1641427889706; 
 Wed, 05 Jan 2022 16:11:29 -0800 (PST)
Received: from [192.168.1.33] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id mw8sm123180pjb.42.2022.01.05.16.11.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 16:11:29 -0800 (PST)
Message-ID: <428615ed-de30-4859-76c7-ab310c4fcf76@amsat.org>
Date: Thu, 6 Jan 2022 01:11:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH] ide: Explicitly poll for BHs on cancel
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20220105111337.10366-1-hreitz@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220105111337.10366-1-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.057,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Mark for macio which seems to have the same issue.

On 5/1/22 12:13, Hanna Reitz wrote:
> When we still have an AIOCB registered for DMA operations, we try to
> settle the respective operation by draining the BlockBackend associated
> with the IDE device.
> 
> However, this assumes that every DMA operation is associated with some
> I/O operation on the BlockBackend, and so settling the latter will
> settle the former.  That is not the case; for example, the guest is free
> to issue a zero-length TRIM operation that will not result in any I/O
> operation forwarded to the BlockBackend.  In such a case, blk_drain()
> will be a no-op if no other operations are in flight.
> 
> It is clear that if blk_drain() is a no-op, the value of
> s->bus->dma->aiocb will not change between checking it in the `if`
> condition and asserting that it is NULL after blk_drain().
> 
> To settle the DMA operation, we will thus need to explicitly invoke
> aio_poll() ourselves, which will run any outstanding BHs (like
> ide_trim_bh_cb()), until s->bus->dma->aiocb is NULL.  To stop this from
> being an infinite loop, assert that we made progress with every
> aio_poll() call (i.e., invoked some BH).
> 
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2029980
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
> Perhaps for a lack of being aware of all the kinds of tests we have, I
> found it impossible to write a reproducer in any of our current test
> frameworks: From how I understand the issue, to reproduce it, you need
> to issue a TRIM request and immediately cancel it, before
> ide_trim_bh_cb() (scheduled as a BH) can run.
> 
> I wanted to do this via qtest, but that does not work, because every
> port I/O operation is done via a qtest command, and QEMU will happily
> poll the main context between each qtest command, which means that you
> cannot cancel an ongoing IDE request before a BH scheduled by it is run.
> 
> Therefore, I wrote an x86 boot sector that sets up a no-op TRIM request
> (i.e. one where all TRIM ranges have length 0) and immediately cancels
> it by setting SRST.  It is attached to the BZ linked above, and can be
> tested as follows:
> 
> $ TEST_BIN=test.bin
> $ (sleep 1; echo 'info registers'; echo quit) \
>      | ./qemu-system-x86_64 \
>          -drive if=ide,file=$TEST_BIN,format=raw \
>          -monitor stdio \
>      | grep EIP= \
>      | sed -e 's/ EFL.*//'
> 
> The result should be:
> EIP=00007c72
> 
> Not:
> qemu-system-x86_64: ../hw/ide/core.c:734: ide_cancel_dma_sync: Assertion
> `s->bus->dma->aiocb == NULL' failed.
> ---
>   hw/ide/core.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/ide/core.c b/hw/ide/core.c
> index e28f8aad61..c7f7a1016c 100644
> --- a/hw/ide/core.c
> +++ b/hw/ide/core.c
> @@ -731,7 +731,17 @@ void ide_cancel_dma_sync(IDEState *s)
>       if (s->bus->dma->aiocb) {
>           trace_ide_cancel_dma_sync_remaining();
>           blk_drain(s->blk);
> -        assert(s->bus->dma->aiocb == NULL);
> +
> +        /*
> +         * Wait for potentially still-scheduled BHs, like ide_trim_bh_cb()
> +         * (blk_drain() will only poll if there are in-flight requests on the
> +         * BlockBackend, which there may not necessarily be, e.g. when the
> +         * guest has issued a zero-length TRIM request)
> +         */
> +        while (s->bus->dma->aiocb) {
> +            bool progress = aio_poll(qemu_get_aio_context(), true);
> +            assert(progress);
> +        }
>       }
>   }
>   


