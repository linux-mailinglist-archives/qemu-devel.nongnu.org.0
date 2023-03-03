Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7629E6A9FCF
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 19:55:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYAYx-000878-QA; Fri, 03 Mar 2023 13:55:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAYw-00086a-Li
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:55:26 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAYv-0003m6-6X
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:55:26 -0500
Received: by mail-pg1-x52b.google.com with SMTP id d10so2054729pgt.12
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 10:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677869724;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=11UU2AZmIhClsrZQq4N+R9RlCHE2UkNBidLFiFJ/agg=;
 b=BRd6WaLkOzmX1VFapgji/0q/0ZuiclEtJU4iuiSy3yHqNpRmiTaLpoKRkyw/KhUajy
 zdgx2Y/7HJpIlhSyGAKsUG9c/tq06yTJ87QtkRvt7A4dJKVEkcL9rBzBUH36BUN1pEup
 lwnRKETTHMT8GAFL6jw1sZZoJd74LluU3KczTFBvji4QcDpcZhax5mZlUDMqcrjEpkD/
 MTa0AbPo5+U4RSvLXoAR69h9zSF+My2KGtrffzc++us51+0Pr9wCAFRcuYBVbXJM0VKF
 KPIV/Y49YzgEJSF53Q6B9sMBONYm13T+hq8wSIpV9u5NtPFqcpTTalmMZkVj8yY9SB0P
 O5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677869724;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=11UU2AZmIhClsrZQq4N+R9RlCHE2UkNBidLFiFJ/agg=;
 b=E//1BrzHcfC8K/Zew6NjXo0v8QTNsQiRq/hfFsAdaLm9WbSVd6h4qYImLS77UPX2D7
 HTXRk2B84ce6IW+U0INFlMetZHhMXGF8T0AjNv5a7jXSfCiK0VQH9zhP22iucwUT9Us8
 MoO8hLWkuRRaOocVtHyhCXQ0pHqUH8TZ7q1AuoB/WwHR69eUOdMKvqiZKXuXho5gfQGi
 y1iIULSHdkrW6t7DMOP+XX08qjE+XB9TVFqm+IPbb9zMAWkdVdeQJBF0WSHMJEGZYlAJ
 6cJaDUvUE9EO6+V7UTeUgydBc2U1gcOmVQDb3Q0U1dejNfl7gxRwRzPR9HffQf0bQWwO
 M6zA==
X-Gm-Message-State: AO0yUKUme9ouT8Fh6kql+MBpXlzDwIZwaTuHW9072SF3d5WglDBB9f5K
 c9jR4ec4uX52+Y31cjBbwFxz9x6haq8Umr/iQAVPDA==
X-Google-Smtp-Source: AK7set+2dSUaUjbNyRyxCBJy1QRmxUXI7eQsYxvXiAKWg4sGy8ymaBexfU4jfB1hEGody9MvVEbtitagwXYq5/8am7Y=
X-Received: by 2002:a62:8348:0:b0:5ef:95c9:6a88 with SMTP id
 h69-20020a628348000000b005ef95c96a88mr1316068pfe.5.1677869723891; Fri, 03 Mar
 2023 10:55:23 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-37-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-37-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:55:12 +0000
Message-ID: <CAFEAcA93iAPj2RDJSrnLQuqDJZLpKph-FrQX2yUuFrZtaeuxww@mail.gmail.com>
Subject: Re: [PATCH v2 36/76] target/microblaze: Drop tcg_temp_free
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52b.google.com
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

On Mon, 27 Feb 2023 at 05:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/microblaze/translate.c | 54 -----------------------------------
>  1 file changed, 54 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

