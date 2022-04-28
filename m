Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 075B8513F0E
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 01:28:46 +0200 (CEST)
Received: from localhost ([::1]:43518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkDYy-0005cx-QT
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 19:28:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nkDOu-0000Ds-Qc
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 19:18:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nkDOq-0007oR-V5
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 19:18:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651187896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nG1g6URpyYq2RR5PUJOPpwBlk5D9Rlg++1JKe5okF4g=;
 b=K+jlxkdYXLKzUFHJr76OJtWNo1GsDr6xjkP9B/mdm8T/iJ1U7rOnJmzUVGlf+mvvnUytTC
 zq00+8gf78H1wqIJ81UB8akjmJGbJI4QW6enwnxQQ34k2kDzk66KCSw0ZZq8PeERsETcLq
 z6l885IfZ7HYzKFa/7UuHZ2PI8h8RaI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-sKFSICjUNaO_Znhf0CiPIw-1; Thu, 28 Apr 2022 19:18:14 -0400
X-MC-Unique: sKFSICjUNaO_Znhf0CiPIw-1
Received: by mail-ej1-f72.google.com with SMTP id
 mp18-20020a1709071b1200b006e7f314ecb3so3758634ejc.23
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 16:18:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nG1g6URpyYq2RR5PUJOPpwBlk5D9Rlg++1JKe5okF4g=;
 b=Ws//vv9SgxGee/CQ833OSFH/0mXbEJldi+aAHLwQ3Rgxweu2nH1FZBbQgcyELNAavM
 W3k0qHX/T3CEWjG0+Jr61G0LQ74q9nhRN7/MKKNJZlpNL2dPfdVmkZqct8rItPjJ7bw8
 ZvfNJnZz1RLal7A4OZRfAgm6WSG/u4W9MZ9jruGxXOWKWY5pG02c/lVm5pXSb/8l7jl4
 FJ903/kpdZvljUBcNlPMyXnpjygOCKuQ4wL/Fo35qf0bUA0yxBjF6WRbeD461hoNEoHj
 3PITjFPUAzouVpJPccF/D319WN7onIkXBN0xjoFuRfYS9gfBUhvzLYqywRXyzWpMWGei
 bgmw==
X-Gm-Message-State: AOAM532ESKoBgyTam4zoPk1BVAz1bR/L+57x+ZHOv/ouXFxMMofUL1dm
 tKOYkcaYY6fEVLyEun7JgRW3YxxeqlvGBqOKCLnaoiuNmNQBFZSt0BNhlBtcaUqMsuPMbWuLnA/
 0sFooJMLpUKxEdIk=
X-Received: by 2002:a17:906:9c43:b0:6f3:a8be:af46 with SMTP id
 fg3-20020a1709069c4300b006f3a8beaf46mr17030982ejc.271.1651187893616; 
 Thu, 28 Apr 2022 16:18:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyK/1CEEOp5fyzDeB8zyBEI9kaNhZAWyJVt+J7SEEDG9g1UE0hh/zmVVF01jv1lFuYBthFVg==
X-Received: by 2002:a17:906:9c43:b0:6f3:a8be:af46 with SMTP id
 fg3-20020a1709069c4300b006f3a8beaf46mr17030973ejc.271.1651187893369; 
 Thu, 28 Apr 2022 16:18:13 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 qv48-20020a17090787b000b006f3ef214e09sm104858ejc.111.2022.04.28.16.18.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 16:18:12 -0700 (PDT)
Message-ID: <1f985549-81cd-a133-4c38-47b1a7f155ab@redhat.com>
Date: Fri, 29 Apr 2022 01:18:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/6] virtio-scsi: fix ctrl and event handler functions in
 dataplane mode
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20220427143541.119567-1-stefanha@redhat.com>
 <20220427143541.119567-2-stefanha@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220427143541.119567-2-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Nir Soffer <nsoffer@redhat.com>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/22 16:35, Stefan Hajnoczi wrote:
