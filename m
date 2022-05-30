Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 634595377BA
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 11:40:19 +0200 (CEST)
Received: from localhost ([::1]:36636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvbsm-00010N-5H
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 05:40:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvbp4-0007ng-V3
 for qemu-devel@nongnu.org; Mon, 30 May 2022 05:36:28 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:39694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvbp3-0004N2-8y
 for qemu-devel@nongnu.org; Mon, 30 May 2022 05:36:26 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id f34so5055127ybj.6
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 02:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fokwcmOkaG3PZymgpDcbv2T+l3kkUhPgHBsJOE6liqo=;
 b=VH5NXWFODsKPh4CC0mqkMI7yx7bnnpyWe7PVIMP43QUBwZMfAGPh5NUZd6wkXZ9JRk
 XoO2QtEPOiimG4liYvDCesbqQ/Y+ODgeSMqBInxYXHQcig41MpUArBkbqK7PMNOomtPV
 qmIOYgRsKASI6B0pqT+UNS3JG08xtnFYTDs6NXpyh5h8D0QKXoGIeGtAyj5cZU00Rd9h
 f9vSmtD4hfy3iiEvlDYVLBy5c5h+SoytwWt1IsHpcfxj3ZYbhQ9U52/AJIx6uz50bH6N
 VLTi5D6nYUJsmT5q28p2igAiMEbIV0aGza2BYzKUf5in69zjeyASmTjjWZCfTwOKY3LB
 IJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fokwcmOkaG3PZymgpDcbv2T+l3kkUhPgHBsJOE6liqo=;
 b=zfGMttijJJw6NskhgO/xXbKuB2FvlXOkgsSMRLErJIBQF59zIhGgZA1Tnj1kdCLk/0
 RmfhP69h9UHurgYv6gKkAfdKuMrBmjYFIf7rpVPFR6Xqk3ueYlvXYxmH/cxTkYz9tAd6
 MYNSM3cIBr3M7GavR+GGl5zRibMbtl1m+pYl3agL+DpgKBnFB4L6o4gJYgZ3hgmcw43r
 Yvbzm76YUKI4dXQ27q42TAdSISw5q/mj7C37LOmOxNLgzHa1TN2LatP3pEcv6E0WVLw/
 LxNUQ0DXd/qEwTVk9sNaQZUNvHvvPsddZYYeqAzxAoeCHaqh/6lCE65h7MHtoUL/P8Gb
 EQAA==
X-Gm-Message-State: AOAM530xjP/F+xXkwJVFV+12PC9cAGy9xdZ2zTdF1batiXP7aZoYr0oI
 MCnb0ZxQEacLOzhoo2AsYgxI7Raa5jnqGcmJiAA2yg==
X-Google-Smtp-Source: ABdhPJzNElStC+9b0JNHfN8eqKH4cnjNVU10BgaISHznb8NIYLT8N0uaYXPK4HbQIzwSdftLS1nVgMxOfr42M9awHk0=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr52520937ybq.67.1653903383993; Mon, 30
 May 2022 02:36:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220525161926.34233-1-philmd@fungible.com>
In-Reply-To: <20220525161926.34233-1-philmd@fungible.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 May 2022 10:36:13 +0100
Message-ID: <CAFEAcA9cxo+uyb-hXGi0m2+8bcKakmq2U7reG=e2fHtwyppw2Q@mail.gmail.com>
Subject: Re: [PATCH] target/arm/hvf: Include missing "cpregs.h"
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@fungible.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Duncan Bayne <duncan@bayne.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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

On Wed, 25 May 2022 at 17:19, Philippe Mathieu-Daud=C3=A9
<philmd@fungible.com> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> Fix when building HVF on macOS Aarch64:
>



Applied to target-arm.next, thanks.

-- PMM

