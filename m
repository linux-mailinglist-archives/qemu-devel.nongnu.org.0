Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 067B25A260C
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 12:47:27 +0200 (CEST)
Received: from localhost ([::1]:51400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRWs2-0002Ou-1g
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 06:47:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1oRWoO-0000AF-1c
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 06:43:40 -0400
Received: from madras.collabora.co.uk
 ([2a00:1098:0:82:1000:25:2eeb:e5ab]:57812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1oRWoL-0006Jn-Ox
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 06:43:39 -0400
Received: from [192.168.178.42] (host-95-235-60-93.retail.telecomitalia.it
 [95.235.60.93])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: fahien)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7DAA56601EBC
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 11:43:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1661510615;
 bh=6ouWsvo4/x6ZNm2RVi0C++8IpwvakqP9LgOQfNZWhvo=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=mLsc4I0YckLqJfoCW4llDwiPfOapX5NbqM7F7AyhX+r28AeJ276agZqUETCfoNxUh
 Wh+U2YTbw3kCDabd8Vs+We7gQv8e9Fi4rlFRw6POuSIyKoCpF64OttOUaQMDBUknUP
 VEER+Fp7XQ8tUp41HrGGsnW1WiHcZvRIH06bpg7oIMVpAwaFOnzzUwvwruVzoJc6ff
 wKBZwVBkjeLhK3N0lEcdLVpSWmVg2wlpgdzg3N6gF2+h99Jxsq5EDxHBS5nIUFbymy
 onRQ7QsoluZ1T9fWwGtlrEm0kQpj9fkX2Ideddsx/+7zDEobWpSoEYfsymk6zvatdO
 dKY7rp+Ntnbzg==
Message-ID: <fc0bd38e-9082-cf52-6171-be822b77038d@collabora.com>
Date: Fri, 26 Aug 2022 12:43:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v3 1/1] virtio-gpu: CONTEXT_INIT feature
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20220826100812.410773-1-antonio.caggiano@collabora.com>
 <20220826100812.410773-2-antonio.caggiano@collabora.com>
 <CAJ+F1CLr2rMACn_340z1iictXvXMRn0jhXbs=7XkSMY1eL3Upg@mail.gmail.com>
From: Antonio Caggiano <antonio.caggiano@collabora.com>
In-Reply-To: <CAJ+F1CLr2rMACn_340z1iictXvXMRn0jhXbs=7XkSMY1eL3Upg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1098:0:82:1000:25:2eeb:e5ab;
 envelope-from=antonio.caggiano@collabora.com; helo=madras.collabora.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi Marc-André,

