Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A4A254599
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Aug 2020 15:03:16 +0200 (CEST)
Received: from localhost ([::1]:55110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBHYh-00066d-BX
	for lists+qemu-devel@lfdr.de; Thu, 27 Aug 2020 09:03:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBHWf-0004eL-8b
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 09:01:09 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:46776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBHWd-0001BS-EQ
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 09:01:08 -0400
Received: by mail-ed1-x541.google.com with SMTP id n26so393483edv.13
 for <qemu-devel@nongnu.org>; Thu, 27 Aug 2020 06:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HwnMBZ0Xa2ornS7ieOgEsGB/1HJECozKOZjHwZWJ+WQ=;
 b=nVREqagBqrseSpBqJHNdQ9sdHZDC2c9Kbze9ywB5xGCV5mOXxLg3lqtkj12UBtmgqm
 zl6DIeHc19ephe9YyfDslOPwTzGnBE5iFchjBmxW5q7dI8SBJJqtP7sVSZQuumd3Bnt1
 VHc5uglgaedNII0lk24xpGuzCHkZF0BGxC4ZEbLoou5GDQlBCMGhbR6WzGb0aJAA3Kod
 M7bBpMcro94Y3s9Qdp2LuT+/ma3XscGYQYI2Xr4CmJK3VgXfHIJd/GcZ52NOEo43zH2C
 +VjNDlZyEkKDbVc5vG78Hy9Twhq13mlXAWghNZdqmi2pPiMgV5T8LjGlH+u+ZqojrqiQ
 FUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HwnMBZ0Xa2ornS7ieOgEsGB/1HJECozKOZjHwZWJ+WQ=;
 b=ebijfKkBFQowTUcs5sXCE5QscQJ6xU9SaK5TdgvVrStzFNZFBNcA5/pMM9Fte0/EfP
 CudrZvRlCBPHvna8sct7YjmGIFdZCDaw+J0qTu3DECrrhIFy+1m8ooorcVR3chhA+dOW
 VWP1YtVnOjqmjaH28LKVn/F3Nukshk+p8SoBHINlcY8esHNFtbpcObcoJeyt1HGvacER
 Rp+VA383lR0wQIJ2qpurdZGt3BPfjbIW6lRB6Py5w14uCDOd9CFCzivmLAOy05ciBZR6
 HhGY0Id8bwMgPIkhFa2cOAEAmxgveZydBFhUIaF76WgBpsIFWBhzIY5uYFS6eLlBCgld
 bhgQ==
X-Gm-Message-State: AOAM533uDF2EcpztH4hCR3IzkuCJtrvzl5F1M4e1F8kag+IkPvyAe8Ew
 6u+7hsNeE6+eV4s0vpYyf6jQDokN5BZE8zqckumelA==
X-Google-Smtp-Source: ABdhPJySMnEk/HM96NDHk+GotKLqPFFdl4Q5Hl4reTBs2rtB7GL53fM8I+WM3LoOvLeJrXJ/MfkW9mE7MFc6r8UmkIM=
X-Received: by 2002:a50:da44:: with SMTP id a4mr20307706edk.36.1598533266069; 
 Thu, 27 Aug 2020 06:01:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200826181006.4097163-1-ehabkost@redhat.com>
In-Reply-To: <20200826181006.4097163-1-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Aug 2020 14:00:55 +0100
Message-ID: <CAFEAcA-VuODmgo=8WeFP=gEBdOr8K1HxvPN7hdp4AYHnBh6A6Q@mail.gmail.com>
Subject: Re: [PATCH] armsse: Define ARMSSEClass correctly
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x541.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 26 Aug 2020 at 19:10, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> TYPE_ARM_SSE is a TYPE_SYS_BUS_DEVICE subclass, but
> ARMSSEClass::parent_class is declared as DeviceClass.

Whoops, I clearly managed to mangle the definition of this
class quite badly :-)

Applied to target-arm.next, thanks.

-- PMM

