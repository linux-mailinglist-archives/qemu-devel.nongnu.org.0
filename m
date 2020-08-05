Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA4B23CEC1
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Aug 2020 21:03:55 +0200 (CEST)
Received: from localhost ([::1]:50330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3Ohe-000830-96
	for lists+qemu-devel@lfdr.de; Wed, 05 Aug 2020 15:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k3Ogs-0007Uc-NX
 for qemu-devel@nongnu.org; Wed, 05 Aug 2020 15:03:06 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:36763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k3Ogp-0003S1-1f
 for qemu-devel@nongnu.org; Wed, 05 Aug 2020 15:03:06 -0400
Received: by mail-oi1-x22a.google.com with SMTP id l204so11804220oib.3
 for <qemu-devel@nongnu.org>; Wed, 05 Aug 2020 12:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iREQpVcvmUgkRTy82rJE18VB38/uIikwuQyiEWDCr0Q=;
 b=yzE93/A+vvmyc2tni7zWiCCToouuSsHdIXdFpJ0Ed7nwXClToBqE9BFoNhRJikFTs7
 /FxrmBzPMMqKA3N6Ln/j1XtkD0UEVsPEmL38KQmoQY/uzF3OLOyeSZfz2z2KWx5dNwrd
 /Nw8jTsGiPB1LTtxRcvHVkaomvniF8Fjva55iEOsSHT39ok0MyJXC/j1iQgXP/qIGxN0
 rdbJ+jvW5+FZou8n3dMQVtfHTU82RC4KjnVLIp7YqQ8w2P4XrQT5MvQ+zy9+iZ6LT151
 PEMSrK4MVztLngMVW2n3vc/2EEpt4YYKmBGJnVyDrwQGYHY/Uim8jNo15rrl8Tv6taNq
 c7EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iREQpVcvmUgkRTy82rJE18VB38/uIikwuQyiEWDCr0Q=;
 b=gQwYeIccx997FRGeKvrJpq1UtMaLzhJImYAE5K0l4liNNJ0xQbG03278FWFz5mUCVI
 I5iQsRIrF2Q38WO95rk9TFQLhJkIQ4ZVaoIqeVYeXxl++KfY9Krq/GIVhLv5tI1KHI77
 2eanWc1IEfcG0uEK+bqmPtPHTo26HfFVHqtEfWAo0nBX+dijRWeiCOSREPfbjlS5Wsq4
 N1bNhRTGBZyyNO5hjpN7mQc1YaGL9MCFQpYzDeNzqVUiQkKPi2v9tTR8+dj/OvE2cHPZ
 tiqJ3FvspBeLwoF5zmQm3ENjxcfCAwUqDFrmUA+C6fYRSFIf33F+y2YKudCCAjcuAMgo
 iDzA==
X-Gm-Message-State: AOAM530tgsEUf/0K0lN85cEWf7MLdiJipI+1coZBMO6WQLSgHnGUfeHy
 Ie/qRqUnPbykXkSBl1TBuLvIkymdqRJJZjoc/DIcpQ==
X-Google-Smtp-Source: ABdhPJwkH7R1Fb+tri/6ZRD69nfZsXATUAIIjVHriW/AwHlvHgmDLL8K7vMRfMjZgIsxQPePO1xz6gLTxuH5uSZ1v2Q=
X-Received: by 2002:aca:5703:: with SMTP id l3mr3727440oib.48.1596654181520;
 Wed, 05 Aug 2020 12:03:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA_6zbOfdVi+Tp18seaEy4don1GurVya+E+QXRGrZ_WVLg@mail.gmail.com>
 <2c5ed9d8-6d79-1b53-5588-8fb9efebf0fa@linaro.org> <87tuxhkpo2.fsf@linaro.org>
 <CAFEAcA8+acTg6KoBDW5-7FvnrW=vDMXohWfTAXtTFv6BDqyuRQ@mail.gmail.com>
 <a1e53e0c-fbab-a789-5f07-cfae99b6042a@linaro.org>
In-Reply-To: <a1e53e0c-fbab-a789-5f07-cfae99b6042a@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 5 Aug 2020 20:02:50 +0100
Message-ID: <CAFEAcA96CBz_h6xzwdRL_Ls2rGjLEKi02uXB6DS2Bp-56Bhe8g@mail.gmail.com>
Subject: Re: v8.1M cpu emulation and target-arm feature-identification strategy
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x22a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 5 Aug 2020 at 18:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
> I've always assumed we'd never get rid of all of them.
>
> Older ones like XSCALE are obvious, but I don't think there's a clear indicator
> for V{5,6,7,8} either.

MIDR.Architecture lets you distinguish v4/v4T/v5/v5T/v5TE/v5TEJ/v6,
and there are also some separate per-feature ID register fields for
things which we currently hang off those ARM_FEATURE_Vx flags.
In theory all the v7-and-later stuff should have its own ID register
field...

Regardless, it's hard to see a clear benefit from a hypothetical
concerted effort to convert all the ARM_FEATURE_* uses to ID
register checks, though we might choose to convert a few here
and there if we need to overhaul the code anyway.

thanks
-- PMM

