Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5920E3D71CE
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 11:18:21 +0200 (CEST)
Received: from localhost ([::1]:52034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8JEB-0004BW-UM
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 05:18:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8JD3-0003Vh-PD
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 05:17:09 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:47027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8JD2-00025u-6P
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 05:17:09 -0400
Received: by mail-ed1-x535.google.com with SMTP id f13so11701205edq.13
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 02:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E/dUsBqLJopkpYpwEaMR3VhNT4WxF1563fvN45JoAVE=;
 b=jWDp/mRktdjSvop46G3YwkGk+NjER5lfWJW/G+f5+YtK4jOIPs0laYul705pMS2EZq
 d4dytvFNFbMEsIWx56ao+Kywy2rtmC8KzZeapDoL92I4J9YYPqUONuNsz8GJLT7E0euw
 yir2Bzjm5zPRy8Xhrtv8Ee3KM3CHx6mVZ7HPxlo9+aN0FkBlywErOcQfpaZG1oD9lfop
 Kc9k+mOeoBpUzhA3zMaMnvQupCirq6Qv4JU+UNJKQgFqJ2a1maWi6p5FrP/CtCW34J5u
 FvqgoZusq6RrPQVXOlXlvKtoW4y89+jkyCv73JQZV7Lzjp4sTMSpvhJYd5Mcejatoyqp
 3C+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E/dUsBqLJopkpYpwEaMR3VhNT4WxF1563fvN45JoAVE=;
 b=APN/LN/owuOCO/o3BwgK85k0YDTqxxKPpkIflBPZE8u1yqZZLO2ukS1ccosJsQadjG
 19SOW9QgS4YSmP7qJ9aEoLhCVeNsx1lObBjcPu0As3gdT53tOztyzoiQ1JXUTdtmGyBN
 S6SYMEa8MMprHy8WRQqNu+CGPnxm2P0+2QBhVKwFnYg1z2WdeUyOrD8rLFSISDUJoo3w
 8/y5Ju5b179+gr50yGnBe4ER6VqFaQdbGT2b8EExHD3yJLeRNb/8xD5yeZwAdKMTp4bn
 hldjdFcgDH+zBjqc1MkWm2FQhZ7nQ5o3iBTEEn9mOlkQRzeDP1hEDy88vqWT/G1B/uBj
 Ynig==
X-Gm-Message-State: AOAM530xV5sj1ougUqaO3x0ZQYtXIXas+vKj7KvGq+i3mOuI3OCMLR4Z
 LqaJUbJt/UwzLJoFgBQNT/9bOpq1HhaJeez9mCR9fQ==
X-Google-Smtp-Source: ABdhPJyCwmeY3AlarDKYMSEH/rpKEEqu58nhEYw5H5YE3t9C4idEI1fPCOyao8shP6np7M5Eun1jlKjhWenVN46Ktzo=
X-Received: by 2002:a05:6402:697:: with SMTP id
 f23mr26025125edy.44.1627377426627; 
 Tue, 27 Jul 2021 02:17:06 -0700 (PDT)
MIME-Version: 1.0
References: <87pmv4zj22.fsf@p50.localhost.localdomain>
In-Reply-To: <87pmv4zj22.fsf@p50.localhost.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Jul 2021 10:16:24 +0100
Message-ID: <CAFEAcA8eEyhhV88RoTfSMnQb05uODYcL4RVHOzLaxPGPUUc_GA@mail.gmail.com>
Subject: Re: Regression caught by
 replay_kernel.py:ReplayKernelNormal.test_aarch64_virt
To: Cleber Rosa <crosa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 27 Jul 2021 at 01:39, Cleber Rosa <crosa@redhat.com> wrote:
> tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_aarch64_virt
> is currently failing consistently (first found that in [1]).

FWIW I find that on my local machine this test is consistently flaky
and always has been, so I just ignore any failure I see in it when
running 'make check-acceptance' locally.

-- PMM

