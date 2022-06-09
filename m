Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 123BD545319
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 19:37:49 +0200 (CEST)
Received: from localhost ([::1]:52424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzM6O-0005w7-1i
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 13:37:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzKbb-0000fE-7Y
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:01:56 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:43626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzKbZ-0007Tw-Rv
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:01:54 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-3137316bb69so51123247b3.10
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 09:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y1SOMzXjzlF03ypC1gMrLc3G+TfWo6oV7tkiIB3mnsM=;
 b=xaN/DgF5fj7XTv5MsxNpGFLJG99YxntZ5zp1Sqb9TA23g9ot5v74mq2z1i8g/U7lDf
 +usN4KnmhoQBrU5q8lb1X/JFb2OYB2hbjnexYTsX2RcQe6vbrTkf/sXy+b+LCiPIQVNV
 DOuKnB8WEJ+8y0qyUZPeALhHW/FOGbp5/VW4qn9fcjzhW8sr3KAac4/tyPuc1V7l/XkN
 oHL3QK9BrE2s33LhciTpi3uxHWLKSyu6LSQAdXFeOheQdBOBwtxkR+1ZW/9GT3PAOXuG
 bC7TKZNnUB0mcf9bmxf3yGajwoWXlqaHksdhjM4Z/wziApSIQJnFPpMu1Um8He0y6oy3
 MEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y1SOMzXjzlF03ypC1gMrLc3G+TfWo6oV7tkiIB3mnsM=;
 b=AtmAm9cdgIK+zdH8AUBHkizFH5Cv+06sfzkhud4N2ApTt9lLRG5IoDbyCZhP17DX/x
 /GTYXMRDI4XHsCMZOX2wXsiV9Fa7c8Q/Wg7y3Rbnxw+XD5kIk7hcW4BzQ/RXk3uQKPoK
 xpClN9i2iPdXMZCrMnWgGNruwCYXuU4NqFprH+53sG9bF0Mw8lrObzlk22LtWbEPj14v
 nE6cLzdwkF4otKYklk/zJWfWxvXq+keLIkO5Zgx7Nt/zBouX8WhXYVUlaRntOc9SB0lZ
 4VKfZ3L0SGHoFSjlK3U+5sJMVzRNQWudP7ci0PCcudbBuNxRPs4BvUcJHRtML5j1YrVU
 RPHg==
X-Gm-Message-State: AOAM532Vnm/2puQx1Ux9FSRLOCq2pFBh1KimmN1jjnhZTM5jKsyhiGB6
 z1OXqNL1VBFlAdpHWU5PuZP9tByZme5tbDoJBTiWffa6zfY=
X-Google-Smtp-Source: ABdhPJw4cHETPGvKDXri8K5KskCKlEYWgczzUgCDt9ReErtwVOGPWVVPuZs5/THW2S9Yg8Vpjvs2JoemGLB2Bm9rHBI=
X-Received: by 2002:a81:6904:0:b0:2fe:e670:318a with SMTP id
 e4-20020a816904000000b002fee670318amr42492112ywc.329.1654790512876; Thu, 09
 Jun 2022 09:01:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220607024734.541321-1-richard.henderson@linaro.org>
 <20220607024734.541321-11-richard.henderson@linaro.org>
In-Reply-To: <20220607024734.541321-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 17:01:42 +0100
Message-ID: <CAFEAcA9_kFpZZOYoN8jBKNaS5UpSVw=9jQgsELz5HWx4_5Ctyg@mail.gmail.com>
Subject: Re: [PATCH v2 10/25] target/arm: Rename helper_exception_with_syndrome
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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

On Tue, 7 Jun 2022 at 03:54, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Rename to helper_exception_with_syndrome_el, to emphasize
> that the target el is a parameter.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

