Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D86C548AB71
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 11:33:43 +0100 (CET)
Received: from localhost ([::1]:41108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7ETH-0000qM-0K
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 05:33:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7EQG-0006x3-U4
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 05:30:44 -0500
Received: from [2a00:1450:4864:20::330] (port=53801
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7EQE-0004vs-Lu
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 05:30:35 -0500
Received: by mail-wm1-x330.google.com with SMTP id l4so10639104wmq.3
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 02:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dVOJDwjM+qcM/oFPks0SC2G2hIciGSGPET+XwXRX3Lc=;
 b=WxLJXTgzs8DdAMs0LAsITzB/H38azh2/BJkIVqcw0TLTk//vhlM84hIIp7CMZLiWV9
 ctk/Dz5TMgUiG8nLMidtOdRnfDURLqVg/fw8IsgPAs90UpBPYthfKTW9C9AIUEpHyQXB
 WD9UGCGOS3J6A6021qC8KlsJhVDkGkIYe9Iu4HRUuW+BH+mThP434FEA+rqTbYkYoQ3H
 uaRnzipvJxnIeROoqoccPljDBDl0xtLiNWlk5OV5/gGBvTW9Hwbl/8rwhHaDzJhV7kPM
 NuUPeGtZqfRNbsSrEf/CIoBcoBn/xRrZBTVD20QJ2tWKFQ5ryrmL8c3d6znOffsw4Tsb
 5DxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dVOJDwjM+qcM/oFPks0SC2G2hIciGSGPET+XwXRX3Lc=;
 b=31SUx5vMJAmcz8NbsTGUYs9ha8wq1/BU8XZSvd4vxc9rhiYIPJimKN7saZNumSjabe
 YM8R2kC61hjXG3UHa+AIGs6bvi/bCsscOzGucopm3tPJQCDk997+AlQ1qV/QrIE8+gTt
 VhaH2tvlq0zBbD4GcR+COWYrdBCpTY4uCIvsBMhlRTfj4zml9Nz3t0oO4q8l7h67wYtl
 MxtVHZ2Ydd69mn64JzSDJpM4AVEH/S+11Bq/4WyG7t7Daomi+kXhfw5rRLlsx3Fa0Nuy
 4q5ULc4g4hKQ8yo/XZJagsVEZ0tuNG5d714zHzvFkwBuMWeORLcczTWwsU6mq/YAzCas
 4Xbw==
X-Gm-Message-State: AOAM533iENiY7PmtjQDGu7RLnJrUg0M0p57oxeBFV67kiIstIUuj6GAV
 nZFT32MInEkf1pXPDZqthcgkMre+7AsA43bY3Mc4Fw==
X-Google-Smtp-Source: ABdhPJxPtxxQe07kjvGB8uY8Mhch4tpk4yBp3znvBTwCgT5hbxI42eTvi/CTeCYAMu0Z27JEyOoRrCImvvm4KIbpAc4=
X-Received: by 2002:a05:600c:3ac5:: with SMTP id
 d5mr1882205wms.32.1641897032754; 
 Tue, 11 Jan 2022 02:30:32 -0800 (PST)
MIME-Version: 1.0
References: <20220111101934.115028-1-dgilbert@redhat.com>
In-Reply-To: <20220111101934.115028-1-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Jan 2022 10:30:21 +0000
Message-ID: <CAFEAcA-e61v6nTzH=Ep-KMVCJsVA=17O8CtDCLyk5DOtjVNgGw@mail.gmail.com>
Subject: Re: [PATCH] clock-vmstate: Add missing END_OF_LIST
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: damien.hedde@greensocs.com, alex.bennee@linaro.org, luc@lmichel.fr,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 11 Jan 2022 at 10:19, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> Add the missing VMSTATE_END_OF_LIST to vmstate_muldiv
>
> Fixes: 99abcbc7600 ("clock: Provide builtin multiplier/divider")
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  hw/core/clock-vmstate.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/core/clock-vmstate.c b/hw/core/clock-vmstate.c
> index 9d9174ffbd..7eccb6d4ea 100644
> --- a/hw/core/clock-vmstate.c
> +++ b/hw/core/clock-vmstate.c
> @@ -44,6 +44,7 @@ const VMStateDescription vmstate_muldiv = {
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT32(multiplier, Clock),
>          VMSTATE_UINT32(divider, Clock),
> +        VMSTATE_END_OF_LIST()
>      },
>  };

Oops :-(

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

We could maybe make this kind of bug more likely to be detected by
instead of having the terminator be an "all zeros" VMStateField,
having it check both for name == NULL and for a magic number in the
VMStateFlags field. That way (assuming something in "make check"
causes us to do a scan through every registered vmstate struct)
forgetting the terminator will be likely to cause us to crash or hang
rather than finding some 0 data and thinking that's the
terminator.

thanks
-- PMM

