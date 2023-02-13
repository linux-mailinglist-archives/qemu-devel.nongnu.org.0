Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A709F694725
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 14:36:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRYzU-0003JR-Qd; Mon, 13 Feb 2023 08:35:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRYzR-0003It-U0
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 08:35:30 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRYzP-00013T-Ry
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 08:35:29 -0500
Received: by mail-wr1-x42d.google.com with SMTP id bk16so12229207wrb.11
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 05:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kcwESzSeNZ102llc+oK1xR6dHBmpPj0FsnJI0QGj0h0=;
 b=UnzZPx4WWsBC204jztq3Ky9JRZk0bD+Tfk/KaIs3fPIl3zSNGZTFvBiDkjAp7wf6ah
 Mo7eCHk0G5qG3+98T27h+cKsggEnX6fR5lOkqPhRw5KdqnnnTAoSiJ5XWQOS4MH4bcQa
 1aEbdxPcjxeFAemXyUPiSnpXPxf0HjUcQAAVRYq4y+cEPthtu21yxG/vNpL7YO3/Gi4F
 N8YWXHCP4Ty8oNWIE4bkaajatSvwiGBk2T7b+iwCCJv+of+X0sX7L+DRLTxwnhk5Pvp2
 9dvVQwUZfbIqKu1vzm3E6Gky1mNK1cypyKMMfom5EVNS23KnihHJIYoTbjSeydFM484R
 243w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kcwESzSeNZ102llc+oK1xR6dHBmpPj0FsnJI0QGj0h0=;
 b=r32lKpSAeUAN+vfJaaHQySLRbGfuJhQ40PIdl+5AQdqAO9C7m4/07HS/TGaZUBzG3K
 ytAMtvoraybF17aszep4BrygOEGAi4KwkfURJzBT+zDjCJ5yNTYn5HE8kiJgDt25D0p5
 s+zVXQahlBiUzeUHYNNU+WrIGWdZ4RaGBOaZcbUZnKkZYKRGyMouQGJfMl4enIzABKqG
 8vTYdFb+/rGTw4kNHlJcWt6DbSynsqxC82BkPjDyzEcSVELQZMyrdAheWHhYnum+soSR
 l38F6Cc6rc7dPv0qvFZzF+poDn+1HSwgAxSHpYzYMiNsbMyyJsYefxWeCF0GVcxjXd6E
 ALoQ==
X-Gm-Message-State: AO0yUKUvXckTXldO01iLHuDLzGGZBaGnWuYM2V4pW/N4Do2IlGBW8tFx
 zncR5sYpkT7she2XaPu8QvveQQ==
X-Google-Smtp-Source: AK7set9mxfvlqVgF2UyUJQFeDrn9pCAFDmNJySSefgGFaFzf7vpF3TFJT4MpAXFvLHW+60Mc/VkMdA==
X-Received: by 2002:a5d:420b:0:b0:2c5:52b7:af88 with SMTP id
 n11-20020a5d420b000000b002c552b7af88mr4768065wrq.36.1676295326315; 
 Mon, 13 Feb 2023 05:35:26 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 q4-20020a05600000c400b002c54737e908sm8823163wrx.91.2023.02.13.05.35.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 05:35:25 -0800 (PST)
Message-ID: <f5fc6965-d69f-485c-99dd-5542c2e10ed6@linaro.org>
Date: Mon, 13 Feb 2023 14:35:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [RFC 41/52] machine: Introduce core_type() hook
Content-Language: en-US
To: Zhao Liu <zhao1.liu@linux.intel.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Zhenyu Wang <zhenyu.z.wang@intel.com>,
 Dapeng Mi <dapeng1.mi@intel.com>, Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>, Like Xu <like.xu.linux@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
 <20230213095035.158240-42-zhao1.liu@linux.intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230213095035.158240-42-zhao1.liu@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.345,
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

On 13/2/23 10:50, Zhao Liu wrote:
> From: Zhao Liu <zhao1.liu@intel.com>
> 
> Since supported core types are architecture specific, we need this hook
> to allow archs define its own parsing or validation method.
> 
> As the example, add the x86 core_type() which will be used in "-hybrid"
> parameter parsing.
> 
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>   hw/core/machine-topo.c | 14 ++++++++++++++
>   hw/core/machine.c      |  1 +
>   hw/i386/x86.c          | 15 +++++++++++++++
>   include/hw/boards.h    |  7 +++++++
>   4 files changed, 37 insertions(+)
> 
> diff --git a/hw/core/machine-topo.c b/hw/core/machine-topo.c
> index 12c05510c1b5..f9ab08a1252e 100644
> --- a/hw/core/machine-topo.c
> +++ b/hw/core/machine-topo.c
> @@ -352,3 +352,17 @@ void machine_parse_smp_config(MachineState *ms,
>           return;
>       }
>   }
> +
> +/*
> + * machine_parse_hybrid_core_type: the default hook to parse hybrid core
> + *                                 type corresponding to the coretype
> + *                                 string option.
> + */
> +int machine_parse_hybrid_core_type(MachineState *ms, const char *coretype)
> +{
> +    if (strcmp(coretype, "") == 0 || strcmp(coretype, "none") == 0) {
> +        return 0;
> +    }
> +
> +    return -1;

Shouldn't this use mc->core_type()? Where is it used?

> +}

