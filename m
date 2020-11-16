Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 826D22B40E8
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 11:22:22 +0100 (CET)
Received: from localhost ([::1]:47008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kebeP-0006lR-Hi
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 05:22:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kebdB-0005hP-IC
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 05:21:05 -0500
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:35883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kebd9-0000S8-GG
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 05:21:05 -0500
Received: by mail-ed1-x544.google.com with SMTP id m16so3258723edr.3
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 02:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8/SGwtQj0c5Xilj94THJB66Dl2N5KaXiw9S/1YE9nhQ=;
 b=fGkN+Id6qTHFGKaO3RMFFgpygWYiYLF9KX2BfZuhUYSdISbIUntJU4R9iJxFivf+OQ
 RR99aFzOs4ev/b+zIJMwmBt1c/A05txs4jH1MnO9Xp+xVUI2hE0GY6iLaYXjT76sfPAP
 Hhsox6z+fRuCz56uiuJh/VCoEur9j18ke04zYlAYYz7AUK0hNHgTvl/EijchGa8Xz1m0
 QyEwNTiGlD66PPlrNI2rTg+PY29Q6PPWbKdFEI4PU/KbpPtKFl+vIviU1teY7OtZn5qF
 FoKdyT0wUlYkPqKnAzH04pt4mqvBNj3vD3FvOU1W6uIha9rAakXBbiyNa5OXbAtxdetO
 Dpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8/SGwtQj0c5Xilj94THJB66Dl2N5KaXiw9S/1YE9nhQ=;
 b=U7WzOCoUdpcjQqM5ztNc1fiT9aWb1w7od5Z6H5A9B/n4CA8pHai4iIDO4CsBxzpyXb
 pD23axP6de1boeQdeJiL6FX5+7LFFgra3W2bqXGHkU3PRd+8NRv9Flym3ID/fnBS1f2T
 3q3gsE62zyiuy0BDVmZR3UnRxOgLmlzIvApXs+wrEFT4HVhyxZ/dV64dpoZwlqmlAKRS
 d5SHOPINTJ+I1USHmHOo7GQCaxpPs0m6K0hxclZCJRBknfA+lx5Qkgy9KF6nv+Rzi6qa
 CfutC0aM7qDT/FGf2DDpQ85mXwoFZ56wPrcmLxYR4pEhJs0ccLY7TUToHvXM3S+l8s24
 Ug9A==
X-Gm-Message-State: AOAM530aVSH71s7Ek+9HuDgzqw05tuRO6Tg5p/TcpVPuIfDJfRd6XB+0
 jXQe+Ly5x0JJZ7uE2p+PFPcBGBv1BBo9DJq+dPjUvA==
X-Google-Smtp-Source: ABdhPJzk/770J+DCzjxgQHIlToeW3E2o/GIoRg7Cmw9IlrWg9hxbnaZ24TrCBPMWtBkBpmdZXhEl5+oE0xtU6L9z8DU=
X-Received: by 2002:aa7:db8a:: with SMTP id u10mr15142965edt.204.1605522061985; 
 Mon, 16 Nov 2020 02:21:01 -0800 (PST)
MIME-Version: 1.0
References: <20201115123503.1110665-1-ganqixin@huawei.com>
In-Reply-To: <20201115123503.1110665-1-ganqixin@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Nov 2020 10:20:50 +0000
Message-ID: <CAFEAcA_g_+adkJX5KTAQz9HbD-d7wyXVaBkT63OVntuw+5OM1Q@mail.gmail.com>
Subject: Re: [PATCH] ads7846: moves from the hw/display folder to the hw/input
 folder.
To: Gan Qixin <ganqixin@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Chenqun \(kuhn\)" <kuhn.chenqun@huawei.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 16 Nov 2020 at 03:08, Gan Qixin <ganqixin@huawei.com> wrote:
>
> ads7846 is a touch-screen controller that is an input device rather
> than a display device, so move it to the hw/input folder.
>
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

