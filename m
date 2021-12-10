Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6B7470552
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 17:08:30 +0100 (CET)
Received: from localhost ([::1]:50640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mviRh-0004rk-Pd
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 11:08:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mviO7-00018O-6p
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 11:04:49 -0500
Received: from [2a00:1450:4864:20::432] (port=42557
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mviO4-0007fW-7i
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 11:04:45 -0500
Received: by mail-wr1-x432.google.com with SMTP id c4so15676464wrd.9
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 08:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YHB1n6WVKuZoX+3Hb5MTgygY33Gs0xSYu1norQwomk8=;
 b=sZdc5KknzRC9w3pezBkJpEMBqJYK6p7z4HHGAWNVoVhLCTfH8Qbv96TLBCK6h19i55
 jFwYknxKwRnGyWDUl5DyfBpJwvsOXnm8koCFK18zb1uD6xMln9c4/vVnJ3KM/sxBWckK
 jPpzGDzmjugfYCiJJyGYCuhx9sVr6gCvGjFrOuYjmvDGWh57CkXKOgh6j5z5bTXGRUOE
 3lsfSG47Mv9eKECOCIoSlMEHxMy+a2r7jI5DuvvgyVvU9PHf6dUUsxLHXcmmZurDvuwH
 T98OpHgk36WAzKm6B5DJjcz48JraHRKss47S9T8RDxoUsRILp/0jfwV49acCXSPfCoXx
 8WhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YHB1n6WVKuZoX+3Hb5MTgygY33Gs0xSYu1norQwomk8=;
 b=PVZi/hL9ccZBPl84Ipl24fjj+ZdD8Y9KiFQ6hy4evn0EIFgCgBdiHwnul12MYeD4Sz
 9IevjcL17HNZj08jNOVlW2TmLD6uoNDiTrzO0Bxw5ng76qQg8R3dmhwnNMUUvZ3lbn5Q
 DyrjCxWuagWoSzdPXl3BXC542HtShdy8T6HZvADRJr2sCfWMZVn6BVkV2h/IM0Zbntp6
 0kjlraLs/Sd5gvn4T5nFnlGqPo8/GSxYInRZx7sa3KQGlKt4P2MGlVqrLvI0STpJip/b
 klLRFXUoO1sKjBFvPAqnssAfaJs3cAwLgxHO1iYyDGeBNKIijdyJz6y8dIeaSgnj+odf
 qL1A==
X-Gm-Message-State: AOAM533lLqKxUQO2B27tqJXYFTHLTFNBARa5TJflLmbeI5cLEf5qamIe
 wPILDkkbzc0Vea4HyksNsxUuJXXpAyOKeD79yGIRHA==
X-Google-Smtp-Source: ABdhPJwPN2VvBHLA98vGhjjpbsj5j9DXe0Vq8DNiIerLn1tIX2PfF8lxNlQODipsoxNwW6jQZu4GFhaosWTo3trJKjE=
X-Received: by 2002:a05:6000:156a:: with SMTP id
 10mr14858700wrz.87.1639152282598; 
 Fri, 10 Dec 2021 08:04:42 -0800 (PST)
MIME-Version: 1.0
References: <20211201154023.13931-1-francisco.iglesias@xilinx.com>
 <20211201154023.13931-8-francisco.iglesias@xilinx.com>
In-Reply-To: <20211201154023.13931-8-francisco.iglesias@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Dec 2021 16:04:30 +0000
Message-ID: <CAFEAcA9o0G=exxuLQUvwRGG8DL-8R0F6nfWL=Dk5rzmDsKqMzQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/11] hw/arm/xlnx-versal: Connect the OSPI flash
 memory controller model
To: Francisco Iglesias <francisco.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, qemu-devel@nongnu.org, alistair23@gmail.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 1 Dec 2021 at 15:40, Francisco Iglesias
<francisco.iglesias@xilinx.com> wrote:
>
> Connect the OSPI flash memory controller model (including the source and
> destination DMA).
>
> Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  hw/arm/xlnx-versal.c         | 88 ++++++++++++++++++++++++++++++++++++++++++++
>  include/hw/arm/xlnx-versal.h | 20 ++++++++++
>  2 files changed, 108 insertions(+)

> +    /* OSPI irq */
> +    object_initialize_child(OBJECT(s), "ospi-irq",
> +                            &s->pmc.iou.ospi.irq, TYPE_OR_IRQ);

Can you give this device a name with "OR" in it, eg "ospi-or-irq"
or "ospi-or-gate" or something, please? "ospi-irq" suggests it's just
a single IRQ line.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

