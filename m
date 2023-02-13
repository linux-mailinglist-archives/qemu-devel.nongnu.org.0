Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCAA69471D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 14:33:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRYxV-0002Zv-DT; Mon, 13 Feb 2023 08:33:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRYxT-0002Zk-Tr
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 08:33:27 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRYxS-0000WL-7l
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 08:33:27 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 f47-20020a05600c492f00b003dc584a7b7eso11279560wmp.3
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 05:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qptqtBs2liw0ERq3y6Nr0iDhJnA2UCJVft0+omzThY0=;
 b=SDIibYeulxi0DwHFVUB7fvg7axjoSx6GD+4+rmZLJJcccHVAyam0d2e4UyRdaHoJRx
 r4o1fACUYV5lKngtsXxmhtxMpFCNVnYRvENuejPY5g/Z+Uqv0qSyClC4OvW+4Pya1642
 eGqxfrhLa8+fL9O/0SV+WQUo7XblZ6NCSFqcWVXHGK1goJS6p/IztdkraQyMrCwjr3W/
 sXH8ebSEaZWPPooQrvKeo2DVPtKJ68QRd63jQEPL5q10bKnsfiFUXnylqriK3k7PLz0Z
 NhfJLK5e4oBdbFnXrKCl5XFdetip6v79YIGlhV/yKsqNXLEK53lDGb3ads/L8Z7eIkXc
 FX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qptqtBs2liw0ERq3y6Nr0iDhJnA2UCJVft0+omzThY0=;
 b=jtt5PcdXrCu8wy8a6/UKus8iDnXn5bWVNtC9cGRJICJN+gHbI0DyHM0X87KJrl/jf/
 akJZt5nNDkaKKfHsRTDBJY29fLM7gv6+1c+tQa1hDVbC2eVx9SYFbravV9MQ4ZMsb0Ev
 nypp8vSfvxR/yVdKsNrNzYo+NTJ1l286+rM+K1rGHptcFwiwyzbBEf6cbeB6WbU2FCe7
 Z1nD+alSbH1Irt4vkA7DFxgB5a0/RKRzBFlQzoU8sNq2oKpxOJWfB80X5rBPY0EMlUau
 LNBYN7Pr6unKUeMjiYS94BzHVbyERdGmmg1PgmGumtjWCPDVYgtxymYAspsvhUhLa+8f
 lBHw==
X-Gm-Message-State: AO0yUKUqUXGNT43J9PZMUMnNa1/b5xcmnz76Hpe7FbgIh1/jyP7lDo/R
 PNKkqSNCFNHaoK0CDT4F8+v3hA==
X-Google-Smtp-Source: AK7set8Q6yiwXTBBVP6laV2bc9R8zqOv3URf2j77kfgf1vxxhCj+cX/FajGtrToZXPNz7Zj7yGR6Gw==
X-Received: by 2002:a05:600c:704:b0:3df:d8c5:ec18 with SMTP id
 i4-20020a05600c070400b003dfd8c5ec18mr19399799wmn.13.1676295204525; 
 Mon, 13 Feb 2023 05:33:24 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 e14-20020adfe7ce000000b002c54f367fe4sm5890843wrn.100.2023.02.13.05.33.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 05:33:24 -0800 (PST)
Message-ID: <7d7c7914-ea9e-051f-2f86-840b251be5a9@linaro.org>
Date: Mon, 13 Feb 2023 14:33:22 +0100
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
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

What would be a "core type" for other archs?

> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>   hw/core/machine-topo.c | 14 ++++++++++++++
>   hw/core/machine.c      |  1 +
>   hw/i386/x86.c          | 15 +++++++++++++++
>   include/hw/boards.h    |  7 +++++++
>   4 files changed, 37 insertions(+)


> index 9364c90d5f1a..34ec035b5c9f 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -36,6 +36,7 @@ void machine_set_cpu_numa_node(MachineState *machine,
>                                  Error **errp);
>   void machine_parse_smp_config(MachineState *ms,
>                                 const SMPConfiguration *config, Error **errp);
> +int machine_parse_hybrid_core_type(MachineState *ms, const char *coretype);
>   
>   /**
>    * machine_class_allow_dynamic_sysbus_dev: Add type to list of valid devices
> @@ -199,6 +200,11 @@ typedef struct {
>    *    Return the type of KVM corresponding to the kvm-type string option or
>    *    computed based on other criteria such as the host kernel capabilities.
>    *    kvm-type may be NULL if it is not needed.
> + * @core_type:
> + *    Return the type of hybrid cores corresponding to the coretype string
> + *    option. The default hook only accept "none" or "" since the most generic
> + *    core topology should not specify any specific core type. Each arch can
> + *    define its own core_type() hook to override the default one.
>    * @numa_mem_supported:
>    *    true if '--numa node.mem' option is supported and false otherwise
>    * @hotplug_allowed:
> @@ -237,6 +243,7 @@ struct MachineClass {
>       void (*reset)(MachineState *state, ShutdownCause reason);
>       void (*wakeup)(MachineState *state);
>       int (*kvm_type)(MachineState *machine, const char *arg);
> +    int (*core_type)(MachineState *state, const char *type);
>   
>       BlockInterfaceType block_default_type;
>       int units_per_default_bus;


