Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 661D72D7831
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 15:49:02 +0100 (CET)
Received: from localhost ([::1]:50288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knjj6-00059E-9u
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 09:48:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knjgW-0003TG-OX
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 09:46:19 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:33250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knjgO-0000Rb-MU
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 09:46:16 -0500
Received: by mail-ej1-x644.google.com with SMTP id b9so12721158ejy.0
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 06:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E/QXE6Dp1WojnzptChsobRJCnxriTuOC+w+XlEAsmAY=;
 b=UF5rb05pnbPzZEOULtgIEga/Yj4F1nH8uNy8Hd6yvJvKh8+BM7KSIHtnYAAO4fc1Nn
 KPUzDpktHDrxWXlGOwDvISN9OMsT1uJ1zAu2QI4Z/YrpACAW9NYy4dsfDRLGjm1YBtSL
 5K2683tn6yoyf45gP+hVDNyMg1Mp1udV6U5txzoM3cLquK1AGxg3xgsEdLe1y4FwCftg
 Nxwafyr3ZUB4p0Ao9O2Rw1GZqUZICvQzH649dQ/k7SLLyJmtdgTyaLT72ka3hqwn7HsC
 di8yg5tOYjFG1OS7YTVHd9V+IMs0S9GbnXGk2ERXbyWDiipVQd1QKnm1uBmnuVItWz1I
 LiPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E/QXE6Dp1WojnzptChsobRJCnxriTuOC+w+XlEAsmAY=;
 b=XA3kcETp/B4aypD2ttyWauDZL4HrfEpWYnx7Jn0kcEHED4P2Fscgp3RZh1vr8DnsM3
 QkfNZiQK1iSOjPsuTUXGajjwvHd64jaEN9n2hkaVzD3dOf6Pvsy7huLzHS3y7xJNK1+H
 i26xrtD1mC5jJmEltLOuFj7+zO5C9yjwcGcQj/flqW3u+ii1Zx3IlaPhSeAVMluwBEDN
 u8kpretX/TrM7nIpCKoT5zGJDYSL+1E3vMHjcOXC4/bt3v9E/mFujHGrIlXCM3Kp74P2
 Ghafrjyj1o+2oj/YJGBpOprVzV0g+MfsizOFU8OtZQLsGwV8ocPXHrAgjwwpPXo9La6l
 lfKA==
X-Gm-Message-State: AOAM5307CAH5Y5uUJRvu+m0ad1kzA+YcEkMzWr3kHZT++kXtihttvqNS
 /hWUm1u+ETBlgneSSbL9Fuy2xxJ0Q6o7RpPsVpDMJw==
X-Google-Smtp-Source: ABdhPJwsQ3Kl2L1jo1l9MDz+5IYNHQIpYRR1s2b1FmRpZCNqyPGps6Df6lcLV96Qm6CJnnMJceqoWl+ys8XsjIxolHw=
X-Received: by 2002:a17:906:1151:: with SMTP id
 i17mr11518565eja.250.1607697966268; 
 Fri, 11 Dec 2020 06:46:06 -0800 (PST)
MIME-Version: 1.0
References: <20201208122306.8933-1-leif@nuviainc.com>
 <20201208122306.8933-4-leif@nuviainc.com>
In-Reply-To: <20201208122306.8933-4-leif@nuviainc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Dec 2020 14:45:55 +0000
Message-ID: <CAFEAcA-vT4eAxn7K=ULu7wGomfW7akEG=eSVGp4j7CSKtksuHg@mail.gmail.com>
Subject: Re: [PATCH 3/5] target/arm: add descriptions of CLIDR_EL1,
 CCSIDR_EL1, CTR_EL0 to cpu.h
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Dec 2020 at 12:23, Leif Lindholm <leif@nuviainc.com> wrote:
>
> Signed-off-by: Leif Lindholm <leif@nuviainc.com>
> ---
>  target/arm/cpu.h | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index b54d1dc092..5e9e8061f7 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1713,6 +1713,30 @@ FIELD(V7M_FPCCR, ASPEN, 31, 1)
>  /*
>   * System register ID fields.
>   */
> +FIELD(CLIDR_EL1, CTYPE1, 0, 3)
> +FIELD(CLIDR_EL1, CTYPE2, 3, 3)
> +FIELD(CLIDR_EL1, CTYPE3, 6, 3)
> +FIELD(CLIDR_EL1, CTYPE4, 9, 3)
> +FIELD(CLIDR_EL1, CTYPE5, 12, 3)
> +FIELD(CLIDR_EL1, CTYPE6, 15, 3)
> +FIELD(CLIDR_EL1, CTYPE7, 18, 3)
> +FIELD(CLIDR_EL1, LOUIS, 21, 3)
> +FIELD(CLIDR_EL1, LOC, 24, 3)
> +FIELD(CLIDR_EL1, LOUU, 27, 3)
> +FIELD(CLIDR_EL1, ICB, 30, 3)
> +
> +FIELD(CCSIDR_EL1, LINESIZE, 0, 3)
> +FIELD(CCSIDR_EL1, ASSOCIATIVITY, 3, 20)

The ASSOCIATIVITY field is bits [23:3], so it's
21 bits long, not 20, right ?


> +FIELD(CCSIDR_EL1, NUMSETS, 32, 23)

Similarly, NUMSETS is [55:32] so 24 bits long.

> +
> +FIELD(CTR_EL0,  IMINLINE, 0, 4)
> +FIELD(CTR_EL0,  L1IP, 14, 2)
> +FIELD(CTR_EL0,  DMINLINE, 16, 4)
> +FIELD(CTR_EL0,  ERG, 20, 4)
> +FIELD(CTR_EL0,  CWG, 24, 4)
> +FIELD(CTR_EL0,  IDC, 28, 1)
> +FIELD(CTR_EL0,  DIC, 29, 1)
> +
>  FIELD(MIDR_EL1, REVISION, 0, 4)
>  FIELD(MIDR_EL1, PARTNUM, 4, 12)
>  FIELD(MIDR_EL1, ARCHITECTURE, 16, 4)

Any reason not to define the other fields here?
FIELD(MIDR_EL1, VARIANT, 20, 4)
FIELD(MIDR_EL1, IMPLEMENTER, 24, 8)

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

