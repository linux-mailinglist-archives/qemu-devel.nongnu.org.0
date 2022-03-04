Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBB14CD4A5
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 14:03:19 +0100 (CET)
Received: from localhost ([::1]:34930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ7aY-0007jQ-9N
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 08:03:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQ7Wx-0005G6-Ms
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 07:59:35 -0500
Received: from [2a00:1450:4864:20::42c] (port=36422
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQ7Ww-0001Ig-5v
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 07:59:35 -0500
Received: by mail-wr1-x42c.google.com with SMTP id r10so12597902wrp.3
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 04:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=G4cwhAYF19RJXrl+VpVW+T2plR+90IUDJSs5JCUymk0=;
 b=CmyR+JPZRMtrqXUkTB8qWJ6nEGqChPril4HB7OggrT0hj1SZCaCA+TwW0v8XvIwTCg
 SEE6UH4czPKmjsHaVc4FeXz4P7DN0sTPpKIwwKF9FnvLm/WXSfsljzOacnTdKp/rlgV9
 sePUlofYAiuygOgPJ8R7QS6Ja6vTYUuAJXP0zIbrE7mjkX9uitqsViNJgQTYi/lP0z4H
 pAkS0XOQfnJOYOc51vUvWUfcDRheBxEB6nE5M7jRsfgp9WghacmtPfqclJveCb709Ejf
 s2s7M0B9lAJ4pPVTlQh+UnxfUlIS+r2ZWkioEsPiNoKtIQofG0WJJnR/y77V0ANY3eqi
 8cPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=G4cwhAYF19RJXrl+VpVW+T2plR+90IUDJSs5JCUymk0=;
 b=3YR/QyZprbxm8IdUwLZI5oQOTKHmmlhQRiAbAVXRTMWmU6FReCdfy4X6RQXqmDVaox
 MgLRPoibDdpxjKVLzwEK6nLefQmZYuG+GJG01X/xXGylEVQmNhX/w606EwDe0588KQ94
 mNk3nsMSGvOZqqfhXApbtNg88M+7iddigIvzfjmJN5zca72KY1tEH8rOy6YKxND3+Jvl
 lOk8QwnH0tJ3i/Iz+W0QpQKdkjSlkWcDnBrCcJKAI1mMznjBrPnkqdG/mBWOOlskOMuD
 sP6NTKUzliy2rh5HlixA+U4xLmv4XInw2s2ujMKmncfDz7zUBrI33NIuoTl7PadeuTIM
 qcnA==
X-Gm-Message-State: AOAM531SQjnQLPjAGeiVcAwMkCJwoHn+BppOFKsew9Ugw63rERKozuuB
 G1ko1mWzrTkbeUvyBwFA704=
X-Google-Smtp-Source: ABdhPJypnQAQQVwglvYMfHb1FliRBr5DDVFCEYrsi21QpMD7FcrRM7jVBRKwoCjbispadgTKG6p1kQ==
X-Received: by 2002:a5d:5687:0:b0:1f0:9663:c80e with SMTP id
 f7-20020a5d5687000000b001f09663c80emr1781295wrv.343.1646398772559; 
 Fri, 04 Mar 2022 04:59:32 -0800 (PST)
Received: from [192.168.68.175] (108.red-88-28-25.dynamicip.rima-tde.net.
 [88.28.25.108]) by smtp.gmail.com with ESMTPSA id
 l16-20020a05600c4f1000b0033383cdeea1sm4966466wmq.10.2022.03.04.04.59.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 04:59:32 -0800 (PST)
Message-ID: <f0101bd9-28fb-7e21-24cc-7cebfb0f8b01@gmail.com>
Date: Fri, 4 Mar 2022 13:47:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH V7 01/29] memory: qemu_check_ram_volatile
Content-Language: en-US
To: Steve Sistare <steven.sistare@oracle.com>, qemu-devel@nongnu.org
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-2-git-send-email-steven.sistare@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <1640199934-455149-2-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/12/21 20:05, Steve Sistare wrote:
> Add a function that returns an error if any ram_list block represents
> volatile memory.
> 
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>   include/exec/memory.h |  8 ++++++++
>   softmmu/memory.c      | 26 ++++++++++++++++++++++++++
>   2 files changed, 34 insertions(+)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 20f1b27..137f5f3 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -2981,6 +2981,14 @@ bool ram_block_discard_is_disabled(void);
>    */
>   bool ram_block_discard_is_required(void);
>   
> +/**
> + * qemu_ram_check_volatile: return 1 if any memory regions are writable and not
> + * backed by shared memory, else return 0.
> + *
> + * @errp: returned error message identifying the first volatile region found.

This doesn't seem a good usage of the Error API. This is not an error
actually, but the expected result. If you want to return the first
or all, better use an explicit argument for them. Returning the first
is odd however. Is it useful for the user? If so, we want to return
them all, eventually in a GArray/GPtrArray, and return the MemoryRegion
handle, not its name. Otherwise if it is only useful for developers I'd
simply log the volatile MR name in a trace event.

Then we get:

   bool ram_block_is_volatile(void);

Or

   bool qemu_ram_is_volatile(void);

> + */
> +int qemu_check_ram_volatile(Error **errp);


> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 7340e19..30b2f68 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -2837,6 +2837,32 @@ void memory_global_dirty_log_stop(unsigned int flags)
>       memory_global_dirty_log_do_stop(flags);
>   }
>   
> +static int check_volatile(RAMBlock *rb, void *opaque)

If using the 'qemu_ram_is_volatile' name for the public API,
this one could be 'static bool ram_block_is_volatile(...)'.

> +{
> +    MemoryRegion *mr = rb->mr;
> +
> +    if (mr &&
> +        memory_region_is_ram(mr) &&
> +        !memory_region_is_ram_device(mr) &&
> +        !memory_region_is_rom(mr) &&
> +        (rb->fd == -1 || !qemu_ram_is_shared(rb))) {
> +        *(const char **)opaque = memory_region_name(mr);
> +        return -1;
> +    }
> +    return 0;
> +}
> +
> +int qemu_check_ram_volatile(Error **errp)
> +{
> +    char *name;
> +
> +    if (qemu_ram_foreach_block(check_volatile, &name)) {
> +        error_setg(errp, "Memory region %s is volatile", name);
> +        return -1;
> +    }
> +    return 0;
> +}

Regards,

Phil.

