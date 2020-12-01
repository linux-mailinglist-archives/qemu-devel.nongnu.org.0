Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3B32CA6EE
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 16:26:39 +0100 (CET)
Received: from localhost ([::1]:39350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk7Y6-0002Wt-LN
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 10:26:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk7Ui-0000LD-0J
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 10:23:08 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:44425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk7Ud-0004TE-Cv
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 10:23:07 -0500
Received: by mail-ej1-x644.google.com with SMTP id m19so4830974ejj.11
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 07:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kn5Jkuqs9nQxhHPFBkhSnlGGjc44mW+fTIcqVI9sqEA=;
 b=YXH7qpTsUkZBweRjCv6ishi+ePlovPKXC1ufDbxMnLCykq+eBznMg9v6aBMc1Knlbc
 XNIOD7CZgzUa7LpoD9H6XBtV8kZPPLN9cu0ZO4tNE4oLxVP0EuFP+HvAPVdKFeJQJiIY
 6lpFGoYwTtYIGTbglz4wwScE/KwIJcA9qFFfcVwWs3YR2nmEy90Npp8G9KT2cXqofRsP
 8HVPjIKMknSfO63rsDPqmqAoXUx3wFXied59Rg0Omem2QA46tyItadDtTrYViq3fu1f2
 k/uNpDUqwIIwL3ndfRbvaPwnIugZaq9BZ5aiLNuqOUUeMgUWjHDyLb9M0IM5gJikwaES
 e2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kn5Jkuqs9nQxhHPFBkhSnlGGjc44mW+fTIcqVI9sqEA=;
 b=axkfsqCHENwXFuCDwgeDZzwHAtc8MbTXCx9UvyJgnq1m3XXfDlFBOKisDU2LUodKfU
 5ZUCELI/DgXDaDt6S8Vo3Yeu2Os31iTThaNRBzayqJPyUj/EhhvayVsilsn2N+KqBQTX
 VIAi+uJvlCfTNerpwEKxBqm+eavTgJZ4FDIIuibWM6r1CA6z55/fWXGzTDtu00arbtSF
 eqCDEBLjps3eKJTr6a1Z3m/fwHde4bzmSsaDNn4ZRfgqvIHbGuf9a5JLx/I+rTyR8nX/
 Eu1z+5RJZAnV+qcwpnssE2GInjJkb1xyU7rWPKIny2ibf6Wvlu8eX/aJq4+0u5axFdsr
 9tug==
X-Gm-Message-State: AOAM531Q/xpGT1N65tYXN0Xy1iaROCVhPm/GKrujlFsEO3a5ENJZOvF3
 hD8EM8XKFLzRnlkhXwHr5VqTMXxzW2kYTl8g4hgHQA==
X-Google-Smtp-Source: ABdhPJw893PeWr5ekuHopSp8UFAcgZvbk8K2Cziyizw1QzDJMMKTO3AgMNYkyFq1MywJvZuPMMKKD8n2XFE6qFVFxas=
X-Received: by 2002:a17:906:6b88:: with SMTP id
 l8mr3230670ejr.482.1606836180969; 
 Tue, 01 Dec 2020 07:23:00 -0800 (PST)
MIME-Version: 1.0
References: <20201119215617.29887-1-peter.maydell@linaro.org>
 <20201119215617.29887-22-peter.maydell@linaro.org>
 <3c036611-358c-a824-2a27-841b8ba8d897@linaro.org>
In-Reply-To: <3c036611-358c-a824-2a27-841b8ba8d897@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Dec 2020 15:22:49 +0000
Message-ID: <CAFEAcA_VhkospGJ1MDcn2_or_ErM+mOSNrwvYc6uHrUXGoLQUQ@mail.gmail.com>
Subject: Re: [PATCH v2 21/28] hw/intc/armv7m_nvic: Correct handling of
 CCR.BFHFNMIGN
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 1 Dec 2020 at 15:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 11/19/20 3:56 PM, Peter Maydell wrote:
> > +        } else {
> > +            /* BFHFNMIGN is RAZ/WI from NS if AIRCR.BFHFNMINS is 0 */
> > +            if (!(cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK)) {
> > +                value &= ~R_V7M_CCR_BFHFNMIGN_MASK;
> > +            }
>
> This isn't WI, as you're zeroing the bit not preserving it.
> I think you need to merge the current state of the bit to preserve the value
> for secure state.

Oops, yes.

thanks
-- PMM

