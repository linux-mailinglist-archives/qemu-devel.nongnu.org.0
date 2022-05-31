Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DB453905B
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 14:11:06 +0200 (CEST)
Received: from localhost ([::1]:51038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw0iF-0006UT-KV
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 08:11:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0bY-0003ba-Jy
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:04:09 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:56282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0bU-0001gg-S5
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:04:08 -0400
Received: by mail-pj1-x102b.google.com with SMTP id n10so13531436pjh.5
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 05:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c23+p0Wp3qkRJ+JZFgBrUFvUk0UkRN22ccsyr4/FQLU=;
 b=nmT/j8Mwanp6RS9+xGsPNGofixwNz2pJuYGu9IvAArGO4LdWiRyTZkDlB1oozHAoyH
 YA/3T3odMcl5DT0f7iBIDAv7O+uydugywaSQTkwYjGhhor1SRH5pVcBF1EPWkSgnos9j
 s/EnwEgoUS8nYi/wlGHA8uJYWaE6rIxxJQ3+r/9i4q3/afmrjm+KJ5EyWkPy17DO5i4I
 /U0qmabLMuG6GGZgF9E8TbgcYvITcp0Oi+7pGaZFJl/u+p2JWBhYVCG9DjTycQB3IDDX
 7dafM9iN6O62c+R/RbbZ2x0YgqmaqkPMDokiCQ9lYNq1doGoF3Z20U649TiMSjIQ/54+
 wxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c23+p0Wp3qkRJ+JZFgBrUFvUk0UkRN22ccsyr4/FQLU=;
 b=l2ZSzgKtT5QCV4XQIovZCjNWJxdr1D5GK11RwJq9RS0XNI8zCOGXQSss16JVzur2Vz
 xQ8wXhON8c09c7vr6TMfGWc48jPv03sWs5uK7VF53zkLw1f9V8iVABCRmYMmwguFp+kf
 9g2qGIlj4MVYeqSzGc81xCZ6WwzVTSZDCdVUFx57vOv+FV+xeh+o7wDa0YUEQ7Y2vRIA
 BCVE8l+2yErDfD+LIx/veDXv6SPmsvNflIZNxhEt/NKPFNQbeMnYjt3rpg0Zo+L5ELRS
 O/0LKBq9gSnC54dPcC40lDh1hOvzENTHowVa4mtNBvYYZp76jbh1C3qy/IKMRo92rnHz
 nhlQ==
X-Gm-Message-State: AOAM530Anak99epqdY09LCCQ5felxXuznvs7BKkPARSwllJo9EHKHLnN
 AavY7XBVCDWVGgHSlva86YiNfRbCQ7HjkL/QbKpvjQ==
X-Google-Smtp-Source: ABdhPJwBrJDaLv8f3BPBm+gPYcGNYfd/Y7WjnjdQsTZQB7JOBqStHS+B5p9tcVhwvnRLIIpN46C2YrxDSzUvXGcx01E=
X-Received: by 2002:a17:902:d4c1:b0:162:dd2:407 with SMTP id
 o1-20020a170902d4c100b001620dd20407mr48111678plg.15.1653998643477; Tue, 31
 May 2022 05:04:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220523204742.740932-1-richard.henderson@linaro.org>
 <20220523204742.740932-7-richard.henderson@linaro.org>
In-Reply-To: <20220523204742.740932-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 May 2022 13:03:52 +0100
Message-ID: <CAFEAcA9xAKTL5nwZ+mLMwbMeunfmvPtAia-PRbGAz96Q+w-aNA@mail.gmail.com>
Subject: Re: [PATCH 06/18] target/arm: Move arm_generate_debug_exceptions out
 of line
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, 23 May 2022 at 21:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Move arm_generate_debug_exceptions and its two subroutines,
> {aa32,aa64}_generate_debug_exceptions into debug_helper.c,
> and the one interface declaration to internals.h.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

