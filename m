Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DB76AAAE6
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 16:42:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYU1l-0005Bw-QW; Sat, 04 Mar 2023 10:42:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYU1e-0004jz-00
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 10:42:25 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYU1a-00025b-T9
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 10:42:20 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 me6-20020a17090b17c600b0023816b0c7ceso9066649pjb.2
 for <qemu-devel@nongnu.org>; Sat, 04 Mar 2023 07:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677944537;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EvD1Ocl+XyFZCMAK7CNnbUjIo09gM7CG5fsGyeNLmQE=;
 b=CQZSdYDo3TgTEfY6Vic3WtbiQ/oLvtRLUSOCN40PaIIxo7lN1oepOqHQKmiJOTA2F+
 Yae0F580LBmfmU5MIX4mlPW9SBu9Rk0ddw/R9cTfmAxEwWjRv+x8nPqWwQjJW1Pl7Loo
 o/yqt0N9lLMOCCBP0VCjIC2OQsrCGMbQU5A1u6rKoZVvhtEAVDcocFtOzVVjplYgDJKi
 0fjZP3Vkk6ViVhIhfTlC9zpi080kO+tL2o1zEJWCCcsLvFKw7EjNUw5nZ/nYzo54q5JS
 tYdidLQXAZw6enEO7qWZr4i4aDRHOC6bpYsLlnqqcxO3lHnUq2ZXCOpbmhYWlc3/LaxP
 YZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677944537;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EvD1Ocl+XyFZCMAK7CNnbUjIo09gM7CG5fsGyeNLmQE=;
 b=s4yOEr+ulVYQwQkEJzbAQXBMRPFNFC78IaHIhfaAhLGyX1YMYtJdpCujMOvsIGUAoV
 8qaFRH8saNx3noruSRhwgKfxXfHZKqbUpR1ITAJ2DBxFOVJ1JdaZhHsjV1GAaU9i/K5Q
 40rpu0DU148/J17bx+Dra4O5fQTIZcyRcTa1aw5Qg8HPqHE5/Jfyet8NhNdmrYNggwK5
 ksjwmXQc9cDF4PjPidfHIzCcDvuNI+B0W2FoUDizLiybH3zztyCnXtXOdG5huPVKtQ8R
 Th0ZS+2uBBk7VFh8ivjWfOTYV6mjGiKHKXB33HFJzqcXTW0D6//9tf3CTNTdn2k8Xmn7
 oluQ==
X-Gm-Message-State: AO0yUKW0eMDrCQHVjRRgW7VLJO4Mr02C/3mhTWZlXudnZ8Rn7YNDviHV
 pGzIf/PzA6Lp9AqEHZLc83TG85yMq8anTRBK23pVpQ==
X-Google-Smtp-Source: AK7set/lCi1bMSXRFkXCCQVbgiwocFymHhELvnOC0VVFCV0NtrzRt6H/hAhyQ9iOX6Xl6df+/mXg5ciDyibLhrKcg5g=
X-Received: by 2002:a17:90a:7783:b0:237:9029:c29b with SMTP id
 v3-20020a17090a778300b002379029c29bmr1982093pjk.0.1677944537094; Sat, 04 Mar
 2023 07:42:17 -0800 (PST)
MIME-Version: 1.0
References: <20230301113425.286946-1-thuth@redhat.com>
 <Y/9TwfYFEsVeZKTr@redhat.com>
In-Reply-To: <Y/9TwfYFEsVeZKTr@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 4 Mar 2023 15:42:05 +0000
Message-ID: <CAFEAcA-=L_ay1L3a=jg9YOXOuJkOF6Cx0wTYKtfFqWzGTbjr8w@mail.gmail.com>
Subject: Re: [PATCH] configure: Disable thread-safety warnings on macOS
To: Kevin Wolf <kwolf@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 1 Mar 2023 at 13:33, Kevin Wolf <kwolf@redhat.com> wrote:
>
> Am 01.03.2023 um 12:34 hat Thomas Huth geschrieben:
> > The enablement of -Wthread-safety broke compilation on macOS (if
> > -Werror is enabled, like in our CI). Disable it there by default
> > until the problems are resolved.
> >
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
>
> This is simpler than what I attempted (test compiling something using
> the same TSA features as the failing code), but didn't actually work.
> Since I don't have access to macOS, it's hard for me to improve the
> configure test. So I'm fine with just doing this instead.
>
> Acked-by: Kevin Wolf <kwolf@redhat.com>

I've applied this to master because it fixes the CI job, but
we should probably look more closely at what's going on,
because it seems plausible to me that it's something that we could
hit on Linux too with either a newer or older version of clang.

thanks
-- PMM

