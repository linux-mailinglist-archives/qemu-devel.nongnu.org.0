Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBF43C26F1
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 17:36:20 +0200 (CEST)
Received: from localhost ([::1]:49180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1sY6-0008JU-W9
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 11:36:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1sW6-00075V-LI
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 11:34:14 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:44551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1sW3-0000qg-TU
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 11:34:14 -0400
Received: by mail-ej1-x634.google.com with SMTP id he13so16857058ejc.11
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 08:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=n8W1JBkkWZRIyProEZXRp4CvX5rfrpL4QHzTFWDL6z4=;
 b=v4dMOH1r7whYHk549c+FEvLWnmlElFu6ArsTrp5tCX1Ud3/GlQB3UvCmwa5EqvldAV
 EuXKtVbRbM2C15QFVa95W0G+vFSBK1jhsS5X0Nahat+ANr1+jaxSgRrrnPohLOfogGcU
 DDO8je1vIf6o8wEy4t1lN7L20yCdl/ugzBzimwlAZUcZ53dO3GAu452LFfN93z1fTo9k
 g0zwUKOVPeASZl/FuaVgzpqVjOce1oTE10/6a9a6Fghssj0taSb9l50HLXIUnXaklD8b
 AnLdO9oSFvlPWFZeWlVxII/O3H+fGwg5d0UD1ejRHA4RYdi9tYhmz7efHPcOBD6v1osI
 qhPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=n8W1JBkkWZRIyProEZXRp4CvX5rfrpL4QHzTFWDL6z4=;
 b=t2+fBAjaEbPoxFH7b5Bk/sLybvz0mMiAKRJjPq/LWCSRR8vYI2/kYpaTqUKRYmb9qf
 FXnweSscOJ01olyYkDjEm9ThcGyZrDhyos1tbRqxZyNcEaovATlfT65m6S3AIVj7uud7
 b1ihu+vqGKq83Cj8Odkh8hNKWzqWjx1W4qA4dCe4D6Otc0/kEJDeHLvI0+i4SBOwxtR9
 uHa4TinucrTl3nYTvQ3bqFudKVzCyK4IXOOK8dHrsaUZhXsaxnFHiHupUtCRBGneAxeD
 a19so0v9SgxkgOei8FjB8xc/+f9WesH7hCck+IlKWtcu8vt3QY7a27BbPZicn/3Nkak1
 ZiqA==
X-Gm-Message-State: AOAM5318GRpPxZP7MJCyX1/twLkeFas/N0ZYcieNS08lMZBCzAsMs7gA
 8rv8K7qwPDAtjmRJamfJTY+oHGCCQJWVQDtTt60g0Q==
X-Google-Smtp-Source: ABdhPJzRlYPKNSd1crAxtQZZqRtLlxwZmXMblpIUJ3Bpkqwum7cGSA63FKdfCl013m9eON+F+XYl+lMuCMfAGgThYLk=
X-Received: by 2002:a17:906:924a:: with SMTP id
 c10mr20861041ejx.85.1625844849812; 
 Fri, 09 Jul 2021 08:34:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210708145514.1751773-1-f4bug@amsat.org>
In-Reply-To: <20210708145514.1751773-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Jul 2021 16:33:31 +0100
Message-ID: <CAFEAcA_ukc+t_BYddOSv7EF6O1qoVHGGj6sA5uumUgt0VMS_pA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] hw/arm/raspi: Remove deprecated raspi2/raspi3
 aliases
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 8 Jul 2021 at 15:55, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> Since v1:
> - renamed tests (Peter)
>
> Philippe Mathieu-Daud=C3=A9 (2):
>   tests: Remove uses of deprecated raspi2/raspi3 machine names
>   hw/arm/raspi: Remove deprecated raspi2/raspi3 aliases



Applied to target-arm.next, thanks.

-- PMM

