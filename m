Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 727F25F7663
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 11:40:54 +0200 (CEST)
Received: from localhost ([::1]:48982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogjqe-0008To-FZ
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 05:40:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogjft-00027a-VL
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 05:29:45 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:33673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogjfs-0008Mr-8q
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 05:29:45 -0400
Received: by mail-pg1-x529.google.com with SMTP id f193so4226386pgc.0
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 02:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=t9U+LE5YTZBGER8xE9dnYRUFn+81dDukCuaOIJGuYik=;
 b=Gu6nAqjgjv9pTbEPdH78ExjX5ELRavtXSvOLPY6yMpGntjCAu2dSpzUNUybx2gbckZ
 kPKSxw/HDsyn5m71WNNaV8KBjue2tVxDmMnIOMLfBCaj6l+Y5bq+xekvRK/MNFyFTqvp
 JAZaINYuH/GGJ9xWJiGNqxHOxt4JAq2LJZY/CocV7iBgZFp3KdtT33UkRPLFFYgE/cJ5
 IUkSxMbKkZ+ph3W/Bkb4k5jdBaAuNDgZMz1k5laGkVeRadWil8fGeTsAc8sDzx/PijO3
 eJ7M9H5KrRn5mxZu3uCioyEYQCWxm5j8y3PAJiJQnVG6P57foqegwIm4wJ0wOBgK+vVH
 r4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t9U+LE5YTZBGER8xE9dnYRUFn+81dDukCuaOIJGuYik=;
 b=oA7eLrqJ8ZZkDnAXtojrCU6WGe1PTNDsiXrasAPmKuYA9aDtrkpBhvFEni2OzJsEQ2
 GwRt4bufdfzUFPR+JKiPe11IszW7EqfxXHHv0P3DSHYwt197qO+bn1gUOVd8YR6a042K
 /z6E9J0MsiZ1txF4Z3KzE2siVZoI+vFfJvMyhmDpAG6IaMAd7//AVPuN7VUrGcZVHrqJ
 9ZOCBojw+isKN/sB0y5KQHqzJULrOpeUAgUi65AH+o8nX3gOnOHLFRjxfnwMy5PVdujU
 3CpC/ZXSvkItuyBKhuOPST4wAa3bqNUv8UxtCCeYajjtHkdmQCzzJGhk7Yj1f1dxsWvL
 tLxw==
X-Gm-Message-State: ACrzQf3Y0WJgVWphLQUuRx1NsNUDOV48R9uWdv1aJtHp8u0AanKyQ1JZ
 F/9k+DcMP8Y3Eh69sgJw92OaLI2Ewu/C86DM/x8oUA==
X-Google-Smtp-Source: AMsMyM585P//gso7fOP5E2X9eNaydp2W3eYfUpiMVuGNjBDDT1NjtzyBKHURF6Xl1GvEBw877C/wtsopMiPkDo60odE=
X-Received: by 2002:a63:89c3:0:b0:452:f2ad:52b9 with SMTP id
 v186-20020a6389c3000000b00452f2ad52b9mr3671391pgd.105.1665134982394; Fri, 07
 Oct 2022 02:29:42 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-35-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-35-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2022 10:29:31 +0100
Message-ID: <CAFEAcA-Xas6GOKez24qOiyNGxu=1QJEXj5z-Efg+0aDm3xUttQ@mail.gmail.com>
Subject: Re: [PATCH v3 34/42] target/arm: Move be test for regime into
 S1TranslateResult
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x529.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 1 Oct 2022 at 17:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Hoist this test out of arm_ld[lq]_ptw into S1_ptw_translate.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

