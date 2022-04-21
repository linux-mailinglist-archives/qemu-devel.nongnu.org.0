Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D28250A8C1
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 21:06:55 +0200 (CEST)
Received: from localhost ([::1]:41930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhc8k-0007U7-4j
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 15:06:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhbz8-0005wu-KC
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 14:56:58 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:38795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhbz6-0008To-34
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 14:56:57 -0400
Received: by mail-yb1-xb32.google.com with SMTP id v10so1598313ybe.5
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 11:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y+fFxWtGpfkIsF7CZJxQr/ve1yOSz0ZiKpJgvRDZj0g=;
 b=aFCVQ4J41/Jqew7rLhacgM8jRCEdy2erpFnc2se2Gpq2M+8j9HUgtbz8woWQwjvWdo
 dd/xSxPkkRVAe3OBkicf/96nB0JWk8YKWow7Q31vOAuoztjSVKgzxNqQ02tDiesfSCde
 1XINccCvjuEE85IhAcCmTlCa+JSs0uOBfYbz2cFy0YjxR8L/2cQbSFHCla7vfIiBnDkA
 ccnYt1iN3WSYqdUwkKvK3yiqjXfTZ0Z5v35PK9i9Ph4ZMivawRwzY58xC0mnGaD7WEZl
 cJvt6h4jqMrDm4HRzpZtczO0zOIRpZthGFmBap7HcdXJgfHSZnWy0Z5hqB8rewoiwS7J
 555w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y+fFxWtGpfkIsF7CZJxQr/ve1yOSz0ZiKpJgvRDZj0g=;
 b=KLlHIl6rYMeRV0UoajesipZBQuI3hX1O8vA+jJYmxTIIatZGFHT64SqTWc9sEZ2I0t
 dXHTTqbwAZn7Osx/kG44vXzJ/iYj16oSpfNf2sMflqDmQOafR/QpQqwaq9neHGUYkcKk
 Cnb371+rR6rXHWDr6MuK2Av+rMKT2xXw7ij8ne90hgzHCj8VVHaly/XoB8ZBytPNMK5q
 g6e6aC2AQkIoKQzc/rzJt6d9YHXp0k8CvMDBHAtM4bRCHbizBdo2PPwejJYDSZORQpCO
 m9PbJKGDetrY8B8NH3097krMD3mjb667SA8X54ta8gP10//xp5wAxWkl0y+EC33Z3DaB
 veHA==
X-Gm-Message-State: AOAM531dR7qWQrCutPnTLJgT2xbbdKfMtj+tXrPtH6UcqRDELDDXiUgg
 CfggjuI94tH3VqZoGYUzjRwEhqZsawUTjONr3BI43g==
X-Google-Smtp-Source: ABdhPJwNGI3+wflsY5rJ5CFa2Rk9Gwadn/jIWzWdO0FYyq0Wz5jCvb1EqUv/vYQLX0c1+quRA31BeRgb9U8ejJNZn9A=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr1143749ybq.67.1650567415016; Thu, 21 Apr
 2022 11:56:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-15-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 19:56:44 +0100
Message-ID: <CAFEAcA_ZeMGoEVyN+73aPUcOpakzvtoCqXz=yagtxBJQvU9pkw@mail.gmail.com>
Subject: Re: [PATCH v3 14/60] target/arm: Simplify GEN_SHIFT in translate.c
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
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

On Sun, 17 Apr 2022 at 18:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Instead of computing
>
>     tmp1 = shift & 0xff;
>     dest = (tmp1 > 0x1f ? 0 : value) << (tmp1 & 0x1f)
>
> use
>
>     tmpd = value << (shift & 0x1f);
>     dest = shift & 0xe ? 0 : tmpd;

Typo here: should be "0xe0".

Otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

