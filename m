Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE7237F958
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 16:04:13 +0200 (CEST)
Received: from localhost ([::1]:42624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhBwi-0003Hj-Tw
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 10:04:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhBuw-0001xD-Cm
 for qemu-devel@nongnu.org; Thu, 13 May 2021 10:02:22 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:43542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhBul-0002tG-SZ
 for qemu-devel@nongnu.org; Thu, 13 May 2021 10:02:18 -0400
Received: by mail-ej1-x634.google.com with SMTP id l4so40020798ejc.10
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 07:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qUMLPrrk9OFAFKO41/XgXREeww3w4ZvYxsaZUfnNUhI=;
 b=XbJ/F7N3kpJGiIItavj4N1IVk8uHTdH7cXGr32qQj5Upz/k0Oou2CGy6Z6JViu2Nlp
 GredxLyxF2Zn1lSCgADUQ9rsrxd43w6N5zeFgiQ53C/sKnqpEYnJckdiBNMTPVY5TZWA
 gW0jfyMX9hhI9ZwXKnHb0uEQ0NGLbST9SkD+lxCHewppMyd4RcbCRY1mb1M2M/RbfR9h
 M4Ad8f4a2AsjgqQ4IK/z0Ld2qAt9OXr9v77IedmOVWGjd8aomyukEBBLUrjKLDJvxO36
 unG4bpvQ4RgqgRdd3T6jEREGIvaDJEFi9XoZKbo8vweoHSNbOobzH69u8PZ1RsqbqfTF
 gUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qUMLPrrk9OFAFKO41/XgXREeww3w4ZvYxsaZUfnNUhI=;
 b=r04czP7cB3+204ip2dUkYeFu/zmcogOigcoGsOAJ6JwFon10YKywrBAXqxGHHu2Azf
 HfNlnZ3u+faa+U8ZBYWOXxGXkIi0V9F8J6G8pEs+iC3TO5iDhjZsGWQ/a96mgeFcGg7y
 HO+ESU5M5wmyoPz5mca+vjMkdAgGu8LzoYXCiiXoviVnon96b7lsaLE4DJQU7qOietT2
 XRzes1/iyzX/ZpLYEaE0esqgYKNQYY5KUefrIYoIGn1sSfN0WrpfIaDtwTVT/DNVNTRP
 Yveq1a09PV6i2HmnVwaS4312YP7fobdSweSAohf6LZ3yhzAOFAASwnORk13Ci1vd33IO
 Wweg==
X-Gm-Message-State: AOAM530Z+hnFMcPXu69Ha6PtO0wEplvQ5EQLi2dAY/5SBmPf1ziuBf5A
 sYCbDhALPhJm9Bz50zyPEYeJnOOrBDVOhLj5z+vvfQ==
X-Google-Smtp-Source: ABdhPJwBIzTEqiHIBzPSuBdWR3TjuiADpTp+ClfQCeTzPSbO2wVm0ANLQChSTP3MPIJncLkf2WZ4R4tqZsQGtDRZzC4=
X-Received: by 2002:a17:906:254c:: with SMTP id
 j12mr13271133ejb.4.1620914527580; 
 Thu, 13 May 2021 07:02:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-66-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-66-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 15:01:55 +0100
Message-ID: <CAFEAcA8nOjVCC=PPOVKEKHg7jZJpXtnYga4Yd8KJUguPabv3kQ@mail.gmail.com>
Subject: Re: [PATCH v6 65/82] target/arm: Implement SVE2 FCVTNT
To: Richard Henderson <richard.henderson@linaro.org>
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 22:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Stephen Long <steplong@quicinc.com>
>
> Signed-off-by: Stephen Long <steplong@quicinc.com>
> Message-Id: <20200428174332.17162-2-steplong@quicinc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |  5 +++++
>  target/arm/sve.decode      |  4 ++++
>  target/arm/sve_helper.c    | 20 ++++++++++++++++++++
>  target/arm/translate-sve.c | 16 ++++++++++++++++
>  4 files changed, 45 insertions(+)

> +DO_FCVTNT(sve2_fcvtnt_sh, uint32_t, uint16_t, H1_4, H1_2, sve_f32_to_f16)
> +DO_FCVTNT(sve2_fcvtnt_ds, uint64_t, uint32_t, H1_4, H1_2, float64_to_float32)

Shouldn't these be using different HW and HN macros ? They're
operating on different type sizes...


Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

