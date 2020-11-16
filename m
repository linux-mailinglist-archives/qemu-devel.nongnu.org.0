Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7EA2B4EEE
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 19:13:41 +0100 (CET)
Received: from localhost ([::1]:53180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kej0W-00063s-8t
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 13:13:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keiy3-0003pU-R7
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:11:09 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:36231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keixy-0007wb-5G
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:11:07 -0500
Received: by mail-ed1-x52f.google.com with SMTP id m16so4817369edr.3
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 10:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RT0jlX0ubOX32fhE2o+OulnvdpivMF5M2UR9a367nC8=;
 b=dafWpPFHSlnK7GeUkHPMWpuZHJsfA6AtA9HreTS8iAvPJIQ2X4cb6PKdmgl0vGg2Kp
 bbVw8LhkYtrOzFJKnXCminHyj/OleNWMGhY8XP67fd8he/Uu3ut5kbXiwqwkO8JlCVJC
 1bFHMBV0xy17iwbNufASJW8rlTiqzuvEkQAqseiQ0KxEiuJ9bbBhMaVAUUDmOdw4xdzk
 ok6BWISeAzOPQnxHgX8hAQX+97pm9kZ99bM9zqYtvtM7F84off3RyITb8rzpMz6U/vZZ
 Mch5tzZr9Gc8opx8V43C2XIGWbCNOjQaPgBMca/ZHJJuWTKrd9Ze/LTm9hXb0qugKA4z
 VIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RT0jlX0ubOX32fhE2o+OulnvdpivMF5M2UR9a367nC8=;
 b=X7uNO3kC0VbX7VaPBf25vqhbZQIMNNzbNBfle594SGcu20kwsm0IcPCt9K0Vd6vKWe
 x1cF0Z+8439ze02ni0Vbmmd+AjOTu+jfeYOuRDeMUpogaJzrpXz/C99bIwrOiN9+9n8R
 ayKNhHg9zKFt+v9GAALXgGM0jG89MIQyPcwUkIceMkbhO8r2ggc4UGUY6wD8n+s4N0Hh
 a0OA0hoiOpW/QNzfBfed8gdoqM1Xlg6LBBay9j60XufvqVX5agmWoOhexiB9r6x6h0uz
 UnwnJL8ZIn41ZFPpXGuL32xWpGxqFz68EkW/bvEKxklzmnCqKFQ/LZnF+2QlGntocGrB
 YAbQ==
X-Gm-Message-State: AOAM5310Yw25BXCYiYzUB84yOWYd4y9rcdPcemrdIHGbmaEUX26tDOji
 QAk0ZxmJzp+aIoBF8z7YohHBO1qVqkJ79VDWFtkhQnYYTLs=
X-Google-Smtp-Source: ABdhPJwpVhqLpdtxHVZIiu2FpdR/3vLJuXWbuTxsBlTpcAZk8fpNZD1qCIiB7ZRpYGp8RFt5VSoCNVol9yIqwZxQqKs=
X-Received: by 2002:a05:6402:b35:: with SMTP id
 bo21mr17905806edb.52.1605550260057; 
 Mon, 16 Nov 2020 10:11:00 -0800 (PST)
MIME-Version: 1.0
References: <20201115162613.74645-1-thuth@redhat.com>
In-Reply-To: <20201115162613.74645-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Nov 2020 18:10:48 +0000
Message-ID: <CAFEAcA-WtA8jcSZPvGONyjyodZXnNiB0NiOL2OQBmTugdEoKdA@mail.gmail.com>
Subject: Re: [PULL 00/26] Fixes for Lesser GPL license statements
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 15 Nov 2020 at 16:26, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter,
>
> the following changes since commit b50ea0d54bbca7d440315c3d0c0f7a4d6537b180:
>
>   Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20201113-1' into staging (2020-11-14 11:22:07 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/huth/qemu.git tags/pull-request-2020-11-15
>
> for you to fetch changes up to 61f3c91a67c4695dee6904d841b393ea21003969:
>
>   nomaintainer: Fix Lesser GPL version number (2020-11-15 17:04:40 +0100)
>
> ----------------------------------------------------------------
> Fix Lesser GPL license versions (should be "2.1" and not "2")
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

