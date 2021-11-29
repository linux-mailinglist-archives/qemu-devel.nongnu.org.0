Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FE6461682
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 14:33:42 +0100 (CET)
Received: from localhost ([::1]:37196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrgmr-0008IS-J5
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 08:33:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrgdI-0006GQ-16
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:23:49 -0500
Received: from [2a00:1450:4864:20::336] (port=40585
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrgdF-0006Y1-Jo
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:23:47 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 j140-20020a1c2392000000b003399ae48f58so16802280wmj.5
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 05:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1Bkxxa/NonxkKC9sGxKxeuVuP9IpRYiGzwsRbwSljUo=;
 b=iC+PiRISMsaoCrZ6wlgWvWIlda56aLc8emqeT7vZUMTZH8/hViyHseadKeiEDVAHJP
 zybvAXNCyRwDpuTLcj6WVSqYMYNXaQ49sfFtNY5eEHWi+w1l4vETaKOrZrmYQL3xrNVz
 2aTyN9y7yr9mLlzKIGneyQLsmviZGNpc7LJLTGuYTLhaoSpjGfgqvLWkcTTfwPXk3Bzv
 Hsx5szmUVsy3flsRdtcjpAVpN7Wtn/bOlfjLuys1VkzYw3paKNVGG7byreQZQjn9I+nR
 Bz1ou/0DsXftKhKhdDuOxatfElCO9gmnqgdiab3lQnAEQ1Ig3PPapibwGrvdbKsR5umi
 rZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1Bkxxa/NonxkKC9sGxKxeuVuP9IpRYiGzwsRbwSljUo=;
 b=CJNpDVJRHHNTZ74+87rAPWjgSQkJ5A6HRxhg2IqgRg0tu4JyiBKigX/QfDWrqPaxdw
 6LbiIVGIctw0RbcEqT11mACOZLbTrDL5RkZ9j4U3fmMAhWgVVv7n/TtjQLd6ZBzob3Gv
 bZBJJtobmofh1N1LUPb1MoUOVujB+Nt3ypxHwut4YsVTIELyzf4JpNeXe6Ncx68gpMks
 h4RTVddqbcYnSmPJH4MhqtKJf/oAGJfseSD3s0HbO+MVu62RSKpfHHC9i4jdhf7q3Ho3
 F9CfsE+eqZWlLw13sNJl8HBwTuhAFQgZN8lo4qc1RN2URBZ8rYd48yFnorQybnUmUB3x
 zX8Q==
X-Gm-Message-State: AOAM531k+OcbLjSu2Md8cPx+FJFbUuuQ66Kg2PphlaPGc1KN0p6vmrUp
 e3SudTiKK/K7AT+kNVg4FR8gL4dcjriXgxQbwwgBSw==
X-Google-Smtp-Source: ABdhPJwYt/5MHxW4PXlG72SLnV1nA24qDu9Yux9GUa93xvyDvuS2WiIZ4t1pNqHAc02FzYTroF4VTxzK6VfkBEIAsOk=
X-Received: by 2002:a1c:7f43:: with SMTP id a64mr36637866wmd.133.1638192223535; 
 Mon, 29 Nov 2021 05:23:43 -0800 (PST)
MIME-Version: 1.0
References: <20211117163409.3587705-1-armbru@redhat.com>
 <20211117163409.3587705-8-armbru@redhat.com>
In-Reply-To: <20211117163409.3587705-8-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Nov 2021 13:23:32 +0000
Message-ID: <CAFEAcA-5S7+S9qG3sMEgRc-5UiZqiOg4GDnkYRU9Y5zYN4QuXw@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] hw/arm/mcimx7d-sabre: Replace drive_get_next()
 by drive_get()
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 17 Nov 2021 at 16:34, Markus Armbruster <armbru@redhat.com> wrote:
>
> drive_get_next() is basically a bad idea.  It returns the "next" block
> backend of a certain interface type.  "Next" means bus=0,unit=N, where
> subsequent calls count N up from zero, per interface type.
>
> This lets you define unit numbers implicitly by execution order.  If the
> order changes, or new calls appear "in the middle", unit numbers change.
> ABI break.  Hard to spot in review.
>
> Machine "mcimx7d-sabre" connects backends with drive_get_next() in a
> counting loop.  Change it to use drive_get() directly.  This makes the
> unit numbers explicit in the code.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

