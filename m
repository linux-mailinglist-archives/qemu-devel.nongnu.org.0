Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA2B559A17
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 15:06:14 +0200 (CEST)
Received: from localhost ([::1]:58556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4j0m-0002gG-Vm
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 09:06:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4ivi-0000AF-Qu
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 09:01:00 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:38681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4ivf-0006O8-Ic
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 09:00:58 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id d5so4389536yba.5
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 06:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cssGOlw3/rNNl0ZDRsVDfMpk5nhe2IrIHnEu6OmX/p0=;
 b=T3Bgn//ktUeXh5X1eY9rwPTJKr74N1Wbpzaik/fMebEN16O87MJfPbaz8Zg+TihJgy
 WkYpFgS5XRV+afhwrikif6JwYXyAcZHBEewfnmm1JxRNS1TNweW1zizO30L+UoAZfIMc
 rbHhoNdR6v/1ohB/dmRfW1rla0IS8osAEnYwgSMz5WL1uUheWkeB5D+PCTir3N9nFgcN
 2U8zVIFE8WAdKCXaYWE+bWUFRBX3wovJrKJdtrY/RdDC+m9/lQ+YAxID+ZK34WnvhySq
 42CqqW+RL3QVNb9EB0EM2M8R7jIZ9BF+7vrOHuO2yVqzsQrdZgZPBSjpGVeLZCyYS1qj
 q1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cssGOlw3/rNNl0ZDRsVDfMpk5nhe2IrIHnEu6OmX/p0=;
 b=YTiE4npP2qtXeUQ+9DcgCBo8JQJKqJzqYp3kcp0N6QJ1oCRNJKM5goRT88q1i+l73+
 RzEZKDp11YqivqKqM+OASb2p8sfxGHoAFCzxW/3o2U9nFgmIBxpj1bzwlB6W8HtEWS4E
 nGs6jsl8L0BnmYU6WDrKsDR3FS4h3WmG7l05I2IBEKDxIJouDF1v6+41BiBPyC7GLQUg
 FTmBhIyf+Aarkv9v2mfWApIWMpHrQkywhCQbOmmtPiZnwlbXQazngJ4EtjFO5PKADZao
 N21W+Sv4ohXVCFbOaI59K0AeE/8uhA+n0hXcKS2bpqcBBU+GLjiwZ30j0ZuiLpGC2rLx
 g5kQ==
X-Gm-Message-State: AJIora8/0f4MmmOXdHASKhSD0Ix6o5oTtIsXVkhF60O8fikv+BQCMyPg
 B3YRVeGZmeoyK6F5x8O2kNo7C9T3JI0QgoHnFNaEtA==
X-Google-Smtp-Source: AGRyM1vaJL4Fl7LCIC8BzZkCqOMDQNr3mBieOU8rC83hbwV5OjkTXh2CgCYLkfqUenGKkQfSKJEBeJ3l3Ml2g9cKyAs=
X-Received: by 2002:a25:d288:0:b0:669:12e2:b561 with SMTP id
 j130-20020a25d288000000b0066912e2b561mr15106362ybg.193.1656075650667; Fri, 24
 Jun 2022 06:00:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-37-richard.henderson@linaro.org>
In-Reply-To: <20220620175235.60881-37-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 14:00:11 +0100
Message-ID: <CAFEAcA9s4jarZ5n80U99Sitbu1M5wdeaMtWkEoMcjRRNQQMuYg@mail.gmail.com>
Subject: Re: [PATCH v3 36/51] target/arm: Implement SCLAMP, UCLAMP
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
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

On Mon, 20 Jun 2022 at 19:55, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Same commit message remark.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

