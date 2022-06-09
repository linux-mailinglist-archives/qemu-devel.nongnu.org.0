Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 373785452BB
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 19:13:56 +0200 (CEST)
Received: from localhost ([::1]:38978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzLjG-0000M8-Kh
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 13:13:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzKAS-0008IB-4c
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:33:52 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:37771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzKAQ-0002De-Lp
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:33:51 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-31332df12a6so97062937b3.4
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 08:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QiTjh8ykw/Aql0jlrN2Hl1GRDdYGpja0v1d7hfn7pTI=;
 b=vF881CRMzMIWpZPtPSm0e/M1gDBhOonEO9VkHha7u4wJRVDCVDCN2DrMnmEN09qKeR
 x2m/Q6QZgEqxFYDxrzYWaK9VMQaUIToZ/Xn40ANUENhUZPolhEvrdD6S020u9iGt1Jdy
 jZeiA3Z36lJyQ0jn2FFXNYDwaccv6qdPgo+WSygNhIJ9jyZWZ37kkfgWcE/dkutBLsDu
 lqdxCz5lisq7xd4Zh7coWLEMyCH4YFkglK91dhwgC0Qvahx75/5I7fhT21a87WzudViu
 MPWW9wapaOxR/Wjhg7nvz4DlcLmaHLZmuLDzsHtC/+6ozCjqkkkK/Z6zSzG5CxZf82NF
 mnug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QiTjh8ykw/Aql0jlrN2Hl1GRDdYGpja0v1d7hfn7pTI=;
 b=F+nHO/yNXx8iLyf8ZUMwW/KFhOUSlnFDtK6EbkH6vUdZIOtcFz/09Qw0GypbZcSsvr
 itG8yM5y4MuRYiHTQGPvKtAYFWDjLJ0VM1s00gL60vxa1P7HdQ48IFEBSAM5S2R4Ym66
 pW+BgC8YI573vdbd33n4TSSSA4/0ZHHH9Zqlb3Rlhdua5keA/XAoOfq1MjLDwm9GhYvZ
 BXBbfXnM27eaoin6YMOIE9/mdzwrRT2nAX2+m9tb3plPxv2ySk51CxaVFxKaTbnJHgqB
 5yQc1JEyfK8OTJ5aP9ZinwuImaB/CWRS205h3uoLlS5M5Uih44L7kayQrkpzBUn4SwrK
 tF5w==
X-Gm-Message-State: AOAM532qw+SugUa3rQOXbjgpQQeW5f6Ncb60OGqbsTRZuDnWgiUBKyY5
 4aYXLG/p72z7xujrVTWOo6TRIbQ/k2U/ESVswL7WmR+eLzY=
X-Google-Smtp-Source: ABdhPJx6an1JSyEUuoy9x1ABEaIWE4ZJRwOlJFsycXbUT5Hds40i6DH481Xw0FQp65ZjNXW9RP8EB82xL9HF7sVLjNA=
X-Received: by 2002:a81:1a4c:0:b0:30c:8363:e170 with SMTP id
 a73-20020a811a4c000000b0030c8363e170mr42201609ywa.455.1654788829891; Thu, 09
 Jun 2022 08:33:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220607203306.657998-1-richard.henderson@linaro.org>
 <20220607203306.657998-40-richard.henderson@linaro.org>
In-Reply-To: <20220607203306.657998-40-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 16:33:39 +0100
Message-ID: <CAFEAcA-OfWLaucq48MCFXJ_8Km9HNU95Bp5TmxOCNFH5fR62bQ@mail.gmail.com>
Subject: Re: [PATCH v2 39/71] target/arm: Add SVL to TB flags
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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

On Tue, 7 Jun 2022 at 21:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We need SVL separate from VL for RDSVL at al, as well as
> ZA storage loads and stores, which do not require PSTATE.SM.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

