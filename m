Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDE33193C3
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 21:00:47 +0100 (CET)
Received: from localhost ([::1]:47106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAI8s-0007tL-S7
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 15:00:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAHwb-0007gT-60
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:48:06 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:46810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAHwY-0008Nh-9p
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:48:03 -0500
Received: by mail-ej1-x634.google.com with SMTP id w2so11815739ejk.13
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 11:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s0WU/TCDAbZKSlXlpwXy1hXFbTyH0JhBZdT9MZAzH+o=;
 b=Q55mLf5yhoqvEwz4iZlHcc/ZJNJOODjApBjTnD9doUp9wph5DA2RPQZnjbmwSn8isD
 CbGI/31RdhUp0oRAt4ubwA9hHBvccmau3l9F1jY+zUqeerJQrbKV4hXKnUHrkbB24aEF
 sUgOFlclZg3nmf8uRuXJhQXTehB/Vt388D9v1hLRQgMvgKnf6JKisAo+nwiGzhn9DVJY
 F1b4vEOqamqzjdLwJRopwbc1B123hPAFJM0eekfC9wNbh+Mwu1xB4rpVSrYuJX7glWTM
 j/sfqb82XZfwSXRjnC7xL9u1sy2667MiV1JcppDjW0MJPJE5DHr2wLGVR7fQqRHjPWo+
 fd1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s0WU/TCDAbZKSlXlpwXy1hXFbTyH0JhBZdT9MZAzH+o=;
 b=jibPjbcMCQmxmaSSI649nPTAUCNR4/3dv27r44QqHNzxuPdM0i7PQQYehgmLBwGriC
 DM+BHuRkQIgXQx7TmPZ8vvChNETb6K/d/tFMLmzQKFBX+8AVcfn7nuMMnl9nj88yp5mC
 WbhT0cnwqKTkP9JYqzvKGPJcJmcaaBlDOYFnmozKwNcwU3AheHDOBFKBSrJ9VHJpM6sh
 fhGZ+ftydZldDzK9aVNwRlyx4ofgZC9VSlgVQz5nnXbO41qQHUALLs7+AtVA6EPCY5ko
 rmS33Z2rWqhWruPdsX6QL1J7JAfhA6Hlv0SdeMwScK15WYaHGt0wYVViSa6GwGuUENc7
 eRZw==
X-Gm-Message-State: AOAM532bOBmoxaBaPow99Y8J/H8zL1lqoYHK4zIXLDWyZDBUSP4NV7cC
 W1tjcNHBm5mJJLZjSqyV0Fzp0a2v1L92HkV1xWyJ1A==
X-Google-Smtp-Source: ABdhPJzBq6mGWY7EW9SLLTW8mliKeXRR4SNd6zz1197fnLKqoCfrT6eoiD3mmRQNazvoRZmMztOfsAfhlZmx1+GArXY=
X-Received: by 2002:a17:906:2e4f:: with SMTP id
 r15mr10038826eji.407.1613072880728; 
 Thu, 11 Feb 2021 11:48:00 -0800 (PST)
MIME-Version: 1.0
References: <20210209015541.778833-1-dje@google.com>
 <CAFEAcA-h_w9j3nEKo-1aBdM-XNFKx+-bn33=5vzWd5FJ6Ly+TA@mail.gmail.com>
In-Reply-To: <CAFEAcA-h_w9j3nEKo-1aBdM-XNFKx+-bn33=5vzWd5FJ6Ly+TA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Feb 2021 19:47:49 +0000
Message-ID: <CAFEAcA_FHPco660spQKKma4m8V1ZCky-hGBZvWOsWaJ4yvwOtA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Add npcm7xx emc model
To: Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: Hao Wu <wuhaotsh@google.com>, Jason Wang <jasowang@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Avi Fishman <avi.fishman@nuvoton.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Feb 2021 at 11:34, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 9 Feb 2021 at 01:55, Doug Evans <dje@google.com> wrote:
> >
> > This is a 10/100 ethernet device that has several features.
> > Only the ones needed by the Linux driver have been implemented.
> > See npcm7xx_emc.c for a list of unimplemented features.
> >
> > Doug Evans (3):
> >   hw/net: Add npcm7xx emc model
> >   hw/arm: Add npcm7xx emc model
> >   tests/qtests: Add npcm7xx emc model test
> >
>
>
>
> Applied to target-arm.next, thanks.

Dropped again; the new tests fail on big-endian hosts (s390x, ppc64):

MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
QTEST_QEMU_IMG=./qemu-img
G_TEST_DBUS_DAEMON=/home/ubuntu/qemu/tests/dbus-vmstate-daemon.sh
QTEST_QEMU_BINARY=./qemu-system-arm tests/qtest/npcm7xx_emc-test --tap
-k
PASS 1 qtest-arm/npcm7xx_emc-test /arm/npcm7xx_emc/emc[0]/init
**
ERROR:../../tests/qtest/npcm7xx_emc-test.c:476:emc_send_verify1:
assertion failed ((result_desc.status_and_length & expected_mask) ==
expected_value): (0x00000000 == 0x00080000)
ERROR qtest-arm/npcm7xx_emc-test - Bail out!
ERROR:../../tests/qtest/npcm7xx_emc-test.c:476:emc_send_verify1:
assertion failed ((result_desc.status_and_length & expected_mask) ==
expected_value): (0x00000000 == 0x00080000)

-- PMM

