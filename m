Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A183403AD
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 11:41:55 +0100 (CET)
Received: from localhost ([::1]:38926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMq6E-0007Mh-Tw
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 06:41:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMq59-0006ml-15
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 06:40:47 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:43839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMq56-0002hM-UW
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 06:40:46 -0400
Received: by mail-ed1-x531.google.com with SMTP id e7so5976525edu.10
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 03:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O2NHF9bb+GfYNPFjnTLsYIuUZ54r7l47iLAMULCwQok=;
 b=bZzHCBWVyTKnXblDSoRMZbMXBi0EtPQ95fHwLAg+IrxsxcYofFNp90WCuJtXM7g5VM
 V30GAMQ7XX47N+Du1JKK0m29eyHUicXWfQI/pLrl9rmNvpKsbQkyMcNyWE3ID/5ph2LH
 WUHAbG4p1eLyvsy+KQ4tuDv7Rw/DmyKHhncTivTJG7Ed8axizO4FMAbNp6AfdhYSv/Ea
 ZiVPnvckpf0k//0SrpnYOAvAD6LkaCeFS8k9Z0578pmrhkIBVEGazFYvAUQg0pLGqDhs
 /xfuIxHH/TgdRMlPJrJOuvgrhqw9g96h/aafN6oKcJIooGUrI/ca659W1PM5nJx+GfKI
 lCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O2NHF9bb+GfYNPFjnTLsYIuUZ54r7l47iLAMULCwQok=;
 b=CAWg6n7PsLyX4/MDr37LeXf+IBjjlqJ2h9P3avVZG98bFQe82Ov75t96P8Gutu2D/N
 5dI6vpJnLsAmMIu2v3udRgrYM8HJUF24maXlQ84UOuXnX6Cs5j1iDZj0P1Rh+YiAj7bg
 5se9cc1kErRwtj5wh1J6WzUUlo3REhgAv/j47drDcgEyrymcqcBIBqvkQtg1m7dRH9j8
 lFI0kCb8aM34xFsQT7AQv4sPmZvh5HynHmDUxrUbpCR8XG3EW1mQvV+kvKdYH13GTcPj
 oGuSFrPf6VhAjot/S8vSsOIxgaFBGa4ZAPk+jViQ+QStVV7KH9FFyNcXuFTHysY6Evfg
 YKwA==
X-Gm-Message-State: AOAM533lyw5HgoYskjFSvfMkGMiTDwDR2VNILVRVN3KKRvyNNvmT6EPC
 MtQDaTJ2E6kXYZ0FogAeNIbqdV9hSBm7UnWRpZsv1w==
X-Google-Smtp-Source: ABdhPJxuGVmyzUfbH2fecECO7FjstAuI8/j2Qzrr8B4Mr6DYQNEMA9ut2aDlrGRneoeKDvNi+88SuC0dIGNxbUft/rk=
X-Received: by 2002:aa7:c804:: with SMTP id a4mr2697669edt.251.1616064041522; 
 Thu, 18 Mar 2021 03:40:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210315204226.3481044-1-laurent@vivier.eu>
 <20210315204226.3481044-6-laurent@vivier.eu>
 <2730eee0-6f1b-2139-f93c-6a0a64727e29@redhat.com>
 <905c797a-25c3-bb43-5946-54b28d9530c0@vivier.eu>
 <d515dabd-b84d-5aa3-0bf5-d824bdc7da6e@redhat.com>
 <ffa12ba8-4988-b464-2267-5d14c59b43ab@vivier.eu>
 <a90be442-97c9-cefc-df6f-655a6387d54d@redhat.com>
In-Reply-To: <a90be442-97c9-cefc-df6f-655a6387d54d@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Mar 2021 10:40:17 +0000
Message-ID: <CAFEAcA_BcRkJHjoRaxQs2ZO=JJqPpvGhHkG2bNJOqh_-EHr_xg@mail.gmail.com>
Subject: Re: [PULL 5/5] m68k: add Virtual M68k Machine
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Mar 2021 at 10:37, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 18/03/21 11:06, Laurent Vivier wrote:
> > This also removes the virtio-devices test, I think we should keep the
> > files, but in the files to disable the PCI part when it is not
> > available.
>
> I think we should just shuffle the targets in the gitlab YAML to bypass
> the issue.

Then we'll hit it again later. I'm pretty sure this isn't the
first time we've run into "some test makes dubious assumptions"...

-- PMM

