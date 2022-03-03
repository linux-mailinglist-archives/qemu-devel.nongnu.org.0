Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F1B4CC6B6
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 21:01:37 +0100 (CET)
Received: from localhost ([::1]:54852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPrdo-0001AX-Os
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 15:01:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPrZ6-0003LD-7j
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 14:56:44 -0500
Received: from [2607:f8b0:4864:20::b32] (port=35664
 helo=mail-yb1-xb32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPrZ4-0007a2-MU
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 14:56:43 -0500
Received: by mail-yb1-xb32.google.com with SMTP id bt13so12531892ybb.2
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 11:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YkAGkwI85iVvnK92KBR8zKqZuLt1TaIuQwv2qpXsyeI=;
 b=qhr93XJdck/slsRMGQ0bED1OSr8i3FVhrQyoZzjmWXt7F5OJmgrlDC7Bmr3+bHFSGA
 DQ+dHq8e32i8FuYQPLII7F56Q2p49aSisgtqamFdGPm5WYGgnc72sDgT/UHQTsT9pkn7
 Fa4iWRr6ll+cOgi61xWEbPry/2ONAox51lfmf+xVItW1ZYFSxhZA0mf8iB2umXfYuQAe
 mv7wP0ihkZWEQ8GnC7egWoZGK+SbGnYUVcWXPj9xbe8m3lpQ/zDFn4qQxed2JG8NGjHP
 I+CGxzr9nIygwAuynVktQPuCTqH4O3uM5EyDzoKTNiq83eeR9LnoORkP44qtBgDzIHmm
 ExCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YkAGkwI85iVvnK92KBR8zKqZuLt1TaIuQwv2qpXsyeI=;
 b=Ii+LsVwlLS45902/86PViqRgut6xG6npi3UaHnjJi/HrRW+yaqaj2vEjX0gwV4t0Xd
 xSubb+2JhYEneuami+OADVL/IiNzKYtA4lHRPXDC39gJBVX2BCqQ6itwMaIFaziOvYVK
 435Jz+gau3cnO3u3q/fHZE+Su+mSNjqU2ow5e92woGOvdmQK6/GhjA/BS5dSXY/D6DxP
 WsjV/iz2v/HMDeD6XnuuaS/cFil4j022hAne6MEAZBjlv/thLDYU1pvNzcP9trWLbXpz
 1rsxYwFGLHNqtzZOkVViVd8HiQD3F8+A35HVdtxt4l+mAFDy3XeJM6TEKUdBWTETgJfA
 PL3A==
X-Gm-Message-State: AOAM531f3o6Aia5dMnuZUuxAnh4JtQWR5oChvIXmnlhNUvAiiP2VrYik
 yjThGPh8zdaM2xs6kA377GUKsZ/AKMiiLKnsYPa6AXektD5LKw==
X-Google-Smtp-Source: ABdhPJzkY5rHJQbJLMUldpu9Tj76QMVrIcTHB4HhAFIrDDBgMCCyj4c5z4g8g1ABBAVRhPPAk9NfeSCjNpvfHkdqP4Y=
X-Received: by 2002:a5b:350:0:b0:628:86b8:6e09 with SMTP id
 q16-20020a5b0350000000b0062886b86e09mr12482466ybp.39.1646337401672; Thu, 03
 Mar 2022 11:56:41 -0800 (PST)
MIME-Version: 1.0
References: <20220303191551.466631-1-richard.henderson@linaro.org>
 <20220303191551.466631-7-richard.henderson@linaro.org>
In-Reply-To: <20220303191551.466631-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Mar 2022 19:56:30 +0000
Message-ID: <CAFEAcA8a8pSoeczEgK-9vrKwi+ZTFMYdcbNS8uhyNsjG9_1NDA@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] tcg/aarch64: Support TCG_TARGET_SIGNED_ADDR32
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Mar 2022 at 19:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> AArch64 has both sign and zero-extending addressing modes, which
> means that either treatment of guest addresses is equally efficient.
> Enabling this for AArch64 gives us testing of the feature in CI.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

