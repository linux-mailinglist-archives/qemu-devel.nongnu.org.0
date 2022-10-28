Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 167FE611A03
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 20:19:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooTvL-0006D5-9G; Fri, 28 Oct 2022 14:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ooTvJ-0006Ca-DE
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 14:17:41 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ooTvH-000249-Iz
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 14:17:40 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 t10-20020a17090a4e4a00b0020af4bcae10so5221128pjl.3
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 11:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4I1pX98XN8N7cV2rSfpVI05YKs89Zp148nLul+VmqKc=;
 b=HmkqOZoXGepQj65MyetWFUt+325MAwJ85O0y/wYWvSI8JctRkxQW93JmMfaiqzbxLQ
 1Jw6NKpivrq5+qIWSLdDTy7rQ8bvMg/BPUt12kkkgzmpefCMOdMjBm157XQUKy+avJ57
 c1iOhGzv/ObVtY6yq/CYMfJPzpvtf7LGdFtMTdN8N1/M+6QquPsg3sJ2O69pqz9c7I0m
 tvTnyNqy8O2vncTqMVNiu6qvUyTrR2IbwfVbqv0B26TzchStGAtiKQbtrPwBesnExFV1
 BYrhrotLFK9V8Yp65HluSAHAix8L03wkC4tWVwjI5AXAlUkjcNmFxOnoK6jBzqLutHqA
 SLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4I1pX98XN8N7cV2rSfpVI05YKs89Zp148nLul+VmqKc=;
 b=Wep967uo89PLrQ0XJM3D32QZgQDlQ4Ic1yhLy0xwoTS5+lWOnv8sSEvz4Ot10hC3sL
 WFvcVzcUV57AA8xi0CV6r/MVkiG0xzos5mc1rY0Se6uo+E/tgPzcPUDlyg48p5Z41G6I
 +74e+47SIz0k8ygUW7Re5UEv8+UidqppTgABX6J6B04i+dkck+VSSzy3iLfTkiFy7ZFJ
 /Mux2W7fTC7OzYy1RHRxVQE0rV7Uy21ofO/GikWtmFtsE5L+3xF3rVDFgaAHP7rmdQVg
 HLV6wN/wtJXIwmZ5kcyvTR9utt/KxUgRw6TBPcQn6Q4uHMWzwCd0jbzlPzCdAiwOs/FF
 h5wA==
X-Gm-Message-State: ACrzQf1C1WIgDgTg+aJeHYBg9YxqxxaA6YUHlibhSJ/GIeFupvKi1xTu
 pQBhaqfKceRNsyLLNxAQCfDhw94MgkEcgSKR0cgEUQ==
X-Google-Smtp-Source: AMsMyM65OhIZOIhNKzW8dYAaVE/YyNpT0m1NXxB2QGOnv++uPW+OKfc+4BQYXx2D/B2QthbcLPTycmHiYnTC9qFCFjs=
X-Received: by 2002:a17:902:aa8b:b0:178:8f1d:6936 with SMTP id
 d11-20020a170902aa8b00b001788f1d6936mr264772plr.168.1666981058005; Fri, 28
 Oct 2022 11:17:38 -0700 (PDT)
MIME-Version: 1.0
References: <20221027112619.2205229-1-tkutergin@gmail.com>
In-Reply-To: <20221027112619.2205229-1-tkutergin@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Oct 2022 19:17:26 +0100
Message-ID: <CAFEAcA-xm1PmZc-cNeJWkBvSFRMmRJ6n2S8CS7hr9w+8HL0QGQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fixed Privileged Access Never (PAN) for
 aarch32
To: Timofey Kutergin <tkutergin@gmail.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 27 Oct 2022 at 12:26, Timofey Kutergin <tkutergin@gmail.com> wrote:
>
>     - Use CPSR.PAN to check for PAN state in aarch32 mode
>     - throw permission fault during address translation when PAN is
>       enabled and kernel tries to access user acessible page
>     - ignore SCTLR_XP bit for armv7 and armv8 (conflicts with SCTLR_SPAN).
>
> Signed-off-by: Timofey Kutergin <tkutergin@gmail.com>
> ---
>  target/arm/helper.c | 13 +++++++++++--
>  target/arm/ptw.c    | 35 ++++++++++++++++++++++++++++++-----
>  2 files changed, 41 insertions(+), 7 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Not sure if I'll be able to get this in before softfreeze,
but since it's a bug fix it'll be in 7.2.

thanks
-- PMM

