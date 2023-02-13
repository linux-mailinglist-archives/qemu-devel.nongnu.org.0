Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DEC6946F5
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 14:27:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRYqu-0006VS-M8; Mon, 13 Feb 2023 08:26:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRYqI-0006Tv-Kl
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 08:26:13 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRYqF-0006nN-D6
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 08:26:01 -0500
Received: by mail-wm1-x32c.google.com with SMTP id n33so2692157wms.0
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 05:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l2W4wuwDVZ1RsnuJP0+S4eoWgL7Bmi6pdUcoaEe/Fp8=;
 b=jd4lvcZ2nPue1WGv2tcrh7TysddpMuh8sWXY3LAZm7SuYT4GNIQaQqiX1s0KUFkoGh
 tTIfJAXai/W64Xn1IEwZr97p9J6JRNyJjOWcq2he5FWeE8/BzvPUMCyPhaKXiqqyxECd
 5HlSSTOAsdcSf0Ev5w7xhF63kfrCvxiqp6rChfYcGOagMZ1qY6cBrYfKUc8nM/T2pYfo
 UfV0goSSDZz1rZoNmC4TIhm+Ppm49HaePkdTXmBHiHqrUzgtVX2KtOEte3e/V6uhv9n+
 iVbcwzgWITHLxsw5aRXL3WNWUUebfYfKASgDQ62RrVb1OXXJcptmDkbEN7OTT2IIvhYl
 DD2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l2W4wuwDVZ1RsnuJP0+S4eoWgL7Bmi6pdUcoaEe/Fp8=;
 b=UmKcCvzz0+ktY0DHzaf2d94HYnKQA/oFwivPnbkyJHTpCqF5+Dr3iHC9j5KanoEYIj
 LmUf06Q6bRKaXtNj03jiT1qn+OeEyp+2HkPLUeK2U8H49o4jJilvWaJh4bvjpme6EpQY
 bA6svAGhK9x/5kjHF9OfHHwjJI0kabrdCimn4Gq8dGcLAgeoYa59vJ4YdmKiQtyZQlSI
 XN1EpdOiHBpmyhDYhS1youZQ/+x0qKpa6TbPpzz21SJa9CLU+0ZhQuIp/76txI0trpcF
 iXkyv9qAn1P1CPpuDxxrBHx3+FuKnCEtzWz5FJSSIStzuxQwIUWbXUPv2HXkfWgD5DmJ
 i0jg==
X-Gm-Message-State: AO0yUKVoEPsmu4p2zuasIYSkoKPh0yCZZBpU5g1r/1XGMjkYY5J4MBY7
 k2651CqForvQJGConTGJuP4ihQ==
X-Google-Smtp-Source: AK7set9UkkKOw5g4COhrRiJKFhoRirjFvtSqZNdEYqEmvOXTtPPnTcflRYSTttzW7/NSNe911D6fZw==
X-Received: by 2002:a05:600c:2ac8:b0:3d9:fb59:c16b with SMTP id
 t8-20020a05600c2ac800b003d9fb59c16bmr18719663wme.36.1676294724576; 
 Mon, 13 Feb 2023 05:25:24 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 z4-20020a05600c220400b003dfe8c4c497sm17195195wml.39.2023.02.13.05.25.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 05:25:24 -0800 (PST)
Message-ID: <ba5a7345-0ef2-45f5-855b-b7e26919a6b1@linaro.org>
Date: Mon, 13 Feb 2023 14:25:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [RFC 32/52] i386: Rename X86CPUTopoInfo and its members to
 reflect relationship with APIC ID
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
 <20230213095035.158240-33-zhao1.liu@linux.intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230213095035.158240-33-zhao1.liu@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 13/2/23 10:50, Zhao Liu wrote:
> From: Zhao Liu <zhao1.liu@intel.com>
> 
> Rename X86CPUTopoInfo to X86ApicidTopoInfo, and also rename its members
> to max_{dies, modules, cores, threads} to avoid confusion with
> CPUState.topo.
> 
> Now the names can better reflect their relationship with APIC ID.
> 
> For hybrid CPU topology, X86ApicidTopoInfo will be different with
> CPUState.topo and keep the maximum possible number of topology
> structures in each topology level other than the actual topology
> information of a certain CPU. This is required for the APIC ID under the
> hybrid CPU topology.
> 
> Co-Developed-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
> Signed-off-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>   hw/i386/x86.c                | 18 ++++-----
>   include/hw/i386/topology.h   | 72 +++++++++++++++++++++++-------------
>   include/hw/i386/x86.h        |  2 +-
>   target/i386/cpu.c            | 20 +++++-----
>   tests/unit/test-x86-apicid.c | 50 ++++++++++++-------------
>   5 files changed, 91 insertions(+), 71 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


