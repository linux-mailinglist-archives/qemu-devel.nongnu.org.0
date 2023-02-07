Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2308468DF2E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 18:42:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPRzJ-0000wN-0B; Tue, 07 Feb 2023 12:42:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPRzG-0000om-DQ
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 12:42:34 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPRzA-0005Ol-Rk
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 12:42:31 -0500
Received: by mail-pf1-x431.google.com with SMTP id 16so1569943pfo.8
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 09:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4zbPWm1aozytlfdFTH7ySVK3a3qpOC00xk+suUzXh0k=;
 b=ENYMdiAkTEcniP8t7uH+fhdBv9LZN729ZVF8QeTaMH5fQ0jO0E16d3+NBrBzZGX8B6
 TIm1V8usRwhu8fPUweMTcJLqLYFslvn28UIKyexv7/QS1CX8uyzQJbKgEC+zJE9xO5BH
 9gZ9dNzKIV6W0fYYG50Be9oJocn26l7jRRMfC11+JpIu2/ijHe+tzxtej/sSBFle3BfP
 I8IvXRZERTquefK84QtUx5N7gK0iwQqazVRk16o10/VnjwT2MVRmMkHzZXNojz3h2IVB
 nv+HdUc/qLf6NlUj4Gc+4yQ1tpvRXtdq+fBF5o6VKFUsxWlGzNo6rqfn00spfqN1j1xf
 c3lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4zbPWm1aozytlfdFTH7ySVK3a3qpOC00xk+suUzXh0k=;
 b=Z/a2y8PJ6xva/dlyyz6mdT9OHEZE5GE5PWNe6RmSA9/A8uVka8pn6K69CctrsObmp0
 VnBRxO6HijinJWtTdl13UySpFmNxI+YsaAaAkxVPqllL6PjvU2F86hNNf143KwZuOwnC
 fldpdm2nKdS0ZU+WussbYB4aHMo4Z7nwJNPQ4FWbBMonbY0wzhto5yiwZ0uz3+7exhb7
 38EGjI4ej+rdI9OFx1I7KWCHQ0KMRi4hITgfZq72tC+mhDbb1LFaPVtzJ1mU1zhPZlLP
 Ao7/XWyWfm7JhvO8P6j4/t57cvxyPhKCqFQ1ohhk5cXodRCfSzgP0Mj8o8Rph1qtx95D
 JOlA==
X-Gm-Message-State: AO0yUKW5GhoiDwla4qmAt11wJBpgD608FujyMcK1R2o0gAagr6tDpnrU
 jTq76q8TwgKllYAfCwJMlINsz8AOvJg6Eb/wu+u+wg==
X-Google-Smtp-Source: AK7set99uzL7byyHfqup9DUh+aJCi9qlVNnxBNt6DlYbjuurWbBOydXkf3z7bjEHT+PrC9NRlVmKbiYzAJVnBHEnxQc=
X-Received: by 2002:aa7:956c:0:b0:5a7:f2a6:5e1 with SMTP id
 x12-20020aa7956c000000b005a7f2a605e1mr468516pfq.23.1675791747405; Tue, 07 Feb
 2023 09:42:27 -0800 (PST)
MIME-Version: 1.0
References: <cover.1675193329.git.balaton@eik.bme.hu>
 <ca6b5e2b87d9e0c9edb361227bb45c29b3ceeff6.1675193329.git.balaton@eik.bme.hu>
 <CAFEAcA9A8rhFqfgGfZXfuDCiTdogL7j41g74ZgcxPxoeMDc3AQ@mail.gmail.com>
 <398ecd29-94fb-c3e8-ee2b-0ff818fb6748@eik.bme.hu>
In-Reply-To: <398ecd29-94fb-c3e8-ee2b-0ff818fb6748@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2023 17:42:16 +0000
Message-ID: <CAFEAcA_v3LyGfAEGgnWEcrwUUjhPSdncW2V_sO14SihTV1dzmA@mail.gmail.com>
Subject: Re: [PATCH 6/6] usb/ohci: Implement resume on connection status change
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, 
 Howard Spoelstra <hsp.cat7@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, 7 Feb 2023 at 17:41, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
> On Tue, 7 Feb 2023, Peter Maydell wrote:
> > I think we should retain this comment in the factored-out function.
>
> I did retain it. It's just above the function header.

Oops, sorry, was scanning the patch too quickly.

thanks
-- PMM

