Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FA3632FC0
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 23:24:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxFBf-00063Q-AB; Mon, 21 Nov 2022 17:22:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxFBZ-0005y7-Ka
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 17:22:43 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxFBV-00014f-UF
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 17:22:41 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 84-20020a1c0257000000b003cfe48519a6so7640803wmc.0
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 14:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=A2j3GmXuI9XKAIWRsHodPvBvsO03adz3Gz2KpYT2070=;
 b=j7tB85iClHpVb6MXAyKxLf7jaC7Am0xNiJjLaSHtT7Pvg6xoRmDwnM+z5fi4CtlXeF
 tBiFqia6SR+8J61r2hb+h37JEsd5yIXg/uEflJdumwr3D2vfRu900TMIXsYnXA7STaAe
 NpmmJ/oraXmQTUyH3x7FTWy+zdjWV+VpT5hBkw/94aVZkbZgbZ/JWcZYuhYxN+xbE4gJ
 swM9+zz1UayVuEOZJ5pfOAqRVURh0jb2pJ0klwqyjV0dFtnWPUndRJgoPjkT/Fc15yss
 bI4N9YrS1jwOHy8DTaU4KE6fN24hLkQq046Bv7+IZzFa1n8fZ6LvlNk+aQjPOHJrwlxb
 gjyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A2j3GmXuI9XKAIWRsHodPvBvsO03adz3Gz2KpYT2070=;
 b=d50AKV+RmCl7MhX9GZH3rby2ymOCqnc8VkGQvho2ZLXzf71kcY3vrQKICby5EqsyOD
 wLAV3yYVEYL525EISu1aUwPpwmaXdf4p4G0XYhe2pvhGkG3p/GK+TUBrd8Bq6eW40K3Y
 aNVYXvLuCzLE40cNp5vQQsCnXkPq6AtWVe6acy1a7bOeLe10T/pKSPVkAQQ92bamB8LO
 9OU7CNdnHh47Y1UUGjuZxnznfXDYgqi8DLr0aXtCAXrWcVBmOyT+YrJkgFTvunVXiCsE
 +wijCMHba56WJwGWwhYpXv66mcLe+5XWcHsQTO4Ex60MKCTUlsITLPChA7NjRULDkDLX
 Q1Mw==
X-Gm-Message-State: ANoB5pldTTFlI2yR91oPgqzMh+CTYvR4GBFy/fiffQUBiZV3Xt22HZlQ
 lafm1yHkRBQgGz/RI7/b+umNyQ==
X-Google-Smtp-Source: AA0mqf7BFDbAFIzXFf9V8TXl6qfr29VKWGjZxfmxdtBa64V570SLPXHSzMpCLtmxGNzACg+9FGk5uA==
X-Received: by 2002:a05:600c:21d2:b0:3cf:b2b1:3c7 with SMTP id
 x18-20020a05600c21d200b003cfb2b103c7mr1062704wmj.176.1669069354899; 
 Mon, 21 Nov 2022 14:22:34 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h3-20020a05600c2ca300b003b49bd61b19sm19826566wmc.15.2022.11.21.14.22.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 14:22:34 -0800 (PST)
Message-ID: <18e94ec0-6f79-8e7b-8a97-6d1824f83033@linaro.org>
Date: Mon, 21 Nov 2022 23:22:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-7.2] block-backend: avoid bdrv_unregister_buf() NULL
 pointer deref
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20221121211923.1993171-1-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221121211923.1993171-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 21/11/22 22:19, Stefan Hajnoczi wrote:
> bdrv_*() APIs expect a valid BlockDriverState. Calling them with bs=NULL
> leads to undefined behavior.
> 
> Jonathan Cameron reported this following NULL pointer dereference when a
> VM with a virtio-blk device and a memory-backend-file object is
> terminated:
> 1. qemu_cleanup() closes all drives, setting blk->root to NULL
> 2. qemu_cleanup() calls user_creatable_cleanup(), which results in a RAM
>     block notifier callback because the memory-backend-file is destroyed.
> 3. blk_unregister_buf() is called by virtio-blk's BlockRamRegistrar
>     notifier callback and undefined behavior occurs.
> 
> Fixes: baf422684d73 ("virtio-blk: use BDRV_REQ_REGISTERED_BUF optimization hint")
> Co-authored-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   block/block-backend.c | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


