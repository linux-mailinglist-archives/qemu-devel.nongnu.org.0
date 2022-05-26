Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4405351B6
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 17:56:21 +0200 (CEST)
Received: from localhost ([::1]:53444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuFqV-000257-Nm
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 11:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nuFoL-0000ny-38
 for qemu-devel@nongnu.org; Thu, 26 May 2022 11:54:05 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:36687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nuFoJ-0001Tk-Ec
 for qemu-devel@nongnu.org; Thu, 26 May 2022 11:54:04 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id t26so3582084ybt.3
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 08:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BwttWzckPGVuWP72wF1PabwLrM+OAc8xNfRmrrcbhF0=;
 b=g8N4IUHP3V9Tmsr9aJi2IZcrOdkMmURKoXeDrAj27wvStzr0LL9nHkWWnCeAr8GQum
 CfOvZqU4r8IyHSK1TvXCsRbjg8pNrdh4sDfAfb1LmoIH4MHBVJhZznCyjLOpyaAEW8CN
 FokaBIRUThdpzmeooijpcdqhn6SpdTTL3GMDU2GGxxedxCquY4Q1E69ltW5CpOfdMH9h
 717YnOEiSxDtr+UR14D3t5LD1eh2mLSkX5wdGVqDEuklHuO2S8GnEuqQF0TpZV4R4JAJ
 AEyXbpvPmQ9GwLFzjkWcbjWH1/l3F5gjSOBEp/jMGteQTXNN3sf6dulUC2AwrOhP9GFM
 hpRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BwttWzckPGVuWP72wF1PabwLrM+OAc8xNfRmrrcbhF0=;
 b=GfndVQcDTNRfhKeDYXb6EFhPXhU0SkUgWjM9rSqiaQS4bxJGkA6xOhXmeMnVQW6YXP
 p0p1UX6YyTGIJ6aRR6VOKGg8HvUVloECY4OIJnA/ZqqUliVyb8Ljb7IxCorro2sGu/J8
 wHIxn6SVh+b8SiO/9xaE8H8zhhV4jKL88z9BC6hIZccCSmXHv4elBBmduRmq1W3cGv7R
 2ZuhpseeK/qZRJMYwgN34jJ4ag8RhFODmwEQaU9WvJYNQQhB+vh8vPc6hT5jNMlNx3i6
 4OunwYgzRNqPOvELeBunxPxGpTNzTN91dGRt1KI/blV3dQigSTdcWsy3doP5cMgBmk9T
 Pugw==
X-Gm-Message-State: AOAM532YToM511cat1BQrzWlZCAxtVerdpGX6aN2DYI52h4bv3b1QzY6
 XY6EiEwHLyQyV6T/NQSTCbiczxaDiOXalrBMuNjXfg==
X-Google-Smtp-Source: ABdhPJw4mTaqGSvuu6wO2my/frw5ZhLbFmAsSzsTkYPq1Ezjqn4FdsL8leZo228XMrMFo7tB8KZlbBOlR7sDJPT62n0=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr36413082ybq.67.1653580442083; Thu, 26
 May 2022 08:54:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220225174451.192304-1-wuhaotsh@google.com>
In-Reply-To: <20220225174451.192304-1-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 May 2022 16:53:51 +0100
Message-ID: <CAFEAcA8vcRme05raLOhtaxmvbbLhLrSZwEaz1BVk5uUYSdmL6w@mail.gmail.com>
Subject: Re: [PATCH v5] tests/qtest: add qtests for npcm7xx sdhci
To: Hao Wu <wuhaotsh@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Chris Rauer <crauer@google.com>, Shengtan Mao <stmao@google.com>, 
 Patrick Venture <venture@google.com>, John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, 25 Feb 2022 at 17:45, Hao Wu <wuhaotsh@google.com> wrote:
>
> From: Shengtan Mao <stmao@google.com>
>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Chris Rauer <crauer@google.com>
> Signed-off-by: Shengtan Mao <stmao@google.com>
> Signed-off-by: Patrick Venture <venture@google.com>

Hi; John Snow tells me that this test fails in the tests/vm/netbsd
VM (you can test this with 'make vm-build-netbsd') because the
assert() on the ftruncate() call fails:

> +    ret = ftruncate(fd, NPCM7XX_TEST_IMAGE_SIZE);
> +    g_assert_cmpint(ret, ==, 0);

> +#define NPCM7XX_TEST_IMAGE_SIZE (1 << 30)

I haven't investigated the exact cause, but this is a
gigabyte, right? That's a pretty massive file for a test case to
create -- can we make the test use a more sensible size of
sd card image ?

thanks
-- PMM

