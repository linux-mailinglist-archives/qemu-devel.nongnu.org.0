Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 288124D15C3
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 12:09:50 +0100 (CET)
Received: from localhost ([::1]:59852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRXiu-0005UC-UT
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 06:09:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRXha-0004FX-Jt
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:08:26 -0500
Received: from [2607:f8b0:4864:20::b29] (port=37721
 helo=mail-yb1-xb29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRXhZ-0001Bk-20
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:08:26 -0500
Received: by mail-yb1-xb29.google.com with SMTP id g1so37006972ybe.4
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 03:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2zHi8AS/hcmT3j5e/DBtm7yNLfx98BJXhCGrig33HyU=;
 b=WruHcyWRNbzmaJCZeiuMVlX6Yxom2OYDbz8QSZcKhv5w59biogv20OPFVk58iaLa8J
 AMiAt0HfLvm52FfXkXETfzGGsfQFE7CeisMYcFowAuA/deXyVrCiY8wGgeSqWZIN+a/T
 c2+BfJx4RQUTYNd4hO8i3rL+f/SSFlVsM/Rvr0dP1E9PAMHsfnfRxWvNJMKO4EDSHJON
 Lom2AVMXQxQ7h+TOQ3hcRRFVa9Hj+l2OoDCgtI9YuX39V+8SQ/zXF7tC4omZ5UYR5d8C
 xHbWTBUUiRGCz8GSUW2EGs/1wBAjgTUkFKZqQrgdoW+akDNflSmytxf+WBcCabM2FL8x
 eRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2zHi8AS/hcmT3j5e/DBtm7yNLfx98BJXhCGrig33HyU=;
 b=2LF7BCIrEv30EyRzG2BsM4uDYwxHvytzcKin9VI2JOwJqR3guOSJNI9Z0Aj7tMFmKy
 oK8vbyKkybmnPfdCeTTUAb0kx4CKyu+bdnfH7DrEXUyN3twc0j14mD1Ha7haDSmNaMo9
 dsGZXsgoJ65M2syFa19pzf2nM4AlmwHXAf0t14DPeFMyaRtPLb/94sYrCE6+Byz9dPWB
 6lHgAWiRgCP1I71272QkzF9ZZJuhjGvgT5YBk0AmcBV5QFCLkQcCTxYIQmru2JRwfShj
 NnWpGRMxQCHk/tAvvG6/m6yDOkWk9cDMtFNq6idMV00UYgePtOm6Ip2P+vs6FwYZbXEc
 Nx/Q==
X-Gm-Message-State: AOAM533bTi6joUJ+4pBlGdqjVG0IiZYc9vBxWjar1vsTOtYUK6PG/gUd
 JYGUV3gAY3IA83TsmRo5N4gxZlCSwygq2glzE5yktw==
X-Google-Smtp-Source: ABdhPJwJ6SQ1p4Jlu51aVqgjt2ykcigxLbjWJpea/GhldvfT5xM7kXLPI+2ew+Cj71Br83LO+5Wbsp5cBL2+O2MEUfw=
X-Received: by 2002:a25:6e84:0:b0:628:97de:9430 with SMTP id
 j126-20020a256e84000000b0062897de9430mr11930359ybc.288.1646737703974; Tue, 08
 Mar 2022 03:08:23 -0800 (PST)
MIME-Version: 1.0
References: <20220308072005.307955-1-richard.henderson@linaro.org>
 <20220308072005.307955-24-richard.henderson@linaro.org>
In-Reply-To: <20220308072005.307955-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2022 11:08:13 +0000
Message-ID: <CAFEAcA_xt5kkh_FEUGHa3mPKjudqtyFgCDMT4U8HODKX6jrgrA@mail.gmail.com>
Subject: Re: [PATCH v4 23/33] target/nios2: Drop CR_STATUS_EH from tb->flags
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Mar 2022 at 07:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> There's nothing about EH that affects translation,
> so there's no need to include it in tb->flags.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/cpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

