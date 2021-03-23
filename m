Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D45346622
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:18:52 +0100 (CET)
Received: from localhost ([::1]:56546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOkg7-0006xH-OS
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOjuG-0008WE-UE
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:29:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOjuD-00072S-SA
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:29:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616516961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PGXz4Sy+aAwBCmnZYBNtaagl14GWxjRJGo2R+w7pVJo=;
 b=I6ozZuiGDUMPhlrHeVlIrszMfG4K8BdFQg3GDwHgTHSqG87inyDL6p6KUDTf1s12TvOGPX
 fFPR1KixMi2Bqv0tLASZ1gZLC6OsdVWjugeSXWD25DZSV/bLyw0DnjIRTK+SHnPDrwR7G/
 64aoKnl3IH5QgwaAe4X6FilnxlzIHTA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-e-sc2COpOQio373Yrltm3g-1; Tue, 23 Mar 2021 12:29:18 -0400
X-MC-Unique: e-sc2COpOQio373Yrltm3g-1
Received: by mail-wr1-f71.google.com with SMTP id n16so1357139wro.1
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 09:29:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PGXz4Sy+aAwBCmnZYBNtaagl14GWxjRJGo2R+w7pVJo=;
 b=aPHRsRnFMTGp1N7JUx+0pGFETNGqrRXikNIWmBIii97PZ7tllkRi6b8B7apnueilEX
 irXfJxt/VLTT2XcZN0w090OLinKevfGWXyt4tGwp62mq/8xjX1dui8u0EUJr/hwUx/Nv
 jqJpWho9PDPL2bbrDQVX59irbKHioWJ0Qlwzv1rWlPx4aGbhH1w7TXIDaHt8aCiHMiH9
 odVp48oJzLWZmk/xU/axgQM5/JyV1Y8WbvLmRoVEYnns/WLPY6VyLBFkB4/r3dCYUJZG
 ff7ZMFXVzhbp50rfdX8CqC05740DCb5wny/1CGruEtKk6e9sKTq/TjCL+sx3ppzS2SfE
 XXYA==
X-Gm-Message-State: AOAM532WgGco5hch7Uqx6mULJO0FQgpqm8/HvXFHveY5l0JSth0ORHhn
 2xCp71cX4P9ugKRAW9NlLpApPXt70ld23xi861t2XUHXlEBCuQJCNqTg4zTgyfy/+dmAzbz3kuH
 bpXNMrk+z0cwJi+4=
X-Received: by 2002:a05:600c:2d42:: with SMTP id
 a2mr4166581wmg.77.1616516956993; 
 Tue, 23 Mar 2021 09:29:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+mVZO3C5cd3mCUniseD5swbJ4TvtetJQEFhv7nMJIQXBFTbuMysbZilqPptU6nk21TbgrXg==
X-Received: by 2002:a05:600c:2d42:: with SMTP id
 a2mr4166565wmg.77.1616516956744; 
 Tue, 23 Mar 2021 09:29:16 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u2sm24617538wrp.12.2021.03.23.09.29.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 09:29:16 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210323155132.238193-1-f4bug@amsat.org>
 <20210323155132.238193-5-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 04/13] blobs: Only install PALcode blob if alpha
 system target is built
Message-ID: <03ca4200-2f64-37a8-f3d3-6df86074326a@redhat.com>
Date: Tue, 23 Mar 2021 17:29:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210323155132.238193-5-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/03/21 16:51, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Cc: Richard Henderson <richard.henderson@linaro.org>
> ---
>   meson.build         | 2 ++
>   pc-bios/meson.build | 7 ++++++-
>   2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index 5c85a15364d..b5b8892fe7a 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -93,9 +93,11 @@
>   
>   edk2_targets = [ 'arm-softmmu', 'aarch64-softmmu', 'i386-softmmu', 'x86_64-softmmu' ]
>   install_edk2_blobs = false
> +install_blobs_alpha = false
>   if get_option('install_blobs')
>     foreach target : target_dirs
>       install_edk2_blobs = install_edk2_blobs or target in edk2_targets
> +    install_blobs_alpha = install_blobs_alpha or target in ['alpha-softmmu']
What if you had something like

blob_targets = {
   ...,
   'palcode-clipper': ['alpha-softmmu'],
   'npcm7xx_bootrom.bin': ['arm-softmmu', 'aarch64-softmmu'],
   ...
}

and then

if get_option('install_blobs')
   foreach file, targets: blob_targets
     if file.endswith('.bz2') and not install_edk2_blobs
       continue
     endif
     foreach target : targets
       if (target in target_dirs)
         if file.endswith('.bz2')
           custom_target(...)
         elif install_edk2_blobs
           install_data(file, install_dir: qemu_datadir)
         endif
         break
       endif
     endforeach
   endforeach
endif

This simplifies the per-arch patches noticeably, since they only have to 
add a single line.

Paolo

>     endforeach
>   endif
>   
> diff --git a/pc-bios/meson.build b/pc-bios/meson.build
> index 007cf9d2afb..29085912d7d 100644
> --- a/pc-bios/meson.build
> +++ b/pc-bios/meson.build
> @@ -73,7 +73,6 @@
>     's390-netboot.img',
>     'slof.bin',
>     'skiboot.lid',
> -  'palcode-clipper',
>     'u-boot.e500',
>     'u-boot-sam460-20100605.bin',
>     'qemu_vga.ndrv',
> @@ -91,6 +90,12 @@
>     ))
>   endif
>   
> +if install_blobs_alpha
> +  blobs_ss.add(files(
> +    'palcode-clipper',
> +  ))
> +endif
> +
>   blobs_ss = blobs_ss.apply(config_host, strict: false)
>   
>   if get_option('install_blobs')
> 


