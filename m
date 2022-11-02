Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6150616F98
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 22:22:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqLB6-0006aF-PK; Wed, 02 Nov 2022 17:21:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oqLB3-0006Zx-WA
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 17:21:38 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oqLB0-0000j7-Sf
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 17:21:36 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so1823wmb.0
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 14:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+QvClqVOPUaeQIZ/WpQ7WnTHntbGKw4UoMAHPguRrOs=;
 b=DsMj3bF1ojkJ68D6NZ+iDYl3X3gxXzRyYsR2iojmeelo2jmTcDEVFDt+0eGy9NItt9
 r9owRi6EaqrJ85fUeCgxt/XthW3PikUp1wkGEf2v/xhjtYL+RbN9SlxqEps9kWxiD6vn
 VhNvWH3owxPil/baL9aOJOp6Za3zvb/Bcj5cLihIo5CiMo9PInZibcSaSbwixVJWSnHD
 4+RRmPL9v9fv0ntFlzaWhEV7rGHGuWxGd10f5JHlUSHccyyaQBlfcWNbGCDk98rWjZxB
 qCFxeZNncroQFHC1zTNa0O4qqK3520Qca8K7o+W/4ZoLXsZXbeUNo/o9LfOI+uT5l/7y
 fmag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+QvClqVOPUaeQIZ/WpQ7WnTHntbGKw4UoMAHPguRrOs=;
 b=AFn4+rlFhABlJ+V2eupoZBo9qlzx3pDvqNIH5D5Pp/QB3TORbgpVM598nWL2eICjFO
 7Owiou9mrtfiGPQG479PuoHNHubT9TrxHI6b4TvljA5W1uP1JjWumfn8qh+pGaP37PFu
 gRuaDEoblCdLcKrGGP0eXCpcnSFL1xYg5ec1oySl3u5H+TZkWb3E8FDe4xoIjtfSF3SZ
 8XkKqztxk4pSATbsp8ZrqbIfV1vwHGPbF3ck1nSrO3npvqq+JxryGusafE/+zopgvozx
 AmiZOh7YRyU2Een04QFgkx8mBLIa40Ust9rvzldWmDIKYbezunMmRR4lxcju3Ed0KF/l
 XMFA==
X-Gm-Message-State: ACrzQf2FeGxvisEZVMByjaoc3lYeNNdqIV8i66jMnQQ8EfWP3KA7/1qs
 poB4k8BBwBUNA52QDpPJ8tQyeg==
X-Google-Smtp-Source: AMsMyM6EldCySKueW4t+dYWlXZjmO3N3IQnsnnymP4snSl9AZZ1qALsNyOSSMgmaVqdOUGs/1mHCyQ==
X-Received: by 2002:a05:600c:3414:b0:3cf:670e:53a4 with SMTP id
 y20-20020a05600c341400b003cf670e53a4mr16386522wmp.39.1667424091994; 
 Wed, 02 Nov 2022 14:21:31 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j39-20020a05600c48a700b003b95ed78275sm2975474wmp.20.2022.11.02.14.21.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 14:21:30 -0700 (PDT)
Message-ID: <ef061624-f599-3020-50aa-57b8e049daa9@linaro.org>
Date: Wed, 2 Nov 2022 22:21:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [RFC v4 3/3] virtio-blk: add some trace events for zoned emulation
To: Sam Li <faithilikerun@gmail.com>, qemu-devel@nongnu.org
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>, stefanha@redhat.com,
 damien.lemoal@opensource.wdc.com, "Michael S. Tsirkin" <mst@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, hare@suse.de, Hanna Reitz
 <hreitz@redhat.com>, qemu-block@nongnu.org, dmitry.fomichev@wdc.com
References: <20221030093242.208839-1-faithilikerun@gmail.com>
 <20221030093242.208839-4-faithilikerun@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221030093242.208839-4-faithilikerun@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

On 30/10/22 10:32, Sam Li wrote:
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>   hw/block/trace-events |  7 +++++++
>   hw/block/virtio-blk.c | 12 ++++++++++++
>   2 files changed, 19 insertions(+)
> 
> diff --git a/hw/block/trace-events b/hw/block/trace-events
> index 2c45a62bd5..f47da6fcd4 100644
> --- a/hw/block/trace-events
> +++ b/hw/block/trace-events
> @@ -44,9 +44,16 @@ pflash_write_unknown(const char *name, uint8_t cmd) "%s: unknown command 0x%02x"
>   # virtio-blk.c
>   virtio_blk_req_complete(void *vdev, void *req, int status) "vdev %p req %p status %d"
>   virtio_blk_rw_complete(void *vdev, void *req, int ret) "vdev %p req %p ret %d"
> +virtio_blk_zone_report_complete(void *vdev, void *req, unsigned int nr_zones, int ret) "vdev %p req %p nr_zones %d ret %d"

" ... nr_zones %u ..."

> +virtio_blk_zone_mgmt_complete(void *vdev, void *req, int ret) "vdev %p req %p ret %d"
> +virtio_blk_zone_append_complete(void *vdev, void *req, int64_t sector, int ret) "vdev %p req %p, append sector 0x%" PRIx64 " ret %d"
>   virtio_blk_handle_write(void *vdev, void *req, uint64_t sector, size_t nsectors) "vdev %p req %p sector %"PRIu64" nsectors %zu"
>   virtio_blk_handle_read(void *vdev, void *req, uint64_t sector, size_t nsectors) "vdev %p req %p sector %"PRIu64" nsectors %zu"
>   virtio_blk_submit_multireq(void *vdev, void *mrb, int start, int num_reqs, uint64_t offset, size_t size, bool is_write) "vdev %p mrb %p start %d num_reqs %d offset %"PRIu64" size %zu is_write %d"

" ... is_write %u"

> +virtio_blk_handle_zone_report(void *vdev, void *req, int64_t sector, unsigned int nr_zones) "vdev %p req %p sector 0x%" PRIx64 " nr_zones %d"

" ... nr_zones %u"

> +virtio_blk_handle_zone_mgmt(void *vdev, void *req, uint8_t op, int64_t sector, int64_t len) "vdev %p req %p op 0x%x sector 0x%" PRIx64 " len 0x%" PRIx64 ""
> +virtio_blk_handle_zone_reset_all(void *vdev, void *req, int64_t sector, int64_t len) "vdev %p req %p sector 0x%" PRIx64 " cap 0x%" PRIx64 ""
> +virtio_blk_handle_zone_append(void *vdev, void *req, int64_t sector) "vdev %p req %p, append sector 0x%" PRIx64 ""

You can probably drop the trailing "".

Regards,

Phil.

