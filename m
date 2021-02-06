Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAFC311E64
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 16:20:09 +0100 (CET)
Received: from localhost ([::1]:56670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8PNX-0001sb-Ls
	for lists+qemu-devel@lfdr.de; Sat, 06 Feb 2021 10:20:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l8PMQ-0001J6-Hj
 for qemu-devel@nongnu.org; Sat, 06 Feb 2021 10:18:58 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:36456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l8PMO-0007wD-BZ
 for qemu-devel@nongnu.org; Sat, 06 Feb 2021 10:18:58 -0500
Received: by mail-ej1-x62c.google.com with SMTP id lg21so17742034ejb.3
 for <qemu-devel@nongnu.org>; Sat, 06 Feb 2021 07:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4vJ1lQKX1v6SenhEmlnLttWdjwQawhaMDzpMNlaY7xU=;
 b=AFmAkW/x14HQWXxOAC+CNMGFvGYXymMkdzhRSpvKTCoLcWUNTAdq1SWPbPUCvaX4V8
 qXhEvHQc7lIyOCA2q0ykmdtIP/xURaep4WnCF/92QDn2y1gv5u7MwFEBI/FFf4H74VXc
 VkoqsQRL9YcQzM+izwg6mDoccRrWqCxBW7Tpg15kGbtKuyYbfO0qnxariyMSQYz97wmy
 lUTBTTUva5YmJ9W3gyGS/rr3IBVLTbGpv3HI2qSe/dnh4KXACRNHPRyhAalXe426QpcM
 eCMmkFSCifS0hlSk2bQmAroH6UBqt2I3LWCRcUZXbD6fB551rxpon4pOzCfJb69CVAo6
 kHpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4vJ1lQKX1v6SenhEmlnLttWdjwQawhaMDzpMNlaY7xU=;
 b=jhFt5DgFiW22H0pC7FrPAzCEUgvpTldXDSH0YlUWLepY49RnKpcXlm/0ja6rWP3i5/
 YWZwPFlHXvUHloInHYuk6i9mV16pnJkur9Ok2miQpQzcXtptiFUt04LVQMiys7t92MSu
 /yDweej5piTf/pCRlBLB+/crqfOyoK4DA49fYtACtn0FDUDVSIVMymBFDsKrm/bSf7TD
 tFP+AmzsrUP9Fz7+9qy6g9ScGUhR3+81HwrVNcKDCtINIW4yP5O+obgMf43n4WPRn8rj
 W6PE2WVgdl1zRy6xPPyAe06K9VtWoQ4VnaY+YeaoEcFi7EBtjw2kfCBqzXkTu9yDvQoK
 lBEw==
X-Gm-Message-State: AOAM533Vb11a6cdooWWBNf5YpK08vTiyMXINv87dxyqYJ8r7h+A/BKJC
 6fPlfVLKl5IcNH7gyioBqq2k/j4CM9fyLw37sbNj1A==
X-Google-Smtp-Source: ABdhPJxZWgKq/gMX+u6M8L2SG/TKuyzJANUn6uym5E413zs42+t58jrbFfC9uc+Sz1yfxdeyUcZ5qVVCSsyCTkaw03s=
X-Received: by 2002:a17:907:98c3:: with SMTP id
 kd3mr9348517ejc.482.1612624734138; 
 Sat, 06 Feb 2021 07:18:54 -0800 (PST)
MIME-Version: 1.0
References: <1612622294-37297-1-git-send-email-bmeng.cn@gmail.com>
 <1612622294-37297-2-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1612622294-37297-2-git-send-email-bmeng.cn@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 6 Feb 2021 15:18:42 +0000
Message-ID: <CAFEAcA8dAU+kT1WDFfdeCJsicpoFu6tZ-GTRcWuv+oVR-OL28w@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/ssi: xilinx_spips: Clean up coding convention
 issues
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 6 Feb 2021 at 14:38, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>
> There are some coding convention warnings in xilinx_spips.c,
> as reported by:
>
>   $ ./scripts/checkpatch.pl hw/ssi/xilinx_spips.c
>
> Let's clean them up.
>
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

