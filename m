Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA2F4BC883
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Feb 2022 14:18:14 +0100 (CET)
Received: from localhost ([::1]:36986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLPcr-0001sA-Om
	for lists+qemu-devel@lfdr.de; Sat, 19 Feb 2022 08:18:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nLPRo-00035o-Q1
 for qemu-devel@nongnu.org; Sat, 19 Feb 2022 08:06:49 -0500
Received: from [2607:f8b0:4864:20::b2e] (port=38443
 helo=mail-yb1-xb2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nLPRQ-0003Uy-W5
 for qemu-devel@nongnu.org; Sat, 19 Feb 2022 08:06:48 -0500
Received: by mail-yb1-xb2e.google.com with SMTP id y6so24814529ybc.5
 for <qemu-devel@nongnu.org>; Sat, 19 Feb 2022 05:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A9h+yD7KDGVzm01UiHYsJQCxIPzTdqd4F1p9OJJbWq4=;
 b=ratfBkbw+fDkXlSWmGrzh1XzyCMgYCHLO2eDNsV71hq15Iarqdme7HnMv99DFv1dgA
 HMhTpRb95vxFz8iHdaeqM+VvOEwXWF+EWfVniam7I9jx5gbR28/e4FQn2Yc3phKrCgGZ
 xIQ5QLwsk2w15xkZpv4ynsVfrWpwIVyDFY0xsSY/AwWZvuc7LB089HGqkDEwbSglQCTG
 LM+2/Z96I9vmEfuexVvcIuGXKa/BEXTqEJeNpRAWOzS9ctO4aeIj74+/UqsKk7V8sDVE
 68mNbOTII7LZWwlXuWvIwSUxWdr+UklH7FNE2jd5JF0FS98+8gBzWSPpTaF4D+7kHgor
 xs9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A9h+yD7KDGVzm01UiHYsJQCxIPzTdqd4F1p9OJJbWq4=;
 b=csbuRuxQr0o5Cj+0UQXFMHPtHBqsVGD+R64+WZPggjWBxk/HWNNqdMSTyRKncB2dZH
 GRhJjrzYj4Xpb/RvCnUNHyWA9h5V76m69xcObSPQB3iN6f3E9FRmOMkIOKgrL70YCWnD
 ks5KKijfi2280oBWEXcKi/RPn/LF5Y66DjxqXRi8Tu39iL1zA1UpuCq/d2bJldWAo+SE
 XmfLJG9k/d8IB867f2uhfJdCoHRbD8zB2DWUri2Re3oSkqcQBBlmkizPq/IHaR32Qpsj
 Pu7w+FLEH4gz3xOqETjs9g+GelCMiioJ1vnCShQXZKLI4elAlAGond0jWlvWtx+MS5qz
 R3ew==
X-Gm-Message-State: AOAM530g/XeeFVfkA6jJmMJiXE5wzWOq0Woi5GfwlibQuBkixREPjJ4p
 hPFAtnTPptW0A1XuPL2//IcNeF8hd7O6NvlG/KkATA==
X-Google-Smtp-Source: ABdhPJx63rx6Qw1pgy471nrEDGdSZLDVh7yqmhXrF4KR2K/zyGMlb1XVzb2+Qv6gUSHhPgbpEycM42bjLsC35HFBd1g=
X-Received: by 2002:a25:dc87:0:b0:624:4104:a331 with SMTP id
 y129-20020a25dc87000000b006244104a331mr8423507ybe.67.1645275982957; Sat, 19
 Feb 2022 05:06:22 -0800 (PST)
MIME-Version: 1.0
References: <20220219064210.3145381-1-shorne@gmail.com>
 <20220219064210.3145381-6-shorne@gmail.com>
In-Reply-To: <20220219064210.3145381-6-shorne@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 19 Feb 2022 13:06:12 +0000
Message-ID: <CAFEAcA_O0rnZHMJViKVJEK8dkTjBBaH9H+QsKQyEGCSJgfxsyg@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] hw/openrisc/openrisc_sim: Add automatic device
 tree generation
To: Stafford Horne <shorne@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
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
Cc: QEMU Development <qemu-devel@nongnu.org>, Jia Liu <proljc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 19 Feb 2022 at 06:42, Stafford Horne <shorne@gmail.com> wrote:
>
> Using the device tree means that qemu can now directly tell
> the kernel what hardware is configured rather than use having
> to maintain and update a separate device tree file.
>
> This patch adds automatic device tree generation support for the
> OpenRISC simulator.  A device tree is built up based on the state of the
> configure openrisc simulator.
>
> This is then dumped to memory and the load address is passed to the
> kernel in register r3.
>
> Signed-off-by: Stafford Horne <shorne@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

