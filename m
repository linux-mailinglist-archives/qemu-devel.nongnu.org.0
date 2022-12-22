Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF45653D11
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 09:38:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8H5S-0003y0-94; Thu, 22 Dec 2022 03:37:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p8H5Q-0003xh-0b
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 03:37:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p8H5M-0001Zr-2D
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 03:37:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671698267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jby+57JI1J5EDsM4hdEuEJs8jRwHnAYA1P9/NVN3gCM=;
 b=IHnuFK2Vh136qYkl5TKLhb0qe+l9BLjyfrEJM4+lkpONy1jsYH+Cw8QtxSJtB8e2tjUc3h
 yPXdJIaQyiHydMgdnQHGWeKKh7enuD36n4KcEluwu/JMRtuY7gAwUD8xi/hgleiDcw7NUR
 QGzbLvGPftTwaI/B/YyOwlZc08izOmU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-80-nwMIcE8ZPCWIpfJfRdIGaA-1; Thu, 22 Dec 2022 03:37:45 -0500
X-MC-Unique: nwMIcE8ZPCWIpfJfRdIGaA-1
Received: by mail-ed1-f72.google.com with SMTP id
 m3-20020a056402430300b0047b94307bbeso1047213edc.3
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 00:37:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Jby+57JI1J5EDsM4hdEuEJs8jRwHnAYA1P9/NVN3gCM=;
 b=RBKT3EZ1xL9uzGyl/7T+GGiJu5UgFxDv/obcKcXHo1YQzYfOqSL5ppJicUecUdXGEU
 sQmGkcMEJeF7HqX3CZlONwrHK5k3z3hmVKXK7ob4HKmnmf2o14uMd/PBytctgyNUw142
 GZctp0neUAI2qjNh4IjTO6/Gct3WBL9y4pvJH1FlLOe+HtJIOIbbdoHUqRFaHGcpfwuL
 pKMxCWEABpOrdJtRjOgXIAjtFXr7bjh2ufIGp4io0g1fK3NCgnYwtVzyZha02NvWDp/c
 tDJTNQgTQEJnhW9ecfeYZCwRjZjBA886HSnFc08gKp3zNrdFwXcCXkOZYB4if1iMIQlv
 +buQ==
X-Gm-Message-State: AFqh2kr37nHATXeiGhJQfK1veUT6pAabRxhoD84pEfZoNcwcki1x4NRZ
 MUow1Sx5YQIULsj6FSp2dvQhSvxl6i4yt3h0CabOJ6uTLwPmUBBMOSEcYO+qANA0n/rYMprgdH/
 S2KCMX/Xxpq4DyGs=
X-Received: by 2002:a17:907:76c2:b0:829:59d5:e65a with SMTP id
 kf2-20020a17090776c200b0082959d5e65amr3778963ejc.77.1671698264202; 
 Thu, 22 Dec 2022 00:37:44 -0800 (PST)
X-Google-Smtp-Source: AMrXdXucSwbHRX/o4KyB1IOJ4n6MRpLsxW93eiXgRLJh+jPu7Ae2Bb0K4OoMZohfEjMmHBBoFCL0LA==
X-Received: by 2002:a17:907:76c2:b0:829:59d5:e65a with SMTP id
 kf2-20020a17090776c200b0082959d5e65amr3778950ejc.77.1671698263983; 
 Thu, 22 Dec 2022 00:37:43 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 a2-20020a170906274200b007bb86679a32sm8128077ejd.217.2022.12.22.00.37.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 00:37:43 -0800 (PST)
Message-ID: <c84a4f13-3e1a-064e-631b-166761af7643@redhat.com>
Date: Thu, 22 Dec 2022 09:37:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] hw/display: avoid creating empty loadable modules
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Miroslav Rezanina
 <mrezanin@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>
