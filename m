Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2CD5F6855
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 15:39:19 +0200 (CEST)
Received: from localhost ([::1]:33350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogR5q-0007rq-Nn
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 09:39:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogQsg-0000NM-Bc
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 09:25:42 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:43900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogQsa-0003UO-RL
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 09:25:41 -0400
Received: by mail-pl1-x629.google.com with SMTP id z20so1690736plb.10
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 06:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Nay9O2WydDFybKH3Qvmy+uqvUzr0hauPYizrnzLFJLA=;
 b=f99D54J/GAyyHJKWf+qsfK5QL8U+U3fEJ18rtI8iXF7pQprPh+eqqDtwS08ImMX4YG
 V4pAL93H4SlE10o7XN6120rmF6idq5Uets5iUrz9lbbNjAFnWH7z8E/4pSQLitt63i3s
 FPaT6dNq+el4cPR4m8UlpQf7rB1DdIesgSfOhaMaU9jRKDFnZvAw5wuftHitEurXm71f
 3czZ614BHzQX1i5jn8rGhY6j+cKdU2Ta3RveAd8X9TLBDPjYUehec1RzoW4UH22Q4EGn
 ZjuBhZeJmKZ5tYWYk6AfTix2N3hc0z84KlLk3d9lIEj+g2y5SlyvlgLax341I77mTknm
 6VjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nay9O2WydDFybKH3Qvmy+uqvUzr0hauPYizrnzLFJLA=;
 b=1rQeVu2f+YixtXE+B3NuJAcjQixqSejDPRyY+ohPADDs2vwe1YuzJjey00Bj+7jRKN
 UbHVLi3EHJ+6MrhF5jIhLolxZBO58kOAihxeKD9x3vFYOib4hOS9BRqdzFFyT+qLcSno
 Kq2Yh9SNi023+RaN6YWb+i2oVTRuXNsov85pXFgr4jv56ty4k3Z6b+ZUXXdIEIAJ7oYj
 x8ZbhHoQblUgUcYCw1LbYEki33tdtFIaQC5b6XN0YVKh0d0aL6X1cqbILpWAKFYqyW8y
 3D+rCEjpWdrxC+7bM7CdDvD2aI5Vi04zXFj516xudBH1I6JSBIy0em2RVroRRClEfn77
 aqlg==
X-Gm-Message-State: ACrzQf0e0XWEShs+6q0a3rKYFohTAx9QLFRmQ7ulMGPeNH2a4/XUgV3p
 kKrq/GnFRrMJdU5vLWbAFBQzQHJ0D9wVVt/JLr8spgN190s=
X-Google-Smtp-Source: AMsMyM6XXSrEjf+oSVRDk4ZHraKngg/1J4BzlJ/qR2FueV2foZ41xJgv+RNLIuNoAru+SG+F4hxOTI3R4Nw/cLFqgVY=
X-Received: by 2002:a17:90b:4b8e:b0:20a:f240:9b23 with SMTP id
 lr14-20020a17090b4b8e00b0020af2409b23mr5252712pjb.19.1665062735328; Thu, 06
 Oct 2022 06:25:35 -0700 (PDT)
MIME-Version: 1.0
References: <20221006122607.162769-1-kwolf@redhat.com>
In-Reply-To: <20221006122607.162769-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Oct 2022 14:25:23 +0100
Message-ID: <CAFEAcA-==oHfPv+1LtE=oO-UfVJNDLWYhb604smMtRqfupM35w@mail.gmail.com>
Subject: Re: [PATCH] quorum: Remove unnecessary forward declaration
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 6 Oct 2022 at 14:13, Kevin Wolf <kwolf@redhat.com> wrote:
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  block/quorum.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/block/quorum.c b/block/quorum.c
> index 970f63d9f9..f9e6539ceb 100644
> --- a/block/quorum.c
> +++ b/block/quorum.c
> @@ -232,8 +232,6 @@ static bool quorum_has_too_much_io_failed(QuorumAIOCB *acb)
>      return false;
>  }
>
> -static int read_fifo_child(QuorumAIOCB *acb);
> -
>  static void quorum_copy_qiov(QEMUIOVector *dest, QEMUIOVector *source)
>  {
>      int i;
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

