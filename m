Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 345E8318984
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 12:36:40 +0100 (CET)
Received: from localhost ([::1]:60972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAAH1-0004u6-83
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 06:36:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAAEs-0003fW-CG
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 06:34:26 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:46626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAAEo-0006Dg-My
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 06:34:26 -0500
Received: by mail-ej1-x635.google.com with SMTP id w2so9479288ejk.13
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 03:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wHe2L3J4z5ui7y+3LdDElIEuLsRy6TTF+pZy6oQ+NJg=;
 b=uC5aVCLG8vfu8PVDezeIuwgmrmSE7LPYqrt9BNTgN0BchRdBx8w9VuHuptyPsBi5jb
 nOSSTgIL2pFlcEw5uGpg5z7t2EV2OhsKM9TDnK+YN0m9MDFaeEt4u3QA2dyx1g21uN7p
 flZvwdOhlBuFvWXC1jFBjDGuVNME0AUEgb3o0qAPdI5y/okvVjYpQTqD/Kb+TEz/lbXt
 giOaimwPqwwbzTRVghhSAhf+PncRjkuxbBczxr5s/E4ZAmcYGwVu267Gxawyuv8ijIxV
 FySfa8IFC21TWJLH7lWWUKaAAgILHu8Kux08jGQjKH85Fg5bfeR9NiB4U8Uk/ISU5bNb
 /ojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wHe2L3J4z5ui7y+3LdDElIEuLsRy6TTF+pZy6oQ+NJg=;
 b=clXNZwePs35GuVbKSh5LOYQog0s4OPgKDAPN8XN1Co78IrJLZ0QvKJ8Ero6hDufaG/
 TyI13OOh/OtnQHJePbN9by5FvLYvTSyI0gunjxkX3zwLtGp43ElaW1bUN524DZGilBSq
 b0fAn+/pX2Dr9oqqwg+Zw9LYxtLyBdj7u+h1tqyoHVlK/8oxHSJu7pjiXdkgeWZIDQYI
 PjVqQOlHk/L7wn764MEYe/fXQpHK5eqbSg7wFPu8Wl03hBDFQpk4n0aUdISwChjsyYy4
 okDfHwaCJSqFzRwmOLPMvvk9TK+S8qyC/cXXSjNt4AA0y/qdfHkvM4RnKEE6J3zRi0+a
 nLmw==
X-Gm-Message-State: AOAM533S/ODuqD1UleOGKeC8kbuAVgO2uEgEs1EhZL0Cal3mMt74ybU3
 /U1u2VqnIYlLy/OgHYp/fr1/pJsDd8HnUWlx4IV6FQ==
X-Google-Smtp-Source: ABdhPJyB5BlTUFTkX0HOX79iJVMObKxRd8ZGZ4o3N3q3sQF1koNME4piRPN5amyTfOiwCMI2LQI5jzGXGe1o7IdhCGs=
X-Received: by 2002:a17:906:1d51:: with SMTP id
 o17mr8082563ejh.85.1613043260808; 
 Thu, 11 Feb 2021 03:34:20 -0800 (PST)
MIME-Version: 1.0
References: <20210209015541.778833-1-dje@google.com>
In-Reply-To: <20210209015541.778833-1-dje@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Feb 2021 11:34:09 +0000
Message-ID: <CAFEAcA-h_w9j3nEKo-1aBdM-XNFKx+-bn33=5vzWd5FJ6Ly+TA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Add npcm7xx emc model
To: Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: Hao Wu <wuhaotsh@google.com>, Jason Wang <jasowang@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Avi Fishman <avi.fishman@nuvoton.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Feb 2021 at 01:55, Doug Evans <dje@google.com> wrote:
>
> This is a 10/100 ethernet device that has several features.
> Only the ones needed by the Linux driver have been implemented.
> See npcm7xx_emc.c for a list of unimplemented features.
>
> Doug Evans (3):
>   hw/net: Add npcm7xx emc model
>   hw/arm: Add npcm7xx emc model
>   tests/qtests: Add npcm7xx emc model test
>



Applied to target-arm.next, thanks.

-- PMM

