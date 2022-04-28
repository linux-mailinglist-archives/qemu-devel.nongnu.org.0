Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1E5513EFF
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 01:23:03 +0200 (CEST)
Received: from localhost ([::1]:59766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkDTS-0005oo-OV
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 19:23:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nkDOT-0007ID-1Q
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 19:17:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nkDOQ-0007nJ-ME
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 19:17:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651187870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RRYWrEbQMNw/BV52ZtXARn5xtIAsKY1qBmftg+koSLo=;
 b=KAAyFDRw6Yx4RJYNh8lbrhI9LDtVhOFXuzo02uuZ788TpcwndSvgf6lTLlSo5N7hAzvahV
 5Ag7l8ufn3kGEC4CkXP/0qLaDnpTQ4Dv7Fu/kbPo6jCh0hIRThW8qM08c6EeRHgNjJXgh1
 HXt4NifwoXb1txoqkixoQVQdtxDyg+U=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-yixPjFIUPzCPcUzN77HB5A-1; Thu, 28 Apr 2022 19:17:49 -0400
X-MC-Unique: yixPjFIUPzCPcUzN77HB5A-1
Received: by mail-ed1-f72.google.com with SMTP id
 k13-20020a50ce4d000000b00425e4447e64so3497251edj.22
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 16:17:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RRYWrEbQMNw/BV52ZtXARn5xtIAsKY1qBmftg+koSLo=;
 b=Zs67Vkni1jdeFj21BsBGxq2+Lv5U0MUL9bG7wNUOtLXncGGqUyCt1tZysc/MKjwcfz
 ofTFlJTVzw2n/DKO8rbp/d9dcBdi8/oel+SxH3yiwbxbQISH7ZnTQzdmt7f4xob86LY2
 1y3tRsTEAY683soqrue19zpGYyj2YQU/XZU3EOoNRDGc48P1gE0g8onQYJN0+EpU35BX
 mznm8jdYdNUw/buzLiwc+G24l8XUQugGZUgfUK1fppm4XcvW0C70rYYwWmM3UgLipKoG
 sRW69Eyd80ceQVhjjXOymaO+Hnumn2JUSLkRUaVKovd5CvJM5k0+4kvrjzY0hf1INvGI
 nOBg==
X-Gm-Message-State: AOAM5338U56p62LY1gRb+avLjN00moCDOdwUnjT+/nNjtM+rJYR0eIDx
 sdqB7c8ZRzOCpREvF/Yb6msFev/cgmkdoePF6OD1bbuCB2SrLhpdkiNeOEuhdTIPIyU1mM8Cyd4
 IgNBECjCM4Bkw2zA=
X-Received: by 2002:a17:907:2d0e:b0:6f3:eda5:3132 with SMTP id
 gs14-20020a1709072d0e00b006f3eda53132mr1969732ejc.686.1651187867356; 
 Thu, 28 Apr 2022 16:17:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwk0IocS6vqVs2HgnBkduensSR5WK5YE85VQmG1Z/sAlma9fkaG8aXEmoU+BmSCbNd3mwrDjw==
X-Received: by 2002:a17:907:2d0e:b0:6f3:eda5:3132 with SMTP id
 gs14-20020a1709072d0e00b006f3eda53132mr1969716ejc.686.1651187867128; 
 Thu, 28 Apr 2022 16:17:47 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 f8-20020a50fc88000000b0042617ba63b6sm2201529edq.64.2022.04.28.16.17.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 16:17:46 -0700 (PDT)
Message-ID: <5690cb69-4220-68ea-0d26-24347e62d5ae@redhat.com>
Date: Fri, 29 Apr 2022 01:17:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 6/6] virtio-scsi: move request-related items from .h to .c
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20220427143541.119567-1-stefanha@redhat.com>
 <20220427143541.119567-7-stefanha@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220427143541.119567-7-stefanha@redhat.com>
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
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
> There is no longer a need to expose the request and related APIs in
> virtio-scsi.h since there are no callers outside virtio-scsi.c.
> 
> Note the block comment in VirtIOSCSIReq has been adjusted to meet the
> coding style.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   include/hw/virtio/virtio-scsi.h | 40 -----------------------------
>   hw/scsi/virtio-scsi.c           | 45 ++++++++++++++++++++++++++++++---
>   2 files changed, 41 insertions(+), 44 deletions(-)
> 
> diff --git a/include/hw/virtio/virtio-scsi.h b/include/hw/virtio/virtio-scsi.h
> index 2497530064..abdda2cbd0 100644
> --- a/include/hw/virtio/virtio-scsi.h
> +++ b/include/hw/virtio/virtio-scsi.h
> @@ -94,42 +94,6 @@ struct VirtIOSCSI {
>       uint32_t host_features;
>   };
>   
> -typedef struct VirtIOSCSIReq {
> -    /* Note:
> -     * - fields up to resp_iov are initialized by virtio_scsi_init_req;
> -     * - fields starting at vring are zeroed by virtio_scsi_init_req.
> -     * */
> -    VirtQueueElement elem;
> -
> -    VirtIOSCSI *dev;
> -    VirtQueue *vq;
> -    QEMUSGList qsgl;
> -    QEMUIOVector resp_iov;
> -
> -    union {
> -        /* Used for two-stage request submission */
> -        QTAILQ_ENTRY(VirtIOSCSIReq) next;
> -
> -        /* Used for cancellation of request during TMFs */
> -        int remaining;
> -    };
> -
> -    SCSIRequest *sreq;
> -    size_t resp_size;
> -    enum SCSIXferMode mode;
> -    union {
> -        VirtIOSCSICmdResp     cmd;
> -        VirtIOSCSICtrlTMFResp tmf;
> -        VirtIOSCSICtrlANResp  an;
> -        VirtIOSCSIEvent       event;
> -    } resp;
> -    union {
> -        VirtIOSCSICmdReq      cmd;
> -        VirtIOSCSICtrlTMFReq  tmf;
> -        VirtIOSCSICtrlANReq   an;
> -    } req;
> -} VirtIOSCSIReq;
> -
>   static inline void virtio_scsi_acquire(VirtIOSCSI *s)
>   {
>       if (s->ctx) {
> @@ -151,10 +115,6 @@ void virtio_scsi_common_realize(DeviceState *dev,
>                                   Error **errp);
>   
>   void virtio_scsi_common_unrealize(DeviceState *dev);
> -void virtio_scsi_init_req(VirtIOSCSI *s, VirtQueue *vq, VirtIOSCSIReq *req);
> -void virtio_scsi_free_req(VirtIOSCSIReq *req);
> -void virtio_scsi_push_event(VirtIOSCSI *s, SCSIDevice *dev,
> -                            uint32_t event, uint32_t reason);
>   
>   void virtio_scsi_dataplane_setup(VirtIOSCSI *s, Error **errp);
>   int virtio_scsi_dataplane_start(VirtIODevice *s);
> diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
> index 12c6a21202..db54d104be 100644
> --- a/hw/scsi/virtio-scsi.c
> +++ b/hw/scsi/virtio-scsi.c
> @@ -29,6 +29,43 @@
>   #include "hw/virtio/virtio-access.h"
>   #include "trace.h"
>   
> +typedef struct VirtIOSCSIReq {
> +    /*
> +     * Note:
> +     * - fields up to resp_iov are initialized by virtio_scsi_init_req;
> +     * - fields starting at vring are zeroed by virtio_scsi_init_req.
> +     */
> +    VirtQueueElement elem;
> +
> +    VirtIOSCSI *dev;
> +    VirtQueue *vq;
> +    QEMUSGList qsgl;
> +    QEMUIOVector resp_iov;
> +
> +    union {
> +        /* Used for two-stage request submission */
> +        QTAILQ_ENTRY(VirtIOSCSIReq) next;
> +
> +        /* Used for cancellation of request during TMFs */
> +        int remaining;
> +    };
> +
> +    SCSIRequest *sreq;
> +    size_t resp_size;
> +    enum SCSIXferMode mode;
> +    union {
> +        VirtIOSCSICmdResp     cmd;
> +        VirtIOSCSICtrlTMFResp tmf;
> +        VirtIOSCSICtrlANResp  an;
> +        VirtIOSCSIEvent       event;
> +    } resp;
> +    union {
> +        VirtIOSCSICmdReq      cmd;
> +        VirtIOSCSICtrlTMFReq  tmf;
> +        VirtIOSCSICtrlANReq   an;
> +    } req;
> +} VirtIOSCSIReq;
> +
>   static inline int virtio_scsi_get_lun(uint8_t *lun)
>   {
>       return ((lun[2] << 8) | lun[3]) & 0x3FFF;
> @@ -45,7 +82,7 @@ static inline SCSIDevice *virtio_scsi_device_get(VirtIOSCSI *s, uint8_t *lun)
>       return scsi_device_get(&s->bus, 0, lun[1], virtio_scsi_get_lun(lun));
>   }
>   
> -void virtio_scsi_init_req(VirtIOSCSI *s, VirtQueue *vq, VirtIOSCSIReq *req)
> +static void virtio_scsi_init_req(VirtIOSCSI *s, VirtQueue *vq, VirtIOSCSIReq *req)
>   {
>       VirtIODevice *vdev = VIRTIO_DEVICE(s);
>       const size_t zero_skip =
> @@ -58,7 +95,7 @@ void virtio_scsi_init_req(VirtIOSCSI *s, VirtQueue *vq, VirtIOSCSIReq *req)
>       memset((uint8_t *)req + zero_skip, 0, sizeof(*req) - zero_skip);
>   }
>   
> -void virtio_scsi_free_req(VirtIOSCSIReq *req)
> +static void virtio_scsi_free_req(VirtIOSCSIReq *req)
>   {
>       qemu_iovec_destroy(&req->resp_iov);
>       qemu_sglist_destroy(&req->qsgl);
> @@ -801,8 +838,8 @@ static void virtio_scsi_reset(VirtIODevice *vdev)
>       s->events_dropped = false;
>   }
>   
> -void virtio_scsi_push_event(VirtIOSCSI *s, SCSIDevice *dev,
> -                            uint32_t event, uint32_t reason)
> +static void virtio_scsi_push_event(VirtIOSCSI *s, SCSIDevice *dev,
> +                                   uint32_t event, uint32_t reason)
>   {
>       VirtIOSCSICommon *vs = VIRTIO_SCSI_COMMON(s);
>       VirtIOSCSIReq *req;

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


