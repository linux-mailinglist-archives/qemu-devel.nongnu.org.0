Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F5A3080FE
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 23:16:46 +0100 (CET)
Received: from localhost ([::1]:56096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Fan-0005yc-7E
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 17:16:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5FYU-0005V4-SC
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:14:22 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:33405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5FYS-000816-TK
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:14:22 -0500
Received: by mail-ed1-x52a.google.com with SMTP id c6so8458425ede.0
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 14:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S/eiYhHM5appqj+w5B7br+XJWB8hOmkcEn9TDCvCsKk=;
 b=CaRpjqMzOxzCXjMHe9u34VzBB5Q/2hUP2+1ezJHAqvhSOadwdSvHOFaw0smKELzSyG
 LusSAHAU3S+9UzT0dh5B8xO4R7dQQc3i/s3BEeGS197TraBoopP/SM6X02fpBRqAwcNV
 6KxL0WyCX1sh31KK9a/QwlypJq8yp+OM01h6+Rx53k6j1ahMOqH52vc7A+6Q9uXPW8z8
 zy1iZYU7OaiQzwHnpof2Kz8Bgfo7998/izTAUmheJY+r9q93w4m4zUAgDBiYW8F04vOv
 EpZ7f/T2Bt6Qh0bDnQLeV5Qojc4QYDdiURCkmowOjG3cgLqVn0xAah60CDDvffHqgrPP
 en9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S/eiYhHM5appqj+w5B7br+XJWB8hOmkcEn9TDCvCsKk=;
 b=Yfs5ZwYcbW7ThWQHU37FcDTcUg2QSIj5J6kdw9y3a93JvtjATv58EhaVaPQM4H0tVC
 s3ynLhAnKJvXphA0bt8gDsPGlPkpaAf2aV1XHukkX2+VXp257bb/Yas5Y3vju1dcXp20
 Cye2TZZFxJ9rxdjzlycEtBHI0chva6szdPyzwKywPdA/lFXAaYkntfx5UzoFnRcY0MPy
 TP3vfRGiuAz7AIGWyZJRhhBwCjH/JGraDm8TYjEU4+PfmjfU5KTjfu2LMf1CMZ1vDpXy
 CTratR9KU8/h5DWEtHPva1FDn4tQrQ5pJ91Qu9G2bn07jKqz/ynFzjWcuLqNqePNzxh9
 7lmA==
X-Gm-Message-State: AOAM532Nc/ONRZfJlKJEf/0nE2FoUC1ZUNTFC3OkrhEcZXE6H/zpK1At
 TIbgkiPMvdDibJwuHImj2gvGduScj5prkeEvzceG8w==
X-Google-Smtp-Source: ABdhPJyt0RTkvUnNGXXi/ZDsTnKHpvdGXbwzcWL0L32xJxzJ56iGNVpD2D57yN2k2MtNOIP/hHeZvOdolIx3aX8pL8U=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr1975741edd.52.1611872059472; 
 Thu, 28 Jan 2021 14:14:19 -0800 (PST)
MIME-Version: 1.0
References: <20210128211419.50052-1-programmingkidx@gmail.com>
In-Reply-To: <20210128211419.50052-1-programmingkidx@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 22:14:07 +0000
Message-ID: <CAFEAcA-bZugxm=qJUaE+vH_m_dBmcrh_OQZUup7K8e4AyX=v3w@mail.gmail.com>
Subject: Re: [PATCH] Add support for building on ARM Macs
To: John Arbuckle <programmingkidx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Jan 2021 at 21:14, John Arbuckle <programmingkidx@gmail.com> wrote:
>
> Adds support for building QEMU on ARM-based Macintoshes.
> This patch has been tested on an M1 Mac running Mac OS 11.1
> and on a 64-bit x86 Mac running Mac OS 10.12.
>
> Signed-off-by: John Arbuckle <programmingkidx@gmail.com>

There are already patches on-list working on adding support
for building on Apple Silicon:
 https://patchew.org/QEMU/20210126012457.39046-1-j@getutm.app/
and also on hvf support for it:
https://patchew.org/QEMU/20210120224444.71840-1-agraf@csgraf.de/

thanks
-- PMM

