Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0805452811F
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 11:58:40 +0200 (CEST)
Received: from localhost ([::1]:47824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqXUs-0000Hx-NB
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 05:58:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqXTD-0007pc-10
 for qemu-devel@nongnu.org; Mon, 16 May 2022 05:56:55 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:43882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqXTB-00079u-8g
 for qemu-devel@nongnu.org; Mon, 16 May 2022 05:56:54 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id q135so6796830ybg.10
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 02:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c8EIGS2nVOc0XSdyXWOHPBJ/hGuVI9gJsq80KdT/kqE=;
 b=YZXie1JySzS7Bnk3mJLaIOHvKF10zKtaEB2GG50HfG4F8jRy4QIO+wbm23b8HW+O/e
 nchAQQfaLQrhb/N9NxWeviXSr9KL16Sr+bNxxiTuFK1wjsBT2b+XvHHWjWNXBN49VtfG
 dXbTH85g9r4Tz5+eoU5L+ELIxEvbFJOfcMMF/LUI4uDeL9aXbYSLWcTnZQiiP4guxViS
 0yIVmLQAki0PnmFoFIYURR4cH6EG6R4UOy3V+3dZgg8Dc8S/uZuuWob5RJHaYsSfGsBM
 kXmV3O1QWBH8WIrPfP3YVngaNJ3H+XHkI9Ps8qmZJQ7brJi1gEhegl6f7Y61ZI2uTIEe
 Pqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c8EIGS2nVOc0XSdyXWOHPBJ/hGuVI9gJsq80KdT/kqE=;
 b=QXvXdo4R6JZzMDiJ8+6GwvFdbytjrkACfBY+YfRDv74dWQWYBnZHi3q/WNVk/PfCcr
 fTHQk9/Bevw8CQoN5qf/RQaQuCZdjJOWBtuj6BH5IK+cH2sedsdUOieJWW63Udq5LMUN
 GfEyEsmE9P8SGCILwWfgNEIl1nfnrVDPkZwKY1BiW+nXzYSDO9UX5bP3r3GDAzzUCUZo
 Afu1NQPUGyp4HuWUQgCl1gxRquMx3P3V1ZbCjfvN6Iq2mhzbB6AsT8hWYJEHbknhodLY
 LtWOI3XbyY4IxWjXMRtr6yCrSM/j/sjKTOuivg2LLif/iurYx7sf61Q3vOziKmwjrJWl
 cMUw==
X-Gm-Message-State: AOAM532cNN5KJciHm7d1GAMAWjISSfLwwI7IEOvoftBLJSz7VETzyUOd
 0GGqivUHZhqajQ+VDkqVrY0mC4oZj7W5N70LP1BSaw==
X-Google-Smtp-Source: ABdhPJw1FieDk9pUMJhCP90KmvDycgsRmVUtIRX6w2fEdBXRHF1Jmie40aheHGhghOYSt72FJa/5qWteB7gH3+t+h/0=
X-Received: by 2002:a5b:b10:0:b0:64d:ab18:2e41 with SMTP id
 z16-20020a5b0b10000000b0064dab182e41mr4006760ybp.288.1652695011948; Mon, 16
 May 2022 02:56:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220503152545.1100386-1-fkonrad@xilinx.com>
 <20220503152545.1100386-3-fkonrad@xilinx.com>
In-Reply-To: <20220503152545.1100386-3-fkonrad@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 May 2022 10:56:40 +0100
Message-ID: <CAFEAcA-x+7Gm9Jo9oPdcXZ0DpeT=PmfXogxZkjVZC_SL3gHNGg@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] xlnx_dp: Introduce a vblank signal
To: frederic.konrad@xilinx.com
Cc: qemu-devel@nongnu.org, alistair@alistair23.me, edgar.iglesias@gmail.com, 
 qemu-arm@nongnu.org, sai.pavan.boddu@xilinx.com, edgari@xilinx.com, 
 fkonrad@amd.com, Sai Pavan Boddu <saipava@xilinx.com>, 
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
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

On Tue, 3 May 2022 at 16:27, <frederic.konrad@xilinx.com> wrote:
>
> From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
>
> Add a periodic timer which raises vblank at a frequency of 30Hz.
>
> Signed-off-by: Sai Pavan Boddu <saipava@xilinx.com>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> Changes by fkonrad:
>   - Switched to transaction-based ptimer API.
>   - Added the DP_INT_VBLNK_START macro.
> Signed-off-by: Frederic Konrad <fkonrad@amd.com>
> ---


> @@ -1309,6 +1323,10 @@ static void xlnx_dp_realize(DeviceState *dev, Error **errp)
>                                             &as);
>      AUD_set_volume_out(s->amixer_output_stream, 0, 255, 255);
>      xlnx_dp_audio_activate(s);
> +    s->vblank = ptimer_init(vblank_hit, s, PTIMER_POLICY_DEFAULT);
> +    ptimer_transaction_begin(s->vblank);
> +    ptimer_set_freq(s->vblank, 30);
> +    ptimer_transaction_commit(s->vblank);

The ptimer documentation (in include/hw/ptimer.h) says
 * The default ptimer policy retains backward compatibility with the legacy
 * timers. Custom policies are adjusting the default one. Consider providing
 * a correct policy for your timer.

and goes on to describe various weird behaviours of the default
policy. You almost certainly don't want to use PTIMER_POLICY_DEFAULT
for a new timer -- instead figure out the behaviour you actually
want and specify the appropriate flags.

thanks
-- PMM

