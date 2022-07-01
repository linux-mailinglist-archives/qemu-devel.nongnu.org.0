Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEDE563380
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 14:31:26 +0200 (CEST)
Received: from localhost ([::1]:35254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7Fnr-0000Fp-45
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 08:31:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7FjB-0004rX-EC
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 08:26:29 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:45711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7Fj8-0004iU-Ul
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 08:26:28 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-31bf3656517so21658807b3.12
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 05:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V6Aq7vkZup3TLghKXZmH6o+sQDcuPS2VK/HU0c9D96M=;
 b=EbLsKfASIE+Uqpx4B3exUtlxPTOWyFd0PR+Pzhr87D5jQRQP6uUYqFw8aGq454m1WN
 EtCfu4KMr41XXPPFCoq23GeR57XsA084hvlLwm41KDeWdIvjciZFBN1rFXs7kxIUiDe+
 fbzhAqwpWJvWlfwZcSOiRW7IpcdLlpy6rpo1qfPO6Hj0aGxES36Mt9IXWiH8j4LS5jwO
 QTViZdP/5w0Sqezl1sKSmAqgwXE7TvPbzdxI3hnSOqouyCjizQ6VBqhfx4x/uo3FE7ZC
 doORwpd+OZcz3o75yHtK5WQIEDJR1pY2GSLPKldXfu2rUBTHoY3xK/dkzdiWEidrRRRR
 ZSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V6Aq7vkZup3TLghKXZmH6o+sQDcuPS2VK/HU0c9D96M=;
 b=0+xyokY1AXLdx/Y9WkeeRVrqkD8M+OAW6jHlG/4IZMbaS7HFCqBnPbX363TznDYHuD
 Y2GEIpiMsa/4ake2nuYcDGPvYZmJvOpr97nRiydp268/4Iz07fNmZm2YvCfgBynbhmNd
 CIlZ9AgXr2w7R3DOpOMavyH2kL1+gAIkwNYB0FYA190hnP+OkeUqNbUktyFvJ9oz+Hgp
 w5/HpoTkLRvLWLEJ3PYOtKWmFeoUs99lJ0HY/Y2gV5+Lwr7sTHXuxYTld7tixttg+NfI
 ixNVF438IHcMR0/Q5ZeauH2XsPQeIBiijUh/5dqohXogq5t7JgQs2j0s4vp56+wKzXjd
 NY1g==
X-Gm-Message-State: AJIora/EVAW2qZ0/NdDymVEIWzvUO6vwMflVMGqIIHDXQ3erNLwTO9ag
 htJXX0OG1zZ/ZCzQIAXu/4Xxyrh5s61HGHzN89t/dNpizEM=
X-Google-Smtp-Source: AGRyM1vZUYU7t5lcZ3WG6zRlNCaPzMrI2lZtb70/SBuvUHvY6l3wLMaDtQMSuZxlMx1WHesf2mAtcL/JNMUiAxDlh+E=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr16657804ywb.257.1656678385863; Fri, 01
 Jul 2022 05:26:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-11-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2022 13:25:48 +0100
Message-ID: <CAFEAcA_gqDJ7awdLwbb-a5Rw+8FfU060NdLShrXg5FVs7W=SOg@mail.gmail.com>
Subject: Re: [PATCH v4 10/45] target/arm: Mark string/histo/crypto as
 non-streaming
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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

On Tue, 28 Jun 2022 at 05:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Mark these as a non-streaming instructions, which should trap

stray "a".

> if full a64 support is not enabled in streaming mode.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

