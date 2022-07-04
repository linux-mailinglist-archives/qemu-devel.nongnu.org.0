Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 680825655CF
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 14:46:53 +0200 (CEST)
Received: from localhost ([::1]:38556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8LTX-00058f-To
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 08:46:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8L5u-0002Jn-22
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:22:26 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:35470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8L5s-0000TF-KY
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:22:25 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id e69so10012860ybh.2
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 05:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5kcCsjb8Qmfk7ZzzqpYc76PrXeMQI/nnyAj6l/1VmAI=;
 b=bEeilrAHAo/YoF+83cG4kVMomNEKOhFgQWfmgNMIgJuJZw6JoAfee9dr/MZsKJr9et
 lTIG2fjvXrqYmz9dV/4UNoeT26K8PwPGBXxF/m7QlKgsn1M8MrjR1V2ysx+EOBUXxJZa
 h6dyp0DrXtS1RObPucb0CxQQi39tsvM1zANBbKXmhmOtP4Mmnd13DInB4HWPIYHiO9QW
 bVDEfy6uFgLdtr9DNh5AcxCxy8NtkjFb2jtrSBhDJY8hMv8gRS0y8StrN+kY8oOC6/B4
 H4588W5lHXdBKA6/JOQN6aQ8CmF3revtKeMznpuzTdRpR4l7+WND+412ZYCnO6Vd2gGC
 5/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5kcCsjb8Qmfk7ZzzqpYc76PrXeMQI/nnyAj6l/1VmAI=;
 b=yi4VP6d4zbr6m+nOnKLblgczx63y44seokYjVwpXnEX/0PRgjY5JZleUXPK7YMOOkg
 L6mrBxbeQLmXj+EcWlSm9TEH1b5X3faM+oFZBgi3fVW5g0X9ca0nPjmyAwpLiOg9DSkt
 RFPuFDbv0qOS7W28jTUBX9CU+ZRxoW+eW5jF6zOMAJvHPC5GdSkFE6Z79AUwvcM9hD+5
 2jV4c4kJGS1DHkElLrQhGGZk2X4/Bh5iOoev4kE3iTQQvaKBfeIOEWIr+neD6JdqQjuP
 pbeuAYLwJEB/GskBTRQ0WLwkEETfuli4aRtMPIib2wEwPmJVe6QsE67c+ZlVGAIft3Jz
 v5Bw==
X-Gm-Message-State: AJIora+9yazvka9u/yXzybxslr+KY5iIQ5RoSDWROr1C/8g/CEDywayN
 iI8FYlUxAo8x08p44u19zqSYrCOSdmMH8FAy2T9cZQ==
X-Google-Smtp-Source: AGRyM1sY46ggEO/5YbE+s2YkHP/xik6nAO2MTHRh5Lkh9V2XBSCejsAeZblv12axV4uRfFO+EZX0p2R5VltjKkeZBZQ=
X-Received: by 2002:a25:d7d6:0:b0:66e:47b3:35be with SMTP id
 o205-20020a25d7d6000000b0066e47b335bemr5716532ybg.140.1656937343606; Mon, 04
 Jul 2022 05:22:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-45-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-45-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 13:22:12 +0100
Message-ID: <CAFEAcA8tW2UCw_fuyQMHta4Q6MgVsvCKtBOYhzv9ccr5kPhqaw@mail.gmail.com>
Subject: Re: [PATCH v4 44/45] target/arm: Enable SME for user-only
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
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

On Tue, 28 Jun 2022 at 06:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Enable SME, TPIDR2_EL0, and FA64 if supported by the cpu.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

