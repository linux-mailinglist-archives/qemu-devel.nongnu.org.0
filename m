Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2562EC9CCF
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Oct 2019 13:04:27 +0200 (CEST)
Received: from localhost ([::1]:34750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFyuH-0004uH-UU
	for lists+qemu-devel@lfdr.de; Thu, 03 Oct 2019 07:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59218)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iFyoe-000296-T5
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 06:58:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iFyod-0002rw-Mh
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 06:58:36 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:37963)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iFyod-0002qF-FD
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 06:58:35 -0400
Received: by mail-oi1-x22a.google.com with SMTP id m16so2168075oic.5
 for <qemu-devel@nongnu.org>; Thu, 03 Oct 2019 03:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fyFnH8NfH/GsnmK5/QM9BREtoBfbXZkvRauojyGIj+4=;
 b=KfC0Oc95cm5c8AnHJpa9PBMwwzLKUCIY+/Q48ivNFUu/mxVhny1HK2AjTqICHsvhLp
 nvrOyr65t9KyIZfwWKSKRS6+KUomZf7E/9lWrArHUpyI/9unDDU2uPbiwOBl4DyqafoO
 zOB0sJA+5YTBe7KQAJG+BZNX19mK+VAPNYJU1/LRHV8sqRtDAlSw27io7unYuUYel3dZ
 xxXZ+J+d5ruOVQUHdvz+6xbfqaAaTwUsi1a10W1B4TjVqugjprx6gp3+RAIF09MjbfRY
 jXiVs5SkpAGGJ9iiK2VFYK1qhMZXmTRcRbPWNnfHGzL6pslVxGecXV2w2zL92g7gFbvT
 f47g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fyFnH8NfH/GsnmK5/QM9BREtoBfbXZkvRauojyGIj+4=;
 b=TRUEr1iaZ2n3VZgsOVZ0I5HLGdn4V4+H1dQgsQUwkL/hAKtmUr2oKG2i4Gf06HJ82Q
 qBKiB/Hss3mo0gVtF8N7mf/rC8DrA18kpPGGhxzpmY4QhqRJKrbr8vkCWdZudFC5GoIM
 FTB8T41ou927gRQFXtbmwKUVRY+pYUpHJ9uV/xtnqELlnYERkWH8POTEoVtFkigfW4F5
 xPfqOs+ufpYRGm8tMKyX1GATqoYaxS5baFKmyDrc4zMIt1flrNaEOtAREHE3YbOhkxqv
 NNp/iqX6Mg3Lwp2GXQRnffATfG/V8q/5UcA2msOUfPIpwHcItYwgRjoyN3JVLeXpt5zk
 W0aA==
X-Gm-Message-State: APjAAAXdFF9dxKNqWBBzv6boHLF/hKjbuEpMl0rXiqhDHg7/Owano0It
 JkOVHeyYL4P9ChSqj/LSGF1nOMVAVvTSDTxbNyKnFQ==
X-Google-Smtp-Source: APXvYqyWtIrCqK/fKfP8FaWX4z75brNKSb4w6K7waGzLcTiOZ0ARwbx88/H0zmaV8DvbKjcd5hypQ/vKxLs6elPr/+g=
X-Received: by 2002:aca:b48a:: with SMTP id d132mr2362615oif.98.1570100314485; 
 Thu, 03 Oct 2019 03:58:34 -0700 (PDT)
MIME-Version: 1.0
References: <20191003104928.crwjanhymtmwdboc@starbug-mbp>
In-Reply-To: <20191003104928.crwjanhymtmwdboc@starbug-mbp>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Oct 2019 11:58:23 +0100
Message-ID: <CAFEAcA9df8Jr2LBsWXY=9AsZcRvatd9RW10oNqLxzJ09Lbcjhg@mail.gmail.com>
Subject: Re: Qemu/KVM fuzzing - next steps
To: Darren Kenny <darren.kenny@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::22a
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, alxndr@bu.edu,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Oct 2019 at 11:50, Darren Kenny <darren.kenny@oracle.com> wrote:
> How would you like to move forward? Is there an ordered list of
> device or machines that we'd like to focus on anywhere? If not,
> could we create one?

Roughly, "anything that can be used with KVM" is our
security boundary, so we should start with fuzzing the
devices and machines that can be used with it.
QEMU has a ton of implementations of device and machine
models that can only be used with TCG emulation, but we
don't make any promises about guest code not being able
to escape from a TCG-based machine, so we can leave those
until later (if at all).

thanks
-- PMM

