Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A85C03D7776
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 15:49:35 +0200 (CEST)
Received: from localhost ([::1]:48798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8NSg-0000xN-PH
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 09:49:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8NRn-0000Gx-0U
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 09:48:39 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:33621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8NRl-0002Fp-Dv
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 09:48:38 -0400
Received: by mail-ed1-x532.google.com with SMTP id z26so15467595edr.0
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 06:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GnRhRiKjHZdIa5CuWhQq2K24UUMDj0z2MMk8hRUarB0=;
 b=kVsfw0Am6biptykMSpdtyHKTIRTD6T6wEuazAH6r4UP1QUMZEHJNjTFdHSNQXNRtTn
 g28PfVYq0nEuVh22V14cRP6w8hPBALBYbgK77KUuCb0PkAphiwnk4AnS+7DA/Aytan6+
 3/Wq0DFDLKA1ERZm0X3t4UigX9j9f3D88+JjJUtYtLAPISAbffKNmRgkosredZwmGv38
 0e7xNFTB9fj308VFq5pUbNSVNu+jPff8YinVxGx6XSdmOUJeeMftBFivMW7fR9iJEKyH
 TEhFPNwdFNN94n0rkCoPm/om4X87C+ykLLx3Gqa/kTkLt9Z9kuA8sWjES7QTk10WMkoA
 Zjzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GnRhRiKjHZdIa5CuWhQq2K24UUMDj0z2MMk8hRUarB0=;
 b=LULBZZzIUnp+u5T2Q8AQHXSmSBo3HG6c+YflNyWde8WA4cV7JdT0dcvCFoJMUGHep1
 bwblwlb5gHsgupbavMMy1bTrr/g1so18uxC1vUDeg/g3aMgFnfFWdst+8i3Y5HCIoicT
 niKSX0zVtlKHzZq/XsW8y+B5olCC4zjQPM+cwYXKYHa9IuZmhQt/eKbCGWV220dUdMXT
 ysLYDseiMcQ33SFuvOcUyg66GiqZ481iLgP/TaCWK0fNfJHIgXBOvt6QGvjGPy8ent0z
 OtOP2CH0AxtU3HcCfjwKtDS5EGG7CHjVoM7qs8mScLUNXmvGEGQNKsusn6jQV0s8YjBK
 wavg==
X-Gm-Message-State: AOAM532MiT3OCIKmBswnlGCXFn28tsvspE4y4//w7fTz8+EkUKSYw5jL
 4PHKEXcaLRWDEjbfpMEco1410Z7i3PEaq3fbCns3Uz7k95I=
X-Google-Smtp-Source: ABdhPJwNVEmxunOqq0IcqEqXpoPmBTYLO7a7bNhwaJd9MQZdn8R0MSfGO/JE5T3C0yI9lDK5Ij4/X7gizsXFUqRs8lU=
X-Received: by 2002:a05:6402:697:: with SMTP id
 f23mr27249510edy.44.1627393715564; 
 Tue, 27 Jul 2021 06:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <87pmv4zj22.fsf@p50.localhost.localdomain>
 <CAFEAcA8eEyhhV88RoTfSMnQb05uODYcL4RVHOzLaxPGPUUc_GA@mail.gmail.com>
 <CA+bd_6+zxLQP1XL_wXM3UZvbAZ6FvNspzSAV7XGqrEgfWjWFZQ@mail.gmail.com>
In-Reply-To: <CA+bd_6+zxLQP1XL_wXM3UZvbAZ6FvNspzSAV7XGqrEgfWjWFZQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Jul 2021 14:47:53 +0100
Message-ID: <CAFEAcA8aEkSRABqJ4-_SJ9-dS=M4jeaW=OQH99BaZUs5Lq0u=w@mail.gmail.com>
Subject: Re: Regression caught by
 replay_kernel.py:ReplayKernelNormal.test_aarch64_virt
To: Cleber Rosa <crosa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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

On Tue, 27 Jul 2021 at 14:24, Cleber Rosa <crosa@redhat.com> wrote:
> Yes, I've spent quite some time with some flaky behavior while running
> the replay tests as well. But in the end, the test remained unchanged
> because we found the issues in the actual code under test (one time
> the recording of the replay file would sometimes be corrupted when
> using >=1 CPUs, but 100% of the time when using a single CPU).
>
> This time, it was failing 100% of the time in my experience, and now,
> after the fix in df3a2de51a07089a4a729fe1f792f658df9dade4, it's
> passing 100% of the time.  So I guess even tests with some observed
> flakiness can have their value.

To me they have very little value, because once I notice a test
is flaky I simply start to ignore whether it is passing or failing,
and then it might as well not be there at all.
(This is happening currently with the gitlab CI tests, which have
been failing for a week.)

-- PMM

