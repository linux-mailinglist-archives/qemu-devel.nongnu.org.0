Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA094356599
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 09:40:48 +0200 (CEST)
Received: from localhost ([::1]:50638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU2nr-0007Wx-VG
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 03:40:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lU2mT-0006fz-3M
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 03:39:17 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:37700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lU2mQ-0006Ul-KY
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 03:39:16 -0400
Received: by mail-ej1-x636.google.com with SMTP id w3so26019269ejc.4
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 00:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=15qO1vg8nCc0Pnz1fGixlajvjVxS2/akFygKEONtAk0=;
 b=LxACFvLWNkjqD4sI6/dYDzEbIetFCjEgurcsq41l46QEsdb04Gz9A/zcLrysZPpMXI
 bQTSZU4WA/kEmmOHC7f4G3E24K7eGtj2mgXc/CFCzvb9FKDZzzCw759/bPqq52vw1x9B
 k5LmEaZS+npSFxXlYKYKuehZytc9dHY2ZqSOdI2DWbyQUsNWZ3HtrLPubNLJ/b1qKwry
 13Cp98FfEJ3yOdEoNZEL9Px5HAE706hu38e/RQ5+Eh4pTl3W3p2aMaxFEhtae4MTZOtp
 B+cKHSdOraHQhd1IKSO7M9QZ19u6MB6pZJbp6VmsTGdnErfH1xTpBrlXkj0rrr5Xc+jB
 sMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=15qO1vg8nCc0Pnz1fGixlajvjVxS2/akFygKEONtAk0=;
 b=DxnodBQ9Vty90wkmCZvIjbvIuT7/1hjiz+4/5oBmNAiv+zULKMQVbGByD5k/xywfH6
 KDe3X3XD3Tk0c2pkNZs3gBqaSBo3h1hsv0pAJK0MYi24JA7MgdBzw5BFB/ss4KVUfydJ
 53+GFzRU8E6sHgTs84ghvnpWJHmUuNdPuUGApMuOqdldX9QVWvJaxmuFHztpqLNRnPkg
 KnnxjU1vLgxV8X7yAPy4tmax16tHgsEtc88ACQD8om8aoVmTwu+gVOiv02iuDG9B/BtX
 9TYU46y4237gYGCV0vF2cBu9hyW8rQrzhBvw6QiTcGiTVy1huH3jMdIArvnK13j8hl1j
 jGUQ==
X-Gm-Message-State: AOAM531WzYo7hYZX/YVA+uuGbCVL9eGZxUyJTRPMzBYYmhvep2Q6Bygy
 xA3ZoPfoe42niwoH9LaqVphLqWBjyDo2jFPJR6DRcw==
X-Google-Smtp-Source: ABdhPJwPRvMhDuKciGSzKJC65iAQp03SSVwpakGEvmVIS8ZLiaLlcZl7cn4jZwZAgh+KYIwWMad5nPIEU/6QEnKlIHw=
X-Received: by 2002:a17:906:1dd3:: with SMTP id
 v19mr2222158ejh.4.1617781151928; 
 Wed, 07 Apr 2021 00:39:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210407040100.9933-1-gshan@redhat.com>
 <20210407040100.9933-2-gshan@redhat.com>
In-Reply-To: <20210407040100.9933-2-gshan@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Apr 2021 07:38:32 +0000
Message-ID: <CAFEAcA_-cmCFDgaqVsZEFT5w56g0LLr3aCzjCf1Od4iov6eWiA@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/arm: Initlaize PMU feature for scratch vcpu
To: Gavin Shan <gshan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, Shan Gavin <shan.gavin@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 7 Apr 2021 at 03:01, Gavin Shan <gshan@redhat.com> wrote:
>
> If the scratch vCPU is initialized without PMU feature, we receive
> error on reading PMCR_EL0 as it's invisible in this case. It leads
> to host probing failure.
>
> This fixes the issue by initializing the scratch vcpu with the PMU
> feature enabled and reading PMCR_EL0 from host. Otherwise, its value
> is set according to the detected target.
>
> Fixes: f7fb73b8cdd3 ("target/arm: Make number of counters in PMCR follow the CPU")

This commit has been reverted...

I couldn't find a cover letter for these patches, so it's
hard to tell what you're aiming to do with them. Could you
make sure you always send a cover letter with a multiple-patch
series, please ? This also helps with our automated tooling.

thanks
-- PMM

