Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 502295E676B
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 17:44:55 +0200 (CEST)
Received: from localhost ([::1]:46972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obONi-0004yq-AN
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 11:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obMoY-0001vl-CS
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:04:30 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:46975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obMoW-0005fC-Sq
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:04:30 -0400
Received: by mail-ej1-x62f.google.com with SMTP id bj12so21222010ejb.13
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 07:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=ZhvFjHz/+hATgwn6t9ulwtztyb1uIglXxu13conz6zI=;
 b=bHCKSJyxC5iHYVZOKvIux22U11TYGFKP3yZst3xiAv3dPkYwNvQ0Y1FBrT+Fbt4Ez9
 uhW/9iQeW4u6PGdYhW5/zjYELDT9SNetZE4NXY95nK2Gkbn+aT5RDqkofM8r0+NJz6XV
 RynjqHr1WxC6++zZV9Xm7W4i1yncfKZM0nZCifm+DEOGOAd8pp5psXMAHNav05bW1YvD
 QxAAB+Q5sf/u02VDJkY1SmjJmsMwC/zu6yGocjmVDS8HVlFlTKCctkZ2mGZzVoKEzzl7
 JwB1EurcP19EKoAeE5wybUZXSdwjTVXf7aXwKACD0pHMysPPTEdYH+zAF+qtxrtTrWan
 p2nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=ZhvFjHz/+hATgwn6t9ulwtztyb1uIglXxu13conz6zI=;
 b=YYWWLxKN8gkSz014pp+uq4GV4at2c22it+ClblwICWHbLgd5TeSY2PvNGYQgG0witO
 qRqO+mwCDiWw9Z5x2Jha7AIvYgtHGZfeWFETNZwDoOW0WKrKN81K0xFgavYmlAWZs9bc
 cqwHhK+aarJ/m4fYTwGaXxmlPnKG/BdWc8fEt/L65diZ0SJIWhiZ70eCYcgHXVLn+jIi
 P3xFI7Uk6lQpRSsAIR/GM+heNMD2xC2H+tp1E82NpQDRJ+MXSFIOH41XLEoZHKAuondL
 RjmPlDdKtefumsk8O9+A39vdeIcvzzlAQexK+Css6xp4QQgTq1o9Pt7mCzb5sIcaIPAR
 KQcw==
X-Gm-Message-State: ACrzQf0woHPmV27sCnR3AK9Mn1SbR70UsYBk1Fn6MeQXbwM/f+0v8sfm
 2A//MriIj7Yu0CxBh+TMmrVk31Gel6lnnJLmz8YJfA==
X-Google-Smtp-Source: AMsMyM6NgRq9amz4qcklgMGMpm3wIUW1VunI+1sY+vjpQiZ1cUir0nxWU6BhKyGc66HODieK/Th2qdYUChV2460dEIQ=
X-Received: by 2002:a17:906:8a6b:b0:780:ab37:b63 with SMTP id
 hy11-20020a1709068a6b00b00780ab370b63mr2894855ejc.365.1663855465112; Thu, 22
 Sep 2022 07:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220906100528.343244-1-richard.henderson@linaro.org>
 <20220906100528.343244-4-richard.henderson@linaro.org>
In-Reply-To: <20220906100528.343244-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Sep 2022 15:04:14 +0100
Message-ID: <CAFEAcA_6+jsQfCvTxxUdmdcisMBSsvzKy_g5pdLq0DZ54VtFSg@mail.gmail.com>
Subject: Re: [PATCH v4 3/9] target/arm: Change gen_*set_pc_im to gen_*update_pc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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

On Tue, 6 Sept 2022 at 11:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> In preparation for TARGET_TB_PCREL, reduce reliance on
> absolute values by passing in pc difference.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---



> @@ -263,14 +263,14 @@ static inline int curr_insn_len(DisasContext *s)
>
>  #ifdef TARGET_AARCH64
>  void a64_translate_init(void);
> -void gen_a64_set_pc_im(uint64_t val);
> +void gen_a64_update_pc(DisasContext *s, int diff);

AArch64 addresses are 64-bit, so there's no guarantee the diff
between two of them will fit in an int... We pass pc values around
as uint64_t, so I think we should pass diffs around in int64_t.


thanks
-- PMM

