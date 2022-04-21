Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1320550A8D6
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 21:13:03 +0200 (CEST)
Received: from localhost ([::1]:54834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhcEg-0000CW-3i
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 15:13:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhc9u-0002PT-6Q
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:08:06 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:33576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhc9s-00021C-Ku
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:08:05 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id j2so10496440ybu.0
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 12:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7KiZfIo2U4alUC+pZmajN1wzad9oCLiAF0iFsdhuYDs=;
 b=pRfi98rP22f0OT9xb+AaKE8X/mOBasi35OczLzvKJW9+89gshDza2jGhPDx5558vIM
 u4q0cMo6pNRf2NcgKRJFtHb7NXBHAHzcwwWJDD27uk4zlg6WqgSeRnq2bLL+E8i0ZRCX
 L4/c4+lpoIeSQgzim+7x5d+f+B/JFu7XJoNHw5Vnads0A4hteetbq7t09/6HsbC8BNUR
 S+zG9c36WabmuEO+eQg6Ez0HYzLOfFIrXSwaTo1/W8greSFZYYe+gylH3Upd08L00uFf
 8FEQHIeBY3yq07v8pXlxlE2ulPcg4zZ9wtOocp6nSCKj2KYBBSpB8GLsfvpWGavjv4o+
 XbkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7KiZfIo2U4alUC+pZmajN1wzad9oCLiAF0iFsdhuYDs=;
 b=Z1q8a76uJ0UAD4OZnsm4NINgQgp538hYSS2/C0b7OIxgcXISnfTxpVgSroN3fNvhNo
 rl2hTLYufQjCEiVTbyeZz4xOpxcrNsks4x/uFAGUSI8qW+yPiczeNYMkYNYxKl28Y8z9
 9+IBWsz2CBHbmd/bShF9Ckq2Ft2lP21rcm+dRTKrLParKHaq0ZGerK8Kjjdb2dRnWEQp
 GvstXITkCEfaIV4eKq0bS2oQPV8yxifbAYavz9JCAOk//vyfe6M4upuwuavPw9QDRqCa
 TsWi/rkb9v1F2X+EB0tTNFH/tmqUSL62Jx2Q0Uz7PcnR+BKHT7Gzksaf4Aw8K9RmXN4I
 JeXA==
X-Gm-Message-State: AOAM53124WFbO8p79aB72j1rM5yww1mGO68fMH4DwlFOwAGwh76rCYVu
 DoyFepIxBE96GzD9/pZ3bRpBY11qFIUBPQxqduQ6/Q==
X-Google-Smtp-Source: ABdhPJzz28ooOK1/6TTFhKMAHJF53C4qCV8q7mNd6cYLH86VwzJ4lWhrNSzAauZE/iFHP2O0ARJrz7xicpWRA0lrQ6w=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr1197426ybq.67.1650568083341; Thu, 21 Apr
 2022 12:08:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-21-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 20:07:52 +0100
Message-ID: <CAFEAcA_2kdY3uo=H7Y66oOMKV-c6A+ah8Kh-ok1-KNJ9Q6UFYQ@mail.gmail.com>
Subject: Re: [PATCH v3 20/60] target/arm: Use smin/smax for do_sat_addsub_32
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 17 Apr 2022 at 19:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The operation we're performing with the movcond
> is either min/max depending on cond -- simplify.
> Use tcg_constant_i64 while we're at it.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-sve.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

