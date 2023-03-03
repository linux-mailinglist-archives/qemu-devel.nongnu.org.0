Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5C86A9FE2
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 20:08:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYAlB-0000QN-KC; Fri, 03 Mar 2023 14:08:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAl2-0000Hn-Jy
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 14:07:57 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAkz-0008AU-MQ
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 14:07:56 -0500
Received: by mail-pl1-x632.google.com with SMTP id p20so3712757plw.13
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 11:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677870472;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YCPjftmuDx5185yydi5K+Y88ic/ONbxXSEdEnUUydhI=;
 b=sn4cDp/nlCDynuPI/b72eulruLBTUsZCQBlOigqTKUhH0ct+S2/m9YYzvi51gTr2JC
 KBA6PL5fS+I4Jnt7hTWKAzu3apJqREMzw60+h/4jnla3cGE+BBXtGmWsxXNTNUVwLKPJ
 ZO+EqVkExa4sO64gl02PcseKWj5BDp18P6SFteiSZPQoqKhnVqv79fBmrqrNlf3pagye
 gtzSVH0PXAXidHlk8w5Aw6E5ehC6PXFh1aQxX+wl1mSt5KhZtoIBtd8/88Ru90FsefkH
 eSbG7rnt6qr6FbtTz+ENsNA0IreslnSOi3lM4WLvbcz1+gIilKomKIIAVnoP7Usd10hL
 WXdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677870472;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YCPjftmuDx5185yydi5K+Y88ic/ONbxXSEdEnUUydhI=;
 b=2x1Eo7t1DpAEJFjTTN7vVP8RMnmlchdqcIYGvJ7YgkkODVqCmPUX+uV+ea6f7jKEDd
 s9k8GOS68KbPI2xDQJit2GcYeEYfV9WWzS+cBkYcOOMueieg/VKyaVGrA73WbUVjGg/N
 NEDCsf6im+tMwbRQPqmGQmwSFQgsKOOexsWACIKKv8ihpbb+onm0XZ7YNUPNrTPLnWsj
 pThEhIqEq0w11Btrx1F39eQ2V5qJnRbwkt1W+gwk6mb0yrH0L5e+ZmkVO1Z39hcjzwh+
 sC7c5xCfOODJ/uldjrNGOp9RdrJ/4W/X2tIBoXCtU3OQBkkgDZrssyIMpZwlcMPXxVFy
 w1uQ==
X-Gm-Message-State: AO0yUKXN5+j535Brb5Z3NG2KfN+q00rKsoQLFmTXhoTpAHbve4T7dpDa
 DvGrf2nyXUGUbTCdaJzS2kBA3Zoq+d+SJFPxGBeQjw==
X-Google-Smtp-Source: AK7set8Bom2ldJgiaayy5WM5r6EXc5WKxR+smBnnalQLwzOstGHgkC75kOMfF3v7WNF34cVllN6k4zeCgk+V4uxbCIo=
X-Received: by 2002:a17:90b:46d2:b0:237:ae7c:1595 with SMTP id
 jx18-20020a17090b46d200b00237ae7c1595mr1016024pjb.2.1677870472234; Fri, 03
 Mar 2023 11:07:52 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-69-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-69-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 19:07:41 +0000
Message-ID: <CAFEAcA_-NHYrD72fvJiS5e_SwuZv=V68kcUb7HGxTCDCuOkpmQ@mail.gmail.com>
Subject: Re: [PATCH v2 68/76] target/sparc: Drop free_compare
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x632.google.com
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

On Mon, 27 Feb 2023 at 05:40, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
> Remove the g1 and g2 members of DisasCompare, as they were
> used to track which temps needed to be freed.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/sparc/translate.c | 32 --------------------------------
>  1 file changed, 32 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

