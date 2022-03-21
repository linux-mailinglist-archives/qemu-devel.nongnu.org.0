Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 094D44E2C60
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 16:34:36 +0100 (CET)
Received: from localhost ([::1]:35612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWK3G-0005OB-Hm
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 11:34:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nWJw9-0002WG-Cv
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 11:27:16 -0400
Received: from [2607:f8b0:4864:20::1132] (port=43224
 helo=mail-yw1-x1132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nWJw6-0002pH-Fi
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 11:27:12 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2e5e31c34bfso80279297b3.10
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 08:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ITJgA2SsVQctmlZN+Lq1QHnGCPn9Xkcmqb4tdjkN+EQ=;
 b=a3Nxj+fF5tP+6Hq7v6g57TIRwkIbYNsoe4CzNpVbA/LO4+p2BuAISdw+nDbdQ9iOuv
 DxFOFsZu8yzJniqAFsTkx12NWGh09vCq0GwhvLo8hMngTlDk0C0/7Ok6GtTwwFi4xylh
 GRk3B+nk5Z3Mm6CcBnivRtIc6R9i+N5IHKQI8//jrH8WPgTm3JISknTlhKsV/KEdv3yS
 NOceezPU+sk5CElrwHNzJBMk9xt9I0xjLc1kpVvWy9QUtWiiObDsSswNpt7HQXxGGQhf
 LmnpYul2qabNh5G9ffA8RMfEQdapoKn+gwtP067dOyLXaOzt7BPpysokDO8OCHusgP8w
 1jRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ITJgA2SsVQctmlZN+Lq1QHnGCPn9Xkcmqb4tdjkN+EQ=;
 b=0NXNjb0L/uthapXifNVuxIZoX55FBC6pkivacQbiJAgdVaws8RHPavGZjv+GBAxyCu
 ncOhSqOn2rq6xUm6WKltWUy4Y7S0MmcluqlfN8rth8/zXleBDH8WxT7udmxUhXTafmhs
 7pUUWq+4OTuaWZUOpXkwt72hydU4AIabDslaRaxONQSFhosSFF8I3zRl8KWTnti8+JcJ
 zBMmixEOssDTJsy0WP7tNfvqhPUvu0qGAwb7aVwCsxT6jRrgm21ubxqGByF7zwj/TrZD
 9/CAbSRCd1OMq8DsOFXLdMaLBGSdIWCU1KgFWoaM9ONzn52Mt1HRz4uQ3kfYUR8XAa42
 2THQ==
X-Gm-Message-State: AOAM533hn4p+qLFEglI4MKcvJGw7CZsPlaAtE7sKyllVb332W84R9Mo7
 hXpdexS9fSAuhHZvH+KLngGIpxqrBRVOiNgXfhNNa4Wl3Hp4Kw==
X-Google-Smtp-Source: ABdhPJzfO7lC7nVty0bGA/bgwG9cNWlgpuR6S3P8PKoaA0XejSKzbLXTO71ZPJfrfJKDYfPSbTD/Z+9/+PuIs00Yn88=
X-Received: by 2002:a0d:fd02:0:b0:2e5:9617:fda8 with SMTP id
 n2-20020a0dfd02000000b002e59617fda8mr24512629ywf.10.1647876429307; Mon, 21
 Mar 2022 08:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220321064458.1517999-1-clg@kaod.org>
In-Reply-To: <20220321064458.1517999-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Mar 2022 15:26:56 +0000
Message-ID: <CAFEAcA-d2RUr6ETzvSuAiCqXdvbiHNLJVgkFuKf5wMyHEa5DLw@mail.gmail.com>
Subject: Re: [PULL 0/3] ppc queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1132
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Mar 2022 at 06:45, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The following changes since commit 2058fdbe81e2985c226a026851dd26b146d339=
5c:
>
>   Merge tag 'fixes-20220318-pull-request' of git://git.kraxel.org/qemu in=
to staging (2022-03-19 11:28:54 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-ppc-20220321
>
> for you to fetch changes up to 3515553bf625ad48aa90210379c4f387c2596093:
>
>   target/ppc: Replicate Double->Single-Precision result (2022-03-20 23:35=
:27 +0100)
>
> ----------------------------------------------------------------
> ppc-7.0 queue :
>
> * ISA v3.1 vector instruction fixes
> * Compilation fix regarding 'struct pt_regs' definition
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

