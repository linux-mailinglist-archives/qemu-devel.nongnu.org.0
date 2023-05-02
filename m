Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E026F41BA
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 12:35:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptnLQ-0001Sy-OS; Tue, 02 May 2023 06:34:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptnLP-0001Si-5f
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:34:51 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptnLN-0000YC-I0
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:34:50 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-50bd2d7ba74so4359092a12.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 03:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683023688; x=1685615688;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aiyYJ0ImMCySqbDkjLm3Tw3sPZflI84Ir4EXdvP9qvE=;
 b=q/Ums5TVJxromK2CxRJRydvJTjFL7pkXy0ftucLBE9uG7X7L5v07r0INM0wjsz3hmG
 +00V5I6hPTyJx5lkzyOu4/3ZiiCF6zpE7z26jT6UkoeZEYNYJB0BU624celIyNtse5yD
 kWG7kkWr5qAnxz4ZsYt0d+DYFYiHnRGGbRtqKEEpi79xwNW+hWPjI+xwgMxJ7+zaITPm
 4u+J1mELyz4ZCe1b1xAytgnLwb0OJLjQzCgbfee5tq3Gf5daqRahzYd5TCjnInClkmP5
 xpWatkPthvS2ijakAahA2VH4xcWewsAiyYoARBQG8PY9e46ghyhT+eQ1KAeIedixEWCM
 B0UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683023688; x=1685615688;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aiyYJ0ImMCySqbDkjLm3Tw3sPZflI84Ir4EXdvP9qvE=;
 b=ibnO/n37mbfnOdF3bKbd4LvYXw8NeXHrc9yudBmjLz6TKUUCq6MNaGB4G2PG+e5Cqy
 eWaTEcIpjtAECUaYM8q+8080UpaeGU46GW52vW90neKW/rlNUbivLHhJaOw7vNpouPgP
 PfHFovQxuPxRFUGJGw2JGPt+vpz/VmbragO+n9npK0IVFpMo8pDWmF+eMMPQyfktzcDE
 HgkeVFBCzTYXEm5i+PBZ6WWCz7kTyRKkRyRN50VG0BSizZo57bMj9dPIu1ESgJraCrx6
 NQY3u8IwnO+ou4SVHg365nX/w2pHTtWiGN0Z/99zlFfIJvBYkIcdSNM36r2kkSuEiUhA
 SH/w==
X-Gm-Message-State: AC+VfDyGJH2pko7BvkPsVQfOeqqbSWF1nywCFIa0JYnb6JovokTfzMlb
 1SXxF78dr5CX/53IBw2KRznxO7oJiyqzCoAgbDE9jA==
X-Google-Smtp-Source: ACHHUZ60I0AJtDT34JjvcHyZhBssW29s/mhGxji6EUv65uEpR5eMnRYtBIskYK0EtiHA4xgISAGomW6n8WMlAH8Mnck=
X-Received: by 2002:a05:6402:2709:b0:50b:c350:f9ca with SMTP id
 y9-20020a056402270900b0050bc350f9camr7151387edd.10.1683023687926; Tue, 02 May
 2023 03:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230424165053.1428857-1-peter.maydell@linaro.org>
In-Reply-To: <20230424165053.1428857-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 May 2023 11:34:36 +0100
Message-ID: <CAFEAcA88OoaDLP8i1opv8twb-a42QaMAbNQCh6g0FtHLfXp7Ow@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm: allwinner: fix endianness bugs in sdhost and
 sun8i-emac
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Beniamino Galvani <b.galvani@gmail.com>, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 24 Apr 2023 at 17:50, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This patchset fixes bugs in the sd controller and ethernet controller
> devices used in the orangepi-pc board model. The bug is the same in
> both cases: we read and write a descriptor struct from guest memory
> without byte-swapping it, so the code only does the right thing on
> a little-endian host.
>
> These fixes (together with some of the others I've sent out earlier
> today) are enough to get the BootLinuxConsole.test_arm_orangepi_sd
> avocado test passing on an s390x host.
>



Applied to target-arm.next, thanks.

-- PMM

