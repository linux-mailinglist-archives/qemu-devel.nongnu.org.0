Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B46B76A9DC4
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 18:34:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY9IZ-0007PK-3w; Fri, 03 Mar 2023 12:34:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9IP-0007LO-Ol
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:34:20 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9IN-0000Mh-C2
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:34:17 -0500
Received: by mail-pf1-x436.google.com with SMTP id y10so2042436pfi.8
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 09:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677864854;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+08/rGcbX4gYG9RNH9XyCmG10A20EblO6DeLZdgzWaY=;
 b=a+TIVkub8AKKDpijee6t5oYcCSms4AZsDNzJRr6ftlAKGJ0pQXkhq+vohmzxyNNwOl
 wzLb+YuV5xDbBjakuX9F+PiBSJDYFP8VG4pgXqQHQFO3SReEpLXOrSJ6Bgovk9Gcmi3s
 xGKtvCm/XtMnpjoYJLLnyeXjPNd1gUzIj+Rq/Qt/UkwvKLYUY6SudTXJWV2aLbrqQyjr
 N1N+HJdb/905RjtTPojI548kl+RB3D0xU8BsawqdvNnaE3kilPGqAnLxkgz+R2wLGAw3
 4JtikUh7Ibpj24+/uEYS8jLF8y6iaoIX4t5gWBuXTg2qoj1z04MsGR00H9ZhwfgkVr8M
 b+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677864854;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+08/rGcbX4gYG9RNH9XyCmG10A20EblO6DeLZdgzWaY=;
 b=tcaO6ixkgmeRTdx/3qWiBRcPkxxShRHAiJUBuLgZi0SilJHj3jAZiZ1Fqkq3eVMAWy
 xShWd9IEgN1QZQmncbcTtPbPsdVxTR2wgScJ8KhBdSUyBlFeu23uNJYgDEjzLzPbzYj2
 QK2m/WDN+16kegUhky94Zr82sWjPbgriZaEH3oca9N2MMVm8XWH/AY7uSU9EdtfVdHVY
 G6yoh98nltUI20e1toMlsgwB72KE7foEsndcXN4KNBS04FbH+yQWnmln8661T8eviBvj
 z/XWWvLdu8nBzPfe94LmmIoEhsHCB1/E9Tz+4hLrY9ox1ejHHUbwNu9LVaoHhEiIrBGD
 LnHQ==
X-Gm-Message-State: AO0yUKUv+5MrU1Uxj2LvDMClxNMRPT1yoEsi6z1LbGVtlCIQBa861AQY
 gch2iL9XCg0xqhp9QrGRyeJeusLNcg2ZbyHpYCAPqw==
X-Google-Smtp-Source: AK7set/54M4Pq+CGRDivqX68nAc1p5hiAOeoTMyE4JpdEf93gxRbS20yD3645iE6k1L852AKM5Ak+xmcKp99trAa0IY=
X-Received: by 2002:a63:2918:0:b0:503:77c9:45aa with SMTP id
 bt24-20020a632918000000b0050377c945aamr735029pgb.9.1677864853915; Fri, 03 Mar
 2023 09:34:13 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-10-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 17:34:02 +0000
Message-ID: <CAFEAcA-nW8yfRSAZQ7xayTyDRJz7Znt5gd8cjwGbNXrai58EEQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/76] target/arm: Drop new_tmp_a64_zero
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x436.google.com
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

On Mon, 27 Feb 2023 at 05:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Only the use within cpu_reg requires a writable temp,
> so inline new_tmp_a64_zero there.  All other uses are
> fine with a constant temp, so use tcg_constant_i64(0).
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