References: <20221219125830.2369169-1-berrange@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221219125830.2369169-1-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/19/22 13:58, Daniel P. Berrangé wrote:
> When using --disable-virglrenderer, QEMU still creates
> 
>    hw-display-virtio-gpu-gl.so
>    hw-display-virtio-vga-gl.so
>    hw-display-virtio-gpu-pci-gl.so
> 
> but when these are loaded, they provide no functionality as the code
> which registers types is not compiled in. Funtionally this is
> relatively harmless, because QEMU is fine loading a module with no
> types.
> 
> This is rather confusing for users and OS distro maintainers though,
> as they think they have the GL functionality built, but in fact the
> module they are looking at provides nothing of value.
> 
> The root cause is the use of 'when/if_true' rules when adding sources
> to the module source set. If all the rules evaluate to false, then we
> have declared the module, but not added anything to it.  We need to
> put declaration of the entire module inside a condition based on
> existance of the 3rd party library deps that are mandatory.
> 
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1352
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   hw/display/meson.build | 24 ++++++++++++++----------
>   1 file changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/display/meson.build b/hw/display/meson.build
> index 7a725ed80e..20a53d24a8 100644
> --- a/hw/display/meson.build
> +++ b/hw/display/meson.build
> @@ -64,7 +64,7 @@ softmmu_ss.add(when: 'CONFIG_ARTIST', if_true: files('artist.c'))
>   softmmu_ss.add(when: [pixman, 'CONFIG_ATI_VGA'], if_true: files('ati.c', 'ati_2d.c', 'ati_dbg.c'))
>   
>   
> -if config_all_devices.has_key('CONFIG_VIRTIO_GPU')
> +if config_all_devices.has_key('CONFIG_VIRTIO_GPU') and pixman.found()

pixman is mandatory if have_system.

Can you instead change hw/meson.build to skip system-only directories? 
I think this should do:

subdir('core')
if not have_system
   subdir_done()
endif

# everything else...

The rest is good, so I have applied it.

Paolo

>     virtio_gpu_ss = ss.source_set()
>     virtio_gpu_ss.add(when: 'CONFIG_VIRTIO_GPU',
>                       if_true: [files('virtio-gpu-base.c', 'virtio-gpu.c'), pixman])
> @@ -73,13 +73,15 @@ if config_all_devices.has_key('CONFIG_VIRTIO_GPU')
>     virtio_gpu_ss.add(when: 'CONFIG_VHOST_USER_GPU', if_true: files('vhost-user-gpu.c'))
>     hw_display_modules += {'virtio-gpu': virtio_gpu_ss}
>   
> -  virtio_gpu_gl_ss = ss.source_set()
> -  virtio_gpu_gl_ss.add(when: ['CONFIG_VIRTIO_GPU', virgl, opengl],
> -                       if_true: [files('virtio-gpu-gl.c', 'virtio-gpu-virgl.c'), pixman, virgl])
> -  hw_display_modules += {'virtio-gpu-gl': virtio_gpu_gl_ss}
> +  if virgl.found() and opengl.found()
> +    virtio_gpu_gl_ss = ss.source_set()
> +    virtio_gpu_gl_ss.add(when: ['CONFIG_VIRTIO_GPU', virgl, opengl],
> +                         if_true: [files('virtio-gpu-gl.c', 'virtio-gpu-virgl.c'), pixman, virgl])
> +    hw_display_modules += {'virtio-gpu-gl': virtio_gpu_gl_ss}
> +  endif
>   endif
>   
> -if config_all_devices.has_key('CONFIG_VIRTIO_PCI')
> +if config_all_devices.has_key('CONFIG_VIRTIO_PCI') and pixman.found()
>     virtio_gpu_pci_ss = ss.source_set()
>     virtio_gpu_pci_ss.add(when: ['CONFIG_VIRTIO_GPU', 'CONFIG_VIRTIO_PCI'],
>                           if_true: [files('virtio-gpu-pci.c'), pixman])
> @@ -87,10 +89,12 @@ if config_all_devices.has_key('CONFIG_VIRTIO_PCI')
>                           if_true: files('vhost-user-gpu-pci.c'))
>     hw_display_modules += {'virtio-gpu-pci': virtio_gpu_pci_ss}
>   
> -  virtio_gpu_pci_gl_ss = ss.source_set()
> -  virtio_gpu_pci_gl_ss.add(when: ['CONFIG_VIRTIO_GPU', 'CONFIG_VIRTIO_PCI', virgl, opengl],
> -                           if_true: [files('virtio-gpu-pci-gl.c'), pixman])
> -  hw_display_modules += {'virtio-gpu-pci-gl': virtio_gpu_pci_gl_ss}
> +  if virgl.found() and opengl.found()
> +    virtio_gpu_pci_gl_ss = ss.source_set()
> +    virtio_gpu_pci_gl_ss.add(when: ['CONFIG_VIRTIO_GPU', 'CONFIG_VIRTIO_PCI', virgl, opengl],
> +                             if_true: [files('virtio-gpu-pci-gl.c'), pixman])
> +    hw_display_modules += {'virtio-gpu-pci-gl': virtio_gpu_pci_gl_ss}
> +  endif
>   endif
>   
>   if config_all_devices.has_key('CONFIG_VIRTIO_VGA')


