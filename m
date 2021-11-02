Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BFB443281
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 17:15:30 +0100 (CET)
Received: from localhost ([::1]:49160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhwRd-0006wr-0V
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 12:15:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhwHx-00074g-K8
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:05:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhwHv-0004Cj-Qv
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:05:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635869127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lm4gUPr/XreCtW5rWGca836+J4+udGeAacHcS4KAOK0=;
 b=WmmmZZnTdpPH79NauMzyIWaKtMUUO9je5MfiwiJTzp3/pUBhw23zEm6dhhN6ZuAeYuohC2
 finKU0n/GShmWt+lYu2CSdR+I4spvUmL/lwb6ned7A6hETjYo3liw+CPPpX7b7CjzNQKSD
 pegeYYcK60WARGh/OgmLm02XfQYENHY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61--ixiIy6lPvaR1L23B3jq4Q-1; Tue, 02 Nov 2021 12:05:26 -0400
X-MC-Unique: -ixiIy6lPvaR1L23B3jq4Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 n189-20020a1c27c6000000b00322f2e380f2so1361921wmn.6
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 09:05:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Lm4gUPr/XreCtW5rWGca836+J4+udGeAacHcS4KAOK0=;
 b=wtZVumOxVuZoldDKPMAoZ0ROsF4kuAlVztOgLif7gd6Ofgc/0C20IQSDTnX4W9hVC5
 wUjIVshK5l64FJV/qM6tCg6T4CWmG2tWEG+O1ZhYw6RXrAB83zh55vvr1h36kWVNHHX1
 kQ5ZU6+obXn8WSTqnzdyoCeiMuT4OoU4e83sulme3qpmD2mrs+P/fL2DummSMwI7Y+us
 RUmY7tljpRxve9na0f/kMPvBqVYPuk5MGQTVoc8oRYTq/f7FDsU7hI3y95Eiar78bEEx
 fZprTYXU9ViJgEnWuSzLze7Ae2UirvD2jnI9rRERsjs6M+8wGHpRZtM596/fhBh8jXyG
 SoRQ==
X-Gm-Message-State: AOAM531TIXnroqicyq8rCcMZfcQbOS2oVMXO9I7FbA5qWqRRZyqJ+7aG
 1m0d7h3MeOdWTXrAW9GahPJvY076ayjmr3A/CaPbHP2Q8lLgLzxq4tXj2ceC7p6+zpqlI5vY2Ij
 mBtwEAtPSzeQI+yI=
X-Received: by 2002:adf:cd04:: with SMTP id w4mr39168002wrm.406.1635869125064; 
 Tue, 02 Nov 2021 09:05:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyU2UzyhczJhnnihPy+NSArTEQiEifo9vXjHmEgIMtUcTd9F4T+Jxl5yPhdHLqvWkcPDj6KpA==
X-Received: by 2002:adf:cd04:: with SMTP id w4mr39167647wrm.406.1635869122553; 
 Tue, 02 Nov 2021 09:05:22 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id s13sm2957934wmc.47.2021.11.02.09.05.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 09:05:22 -0700 (PDT)
Message-ID: <96f02c90-ffca-0a64-00b2-835685977762@redhat.com>
Date: Tue, 2 Nov 2021 17:05:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] net/vhost-vdpa: fix memory leak in
 vhost_vdpa_get_max_queue_pairs()
To: Stefano Garzarella <sgarzare@redhat.com>, qemu-devel@nongnu.org
References: <20211102155157.241034-1-sgarzare@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211102155157.241034-1-sgarzare@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.549, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/2/21 16:51, Stefano Garzarella wrote:
> Use g_autofree to ensure that `config` is freed when
> vhost_vdpa_get_max_queue_pairs() returns.
> 
> Reported-by: Coverity (CID 1465228: RESOURCE_LEAK)
> Fixes: 402378407d ("vhost-vdpa: multiqueue support")
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  net/vhost-vdpa.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 49ab322511..373b706b90 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -214,7 +214,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>  static int vhost_vdpa_get_max_queue_pairs(int fd, int *has_cvq, Error **errp)
>  {
>      unsigned long config_size = offsetof(struct vhost_vdpa_config, buf);
> -    struct vhost_vdpa_config *config;
> +    g_autofree struct vhost_vdpa_config *config = NULL;
>      __virtio16 *max_queue_pairs;
>      uint64_t features;
>      int ret;

Eventually reducing the scope:

-- >8 --
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -214,7 +214,6 @@ static NetClientState
*net_vhost_vdpa_init(NetClientState *peer,
 static int vhost_vdpa_get_max_queue_pairs(int fd, int *has_cvq, Error
**errp)
 {
     unsigned long config_size = offsetof(struct vhost_vdpa_config, buf);
-    struct vhost_vdpa_config *config;
     __virtio16 *max_queue_pairs;
     uint64_t features;
     int ret;
@@ -232,6 +231,8 @@ static int vhost_vdpa_get_max_queue_pairs(int fd,
int *has_cvq, Error **errp)
     }

     if (features & (1 << VIRTIO_NET_F_MQ)) {
+        g_autofree struct vhost_vdpa_config *config = NULL;
+
         config = g_malloc0(config_size + sizeof(*max_queue_pairs));
         config->off = offsetof(struct virtio_net_config,
max_virtqueue_pairs);
         config->len = sizeof(*max_queue_pairs);
---

Either ways:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


