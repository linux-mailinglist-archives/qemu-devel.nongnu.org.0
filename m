Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2FF4E32A4
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 23:31:36 +0100 (CET)
Received: from localhost ([::1]:45656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWQYq-0002Fo-1j
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 18:31:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWQWY-0001LN-PQ
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 18:29:15 -0400
Received: from [2a00:1450:4864:20::42c] (port=38580
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWQWX-0001Sq-9u
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 18:29:14 -0400
Received: by mail-wr1-x42c.google.com with SMTP id t11so22621359wrm.5
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 15:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=P0XLbqX6OXs6BGFg5uIFwseAeg/ihQu23jfPzP6xW84=;
 b=kYtddo0KWBgef/WHapndpPn5zcGFSVjWEMjYf5kDRk0Gi1lzdfUZMwrCbSPonAKolF
 RyRou+J2Ho4jYQGh2/gk73ee1rRD4X2yZ9R4UJGvT0XBuDbzk7kADEK5Q/ZYIAsJlaOn
 Xp4HjRVUbxMbuYHgswKUNCZygXhjumINHXDYTwPZSWYi1jPnOYo3vRlbIjd6zNpnRdVi
 z79Q/6xJX6fuH4Cfmrm4yVQQEFzIP5iz1Ao27JaGIRhJor0qjMz53IF5FABmPjxIbiYb
 1c88ElmGITNLX1xNQYpvMvRLzSXBxWdpRaVzCLpL2TWJGN+TtPxjQSZJGB7IvGdU9gWp
 1/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=P0XLbqX6OXs6BGFg5uIFwseAeg/ihQu23jfPzP6xW84=;
 b=tMyEzDoikl0BDW3FcwduV+FZ+W/p2K0PE0XEOr3/6o7Q/vGiSNkDsNouPD8BVHk1oj
 PO5xW4dXfZxGja54LxGYRlJMotje31keKWG9COAzdRkFn9XBq8b4gy8GvMK0B9WC0H23
 TqFzYvAdb6YYPQe4g4e/NAKYvcrGQf9uVscktB438/MRk4QqBPGtmCqaawWewBOTbM3C
 S/7MIVo3ngE1DRl+Z/KUcphVX/aSVWYNccM7lig4Yjy8s9CRcmd1ioVe9NJFoyLuh68u
 7jv5WiK0XSSVFpkHdZzq4mI7xtg4xskA6BtjujyY1YGpE+xCS2WVHBQfKacuFHDPPL88
 tk3w==
X-Gm-Message-State: AOAM531ipnE9txTUVqfFkHeo7XQdM95fc+YWJt69HOiQpIMNMFQ0PZie
 lDc8jeLSS1TayvDRnJogW40=
X-Google-Smtp-Source: ABdhPJzLcg/wz94M4Ovix27hadZxi5ItzzyNvMB35zm3cnsdQIvh4dLStit8uJf42QiTaESj0LwFUA==
X-Received: by 2002:a05:6000:1b86:b0:1f0:d6f:1424 with SMTP id
 r6-20020a0560001b8600b001f00d6f1424mr19690008wru.174.1647901751900; 
 Mon, 21 Mar 2022 15:29:11 -0700 (PDT)
Received: from [192.168.1.33] (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 p23-20020a1c5457000000b0038c98c12ea9sm611956wmi.1.2022.03.21.15.29.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 15:29:11 -0700 (PDT)
Message-ID: <ae93bee4-6780-8f79-e832-912a62943ecb@gmail.com>
Date: Mon, 21 Mar 2022 23:29:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v1 03/13] hw/virtio: add vhost_user_[read|write] trace
 points
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220321153037.3622127-1-alex.bennee@linaro.org>
 <20220321153037.3622127-4-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220321153037.3622127-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: slp@redhat.com, mathieu.poirier@linaro.org, mst@redhat.com,
 viresh.kumar@linaro.org, stefanha@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/3/22 16:30, Alex Bennée wrote:
> These are useful when trying to debug the initial vhost-user
> negotiation, especially when it hard to get logging from the low level
> library on the other side.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>    - fixed arguments
> ---
>   hw/virtio/vhost-user.c | 4 ++++
>   hw/virtio/trace-events | 2 ++
>   2 files changed, 6 insertions(+)
> 
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index 6abbc9da32..b27b8c56e2 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -489,6 +489,8 @@ static int vhost_user_write(struct vhost_dev *dev, VhostUserMsg *msg,
>           return ret < 0 ? -saved_errno : -EIO;
>       }
>   
> +    trace_vhost_user_write(msg->hdr.request, msg->hdr.flags);
> +
>       return 0;
>   }
>   
> @@ -542,6 +544,8 @@ static int vhost_user_set_log_base(struct vhost_dev *dev, uint64_t base,
>           }
>       }
>   
> +    trace_vhost_user_read(msg.hdr.request, msg.hdr.flags);
> +
>       return 0;
>   }
>   
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index 46851a7cd1..fd213e2a27 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -21,6 +21,8 @@ vhost_user_set_mem_table_withfd(int index, const char *name, uint64_t memory_siz
>   vhost_user_postcopy_waker(const char *rb, uint64_t rb_offset) "%s + 0x%"PRIx64
>   vhost_user_postcopy_waker_found(uint64_t client_addr) "0x%"PRIx64
>   vhost_user_postcopy_waker_nomatch(const char *rb, uint64_t rb_offset) "%s + 0x%"PRIx64
> +vhost_user_read(uint32_t req, uint32_t flags) "req:%d flags:0x%"PRIx32""
> +vhost_user_write(uint32_t req, uint32_t flags) "req:%d flags:0x%"PRIx32""

"req:%u", otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

