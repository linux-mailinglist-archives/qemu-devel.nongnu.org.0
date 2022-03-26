Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D16A4E80F1
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 13:56:01 +0100 (CET)
Received: from localhost ([::1]:44374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY5xY-0000rS-CS
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 08:56:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nY5tN-0007kD-Dl
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 08:51:42 -0400
Received: from [2607:f8b0:4864:20::b2e] (port=45599
 helo=mail-yb1-xb2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nY5tK-0007gQ-AA
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 08:51:40 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id e203so9602134ybc.12
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 05:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Aa8lph9Ec/8CdCXsT+Ypi+Lcycvx5qmjjBc7J7FRNRo=;
 b=L6vO02Jq0A97GNnBcvX1TXEFXJiHx5RTru5zr1D592WiEvhNi+SQfMHRC+AJUiSCgL
 R6ah/aOIGqo5BkL2StkZBapsVsozpCc9PkHqFXE0HxYEMFbi/M5GGzIKff1lLwls6BTS
 EbUVLJ46z7p6Pg7U2ygHN8FCJg80QPiHuGn9UwUjiybj5FjHFmRhfwMwbmaaYjhnPA0Y
 fb21a6xyeb5cgXUXKIjKfqW0OkGsvEzTvdjWysZDUOf7Rk8a9Dq3VdoUNclzTPjM/XMb
 dN/ZZ+Qc+zT+AEcRsAL7zE0Uj+F0Cn2a9jU9oYIqZZsCcF9RLznKmbWFzWwvU58jiaLw
 RTLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Aa8lph9Ec/8CdCXsT+Ypi+Lcycvx5qmjjBc7J7FRNRo=;
 b=uftaVY/o4ol1PZc9Eq76vd8jvaYAqpIRMthm+xcciBELmgjH32TZpf5IGGKzazglkE
 x1AZnYZASjQhRY66NE/xim8qGtp2xirINjLOt0ezyphtaOL2+LOtAqiSmJunIbOhyC7X
 g8TNdRkIueu2cIBryRIWzcjrK3k+DNEtslxHnChoaFs56HI13enJoRUDB5Yp42flAMVv
 ed4tbaxfucYkmsS1dDcRMwy8/WS/xBW3W8zH1FLLC10hvqrabzUyZ2ZUcVIGVzLDfTjk
 hqfPSX0bXcMn8oyiZeJ/rzt8CvWN5gFeNwyLiALKquzvezL4WcOL7qWGiFSIw8n5Kysp
 1xxQ==
X-Gm-Message-State: AOAM5323FneYMDvHfzQslFLPUSdbe50eCxRJE9lcecpF0tHkJizOEnl/
 DnM0EqkFwVPTVOFLQyVnSVDbG9yd0+DHX6KYo8MlLA==
X-Google-Smtp-Source: ABdhPJxqUIczm7Vt7v6mIY7oI8PjNkJlN+qraOj9LlSthNLoaCNtSqXrltwEGCD8EumAqhmlUIHD7yUQL6F9boyH46c=
X-Received: by 2002:a25:d8c3:0:b0:633:c81f:737d with SMTP id
 p186-20020a25d8c3000000b00633c81f737dmr14127175ybg.193.1648299097316; Sat, 26
 Mar 2022 05:51:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220325195250.386071-1-richard.henderson@linaro.org>
 <20220325195250.386071-5-richard.henderson@linaro.org>
In-Reply-To: <20220325195250.386071-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 26 Mar 2022 12:51:24 +0000
Message-ID: <CAFEAcA8A7THKZhkxNVtYkQJW=EPn0=Y4b-78XOiuN1xtu+0mTA@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] linux-user/nios2: Adjust error return
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Mar 2022 at 19:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Follow the kernel assembly, which considers all negative
> return values to be errors.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/nios2/cpu_loop.c | 9 +++++++--

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

