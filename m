Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A5D512F7F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 11:38:45 +0200 (CEST)
Received: from localhost ([::1]:53142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk0bk-0000Ec-3e
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 05:38:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0Zh-0007JP-Nx
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:36:37 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:43792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0Zg-0006WB-1t
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:36:37 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2ec42eae76bso46155767b3.10
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 02:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LEy1KS3T+65P49y83SSLj5HjpPbyHRIx2dV/hngyifs=;
 b=wHtbwfS/6GUlL0oD9uaKnBO1Du60fCcDuBqb9Im1/s2HagKnopCCbhYdQ+w3AH1pbz
 Yo5/E1Iu4vnehZZWA4jY9/Rna2RoSouni6eoNuNycYKb+XP4DLiDAYsdKOF07Ufr6kbu
 bJ7TkJ2p6Z4C/LBB6x6hnpu4E1/qOnG34+0ejic1OcXeBvqMtJHzjF1alse2pOBlu+DL
 b39KaeyDFXppnhdIBEr8PJyyLodl33W1mH0oojHi4OPN2jvXPClVKHdbNdbfoymxnqBB
 6QaZ39vkdF+6PDHHo3dAtbYkPKD9gggeS+G+F+sMbOKqOP/3NMOEDqYAGqLlBjmMLphO
 5mVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LEy1KS3T+65P49y83SSLj5HjpPbyHRIx2dV/hngyifs=;
 b=PMT1+zeqGwqWQ5cZtXXNFLx10Lm83WZZeJVidQs8cxMVl6/PqdWGjt73ZuVPJitaV0
 vP/jzY7LO1f4N+UD/at2s2+EltYFdPQFzRYwZqhFJz1ahC+gJittMOv0YpiOOEqjo74v
 o3RMSKME7CNXRCWzOuoTwurosyBt0TUu/xqjqA/HhAP7EBksyyrFAHE08IxSI7SItnWi
 cDdkEyXdFlxMui7yVa1xRMiwGfnf5BJIsc52+wLG+ftUSPQ2eNjVcovKA3MIwdwe3h5W
 9+4Hvsm6upcUn7LnKKlxXKZO8/gxWM7iiyweVz2ZFQDsFHEqKkaRIPr0Mf7wZ3AiaDl6
 TpHg==
X-Gm-Message-State: AOAM531zRVVTJUB/LNhnj1ONbFxS5wKK8+S2OxN3HZ4C8N2TQBKuKo/1
 ixWFvhswlHwMnkLLw+bhDFeS4tVTrS4pggjPSY228Q==
X-Google-Smtp-Source: ABdhPJzsLygowIGj1T3Ti7NGwkBhkpSdh04jWXAUG+HozeeaeY1VAT47dhT7GoIPTazR0jS7aVWifZKUaUE/3DOkgWs=
X-Received: by 2002:a81:13d6:0:b0:2ec:2b3f:28c6 with SMTP id
 205-20020a8113d6000000b002ec2b3f28c6mr31872687ywt.10.1651138590167; Thu, 28
 Apr 2022 02:36:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-2-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 10:36:18 +0100
Message-ID: <CAFEAcA-6SaBzELAQ6UePdBTdNH5C+1nuhRUu6QCQQs55Kt=OSg@mail.gmail.com>
Subject: Re: [PATCH 01/47] target/arm: Use tcg_constant in gen_probe_access
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Apr 2022 at 17:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

