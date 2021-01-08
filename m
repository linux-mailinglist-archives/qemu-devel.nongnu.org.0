Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 246482EFB33
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 23:24:54 +0100 (CET)
Received: from localhost ([::1]:33084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky0Bh-0004HV-7t
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 17:24:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ky0Ak-0003ZS-T9
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 17:23:54 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:38830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ky0Aj-0007hk-CD
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 17:23:54 -0500
Received: by mail-ej1-x631.google.com with SMTP id 6so16550012ejz.5
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 14:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PUACya1+mr6lDJEzp34n+cqKd+i5i4bGv6RnwO9FLmA=;
 b=MnlmcPjtZOJF6DtlZhRfh777lXoQmpIYUVs60jc29bDImxkIyNit66nxhDWZ727mXg
 yfmztI0HTFstgmLaVcR+jMDkVJIM42GbWl2mVsbNs4KlEZINr3zHoHjpvYwl+oqp9YPj
 PjDemPbh90jAEzK8wGo8ZFyqMlUGTsSePD2St1gxFM9py+o0tIQCrZDQnJhao5hMjWpy
 tmREJm1Xe84fiVAg/VqXZjvlegDpWy9bX0YDavFQlhvjiywX5dWuuvXgxHrKnzWKq05L
 6a/c2paAeuP3nmmCjHphK9/Qh2MfMdA1tWQeNK88NaSA+mua5Nu3q7iDYWj0mh2dZct6
 ANaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PUACya1+mr6lDJEzp34n+cqKd+i5i4bGv6RnwO9FLmA=;
 b=Vv4WqE5oWcaUsI6WiUPF0l7pjdMvmvlh8p+f722OZucXZyfiMomO3PTsFKYepk4796
 JmHo0CWF41bAhtCjeJsA9baPzrNKQgYySSSdvoC04w0pruCjH4FgJVm10ondBinPVpQU
 AQaWpcigYJyanZ+l21kbXRTw+YYULcQzQUyXeF8xJgDOKU+JHlOWClMHx01OGH5BnX+5
 iiPqWT2LRho8jnHKph5BRzUsAbMj5DdDL3suq0/k6gCRvXRJERaer7t33QXJDEXo5oVY
 FMYphl+cKOjG6BuBmkgvGhzL60I94emQpWlE06F6ofLfUMZ/WQ5Mk9WXWaNuHDrJPo1B
 CWNQ==
X-Gm-Message-State: AOAM531CL9DSLRqoqYbfO13sUvQbqSKdQK59B8cqx0CckETJCeZusSfF
 5gnFN2PicEmDGRazLdr0Pg7MRWQN36NS7Ibjul5cy4+KSf4=
X-Google-Smtp-Source: ABdhPJxJh/WtJuF1Ullg4JJPKQCr7oO7ICF73LEtKMZ06NoSDBy6YZz+r6fnOUTkN2YHGHIlleJBLFiYGdaOE+y6TIg=
X-Received: by 2002:a17:906:1151:: with SMTP id
 i17mr4139676eja.250.1610144631802; 
 Fri, 08 Jan 2021 14:23:51 -0800 (PST)
MIME-Version: 1.0
References: <cover.1610143658.git.balaton@eik.bme.hu>
 <15a9fa72eed4f02bdbeaef206803d5e22260e2de.1610143658.git.balaton@eik.bme.hu>
In-Reply-To: <15a9fa72eed4f02bdbeaef206803d5e22260e2de.1610143658.git.balaton@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Jan 2021 22:23:40 +0000
Message-ID: <CAFEAcA9wbJzwy-jpMavq2Vg0tzrO_ZXzOaHLB042HHoq=1o3mw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] Revert "sam460ex: Remove FDT_PPC dependency from
 KConfig"
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 8 Jan 2021 at 22:17, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
> This reverts commit 038da2adf that was mistakenly added, this
> dependency is still needed to get libfdt dependencies even if fdt.o is
> not needed by sam460ex.
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/ppc/Kconfig | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

