Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B356A9EA3
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 19:27:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYA7I-0007kL-Nn; Fri, 03 Mar 2023 13:26:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYA7F-0007ii-M3
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:26:49 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYA7D-0002ul-H6
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:26:49 -0500
Received: by mail-pf1-x42f.google.com with SMTP id ce7so2137942pfb.9
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 10:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677868006;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SzaEFIaH936rmwztYfs4EwnPvbhx0KiInX1KmJ6EAuo=;
 b=alZ9+Z+YdFIi7E8Qrk0CbujKj5CTqe2L3q4e1V/5yjUKgLYEma9EaQxGqMiRDuZMhv
 YeNjO4pGRQ64up0Q/b2Zv8BlOda8M2nxiRSbTEfh7CH89a7S+7B+nQLhv/fPdiaHLCb1
 L5RXi8iy4OXAkQp/3lporiY1Tzl49jIXAFDxrqWmIwU20WyEGowe9jiv0uIyeyyCT+4w
 4apkCfX01GQdRyeFHdzx5JAjRl9li9pCjLgkoVE0vtQGBtixyqdGK7u3S5DnXqjFpWiY
 89xsdOiWYl6wrA3duL1Cn2ZKfp4g7A/egbfhtUVldRJ7hYZ7kddtrLsLNvClRFeUhi5F
 ROog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677868006;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SzaEFIaH936rmwztYfs4EwnPvbhx0KiInX1KmJ6EAuo=;
 b=yzgk9Vom72K2y+N42+lArDnIK2pWPRiq1afVjp5wZsTiKjKgtICU+1uXINL+IkaA+e
 TXFzsoqv97CjzcuQ2kzdFd0+HaRALXjoIFVxZyKA9jBNZIil83e4tBW48QgdxuNnWOuf
 e0kh7R6u9wNuwJOmlfSAs4suLRizytgOr9JzD6mH7RrVAOgNkWDAbA+bhMQShqK898nw
 HzPn75ADRQAPj1q312R0fBdsDKIsPuWxk2Nk6hzo8TwMbsI08LX32QU33Vw7/JpyBW8Y
 q6Npe7XfNxRY3i+Gnpyf3TptuYbnObRTmg51aS/FS91vbkvJPCBLAVvvlRcYII/xnOph
 t/yA==
X-Gm-Message-State: AO0yUKXxBHUhtJ0ZVWd0hGOiahHo0ND4QZ/AmNMaDrg94Cw6iN6IvGZl
 yXcN0/ao/YaPNLrNYhTaYgGTSgvfbrQTl/anv18FCA==
X-Google-Smtp-Source: AK7set/RXgKxcK6T1zyckdpwvxpWB7Kd8DhQWPQO70+mDIAM70IHIxlsYuFX7HYGf69Q/W2X+O8taO1yoPFJ1S3lokw=
X-Received: by 2002:a63:8c17:0:b0:503:7be0:ea51 with SMTP id
 m23-20020a638c17000000b005037be0ea51mr826674pgd.9.1677868005877; Fri, 03 Mar
 2023 10:26:45 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-16-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:26:34 +0000
Message-ID: <CAFEAcA9EFEErB-C4_E30pedkQRFgT0z3A-zvPqMV5jZuSkAbvA@mail.gmail.com>
Subject: Re: [PATCH v2 15/76] target/arm: Drop tcg_temp_free from
 translator-sve.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 27 Feb 2023 at 05:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-sve.c | 186 +------------------------------------
>  1 file changed, 2 insertions(+), 184 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

