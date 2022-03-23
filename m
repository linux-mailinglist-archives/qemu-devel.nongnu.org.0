Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7334E584A
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 19:20:45 +0100 (CET)
Received: from localhost ([::1]:50036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX5bB-0005V9-2D
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 14:20:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nX5WP-0000hy-0n
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 14:15:56 -0400
Received: from [2607:f8b0:4864:20::1133] (port=38303
 helo=mail-yw1-x1133.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nX5WL-0000Db-WC
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 14:15:48 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2e592e700acso26995537b3.5
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 11:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sfEZUcS/C98xKrVfhmHvgZOLayihYr0E27aKEaFeNsg=;
 b=W8I0tiiE+WkttuKYh53KNcYX2/hAMtf/pYq+R6P8hbI8KRwsvnl5ozUQa65AZYlZqC
 8UjeQ6Afpxg3+FMax5++tTdvVr3Oh0Nk3WMKou9VKSGTE0CJCZY0zEjNgDGznS0ClX5U
 S5XUwgnU4+WzUoHeV1XFF6ISkhplgGpomtJwm0qk7ncyP3BVksBkvfVXd+zMIhXyyO+q
 DWHCSFl5GM4MUL2heh2CuBm1Q8zaspw2po6OkyRERN4zmNHtoXwPrzrdmNqenhnpxHnX
 lE33QCaZ451/G3YCERq8+zWzBlaNqh0Mn3yOoMiYSvzrpHLA2Kc9l+xoofLkW0O7pQkx
 xTxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sfEZUcS/C98xKrVfhmHvgZOLayihYr0E27aKEaFeNsg=;
 b=yZ/fM/DLH5pbv39SHhA/IQXafQHBauZpUPe0X1ERFwW5t1krdNVRggReIA7+ZAlkJ0
 Pv9J3TA0OEhbaLCm9Q22pP19rgyLgiKmbptou620b72EObWvDnTDLouP6sj1fTCOlMjQ
 MqVpDvzWFcaAM7/7TKmfhKL+L5Dx8LTujXisCN+8Sox3KGugbUhsQH5hokMRg2I4BeKG
 J3PsE4nqpWFvHBJJxGKsLtjnZ6BbJ2UExdzw2YpRJ7cuUPyCWb5N+SeHJ5mb8+QXwJ3e
 Pw0hfKrtXiB4gMhQH6B5qrMSN+H40LSLA89qXIYMtDBIPiGEfUwicqinXfZY4LkSy2at
 2h0A==
X-Gm-Message-State: AOAM533pCwlmE8X/9J6zx3uioZHJi5Elsn5yWxBLZhX2Bc326wtu5jAY
 aZluM6nkgBrCWfCMHJnwOhTZBZuP20MCDX4QFaxCDg==
X-Google-Smtp-Source: ABdhPJxKx4405NRNhGDEZ2/t8sOPbK4BsJF62pHIDh6cnS2ztCyUTxEqEKIreirtM6EqzdAuHSPGaP/x3NQWC0oS1hM=
X-Received: by 2002:a81:a4e:0:b0:2e5:9946:525a with SMTP id
 75-20020a810a4e000000b002e59946525amr1226782ywk.455.1648059344289; Wed, 23
 Mar 2022 11:15:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220323173543.146442-1-zongyuan.li@smartx.com>
 <20220323173543.146442-5-zongyuan.li@smartx.com>
In-Reply-To: <20220323173543.146442-5-zongyuan.li@smartx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 23 Mar 2022 18:15:31 +0000
Message-ID: <CAFEAcA-kwPQj8bzfuW8D3-Omd79bL8HD6NtsjsPUYCcjRdXhEQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] hw/intc/exynos4210_gic: replace 'qemu_split_irq'
 with 'TYPE_SPLIT_IRQ'
To: Zongyuan Li <zongyuan.li@smartx.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1133
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 "open list:Exynos" <qemu-arm@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 23 Mar 2022 at 17:36, Zongyuan Li <zongyuan.li@smartx.com> wrote:
>
> Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
> ---
>  hw/intc/exynos4210_gic.c | 25 ++++++++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
>

Same comments apply here as for patch 3 -- this is a device,
so it needs to handle the sub-devices differently from board code.

-- PMM

