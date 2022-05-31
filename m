Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F66B53905F
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 14:12:02 +0200 (CEST)
Received: from localhost ([::1]:52120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw0jB-0007D0-AO
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 08:12:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0cb-0004JQ-H5
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:05:14 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:39463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0ca-0001sx-1g
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:05:13 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2f83983782fso136728947b3.6
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 05:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0Cj9EWwrPDX8iADDfXa2oAbn0w+auohUB82Pt7zdoyc=;
 b=tTMWZ9l2l8H4VpHBSmxja7akVEj/Ux0+lwHHy9MJgg3aXRYon4NqorZDxYcYfBmMjS
 8mlxMddnXHkxop0AzOqWR0sqYL0kVZ2zCtJQgvTUvIM/Ei6qfUC7Fs4clCR+mAZY2f6e
 zTLzu2uqQds9zHm2tsm9Q328JKIjtIRHnDbUhO7BaTza3PQ5cYuI0pRnj04TlaQFXZtE
 4jXTxT+ertEKFy/iV0V3OyeQmzlGYR83j4TXjwdBI9Y2YkZ2T0EGZnY0JQpO3hr1p8bE
 graRWxNNK+YYl2wLCjXXfuO9sc2bDTgK+v/Sn7qje9mEBxbEanv9Qe8uiPbrT4x9mlIS
 gKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0Cj9EWwrPDX8iADDfXa2oAbn0w+auohUB82Pt7zdoyc=;
 b=3RcCCrrNHC6CThr/aZsRgO+mvvVQCvPt6aY6Ga4oYuxz2MbFAu245EVHX8E3cQOgCV
 2syNajndh6lYCIAiFPFVz7c1AKzxuXLrDMsABZjIA6l9uDiVvxjSCDwBiC3dEYUhZPDX
 uo8R98wSNyX6vMQtYeHYazMz+em81jsAICwVEp8m/YSQRn+oBMF6htmtSBeSOwjSb514
 h3p7WFBvzXjxDREhtoKuBruFaF064XIGq1SR3ql+cnltF8LRyrEd9iiNGKmKzynySc6O
 cN01viY+eM99rJVBCcpCqxNFSvWHndxt90XxdQNvxSpUbbS6Lnn6Ve0iA+CHa7O+5t2/
 puXA==
X-Gm-Message-State: AOAM531GV/n37lvrNW0UueXEHf+oHUO+Wa5iHo1hHA4osnXipIlLT286
 Ik3sg2Lpz85IhMuA26/MMK0ZeBq1vBQ0r7+t2J4FyA==
X-Google-Smtp-Source: ABdhPJxrCBo0P6S/CIQnWxGzJOb/4p6B8aP8lyovd7MqpSrtY4jd6Nvp74bRpfLTqxUdDSkSJ1iRe8MloP3Q10yR3pk=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr66044299ywb.257.1653998711081; Tue, 31
 May 2022 05:05:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220523204742.740932-1-richard.henderson@linaro.org>
 <20220523204742.740932-8-richard.henderson@linaro.org>
In-Reply-To: <20220523204742.740932-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 May 2022 13:04:59 +0100
Message-ID: <CAFEAcA9Z9cc_K+JC9z2K5qKJ=zOUcGJSwznsaX=7t+5edjNMiA@mail.gmail.com>
Subject: Re: [PATCH 07/18] target/arm: Hoist arm_current_el in
 arm_generate_debug_exceptions
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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

On Mon, 23 May 2022 at 21:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Read this value once in the main function, and pass it
> around between the subroutines.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

What's the benefit from doing this ?

thanks
-- PMM

