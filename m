Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CCC6041F4
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 12:50:57 +0200 (CEST)
Received: from localhost ([::1]:47756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol6f0-0005Wy-PF
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 06:50:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ol6Yf-00015N-Sy
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 06:44:21 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:38759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ol6Ye-0005Dl-05
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 06:44:21 -0400
Received: by mail-wr1-x42f.google.com with SMTP id j16so28455880wrh.5
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 03:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qdeaJX55sH31dG5hyU1Da1POz39+LgsgnxASJcUuNZc=;
 b=Yi4ARY+mHRWrHOYRqIUS8DQySqkvWtqiwtwhh7E9WKQCkDoii/ldkCt1pxBSQ90iet
 AGrzztLNZUM+l4PmxNx08+uGgRiRBIGE2JSvGX758UDAETXPNck9U35m4grY91KUN9UP
 k45QoTE2XNWSU4gLLAX87sZBzlpuoRGxwBRnofm9ODUGsB640BThktfeC+gwCn+CtxpP
 suAODdD7XMXVecaUnl61dfrSdqdsk8UxPSNtoxUzqpf0N15ZFSVqDYd+C41R0RYJR4yF
 NwZWQUx/Z84J62y5qXu3poZkNvFBoD1bsqMqkE/BRqDDEqjN7KRwKFoAVhjwizCTeWny
 yfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qdeaJX55sH31dG5hyU1Da1POz39+LgsgnxASJcUuNZc=;
 b=tuTQiyFQSSPABVCUhJ6mG5FMqKZvNEziob2/+HHB61hXLo9wZw4RGIDzRzOMetbw0f
 LRQBVcTxcUE/uI0i/FNZWG3lOsl5/h6k/FbLo5a2ahK/6QwS9PnQV0/dH5IjjzSogVqk
 TfnLgDhRY3On3WV+k/adS2iKjMrrbLYd9zcOZ+VIQH8WJomVbjQvNmIh8dzrY2pFlPkO
 H/8ZDkUa1w8QCQ64hoiSaG7qyXRgQowSj2ZlbSg/zEdQb4MLwkYiH9+2CH26TipL6EiB
 iYk1CLinfLp2HxLqhntaCKkhEsgIyPBYA+/1Pjic91WA4vAJzArdn1Pt8ttemBzlM/Sj
 Vbow==
X-Gm-Message-State: ACrzQf3+oN0Z3ARf8yjLCDUx/+RgxGx+i3mn2lxJ/Rnv96QweWGPxSQB
 g4RVnZzeZC/N10q9ExQeMjkt5A==
X-Google-Smtp-Source: AMsMyM59jhX1vFGcRAtMphxABbSR7dOtpbpeVT53Gy1hZCktN70biH0Ho/oV4Ep+O6Q9RkpLJ44gSg==
X-Received: by 2002:a5d:414c:0:b0:22c:de8a:d233 with SMTP id
 c12-20020a5d414c000000b0022cde8ad233mr4806983wrq.194.1666176258215; 
 Wed, 19 Oct 2022 03:44:18 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a5d4cd0000000b002302dc43d77sm13708102wrt.115.2022.10.19.03.44.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 03:44:17 -0700 (PDT)
Message-ID: <dbcf971a-54c9-7778-06af-16837e8cb1fc@linaro.org>
Date: Wed, 19 Oct 2022 12:44:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v3 04/15] target/arm: ensure KVM traps set appropriate
 MemTxAttrs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-5-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20220927141504.3886314-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/9/22 16:14, Alex Bennée wrote:
> Although most KVM users will use the in-kernel GIC emulation it is
> perfectly possible not to. In this case we need to ensure the
> MemTxAttrs are correctly populated so the GIC can divine the source
> CPU of the operation.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v3
>    - new for v3
> ---
>   target/arm/kvm.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)

>   void kvm_arm_vm_state_change(void *opaque, bool running, RunState state)
> @@ -1003,6 +1004,10 @@ int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
>       hwaddr xlat, len, doorbell_gpa;
>       MemoryRegionSection mrs;
>       MemoryRegion *mr;
> +    MemTxAttrs attrs = {
> +        .requester_type = MTRT_PCI,
> +        .requester_id = pci_requester_id(dev)
> +    };

Can we add a MEMTXATTRS_PCI() macro similar to MEMTXATTRS_CPU()?

   #define MEMTXATTRS_PCI(pci_dev) ((MemTxAttrs) \
                             {.requester_type = MTRT_PCI, \
                              .requester_id = pci_requester_id(pci_dev)})

So here we can use:

   MemTxAttrs attrs = MEMTXATTRS_PCI(dev);

> @@ -1012,8 +1017,7 @@ int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
>   
>       RCU_READ_LOCK_GUARD();
>   
> -    mr = address_space_translate(as, address, &xlat, &len, true,
> -                                 MEMTXATTRS_UNSPECIFIED);
> +    mr = address_space_translate(as, address, &xlat, &len, true, attrs);
>   
>       if (!mr) {
>           return 1;

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


