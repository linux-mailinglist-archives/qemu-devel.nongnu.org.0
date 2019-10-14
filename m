Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E927CD637F
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 15:14:31 +0200 (CEST)
Received: from localhost ([::1]:49580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iK0BC-0001zu-OM
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 09:14:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35758)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iK0AE-0001bT-SO
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 09:13:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iK0AD-000409-ME
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 09:13:30 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:34937)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iK0AD-0003xV-G5
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 09:13:29 -0400
Received: by mail-oi1-x242.google.com with SMTP id x3so13701330oig.2
 for <qemu-devel@nongnu.org>; Mon, 14 Oct 2019 06:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2ZDxZrj8i3dlKeHEuNZk9hTc0Cc0Sxh7KqDs3VbBc5M=;
 b=aRAFAiROJv4F5Cgmww4DqojOW6jv3j6nfO/7tO5LT37HEduunsObyUG+QTkLY9WvGp
 cQvkMSKArVmQczjBBvVL5NyS8HcC4+sfZ7sfjUUc1UQ9ZW1t7OBYUok0F2hZEhSOTlkU
 M75bwO50N0y75EJKA0KzntWpwL25KcvZaKiIdKzeir7T3uhtX7lk/ix7c3/LhNWSDLzZ
 +fbsNAhpoovyMwA0t8Hg1aDLEIhyQ/49n4U5xZ4iRcyw06x9FZR6dKqZwLUzEqgzQRk9
 SmfdxsaBPrjeLxX+GW+kyDlJXcwbKwDpn4e99Js+H2jU2xIEdmqsBBS1jnEe0x9FO1iU
 Rz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2ZDxZrj8i3dlKeHEuNZk9hTc0Cc0Sxh7KqDs3VbBc5M=;
 b=spPdDlrYgEcAnc+5R6drG98QCeMhqyDphBnOlKSEn8uxMsf7on3zPOtpTxj1taEhQh
 +l/4BsjAM4ELrb1OjVAHnCS4tbZ3mHVvcsAvlKl/KpcXYElF5Nd8XJ0SjCaATwpbEonz
 kcCrfjPznYVZXk9tHV9OZSXXKKlea0N8IG9eI1GAl9JmubdTTxKP1z2qr4VB0O4Alif9
 1Mpazh+6eAkTIyJ6uzecOHRVqKqc2VlsNfl8kN34h6GjTqnnnYjm/emPdq6Z9ODbYF4Z
 ppDsKWb+shhIohRf94RF8347gYRKlUYXbKMo8J3YsGMHTxVZnqOKXDoJvkwUK494AJCs
 6kng==
X-Gm-Message-State: APjAAAWgnVy5g2Iy3kDvQEABUpEZXvOMPP6hb0lluBLEawPYzzURkr/L
 TGxGDOfT7KUAwyw9v+obY35o1EOCk4UWnTa3xQiILw==
X-Google-Smtp-Source: APXvYqyZU1fKprBS2eEBvK2IJuAoAHJz/GSVxXzmSNanhjSck8Rjrl+1vWn2y0HjLOoXLIMPpzUK64P6II5Trf46hzs=
X-Received: by 2002:aca:49c2:: with SMTP id
 w185mr24731115oia.163.1571058808283; 
 Mon, 14 Oct 2019 06:13:28 -0700 (PDT)
MIME-Version: 1.0
References: <20191014125254.74913-1-hikarupsp@gmail.com>
In-Reply-To: <20191014125254.74913-1-hikarupsp@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Oct 2019 14:13:16 +0100
Message-ID: <CAFEAcA-ffWN10fPT-LEO+bpLB8kgORSg3Lkvj9zF31RyV1+sww@mail.gmail.com>
Subject: Re: [PATCH] This patch fixes hanging up Cocoa display on macOS 10.15
 (Catalina)
To: hikarupsp@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Oct 2019 at 13:53, <hikarupsp@gmail.com> wrote:
>
> From: Hikaru Nishida <hikarupsp@gmail.com>
>
> An NSEvent is fired before applicationDidFinishLaunching on macOS
> Catalina. This causes deadlock of iothread_lock by calling
> bool_with_iothread_lock in handleEvent while its already locked.
> This patch prevents to call bool_with_iothread_lock until the
> app_started_sem is released to prevent this deadlock.

Thanks for this analysis and patch.

Do you know what the event that gets fired is?
I'm wondering if it's something we need to handle
(or if other events might in future fire in this window
that matter to us).

Incidentally, getting an NSEvent before applicationDidFinishLaunching
seems to contradict the OSX API docs:

https://developer.apple.com/documentation/appkit/nsapplicationdelegate/1428385-applicationdidfinishlaunching

which say "This method is called after the application's main
run loop has been started but before it has processed any events."

thanks
-- PMM

