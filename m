Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C25A392ACE
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 11:31:18 +0200 (CEST)
Received: from localhost ([::1]:43462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmCMH-0005MX-JX
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 05:31:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lmCKy-00047J-OK
 for qemu-devel@nongnu.org; Thu, 27 May 2021 05:29:56 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:40781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lmCKx-00047H-5l
 for qemu-devel@nongnu.org; Thu, 27 May 2021 05:29:56 -0400
Received: by mail-ed1-x52e.google.com with SMTP id t3so56420edc.7
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 02:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nWmN5w38Znlhy7io4NXD5y3o7ggw3kzEE+t4RwhMjA8=;
 b=xWo72MhW5FU402/i3e5AeOe+3Oee+IvuLjgs+uUNbrLrh6PgEyN5D5MJfjKwLeiGva
 WZqOZt5V92dhLqXuXDsedYd+ERkxOatBW/biyF3M1xoPA+fHmeA88J9h5DReHKQKbSta
 QRPmmgq9Cd4YHWJ8uDIvw0tswOsQm+BXZreqFuPDrz55k+TsLFx4f5HtX6v3XIxMwyNz
 AJp4QdDk5C1yT8+9TKUfR9jUTXIJ40ZDvKkHcFZi0bX7byVCLzbFDpeGHARvVpJ5K/ub
 tsODmegqNOrU8BDeD9nUVwv6tsWldfmFER9c7i62nr18EiYSWO6XAQVfZU4yvTmT6vVl
 9TzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nWmN5w38Znlhy7io4NXD5y3o7ggw3kzEE+t4RwhMjA8=;
 b=jEyP2HujHkN0DmslIKzgsPH/1nHhUh/2hxeXs+0uLHfluyG0ijwZmq7L43a0WR9nGi
 kPIR4QWq17hytSiK1APzhSrXk6QiKPwT/FSSQ7Q2XI6Y+ze/LRGZSmGk5Qb53OrPqnaq
 xnPkHI3VYV0Q+LLrQ5t9mHKttZoh/nkg/4FQngVnhzO+q+cgDrgcDy1mQgIJE4G0N7d9
 5gl4vmN5VynuWM3uUUxY6JtflvoX8Q36MVgeQ/2C92gc3odQVw/M6cb8KZM9b4NtKUAm
 ndMfynuvBkRWyrEuKxn1NYYx4azz6SdfkOTG80V5UxQxzSO3VzjksR0jKWAlQZEwu40Z
 3DIw==
X-Gm-Message-State: AOAM532lObnsdptgkSTHh/LdBJkQA+dtO5yTHHx99I537axKEB59izLo
 U+aJHR7TJl1ee+WOE3Kj00zJDocsdeBaz8mk4suo+Q==
X-Google-Smtp-Source: ABdhPJydXpoYY2bI2Ueh7+Ypkv1j5iTBLphquKWXBrHeKe3xDz5QcjfMotJZZSnVd/QZ5uYxcOqRVL3NYgrGBhe0h9A=
X-Received: by 2002:a05:6402:203c:: with SMTP id
 ay28mr3100734edb.100.1622107793913; 
 Thu, 27 May 2021 02:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210519200942.2223292-1-f4bug@amsat.org>
 <20210519200942.2223292-4-f4bug@amsat.org>
In-Reply-To: <20210519200942.2223292-4-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 May 2021 10:29:28 +0100
Message-ID: <CAFEAcA8A6p57mmgCjMw+tDUuXYrxm8c1nyd-y4fuccSjmcdfdA@mail.gmail.com>
Subject: Re: [PATCH 3/3] hw/arm/Kconfig: Add missing dependency IMX_USBPHY ->
 FSL_IMX6UL
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 19 May 2021 at 21:10, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> We added IMX_USBPHY in commit 0701a5efa01 ("hw/usb: Add basic i.MX
> USB Phy support") and had the FSL_IMX6 machine select it, however
> this machine did not use the IMX_USBPHY until commit 49cd55789bb
> ("hw/arm/fsl-imx6: Wire up USB controllers"). Commit 17372bd812d
> ("hw/arm/fsl-imx6ul: Wire up USB controllers") added the similar
> dependency but forgot to select the Kconfig symbol. Do it now to
> solve when building using --without-default-devices:
>
>   $ qemu-system-arm -M mcimx6ul-evk
>   qemu-system-arm: missing object type 'imx.usbphy'
>   Aborted (core dumped)
>
> Fixes: 17372bd812d ("hw/arm/fsl-imx6ul: Wire up USB controllers")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/Kconfig | 1 +

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

