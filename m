Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8326A9FDE
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 20:06:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYAih-0004zj-UG; Fri, 03 Mar 2023 14:05:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAid-0004q1-8j
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 14:05:29 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAia-0007g0-Ok
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 14:05:27 -0500
Received: by mail-pl1-x62a.google.com with SMTP id a9so3714256plh.11
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 11:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677870323;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rY8hg+ZDfbay23UtjvXiQyvBkil5VxYpNYFPij2yIH0=;
 b=m8sVZdBdj20lLIG6GVfo2GmPd+/ll5jPqioG3Wus4r48CN50yc661GZUX3yaWSWmWd
 f9mhl+mZzIsTD/HGi5cSb6r2t8lxNGaecDmUwBF29SYjQlR8B6ixi+XSSLwaWC3g5UxZ
 huiuyrDchCZK6onJ3Cg6bAYb6rVEBDtBlvX1ru2UsncggkDZF4zhkxd6PGOCT5ewM9Cg
 pBu2yj0gq3oKXKW6N7Uq3zNb6IMukxPxJKkzGazGvNL9PkckCqXgsXx1dfrO2PCnTyty
 kfXTbBHombjdYmaPHrcYF28g0Lfglk8PAc+7K2nmM3GOqjiBY2AQbJ4Br4KvD8J9Mwh/
 3Zfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677870323;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rY8hg+ZDfbay23UtjvXiQyvBkil5VxYpNYFPij2yIH0=;
 b=x85SBl0TTW8XJNEI4mJ+lCqvjULPjObL3JslafLFc6AicTO5mzKWDZsZdvjwBp/VEn
 bzF0lMKRzusRxmER5fIapQMZPqe8KcVpgZPccYPorYPSNWXB4uWrVddK5+OFla7k35XW
 MQX4UKCnPuRusrfFsChFIeVH1vOe6MqMc3q8CF40/aYaap+H3dnRqmL8Z3VT0jszlnkR
 ITNY5psPsl7NTItfKmqC7FkEVtyfmkidQ7pfekEP8E8OyifkKxxM2kUGU45oRJCi1syu
 t0hh2B2YwcNZ0tuiBf2q6SVQ8aXGG8xOsNseaKVGstfMz1nl32wNxQgzIOf1FoC3IsG9
 5c8g==
X-Gm-Message-State: AO0yUKUKWTFMCKBV1WjWIZNXr/oD4uJLc+QtaADV+oR0EedVhbQ3pcom
 6vr6MC7p7a33cetCLz6y3wu04qut/0GaxSDSltHHNg==
X-Google-Smtp-Source: AK7set+vM8Br44mLjU/3jC285H0ieON6z0ifxraVV+sSivte50olq4mhb2YeMAbVYPWeVTlyALk8y/Imx7B2D7FqmYs=
X-Received: by 2002:a17:902:a3c6:b0:19b:8cbb:30fe with SMTP id
 q6-20020a170902a3c600b0019b8cbb30femr1085402plb.13.1677870323363; Fri, 03 Mar
 2023 11:05:23 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-66-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-66-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 19:05:12 +0000
Message-ID: <CAFEAcA9hjD_WRv3Aoh9xy0MS+BB7Ps2s_+ksimzBQKryZy20hw@mail.gmail.com>
Subject: Re: [PATCH v2 65/76] target/sparc: Drop get_temp_tl
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62a.google.com
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

On Mon, 27 Feb 2023 at 05:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries,
> therefore there's no need to record temps for later freeing.
> Replace the few uses with tcg_temp_new.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/sparc/translate.c | 53 ++++++++++++++--------------------------
>  1 file changed, 18 insertions(+), 35 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

