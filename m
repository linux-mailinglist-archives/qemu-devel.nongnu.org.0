Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF72162A2B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 17:14:19 +0100 (CET)
Received: from localhost ([::1]:37802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j45Vq-0001MA-RI
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 11:14:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43344)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j45Uo-0000aa-P6
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 11:13:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j45Un-0002h6-RJ
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 11:13:14 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:46155)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j45Un-0002gY-Mx
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 11:13:13 -0500
Received: by mail-ot1-x343.google.com with SMTP id g64so20006564otb.13
 for <qemu-devel@nongnu.org>; Tue, 18 Feb 2020 08:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vf3esyWUav8tIO7Tt0s+3PzYyqPkFiPqob3OCQ3mGaQ=;
 b=b3yvYCD1MKFkWsgOIoWLTRnKQhXGLsm+62jpNj6p0CyNqc7SrQQ1cNjt57fymyxF/B
 WKYcoUooHVE8YB8eynNpcLzNYAqtz/RA3vxxT2wPRNoSLPXH9c+e0Qs/Mc2aVqs9ARej
 tg4wCNLhdrLhNduszUD72JgTMK1hCzEsnKIzEySwaVs+KBxBbovqJPncp1yiicLtyPkn
 t+Y8jRfrlKZkU3vJIxSBpHu4ViZT/6IsUJSoIkwCNYJHr87ca00jy17R+lm+M6wgmyOC
 q6hp44EM1hHOpaZ7txHBXKU6/OGsgUjnhSThOgyWxzUeqtsDPgQN/4TrrHe1kb+vbpOG
 ypuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vf3esyWUav8tIO7Tt0s+3PzYyqPkFiPqob3OCQ3mGaQ=;
 b=AK/S9WnmRkzC9wve4ksQkSOifE6zUW5kiSdu42DX6LQSRc1R9RljV0sgaqdg1Ho3Wg
 oYS/1AILh5GxQY4/NzIcWaQU8ND5YpMDpviASuqID4zLxEuFwGC4PlRgXK+nLvkGcBra
 rwDaei1W2zhEJUhrDCUmnuIh6YIgF8Srk3hMWdvXh0mV2Y2/r/hKbxLf1uR8hIRrhhk0
 g6vo1s4YIjsprcJb2n7U9GO6fuSis0xA0U4M9nM/mGEwEwnCeL3//201G0qSb6YQUVGU
 jz5jeAxtgt/vYU6b4m395cUMpd1fSx3+85Y/h0Ns9MMzDHwlZHXWL8qUjlFn4TrC8RuR
 YEGg==
X-Gm-Message-State: APjAAAXs7jRZ6JXQYIhXr1REKKViRS3EccdquWu862o2yNSeDmteMhDw
 CWL3T1klP805mgE8ijhFSnFYDqwj/IHl3yJlY7QPEw==
X-Google-Smtp-Source: APXvYqy2oG2TiIDSRZiWoc0N8shiJ8u2EVUqkHPBUU7aolBRpCvNxwV0Vhwlk1PcV7HXTHKjf+4oYGMJ1G2m+dBMD4Q=
X-Received: by 2002:a05:6830:1184:: with SMTP id
 u4mr15575502otq.221.1582042392785; 
 Tue, 18 Feb 2020 08:13:12 -0800 (PST)
MIME-Version: 1.0
References: <20200217210903.18602-1-linux@roeck-us.net>
In-Reply-To: <20200217210903.18602-1-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Feb 2020 16:13:01 +0000
Message-ID: <CAFEAcA_O4BjURk1GPz0fUwCbnkvyUnfYzq4+sDdUCVSzGa1-Rw@mail.gmail.com>
Subject: Re: [PATCH] z2: Make providing flash images non-mandatory
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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

On Mon, 17 Feb 2020 at 21:09, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Up to now, the z2 machine only boots if a flash image is provided.
> This is not really necessary; the machine can boot from initrd or from
> SD without it. At the same time, having to provide dummy flash images
> is a nuisance and does not add any real value. Make it optional.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  hw/arm/z2.c | 6 ------
>  1 file changed, 6 deletions(-)



Applied to target-arm.next, thanks.

-- PMM

