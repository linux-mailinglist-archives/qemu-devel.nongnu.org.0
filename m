Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2576557A050
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 16:04:38 +0200 (CEST)
Received: from localhost ([::1]:60004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDnq0-00021J-MF
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 10:04:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDnIB-00049Y-4t
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 09:29:39 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:38400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDnI7-0006qk-CG
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 09:29:36 -0400
Received: by mail-yb1-xb33.google.com with SMTP id i206so26447176ybc.5
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 06:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ocb3q1bKaCeLAZlag0PXt4KkZQQtJEalbWitNILfhvs=;
 b=VsWTySSci3mw6T8L2dE8wJac3fV237FyehUCtdry5R5qlmAkTQxp4GRgh79QbWKDiK
 czUBF21zIcWZEtv4eoemUo4zDSFe6cUbMYTGPNk/QAG7oIIoYwjyOVBwKu92Ls2w500O
 o0RVacvWiUF/oaYMfFKHHWJE6HgflYyCA9kf/62ZB6aZw5TSEM0+dz3BmGXCVviBA2dc
 jeEibZpWUmtwcOot9s6nAwIB8E0Ik4D9rxUfByVWB/ElrOUHJwMXI/gxT51eYvxokhGl
 3gFFa//HeI/gV0BBUbyyLOlxrY39uPlpRaWSz0pMdRLnsx9akaN/a3/5dSPZU5ctwulI
 4KLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ocb3q1bKaCeLAZlag0PXt4KkZQQtJEalbWitNILfhvs=;
 b=nK9Hr9OVW643EjgAxgPJwZRWmihKZ09bfroAoKYDj7DIlpIytpvw8LcfjemtJDNPiY
 th0zJhtWu1NodMQi/w1V4ifTwFiMGDTiUxJWUMQ6zflmvAmJOh/dkZjnFyoBCt5igC6o
 140U58WT4jK+kD0PTUQEvDOmbwwsOuhLbz6YwyYWWuG3QGZOxMNrcL3CLJkioxZWGreP
 KMgRGlOGn3KD+o09fGwQdka46wEdK2LvRKxvSopI3ZKFTDux2IoUq5pYphPAdPQRmyOH
 3RUUpedLRdPtpof12vYiAfH75Yb9gDOkt+W9jHxZzY4BeZu5hwAKL8zi5FI05+pFhxkW
 nssw==
X-Gm-Message-State: AJIora81qnKgMlQd8Q8FaiRjuvoADynJhE//QtVlsjhwHZr8hntcZ86K
 XMG9K5VGUw7EpQhLLAT+sP/sjSGQhFNt6/0AaH79lw==
X-Google-Smtp-Source: AGRyM1v64PTq9V8qI+2Dy2B7rKtkQ90r4AfvUyQOjELW0ec6T5facMLyNfzZjEKhpdPwWrut8k3kIrB0m3qhtIieMAg=
X-Received: by 2002:a25:bfc7:0:b0:66f:563c:d2e7 with SMTP id
 q7-20020a25bfc7000000b0066f563cd2e7mr31181050ybm.288.1658237374219; Tue, 19
 Jul 2022 06:29:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220712124956.150451-1-pbonzini@redhat.com>
 <20220712124956.150451-16-pbonzini@redhat.com>
In-Reply-To: <20220712124956.150451-16-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jul 2022 14:29:23 +0100
Message-ID: <CAFEAcA9RBA6NYMCc9hWwnpfpR=iYjJTsv8s1dTWz-LZmtPB+xg@mail.gmail.com>
Subject: Re: [PULL 15/18] accel: kvm: Fix memory leak in find_stats_descriptors
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Miaoqian Lin <linmq006@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
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

On Tue, 12 Jul 2022 at 13:57, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> From: Miaoqian Lin <linmq006@gmail.com>
>
> This function doesn't release descriptors in one error path,
> result in memory leak. Call g_free() to release it.
>
> Fixes: cc01a3f4cadd ("kvm: Support for querying fd-based stats")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> Message-Id: <20220624063159.57411-1-linmq006@gmail.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  accel/kvm/kvm-all.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index ba3210b1c1..ed8b6b896e 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -3891,6 +3891,7 @@ static StatsDescriptors *find_stats_descriptors(StatsTarget target, int stats_fd
>          error_setg(errp, "KVM stats: failed to read stats header: "
>                     "expected %zu actual %zu",
>                     sizeof(*kvm_stats_header), ret);
> +        g_free(descriptors);
>          return NULL;
>      }
>      size_desc = sizeof(*kvm_stats_desc) + kvm_stats_header->name_size;

Hi; this has fixed one memory leak in this error-exit path but
missed the other: it should also
   g_free(kvm_stats_header);

Spotted by Coverity, CID 1490142.

This g_free() is also missing from the other error-exit codepath
in the function (the "failed to read stats descriptors" one).

thanks
-- PMM

