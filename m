Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0530F40AEFB
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 15:33:54 +0200 (CEST)
Received: from localhost ([::1]:53204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ8ZN-0008Ur-3P
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 09:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mQ8N2-0002gh-U5
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:21:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mQ8N1-0003n1-3u
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:21:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631625666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+al8hLyJPjNSywLaLq82X78RBZuLdzZs5e9aehQyAgQ=;
 b=fpaOTXMLA4UF0pKpBGcZjC82DkRhfoSQuRQc7S1vUtBlVv9N29Vj4+/rGgZ23KTLfcB3AP
 rHdEWINpImBP5rqLkSYfRZ25oxI7V+KG+EmLHl7DQ1M+m8L/AG+ae05hsbfDiiv1c3rN9s
 D2l7cU8OdC5FxotKShoqb/Vq8gEbNsU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-D0MmyhKfPkSCLa-799DKqw-1; Tue, 14 Sep 2021 09:21:04 -0400
X-MC-Unique: D0MmyhKfPkSCLa-799DKqw-1
Received: by mail-wr1-f69.google.com with SMTP id
 q14-20020a5d574e000000b00157b0978ddeso3941285wrw.5
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 06:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=+al8hLyJPjNSywLaLq82X78RBZuLdzZs5e9aehQyAgQ=;
 b=ZkMfVMatpeuag3h171+w16lFXs0NNXFCf5rhAmFYDK80U48y7/c9TsusXLJuX8K0Ix
 jjHkIC8ameZj4+Y0pxx6DV5UBvqP5+/3Y6r+bEDRgcZvROxJvSaYJqVkizw0fqzSMPws
 HItQBaGi/0iP0p9usEleBf0NCZ8oeP6pMgiZLO2ouK7wypKkDOPvUoENhbZd1IDmOIIw
 wMEYZj+z364OMLP1f0LvYF1W92JRFtuaFOJkhwp+diX2fEEjQzpcshZRRPVHSeSNYwtM
 8MUOfD3BkphxeAPBOn0DzIDogFK9dMd0W7DeqsI1DTtnLR7ZnwineIwiJ4DznH4enVCY
 YUPw==
X-Gm-Message-State: AOAM532FoYwkGau/i8WRHpfbOlyUAWxe55oCLpUFJAB801udhygGT3Xm
 uezYeMCvrV+ku+qIW8+Sg2xistGgk24JF92NC8mV1IVQDIHa9Zk86crKsagXKkSbTQt0B9ABrL7
 R53NBh+148b8UV80=
X-Received: by 2002:a05:600c:3641:: with SMTP id
 y1mr2158568wmq.43.1631625663705; 
 Tue, 14 Sep 2021 06:21:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWw5cpCftKL5+ZqKbOAw12juiYjlRy2XCzdEawqcxCPQocJHV3fD8TTxZTn2vCqrltp8J97Q==
X-Received: by 2002:a05:600c:3641:: with SMTP id
 y1mr2158547wmq.43.1631625663508; 
 Tue, 14 Sep 2021 06:21:03 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6041.dip0.t-ipconnect.de. [91.12.96.65])
 by smtp.gmail.com with ESMTPSA id
 n3sm1179934wmi.0.2021.09.14.06.21.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 06:21:03 -0700 (PDT)
Subject: Re: [PATCH] virtio-balloon: Fix page-poison subsection name
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, mst@redhat.com,
 Alexander Duyck <alexander.duyck@gmail.com>
References: <20210914131716.102851-1-dgilbert@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <535891c6-237b-6d37-7492-ef8c1e19e6ca@redhat.com>
Date: Tue, 14 Sep 2021 15:21:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914131716.102851-1-dgilbert@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14.09.21 15:17, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> The subsection name for page-poison was typo'd as:
> 
>    vitio-balloon-device/page-poison
> 
> Note the missing 'r' in virtio.
> 
> When we have a machine type that enables page poison, and the guest
> enables it (which needs a new kernel), things fail rather unpredictably.
> 
> The fallout from this is that most of the other subsections fail to
> load, including things like the feature bits in the device, one
> possible fallout is that the physical addresses of the queues
> then get aligned differently and we fail with an error about
> last_avail_idx being wrong.
> It's not obvious to me why this doesn't produce a more obvious failure,
> but virtio's vmstate loading is a bit open-coded.
> 
> Fixes: 7483cbbaf82 ("virtio-balloon: Implement support for page poison reporting feature")
> bz: https://bugzilla.redhat.com/show_bug.cgi?id=1984401
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>   hw/virtio/virtio-balloon.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> index 5a69dce35d..c6962fcbfe 100644
> --- a/hw/virtio/virtio-balloon.c
> +++ b/hw/virtio/virtio-balloon.c
> @@ -852,7 +852,7 @@ static const VMStateDescription vmstate_virtio_balloon_free_page_hint = {
>   };
>   
>   static const VMStateDescription vmstate_virtio_balloon_page_poison = {
> -    .name = "vitio-balloon-device/page-poison",
> +    .name = "virtio-balloon-device/page-poison",
>       .version_id = 1,
>       .minimum_version_id = 1,
>       .needed = virtio_balloon_page_poison_support,
> 

Oh, that's very subtle. I wasn't even aware that the prefix really has 
to match the actual device ... I thought the whole idea of the prefix 
here was just to make the string unique ...

Reviewed-by: David Hildenbrand <david@redhat.com>

Thanks!

-- 
Thanks,

David / dhildenb


