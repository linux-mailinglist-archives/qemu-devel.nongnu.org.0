Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 159F616C462
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 15:50:14 +0100 (CET)
Received: from localhost ([::1]:58118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6bXJ-0005DV-5R
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 09:50:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51928)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j6bVv-0003wL-R8
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 09:48:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j6bVu-0004no-J2
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 09:48:47 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:35570)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j6bVu-0004nL-CJ
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 09:48:46 -0500
Received: by mail-oi1-x241.google.com with SMTP id b18so12780769oie.2
 for <qemu-devel@nongnu.org>; Tue, 25 Feb 2020 06:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2ie4cWTu6Mx+cx/dMKac3RUgHcpymotpqG8utSoK4mE=;
 b=EpQnIbxkcZ5PLEEcBX0N6fl2kUpFjGYHN8wrzEJN+tY9uO5fs92Ut6cEe9o4gZTKcY
 X0AQWJtPj7ZDJ2Gpkt9wHLXQCBCJFKth1iATx5sZRKwKriZrv0p+W8yiTkjJOhEFxy9i
 Cbld7M/30A6L/UvEWDxBbV54yBVQkXpORfdOPctoTTgGRnJfIQMsqcUp25Yvu74BNy6F
 L1UF+nJLW7DeOxDswgomSWxi/xymJlCi4tWQUVe5dgLMUHdy6x89EwYElHkwsaberMRL
 9aPRd2FXNRJiu/JGzTrNY/BRaiEuiw6lcve85+eb4NQ9KaZIXgAxGHHhzCR8FCFK5Dcx
 60tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2ie4cWTu6Mx+cx/dMKac3RUgHcpymotpqG8utSoK4mE=;
 b=gox9mlX80rRTzljKZEhOdPfBKWehyozeIsRKk0HqEWD1idgkop2iqZW6trLvcght9c
 Na8pjiN9sHboAuF1Oux/xL4ZFXO+YU6CNVfOIEgFcVPR4FNvyf9Jab2I2E1X3cLFyMQP
 Kotso6uB4k/uJWiSTHZa8YCwhdrb1QAevVUzF91RhMl361BCuAETZeJJ7+H3fnnY9QiI
 JHVw6O9sx3EyirjzaiyxytR+wOEpCL0omN6z3gHk+pcmu+73X7vOMtdE2xT+plc6V5yo
 +x+jde9yrzc+lHugIE4/RKPnMBY64lxNTqvc9Nap74BZs6Deuu8OQhTBFLfj5iPdOkGJ
 EGsA==
X-Gm-Message-State: APjAAAXRg+3GAL/d+BZji+q+sf9fJGdyqy+bVWmemeHIkaCV6bMR008A
 rXUEzSiExUJB5zfolBNbivbPKVj0F91bO0tXC0zj2w==
X-Google-Smtp-Source: APXvYqzV8A4SPDqYsnOCbpsCQ4qvGFiT4r6AiZyKWJVQHUEoqQT9Owb55Nb6Xw2kpr3L8vbrTHFqLR9VRHhtjJDJOeQ=
X-Received: by 2002:a05:6808:289:: with SMTP id
 z9mr3768391oic.48.1582642125570; 
 Tue, 25 Feb 2020 06:48:45 -0800 (PST)
MIME-Version: 1.0
References: <1582634771-26661-1-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1582634771-26661-1-git-send-email-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Feb 2020 14:48:34 +0000
Message-ID: <CAFEAcA8C77V-kQ2auU26sLgCtTWSfZnLa3-veztr2xNFZoSZAw@mail.gmail.com>
Subject: Re: [PULL v2 000/104] Misc patches for 2020-02-25 (refactoring and
 Coccinelle edition)
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 25 Feb 2020 at 13:09, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit c1e667d2598b9b3ce62b8e89ed22dd38dfe9f57f:
>
>   Merge remote-tracking branch 'remotes/stefanha/tags/block-pull-request' into staging (2020-02-24 11:38:54 +0000)
>
> are available in the git repository at:
>
>
>   git://github.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 9e264985ff0bc86927b44b334bd504687f78659d:
>
>   Merge branch 'exec_rw_const_v4' of https://github.com/philmd/qemu into HEAD (2020-02-25 13:41:48 +0100)
>
> v1->v2: dropped patches 99-130
>
> ----------------------------------------------------------------
>
> * device_del fix (Julia)
> * FXAM fix (myself)
> * memdev refactoring (Igor)
> * memory region API cleanups (Peter, Philippe)
> * ioeventfd optimization (Stefan)
> * new WHPX maintainer (Sunil)
> * Large guest startup optimizations (Chen)
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

