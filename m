Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DD74AC87F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 19:24:49 +0100 (CET)
Received: from localhost ([::1]:50962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH8gy-0007Cv-5h
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 13:24:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH7uB-000837-7F
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 12:34:25 -0500
Received: from [2a00:1450:4864:20::430] (port=36539
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH7u7-0007hI-Kg
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 12:34:22 -0500
Received: by mail-wr1-x430.google.com with SMTP id i15so3768945wrb.3
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 09:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sU0KP4W5nwhsy8Qd0XAZbxiNLH82BEYFHnL0QzVeSXw=;
 b=pwcmca+XTUtr6P40X6E1x0B7Evs1a724sdynQUc1dgItDMkxhbMi315eWm5gzE4L89
 IBHWWpwyhGG1zk3kdl6wR4gvdA8jr+l9TV/H6zjFnXv79bN7qNeaAB7v+kewf1uTU6xo
 f99rO/D/g3kMMuILQvG2yaoCELJ4awGqc1SbGndbz0MS9Y4QMHSlvm4D8OoPYFf6oVzy
 ntQe0qaUo72dQsZk1AbkAtFQ1OHf+ErDooODuL08+7+6149zCEnDg2hos63ZvRDAf0uk
 Zne9sCBjoG+UDwn536B5+Fuev6n30r3XDoefvCPl9jiXC9SpSYV2W9KKcWPKepdEsFow
 Davw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sU0KP4W5nwhsy8Qd0XAZbxiNLH82BEYFHnL0QzVeSXw=;
 b=xWof05XCC6mSYRwYzpsMxAFyICSIbGUcpoxSeUIWaY42/KTq0jIl7v+xOULIG1oKGh
 5r/8AvfBCgq7P9oCl7uA89e+agxFVjKeYNCejC0zDZL4l79QaVusAs//bxQ2YCsxWRMb
 Pe0aKUlBv3VkE2cdO2Rw/ftAnfbZu8MsQSoNa677UmHMT9tUByBAdI1vQGaXUdmaNZEH
 2R9pTKbnDKw0E3k3EiUUXaiZNOwmB8rol64/VjMt7c1DfZw+DOr53ezPNR7iSTgr2LrD
 elPC4wk1mp2o6fYJTOeiFN5X8TaBz95/Ol8QPOrfi40mCZSvUfw8s04Aek+2aD6N653P
 zzSw==
X-Gm-Message-State: AOAM533ADc4ztO6k2BG5rXegr2WA8PdELv8/TRhDqjiNFF8kIvO/axnm
 O4582aknQ7XyUUto3LgYoPl2m2taOXSqnM8VVNZrPw==
X-Google-Smtp-Source: ABdhPJxrqD66rVkuubyJSz4C9oEYktmmjc6SkuDmD0bIopa0NUZAzFrIMQDgUYzc5QugPWTdc7aipaW5OUwTYqkZC40=
X-Received: by 2002:a05:6000:15c7:: with SMTP id
 y7mr409099wry.319.1644255257352; 
 Mon, 07 Feb 2022 09:34:17 -0800 (PST)
MIME-Version: 1.0
References: <20220206014120.2871459-1-venture@google.com>
In-Reply-To: <20220206014120.2871459-1-venture@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Feb 2022 17:34:06 +0000
Message-ID: <CAFEAcA_k0y3gtzpi_0JG7TM=VaAa8+mb=tLSu7UHCRYhDWajZg@mail.gmail.com>
Subject: Re: [PATCH v2] tests/qtest: add qtests for npcm7xx sdhci
To: Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: lvivier@redhat.com, thuth@redhat.com, Shengtan Mao <stmao@google.com>,
 qemu-devel@nongnu.org, hskinnemoen@google.com, Hao Wu <wuhaotsh@google.com>,
 kfting@nuvoton.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
 Chris Rauer <crauer@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 6 Feb 2022 at 01:41, Patrick Venture <venture@google.com> wrote:
>
> From: Shengtan Mao <stmao@google.com>
>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Chris Rauer <crauer@google.com>
> Signed-off-by: Shengtan Mao <stmao@google.com>
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
> v2:
>  * update copyright year
>  * check result of open
>  * use g_free instead of free
>  * move declarations to the top
>  * use g_file_open_tmp

Fails to compile:

../../tests/qtest/npcm7xx_sdhci-test.c:121:32: error: use of
undeclared identifier 'NPCM7XX_REG_SIZE'
    uint64_t end_addr = addr + NPCM7XX_REG_SIZE;
                               ^


-- PMM

