Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 932A5494E66
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 13:55:06 +0100 (CET)
Received: from localhost ([::1]:38238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAWxv-0006LF-EY
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 07:55:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAUe2-00061D-Uw
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 05:26:20 -0500
Received: from [2a00:1450:4864:20::32c] (port=53901
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAUdz-000334-Vw
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 05:26:18 -0500
Received: by mail-wm1-x32c.google.com with SMTP id n8so10998883wmk.3
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 02:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HHGfxDOrlY+qoX8WZmeurGgfb7cWclLD1s+YGsz7Tlc=;
 b=O1SaTGs7sBYj5qkCs+/fcgBN2Ch13gZ8HNs8ST9LBW9jIYKlFt26GiVxzPT8pz+Lxr
 1QU0IGfSINv1Ao2onFduf3x/xlXMK3UvHg3Pc8xSnNoeVI7Qh7yYlyRi7BdbDjFHjO5i
 Rl8B8Y6h4hVjp7n7dZZ9XD2A9dXsvmjBbhKVKK9I9u+6X2DNuoHV3b8Pr/uopsz6I5ZY
 rA+W6wOmaYyI+WTN+YsaTytUqs1RF9CBEqT8yGZrViGOOdaPU/friGDVqh2KYoBvKPbW
 QVt1iiKeSO8oIycBfkgoXccH1QpoRnnAQjVhNpikAJLxRbG0H1gJiHgBc6OTMRmDnv6N
 2fkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HHGfxDOrlY+qoX8WZmeurGgfb7cWclLD1s+YGsz7Tlc=;
 b=MvCo+YdT1z79uzPETL2owTT7cCjQG+J1XLXl3xtpNS18cUKumXCkDlGUz30t/8qzN3
 98V/SCVA2qLJzBKEKzU6ful661IkwLJDErtHjsjqNlJQ/+II8ImiepaHCaa1/weGIvn6
 1+xDN8CIX4v3mIQqcI+Ro3vPDvu7xPgQ0o9065Dbw3xVLe0G33XR72JPuZdMS6/HcIvl
 5cz3UinEVzeCaXyDGImxYpt0eqHfiC4eYiBVJyZwgxNle5FAEC8OPEMefQVe9X0fRcqR
 ZgYCS6AcXR5Jyq4bjlhooUb+t19nR3cgRyv1UsTsvsuP+XqCtelWJoj/4mTJElkhT3a7
 AsMQ==
X-Gm-Message-State: AOAM530qLMw7nx/0NV0YcJ5jtooiQ6rH2B04D5JAxvBU/5UgdnS7XZPQ
 tuQSl6nDWWH0FzSwoDsGiXVjcYD8vdDRpNQtaxvEdg==
X-Google-Smtp-Source: ABdhPJyWlJnveqAMxmuZF1RaPNasilWWuQn1SfBIELFn94T6b4HXb57GxVJIVOzS4I188WuPPa3127ZoQ5D1x5yiMxw=
X-Received: by 2002:adf:fa0c:: with SMTP id m12mr6642837wrr.172.1642674374228; 
 Thu, 20 Jan 2022 02:26:14 -0800 (PST)
MIME-Version: 1.0
References: <CAK7rcp9rnggAvaDxRV4m_KcR1afmquJsR+=khKw4B1UG1+V7yw@mail.gmail.com>
 <87czkn8rzp.fsf@linaro.org>
 <CAK7rcp84B0MXfeGsPnd9oM6cqxGUUSNL0GmLiWYwZzPhLkvfxw@mail.gmail.com>
In-Reply-To: <CAK7rcp84B0MXfeGsPnd9oM6cqxGUUSNL0GmLiWYwZzPhLkvfxw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Jan 2022 10:26:03 +0000
Message-ID: <CAFEAcA-9d3MnxdsmLeikruhVzCredV7wvRgSU=MOmz0quCWRew@mail.gmail.com>
Subject: Re: Cross Architecture Kernel Modules?
To: Kenneth Adam Miller <kennethadammiller@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 19 Jan 2022 at 19:53, Kenneth Adam Miller
<kennethadammiller@gmail.com> wrote:
>
> The source for it isn't available in order that it be compiled to the desired architecture.

In general kernel modules need to be built not just for the right architecture
but even for the specific kernel version you're going to load them into.

In theory you could perhaps build QEMU into the native system kernel and
have it act as a shim between non-native kernel modules (this has been done
for UEFI modules before). But you would (unlike the UEFI case) run into
incompatibilities in data structure layouts in memory. In general it would
be a lot of work; it is certainly not something QEMU is anywhere near
being able to do today. I doubt it's something that either the upstream
kernel folks nor upstream QEMU would be interested in either.

The best approach would be to get the source for the kernel module.

-- PMM

