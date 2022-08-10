Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F86758F0D0
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 18:55:38 +0200 (CEST)
Received: from localhost ([::1]:55134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLozZ-0002kM-0K
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 12:55:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oLosr-0007Dz-SH
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 12:48:41 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:39865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oLosq-00067f-3X
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 12:48:41 -0400
Received: by mail-yb1-xb33.google.com with SMTP id k12so24213749ybk.6
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 09:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=tNqpNUl55dURjmOoDIIeRz/Oe+X/6cGqsZptlEpA/Tc=;
 b=xCvnu+6v0rd7a9YmUbz4ldOZDtZgYfDlb1W5JwwXYJKjjPGyXTJoXkDD8dlZMRDuS1
 WZ12Kt/ee4Iy8dmj8aRYtbMyRHlklo7S7nHKdTduuB5ebhVVMQ375KwaroasivElg6zI
 qu3x+BXM1kffq1280pooOWJIeCjjZgTy4vgMqqVYZLrg2TOMUk9OdZvZSXlFBMhTvAzS
 0+RGC+fEppuSJaosfoKbpZhnxS3v2QWYR1YFmWtVq3tk4pur5/Ll5Lfk8JolXHBglzWB
 aUr+M6w4idy45kuS9vVJR7Kf2f4UV1f20mNfIStpcJ/6CNeJ+KGd6h8TavV4cMdQSJyH
 YUVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=tNqpNUl55dURjmOoDIIeRz/Oe+X/6cGqsZptlEpA/Tc=;
 b=ZKWfqxiVSNWGmfdW5m/oTeebes53HAtlMozGa6ls1ioSz7Iik3Gtw4iw6DZMPwm7WB
 TrVSohw0KZA2AlrUlPztcv1uNr1xf4opPSP/a4Koo/+1tDwrEQsGj3eWtjPWLUud0Bht
 uMQ2Hk8RMwA2wHW06ZgjOb0Nfmta6scsxBjCeh03AihTifzaN1w28ZwK6OR2kmQnpgAl
 /X0knYqtwKLp4Hj3R5ZES0eo8Q6GnUI+H2KD3kbXmrme3OoPAxVDRD1/tK7tecINQTm1
 18L1KHP0LaJ/OrVxLlA/Fms41QXK7mFr2zj3TVaCQJJSDbPBWlk8X78db2gZqrtu4ktm
 ba+A==
X-Gm-Message-State: ACgBeo0Bqy+LvaazqyB1M4OiRTi8+oqKn4JLdwRQtwusYg+QuPoNtOEZ
 VrJcEXo7D6889I+eNasYiBj2QHu68hIGSTf3IEW6LQ==
X-Google-Smtp-Source: AA6agR7bXt2vK9GoSvzHfP8C8gI7yPcWea2sgvQ1DcM5FkNZZhagE2XjTRZFZTfrUkSJ/wWhKhX3U42XgARKFOKw3eI=
X-Received: by 2002:a5b:7c6:0:b0:670:6ba6:d046 with SMTP id
 t6-20020a5b07c6000000b006706ba6d046mr25359730ybq.140.1660150118827; Wed, 10
 Aug 2022 09:48:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220506180242.216785-1-richard.henderson@linaro.org>
 <20220506180242.216785-25-richard.henderson@linaro.org>
 <1d915529-cd32-82b3-42ad-4d202d3590d8@huawei.com>
In-Reply-To: <1d915529-cd32-82b3-42ad-4d202d3590d8@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 10 Aug 2022 17:47:58 +0100
Message-ID: <CAFEAcA-FQ3W78c=kwzZZ=wCuCbPWO=9vxG7ge4wnEZR6qBGHVA@mail.gmail.com>
Subject: Re: [PATCH v6 24/24] target/arm: Define neoverse-n1
To: Zenghui Yu <yuzenghui@huawei.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
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

On Wed, 10 Aug 2022 at 14:14, Zenghui Yu <yuzenghui@huawei.com> wrote:
> The r4p1 TRM says that the Neoverse N1 core supports SPE (the value
> of ID_AA64DFR0.PMSVer is 0b0001) but do we really support SPE
> emulation in QEMU?
>
> The guest immediately received an unexpected exception (with EC==0,
> at EFI stage) when I tried to boot it using something like:
>
> /path/to/qemu-system-aarch64 \
> -M virt,gic-version=3,virtualization=on \
> -cpu neoverse-n1 -accel tcg \
> -bios QEMU_EFI.fd [...]
>
> and QEMU shouted that "read access to unsupported AArch64 system
> register op0:3 op1:0 crn:9 crm:10 op2:7", which told us that the
> guest attempted to read the PMBIDR_EL1 register.

No, we don't emulate SPE. We should probably not advertise it
(we might do a no-op implementation eventually).

What guest is this ?

thanks
-- PMM

