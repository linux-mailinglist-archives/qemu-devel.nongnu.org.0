Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1699E6A9F89
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 19:48:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYARi-0006sq-I8; Fri, 03 Mar 2023 13:47:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYARg-0006kP-12
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:47:56 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYARc-0001AY-Vw
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:47:55 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 p3-20020a17090ad30300b0023a1cd5065fso3214443pju.0
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 10:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677869270;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rf+8rqOwxr93bf93w7OyIDbD1iQfXmmQLHIMjh/TBQs=;
 b=jna5ALF/9a7celLZCkknk7CNVlrVKFHwDgoqVC9VPQyDjxJzxXtO24ZTBP2RB9EYrO
 rxD2OAKy1V4yOVhG5ogPn7xS1BT7a25y1vSJqLzN8MyLXDWXqAkYo46K4J4hxviDF7Iq
 0ppA5PEB6AUosdd/4YSuXOjjbvc5uNPzmxSshJ6TStDrQ6m0bAbX/B9u1wvImx2CgR0+
 VNEckocVBlnvDje9ByLj9aZ4jfXVDLdx2S6kSCYKN9s1TxFyWYb9BAe1mTOwjEfQnZHn
 73EM9sb5hnluq96iabZGddLjnrTJSlkGvcxnQO4baQD+KxUvLwk4lzkKfK09BZ/e6dUT
 MAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677869270;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rf+8rqOwxr93bf93w7OyIDbD1iQfXmmQLHIMjh/TBQs=;
 b=VdI8DuqNGclzPQU4QXjFCDbfejLipFtfjS8/oSJV7Cq5IOBA2CjX50SNojBXx4lhw9
 grsWiBCQrezKnS6DjkyNacjdIMV7DRt0q9Afd2nu2ed3P/v8PC7HtHKEhzSjdCck+63L
 z2PkcpWYMT0S6Q++Wjrm3q70oZCmeEW61tDP73NiZVBk9w7ppcRQRY3712BMFVHnai+3
 D/kwvEt4oThcNxRFs+2I7EKUiO64vd/G+l0cLAPPdHoXFftfLCHdy+mGq6Qb0REV1/He
 QjNiwChCgLIfC8Uj2Jf2WcyHrnSJfIAKRGdaj0z4I7QnqsEbpikOuVYGpPz9PcS1H0gD
 muWQ==
X-Gm-Message-State: AO0yUKUGVJ8TQRs5jD0eFJ9s3m3JD9iWkTBW8O7NbpRvGuWUTWjX1ZSq
 tx4jsKT0xsjFFbFd0z/CZ68g+WEf/m3g+KwFnRitRA==
X-Google-Smtp-Source: AK7set/NTL0tXjglBC7JptIS8mgBkcC75vbIneYGfnlAX56jYOofFGqn1W12qSnrhNuCaJIoNhWpfgX/YUn4OkUNlCA=
X-Received: by 2002:a17:903:428b:b0:198:dd3d:59 with SMTP id
 ju11-20020a170903428b00b00198dd3d0059mr1075684plb.13.1677869270628; Fri, 03
 Mar 2023 10:47:50 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-25-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-25-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:47:39 +0000
Message-ID: <CAFEAcA9mq4zGgvZ+xfQdC3tTjHM+T8qECbLuxNj8pA-waGxWyg@mail.gmail.com>
Subject: Re: [PATCH v2 24/76] target/cris: Drop tcg_temp_free
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

On Mon, 27 Feb 2023 at 05:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/cris/translate.c         | 70 ---------------------------------
>  target/cris/translate_v10.c.inc | 41 -------------------
>  2 files changed, 111 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

