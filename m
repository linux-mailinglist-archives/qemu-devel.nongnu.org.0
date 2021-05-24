Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 908C238E695
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 14:29:06 +0200 (CEST)
Received: from localhost ([::1]:56082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll9hh-000432-D0
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 08:29:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ll9gk-000395-Gw
 for qemu-devel@nongnu.org; Mon, 24 May 2021 08:28:08 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:39878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ll9gZ-00038u-Is
 for qemu-devel@nongnu.org; Mon, 24 May 2021 08:28:06 -0400
Received: by mail-ej1-x634.google.com with SMTP id l1so41508483ejb.6
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 05:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=Ss6ZL6BcgQ7kX9UMtIf21vZ/VANCqcE51v5JoGvf7g4=;
 b=osxg7f/HYoisoJjwtpGssDCc6ulf4wQdbNrNr2z38EIfVPlvzty2eWRaXU6biXt4hV
 JAspk1iOCW0EfkZ1BYinVJ+UaRPAQxTuKKzI5Ic0zksLpOvzKfYTLc//mxQCraPk74YH
 Kdt1YniojWuL0KDFwFN9ZqUZZwFhFtx5zvE5jYn5f6nTTLJt4hUf8NH65WzuB4LgW/nz
 m9GwVZ80TKiqxbBhrlwLc7hYC4za6tXKGuGw6mjEISnnFNyttR4wDPZDuOj2yOG69dyO
 2XDHBTTXBtaJYUQdpRCSJhCE/rjNyrBZN3YoLiceiuks1eKvm6aGyrpZ52/Np/z9KZGJ
 NVZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Ss6ZL6BcgQ7kX9UMtIf21vZ/VANCqcE51v5JoGvf7g4=;
 b=unY5ZwMYPieBvsIx6beQ0q80HfQABD7yf3/Cz1/1Ftyy9vz6uS9l1BAMyZDzv4d5mQ
 d1QRdnOPR6vZXfsOiCeBlx0nWlm/1yB9t9oSb2ta10GFHE2OW2xHiBjdgnrznTmU0bP2
 0FKfxoJePcZ33ZJfO/pGiPXL3vq7tGY32hj3Qq/p7dHu7xnfd58KCeS+mGsD4qvJXI6X
 EDmimbkkyi2DB+i/q+qWx3qMFAsFUg8sDeY4aY0oomExFak+2Fu/jyHCkLxwXY6MEAhS
 QF/6iFqDciVHoz1fYa5tAntqFWYUOaWDWVSyGEiccXDAeIBYI1eWc8H2+iTbqgT5Tu+h
 WlDw==
X-Gm-Message-State: AOAM53244ShgsLpp83OvIbZfMHLVaJU/1vjP1Xn7S8hGiOj7I6l1YRqy
 iWpJWib1nZyuK5k2KmVg2kNh+qqSd2FHPAi8JKA2kNhT/VfIUg==
X-Google-Smtp-Source: ABdhPJzxn3ntv3wUV1PTy7MwhsFpUNQrY1h48Dk24q/aVdtA6L/euFbnkFhtPowoxLR5bLv9JcCmPl6XuJjFE4M/BiE=
X-Received: by 2002:a17:906:bcd6:: with SMTP id
 lw22mr23514597ejb.250.1621859273319; 
 Mon, 24 May 2021 05:27:53 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 May 2021 13:27:30 +0100
Message-ID: <CAFEAcA82qqRmBeMvauPj-oyXU=TirtV=0bgB7jxUeRPUU7A+rA@mail.gmail.com>
Subject: proposed schedule for 6.1 release
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Here's a draft schedule for the 6.1 cycle:

2021-07-13 Soft feature freeze. Only bug fixes after this point.
2021-07-20 Hard feature freeze. Tag rc0
2021-07-27 Tag rc1
2021-08-03 Tag rc2
2021-08-10 Tag rc3
2021-08-17 Release; or tag rc4 if needed
2021-08-24 Release if we needed an rc4

I don't think there's anything much we want to try to avoid
dates-wise, so I just put the target release date in the middle
of August and worked back from there.

Any objections/suggestions ?

thanks
-- PMM

