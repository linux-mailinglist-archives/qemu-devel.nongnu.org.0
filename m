Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 457AF652624
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 19:23:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7gay-0002T4-PU; Tue, 20 Dec 2022 12:40:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7gaw-0002Sl-E2
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 12:40:02 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7gau-0007Ea-Lr
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 12:40:02 -0500
Received: by mail-pj1-x102d.google.com with SMTP id v23so7884326pju.3
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 09:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UcmEUcyxQ+aLPow1sNzuvjPBsa9aUy6bew4CTbgeQXg=;
 b=exmnfSRxxJOIpAubm5kTdrJSjuYyZJBFtJMgZXq/YVUbBaL0Qs6c+WNKQOdvkQtoSy
 NnDuw3yZNWVkyJDC5zKQF7ssVnVxcHLT3pNoGfRuk6xX/SxE52pNBjFFSb4TO75U3JYn
 1InutoEu4Tfwgzy6O36FdKtClEgF1LtMyObXPWo59vetcRipAkfWVK6ibXwvH5d/Kn8i
 REcxXKqgzLkFqQ6UplKbvnKmRqM3LM/PJ7SbcXf4dtBp/UpdE+CJLn9ltFQ1zXS1jnjn
 YqnOy5Qq90DkW3VmWFphQCd3fdzGkdbYmw6WgJZrHGNNgURB56b8G7K7RX7k4pPhZZX8
 mDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UcmEUcyxQ+aLPow1sNzuvjPBsa9aUy6bew4CTbgeQXg=;
 b=viDieOjKDF2+/B499HftIhphAxefPYDlYYedVYMJUjK0PJug0hxBHbjp4+KCrgFKmL
 RSLfRW4foN9whjsoSXdEFFPPHIHFALGD0xvGcfXEv+fZOuYE46cyd2mT/yYfMkYPRNcr
 0ULG5hsUCddfojQvBytdtjQSwTW+boMXSgCsnTD5d0ZYEj/akUHePgKdykQQ54/OLpXe
 JzYVjpS4CorBq3aPh0kODbmFOtPXt07yYILDgkj/u9c5y6W9gf30DXGdWUhI+B6CPPWS
 eRcIRwkZKgVcAgD0KVl21Yb5sTNMP7hrEGsEH6zMp1/7VSSNslCj610cdKooMf5cKqcK
 /MCQ==
X-Gm-Message-State: AFqh2kq9RjNHQZZW+5OPmtjmirqkB+udtg7azo5TyoMqdgG4NJqjnsl7
 FPAUzocoihRP/QMhABRcSHD/bao5h56JmJJw4hZm5g==
X-Google-Smtp-Source: AMrXdXu+RrTa6L5IzIG8CvE0MdVh1EHPzSKlK84U7etxLzkKSCIQw+StvuLZiuZTumhQSDA+TERgGFzWh7k4UdPiiJY=
X-Received: by 2002:a17:90b:4f8d:b0:219:9874:c7d3 with SMTP id
 qe13-20020a17090b4f8d00b002199874c7d3mr1931894pjb.221.1671557999113; Tue, 20
 Dec 2022 09:39:59 -0800 (PST)
MIME-Version: 1.0
References: <20221215152407.201278-1-kwolf@redhat.com> <87r0wvosnn.fsf@suse.de>
In-Reply-To: <87r0wvosnn.fsf@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Dec 2022 17:39:47 +0000
Message-ID: <CAFEAcA-E_s5oN7xT2=C9kwDjJnBR4amYQp4Vqj0xE=pJVdTPBw@mail.gmail.com>
Subject: Re: [PULL v3 00/50] Block layer patches
To: Fabiano Rosas <farosas@suse.de>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, 19 Dec 2022 at 23:55, Fabiano Rosas <farosas@suse.de> wrote:
> With today's master at c15dc499cc (Merge tag 'pull-misc-20221218'
> of https://gitlab.com/rth7680/qemu into staging, 2022-12-19),
>
> I get a test failure:
>
> $ make check-avocado AVOCADO_TESTS=../tests/avocado/reverse_debugging.py:ReverseDebugging_X86_64.test_x86_64_pc
> ...
> Output: qemu-system-x86_64: ../block/block-backend.c:2572:
> blk_root_drained_poll: Assertion `blk->quiesce_counter' failed.
>
> Bisect points to this patch
> da0bd74434 (block: Factor out bdrv_drain_all_begin_nopoll(), 2022-12-07)

Yep, that does seem to be the commit that introduces the
regression. The problem is that the refactoring has broken
the early-return if replay_events_enabled() is true --
before the refactor that 'return' used to return direcly
from bdrv_drain_all_begin(); now it only returns from
bdrv_drain_all_begin_nopoll() and doesn't cause the
calling bdrv_drain_all_begin() to return early, so
execution continues into the following code when it should
not.

-- PMM

