Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE326DD67F
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 11:21:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmABN-0002T9-EE; Tue, 11 Apr 2023 05:20:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmABL-0002Sm-VV
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 05:20:56 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmABK-0000Xg-8k
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 05:20:55 -0400
Received: by mail-ej1-x62a.google.com with SMTP id dm2so18725800ejc.8
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 02:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681204851; x=1683796851;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0+/oOJmLuSXH7uq6xEHGpuIWkTRoZSb14J2bC3K+4oE=;
 b=zGkNWbGM2kQtss6/AhctX65OtrKMi6oD9c5P66tLlzTeq3vIs65ZOEBX33AIRiCxBj
 KdKbslYgGGq1PexhIKE60gNGKRGDz12+ZRm4qAn+sFYWpDUxwTDYxypsCb2LQZcfdgYL
 ra2YJFAoCza34ef6ePTUq1c0cM6dMGYctayz74B10FPyb4ItSh76dB9jjho3nz1BInYK
 +IeiT3KB8/bQXmdx1wQY42NeK6lTtoV6ultyzAHUZaRBizw52ejf7wMem4f2eSbd0AAa
 vA/oh0YQymrLGnQ4OCTDIGCcPJZg84f9dyyE3LUp5uj36oegl0JUYLhTsdWKTBONIK7i
 n78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681204851; x=1683796851;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0+/oOJmLuSXH7uq6xEHGpuIWkTRoZSb14J2bC3K+4oE=;
 b=R6lj0zHu/iZ0AURD/IFw4ycTyUZfCzxpS5XMTMsZ+SflwlwGNx+QtI0/wAtOUxbaqM
 cvxsG77/Dv8x+JwIEx5JI71HiTAXbaH71fBCCbWTjMmHchZZBl4uyyOwwgD3nNGyYZ8A
 wjMQXGtdxipYBkW1T3jH7txnN5w7v+s7c5AvoLS40bQZXPAC6MWfhUrT7+yxEisLi38t
 xMWkk+/SC/zinjUnVf6Ewv1qAn9xvHsEWXjrNbvqH/O42OP0SdU640rYjPJAsl0JRxE5
 Gd7mrb2fPP4gUUOsY3UNWUmBVOBvDIX3/GXq3ye7iNtgL84PS4tWqtUOfGSN6WIrc5jP
 ROgw==
X-Gm-Message-State: AAQBX9dBcBthTnBbO9Ba0o0TK+GPGPWlkJIS4rjJatvLGc8Lc2QT0TcY
 3HTg+JmKPaMxw1sAIKkuh/7PhUNcM3mPpkr+m/ws9g==
X-Google-Smtp-Source: AKy350a6QKWMox4QYouV7+wUuhSfJ2SZFNc1pGpdjRlkGs8mBHmupeZmXR3nRuydZ6TZXRMnGs58YPtF1I2RWkx3fHo=
X-Received: by 2002:a17:907:72d4:b0:94e:3ba:1649 with SMTP id
 du20-20020a17090772d400b0094e03ba1649mr1310536ejc.6.1681204850835; Tue, 11
 Apr 2023 02:20:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230410153448.787498-1-richard.henderson@linaro.org>
In-Reply-To: <20230410153448.787498-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Apr 2023 10:20:40 +0100
Message-ID: <CAFEAcA_JXhi_GHknXws0Ak9t__zyvqE47yN=QrJS_7H8wE4y_A@mail.gmail.com>
Subject: Re: [PULL 0/3] tcg patch queue for 8.0
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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

On Mon, 10 Apr 2023 at 16:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 08dede07030973c1053868bc64de7e10bfa02ad6:
>
>   Merge tag 'pull-ppc-20230409' of https://github.com/legoater/qemu into staging (2023-04-10 11:47:52 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20230410
>
> for you to fetch changes up to 20861f34e0808bd06a0b7d74f8bd29c29e516ca5:
>
>   tcg/ppc: Fix TCG_TARGET_CALL_{ARG,RET}_I128 for ppc32 (2023-04-10 08:29:24 -0700)
>
> ----------------------------------------------------------------
> Fix Int128 function call abi for ppc32, mips o32, and _WIN64
>
> ----------------------------------------------------------------
> Richard Henderson (3):
>       tcg/i386: Adjust assert in tcg_out_addi_ptr
>       tcg/mips: Fix TCG_TARGET_CALL_RET_I128 for o32 abi
>       tcg/ppc: Fix TCG_TARGET_CALL_{ARG,RET}_I128 for ppc32


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

