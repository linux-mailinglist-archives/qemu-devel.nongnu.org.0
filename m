Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BDE5EA87C
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 16:34:21 +0200 (CEST)
Received: from localhost ([::1]:46034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocpBb-0007eG-VI
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 10:34:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ocosk-0001QJ-6d
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 10:14:50 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:34615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ocosg-0002cD-V6
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 10:14:49 -0400
Received: by mail-ed1-x530.google.com with SMTP id z2so9243854edi.1
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 07:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=ubW4YXp9SL4/T57xOh2xJKBkgv3jkO1ZKYvp+tRSgQ4=;
 b=BXjtWXRerqhAc4MTZNE39VddzMyW5HFBaWj90x23ErogeD4CjnQPxdj1lLgUco4I3I
 +M/WmUBDDEVmiMlS52QkRCMyS589hyR2luJVNptE0ZJ7H1s60ZUSxNV1gy0vCEgwIA0Z
 PTrbyHXFOwzfRvIrJtS87QoZKvYLnqe2aLVpynN6nlWbVeS8pSNW2mPV7fCf72nX9U/T
 telSszVnognB+WyCUykI4dfnjJt5DAZ2VBdeMa5yKipU3CIemfuZOXwkIeLaiq1/J9py
 0X2g+iU2+JJX7oOg23YaxWVFAxDwii6CQpIDeqVK+rTqTD2ahaNZ6PQ0l7vu2I4AzDXj
 N/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ubW4YXp9SL4/T57xOh2xJKBkgv3jkO1ZKYvp+tRSgQ4=;
 b=0K618xC1z8x8aDaS7IxB3RbPewhi+8mQuSSpF6AGmJAe0cIncmMDRkulS1LOBIt1GB
 ECBs2gDhdldMOt8icAT/h2Pj10wHG21Nw4Yh7XfbVoLGqQcGXwzPBXL1llK9p0+vZwfj
 V5Mo79x96gLo8mNobRxUd7C1AYZvCRKrvOuNUiB0nLFPNN1KL1RxL7YApA1gpmFH0RXt
 4u2xxiRZuh0ghpVRWY0GIBwOEnKUzH3+kUNnsuyW/tG98U178WAzry7uf/ahYhWUm514
 LBx+fAZDAQYXw1Ku9T2z+2ueS/GyJExfxjt3iijPEvvgxf5iwNaIILHa4Osv+Zp8KUdT
 tXPw==
X-Gm-Message-State: ACrzQf3MT/nfoGi6y0rOBTftiFXv2Z09MFc26KO4cgM2iPuEE0GCGR3H
 M25FUa6a5TQXSLsaCOKoEEmsA+VUkfnUrMoFMqZaxg==
X-Google-Smtp-Source: AMsMyM6u1yQ8WNcU6NYv5kqiUuAZd22EpRqpBF2eh33fjdj5ajRAcXm+Q+xiLki8WjmP/yxFMpZ0Msu1VEhsP3uQ4RE=
X-Received: by 2002:a05:6402:35c5:b0:450:4b7d:9c49 with SMTP id
 z5-20020a05640235c500b004504b7d9c49mr22741440edc.149.1664201685305; Mon, 26
 Sep 2022 07:14:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220926133904.3297263-1-alex.bennee@linaro.org>
 <20220926133904.3297263-6-alex.bennee@linaro.org>
In-Reply-To: <20220926133904.3297263-6-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Sep 2022 15:14:34 +0100
Message-ID: <CAFEAcA_u8TQW5EoX5bBZGKhhaS6PYaYZGyqMrhB1Tsa6eTXCyQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] hw/intc/gic: use MxTxAttrs to divine accessing
 CPU
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, mads@ynddal.dk, 
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 26 Sept 2022 at 14:39, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
> Now that MxTxAttrs encodes a CPU we should use that to figure it out.
> This solves edge cases like accessing via gdbstub or qtest.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/124
>
> ---
> v2
>   - update for new field
>   - bool asserts
> ---
>  hw/intc/arm_gic.c | 39 ++++++++++++++++++++++-----------------
>  1 file changed, 22 insertions(+), 17 deletions(-)
>
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index 492b2421ab..d907df3884 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -56,17 +56,22 @@ static const uint8_t gic_id_gicv2[] =3D {
>      0x04, 0x00, 0x00, 0x00, 0x90, 0xb4, 0x2b, 0x00, 0x0d, 0xf0, 0x05, 0x=
b1
>  };
>
> -static inline int gic_get_current_cpu(GICState *s)
> +static inline int gic_get_current_cpu(GICState *s, MemTxAttrs attrs)
>  {
> -    if (!qtest_enabled() && s->num_cpu > 1) {
> -        return current_cpu->cpu_index;
> -    }
> -    return 0;
> +    /*
> +     * Something other than a CPU accessing the GIC would be a bug as
> +     * would a CPU index higher than the GICState expects to be
> +     * handling
> +     */
> +    g_assert(attrs.requester_type =3D=3D MEMTXATTRS_CPU);
> +    g_assert(attrs.requester_id < s->num_cpu);

Would it be a QEMU bug, or a guest code bug ? If it's possible
for the guest to mis-program a DMA controller to do a read that
goes through this function, we shouldn't assert. (Whether that
can happen will depend on how the board/SoC code puts together
the MemoryRegion hierarchy, I think.)

thanks
-- PMM

