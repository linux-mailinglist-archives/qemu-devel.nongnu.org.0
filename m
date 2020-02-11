Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13850159680
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Feb 2020 18:49:29 +0100 (CET)
Received: from localhost ([::1]:54588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1Zf5-0005CI-S7
	for lists+qemu-devel@lfdr.de; Tue, 11 Feb 2020 12:49:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58170)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j1ZZ6-0006ZE-Ou
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 12:43:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j1ZZ4-00044m-PV
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 12:43:16 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:46201)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j1ZZ4-00043F-Jw
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 12:43:14 -0500
Received: by mail-ot1-x341.google.com with SMTP id g64so10913293otb.13
 for <qemu-devel@nongnu.org>; Tue, 11 Feb 2020 09:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jGOnQiV8XB0esoSOdIPdJyPoFQW5GLKxN2/UKQS+CVg=;
 b=kXgQ7PaOm0MJgP3tIP1ReXswXibQR0150wp1E9oriW4FfGrTxlLmysfCC+FGdo/FlI
 aXCQs7tqne26EBGv3xGbLxgkUY8N6dYHbmLhuT6RGp5tZXX0OFtxySh63/v/5n4WxJ/e
 QvStYtaERzUoNFbLjCWNHj5OEjC/nKWFTmfa7i1UNIQ9TUVbTR/Wvwaw8aqNZQRQBWZD
 chlNmI/fLRc8T9/RknNAJg3W6BfHHUm3MQxDGDTLKlEz6FzPmkwMjZQvLJKrNpAKL132
 jO6D6M2T4S5GIwosUnLBT1WzjaDr6UCnCgoBX/rUk8FOkkZtL903ipLOTOPh6+6ooJUz
 TfYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jGOnQiV8XB0esoSOdIPdJyPoFQW5GLKxN2/UKQS+CVg=;
 b=JV85oAStaDzQWF1hU3vqItVGtprZA0T8EOzGIp6WVdckT0Vdd0nTidXb3V9SiD+AZo
 sAuUS9yNbiDx2PoJIndsz2v7mbEAZAZSDyKlthykHzp3Oh04mDVodlzY+dCxAlE3nJwC
 QI3lTPCGFzDvVn4vaxQOnSkoDezWNNoemUonESB1K5oNImRvH8adhlDBtMh6pkbYqIYp
 ev2eaLCxBh+PT4RMgbwe2lmJyOlx6AepPnGFvoLZ7cvryLyFoqmMwt0ZvzGjHJCBNh6W
 eIWmIPxOY2mM0q3Idch5qIRKfFuy3xPZ+5jQc4+bPVVdkxFpnKmqsMV57bZKe0vWDAns
 sHTA==
X-Gm-Message-State: APjAAAWtlMEvtL8IyXgsmGg1Xhb9Q7ztx8c+MSTKl4e2AkaeLbQqE0uS
 RqAjP+kUvtz++jCUId+ntdTuSNOJM60julvGJMlZu63j
X-Google-Smtp-Source: APXvYqyy6cXBSVJjerzHa6t/VrvaDLF2eKMcXUmIFvkePvxXqGgeEPifiDe5wVfjcSyF4tDfgyA8AP/LJjYVK2xg5XQ=
X-Received: by 2002:a05:6830:1184:: with SMTP id
 u4mr5800687otq.221.1581442993554; 
 Tue, 11 Feb 2020 09:43:13 -0800 (PST)
MIME-Version: 1.0
References: <20200211173510.16347-1-alex.bennee@linaro.org>
In-Reply-To: <20200211173510.16347-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Feb 2020 17:43:02 +0000
Message-ID: <CAFEAcA8GQ=bkQjRvC_XDh_4zZMSCWsoJOB8=7QPg0BgBFYNj8w@mail.gmail.com>
Subject: Re: [PATCH] linux-user: un-register threads from RCU before exit
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 11 Feb 2020 at 17:36, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Through a mechanism I don't quite yet understand we can find ourselves
> with a left over RCU thread when we exit group. This is a racy failure
> that occurs for example with:
>
>   alpha-linux-user running testthread
>     with libhowvec.so plugin
>     but only when run from make
>
> This may not be the correct fix but it seems to alleviate the
> symptoms.

This is weird. The only time we call preexit_cleanup()
is when the next thing we do is to terminate the entire
process all at once. (For some reason in one place
we do that by calling _exit() and in another place
by calling exit_group() -- I don't see why we need that
inconsistency).

I'm pretty sure the system emulation threads don't
call rcu_unregister_thread() for the "whole process
is going away" case, so something odd is happening here...

thanks
-- PMM