On 26/08/2022 12:16, Marc-André Lureau wrote:
> Hi
> 
> On Fri, Aug 26, 2022 at 2:12 PM Antonio Caggiano 
> <antonio.caggiano@collabora.com <mailto:antonio.caggiano@collabora.com>> 
> wrote:
> 
>     Create virgl renderer context with flags using context_id when valid.
> 
>     v2:
>     - The feature can be enabled via the context_init config option.
>     - A warning message will be emitted and the feature will not be used
>        when linking with virglrenderer versions without context_init
>     support.
> 
>     v3: Define HAVE_VIRGL_CONTEXT_INIT in config_host_data.
> 
>     Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com
>     <mailto:antonio.caggiano@collabora.com>>
>     ---
>       hw/display/virtio-gpu-base.c   |  3 +++
>       hw/display/virtio-gpu-virgl.c  | 16 ++++++++++++++--
>       hw/display/virtio-gpu.c        |  2 ++
>       include/hw/virtio/virtio-gpu.h |  3 +++
>       meson.build                    |  5 +++++
>       5 files changed, 27 insertions(+), 2 deletions(-)
> 
>     diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
>     index a29f191aa8..6c5f1f327f 100644
>     --- a/hw/display/virtio-gpu-base.c
>     +++ b/hw/display/virtio-gpu-base.c
>     @@ -215,6 +215,9 @@ virtio_gpu_base_get_features(VirtIODevice *vdev,
>     uint64_t features,
>           if (virtio_gpu_blob_enabled(g->conf)) {
>               features |= (1 << VIRTIO_GPU_F_RESOURCE_BLOB);
>           }
>     +    if (virtio_gpu_context_init_enabled(g->conf)) {
>     +        features |= (1 << VIRTIO_GPU_F_CONTEXT_INIT);
>     +    }
> 
>           return features;
>       }
>     diff --git a/hw/display/virtio-gpu-virgl.c
>     b/hw/display/virtio-gpu-virgl.c
>     index 73cb92c8d5..274cbc44de 100644
>     --- a/hw/display/virtio-gpu-virgl.c
>     +++ b/hw/display/virtio-gpu-virgl.c
>     @@ -97,8 +97,20 @@ static void virgl_cmd_context_create(VirtIOGPU *g,
>           trace_virtio_gpu_cmd_ctx_create(cc.hdr.ctx_id,
>                                           cc.debug_name);
> 
>     -    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen,
>     -                                  cc.debug_name);
>     +    if (cc.context_init) {
>     +#ifdef HAVE_VIRGL_CONTEXT_INIT
>     +        virgl_renderer_context_create_with_flags(cc.hdr.ctx_id,
>     +                                                 cc.context_init,
>     +                                                 cc.nlen,
>     +                                                 cc.debug_name);
>     +        return;
>     +#else
>     +        qemu_log_mask(LOG_UNIMP,
>     +                      "Linked virglrenderer does not support
>     context-init\n");
> 
> 
> What is the outcome in that case?

It's in the commit message: "A warning message will be emitted and the 
feature will not be used when linking with virglrenderer versions 
without context_init"

> 
>     +#endif
>     +    }
>     +
>     +    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen,
>     cc.debug_name);
>       }
> 
>       static void virgl_cmd_context_destroy(VirtIOGPU *g,
>     diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
>     index 20cc703dcc..fa667ec234 100644
>     --- a/hw/display/virtio-gpu.c
>     +++ b/hw/display/virtio-gpu.c
>     @@ -1424,6 +1424,8 @@ static Property virtio_gpu_properties[] = {
>                            256 * MiB),
>           DEFINE_PROP_BIT("blob", VirtIOGPU, parent_obj.conf.flags,
>                           VIRTIO_GPU_FLAG_BLOB_ENABLED, false),
>     +    DEFINE_PROP_BIT("context_init", VirtIOGPU, parent_obj.conf.flags,
>     +                    VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED, false),
>           DEFINE_PROP_END_OF_LIST(),
>       };
> 
>     diff --git a/include/hw/virtio/virtio-gpu.h
>     b/include/hw/virtio/virtio-gpu.h
>     index 2e28507efe..c6f5cfde47 100644
>     --- a/include/hw/virtio/virtio-gpu.h
>     +++ b/include/hw/virtio/virtio-gpu.h
>     @@ -90,6 +90,7 @@ enum virtio_gpu_base_conf_flags {
>           VIRTIO_GPU_FLAG_EDID_ENABLED,
>           VIRTIO_GPU_FLAG_DMABUF_ENABLED,
>           VIRTIO_GPU_FLAG_BLOB_ENABLED,
>     +    VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED,
>       };
> 
>       #define virtio_gpu_virgl_enabled(_cfg) \
>     @@ -102,6 +103,8 @@ enum virtio_gpu_base_conf_flags {
>           (_cfg.flags & (1 << VIRTIO_GPU_FLAG_DMABUF_ENABLED))
>       #define virtio_gpu_blob_enabled(_cfg) \
>           (_cfg.flags & (1 << VIRTIO_GPU_FLAG_BLOB_ENABLED))
>     +#define virtio_gpu_context_init_enabled(_cfg) \
>     +    (_cfg.flags & (1 << VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED))
> 
>       struct virtio_gpu_base_conf {
>           uint32_t max_outputs;
>     diff --git a/meson.build b/meson.build
>     index 20fddbd707..e1071b3563 100644
>     --- a/meson.build
>     +++ b/meson.build
>     @@ -718,6 +718,11 @@ if not get_option('virglrenderer').auto() or
>     have_system or have_vhost_user_gpu
>                            method: 'pkg-config',
>                            required: get_option('virglrenderer'),
>                            kwargs: static_kwargs)
>     +
>     +  config_host_data.set('HAVE_VIRGL_CONTEXT_INIT',
>     +                     
>       cc.has_function('virgl_renderer_context_create_with_flags',
>     +                                       prefix: '#include
>     <virglrenderer.h>',
>     +                                       dependencies: virgl))
>       endif
>       curl = not_found
>       if not get_option('curl').auto() or have_block
>     -- 
>     2.34.1
> 
> 
> 
> lgtm
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com 
> <mailto:marcandre.lureau@redhat.com>>
> 
> -- 
> Marc-André Lureau

