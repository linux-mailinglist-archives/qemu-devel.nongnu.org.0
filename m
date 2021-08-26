Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF923F87EB
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 14:49:04 +0200 (CEST)
Received: from localhost ([::1]:48924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJEoZ-00079n-TH
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 08:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJEiN-00082w-Sn
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 08:42:45 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:36560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJEiJ-00066e-L3
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 08:42:39 -0400
Received: by mail-ed1-x536.google.com with SMTP id b7so4485702edu.3
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 05:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lU9hF7AnNl4DmBAhnqpVZl9zTBm6y90/vqeCIyv4ggA=;
 b=D+9MAWMzdtiVfSv0MFv3mOymVHmyOP9XY+BsqmoT87zz+Wha1ddjOYqSr1dP+I1l0r
 yHWK0FP96ekP/0wrRRXs78Z8Jfz9oz2JRjJLFieFJjBrw+Aa76akTiLmLXMveIDgC+ts
 mC1MUPNN3K+bc523JjJv3SEj9JzN58Y7l8Y2wQa0tt63SAXX/du4ioYb9MCoZD/7ZP9K
 BWwEb7oqUt9jl0QAkJf9yS1hOXA5misJ4qRTEZqgvX2/O7AVdprHxYj2hN0Onqvh+HFc
 ruDcrR6kMOtl/fwbzvlGFChqbmurFA8CKqPuHnDKfq8l42AUEInsOW1uVqWtIx4A3EYj
 azaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lU9hF7AnNl4DmBAhnqpVZl9zTBm6y90/vqeCIyv4ggA=;
 b=QF90djCtSJ1FfkWYX69LBQrugp5NB9+cVFGtcPLTOaksP9jRqV8HCRQ20nBk+4Cu5a
 FbLyDJL4KnWQW6RXG6rjJvnCR2VcCOTnIV9kzYWiXW0j0fUsBUL02myv9SIpJuo+xbnv
 uRvySpvnmyr/hgzU1MDHxl9AMszrf+q8+db1EbLpCz4g6kfwdKU6OOMV7oHjSW98X4XV
 e19iEL0o1Ubpbx5SuV5c5Doy0LE6ybckEYNkYKJZSVK2/CvTe5/O0fy048b0NBJpmNTy
 zbHavd5cPJ1TMZtwcp0+2ypt+S4nthzekEkzKKRwTZyR3qSThkFHzevIaVTcaRKhudH1
 LQyQ==
X-Gm-Message-State: AOAM530hMZvuehsp2B0bO5xweA585/HlOsWVug6P9VvAaKk4s/2xhyvD
 k35JxVJsCUFpZDfbk5PJbeCsmuUfIRmroHc/0o7naQ==
X-Google-Smtp-Source: ABdhPJxEKJYvMoNXS4N7mAxg0jMorxdOaJW2MgMrgar0nDOumO/oxZu5ItfmcEWhNgkB+uzsnhYBZ9jVj6q0KZr5RhQ=
X-Received: by 2002:a50:ff03:: with SMTP id a3mr4011960edu.100.1629981752609; 
 Thu, 26 Aug 2021 05:42:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210825195438.914387-1-ehabkost@redhat.com>
In-Reply-To: <20210825195438.914387-1-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Aug 2021 13:41:45 +0100
Message-ID: <CAFEAcA9sf49CH5CCZ3P7T84DV02GL30Hb757+MdtnWY+ROqffA@mail.gmail.com>
Subject: Re: [PULL 0/2] x86 queue, 2021-08-25
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 25 Aug 2021 at 20:54, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> The following changes since commit d42685765653ec155fdf60910662f8830bdb2cef:
>
>   Open 6.2 development tree (2021-08-25 10:25:12 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/ehabkost/qemu.git tags/x86-next-pull-request
>
> for you to fetch changes up to f429dbf8fc526a9cacf531176b28d0c65701475a:
>
>   i386/cpu: Remove AVX_VNNI feature from Cooperlake cpu model (2021-08-25 12:36:49 -0400)
>
> ----------------------------------------------------------------
> x86 queue, 2021-08-25
>
> Bug fixes:
> * Remove split lock detect in Snowridge CPU model (Chenyi Qiang)
> * Remove AVX_VNNI feature from Cooperlake cpu model (Yang Zhong)
>
> ----------------------------------------------------------------



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

