Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BA2478F71
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 16:23:21 +0100 (CET)
Received: from localhost ([::1]:45886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myF4q-0003Vq-9g
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 10:23:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1myEcx-0007ND-Sn
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:54:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1myEci-0008M1-06
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:54:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639752852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VE/qldXZicdhHIxn7sMVvY0IZb8AcnysEx0o/eK6QpI=;
 b=R10mk9bkF/gS/4DvVIFOeNMF5SjJsjB1iQ/Ow7i8qqzfLekX58Ch70M3D0FRQwH9lQkJNf
 i9NYvOEL/bG3el0NekLdtDxW8G1Glk9RpCyHrNtNmCyT1f2bT/cWX+O1Msjo/rCqb/afWa
 BjRSsMra4zLktwmsf+Inf8rrrQaEuP8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-407-ahob8-T2NJegqbszT_Z5wA-1; Fri, 17 Dec 2021 09:54:11 -0500
X-MC-Unique: ahob8-T2NJegqbszT_Z5wA-1
Received: by mail-wm1-f69.google.com with SMTP id
 i15-20020a05600c354f00b0034566ac865bso1150817wmq.6
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 06:54:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=VE/qldXZicdhHIxn7sMVvY0IZb8AcnysEx0o/eK6QpI=;
 b=Y1Y+atnv4oHVFW/YFgPOrysOIANbhOtdlAmrVTLbkYolBecCe98Y5QRREOMvrxn3Ka
 JcGXFmyxtxmfoDE7o+uEBM2To3/RyCi0NsxeCzNSIDzddfrXI4kPed4XDdPyCYQ5fCKQ
 cViyXuyVbTmhzhD0P+ALBd7M29NKjWHckOPFl0TvBhG54V/uJ1rsDx5rl9PelYKa5BiG
 w4d7bpkrPREQt76RLLfFTn8j3HEg/cUrn7pjWh4BZGX9R4olp7Pf1BXJKDbi7V2PPt2x
 HyNJVqx1XGy0GBmMZvUlbdn3rTEFsgJS8UUDQ3v6OEUQ6Klu2nr0nsSaN6qshS6R0kwB
 JExQ==
X-Gm-Message-State: AOAM530kkY+JufQM2ggbtzkSEDARobV9fzLLLnO+cx00m7pCOacrDis3
 A9lSUe5IjNqpJRAfiPS73iytl3H0xPiEiucGNH/IaO0gKVCxKV1y9s58IIdTw3nn4/tLy97mfOc
 uiFHvZTp6Hne/UB5kqvjHTMPNbJTXOJR016RJnjUSKKzKhP90jIeBd12nOZGBnKM=
X-Received: by 2002:a5d:6dc1:: with SMTP id d1mr3011105wrz.282.1639752849916; 
 Fri, 17 Dec 2021 06:54:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJylx2WM2Z3UEESoy+Sd5mOpTkmORUPd/nKhMed8hstb3rci0N7i9xyFQ+0WBng/QcOtL2XIdA==
X-Received: by 2002:a5d:6dc1:: with SMTP id d1mr3011088wrz.282.1639752849693; 
 Fri, 17 Dec 2021 06:54:09 -0800 (PST)
Received: from [192.168.3.132] (p4ff234b8.dip0.t-ipconnect.de. [79.242.52.184])
 by smtp.gmail.com with ESMTPSA id m17sm2639996wms.25.2021.12.17.06.54.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 06:54:09 -0800 (PST)
Message-ID: <7350a47f-ec66-dffe-d0cf-0d21ea556771@redhat.com>
Date: Fri, 17 Dec 2021 15:54:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1] virtio-mem: Don't skip alignment checks when warning
 about block size
To: qemu-devel@nongnu.org
References: <20211011173305.13778-1-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211011173305.13778-1-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.716, SPF_HELO_NONE=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.10.21 19:33, David Hildenbrand wrote:
> If we warn about the block size being smaller than the default, we skip
> some alignment checks.
> 
> This can currently only fail on x86-64, when specifying a block size of
> 1 MiB, however, we detect the THP size of 2 MiB.
> 
> Fixes: 228957fea3a9 ("virtio-mem: Probe THP size to determine default block size")
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  hw/virtio/virtio-mem.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> index df91e454b2..7ce9901791 100644
> --- a/hw/virtio/virtio-mem.c
> +++ b/hw/virtio/virtio-mem.c
> @@ -701,7 +701,8 @@ static void virtio_mem_device_realize(DeviceState *dev, Error **errp)
>          warn_report("'%s' property is smaller than the default block size (%"
>                      PRIx64 " MiB)", VIRTIO_MEM_BLOCK_SIZE_PROP,
>                      virtio_mem_default_block_size(rb) / MiB);
> -    } else if (!QEMU_IS_ALIGNED(vmem->requested_size, vmem->block_size)) {
> +    }
> +    if (!QEMU_IS_ALIGNED(vmem->requested_size, vmem->block_size)) {
>          error_setg(errp, "'%s' property has to be multiples of '%s' (0x%" PRIx64
>                     ")", VIRTIO_MEM_REQUESTED_SIZE_PROP,
>                     VIRTIO_MEM_BLOCK_SIZE_PROP, vmem->block_size);
> 

Ping, this already missed the v6.2 release ...

-- 
Thanks,

David / dhildenb


