Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E86532E73F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 12:33:12 +0100 (CET)
Received: from localhost ([::1]:42142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI8hi-0002bh-Ug
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 06:33:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lI8ga-00022s-KF
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 06:32:00 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:34370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lI8gU-0000TV-JC
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 06:31:57 -0500
Received: by mail-ej1-x62a.google.com with SMTP id hs11so2800599ejc.1
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 03:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zscAUD2YQ9DOiDqK6Dq23mxPUuuVEgeCyPegSqzHotY=;
 b=s0mFWMRa0k5JfPW/nU2PFF+DnpG/NSLKiPYabAznd+7N2EjAhJDl1MIJx+arYRqxtd
 74nPKNDQ7Vu8Nj37dXlzo+H5AyAz7OxVv+uq5RrwAOabFTUvHiV/EQzw31ngo6HHnrxb
 02L5SFPZNLrGQuqv2s3oOSdmkm2zqeeYBwNfsslTIpq2vWIhV+aXma868Vy6OIBkQwbn
 KI5JE2JwCC6mY4l66kT4B7CwJoFDw/MZL2wDk4PPOpzK1fZoXlhgkP+Dlk/haxtMSV6V
 IRzLeccwuyIm5ryEOoDZ+/IOgb+Hw7N4iVg6tQnXyDZSH1wNxIcJgEeAN/6t80XTCjqF
 oalA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zscAUD2YQ9DOiDqK6Dq23mxPUuuVEgeCyPegSqzHotY=;
 b=hPWE9jNKUVp6aONhZdGnO5/cx0QWzjXs9TdmDOywjZFq1dmlwYAJRw9cuq6vYT1n7h
 9z7+po5g92DFXShOp/dYg50uO28QakFDQAFtGfQdvCtjkxSQKUc5/cnrn894guSjLGLW
 SCukMcE8x4lhCOGyNs3AeABEQFqyr297EGEfx1R7DDPqClE8wKGoKfw215qlCkWy9btg
 tToAAxyo2oCpv4NuavsBMV4AHBTNK/87TBpwXD+GfQzchcJCj0JQSPnN+/aoNdHrpF0U
 CYu+QmlBixtEpqvCzRsdri127ExulXNBpHLyoZWCwD6+0n6VQqCRKJwJVp/j0mYccPRW
 qDpg==
X-Gm-Message-State: AOAM530uZ0+u9YzgZMtvrSPCLgX72Ks67QPocWwDEKZA3daTkBu5IeUw
 6gxwOAkkRhH4PlRrTkWuSW+OwwBdcz5NWnl39++xAg==
X-Google-Smtp-Source: ABdhPJwFm66C1Eg1YYXPNkZTYFKEXxjwSf66f8bmBvBW8/ysI/SslXmdhYMk5wG1anVhbCZqtUVnp8hlSdLhTKLrpow=
X-Received: by 2002:a17:906:8a65:: with SMTP id
 hy5mr1902808ejc.250.1614943912493; 
 Fri, 05 Mar 2021 03:31:52 -0800 (PST)
MIME-Version: 1.0
References: <20210216224543.16142-1-rebecca@nuviainc.com>
 <20210216224543.16142-4-rebecca@nuviainc.com>
In-Reply-To: <20210216224543.16142-4-rebecca@nuviainc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Mar 2021 11:31:36 +0000
Message-ID: <CAFEAcA8LYf5V=3SEKBzfaGnzSL4K58SQXBqsdMizpE45vTD9VA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] target/arm: Set ID_PFR2.SSBS to 1 for "max" 32-bit
 CPU
To: Rebecca Cran <rebecca@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Feb 2021 at 22:45, Rebecca Cran <rebecca@nuviainc.com> wrote:
>
> Enable FEAT_SSBS for the "max" 32-bit CPU.
>
> Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 5cf6c056c50f..88a6b183d325 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2206,6 +2206,10 @@ static void arm_max_initfn(Object *obj)
>          t = cpu->isar.id_pfr0;
>          t = FIELD_DP32(t, ID_PFR0, DIT, 1);
>          cpu->isar.id_pfr0 = t;
> +
> +        t = cpu->isar.id_pfr2;
> +        t = FIELD_DP32(t, ID_PFR2, SSBS, 1);
> +        cpu->isar.id_mfr2 = t;

Er, this doesn't compile:

../../target/arm/cpu.c:2223:19: error: no member named 'id_mfr2' in
'struct ARMISARegisters'
        cpu->isar.id_mfr2 = t;
        ~~~~~~~~~ ^

The typo is obvious, so I'm just going to fix it up in the
target-arm queue, but this does suggest that your testing process
before sending out patches could be improved ;-)

thanks
-- PMM

