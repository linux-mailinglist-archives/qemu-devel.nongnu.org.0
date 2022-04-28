Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D208151323C
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 13:16:12 +0200 (CEST)
Received: from localhost ([::1]:45706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk283-0006W4-UW
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 07:16:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1Na-0000La-KH
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:28:10 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:37268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1NV-0007JE-Vd
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:28:09 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2f16645872fso47633977b3.4
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 03:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PxxqO1XObLqrUoyugL9zG30slpAuqlB7rv9B15JIUxM=;
 b=NkYGeLtY6mTdv+1wLirLuVv4T/ILcxCbtEUd50TiSS5PiktB10in7vXFrChndduRiy
 csQDZcnfu+OrDXfUThdmubqV1xRLGoLZMaxM4iyXTW6k4Ig1SGPqs4nzDu5Rkm7jQZYD
 FhMYqy5MS8THnvu9rNJstkLdqpEXKNabImU4lYqtSAAU+pKqltYdupYRR6yE8t+dGPwj
 5zT2uLcSHLnpZ31jkEEHvDNWguryYOru668nT4tgNv6nlIVMBSBdcuV2M33H7snJXQ5R
 ZVQnA06Puyv7ndLjnayihBXmsAaWHRlGL4i8AWeuEyFkyyV2unDO0GgHPxdiKcbasQ0r
 DH/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PxxqO1XObLqrUoyugL9zG30slpAuqlB7rv9B15JIUxM=;
 b=vFTNyQ4n1+x+/XEV/iIR7pdGIkpoUQ3pYJEPWqh/mMzjEhnIrIfRJkZRy/3nrpnfcA
 4XhAjhonzyyxroU7GTrcJ2utpVaVqhNLgKSjhzsmyHGMb7cDuVTdCCWvDBPw73ErPGzu
 x1Dpvfajs0U45aBs4yAXxWaCWph9JXzZ7ULPf5KS98eM6Oej/AfKYL5lGdfxfhJQQh2p
 RfxYFHunbUkp5DYpgCyJ6ZsjVRqZlToO5EGt8qXh4oQUX/9E9h+W54cr+/eV4VfRIrmJ
 /qDzEB3wuGEk2OW4RiQfojIzOgz4RF2die3e2POeKFyz6xnZnUTMT/wzocm0FcJm9oAk
 5wBg==
X-Gm-Message-State: AOAM532B1QfsbMDS6TGp5SrFhOeqnrsK0GyKAtHb+pRKj3xUyoQUZU4w
 hoWc0auWiuNdzvZMS0yUc4D5TDLgcSPpIdO76G7ToQ==
X-Google-Smtp-Source: ABdhPJzMP7K2TP9ajzWpf7D4vzxshS7S/hmjGTXp6JIe8arVVgBpNREiPxWev3tz/ubcDnoFnOm0AQeA9pw+WZhf1/8=
X-Received: by 2002:a81:ac57:0:b0:2f1:99ec:91a2 with SMTP id
 z23-20020a81ac57000000b002f199ec91a2mr31780946ywj.329.1651141684979; Thu, 28
 Apr 2022 03:28:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-27-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-27-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:27:53 +0100
Message-ID: <CAFEAcA8U4Gi3FyETZaQXfQdAX80PDYX_6XwmOPegoNGqNomz1g@mail.gmail.com>
Subject: Re: [PATCH 26/47] target/arm: Use tcg_constant for do_coproc_insn
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Apr 2022 at 18:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 43 +++++++++++++-----------------------------
>  1 file changed, 13 insertions(+), 30 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

