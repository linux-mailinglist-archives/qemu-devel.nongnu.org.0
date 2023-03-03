Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D65A6A9F7F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 19:47:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYARH-0005nW-3y; Fri, 03 Mar 2023 13:47:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAQz-0005IM-0i
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:47:19 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAQx-0000jf-BT
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:47:12 -0500
Received: by mail-pl1-x62d.google.com with SMTP id i10so3675881plr.9
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 10:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677869230;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+SIMPEwRhLB0F9/Y03oPnThC5qqtRO8qJVAcuzylTDQ=;
 b=pj8EIGbrSe/n0I+x96yXQp+vA/DQ0jch6GAgYgTQbJPZSykJnmS5SgwOj5GuLiJstP
 3O/pIo21PSf6jDuWH36OK0/97WwCkmTpPRTIP0/bPSnivdVx9W5R1gjtjnE0l8L2wl4E
 wPPWAtc4+9Kpx8buds+ieWRJqpHNUJGLRNZm6HEF9g/uD/GOchW91et/UMB97xlt3urA
 gke7MY9t82UKoEI4555MYag77pEoVwis6wVmzxDZJVThOLONShXcGhDCo/gkKFLIKdf0
 WjU9SDwboNtytfy//g95UAsBrhrFroeNVi6wBMSgWwr307gmGHPAl5di40ITYM1vHEC2
 0ULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677869230;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+SIMPEwRhLB0F9/Y03oPnThC5qqtRO8qJVAcuzylTDQ=;
 b=xFYjonjT2oB69LN58VFc4RiAF2Qfz3YXJ61tr/iUXm3uIgyhGGgsx0ApeZS1btBSzf
 qgY4YzWPuNcsUiiLIK3BJC2tf1Lx8DmxLYlxfqpJAWO5K5y5k5VIL4sWX44t29KnCD9Y
 RpxqqaYRix/rgYTQ+PJjrd8HsOin6ehAQOPDky03L/lttGwkCY8MO0TpmNT0WFHoR7VG
 k8mxZddwUiXKEfOHN1Y/MkFFU57dK/8sQPzKukqCXTC2RdMm+o/f7d6mawTk1lL9SsQS
 +qa2+khsKCgwwdKo6hhzUzG3aPn32xn6DZE49QwU4hPogLCpb+9B6l7TUNKenZZC2LpZ
 Rwzw==
X-Gm-Message-State: AO0yUKWB/ugYSPPwpfV/yDf2GKMUrhBwv0n9zxGgQiw0gBG68S52MC5H
 HiBIVDhTGTnqCzek0S+cELEOeFwA9yzaF8fXsC9r4g==
X-Google-Smtp-Source: AK7set8QZa3mpn/nJ0yJjMV8Wtmf29eqDOyIlH1rIMXhXy09Q6oK+piANgTHVo0TVxVz0gjcbSAqcRrXu8ac67ukiBk=
X-Received: by 2002:a17:90a:a888:b0:236:a1f9:9a9d with SMTP id
 h8-20020a17090aa88800b00236a1f99a9dmr2833482pjq.2.1677869229818; Fri, 03 Mar
 2023 10:47:09 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-23-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:46:58 +0000
Message-ID: <CAFEAcA9Mv=CRWmQUho=HhRmVBcZ9w5cqry7LDwyLnEHWt3yOQw@mail.gmail.com>
Subject: Re: [PATCH v2 22/76] target/cris: Drop cris_alu_m_free_temps
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62d.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 27 Feb 2023 at 05:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/cris/translate.c         | 23 -----------------------
>  target/cris/translate_v10.c.inc |  4 ----
>  2 files changed, 27 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

