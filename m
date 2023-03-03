Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC226A9F76
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 19:46:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYAQ0-00047v-NR; Fri, 03 Mar 2023 13:46:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAPt-00046E-3D
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:46:06 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAPq-0000ay-Fv
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:46:04 -0500
Received: by mail-pg1-x533.google.com with SMTP id y19so2057634pgk.5
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 10:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677869160;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QaA0GgfQE3v+jgTFbm+2hJo3CTuezX2gi8MsDE+jjYE=;
 b=nnB82iG5KcoA6OfvAkdZbKudLIqu/Fuu9xkDKCABDjAthlm5noNemYkaUWHZoHZvKp
 CwELsSDVIoLUcCktPd5okUNV/i69VpDAuAJHuB8L8j05IF8veexYd1CztKxOgDDt+WOR
 /yfPGe3cYrSx/0x2u6LiNVGfW2L87NVAOoL/MPgdFWQ9oTDnbKqEuot6nkAAzaLXt3X2
 T56ovc3Z5Wl/S1F/Ski7v14FpNJ+eONsj++imVziT8xhDF/ZrNd+kSyhBndhD/eQwkXG
 bBUdNWV4ixkYaEbRzs3GNaKRPrGB3Xj1qi/BUb6oxK9nHQyx/XYfXbyLHr8AUTob2srh
 Uh6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677869160;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QaA0GgfQE3v+jgTFbm+2hJo3CTuezX2gi8MsDE+jjYE=;
 b=e3b167y1xvVi5B+r28CgZzVythiJtRXJ6jxyaixAcHZ9crAq9CHb3hu6sAKcrGZz/m
 z2TJ51XvmT+1ezxFViWa9xGSRx6RRXgl6HFYBB5uTA82W0l8IebENNFyirz/5xbb0l4Q
 eAqbCCoY6sZNoSptuMUXCrxtWMBoP/Gy7tU6rFU4gLyBQk58H1i4LcAD/311q2RiyJi6
 icl737nC0DIUaMgwjW6YEutFo5qN8wFdE0IxbciimANEy7bVpDatE/Q/pUh2W6p0qXY1
 GDd6hjDmn/Xyp8z/ZoSmBFN0yUitcdIbjyBlT2CZZAvTzoiPn7NJXXbUM/FEq6for3Qn
 ZLbw==
X-Gm-Message-State: AO0yUKVUgDyA4chmdIRVX838phR5p118wdsAjZzmQlD2byuPRSP2x3k+
 d0pihwgQZaG4whZODCmf0QBY0ygUsjqkI5Vch8gMaw==
X-Google-Smtp-Source: AK7set/LTEs7niba4UKwAkXSs2sd5LsWsC0NJw7IC9mZdOEaZVCZSIG+dSUGuEjkvgd1Ag0hzyphheuAHXOuYDrBM4E=
X-Received: by 2002:a63:291e:0:b0:503:77ce:a1ab with SMTP id
 bt30-20020a63291e000000b0050377cea1abmr827958pgb.9.1677869160248; Fri, 03 Mar
 2023 10:46:00 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-21-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:45:48 +0000
Message-ID: <CAFEAcA_tGP3qAxCwK0p9C_EzGu=T1XAnWYhQq-gqqpekfztxNw@mail.gmail.com>
Subject: Re: [PATCH v2 20/76] target/avr: Drop tcg_temp_free
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x533.google.com
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
>  target/avr/translate.c | 228 -----------------------------------------
>  1 file changed, 228 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

