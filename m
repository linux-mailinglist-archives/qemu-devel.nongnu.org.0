Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A8651323A
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 13:16:03 +0200 (CEST)
Received: from localhost ([::1]:45014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk27v-00063r-0g
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 07:16:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1Qe-0001jq-RE
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:31:20 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:36315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1Qc-0007t6-Ch
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:31:20 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2f7b815ac06so47842457b3.3
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 03:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z28B/ZbtHn9lbF3PNtgsh8HQuBmB196xDMmlikFgFtk=;
 b=tQp+b7RnnMK+Rwa9umtdu2NWYl+3dy/UVLRulr7g5ivINHTEHPPwYtpfWE+tLvO0Nz
 lOGH2ke23uMYrZcVhTHx9Q0dNVAIhFzh8p8G3/UK4qxIjC+a0zoufbBIkX65o3/xtuv4
 zDgRzwCMpWZtjrey+2fWoXDXIoFj6wjyNyw79jepTQBhLT82rzGZP/tzFlebSPzscA7I
 yu5NmBYqH56TeI28/pQfWBe/0xSNVRLnNgviFEuGGWyhzsr/4fYFQRzF23ucd7GE75pE
 JLNQ0kVkkLyQPTI65OR3iKQ/NLtvDKFpCNJxrGgbhGNOdM1dEqazelEStKXmbFNX1fI8
 CUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z28B/ZbtHn9lbF3PNtgsh8HQuBmB196xDMmlikFgFtk=;
 b=6KVR32kvYj0L9rcOn2SsYxtQZCkli5kbM9OJ1O6QyQ763D0JscE6bh6ShsXc00f+ZD
 yfeemXivLk1tekKCAz38x8f5wMQ4sDR/x2D/jQkmqYtyZukS7xg4UJ2NVfh93fNBAst0
 Gf9O5H7co+6cm8O3GOoRFrKLfGZZ3iyq5Jf8mUKV94vArUyGKHrYALFwQsBo5rIF+7NH
 64fS3M4LsH4rK+xxFVOVNqVxbOvBrCPB6xEN3nAd/KlUZqtnoe5srDRToaPEDQRha078
 yUIpBSJiYxVv/Tph4hC+yAFTfT0wswN7vgGKKJP9+o9UI3H86VcVz5Wx8bNGyZfQ+xqH
 +fCw==
X-Gm-Message-State: AOAM533UJ9G5lXZcC1R6b3EUJgqI4RkTT2+MUB1OspwbxbpoGeAcbuKV
 Tr3NSEBmdUIo+p4Ll5RT5zEI9h883LBO4M3Bi2hwdQ==
X-Google-Smtp-Source: ABdhPJxGJfr5Ny8dGpz0iWt+u6sgevNPx0UppIc0nq1m81kPSCQStwqHvgtm53Ogb/tkmV2Y+dEn35QerHK0sFe1LoI=
X-Received: by 2002:a81:ac57:0:b0:2f1:99ec:91a2 with SMTP id
 z23-20020a81ac57000000b002f199ec91a2mr31792776ywj.329.1651141877218; Thu, 28
 Apr 2022 03:31:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-31-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-31-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:31:06 +0100
Message-ID: <CAFEAcA-7UKer0HccJcJtCbp5+bHLeDNHbFwL6S2mgTZ9Nkeg0A@mail.gmail.com>
Subject: Re: [PATCH 30/47] target/arm: Use tcg_constant for v7m MRS, MSR
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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

On Tue, 26 Apr 2022 at 18:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

