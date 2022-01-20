Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1CB4956F8
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 00:27:46 +0100 (CET)
Received: from localhost ([::1]:53238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAgqH-0002hV-Hl
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 18:27:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAepS-0006jv-9e
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 16:18:46 -0500
Received: from [2a00:1450:4864:20::32e] (port=36396
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAepQ-0008Qz-CQ
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 16:18:45 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 i187-20020a1c3bc4000000b0034d2ed1be2aso23387256wma.1
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 13:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=SZoyRE4hmp8fv37kfVV8RJPgL+EEt3v+09pKEZmWZiI=;
 b=isGcurAcjY+ZPhIGKtMabY50Muz03ggKg6j3fMxMsvd/rfXWRNbu1y2O/77limkCjb
 zIV4n4aQ8UnGVuxGh85xQ7vLPajKrTpi8ZaKYh+0eIQIMLM6YdlCuhKC8u47t4r5uF9M
 iICLMawyGXnzBUDNmzVWxp1FvX3ufkyHBNDxiRc7mVgWqxVdc9lR653HJesQDvTQSMYq
 dl3H4mSHy/PhVQxCV8RJUhbYHqEKj9BlHY9YwdX/gFVxhxVa/RxMwRYQdaDr+7KQsTn5
 wgYZcYrn2s3xYQB2IInyeO2zNraaCBRfe8mdCInN1XBcQAn5iwBm7V0P0Nngq5gfPdpO
 wpmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=SZoyRE4hmp8fv37kfVV8RJPgL+EEt3v+09pKEZmWZiI=;
 b=wc2fu7fQnusw9yyA5zfjeFnmTukQdtRdqVeXhPLCth4uDaeOBkE3fx1XXRaV+i13m2
 hwH8Aq47ZmJEmKfKDKTrCm2H8LGdFxijH21wyaGiaWSoQo0d35PCW0OVtlct6kqAEy3s
 /WbZZZLgsmbkls/GDmLz2gv3zTjUhdkVpUGKjjyH5Q8175HkLhjgW6ex0cgAZcsgmCzT
 O4ZvK+hXptXi7nuVBuUoQJjN/0jdsYMD/LhrVm5cZyjww34tdWWlj0pkuDE8W8qXueYr
 7Fu8n/UrfEQkfgbwQHSLiIAlfyP1Radv+wPV56bil4vKkALsF9Kcj/HLf4xD65RUSlOC
 1BoQ==
X-Gm-Message-State: AOAM5328l9cKu6Y+0bqO+JgaK4jdZ4owYVDoxyOl6WFq5d+ewWDxHuP+
 1AAq9Dooqpd2WDhJTMOJxTqhlifq+pe+cuWMGHz9LbEeT+0=
X-Google-Smtp-Source: ABdhPJyoOSfZGamgjjZIeFq7s9PtIPON2JTxXnqHBt2hVlNmc4976mCcolsnP4hhPAOnGtZJHcemIltORjs6VwbyKWw=
X-Received: by 2002:a5d:644a:: with SMTP id d10mr846787wrw.295.1642713516324; 
 Thu, 20 Jan 2022 13:18:36 -0800 (PST)
MIME-Version: 1.0
References: <20220120161252.452657-1-peter.maydell@linaro.org>
In-Reply-To: <20220120161252.452657-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Jan 2022 21:18:25 +0000
Message-ID: <CAFEAcA8K1qhLUGR9JDuTjKxUr458n-0Mb+z0nO_hbTugqzBp9g@mail.gmail.com>
Subject: Re: [PULL v2 00/38] target-arm queue
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Thu, 20 Jan 2022 at 16:12, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> v1->v2: fix up format string issues in aspeed_i3c.c
>
> -- PMM
>
> The following changes since commit b10d00d8811fa4eed4862963273d7353ce310c82:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/seabios-20220118-pull-request' into staging (2022-01-19 18:46:28 +0000)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220120-1
>
> for you to fetch changes up to b9d383ab797f54ae5fa8746117770709921dc529:
>
>   hw/intc/arm_gicv3: Check for !MEMTX_OK instead of MEMTX_ERROR (2022-01-20 16:04:58 +0000)
>
> ----------------------------------------------------------------
> target-arm:
>  * hw/intc/arm_gicv3_its: Fix various minor bugs
>  * hw/arm/aspeed: Add the i3c device to the AST2600 SoC
>  * hw/arm: kudo: add lm75s behind bus 1 switch at 75
>  * hw/arm/virt: Fix support for running guests on hosts
>    with restricted IPA ranges
>  * hw/intc/arm_gic: Allow reset of the running priority
>  * hw/intc/arm_gic: Implement read of GICC_IIDR
>  * hw/arm/virt: Support for virtio-mem-pci
>  * hw/arm/virt: Support CPU cluster on ARM virt machine
>  * docs/can: convert to restructuredText
>  * hw/net: Move MV88W8618 network device out of hw/arm/ directory
>  * hw/arm/virt: KVM: Enable PAuth when supported by the host
>



Applied to target-arm.next, thanks.

-- PMM