> Commit f34e8d8b8d48d73f36a67b6d5e492ef9784b5012 ("virtio-scsi: prepare
> virtio_scsi_handle_cmd for dataplane") prepared the virtio-scsi cmd
> virtqueue handler function to by used in both the dataplane and
> non-datpalane code paths.
> 
> It failed to convert the ctrl and event virtqueue handler functions,
> which are not designed to be called from the dataplane code path but
> will be since the ioeventfd is set up for those virtqueues when
> dataplane starts.
> 
> Convert the ctrl and event virtqueue handler functions now so they
> operate correctly when called from the dataplane code path. Avoid code
> duplication by extracting this code into a helper function.
> 
> Fixes: f34e8d8b8d48d73f36a67b6d5e492ef9784b5012 ("virtio-scsi: prepare virtio_scsi_handle_cmd for dataplane")
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   hw/scsi/virtio-scsi.c | 42 +++++++++++++++++++++++++++---------------
>   1 file changed, 27 insertions(+), 15 deletions(-)
> 
> diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
> index 34a968ecfb..417fbc71d6 100644
> --- a/hw/scsi/virtio-scsi.c
> +++ b/hw/scsi/virtio-scsi.c
> @@ -472,16 +472,32 @@ bool virtio_scsi_handle_ctrl_vq(VirtIOSCSI *s, VirtQueue *vq)
>       return progress;
>   }
>   
> +/*
> + * If dataplane is configured but not yet started, do so now and return true on
> + * success.
> + *
> + * Dataplane is started by the core virtio code but virtqueue handler functions
> + * can also be invoked when a guest kicks before DRIVER_OK, so this helper
> + * function helps us deal with manually starting ioeventfd in that case.
> + */
> +static bool virtio_scsi_defer_to_dataplane(VirtIOSCSI *s)
> +{
> +    if (!s->ctx || s->dataplane_started) {
> +        return false;
> +    }
> +
> +    virtio_device_start_ioeventfd(&s->parent_obj.parent_obj);
> +    return !s->dataplane_fenced;
> +}
> +
>   static void virtio_scsi_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
>   {
>       VirtIOSCSI *s = (VirtIOSCSI *)vdev;
>   
> -    if (s->ctx) {
> -        virtio_device_start_ioeventfd(vdev);
> -        if (!s->dataplane_fenced) {
> -            return;
> -        }
> +    if (virtio_scsi_defer_to_dataplane(s)) {
> +        return;
>       }
> +
>       virtio_scsi_acquire(s);
>       virtio_scsi_handle_ctrl_vq(s, vq);
>       virtio_scsi_release(s);
> @@ -720,12 +736,10 @@ static void virtio_scsi_handle_cmd(VirtIODevice *vdev, VirtQueue *vq)
>       /* use non-QOM casts in the data path */
>       VirtIOSCSI *s = (VirtIOSCSI *)vdev;
>   
> -    if (s->ctx && !s->dataplane_started) {
> -        virtio_device_start_ioeventfd(vdev);
> -        if (!s->dataplane_fenced) {
> -            return;
> -        }
> +    if (virtio_scsi_defer_to_dataplane(s)) {
> +        return;
>       }
> +
>       virtio_scsi_acquire(s);
>       virtio_scsi_handle_cmd_vq(s, vq);
>       virtio_scsi_release(s);
> @@ -855,12 +869,10 @@ static void virtio_scsi_handle_event(VirtIODevice *vdev, VirtQueue *vq)
>   {
>       VirtIOSCSI *s = VIRTIO_SCSI(vdev);
>   
> -    if (s->ctx) {
> -        virtio_device_start_ioeventfd(vdev);
> -        if (!s->dataplane_fenced) {
> -            return;
> -        }
> +    if (virtio_scsi_defer_to_dataplane(s)) {
> +        return;
>       }
> +
>       virtio_scsi_acquire(s);
>       virtio_scsi_handle_event_vq(s, vq);
>       virtio_scsi_release(s);

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


