Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54912299398
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 18:20:31 +0100 (CET)
Received: from localhost ([::1]:56862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kX6AY-00081m-DP
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 13:20:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kX665-0004IH-Bz
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 13:15:53 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:38366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kX65z-00080Y-5B
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 13:15:53 -0400
Received: by mail-ed1-x541.google.com with SMTP id bc23so10215828edb.5
 for <qemu-devel@nongnu.org>; Mon, 26 Oct 2020 10:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ai6RaFRCXCkUW0OuzoM32f4zvP1b4tXnEOZCvs5/W/s=;
 b=Q4024UNpJsl8FHzmSqO1zeS2FS/xkD/TYY9R8FKvIiIgN2KvTaq2/TzPg1TW6VJYxV
 2qZyRe8wJD41dbcRQ+zgx0wFG1EhCiXNfe+4gHReYltaGWn+9s04d9HTuFJb5ey0XEOQ
 Fv+Zs83PYtUO54wjBQYN3iNq7ptm1gXs1dspvEAIFyoNQ26/TAIvmN2nQag66LgWJzyf
 0F79UYxxyvV9ZadzJp6sNfQdzesU3fpk1KiYfx1UOKsyZVIzwZ/ZtXMCu4BE8PTOlERc
 GA2wC5OE4RCgJJcUrlXPDTjb3mxLcc5SiynIDuXOU+Rlk4VBNcMS11a1IrZGvBcGYKLP
 2dVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ai6RaFRCXCkUW0OuzoM32f4zvP1b4tXnEOZCvs5/W/s=;
 b=J/oXaKSrLbM+1jqaEGtxu/cM8TGu9w/ew49dLOA4/dVFplHnGH8oIl9rsjjNLZKSL3
 H47z+rLi/Vx7FyLodS3DoFUJKRV5FTstncNVokv0pwslccYXVUZeN2COysV+ErwoMzTk
 Q+80yj1tgjwFsPV7b9i/F+DKXKUhM4JsgpJ9aDQp238Jw5YJYfS+epn45AHEMZ7tASJ8
 gTchtwOTF9OGb+7s0A2PysgGvtbcQHzX3pm5KwuMhgccxg79rx6tKCrnj60jEhSjhwlW
 UKZbX/a35NdE+yQRpvLDZGegA1/ON/JO3Tdi+l84BX2o1wQk+EBYnCRjtmrZli4rKrA5
 vVcA==
X-Gm-Message-State: AOAM533mBgCmOALBgy/M29NH2pJT09TA04ZExCP4d3uL6aIDcydQ3p3D
 aEXiAH7DRNcxEFRUl5KPeRWs5CJshhkWqPWM1YMTfg==
X-Google-Smtp-Source: ABdhPJzozDySIik0SkCI26PaRPFx5MdHOaBEGMz9JLTbtfYpDaqXyl6ReP+ZdpRH8CA3HPI77izgbm5VgEV05FGysEM=
X-Received: by 2002:aa7:d699:: with SMTP id d25mr8862915edr.44.1603732545027; 
 Mon, 26 Oct 2020 10:15:45 -0700 (PDT)
MIME-Version: 1.0
References: <20201023210637.351238-1-hskinnemoen@google.com>
In-Reply-To: <20201023210637.351238-1-hskinnemoen@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Oct 2020 17:15:33 +0000
Message-ID: <CAFEAcA97Y2arMBKRjTwWXSym-g_nAXu5gZ1G=DA5q8GLw_=K5Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] Additional NPCM7xx features, devices and tests
To: Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x541.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, venture@google.com,
 QEMU Developers <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>,
 CS20 KFTing <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>,
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 23 Oct 2020 at 22:06, Havard Skinnemoen <hskinnemoen@google.com> wrote:
>
> This is an update to the initial NPCM7xx patch series adding
>
>   - Watchdog timer support. This makes the reboot command work.
>   - Random Number Generator device.
>   - USB Host Controllers.
>   - GPIO Controllers.
>
> The watchdog was implemented by my new teammate Hao Wu. Expect to see more
> patches from him in the near future.
>
> This series has also been pushed to the npcm7xx-5.2-update branch of my github
> repository at
>
>   https://github.com/hskinnemoen/qemu



Applied to target-arm.next, thanks. (I fixed a stray blank line at
the end of npcm_watchdog_timer-test.c because 'git am' happened
to complain about it.)

-- PMM

