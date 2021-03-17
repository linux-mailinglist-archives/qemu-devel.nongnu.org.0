Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C3833F617
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 17:55:40 +0100 (CET)
Received: from localhost ([::1]:49040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMZSM-0003zM-TK
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 12:55:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMYxU-0003kH-MV
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 12:23:44 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:41194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMYxQ-00018g-KL
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 12:23:44 -0400
Received: by mail-ej1-x633.google.com with SMTP id lr13so3567339ejb.8
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 09:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4mGyFA/cuMWheAna9QKLrQPMW/sjJKqDw74AgReL2s8=;
 b=mdnfh0u8ToDzXl1Wf1pvWrsVTkScOJZQo4+6UtnfdgfSsu9IVohLtSooyR3Mk5m+/6
 ozIW1GsQv5kI3GjlUtThXmB/Y7vloLl9S05IJS9SWstIyINYUgnRT7vRYK/daUWUn6YI
 63BnvshYUAwrnkA1an80RaF2Umv5/lVsn0Gm6b4kJvJKdDaQ1V4/SL6S0sdjs16TKnkz
 wLLa/4Jdff1lZJrVhbm02yvlMzFV9Fw/DwCeiagdc0BQBSrVe5dQIBj+XcSwrVJ6bWo2
 Hq/lHg6adCHU4qgcbGU/1mByOtJ3Ri51oS9DmoiLw5h7vYxGQC7+KF6sT3iS3bbLUizh
 fEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4mGyFA/cuMWheAna9QKLrQPMW/sjJKqDw74AgReL2s8=;
 b=bsc8mftmVRvbUK+4m77xk83jhmdt5xysw04c9affi/Qq0rN8JsrebBE8Aia/Wmj+8g
 AKXQkJLA9MbLNcJ48luVBdQSyZMNo2lJ1ur/sWRbjtfZfnT0EUIJGs1thrjRpiP3GhRr
 cAqp0svh6DRk/Npzov0+xNyithbBZxZ7IO9F4Fhw6DCvPX19hSzRG6JaEtgVH/ddibyU
 ZjB8p2oXhQ4NBVMt9IuD1FxpxymwpFdwwD80p5ZKPelS6nbhrqMpNF09sUcNhZ8HLo/0
 cx547pyrgzkhjosjjN6b3mJ3ZSvPmOyh58gWoZuR/12GryvrNHnD5N6uma3ZImaD5gF/
 Yq1w==
X-Gm-Message-State: AOAM530TVEGVZ8DCp8j43z8xy/gUr2Ll+vt6AiSUIMSUIGUJoTvgSJeh
 jx0a7/4GwdrsHR/Sc0IeVFCBXB5CsRZ89ioheWMzlA==
X-Google-Smtp-Source: ABdhPJzrHm7q+DLCfmivpibqeQwASLc/13Trr+EqBEnt9GcN12WFYs8sjXj2pHNZfyq8kLfRQLnp2rUmxg0mlgtWnuI=
X-Received: by 2002:a17:906:bd2:: with SMTP id
 y18mr36481944ejg.482.1615998218717; 
 Wed, 17 Mar 2021 09:23:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210316101221.1890034-1-cohuck@redhat.com>
In-Reply-To: <20210316101221.1890034-1-cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Mar 2021 16:23:15 +0000
Message-ID: <CAFEAcA-FQp5uz6SLjNJUqgJ9SXwq7dJWaUQ-TYWRhLAQTrc=9Q@mail.gmail.com>
Subject: Re: [PULL 0/6] s390x patches for 6.0 softfreeze
To: Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Mar 2021 at 10:12, Cornelia Huck <cohuck@redhat.com> wrote:
>
> The following changes since commit 6157b0e19721aadb4c7fdcfe57b2924af6144b14:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.0-pull-request' into staging (2021-03-14 17:47:49 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/cohuck/qemu.git tags/s390x-20210316
>
> for you to fetch changes up to 5793f5aafb05dae30e9dcb57d0d1c8f1a9633f6d:
>
>   s390x/pci: Add missing initialization for g_autofree variables (2021-03-15 15:47:18 +0100)
>
> ----------------------------------------------------------------
> s390x updates:
> - get rid of legacy_s390_alloc() and phys_mem_set_alloc()
> - tcg: implement the MVPG condition-code-option bit
> - fix g_autofree variable handing in the pci vfio code
> - use official z15 names in the cpu model definitions
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

