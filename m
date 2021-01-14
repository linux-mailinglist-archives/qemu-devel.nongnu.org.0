Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E192F5E12
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 10:52:30 +0100 (CET)
Received: from localhost ([::1]:55660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzzIr-0005Sv-ST
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 04:52:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzzGp-0004Kn-E9
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 04:50:24 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:37035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzzGm-0002kp-JH
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 04:50:23 -0500
Received: by mail-ej1-x62b.google.com with SMTP id ga15so7268226ejb.4
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 01:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CzMKyU55RFUpOhw/+mqOGMS64vLPHedKvSKg42gyNqE=;
 b=bqDDjwnsqMY7xln0OBHIp3EBMBi0JpJGqv3jVkVoVfmKAad89HrPQ1whKV1DlLueBl
 jl9FTFRJZikcS8dP1vTIOCaOGVVLLLqLdR7/P9yOr9BK+r75gbbzboblDJ4ihnRi61lg
 +2uvUaa8whjp/+dkLqxaYXrABxKnrUtRAeSpQl1vuO0Xh9JxOZkpQaSlQp5XVh9X+WbT
 u5KTpAbsgbA2gjDNMoBDL4xTdYiuEm5GcgKNxq1/0fUq09Y4D8F9VwIBil58SxorJvPf
 y3qkqRJwnP17t2ykpZC6tIvlyes1xxFWd0h0RLwC+cbdycWw+EwTFycmoYN6xsJxL/vD
 JtSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CzMKyU55RFUpOhw/+mqOGMS64vLPHedKvSKg42gyNqE=;
 b=hagSOl55iKgDwhGox2nYTYG1Xb1r0U4eHzUd931ntwXVtIX1q0H0vAf2nsQ7+eQP8Q
 2rw8T7BQXAHMmIriICvZHZCU4Ji6Y4fx6HsKXY03tLu+ZfcT3Fw1+OrssuQtnxMoz6lY
 s8oyw7YJnkBhVQrSvc136vJTwkHlJPeuyuf1hfYnUatbxY7s4TiykLakysNDTbqToEK4
 C+dx+Ete/hmmWwJxVYtbwYaPYKxHa2WKmlBnhZuNjWCtFafRPKF85CEpKqqlnCo2NCNk
 qRRSfE621k3heovZ2qhEVep5j/5JMCRgorMq1H4RKMzrf7ibJYvci6L+mV7OLv1GerXu
 wBNQ==
X-Gm-Message-State: AOAM5316XrGJe0qHqNX0sqzP9MVtKFDL1YlguifLOQQKJHyKsy1X1Cep
 lSWd+DnNfqvCU8o+sfmu/XmAbng4n0Q7qpD+aN7jiQ==
X-Google-Smtp-Source: ABdhPJzsY5yWjC6jxaUGoczI5Rxbj+TbbD7EWRfHNz+i5nJp087bPU27hbJFUGCYLQIXKaywG23RljRYOAU3CFSO4mg=
X-Received: by 2002:a17:906:6b88:: with SMTP id
 l8mr4728402ejr.482.1610617814708; 
 Thu, 14 Jan 2021 01:50:14 -0800 (PST)
MIME-Version: 1.0
References: <20210112143058.12159-1-maxim.uvarov@linaro.org>
 <20210112143058.12159-3-maxim.uvarov@linaro.org>
 <20210112153542.oqahdubzeoipyvun@kamzik.brq.redhat.com>
 <CAFEAcA9O2kHpcvoofo0v3ahXNOQtw8cxaVC2hn+AjpH6A9RciA@mail.gmail.com>
 <20210112162526.ob7eroamrdlowfyr@kamzik.brq.redhat.com>
 <20210112162847.wik3h24isg4cmgyq@kamzik.brq.redhat.com>
 <CAD8XO3Y3sgZ3VXh7FhfcvvTckE2EUebivQ1nUnqTud2ApGUh=Q@mail.gmail.com>
 <20210114000445.mg3xq2nq7kccbvjy@kamzik.brq.redhat.com>
In-Reply-To: <20210114000445.mg3xq2nq7kccbvjy@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Jan 2021 09:50:03 +0000
Message-ID: <CAFEAcA96=ZjZyhMcpTSDvrHKXZY-uOUoQSi-jTbOLpFZdnkMuQ@mail.gmail.com>
Subject: Re: [PATCHv4 2/2] arm-virt: add secure pl061 for reset/power down
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>, Jose Marinho <Jose.Marinho@arm.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 tf-a@lists.trustedfirmware.org, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 14 Jan 2021 at 00:04, Andrew Jones <drjones@redhat.com> wrote:
>
> On Wed, Jan 13, 2021 at 10:30:47AM +0300, Maxim Uvarov wrote:
> > - the same size for secure and non secure gpio. Arm doc says that
> > secure memory is also split on 4k pages. So one page here has to be
> > ok.
>
> To be clear, does that means 4k pages must be used? I'm not concerned
> with the size, but the alignment. If it's possible to use larger page
> sizes with secure memory, then we need to align to the maximum page
> size that may be used.

I think we should just align on 64K, to be more future-proof.
Even if secure software today uses 4K pages, it doesn't hurt
to align the device such that some hypothetical future 64K
page using secure software can use it.

thanks
-- PMM

