Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2053E2AD9A7
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 16:05:10 +0100 (CET)
Received: from localhost ([::1]:57552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcVCn-0005Mo-6F
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 10:05:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcV6s-0001MB-CF
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 09:59:03 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:44481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcV6q-0006pN-Dh
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 09:59:01 -0500
Received: by mail-ej1-x62c.google.com with SMTP id o23so18008903ejn.11
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 06:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=usRg3B/5876e0Z19IJOULrsOdZhx0FCSXWomCN3DRMQ=;
 b=qd96q5NyR1lRUO/ReWHoN/mpCPFbhfkhP0e6E7r6QZoVEydUEHp3K5+LM4MVQt3bO4
 hVx7FsscPHVWhFRhqarwg8RmNxaAotqd5gJHQoqLNgwAUhjpAFliB/9ANLhFqNDz6WaC
 5PeT9kQw9dg1DWrS3ixsx/8ADV7YXQFNvcoLOIjEoS+aJwHwGYrjE4riXY0ARg9oMWj8
 wwMAOMfs4KrNPd6NWLF56+QC04xGa6CRxYph722ZX3UxI7U0BCgOvyASA7w5wJmLiA8b
 nb1HDO/HzsM0wogsCntekLZyyha/ps30zQF4cXkMJtOtARzG6rNKQewffQvPlPbQsyB1
 TtmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=usRg3B/5876e0Z19IJOULrsOdZhx0FCSXWomCN3DRMQ=;
 b=YVdh/BGmVg/clcxgSTk0kZoN3GMwwHGGbU6Fpg4c5M8EvO7VwtnDB9NcdtWHCCo8LS
 VBVbiL+c0e/Dd/u2Xt9a1GseaIpMe2vqNXzH3xNiDmzuWQxryETBgzreNrxpKHFSSrg5
 XCWr7erx2OdKWwBM2vIDaBa4vW1aEkPZTR6jr2rUO5GBXnbDxoaZPyPCEVWC7c6jA3gm
 ixakqYofTTv5+lHKaPiutkuPOYboMKcd5frQJv4fyPaoYbdlwLcAd3mlAC49Xw848kd5
 2wqZO+pux0BT3iKLekAReU4S7d/9VYDzRUOb/H4vNbuwaap1n44exe4XVGaE2irIJTic
 1g4A==
X-Gm-Message-State: AOAM531pAMsQxiIEnzFUrqouEeCsWLNz6ZElNw9KSViUSpJIMmDiXn5x
 VM2TFplqpcfaPuwW+FmchR67lK4k8R9N7mw2XDyw6Q==
X-Google-Smtp-Source: ABdhPJwxxZYfdmq3Nw9jKx8vpfNqiGUZ+50G1ElGuA0pye8+jsyu1njxq6+Wcx9KFeWPvRf3KuQrk+8yxzhkd4SFb8c=
X-Received: by 2002:a17:906:6949:: with SMTP id
 c9mr20425187ejs.482.1605020338725; 
 Tue, 10 Nov 2020 06:58:58 -0800 (PST)
MIME-Version: 1.0
References: <20201110111132.559399-1-thuth@redhat.com>
In-Reply-To: <20201110111132.559399-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Nov 2020 14:58:47 +0000
Message-ID: <CAFEAcA_OBshYDqe326xoKSZtif0tK6gfHAgd1K+ZJM7usowH5A@mail.gmail.com>
Subject: Re: [PULL 00/19] qtests, gitlab, s390x and misc patches
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Cornelia Huck <cohuck@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 Nov 2020 at 11:11, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter,
>
> the following changes since commit a2547c1ba911a0c53a10fe02d94a0f539dc064cc:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2020-11-09' into staging (2020-11-09 13:55:15 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/huth/qemu.git tags/pull-request-2020-11-10
>
> for you to fetch changes up to a58cabd0e355fc51f18db359ba260da268df26ef:
>
>   s390x: Avoid variable size warning in ipl.h (2020-11-10 08:51:30 +0100)
>
> ----------------------------------------------------------------
> * Some small qtest fixes
> * Oss-fuzz updates
> * Publish the docs built during gitlab CI to the user's gitlab.io page
> * Update the OpenBSD VM test to v6.8
> * Fix the device-crash-test script to run with the meson build system
> * Some small s390x fixes
> ----------------------------------------------------------------
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

