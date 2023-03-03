Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BABFB6A9EA9
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 19:28:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYA81-0000Eg-80; Fri, 03 Mar 2023 13:27:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYA7x-0000CM-Of
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:27:33 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYA7w-000359-74
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:27:33 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 q31-20020a17090a17a200b0023750b69614so3105128pja.5
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 10:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677868050;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SYiORfyMnSoUeeRM3KxybcI4Ibql1AoH9JkfMTnixtM=;
 b=RMLZfIOuZ1DTH/QlVJN1jKsa4ib8Pi8ggm6+JCOgl2vth4Nk22fFfBvmuEpE60Qtk+
 sPFLHL5HP7ERF+JziONTngm4VEr5yPCuQz1P9XVjuXxaFuiXnScN/+gkdYRpA39FdTcA
 4YMevUP5HKRjf14J66WVCof2hlPxbnl+9Xp21WnK6P+f2GXPl+KX5F+xw+bG3ua92usd
 ppBaRMCVB5RiIUO2y8xUhLYyEj0pMWEV9scBRwhGy8UY8QXC7j74Eb0lvPrfedGQu7j3
 FHZK8hsU9IA7jxpzAIwQkn165/N6HvW5kv5wXF6wRho4nsBX/BD2qiXl5udQs+dqblib
 Glpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677868050;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SYiORfyMnSoUeeRM3KxybcI4Ibql1AoH9JkfMTnixtM=;
 b=09ogj9cVrv9m1g+8ksrBtaiF9cW+TB3Xs13Rhcl9CO5wALPIJhxnBUSlJXnSV5KSEw
 y6sMz7Hrq6xykJ8elEp+3B6Aymvc3zOMtBhSdSmTXfpWgrGJm786MeIs1xIV8QRFC1ei
 buemRZVknhN8wAINtccy5JwxA2AlWB6SN0QWO/GvetB+pBDbMEqCI87/YMqYj060DBko
 xiFZE61STck21Uyh8tHNikvnOUMveJvzfE1mBQ0f5VPLqj4Zc/Dk+p5VoFmBqtS1QwaK
 o7LX5k/jSSw6RpcAodAyuXVS82B8DpfV7Qu/p1kNJnYFYWHd+vRWZKzOYQsa1Zc/rDL7
 VN/g==
X-Gm-Message-State: AO0yUKUOIU5+dq13TdTMcfs39YkqAFN+ZRcB/+BSjqPe4+BcjIQfdXRn
 6WkmXlBd+k9HM1c4OvIhhUw4+OLlcGKp6j7b2XDO3w==
X-Google-Smtp-Source: AK7set980xQFpL7gnbOC5Er9xh4VYohDz1Kz4Y9LPBbEXurAqeADlHkvJCsnNVejYznG6e/egRdtGJ+Hd0TlbwyAcuw=
X-Received: by 2002:a17:903:1243:b0:19a:b151:eb83 with SMTP id
 u3-20020a170903124300b0019ab151eb83mr1030807plh.13.1677868049626; Fri, 03 Mar
 2023 10:27:29 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-17-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:27:18 +0000
Message-ID: <CAFEAcA9JuQJWHuAYVhgn4jpfMKPtSYAh1iuZ4QemkfzEcCycvg@mail.gmail.com>
Subject: Re: [PATCH v2 16/76] target/arm: Drop tcg_temp_free from
 translator-vfp.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1031.google.com
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

On Mon, 27 Feb 2023 at 05:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-vfp.c | 193 -------------------------------------
>  1 file changed, 193 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

