Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC07E4C6F89
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 15:31:06 +0100 (CET)
Received: from localhost ([::1]:43088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOh3I-000775-Mt
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 09:31:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOgo9-0005PC-Fq
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 09:15:25 -0500
Received: from [2607:f8b0:4864:20::b30] (port=37781
 helo=mail-yb1-xb30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOgo7-0000d2-W1
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 09:15:25 -0500
Received: by mail-yb1-xb30.google.com with SMTP id y189so20792092ybe.4
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 06:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oXAW1HcQt5SliTUn7hKM0kMGhqaTJZYIYs9GVqcvyWc=;
 b=uxuaAWxDylogy+x4BiiY54aC6TxkhpWPD3KO7R6vR7TI/hJqkAf+gaNYmFEjP0i0BU
 G0EmeG6HBNEO92joBQCzVOtnklgbeGF2oWSaW3f4HUR7kopLzGNSGP4Rh7aUmYhH0XzS
 A5Bo6eib02vWgXgx8jlIQ+Ghx8dP5Kl/GiatzfJ0SI9wSd0qiJrXASETBb9YBASKi6vk
 BWoNWyHpTQ+vwk3JQeUdXaZubLHhorKF+V0FMdCx+Snc6oIxLUrrqI5v4944CvHNS6VL
 kMvZtUTJYhYmG/+q9Zu/Gqoue8nNR+js1z/hhJGkjXivzsSGjXckZbGc2mBMqCkmjWKR
 uHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oXAW1HcQt5SliTUn7hKM0kMGhqaTJZYIYs9GVqcvyWc=;
 b=A7H9NRbunM1q4kzbCrIsyBIGDws15zFe5kLcBazPJ4+oxY2+hyGRo0t3s1dENrG/W/
 55vKHilGcoHtO0fk/8qPQ7twhYLPDs13eY9Zl7thrkilSCVRt2Vxyx7q+HqBKfAQuFns
 +W/GvSfGKzUpAIjYvUXEhcA15jct1cvDMXdiX0LETWTrwYFP9DIQCfV5qSJOtFAISkMe
 ngUThodRZz9TLaWXlmKQWDwpXa42II2Qa5KcXVMHrHrwLTyinimicie2O4NmsTnMs/0R
 VLeZjj18SJW1dfbUthxiJTtm1mEbSwE936UVso2TDGiHQ0N/IV+DkQ6J9kaL/2J+wWks
 kRSA==
X-Gm-Message-State: AOAM531qTCKGYmv5KcZy9KDhFSvkHg+szwSTj32WD34lYUwup1ztxY4u
 QrwYaAmd7/E7IkCrHOX5t2+DjdH2lWnvVYA3VfztsHOIvP8=
X-Google-Smtp-Source: ABdhPJx0+IUEeDQdbtfjaVwpHCQdajfRQwd6gRhvkBcdW96+s6vU0S/0NbFSs8Nn/Fw2CC6Kz2O4vrWyHi5PeupDqYY=
X-Received: by 2002:a25:497:0:b0:624:8ba2:fc8e with SMTP id
 145-20020a250497000000b006248ba2fc8emr18794564ybe.39.1646057722909; Mon, 28
 Feb 2022 06:15:22 -0800 (PST)
MIME-Version: 1.0
References: <eddf5c19-5582-7d88-5232-2052f87583ae@mit.edu>
In-Reply-To: <eddf5c19-5582-7d88-5232-2052f87583ae@mit.edu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Feb 2022 14:15:11 +0000
Message-ID: <CAFEAcA-dStng7OmArapZTMXx=fF9cme3VftLAAd-nQgcv0ZgGA@mail.gmail.com>
Subject: Re: [PATCH] explicitly link libqemuutil against rt
To: Simeon Schaub <schaub@mit.edu>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Feb 2022 at 14:12, Simeon Schaub <schaub@mit.edu> wrote:
>
> >From e77de12cc33846a3de71d1858e497fbf4cdbff96 Mon Sep 17 00:00:00 2001
> From: Simeon David Schaub <schaub@mit.edu>
> Date: Sun, 27 Feb 2022 22:59:19 -0500
> Subject: [PATCH] explicitly link libqemuutil against rt
>
> Qemu uses `clock_gettime` which is already part of more recent versions
> of glibc, but on older versions it is still required to link against
> librt.

Which version of glibc are you seeing this with ?

thanks
-- PMM

