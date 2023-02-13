Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D66366946AE
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 14:11:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRYbE-0006Qi-K0; Mon, 13 Feb 2023 08:10:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRYbD-0006QN-6p
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 08:10:27 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRYb8-0003nr-Fk
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 08:10:26 -0500
Received: by mail-wr1-x42a.google.com with SMTP id a2so12163485wrd.6
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 05:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I3R2VSYowHdYavsVzTe5od/0gTer9oqqyhuXnBrmOqk=;
 b=oRt7QCU3TD7flN/H85gYcM3GU7701i8QU0TpDzmVnKClxGuuZ7R5W8Wgq0bA97rWUZ
 ga++KOa1a5Goexn58F/4DDW1qT4f5ESLRpP4+QE4oeB6FTu53MI//FqzIvofIZH34F10
 h1w0EVlbr7eBDgQBZ0Jk2RWumqdxdYkTR4IXXZQ03RRqmweBLqLrlg11R6E5/caUD+zN
 VyygDZrd7raqsqXgx+XPrQ/WhuZmtGKaFjtfkKzH3vBYGoEBuX5HVmzsMY1aOEUZhgLw
 keusW8EpKqTNlaIF4Hn1kIn020qHrSfFAvGX08t+V22UZeOqWWMCsAswDGSZmdC3rDep
 qIpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I3R2VSYowHdYavsVzTe5od/0gTer9oqqyhuXnBrmOqk=;
 b=7RD58VcwkQ6HLA8nY8c/qqttPd9MXqAraRICpkphmr+Dfepa7P/1tWkdCvV1vp2qII
 QlqQaSukkRDrbD6ov6wHozte/C+EbVWXKPYuv70D04xtzHPy+5Xvx5p7R4KQAh3IJwlL
 Ca91AUyzX15kLklZ0XU3euRdoGHl8VAUZfSZVD5dXONy9idaeym99BiFdxSyNSZbDUbu
 JlV5+b59SoZEKBeYc0CoKDmmuIwrx5LVQL2dSicnf3KhNWCeFNGM/uX4pjMiuowP3DJg
 JxwlE74INsFtc3FFX67s3s90r0i88+tsOQV8hdailA3deel8xIlgINvjy+t31GVfOWGB
 SwAw==
X-Gm-Message-State: AO0yUKVwX3MfBZaeRJstXGpOlKTfuiVY5i7TYGow+EhXybJUxOVgcKKh
 1XSff+sd/6kjT9ycSexrA9XLIw==
X-Google-Smtp-Source: AK7set8gKpiSWwon351L7l+52hT5V8DJWYPom7IY0EvUGia7rwTPJcf2+dkWZsDrcQa3RNgLuz02bg==
X-Received: by 2002:a5d:4d06:0:b0:2c4:80a:e852 with SMTP id
 z6-20020a5d4d06000000b002c4080ae852mr14319491wrt.65.1676293820827; 
 Mon, 13 Feb 2023 05:10:20 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h5-20020a5d5045000000b002c54d9fbea5sm6353798wrt.73.2023.02.13.05.10.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 05:10:20 -0800 (PST)
Message-ID: <d0fa7c07-824a-6dfb-2eaf-2e8f72aa7ad6@linaro.org>
Date: Mon, 13 Feb 2023 14:10:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [RFC 06/52] hw/cpu: Introduce hybrid CPU topology
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
 <20230213095035.158240-7-zhao1.liu@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230213095035.158240-7-zhao1.liu@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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
> For smp systems, the parts in one topology level are the same. But now
> there are more and more systems with hybrid architectures. Different
> parts of the same topology level may have differences. For example,
> Intel's Alder Lake series CPU has two types of cores, so the CPU
> topology is no longer symmetrical.
> 
> The hybrid topology is compatible with the smp topology type, that is,
> different parts on the same level of the hybrid topology can set to be
> the same, but the hybrid topology will introduce more complexity (need
> to allocate more memory, organized with array or linked-list), so the
> original smp topology support is retained while introducing the hybrid
> topology, and the hybrid topology is only built when the hybrid is
> explicitly required.
> 
> Therefore, we introduce the definition support of hybrid cpu topology
> here. At the same time, in order to unify with the original smp, we
> introduce a new cpu topology structure that can support smp topology
> or hybrid topology. This structure will replace the CpuTopology type (in
> include/hw/boards.h) used by MachineState.smp.
> 
> As for now, we only support two hybrid topology levels: core and
> cluster.
> 
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>   MAINTAINERS                   |   1 +
>   include/hw/cpu/cpu-topology.h | 117 ++++++++++++++++++++++++++++++++++
>   qapi/machine.json             |  12 ++++
>   3 files changed, 130 insertions(+)
>   create mode 100644 include/hw/cpu/cpu-topology.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 58794885ced3..918a9418d98e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1742,6 +1742,7 @@ F: qapi/machine-target.json
>   F: include/hw/boards.h
>   F: include/hw/core/cpu.h
>   F: include/hw/cpu/cluster.h
> +F: include/hw/cpu/cpu-topology.h
>   F: include/sysemu/numa.h
>   F: tests/unit/test-smp-parse.c
>   T: git https://gitlab.com/ehabkost/qemu.git machine-next

Worth splitting this section in 2, machine VS numa/clusters?

