Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D5C4D009D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 15:01:34 +0100 (CET)
Received: from localhost ([::1]:40556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRDvZ-0005zP-CN
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 09:01:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRDia-0000CM-2x
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 08:48:08 -0500
Received: from [2607:f8b0:4864:20::1130] (port=46909
 helo=mail-yw1-x1130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRDiY-0007ZU-Kj
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 08:48:07 -0500
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2dc585dbb02so100725727b3.13
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 05:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jsFne9uw+6EkKnI8/EeJveN/YYV7rrna+RRmWojnQEU=;
 b=Y4DGrhZt+hmldsjZFEiPPJ6jS6GuzAdPelexKasFKGOOtjYkztUywaBdklEZZ5Jwor
 tGaKUpNNwrFES60OAii4nBeqB7GgOYy9umSPhFjq8fculZv5Kkqd/y5Fy/z3YJp9vSU6
 0RnUhC38s0+7vuJ4RdTwGChBs8q6Q2TnKCBGtqpYB3RXfOflqLdYPGqU2tTmQavKSgO2
 Hi3xLGESNYUdN9bTKYe5gvx9xR+8u4+haXgPggFGeEAbQs+tY4KBWjVRe2TzgGypx/hJ
 sgrDIi1MnmvtDkP/lCqwAFE6L9kUS+nuDeE4m7E/uUzOW7Ov3+L6SSUqfV2HBMThmuHD
 Z5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jsFne9uw+6EkKnI8/EeJveN/YYV7rrna+RRmWojnQEU=;
 b=R3dUgyehSKDZm6NhBqEWB2KAO6yL5iffStxrPB/fIrRFscGcWOURF+EtqSFqpKAowO
 0foLA6TDbXR/w3bIKTJ9FdajF8dzn+TnYZ68J6rheh/ejyQv76F3MilI8wz8wdwCsMCU
 kZq1vaHHzIN3+GaLF0NOfErxl3KjZ5e08nuSk9ZL7BkNHQQVjHGUHQIFJAapscwVFyoY
 u2My2BAfL3+qKpWKS3t3jKpVaSLhTRwyTtdRB8hQt6pYqMTyZFVcbtCcE05ObeKVu0zR
 2bDH8Y63fdojm1fdNgo5+Y1eiByktO6xWLeLejfsk8jv3FWR6LqpjkKS7yrVtlax+Ze+
 byiA==
X-Gm-Message-State: AOAM5314tw0uSYb08hqvpaYfDmO7YjH0oQyfEw7PmJK1Kvld/KwDceuj
 k8eATzKUlxrWnPSRe1ESYUeJ6Dj80bfsOH8zLU7jUQ==
X-Google-Smtp-Source: ABdhPJyL2qfFT3CJLwQShzSkTiKh49B2Y152Wh1ktIKKJ0BrV+5YLDoCn8EB1hnwIDroqzkV0pN8Guefhdbh/cp1E2E=
X-Received: by 2002:a81:a748:0:b0:2d6:1f8b:23a9 with SMTP id
 e69-20020a81a748000000b002d61f8b23a9mr8235969ywh.329.1646660885807; Mon, 07
 Mar 2022 05:48:05 -0800 (PST)
MIME-Version: 1.0
References: <20220301215958.157011-1-richard.henderson@linaro.org>
 <CAFEAcA8E49vV9bGxMMXM=NBSCm0R1toUptrvt4=v2rM69u9o7w@mail.gmail.com>
In-Reply-To: <CAFEAcA8E49vV9bGxMMXM=NBSCm0R1toUptrvt4=v2rM69u9o7w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Mar 2022 13:47:54 +0000
Message-ID: <CAFEAcA91h=Pkb6MVxtQfY=i93m+MhS-gMax2YhgBARWeFnjPPw@mail.gmail.com>
Subject: Re: [PATCH v4 00/18] target/arm: Implement LVA, LPA, LPA2 features
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1130
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Mar 2022 at 11:08, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 1 Mar 2022 at 22:00, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > Changes for v4:
> >   * Add cpu property for lpa2.
> >   * Disable that property for -machine virt-6.2 and previous.
> >
> > Changes for v3:
> >   * Update emulation.rst.
> >   * Split out separate update to ID_AA64MMFR0.
> >   * Hack for avocado.
> >
>
> I've applied patches 1-16 to target-arm.next now, since they're
> all already reviewed. 17 and 18 are still on my list to review
> so we should be able to get those in (ie actually enable LPA2)
> for this release.

...and I've now applied 17 and 18 to target-arm.next.

thanks
-- PMM

