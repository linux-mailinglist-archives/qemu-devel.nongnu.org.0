Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 307F5565833
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 16:04:01 +0200 (CEST)
Received: from localhost ([::1]:51630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8MgC-0005K5-06
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 10:04:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M5z-0003zy-2f
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:26:35 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:38820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M5w-0003gb-NF
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:26:34 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-31c8a1e9e33so29887647b3.5
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CobRFxQV+OgOPr6ejbawRauIsdUfI6eu1GMk5h9WZ4Y=;
 b=BWlXKfh/9Xr5bGLSV5kkbC3HCMNRnxTT2bfUHkctsPlFP1E3mz9ga75ISLf0XFpyvG
 oDu95UnmNX1QlYUfmKBDQ1bjmftAvUmK0k0apXuRHf4MRR2Jg0Cln3FKxBaBGllnM7rw
 WmPrIlmScfZuiFGEn05lRp27B9ayD+HCMgeHGXEI7lSui1t0U3xsS8csZHmnwhEeJORC
 Pw+2WLQOZ+xyrYPrb5fV1pjwfbWwXKo6bZT12MlS6mUnTl2wCRxL8hCNR+QXx9iF77/o
 xAnqpP2YpaurlTeGbaku3zBJGi5MnDJ5pN2ZozVvME8gyHaMOWCxi4ZH9x8VAjDdkQdM
 wqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CobRFxQV+OgOPr6ejbawRauIsdUfI6eu1GMk5h9WZ4Y=;
 b=jhbf6aGjguIZu16mpPCoQDNH5ITxih1D2PghkrusvdjMlb3/hSnEzDuvhvUg2wRifz
 wuADexPGs7fiHqpQOB5JAMVigZaj43of+4XgcJ0N6N6lpCQ0gYNNFikj1n5aLKIZMr93
 sq/LFg8uKDF+97NwAXiz6WIF0s28sjhNLbUtz8H7jE25LRWtIYMU6cHI5Obj8wwoIo9y
 LCS1MxJb3j/VLKymP6tBszHjCD+bReIGURinfjLNpHTzu4TY3fPjMZoJzqXxSeHzdWxM
 k0//hyoqP4yq5GsDpm2Lxcow90i7pFPn69sn1tKwwKYXOa1RAtNeEGuejaN8R2leyU9U
 UIGA==
X-Gm-Message-State: AJIora/XvrlJu4HufvY+Yk9JXZVR1tinGHqTC1K1gq3sqUIeoi+wgcgf
 taowrejddU4uJJKUH1ziLqMW4AlbA0eBGScESzrZNg==
X-Google-Smtp-Source: AGRyM1suaPvjS5ioi01jgbPQSvWnMSF5YP99Lr2crEw17T7o5v6j8cHniY/kioKZ7QU0BiBosKdOKF5AJ//n8Tx+/Rk=
X-Received: by 2002:a81:8d08:0:b0:317:a4cd:d65d with SMTP id
 d8-20020a818d08000000b00317a4cdd65dmr32435106ywg.329.1656941191608; Mon, 04
 Jul 2022 06:26:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-25-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-25-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:26:20 +0100
Message-ID: <CAFEAcA_QX06P4YEEnMCBFPodgh5+iZJhOATt5muksMNZDxanTA@mail.gmail.com>
Subject: Re: [PATCH 24/40] lasips2: introduce port IRQ and new
 lasips2_port_init() function
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Introduce a new lasips2_port_init() QOM init function for the LASIPS2_PORT type
> and use it to initialise a new gpio for use as a port IRQ. Add a new qemu_irq
> representing the gpio as a new irq field within LASIPS2Port.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

