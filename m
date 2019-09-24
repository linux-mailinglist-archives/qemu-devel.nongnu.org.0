Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AF9BCBDB
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 17:51:43 +0200 (CEST)
Received: from localhost ([::1]:47464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCn6M-0002Z1-1K
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 11:51:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41217)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iClvR-000514-TM
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 10:36:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iClvQ-0004qJ-F6
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 10:36:21 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:41512)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iClvQ-0004q2-9K
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 10:36:20 -0400
Received: by mail-oi1-x229.google.com with SMTP id w17so1831466oiw.8
 for <qemu-devel@nongnu.org>; Tue, 24 Sep 2019 07:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qdNKOLqUct/L8wPdZt3owUQvdTutMImQjHm8Gq3PlvE=;
 b=G5BqkPKPmy4objH1E5l3lGZwXOZsGQIszvxs/053d4ZD35H+UmggUoWvXhwpVTMBHM
 5DpUSMZjtEbpEwm0og6A9SE5/SQk+Kh089/O4xBdZJFT/g8jNiKeAmh0FUAlW0gJBoRI
 DQoozqT/aaoVEqk9C6GoTjdYBZ0U8jVPpF+loenv37aZHw1Wv/1V+ZM8Bgnvvldhk9r0
 mE30tF1zs/mGWoIXqyATXIrMteQW+FoPqTxsxkDVpjIis88QG2jQc1mVFGf4F5bjPV9o
 PPdMMjIji4Ztr0lLCukgXbi59TeZvRVIjAiSBXXJQrfP20Pm4BeeM6ASaRVLyKIvmmq9
 v8Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qdNKOLqUct/L8wPdZt3owUQvdTutMImQjHm8Gq3PlvE=;
 b=AfAhGBAOH06CJGMZY7F9zbnHAZrQqeS+qt3ZUHMzqMm7lsFXQsoTcziBfbXB9OH7x+
 581d/ynu895sHbz55K/HzKpMVpwKGSJLBqAiby2cTsn5ISbGQfvT9vnTKY70PuiMzvuj
 PA7710rtA8eMGzA80eUcaE9wGkql3rgwbhUbas1VtZgiGd4Q6YFgxJ+odiYYQezvrDFn
 Whm7aZempMZd52taq5lr/AMNA8UuniDFNlW9wpsjdSiF8HRm5/peCopRgMo6tRU8CJEF
 M6pvPOQNzCUeKG2Pze398ZAH7v8pNRk4/EBCGGsXfiY5U/FiSd+9ESkwpRPUekWswoNf
 6mbA==
X-Gm-Message-State: APjAAAU1fDwjQ7SRrepfFQZh1BTIzx2xk4wsb86n/+/ltrfwQYvfp3XO
 y0zVICzgFNIZVB1bZOPJB7WBiDeACdRO+Q9GmJNXoYMsUVM=
X-Google-Smtp-Source: APXvYqwCGbGumoGPqGdhQ5VpvHDF6xMI/AFNc2TFfLvH4JRBFSXUbr3lKxkjpoCjvzWdkeqRzcU5ukVV6IyEXbk759k=
X-Received: by 2002:aca:50d8:: with SMTP id e207mr373768oib.48.1569335779280; 
 Tue, 24 Sep 2019 07:36:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190924061951.27916-1-kraxel@redhat.com>
In-Reply-To: <20190924061951.27916-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Sep 2019 15:36:07 +0100
Message-ID: <CAFEAcA8M+RWY9DF8-q-d-8780pD30oQi=eKsLcb0Qt5qGY7Wiw@mail.gmail.com>
Subject: Re: [PULL 00/16] Audio 20190924 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::229
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

On Tue, 24 Sep 2019 at 07:22, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 4300b7c2cd9f3f273804e8cca325842ccb93b1ad:
>
>   Merge remote-tracking branch 'remotes/cleber/tags/python-next-pull-request' into staging (2019-09-20 17:28:43 +0100)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/audio-20190924-pull-request
>
> for you to fetch changes up to 571a8c522e0095239598347ac0add93337c1e0bf:
>
>   audio: split ctl_* functions into enable_* and volume_* (2019-09-23 12:28:47 +0200)
>
> ----------------------------------------------------------------
> audio: documentation fixes.
> audio: new backend api (first part of the surround sound patch series).
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.2
for any user-visible changes.

-- PMM

