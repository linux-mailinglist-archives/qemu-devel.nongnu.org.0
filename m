Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E80E6B720B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 10:07:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbe8V-0003qP-2M; Mon, 13 Mar 2023 05:06:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbe8O-0003pu-3b
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 05:06:24 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbe8M-0007z3-Bj
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 05:06:23 -0400
Received: by mail-wm1-x335.google.com with SMTP id ay8so2093485wmb.1
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 02:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678698380;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Bhev4z8i7cRyDcQdQN1B0BbeMECVxNAmns4FuvOcp0I=;
 b=R79ynA+KmG8ZL2nRj6rCi8bulBRvvbLMJb0zK3oURLjHwssSi+Cq3ruaxEY/HBDZPF
 q4y+Cxgb3x4SgErHaXg1rTWmpz5oNYkNzkEfiy4seK67OgH5Q3r6/YQXQ6o7v376vC1G
 gNSd88Sr9h9qnpqN1Xd9cxAlZxhV2ZPf7WpR1VXMkC/1hB5K/jTaTQiBpG8ZCr4ydHyX
 TR7m51urv6S5c8Dpse3RIyf3mZVCw+/AG9GUqnexL/6B5v73LJSTFahy2izo5qvWWYwn
 xLxoE+aFxNAsJH58IraNHkCRFRhUAEk/Sc1RAP7I4siKELX8QBM0JpvtcloeCCXYnumu
 ZQYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678698380;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bhev4z8i7cRyDcQdQN1B0BbeMECVxNAmns4FuvOcp0I=;
 b=dw9SdCP6YhuBA5cu+Fu/6gxpAm/OP7lNGzJ8WfI6pXtoA2VWqcPP8csFCCBs4u445Z
 k3NQbcZE++ufXGJEVVByZaAhirNVBTEbatkmO76BSyL5YiBTH5afYs9dsLY6YR51P6Rf
 Js+FkPXPygNHx7YtsFCIez52y4u1QwtTstfH7/xerIdpT+5PWpt2Sh7R5u3yRNPyFKLO
 KclTcv4xL0fU7hWRUBxXGviTJcazwsTZj/fThf2efxuURx8ac7MjbxamWiDbmQrSWrwl
 ZQWKZgRaUcNXYz78nEEUJJZ34G2L3zmTmWTWneQ9kfPdtH91fvVX8Mln3fJQ76tQ/+Ln
 PPuA==
X-Gm-Message-State: AO0yUKWu0gr+7ZJ9IoksMjZy59s1MnTGPHDt6VtNxOX93Tgak6GydMmA
 qSh1+f5UXkAUdBwBBt/NRPesNg==
X-Google-Smtp-Source: AK7set/9LGwLLsHSEdQCFoX+K/JYEpsrTNO9WYnzPVS0+vntTKb80sMxu7ZftvwHUNuTbXYaqrpK8w==
X-Received: by 2002:a05:600c:cc6:b0:3ed:2949:9847 with SMTP id
 fk6-20020a05600c0cc600b003ed29499847mr602775wmb.10.1678698379944; 
 Mon, 13 Mar 2023 02:06:19 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 i10-20020a05600c354a00b003ed29b332b8sm597530wmq.35.2023.03.13.02.06.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 02:06:19 -0700 (PDT)
Message-ID: <32588d0e-a1f2-30c4-5e9f-e6e7c4190b65@linaro.org>
Date: Mon, 13 Mar 2023 10:06:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [RFC QEMU PATCH 04/18] virtio-gpu: CONTEXT_INIT feature
Content-Language: en-US
To: Huang Rui <ray.huang@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 Antonio Caggiano <antonio.caggiano@collabora.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Robert Beckett <bob.beckett@collabora.com>, qemu-devel@nongnu.org,
 xen-devel@lists.xenproject.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20230312092244.451465-1-ray.huang@amd.com>
 <20230312092244.451465-5-ray.huang@amd.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230312092244.451465-5-ray.huang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/3/23 10:22, Huang Rui wrote:
> From: Antonio Caggiano <antonio.caggiano@collabora.com>
> 
> Create virgl renderer context with flags using context_id when valid.
> The feature can be enabled via the context_init config option.
> A warning message will be emitted and the feature will not be used
> when linking with virglrenderer versions without context_init support.
> 
> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   hw/display/virtio-gpu-base.c   |  3 +++
>   hw/display/virtio-gpu-virgl.c  | 16 ++++++++++++++--
>   hw/display/virtio-gpu.c        |  2 ++
>   include/hw/virtio/virtio-gpu.h |  3 +++
>   meson.build                    |  4 ++++
>   5 files changed, 26 insertions(+), 2 deletions(-)


> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> index 9b5e3dc782..41712b79ee 100644
> --- a/hw/display/virtio-gpu-virgl.c
> +++ b/hw/display/virtio-gpu-virgl.c
> @@ -99,8 +99,20 @@ static void virgl_cmd_context_create(VirtIOGPU *g,
>       trace_virtio_gpu_cmd_ctx_create(cc.hdr.ctx_id,
>                                       cc.debug_name);
>   
> -    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen,
> -                                  cc.debug_name);
> +    if (cc.context_init) {
> +#ifdef HAVE_VIRGL_CONTEXT_INIT
> +        virgl_renderer_context_create_with_flags(cc.hdr.ctx_id,
> +                                                 cc.context_init,
> +                                                 cc.nlen,
> +                                                 cc.debug_name);
> +        return;
> +#else
> +        qemu_log_mask(LOG_UNIMP,
> +                      "Linked virglrenderer does not support context-init\n");

This is dubious, almost nobody will notice this log.

Can this happen? If so, this void function doesn't create any context...

> +#endif
> +    }
> +
> +    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen, cc.debug_name);
>   }


