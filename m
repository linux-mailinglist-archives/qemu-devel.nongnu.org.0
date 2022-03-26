Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA364E8059
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 11:21:45 +0100 (CET)
Received: from localhost ([::1]:34588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY3YF-0008EA-SO
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 06:21:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nY3W9-0007Dp-Hk
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 06:19:33 -0400
Received: from [2607:f8b0:4864:20::112e] (port=46090
 helo=mail-yw1-x112e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nY3W7-0008Jf-SE
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 06:19:33 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-2e5e176e1b6so105010857b3.13
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 03:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=qCHuCV9BsrOPfrERbBQco/t6U8pawEHVW/oeKHdaF8Y=;
 b=MMWVY7heAWkDoj6RK2HS2kOUYqrnWMl+vehc8qigiHoRLBTMo64YNKSxzb6iJVjL4p
 6SJbBew5hx7pMIXtzXfmQwqclYXGzA4b1wTCabjbtXIi5CqQvH1k+aLax0RQUJIzrN+X
 aQSuSZ10U1+RAr5ZURxwUkHBhiS3ke8QiG2zWvauTPrRIAwbWmB2Z/JZ6m2qmfQ4kW0c
 MVuydaK5SKz5czGcL7ql7jLqnc4meWEryViALjBiGPL8qLTNw/B8dsfzJqMYA1wcf0RQ
 WYzNCD8LO34Xe2NGhTlHZMVKsEooHUQ9G/UaoEKpOvsuPwlClFkF7OuSnktLOiwpRqct
 ZBhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=qCHuCV9BsrOPfrERbBQco/t6U8pawEHVW/oeKHdaF8Y=;
 b=3hyjeo15RpPkqOS7b/Nh87vOLfCt8DHDgOs/DR/aA5uBPOoRmP0ca4hMjhAPzkwYME
 ToFwBLiISdkjlBTRJbyNvYqn0yKDjeoPwYESXk5x+IoJPMcHr+TdrF6R/bDNSStDDlzF
 D2FqB3EnQe4XCAX/o+so9Ao1eHDBk9vEvXsk5CUdE5e9GmQ9Om5OMSWgx+S5A0G90g+T
 pDB+x1ciNNNt0TALVZ7Qb9L85wpzljsJ6a9um/PWzks/fh2BY6/VjM64wXz+hAvSmwtH
 Nl/eh9N35MLz0S4V++DT1o2UzXLKZCVV3m7A99puqiEITXWjbDqttX2tAfcc8b/YBvqa
 UbHQ==
X-Gm-Message-State: AOAM530dWyWsUWR18+bMSTmoEyklcDZ2U8C/qu7FAaZ4wG1uALNdlcUY
 VvGu90Tl/VCFJq6mTpFz25Q88SCNaRh65pzPX13PHnw6IfvtGw==
X-Google-Smtp-Source: ABdhPJz79aRjvs9EwqMy0jkcmS6EhKMlcBYeB6t2JsV+hcXxd2TrikyuiwgmV4FCUP/w+hSS2JKlb03t3IRSuAC3p1s=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr15653543ywf.347.1648289970494; Sat, 26
 Mar 2022 03:19:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220325145725.3891659-1-peter.maydell@linaro.org>
In-Reply-To: <20220325145725.3891659-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 26 Mar 2022 10:19:16 +0000
Message-ID: <CAFEAcA_09LnHtG1eYdx-Ysd_mmTRau6HA3HFhr4vV2MMWhOoeQ@mail.gmail.com>
Subject: Re: [PULL 0/2] target-arm queue
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Mar 2022 at 14:57, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Just two small bug fixes for the next rc.
>
> The following changes since commit f345abe36527a8b575482bb5a0616f43952bf1f4:
>
>   Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-03-25 10:14:47 +0000)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220325
>
> for you to fetch changes up to c7ca3ad5e756e263daf082c315e311593ccec3d1:
>
>   hw/intc/arm_gicv3_its: Add missing newlines to process_mapc() logging (2022-03-25 14:41:06 +0000)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * hw/intc/arm_gicv3_its: Add missing newlines to process_mapc() logging
>  * target/arm: Fix sve_ld1_z and sve_st1_z vs MMIO
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

