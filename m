Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 295B85763C0
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 16:40:03 +0200 (CEST)
Received: from localhost ([::1]:42534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCMU5-0000Ta-PH
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 10:40:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oCMRm-0006Rg-NT
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 10:37:38 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:46654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oCMRk-0003qo-TN
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 10:37:38 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-31c89653790so48470097b3.13
 for <qemu-devel@nongnu.org>; Fri, 15 Jul 2022 07:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1nntSu14kiYA5aRvwAZ6Xu0P2IzNjfktu+XIgD8NX/A=;
 b=EZI7VpNK3bSFuAooICJ3BuRz4KhtOz7WmEJCrnf4vaFUtDtIk6VG2IorTuKGlIPskC
 e1g6K09PMuSNzkCp70D7f27PRCIhIKEjOT7Bqx+QGB53qx0B4ZTv9FwV7SfzKnoTG5D6
 xd3xrmVKGdpv0i7U4GeeaU7L9Jsh0qZUT2hTGNwRVsVP7G4+pBUBvKerMjYyZuGRAiDw
 /mTATNnEiZQrJAWW3869jl+Bj9b1Yxwgmh1g6dor38wAdiUCUSWBzeyGpMk89kGWLO1L
 IRHTKdtFzvz7EnNAoheM0gVQqKRtQ9eNKxcy6iCNGizkrnty2R7KpfHcC2uxAj2AI5K1
 Hoag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1nntSu14kiYA5aRvwAZ6Xu0P2IzNjfktu+XIgD8NX/A=;
 b=q+D8812Ps2RKvwQCm6atMyrQyirc8C+8x/A4yI1JJ2g51hV8zJeZ/SG7NoasBfbhgO
 9J9Mta6p2CrEknClKyTuWMLd14vYqz8jpADNNMlDte9ReJ+L5x0dzSiXddZQv3CHGlCr
 kXlVElzEwsesI0gg/JRzo16oA6MjGLOA/EN6oVIEPVYAbJ4mcIsTTCZ8OF7Z/M6XYv40
 xXWW0SJiXJEfMTulXnzy3qWtL00BzidULQtTKKDajppxmqB57PyRnVCraq8lsVfCQPDf
 JQHsy7X4iVWBMpht510c1rRN87UgYiHuQLz0tkNHWmGfQ/bInYS9z6ERlO5dC2sPj0ZR
 ioLA==
X-Gm-Message-State: AJIora+eUrcVTJb8KVYkS5HswwPWW1RmY+SMoZDeTsTUGghJrGsB8+Kg
 94oB1pxRsdK9JD3fVi845epiN3sAoDKF9lcOfbptwg==
X-Google-Smtp-Source: AGRyM1t1LLeYBEwyXT+GGJH5U1lo4p/QDfq3Qv5YyN6LXvpM6JpZ432QTpEE4zQWlpTIqJ9AgxJeBOaULKJPYcJlObY=
X-Received: by 2002:a81:8d08:0:b0:317:a4cd:d65d with SMTP id
 d8-20020a818d08000000b00317a4cdd65dmr15761166ywg.329.1657895855637; Fri, 15
 Jul 2022 07:37:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220714154456.2565189-1-clg@kaod.org>
In-Reply-To: <20220714154456.2565189-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jul 2022 15:36:56 +0100
Message-ID: <CAFEAcA_mKbzYsavPboCKqo1f-PsL_tg1n=9nkjMVFymJhgXUcg@mail.gmail.com>
Subject: Re: [PULL v2 00/19] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, 14 Jul 2022 at 16:45, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The following changes since commit 08c9f7eec7002dac2da52c8265eb319aba381c=
86:
>
>   Merge tag 'darwin-20220712' of https://github.com/philmd/qemu into stag=
ing (2022-07-14 09:30:55 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-aspeed-20220714
>
> for you to fetch changes up to f0418558302ef9e140681e04250fc1ca265f3140:
>
>   aspeed: Add fby35-bmc slot GPIO's (2022-07-14 16:24:38 +0200)
>
> ----------------------------------------------------------------
> aspeed queue:
>
> * New ISL69259 device model
> * New fby35 multi-SoC machine (AST1030 BIC + AST2600 BMC)
> * Aspeed GPIO fixes
> * Extension of m25p80 with write protect bits
> * More avocado tests using the Aspeed SDK


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.1
for any user-visible changes.

-- PMM

