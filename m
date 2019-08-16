Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7539037A
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Aug 2019 15:54:51 +0200 (CEST)
Received: from localhost ([::1]:56530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hycgs-00080O-H9
	for lists+qemu-devel@lfdr.de; Fri, 16 Aug 2019 09:54:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40961)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1hycfb-0007CG-V7
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 09:53:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hycfa-0007kF-Lx
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 09:53:31 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:35189)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hycfa-0007hz-GU
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 09:53:30 -0400
Received: by mail-oi1-x22f.google.com with SMTP id a127so4863483oii.2
 for <qemu-devel@nongnu.org>; Fri, 16 Aug 2019 06:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b97a/l5R0P073YS/8iDaHzKb8gNPjMZ2bo+5zLRXa9k=;
 b=IjX2tPdn8pzyg6UDKyUR11fInbcdhZnw/o8sQtunkblOFcgUrw7aHwLB8MoDPvUqxv
 4Ab9zbiOEd67Z9/rjxYnksJ+is9rV2gkhCW5EbI9oXm/JWRQbTKaKxnTaS+SF1Oofe6X
 nnMszSmld9/cxYgkHv6tZz0ZUOFPEtVLJezAwa+ARx51GTfD0MpCUrz4MHeV/Zo5P7UX
 APUz0ght38zEYGduCc5OpI31vLa+Ncz8i41CFih+3HMvdVaC70U0PfUWnOEO6ffqSX8h
 XyT5naW9PJ++24uMPSzPvPhIt3jajhy8eSMZYe+70My0r5qDZA9P07Oeivmu1CFWtW53
 RAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b97a/l5R0P073YS/8iDaHzKb8gNPjMZ2bo+5zLRXa9k=;
 b=ON4XV0XwkrafUK4N7qP4ik+zBfq9VSM49ic0kYxqNH6+CpJl+ENmf50BRrOH+fAAa+
 /Vb2qfDNwiCGaffwUBG/ri7HnlQ6m8X08BPW4tcmF4WN0sBkktaEYLpzuAAHFxZi7+xq
 enM2Kzq7SFQeF5MoSE4Pb4BS7xxgBjjbcXibaZpSC7F+ISJKhGcMa0QPeVU7U8B8P3ht
 QCnwnDex6AQ9bNOQAMmfuFx4THP43SiZElRdCEUgoIhzaAYrmLPgKzY4r542LiEry2Zw
 vVCgqcCey/7ykW/F/n8sVzni4jWgFL2gZuZV7HrIh4NISCLK5KWLetAp9wSwl2DpfSeR
 dLRg==
X-Gm-Message-State: APjAAAVUeXkEkB32MsmbQ3OyTWw/ZfVcD6e+Fo1G6pBIj+RoaIXa8dIR
 YP9grJrZCsRPQ1+loOqNzg32AmbI6dR9O9RNKzkjZQ==
X-Google-Smtp-Source: APXvYqxrkMqla6eEszw0fTANMp/XlFU5EivKb8sARA3fJ8lhtVeVMq6WA+wyKYyk76CC+As+Z6d4EigKODT2vgSPyIM=
X-Received: by 2002:aca:6185:: with SMTP id v127mr5193375oib.163.1565963609104; 
 Fri, 16 Aug 2019 06:53:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190815175922.3475-1-thuth@redhat.com>
In-Reply-To: <20190815175922.3475-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Aug 2019 14:53:17 +0100
Message-ID: <CAFEAcA_JPw0AvG5GtL0yYc-JY_fBoCwBYLtivRKg+d9hAqPcfw@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::22f
Subject: Re: [Qemu-devel] [PULL 0/9] qtest patches
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 15 Aug 2019 at 18:59, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter,
>
> the following changes since commit 9e06029aea3b2eca1d5261352e695edc1e7d7b8b:
>
>   Update version for v4.1.0 release (2019-08-15 13:03:37 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/huth/qemu.git tags/pull-request-2019-08-15
>
> for you to fetch changes up to 6fc9f3d347aee337421f8afc4d0984294f8ea6c3:
>
>   tests/libqtest: Make qmp_assert_success() independent from global_qtest (2019-08-15 19:24:10 +0200)
>
> ----------------------------------------------------------------
> - Fix for ctrl queue in the virtio-net QOS driver
> - Improve Valgrind reports in the tests that use the null-co driver
> - Get rid of global_qtest related code in libqtest and libqos
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.1
for any user-visible changes.

-- PMM

