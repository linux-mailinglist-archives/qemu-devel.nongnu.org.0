Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0919539136
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 15:00:06 +0200 (CEST)
Received: from localhost ([::1]:34280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw1Th-000754-O1
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 09:00:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0y7-0007zi-PB
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:27:27 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:38613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0y5-000675-9p
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:27:27 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id v22so5032151ybd.5
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 05:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sICHP9RISZlGjFt+FlTq5tv7jelcqSn20ycKBiXSykI=;
 b=HuCuLMbEJemzGHzLQCTKb/J3/KtHSAmhRSn4e3Mp8eK9Q2bVsy4/8Cr/iqlXkAQq/J
 FlRxIfe00/KUyUnhnr+cE28fL9psyMwyYK/yJ0U/m0nwvLZWjPkIiEhkq5v9wnIcRPuh
 AS6zbrVbAkQPT917lE80UYmNwMnnGepffx9BU8uC7kx2XlRgsOuravP1N5FSwyw9668f
 OFzBUDaZit4inQ02GNlOjvyZfeFNlbCFHWmx70qL4WdAT/1C7hgwX08D+iGSbM+Zu08s
 XQK6ZzCl34Ca8NgNDX3qlGYWJdfMTheTw44p6EeZU7vBiNtjcxSpoHdYDH7ePXUsEsXd
 1zUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sICHP9RISZlGjFt+FlTq5tv7jelcqSn20ycKBiXSykI=;
 b=RjeCReWTo3I+imqaIbGsJAM2/DGV7fKp1uHrSPFleySOZB84I/0j5VL/iG1bZ3L/Oa
 RVg+CqvLR5KfVwZfNOvnR9nzN20EcG4KM50ccDVrcHdkMNOPy3lSdt7T6r8LvXWpPXzn
 GfebWPKVLobmZg4cYMpoB7UbpoeGBcm2A9c+0a5GbzSkzxCVTRTGtdkYsWKr17lTtkvN
 bNVCe65/SnkqgOEhh/3qd/V0MN8ICTFgJI/ds2WbJa/38JOTmZE7WAP5qSP7jVfK2Sbl
 BlyxlxSwrWVqaN5L9ZZ4KLkjG29P8wFBJzi4hqZmDtFpmHtDvOkrl7MRiXwwf91OEAgp
 GzMw==
X-Gm-Message-State: AOAM533QaNF0LsKvyffxCvDeZAU42Vl5Dt5ZU0nSmbgtKPLM9FsakvtD
 66mydB4frlq7voJv8PH9mLtQLEgFpMo8/HDXv1Z4uA==
X-Google-Smtp-Source: ABdhPJyWmnLwaevVJjQh7x0nWFBzRRlMiqUY/BF621GlJ4rXmgOSRDl+G7e4/2NtrkzSgD6gFHb8p4p5lkWwd6d+FN8=
X-Received: by 2002:a25:47d4:0:b0:65d:510e:c8de with SMTP id
 u203-20020a2547d4000000b0065d510ec8demr1807753yba.39.1654000044384; Tue, 31
 May 2022 05:27:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220527180623.185261-1-richard.henderson@linaro.org>
 <20220527180623.185261-12-richard.henderson@linaro.org>
In-Reply-To: <20220527180623.185261-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 May 2022 13:27:13 +0100
Message-ID: <CAFEAcA-EAopCDKCgR5Ry_WA4z_E5XWh1xR0nxnYZPUt-b0rSng@mail.gmail.com>
Subject: Re: [PATCH v3 11/15] target/arm: Export sve contiguous ldst support
 functions
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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

On Fri, 27 May 2022 at 19:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Export all of the support functions for performing bulk
> fault analysis on a set of elements at contiguous addresses
> controlled by a predicate.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

