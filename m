Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAC85FF374
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 20:12:29 +0200 (CEST)
Received: from localhost ([::1]:56954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojPAa-0003fl-Mq
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 14:12:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ojP19-0005RR-Bp
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 14:02:45 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:41796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ojP17-0003QC-LJ
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 14:02:42 -0400
Received: by mail-pf1-x433.google.com with SMTP id g28so5584517pfk.8
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 11:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O0cHMS0fTrILr6zx0fkG2j8GYVombfqCH0iel4nFKAw=;
 b=OALRlVaNowzDEsNzbCvEGa8iQODArpjcQMvT8Dyuk9Ceq4DNy3fBoOoMLbj3otyEM0
 OkCZtt9QsedOxFhmSZAIh3GXfXAB6Km+9PYMYIYXniBPjOfDt5D6ftHgaHfKeMpRIc5u
 fmJGk2krO4dCTBGGtsz2jDmaE4cs7Y6lCi9goIC6DYaFdijlKDrZkIcsDdmnXGjgEL1r
 Jq1At46MdumWagkk0SsWYnKC2MBtgBioidlCvtjt1DWpmNZQg/bzdtTtQJqQ7bWZX/IH
 YNa144Dih1zW6P/KnNyrSe70eEihAvhvKSOCkkznZSlADnzneG0bf7Ia1iHp0sc+BNSe
 WdbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O0cHMS0fTrILr6zx0fkG2j8GYVombfqCH0iel4nFKAw=;
 b=VTWTFD1TZBz3sJhQbClTxOLG1ecU31TWM5P90sOvbBQlpXIHtQCBL5WJlV3EPNYdFz
 ti56+9lAjITQnWcDYRaqGaO/BkdHOHwV90dELaSO6JW11g2ZOFe8JOi0fxozY9W+3BIy
 6pBl060yXpOFi/8lTTZTvU14MVn48C5Gw1LcIe3Kjd3GnrcS9xoSfnC3dl05P9+1B58J
 1Kr/DrjpWv1+iogpwWcJ53TVkpmKqaPQJ97wniyz+t0a1naxKjSDB0hFP1lTNzzkdO2P
 ZdWFYIPpT2FEry7gzswF1APhp6v2R1/tn3BRToIhtM0PcBBJvEIWUlXvYl8PvGP2uacs
 9pLQ==
X-Gm-Message-State: ACrzQf1jhu+vtR0DDjNvKdu5gPg24lPfjgiKcGVQq4PQphNF0hDK/98G
 8b1QmSj9crvdjEsL1Apruu3YL20sOEgmY0qkwZM2ILTue+0=
X-Google-Smtp-Source: AMsMyM662yH1yIMGAz7eRuuShS06VDrHfr4h1k2BMzrBxweTo9ONMHjgiiEo9CAEH8BLC833pu8eRhDB/vUgrUeBImM=
X-Received: by 2002:a63:2212:0:b0:43b:f03d:856a with SMTP id
 i18-20020a632212000000b0043bf03d856amr5580763pgi.192.1665770560461; Fri, 14
 Oct 2022 11:02:40 -0700 (PDT)
MIME-Version: 1.0
References: <20221010153225.506394-1-alex.bennee@linaro.org>
In-Reply-To: <20221010153225.506394-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Oct 2022 19:02:28 +0100
Message-ID: <CAFEAcA_CEFLejvFBYhxR+AomKiBziuh=wMWKfnBkuiKQtgQWYA@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: update the cortex-a15 MIDR to latest rev
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Arnd Bergmann <arnd@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 10 Oct 2022 at 16:32, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> QEMU doesn't model micro-architectural details which includes most
> chip errata. The ARM_ERRATA_798181 work around in the Linux
> kernel (see erratum_a15_798181_init) currently detects QEMU's
> cortex-a15 as broken and triggers additional expensive TLB flushes as
> a result.
>
> Change the MIDR to report what the latest silicon would (r4p0). We
> explicitly set the IMPDEF revidr bits to 0 because we don't need to
> set anything other than the silicon revision to indicate these flushes
> are not needed. This cuts about 5s from my Debian kernel boot with the
> latest 6.0rc1 kernel (29s->24s).



Applied to target-arm.next, thanks.

-- PMM

