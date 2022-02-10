Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A93C4B0D44
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 13:15:53 +0100 (CET)
Received: from localhost ([::1]:58584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI8Ma-000321-1R
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 07:15:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nI848-00085x-Ek
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 06:56:50 -0500
Received: from [2607:f8b0:4864:20::631] (port=45841
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nI846-0002NZ-BY
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 06:56:48 -0500
Received: by mail-pl1-x631.google.com with SMTP id w20so1599606plq.12
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 03:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fbMumqmgB/jgg9sMG7RJgnmMFF8fbHgHYcttdEZpLzE=;
 b=Ak0yJJSoqxi1SyxkZRw0oH7s5KETuSE0gqACIKujwQNj0XLPd2yIHP1d5zuDGz76Ph
 dduCL9Kg7Khn9TI37r0erO1RFFKTSCjph+Dju1QJ/kxurTC4SHlp1j63DNHyhxgtFPbL
 2Ar7usm5529vbucEz/9Z4+4f0c94bL0bIs+USE/AkLdqYmj8/O0/1KU0YbMEgWc5Odr1
 n+etPSZVoJ0Do0dlp/vo0O8mYAZXW8UgD56NK0yJYMYlsbbSkuOQ5h4G1hoVr1TO+ITz
 Cay0rdUiXTttMH4hFNspGl5+YLfaDL3uUsdP6S7tey7sIfgpFXdHDrNzS+nr0oPEGBAa
 p+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fbMumqmgB/jgg9sMG7RJgnmMFF8fbHgHYcttdEZpLzE=;
 b=y+EULgW2Vwj/6QpYAS6WkxKRi8+iLb5rtiA/nHdJyuZBa5DyqHWYjqzMPMyRiJHmyv
 ShT4bYmvnUd9XimD/yBDkITcnOEElnD0B+tdyPVduzv/fyRLd0DrypDD4gZIZN6losaQ
 mzRXM3kufFBkML/F4oHdUtVGwPYlO1+8XDgkaoAK6aiYIdzIfR7UJo6uyHi/EB2fqCbM
 ZYF+x6hk0xm4vvJTUdrPyCqLFo+0lsU7s4a7Y8cR/QDr1N6hmDAK4Hi3vynGZNEP8o5n
 iKPIRCANIY772c3rozvjcYJC/ZkKO4pJ63Ds9pWs+eL9K+4Bx5Oa1eSdWdqGssg6LpPc
 g8sQ==
X-Gm-Message-State: AOAM53396e72f3qAwWVXH6trAuOLWVj7v+Oyz5mADAGSWxP9VDlMKmNt
 6yc3qSEaVnG1pF6DZkbckx4=
X-Google-Smtp-Source: ABdhPJxB7a/HXwcrqgMsxhrg6w4PMCsVqZAbFRZyNkThz412oFfkikmZ8eAF+XZQqniaR4+Ckq+3Bg==
X-Received: by 2002:a17:902:c652:: with SMTP id
 s18mr7490911pls.104.1644494204919; 
 Thu, 10 Feb 2022 03:56:44 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id g12sm22213757pfm.119.2022.02.10.03.56.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 03:56:44 -0800 (PST)
Message-ID: <9f4f0f8a-fa0d-7ca6-122c-4fa538109e65@amsat.org>
Date: Thu, 10 Feb 2022 12:56:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 1/2] vhost-user-blk: handle errors in
 vhost_user_blk_connect
Content-Language: en-US
To: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>, qemu-devel@nongnu.org
Cc: yc-core@yandex-team.ru
References: <164449357269.2210307.9274525043180414283.stgit@dynamic-vpn.dhcp.yndx.net>
In-Reply-To: <164449357269.2210307.9274525043180414283.stgit@dynamic-vpn.dhcp.yndx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 10/2/22 12:46, Konstantin Khlebnikov wrote:
> Cleanup vhost device and update connection state when initialization fails.
> 
> Signed-off-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
> ---
>   hw/block/vhost-user-blk.c |   10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index 1a42ae9187..35ac188ca4 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -340,18 +340,24 @@ static int vhost_user_blk_connect(DeviceState *dev, Error **errp)
>       ret = vhost_dev_init(&s->dev, &s->vhost_user, VHOST_BACKEND_TYPE_USER, 0,
>                            errp);
>       if (ret < 0) {
> -        return ret;
> +        goto err_init;
>       }
>   
>       /* restore vhost state */
>       if (virtio_device_started(vdev, vdev->status)) {
>           ret = vhost_user_blk_start(vdev, errp);
>           if (ret < 0) {
> -            return ret;
> +            goto err_start;
>           }
>       }

What about moving here ...:

     s->connected = true;

>   
>       return 0;
> +
> +err_start:
> +    vhost_dev_cleanup(&s->dev);
> +err_init:
> +    s->connected = false;

... to have a single 'err' label?

> +    return ret;
>   }
>   
>   static void vhost_user_blk_disconnect(DeviceState *dev)
> 
> 


