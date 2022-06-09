Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CBC545402
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 20:20:43 +0200 (CEST)
Received: from localhost ([::1]:58192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzMlt-0001EX-Ux
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 14:20:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzLAs-0002Zt-BO
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:38:23 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:37972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzLAq-0004l5-R9
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:38:22 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-313a8a8b95aso13166537b3.5
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 09:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4v8m5cv4Wjo+9wHRx2A7i6m8UK4l2Y40Ei1ZfKXWtJY=;
 b=YInXD3gY25tScYe1J/wUgm9VVTV1n/HxEbm1HCUfdENwNz0wKpX5TocJflvLTIa+Mi
 cnGwNwOZqyZd1zEOJvB9tSSHoDWjR96aSUucC5W11dDCKNVMOZMeta45eeLypKlm38jT
 LqIP7HV7p8UedfjdPVQ3h0fSL0z797GX8oXZFApR1pSQKheuWvO604UDlzae9cs1Eydi
 Rb+thXXueNe321vQiIfqciFDctV98RoNV1+AsgZUN9tq5TdJmK9l8vodpLt73yOmztqv
 Z2MkwSO9/CqjWN9AUh2zErp819gwroOPlUrTmIIi3CUELoNQWYYjlzjefspu6Fc2YcM9
 aLnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4v8m5cv4Wjo+9wHRx2A7i6m8UK4l2Y40Ei1ZfKXWtJY=;
 b=VW65yOL31OJ9k2S3XCQcoX1L8KzUpUVFuSl4gIqEiklZGIFZ4MQDWPiXzaJTbJXBK5
 4KFj15v8aJxGaAOiNTDqmn7tjtIL+gmmpXsoEm9aKJpwZLava/TS80Mz1SW6nx4c4Kiu
 h5KG4F3+iM/XCph2+51TR4S//DABLA+WGqcllWHHJpnoEYeTcdvAfOxZXQdET2oywwrf
 ga+iMk99+cTwfhGJuMkGdnyFKMhavm3FIwvWvBQ/oHXRq3xxY/3tGE5SLg6v5HDCXGAp
 teDjx/UIPcU7/fbiqeadIUXOcRqzWQpBmrTt+cLmK839PUI0jFguGUQTlJthKHp2MdUg
 pGoQ==
X-Gm-Message-State: AOAM531dnIXwA+hFxl35/WUxJMYHW2RiIZOcbzcwyPbBs8/DJNr5V0ho
 QiTIqPef4MHyuX3vgwi3vzzC1AurQmU1HTT3Hcf5jyB3n4Y=
X-Google-Smtp-Source: ABdhPJz6CQCkw7q6FFiOg5NbXJI9BIvbC0LMR+p8wdTv8F70DZstWGHtUEvSpQ6pHN6ZkyH96bLrmCCEosTdRPgspRY=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr44110144ywb.257.1654792698939; Thu, 09
 Jun 2022 09:38:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220607024734.541321-1-richard.henderson@linaro.org>
 <20220607024734.541321-19-richard.henderson@linaro.org>
In-Reply-To: <20220607024734.541321-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 17:38:08 +0100
Message-ID: <CAFEAcA81et10c1wLVcVY3o5iURq8k7KdSjWVaAk=Fmu5W5Lduw@mail.gmail.com>
Subject: Re: [PATCH v2 18/25] target/arm: Introduce gen_exception
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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

On Tue, 7 Jun 2022 at 04:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Create a new wrapper function that passes the default
> exception target to gen_exception_el.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

