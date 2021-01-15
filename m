Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 613102F7D44
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:56:10 +0100 (CET)
Received: from localhost ([::1]:48446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0PaD-0002x0-Do
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:56:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l0PEC-0000tU-AZ
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:33:25 -0500
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:42508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l0PE8-0007ux-Hm
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:33:24 -0500
Received: by mail-yb1-xb2c.google.com with SMTP id b11so2758938ybj.9
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 05:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KW1ia311CHdNv9ojQeYwfrENngfGFLYS4sPKtb6sMGU=;
 b=TJt9RzM1wsjAK03GP3uJHnPe5UPHxzJ0lT629pIhUKI8SIaSAbD3j99fNs+ePdTMgc
 OM018sROa/w6CRPyNIcDwJA8HMeM9shajf++MJKEVy1eBvTpCnLFeER6YGe7L7H1XGTN
 25RAJp/hQV8iyLU7GnrLieKvx308mHUEB2dycByrA0DaXeZzV/rQAJnnk1vmqM2iRwW8
 dmR0adNSr/KUrXrAR9w9vPb8d1azT8orqYPQO7O58+2SKQ/pwS3z2l+w1fDsiyMfcNfQ
 WoewVRiS4tGJ7PPLzxaWt3xSLObuEKxBE/spqnfdnkEpA+ZxVqyg7VHhqkAV/+rVPvWW
 LCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KW1ia311CHdNv9ojQeYwfrENngfGFLYS4sPKtb6sMGU=;
 b=iF+PwveeSKvEDgiVJxHT3U0kQRaARyO99FfLDv17hF46l6L6cnPGcTkFfgW5MDD6kJ
 72mEzi7ulKC37875+PT44l5MROTne+7eEUk17RmsjXCnd8+f4Hdiu022BVCJr+2V/PbN
 2mQgrutflOEdoswkst1oZem8RTxMti+DmrsmY8jG4ZJQ9BCWtmmv9bfkqmORYbyOWn1M
 Pc6/R5z5l9W0EXpbUqprgYKY9V6DjxQMc88tl/XJR8F7AJSah8jsbU4sJd59/oIgF2jG
 Kw7HXOUyCSJSnfXisvEPiFhk5x2x7DUpgGSaud+KxO8m6E8B+rmhPBUtroaV7iUxT3Rj
 2jAw==
X-Gm-Message-State: AOAM533UUmcIYW+hmtZElXeAqF+b1l0akO03sX9zeB5EaROi38tPSLH0
 EO6hutlJlVV/6z8AizqPWtyP//sSeCUbzUzYy5M=
X-Google-Smtp-Source: ABdhPJyhogCF9ge7jjxQSbpuOj/gVR7Oa7FYKpxCSBwMgpLQyogVApnnG+WuvRLier7A8PhBF+qIeeWsX30YHacoL/8=
X-Received: by 2002:a25:2041:: with SMTP id g62mr18759955ybg.152.1610717597833; 
 Fri, 15 Jan 2021 05:33:17 -0800 (PST)
MIME-Version: 1.0
References: <20201104092900.21214-1-green.wan@sifive.com>
 <CAFEAcA_EykbnmTQuz4RT3qGMt-Atf=EAdaHd-QqBvJCPvwemqA@mail.gmail.com>
In-Reply-To: <CAFEAcA_EykbnmTQuz4RT3qGMt-Atf=EAdaHd-QqBvJCPvwemqA@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 15 Jan 2021 21:33:06 +0800
Message-ID: <CAEUhbmULDEgfs0zkt6k1DWo+AD4T701xDp5TCyjQHFypmr037g@mail.gmail.com>
Subject: Re: [PATCH] hw/misc/sifive_u_otp: handling the fails of blk_pread and
 blk_pwrite
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alistair Francis <alistair23@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Green Wan <green.wan@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 15, 2021 at 7:50 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Ping! This patch was trying to fix a Coverity issue (CID 1435959,
> 1435960, 1435961) -- is anybody planning to review it?
>
> (I'm not entirely sure 'guest error' is the right warning category,
> but I don't know the specifics of this device.)
>

I think we should just use 'printf' instead of log a "guest error"
because the guest does nothing wrong.

Regards,
Bin

