Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 266212EFB34
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 23:26:20 +0100 (CET)
Received: from localhost ([::1]:34522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky0D5-0004rk-8d
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 17:26:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ky0B4-00041G-6G
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 17:24:14 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:36301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ky0B2-0007rP-Hr
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 17:24:13 -0500
Received: by mail-ed1-x534.google.com with SMTP id b2so12764658edm.3
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 14:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EkaMjEMklMlvNUqOOKFls5lK7dDrMPFaiKVpB/t3InE=;
 b=KAKN+iz+IhAORE2RVYQzF1wc719+RF6QXsRx7JxaBaiizilKmPEsxC6ETRK19aIJaP
 wy5pJg6CC/VvQXRAbfFsccX0mFzci6RjDOxABut/7X/7bd3cGKXIR3vzwI7wE6u6qs2L
 uJ6ttZwZh2LxuXNQKvRESSEo3/Hx37BwsJ/Mz5+uTTZKlvWGy9qzLESYce208U8SANFX
 2aFLeMixciMOhIHPvV95kOYPPZUUyX5LKcEPHQZi/Y9A17yvTSfojtQF6PVkoUFOTnXU
 nr7S4BYDOCZjS1vWoUXEaCHvKtDGBPWr5SYR21oMVHBXkqx7U7wUI7XBMD16sO89xhnu
 HvxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EkaMjEMklMlvNUqOOKFls5lK7dDrMPFaiKVpB/t3InE=;
 b=RzCRXAd9avBTqQI7VLCxhu74Nbu+F5ZA6P2nT++n94THzldmmMVyPrsQStHq50haIK
 1Dd52zNX2vc4HxtpbEGRZAoybX98JcM3afepK1HnJMYtqVNsQn8S2YDmm632Ph7z/8jO
 RAvFb7hae3Im3pP2OLJX4BxMP+B+2LP2BVmAzgN4gXFzdO/cWCY1AzfyuZCrso2VpiBt
 ayCWhJsyIGefvJf59Hut1IQzu0X4NqZ/4G5xyIiUStBszzfl5ckqaxGpEKbLq2AcOEGo
 qihe/AJbohNNuiM/rl008YGtvcBoT8NtCvVdLriC1vjhf7nBtPpORfgHNuQnzn3k0Xqu
 QCaA==
X-Gm-Message-State: AOAM533QYCtH73PzT4qbLko4zba2ZaKmKpDPsYvs5APQ628DR8W8jLPU
 SOQFzTj/g0hkbgpfWKKO0fZ93jwzqbQwe7hIYMIprg==
X-Google-Smtp-Source: ABdhPJxTk4UcnfNf9FGu/NhTgh8CbK2fG11J5foxE6lh7J4OF6HdLEw+tbde9tSdjUESwqRd1aM6QKjMYknNc6+P/WY=
X-Received: by 2002:a50:fd18:: with SMTP id i24mr6907871eds.146.1610144651158; 
 Fri, 08 Jan 2021 14:24:11 -0800 (PST)
MIME-Version: 1.0
References: <cover.1610143658.git.balaton@eik.bme.hu>
 <8c65807fc7dc1c4c4f6320f2fd6409a3091c88ff.1610143658.git.balaton@eik.bme.hu>
In-Reply-To: <8c65807fc7dc1c4c4f6320f2fd6409a3091c88ff.1610143658.git.balaton@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Jan 2021 22:23:59 +0000
Message-ID: <CAFEAcA9xP-w-JPerXVw-5Sk-Q7OeuLQyfhJwbsmiKcAH45mx7Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] Revert "ppc4xx: Move common dependency on serial
 to common option"
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 8 Jan 2021 at 22:17, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
> This reverts commit e6d5106786 which was added mistakenly. While this
> change works it was suggested during review that keeping dependencies
> explicit for each board may be better than listing them in a common
> option so keep the previous version and revert this change.
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/ppc/Kconfig | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

