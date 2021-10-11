Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E3A429616
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 19:51:48 +0200 (CEST)
Received: from localhost ([::1]:53336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZzSl-00049s-8B
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 13:51:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mZzP6-0008NC-7s
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 13:48:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mZzP4-00085E-Jv
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 13:47:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633974477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+QbFSAO9rNC+thx855cg68HNU4PSWCz7KnKF5Iu9kLc=;
 b=FCO7KxuBVI6QzorbpNJ0rgulfLdqJOV6J09M3PfmvQroksZC958vCtFq2vgvNwsd/8br+0
 zQjZ2kfV3cQdCspK61YD/wM7YzUNOZ+9WZkayct5C3U5aWaSTY64bLBkCWiTPtgdHRGbX8
 E0ZFDZxDay8ER3zV1O68YSqoJhZbB3c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-rIj0TBggPNuV0o4OMr5bwA-1; Mon, 11 Oct 2021 13:47:56 -0400
X-MC-Unique: rIj0TBggPNuV0o4OMr5bwA-1
Received: by mail-wr1-f70.google.com with SMTP id
 r16-20020adfb1d0000000b00160bf8972ceso13844790wra.13
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 10:47:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=+QbFSAO9rNC+thx855cg68HNU4PSWCz7KnKF5Iu9kLc=;
 b=zYzjsCwl5In02mhmIOTtUJhW29hh2j1/wjIxbwSMrIlih46FyGcQzaUbas5ep9RyyO
 /AEGBcnsN65nH4wH9QMxMrUUl5/Zl75arXsUez86YxN2Yt8UyJWHt604SG7zqDnCPLmL
 A7efcYSloM727phEqIgAuvw71yEwvg1zqD8EwsUIeboX97V3zm1mZbPNpAR0PNlZCGZt
 uGi2lcSPobHI219Zzf7D8z0v0Nhj+74JfHSDsxl55ddHv5Y75WLqe2IbjWsGXxFGUlIi
 MOl6jREKFY4u/P6IDmwri3R9Y/1xqXz7gRxyW+zxkyUuEb/+jHn4NAxSzjJZMLg18/w8
 qRFA==
X-Gm-Message-State: AOAM531OmflV8t0wi34WeUaq06NfUzco9vDpv1X83a07klqT3t381zYq
 Ly5oXnnCS8VGuq6VwRMvn8WRSM1Wq1qq8isdhB1ixXD3ODUwnljuO6xcrCFsvkfV8rHC7EqU5N2
 SR33fAruorATrCfQ=
X-Received: by 2002:a05:600c:354c:: with SMTP id
 i12mr14182wmq.59.1633974475395; 
 Mon, 11 Oct 2021 10:47:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyY0HYaaMLvRsNAAn73oq711KiBXslwS5lEJfGDBu/rQx9fCbpQVeKspcJI40/ja56GqCZAWA==
X-Received: by 2002:a05:600c:354c:: with SMTP id
 i12mr14157wmq.59.1633974475166; 
 Mon, 11 Oct 2021 10:47:55 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c64ba.dip0.t-ipconnect.de. [91.12.100.186])
 by smtp.gmail.com with ESMTPSA id f18sm8797683wrg.3.2021.10.11.10.47.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 10:47:54 -0700 (PDT)
Subject: Re: [PATCH] memory: Log access direction for invalid accesses
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <20211011173616.F1DE0756022@zero.eik.bme.hu>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <7d61c90f-4279-2a2a-18fd-1865f8560b4d@redhat.com>
Date: Mon, 11 Oct 2021 19:47:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211011173616.F1DE0756022@zero.eik.bme.hu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.10.21 19:32, BALATON Zoltan wrote:
> In memory_region_access_valid() invalid accesses are logged to help
> debugging but the log message does not say if it was a read or write.
> Log that too to better identify the access causing the problem.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   softmmu/memory.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index db182e5d3d..e5826faa0c 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -1378,17 +1378,17 @@ bool memory_region_access_valid(MemoryRegion *mr,
>   {
>       if (mr->ops->valid.accepts
>           && !mr->ops->valid.accepts(mr->opaque, addr, size, is_write, attrs)) {
> -        qemu_log_mask(LOG_GUEST_ERROR, "Invalid access at addr "
> -                                       "0x%" HWADDR_PRIX ", size %u, "
> -                                       "region '%s', reason: rejected\n",
> +        qemu_log_mask(LOG_GUEST_ERROR, "Invalid %s at addr 0x%" HWADDR_PRIX
> +                      ", size %u, region '%s', reason: rejected\n",
> +                      is_write ? "write" : "read",
>                         addr, size, memory_region_name(mr));
>           return false;
>       }
>   
>       if (!mr->ops->valid.unaligned && (addr & (size - 1))) {
> -        qemu_log_mask(LOG_GUEST_ERROR, "Invalid access at addr "
> -                                       "0x%" HWADDR_PRIX ", size %u, "
> -                                       "region '%s', reason: unaligned\n",
> +        qemu_log_mask(LOG_GUEST_ERROR, "Invalid %s at addr 0x%" HWADDR_PRIX
> +                      ", size %u, region '%s', reason: unaligned\n",
> +                      is_write ? "write" : "read",
>                         addr, size, memory_region_name(mr));
>           return false;
>       }
> @@ -1400,10 +1400,10 @@ bool memory_region_access_valid(MemoryRegion *mr,
>   
>       if (size > mr->ops->valid.max_access_size
>           || size < mr->ops->valid.min_access_size) {
> -        qemu_log_mask(LOG_GUEST_ERROR, "Invalid access at addr "
> -                                       "0x%" HWADDR_PRIX ", size %u, "
> -                                       "region '%s', reason: invalid size "
> -                                       "(min:%u max:%u)\n",
> +        qemu_log_mask(LOG_GUEST_ERROR, "Invalid %s at addr 0x%" HWADDR_PRIX
> +                      ", size %u, region '%s', reason: invalid size "
> +                      "(min:%u max:%u)\n",
> +                      is_write ? "write" : "read",
>                         addr, size, memory_region_name(mr),
>                         mr->ops->valid.min_access_size,
>                         mr->ops->valid.max_access_size);
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


