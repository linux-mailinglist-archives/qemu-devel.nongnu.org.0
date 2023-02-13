Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC91B6946B9
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 14:14:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRYeT-0008Or-F7; Mon, 13 Feb 2023 08:13:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRYeP-0008N2-CC
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 08:13:48 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRYeN-0004T0-Ii
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 08:13:45 -0500
Received: by mail-wm1-x32c.google.com with SMTP id o36so8693646wms.1
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 05:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DSpLRRP1Wl4S7nqFs66kHdZdq3jLjnNriDWCB1RcpcI=;
 b=TtIUbjOZ6Z3gZzeSIpZVIg38tB1CxUvVcUme5nMS/KHhKhxfgbIQ/d+o/Ze7WGxhWh
 txXcrdgFV77NdwTmAJn0IGtY/NWtwT0Nh1Vaw5yA58MNFXBHbuDhZS8YmFC5MdGpMMXq
 2wdAqiViAHsmDa/lgia8b2TWMt5iVAgxV+RgrscGhnhsdsHx4XxvGCrKHIwqws6gDBhf
 Q4q7gLAA4GC2gtE6YSOuABUiJsVIcsIidzVWIHzBdBAp0ftZPW1QgbBbuvc6F2UIGkYl
 jgqFIYyRzdfnmKcRZovwI2Qcku14yxNoIXicUQdeXgSkeNbRKJZ8LmHZ8ielzr+Mwxjf
 NU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DSpLRRP1Wl4S7nqFs66kHdZdq3jLjnNriDWCB1RcpcI=;
 b=sPb3AidP2zIuicACLNBNwSOitYyk+OQPbqSJWkMa2rSzlVP5j8QZtKnFdUFFRNApXm
 lSuXBr6EyLC3bH7TVd8N03sflP7/eK1Tmh3HAB6smzI5gQqgX8yeim1DHOyNZc2i74go
 Ed1G4Gyd7Luh6ZY5l8WNelSjzcKPkMLCopShwbAIaep9MN/BnG/GN8AMqhrN1E53CXQP
 5fli0hzbRxBAn1RIK59m1Qqt6pv3YW9b7JxPs6W6VQ+YsSvEm/EN75UqX7WeuPSW02bN
 CnV70scHf+od6ChMsqbstn6s5oF4l5CScGhrXlWdwEN+wEAjudGFZ4Tn1U1/jHNlQwfY
 TIDQ==
X-Gm-Message-State: AO0yUKVyB0OZpif4jKq8IgSzALYJIx0i4MD5S/p3iiw6JeHn89wMGUgS
 fO6kveEcMCcufQQKASISW0a3jw==
X-Google-Smtp-Source: AK7set8XBNgECKa7WA9e9QXawP3G4SHT3ofRJOgSyV/vmvvSuGO5XUzgXvaX6A3Jdpm5B+PoP5ngtw==
X-Received: by 2002:a05:600c:3ac9:b0:3df:9858:c030 with SMTP id
 d9-20020a05600c3ac900b003df9858c030mr5706804wms.5.1676294022048; 
 Mon, 13 Feb 2023 05:13:42 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 b18-20020a05600c4e1200b003e00c453447sm17365495wmq.48.2023.02.13.05.13.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 05:13:41 -0800 (PST)
Message-ID: <9995a184-df44-6680-174f-14fc0b5c2425@linaro.org>
Date: Mon, 13 Feb 2023 14:13:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [RFC 09/52] hw/machine: Introduce core type for hybrid topology
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
 <20230213095035.158240-10-zhao1.liu@linux.intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230213095035.158240-10-zhao1.liu@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

On 13/2/23 10:49, Zhao Liu wrote:
> From: Zhao Liu <zhao1.liu@intel.com>
> 
> Under the hybrid cpu topology, some CPUs care about the core type.
> For example, Intel's Alder Lake series CPU contains two types of cores:
> Intel Core and Intel Atom. The type information of these two types is
> exposed in 1A leaf of CPUID.
> 
> Core type should also be part of the hybrid topology, and
> MachineState.cpu_type cannot provide different type information for
> different cpus in the same machine, so add a type field for the core
> level in the hybrid cpu topology.
> 
> Additionally, add a helper to get core type information from
> MachineState. Though core_type is only used in hybrid case, don't
> use assert since it may be used to initialize some generic fields.
> 
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>   hw/core/machine-topo.c        | 12 ++++++++++++
>   include/hw/boards.h           |  3 +++
>   include/hw/cpu/cpu-topology.h |  2 ++
>   3 files changed, 17 insertions(+)
> 
> diff --git a/hw/core/machine-topo.c b/hw/core/machine-topo.c
> index b20160479629..e0ec07b53d42 100644
> --- a/hw/core/machine-topo.c
> +++ b/hw/core/machine-topo.c
> @@ -51,6 +51,18 @@ unsigned int machine_topo_get_smp_threads(const MachineState *ms)
>       return ms->topo.smp.threads;
>   }
>   
> +unsigned int machine_topo_get_hybrid_core_type(const MachineState *ms,
> +                                               unsigned int cluster_id,
> +                                               unsigned int core_id)
> +{
> +    if (!machine_topo_is_smp(ms)) {
> +        return ms->topo.hybrid.cluster_list[cluster_id]
> +                       .core_list[core_id].core_type;
> +    } else {
> +        return 0;

Is '0' an invalid type?

> +    }
> +}


