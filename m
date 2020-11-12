Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A120D2B0878
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 16:35:00 +0100 (CET)
Received: from localhost ([::1]:46978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdEcl-0000If-O3
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 10:34:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdEbb-0008CN-6W
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 10:33:47 -0500
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:34875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdEbZ-0006gu-Gs
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 10:33:46 -0500
Received: by mail-ed1-x544.google.com with SMTP id ay21so6759446edb.2
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 07:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h0ymbKeRT8Ee6GVhrUOeThm8iBCVfLsglS2lGAY9kwA=;
 b=yXSBYa42mK42igUr1AxNldE2+dRL/Cb1wi3SzJFoqs3D2khAeGLIpX4JG0S3lniSlp
 zFyH41GzvEx51Gvo3V4xENQ+sC4WrAeDpNDd8ascbKvoJuBL+dgiO09p/cLxhCGJsz3e
 6ZBeE3qEfouMLXq0dSdahlxXx+XXEVnEBrWfA8FwijK8XjvQOpww4WGeGonyu0KgCD1K
 gyfBaXvUBRJI+5GHFjG79qoXnwSg7b8wRzAtiBbmlWOio8YARq1GyVTtT48z+G7CVACD
 a6lhrPLTrZ8qCsJgvw7vTJJgrmTo3XERMmw5VtlWts0sXl2KiswmGQr0gSH6hHSyIACd
 JmkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h0ymbKeRT8Ee6GVhrUOeThm8iBCVfLsglS2lGAY9kwA=;
 b=fZOdGuAVPsHvyzvOVvvAhykx6WVmbU+2E9/h5btjzzPKPC9N1x1+JZjZBwwuToG6sM
 f2wN4FvW2fm/YGRbCe7V5YpCCQmfEgjSsJNM8CtGhF8uRopyRV/Zk8RBxAspBSkg0vHV
 Rl98fsjNrDbxZLs8gWig6nAJaAw+txrB4QgRXasdAoUxNhz5q+ZkHwhnxpCpBKgXTRwv
 JiVMef2nGqeFj0+BA+zMGWwPmbqpucHJLL6/+ngCX4OR4H19905LhuSso8M4W3DZa7DM
 K9DsiWpvl6SQxCqCQkhKCpjDFpxYp12uwqfPRaSB37WPumGqqhtWurnWMFdOKYkPaN7j
 vsug==
X-Gm-Message-State: AOAM530hLYkKVjinCVnLJ0J9j3L3uuryVmijf7A61K5QUscZeHmAYRwr
 Xw/nwmbPD/wX5FNj77NZ8FjhI7+kWpU+neRmIbfnYw==
X-Google-Smtp-Source: ABdhPJzWSY18+K39vIp+FdB8XLlCXDQ2QP3AF/x5iNcygRDWH+eRjBGVaOXjUGou/Zh75BQwP2bGbLIomlLG7FZMW2k=
X-Received: by 2002:a05:6402:b35:: with SMTP id
 bo21mr363962edb.52.1605195223065; 
 Thu, 12 Nov 2020 07:33:43 -0800 (PST)
MIME-Version: 1.0
References: <20201111143440.112763-1-drjones@redhat.com>
In-Reply-To: <20201111143440.112763-1-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Nov 2020 15:33:31 +0000
Message-ID: <CAFEAcA_Rh-OAcrttL9czzaGA2CThtjX7BQyeBJgMnj2XaHqusw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: ARM_VIRT must select ARM_GIC
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Miroslav Rezanina <mrezanin@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 11 Nov 2020 at 14:34, Andrew Jones <drjones@redhat.com> wrote:
>
> The removal of the selection of A15MPCORE from ARM_VIRT also
> removed what A15MPCORE selects, ARM_GIC. We still need ARM_GIC.
>
> Fixes: bec3c97e0cf9 ("hw/arm/virt: Remove dependency on Cortex-A15 MPCore peripherals")
> Reported-by: Miroslav Rezanina <mrezanin@redhat.com>
> Signed-off-by: Andrew Jones <drjones@redhat.com>



Applied to target-arm.next, thanks.

-- PMM

