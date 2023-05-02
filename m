Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4763E6F46C8
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 17:08:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptrbp-0005sJ-AS; Tue, 02 May 2023 11:08:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptrbl-0005s1-NT
 for qemu-devel@nongnu.org; Tue, 02 May 2023 11:08:01 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptrbi-0003Lf-DX
 for qemu-devel@nongnu.org; Tue, 02 May 2023 11:08:01 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-50bcb00a4c2so2671957a12.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 08:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683040069; x=1685632069;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RFjqzTHGDh9fvqG6kK9qNGx/70IU3tPs20+JFXTtxJo=;
 b=KDnOe+clgp3t+jwN88bu5vKnYiZoJcS5SQW+FvUcLtgeVucoJ2KKFhfLtbaDSTG3HN
 z0+4662Ec3g2yc8JvndqTaDiYT5jUnNgYIKz3c+6quXGIgyxemxxKMTBr1OB4dw+hX0c
 SsUrD+CPhRtvzaBwyyG9Y1RKC4Rn59DfxJM4zkF9vivFt6QHUR5a5LW+JWytaQhWj9HF
 GKvtr6hWu+yTYIs6ZvX3juEbgrTQPLaAW+fGDdZu2z3Uh6AKppvqNunKDxjRkDSdc9yS
 9pIO+XAEYVrOrkpd9w+WhKywxtf8F7CnrSLiulNPHZc5dKmJ2Up4f4uHeP2xJQkzgNqd
 DR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683040069; x=1685632069;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RFjqzTHGDh9fvqG6kK9qNGx/70IU3tPs20+JFXTtxJo=;
 b=a0j7oLGFJTJd8leMec8RbwBlG3DtxE+pq75OUd3TC6670j1VRMctXHjeiDlbCjFAYF
 lVKTVLuo6DlmCPQSu15c4sm1nZXH/P+xZh5nE7JdapHqjHt/wO2GkbLyURx+5rRHEdAY
 z7nu+HPN0hwX0LCR3MrVBcXa9s85YTyCIPSZ0fX8IcwNrNF0J+NGVaH7fn/c5r5/gUSh
 fJ2UOZV2ETVkWfpIm0AA8dmrgNlr+CTNr+pyTU8ooMKuvvlxYZ/fY2flAngtdN7o4hNx
 uva3by+5LhlDiacWd5t5pySkT8QDGn6L+aar+xSJKZ9ab0xPifktRMFHIFJkI2Tkjy4y
 vn9A==
X-Gm-Message-State: AC+VfDy9vrwSSae/CIQOb7VHcRESDbOr2OVvpLUMdMI+GXsMTledSQ/A
 IPCEqxAnyioLGwuOBxyntyQxOUgv83GVAB7OMU/tdW1yC84dV5Jq
X-Google-Smtp-Source: ACHHUZ6BKCdc23hZftUEAQ6UVLg/7PRMVd5zK/KlepU1yVPHmM7FEIjsfysSs8CDOgWu1f324Q54Q1Pp+ofvJodzgHQ=
X-Received: by 2002:a05:6402:183:b0:509:d476:3a12 with SMTP id
 r3-20020a056402018300b00509d4763a12mr7938568edv.34.1683040069288; Tue, 02 May
 2023 08:07:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230502144911.2454625-1-peter.maydell@linaro.org>
In-Reply-To: <20230502144911.2454625-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 May 2023 16:07:38 +0100
Message-ID: <CAFEAcA-tQft6t=dC3rs8F6uHzR_quZ8r26ASXn+=5SoCzfrYsw@mail.gmail.com>
Subject: Re: [PULL v2 00/34] target-arm queue
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 2 May 2023 at 15:49, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> v2 changes: dropped the patch that enables the new 'notcg' CI test:
> it doesn't pass on our aarch64 runner because the CI runner doesn't
> have access to /dev/kvm.

Alternatively if we can get the gitlab-runner user into the
kvm group on the aarch64 machine, you could retry v1 :-)

thanks
-- PMM

