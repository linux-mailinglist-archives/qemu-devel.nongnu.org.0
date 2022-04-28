Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D02C51324C
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 13:18:34 +0200 (CEST)
Received: from localhost ([::1]:50994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk2AL-0001ok-F9
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 07:18:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1Y3-0000JQ-Sr
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:39:00 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:41098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1Y2-0000R5-Cj
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:38:59 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2ebf4b91212so47954387b3.8
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 03:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NRmUS9u53VVCRYbR43HoamohchoUNA6GkLnBenJL1yo=;
 b=oKNO2K3kgDbYYjFwtZ9y5Ktmth/c5e/4az9e9QMpapgby0ZkzzAkJKvhIbF5H1n36m
 aLe4dd50FOeEXjkNYYRq/gS37Oo0OfqC4L2gREnnc0nSPBPtWK9ELxKspuPVSmv8OVxG
 8RmyLwuh3WE//EM1Xvd1FHm/w/FUrLc2Vg/E9U6iy/OjI94xaTbZLMWka9HbO/Xjqa3z
 0hr5p4dz5sWZnsbWXXprwI/i9HqMy3ls14j6sXAz2boI/3p1kK5k9arl+m98WzFGOna+
 KDaPFJY/Q+heAzlYZ5l8b32O/bOZ+X1yA1AQJ/amLYGHav6sLHqFQLhQnWaFfGyFjqIh
 uG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NRmUS9u53VVCRYbR43HoamohchoUNA6GkLnBenJL1yo=;
 b=FcE905p4klhFPb4s9n9rCxdxZVQujy0GXNeqGkjhd0JBEk8S7yVDonyFcxh06DVGw6
 l0RIlJ4q7FkoK2Hb8HGukvYIsYS1r1HfWo29O3fWQa8Y3xrWyc6EnuL2vFfS+J7QrEbv
 UUy3S+ATQcvBEU2J9peEVqxZ1OJAHL1jIt5wsSAQC2TVU1rdvjpeB8/7qOTGuXqaMzRF
 dibSuUoRht4wc0YXxaWHG1hcuQRvT48BN2o+KymTUqYELZCAJjzZaE1wvx+IGpkSTuSg
 vHOy1RHY3P9b1S3UjvLgkMp7fsgptdx2tydHxNujjcjj08EB5rGU9Lcf9PVjLsqgU1hw
 kivg==
X-Gm-Message-State: AOAM530hMZ6N+vOVYLh3QSblu2oPYIrlt4jCZfx0rlnXmRiH1JX3CS9p
 VJDdmQW8JHp8uRUWlwv7C+XDICuXfryPmTNRhUjH0A==
X-Google-Smtp-Source: ABdhPJxsA9MgqhyYmGzWTDKseh7jIZyVDItVkfPX8tn8PNhfFl5CW6GR37V+KXxlznhdLtwP1bjbRbcTJkVs+3eA/24=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr32211977ywf.347.1651142337330; Thu, 28
 Apr 2022 03:38:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-34-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-34-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:38:46 +0100
Message-ID: <CAFEAcA8209xKtN3Ls-jmNM8_oy1=4SAba4tNw5Fxk8N-TUbWKQ@mail.gmail.com>
Subject: Re: [PATCH 33/47] target/arm: Use tcg_constant in CLRM, DLS, WLS, LE
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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

On Tue, 26 Apr 2022 at 17:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

