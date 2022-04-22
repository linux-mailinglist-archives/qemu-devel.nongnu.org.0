Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A29950B7EC
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 15:09:11 +0200 (CEST)
Received: from localhost ([::1]:50490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nht26-0002mj-4A
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 09:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhstr-0003c5-Sl
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 09:00:39 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:33792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhstp-0002zQ-QO
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 09:00:39 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2f18982c255so84455067b3.1
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 06:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2MBoNFvDSFCz0OPUlLAfVWFdWzIplmkpD+ro6nn2vwI=;
 b=q4BpADRNTTQwpuq5uobx4a8mga5BMlcZIcNdPBD5qCdsK2FQhNXGCNdcbDoi8a397g
 Rcq4+7LvZIzrWA3UAqLtGLLjkaxUfFCJcMDeuqOvIhysFxNa+T/jkUo91rpycbq37Go/
 tXasdMjrTwNMTzk5WJ8pa05FSxziELK56C1bx6oM6XV2Tpy+abtarxVDSPatZBuQZHa5
 3xiyjiF02WuEfTGiG6X0Z6VuEfTKMxQXUrBH2VHV+4WvxsTyUCdqQgRj2cNelQNAddO5
 jHKnn6FbCJuri2DOUkql+xfVhP3A7+koaf17/iacegO6HBG01Tgxakg1htH33MTgY2HB
 bXdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2MBoNFvDSFCz0OPUlLAfVWFdWzIplmkpD+ro6nn2vwI=;
 b=GSWP1eW3ojIQChOvoCQw1XAWSyjsGDRQwXu0zWXSK3hClaV7G1bMIUXoYJFLsC98Cy
 vyalb5W6s60HcLzoDg2CuaWp10V1Rxi8jG/RyeOtLkQ+IunIJJ78xyCQ3bim+scDIZGi
 i0NKkmHty9lQLoLOy608m5KgMKNY0S39osTiDDoyBRL4vBqYSgOlJ7jeWWApzvhnulfo
 CDCEX1/aHsAqfHG/GaneqJE2VIu/+caWGkJPx+csBCec+Gqy9I6TsQlEjD0KINsSkx+q
 kHD8SVJnwfW1bhC0WJdSbAGxWOvb2iq/lG+IiFOyFM94MFuoYzfWACpqDiyVruQwJttj
 hj0w==
X-Gm-Message-State: AOAM5323DzvgG5vZUyx3uZzWR5V8nNRKUKil1kK9wbE9pHZE9PJAdYOW
 gHEAdif5h8UEM3Gy0zkZE5sp/7VHb8WMo5CNSVMd5XED04I=
X-Google-Smtp-Source: ABdhPJzvvRtFRv9kp1lhVkyGK91Yn/AL+gulMoMF7LI0qoYdMA+fV7HLm9G5/0XlfEYYFG9yom0l63ZdmAk72onTQo8=
X-Received: by 2002:a81:4e11:0:b0:2f1:47a0:5972 with SMTP id
 c17-20020a814e11000000b002f147a05972mr4799042ywb.469.1650632433542; Fri, 22
 Apr 2022 06:00:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220421151735.31996-1-richard.henderson@linaro.org>
 <20220421151735.31996-58-richard.henderson@linaro.org>
In-Reply-To: <20220421151735.31996-58-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 14:00:22 +0100
Message-ID: <CAFEAcA_uNvsTNSRFH8-Z7PGQXCv0+kGsFhZNA8jmt=29S=yA1g@mail.gmail.com>
Subject: Re: [PATCH v7 57/64] target/nios2: Advance pc when raising exceptions
To: Richard Henderson <richard.henderson@linaro.org>
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 21 Apr 2022 at 17:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The exception return address for nios2 is the instruction
> after the one that was executing at the time of the exception.
>
> We have so far implemented this by advancing the pc during the
> process of raising the exception.  It is perhaps a little less
> confusing to do this advance in the translator (and helpers)
> when raising the exception in the first place, so that we may
> more closely match kernel sources.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

