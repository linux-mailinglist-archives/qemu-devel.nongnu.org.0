Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7246A9F93
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 19:51:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYAVA-00029t-VR; Fri, 03 Mar 2023 13:51:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAV8-00028E-HY
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:51:30 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAV5-0002R3-QO
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:51:30 -0500
Received: by mail-pg1-x52d.google.com with SMTP id z10so2063085pgr.8
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 10:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677869486;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ALPUL8uwoAfU/QHFL9aVWTpTrYCD1YH4dCYE+cs8ML8=;
 b=iih0BUNpURSMD3E52jp+EUcAciKINeqr17+i6O5Z9xPV4S6jTEWwcWleL2aw8SiFT3
 +lAAeViha8T8OvAN6LWhcxfJHI2Car9clbq+uLELrfOmhd+Qi1mFKmsOqBu4xiUwt/19
 s51iKCZkZ7dFvcyhErb+QtluEPlEk9od5NyGK3eefvXmVWjX3Bt/E+VMsBjT3fwMphLj
 ii4gpYq/P4uNyHX+nHs0cG3fqzQ3r0Hdw4ERn64V/gOyTSlXhRZaKbs00hddwrPWhYQZ
 0jc7srZOawMidx2MyCSWx61ZL+LDcZq26YsNkrcgpJQD4XXD9a6RXwHxZjdRej7u/zgx
 7Y1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677869486;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ALPUL8uwoAfU/QHFL9aVWTpTrYCD1YH4dCYE+cs8ML8=;
 b=UNPK2q1QwLdlgCVUple+iBFIrkkEZn1Zm3zlZtaTTdHKq2/zvH02pFfwdBFrLdHRNo
 HQwfE95GHcOkmIp5EhCF8tlQz0uKF8qsgWpG9GoCub6q7NgsDdRFP/K9qImfu59nugSi
 d2I1Mt0w4y+bhxMnBc3eiyEg4g+ujJoioB1GHNLNZnNWr8U4gYranpq8pIq6rsHDM+di
 fGGDVL5XYEY3oxTsrLyKKEkrmX5gUx2z4poxIKETq/RoRSk652OdGm59IzXXm3kdelNy
 MqunRlFtXVkPQqILAs1yJLQ1OmgJNNA/Ea/8k7KzS0MmtZADNs5a0hdnff5Mwu3cpOQr
 nAOg==
X-Gm-Message-State: AO0yUKUeTTiP9TZoEnU+kRJ/oKzh7mc0S2MrdOGpipZBmobxp13S4Dkd
 Dj1IfJ7FqNVyAqwPS2QRx8IZTN6sfm70pomHZRGbOw==
X-Google-Smtp-Source: AK7set9EruSQd7jDMFcmySoBoI/0eRyav6Rf1ARQjfzS049lRkAjuvtofZFr8Mw+qxhe7G6AM2STU/atERBZijXnf5I=
X-Received: by 2002:a62:8348:0:b0:5ef:95c9:6a88 with SMTP id
 h69-20020a628348000000b005ef95c96a88mr1312158pfe.5.1677869486290; Fri, 03 Mar
 2023 10:51:26 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-65-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-65-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:51:15 +0000
Message-ID: <CAFEAcA9WbT=8a7PnZh+cmDWU9EeJbv9dcM7MDMhcpUWN3m6VUQ@mail.gmail.com>
Subject: Re: [PATCH v2 64/76] target/sh4: Drop tcg_temp_free
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52d.google.com
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

On Mon, 27 Feb 2023 at 05:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/sh4/translate.c | 110 -----------------------------------------
>  1 file changed, 110 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

