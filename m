Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A524A4E43AD
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 16:58:09 +0100 (CET)
Received: from localhost ([::1]:57922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWgtc-00083Z-PL
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 11:58:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nWgs0-0006S3-K7
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 11:56:28 -0400
Received: from [2607:f8b0:4864:20::b2e] (port=46632
 helo=mail-yb1-xb2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nWgry-000363-Tw
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 11:56:28 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id v130so34387356ybe.13
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 08:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ScJMrFlzrL75xvqe+jXTJooANOeB/UChAvvQsLs3ty0=;
 b=lQjw3yIUShb2Z4y422cfMwJQNleIJQ/3NI5VKA6qJZT8llrdydsCHkL4ufwRAT46VD
 sjWfpJxnNCciS0dl6BEvKGBULWfEPjNOhTWG2zILnX3nrBpMKwPcfVc6WcRiVnPPoF3u
 AKYLVJrNIS6qJeWmQk2c5dYMAwlfhvahDDrSz9FK3nHWd2uBqlA2sOgVcfz1/VyUTvoc
 myWj0NN1o4Sgn1tn5/if+m3gHkwEkVEdhuH/wumPAGGpmvHboaj1e6ftraK9WnHUDg3k
 LMdhIsziudTao/6D0IoUVlX82ilSAp1N3MVLiEpd4jAJseAxk/WNWIv3aBxUOW1yOrDQ
 MIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ScJMrFlzrL75xvqe+jXTJooANOeB/UChAvvQsLs3ty0=;
 b=Lhr6pmHbXWw06bp0uWrZXfIvSB/CqTr/t9Vh8JK+Ktrd6YGf0a8Ym2T3gHl5GyH4s8
 wWhagvfOC4ug3JPMjZ2g2ievByg/fzqmI88DOyGQAjJubSlb4JEXqZbW2UUpYwsSTN1V
 3Cdp0T9d7M4F2eQnpnS0EuM2m0V6KM7Bz2El3WfKHTUmuLxwF1574+Xr+LnXiIOts17/
 kVpqzImcpo3RmkI6coOT+QezJWwZi7NTTqSytp0cKp0fQ5Bk9FzPHCcXlOPxzvh5Dj99
 zd1tT7pb3tantm3Qvl2OJ7eIyRZOzhOVcl5ZZF7cQ2YLFXIXLMhzfkXAWVJFLyFxWWrn
 VACQ==
X-Gm-Message-State: AOAM533se4Nj1EE5G2u4L4ckbObNoJCdDtTSQhONSgU3JdM0yDG4wo/D
 GaGqREQueYOp/p2M0n1fSoMv6ADqXDC8Z+mdEvping==
X-Google-Smtp-Source: ABdhPJz6k8liq8xZwx1/Nzdg6apoq4IXABh8HomThEXpW5N+a0yO9bhiIvVBM4zq8jH7ZRfyLxd29nwW1lJTGLi3P3w=
X-Received: by 2002:a5b:350:0:b0:628:86b8:6e09 with SMTP id
 q16-20020a5b0350000000b0062886b86e09mr27132023ybp.39.1647964585847; Tue, 22
 Mar 2022 08:56:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220322154213.86475-1-bmeng.cn@gmail.com>
In-Reply-To: <20220322154213.86475-1-bmeng.cn@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Mar 2022 15:56:13 +0000
Message-ID: <CAFEAcA8RdqQ5fzoZtb5SaYe41FA=oKo21veergqhMgo=eFmB6Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] gdbstub: Set current_cpu for memory read write
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 22 Mar 2022 at 15:43, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> When accessing the per-CPU register bank of some devices (e.g.: GIC)
> from the GDB stub context, a segfault occurs. This is due to current_cpu
> is not set, as the contect is not a guest CPU.
>
> Let's set current_cpu before doing the acutal memory read write.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/124
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---

This works, but I worry a bit that it might have unexpected
side effects, and setting globals (even if thread-local) to
cause side-effects elsewhere isn't ideal...

-- PMM

