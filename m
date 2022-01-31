Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 417534A3E94
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 09:28:54 +0100 (CET)
Received: from localhost ([::1]:41170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nES3R-00008w-B3
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 03:28:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nERwe-00064t-A0
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 03:21:53 -0500
Received: from [2607:f8b0:4864:20::436] (port=42499
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nERwc-00060f-CK
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 03:21:51 -0500
Received: by mail-pf1-x436.google.com with SMTP id i65so12241072pfc.9
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 00:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ljWvpFt4w2K+iPWC2Z/5zDvFpBK9z+O6BwKulAtbxho=;
 b=gBvpsqLU1yP+L3zJkxIdc2fspGQOhA/rNM5ckUU31aJFZhoUsAxjwgx81msJqJmoLF
 ZIuyRDnzCeM2JfKoMzG2wrS1JGw9wTHamQ4ljepkQQaEJUbIKAYXL3394ASAUV0qr/6v
 vLePZiZpCrOoUEjtGmPwPzqFMbCSDE9LC+cL11LISHhk/C1DBCDiNvrXZin6lyIm0zSx
 yOptGpdFKQ5It/q+ceUoSfnqy1eRQK28mgBWPZqzWL9ocCAfbNMqvN4P26XEUMaC920b
 pdRiJDOUpgofx18sxrDiX9OXCB98rd0KeO4sO4JayOzPTujMldW7W8GLat2pIt73OItG
 VH+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ljWvpFt4w2K+iPWC2Z/5zDvFpBK9z+O6BwKulAtbxho=;
 b=TvfEdesqgsE6+3683sOv7+l6xJ11CD4t2sgZkTmxSxniI3z6RWGBbV7l47obM77weT
 QLp9jxKhdAwr8yLOsCDeXw/5IK0jqwS0NidePQp9lXZiEK6D5zr1J7+e556iNYpOJq0U
 Szr6cfDPKOYBi6ACoVKUwq5kduGP/+7uatyF13NgBrfSjwHBSkwKGoBNaAwc3+6eRCgi
 jEIOTVgeKE+Qh6Mm2KBdVCptAImx5FvXb1viWTs4VixAzBGJtbpUPMKGFBMcl0VbKGVS
 6KN76ysg1P3cDNW03APAbmGjBQ9NzuePOTHz5GcqVIsvv3+KUU8TOSCExiOgc+C8HUEj
 SzEQ==
X-Gm-Message-State: AOAM532vFGoAnXyYIZiFjb0tiHb1z2yLxXihs7vTnAW/4Kqyz8mVE3zk
 FBliOWaMVpXeL6yjyyUq+AJL9w==
X-Google-Smtp-Source: ABdhPJz2/R6L8rp9hfR3XZChqwnWOhokCFZCz+F/vWfvPSNI/+Klnkgi8ZDsk99HugjXhSQM29aPKw==
X-Received: by 2002:a05:6a00:889:: with SMTP id q9mr735820pfj.23.1643617308944; 
 Mon, 31 Jan 2022 00:21:48 -0800 (PST)
Received: from [192.168.15.130] ([60.231.85.5])
 by smtp.gmail.com with ESMTPSA id kx11sm9941061pjb.1.2022.01.31.00.21.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 00:21:48 -0800 (PST)
Message-ID: <f10fda55-eeb3-fa07-9b10-63d5509f1c38@linaro.org>
Date: Mon, 31 Jan 2022 19:21:38 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 16/16] hw/arm/boot: Drop existing dtb /psci node rather
 than retaining it
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
 <20220127154639.2090164-17-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220127154639.2090164-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Rob Herring <robh@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Andre Przywara <andre.przywara@arm.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Beniamino Galvani <b.galvani@gmail.com>, Tyrone Ting <kfting@nuvoton.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Alexander Graf <agraf@csgraf.de>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/22 02:46, Peter Maydell wrote:
> If we're using PSCI emulation, we add a /psci node to the device tree
> we pass to the guest.  At the moment, if the dtb already has a /psci
> node in it, we retain it, rather than replacing it. (This behaviour
> was added in commit c39770cd637765 in 2018.)
> 
> This is a problem if the existing node doesn't match our PSCI
> emulation.  In particular, it might specify the wrong method (HVC vs
> SMC), or wrong function IDs for cpu_suspend/cpu_off/etc, in which
> case the guest will not get the behaviour it wants when it makes PSCI
> calls.
> 
> An example of this is trying to boot the highbank or midway board
> models using the device tree supplied in the kernel sources: this
> device tree includes a /psci node that specifies function IDs that
> don't match the (PSCI 0.2 compliant) IDs that QEMU uses.  The dtb
> cpu_suspend function ID happens to match the PSCI 0.2 cpu_off ID, so
> the guest hangs after booting when the kernel tries to idle the CPU
> and instead it gets turned off.
> 
> Instead of retaining an existing /psci node, delete it entirely
> and replace it with a node whose properties match QEMU's PSCI
> emulation behaviour. This matches the way we handle /memory nodes,
> where we also delete any existing nodes and write in ones that
> match the way QEMU is going to behave.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I'm not confident about the FDT API to use to remove an
> existing node -- I used qemu_fdt_nop_node() as that matches the
> code in boot.c that's removing the memory nodes. There is
> also an fdt_del_node(), though...

It all depends on whether we've got saved offsets for nodes in the DTB, I guess. 
fdt_del_node says that it changes node offsets, and fdt_nop_node says that it doesn't.

Anyway,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

