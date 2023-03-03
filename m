Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FEF6A9DC2
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 18:33:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY9HL-0004xH-2E; Fri, 03 Mar 2023 12:33:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9H3-0004a3-KR
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:32:56 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9H0-0007y3-In
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:32:53 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 u3-20020a17090a450300b00239db6d7d47so2952066pjg.4
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 09:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677864757;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aj8U0OhWmYk3psFTHxrKO9h0uci0aJEwA5Rppq7iSfs=;
 b=xRDa5Kwdu0pjHPxV1AjNwRTEz2qhUhIl+rXeDahbXZA5F2sIXbTBsBqdJW7XnxzPqu
 JOF4jZ1BCI/Gfj3CPUY11oEhd6pi4vFXV+d4Az7rbgPYw8SVEGWghVnPyIf1n2Chj5IV
 2TuP+YRg/LTH0NWa8KtMrrRFeDsfeEmLtLMHX//BVUcGu4VyL2ItxpSD/eP/DhpLjQE2
 2qcHQJzV3Y2XACRcW0MDjETI9EofwCIbLPLxHFiEaQSP0Xfch46DFgDluSihfJq018i8
 W+a0R3Q4PGk2bBcu3NfxGkSoRmpE8qg3fgYWp0NZrt8cmMGiqyBunxwvH2W8CBNUMYPm
 jXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677864757;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aj8U0OhWmYk3psFTHxrKO9h0uci0aJEwA5Rppq7iSfs=;
 b=jC6gGI9khuqNlfZhhqU8GSQh2DofJcq9mq5Mcu+TfH2MJZznh+xKafXXqFeRW7mTwC
 pC7je4R4PqMALCsaLsjW1lk0BhCnGmQZfRJqxXp8TvbXFpUi/q2LI5P9hvO6Ujvc80lO
 jFc9Lwr/tk8Gw1oUNTuspN2YqyfLa4grl7A4eilHO9joKGGpw3ItcnaBvms274HLPnJa
 42thFxpy5VnwRy3hQ9Jxb4X2KPYk6gb+oicXMocr+IZ7fLE3Ws3wcZIEFOfKmGChMq9b
 THU5aBZDnNNrNwNPYYoNV7bs8MlZ3InYXUM5/wrfq5OvUZ0DKMLZcJ3YaPI6rR+zBaHX
 UfKQ==
X-Gm-Message-State: AO0yUKXU66fYBmvjlJZYWCLGQscqicX6OGCXMUW0AVcLVrrrRrku0JPx
 eKeDrhfNBLWYH/IPgcf5C2ijZg39FFfMZwlFnNVhd5dSQrzMrQ==
X-Google-Smtp-Source: AK7set8o8rQpJWbXVE+epFGzf7mMv3EQCRgZNivSi6+yQIplJL5v31RqDbgmO2Iv2QkiUKh5M01Sn+32PiCkMEy9Vkg=
X-Received: by 2002:a17:902:efce:b0:19b:5233:51d8 with SMTP id
 ja14-20020a170902efce00b0019b523351d8mr1034251plb.13.1677864757531; Fri, 03
 Mar 2023 09:32:37 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-9-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 17:32:26 +0000
Message-ID: <CAFEAcA-QBk6d22a-TdHQ3m22C0qMqJybob3kMMmp6Q+HPwp-xQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/76] target/arm: Drop new_tmp_a64
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1032.google.com
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

On Mon, 27 Feb 2023 at 05:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is now a simple wrapper for tcg_temp_new_i64.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.h |  1 -
>  target/arm/translate-a64.c | 45 +++++++++++++++++---------------------
>  target/arm/translate-sve.c | 20 ++++++++---------
>  3 files changed, 30 insertions(+), 36 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

