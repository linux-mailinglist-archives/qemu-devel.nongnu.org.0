Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2A05D852
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 01:09:49 +0200 (CEST)
Received: from localhost ([::1]:58190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiRuG-0004xw-Lj
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 19:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52292)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hiRq4-0002kk-CV
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 19:05:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hiRq2-00087q-R7
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 19:05:27 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:40706)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hiRq2-0007lu-9m
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 19:05:26 -0400
Received: by mail-oi1-x244.google.com with SMTP id w196so409307oie.7
 for <qemu-devel@nongnu.org>; Tue, 02 Jul 2019 16:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JShmE6ZCUMD+tnZIgyoQE7WPpcBn6aFht58oW5tN1UA=;
 b=zz9HGeRSvM7Q3+DuDpPilIl7Er4HO6lHnBlRFo55aCThCUWnH8Wzw8+lQpbrs/2Xmw
 vTxwJw/DQV1qOf8WqoOZWg3wia0iPwiM3oAIz7puRL9Oleetkw06PGoFx78eFvw71DYX
 8o3Dth/xqe1/HYx3bW2qzvTYI3/XSUac8rACAWLTKgxCbWP6WjfbjA2c1phav/jHXmeQ
 gblopQgym4wf+mjVa1zoPkKiCsDu26CUT070HNNbXYBgwxOUGRgdMo71sMn4mixMbD/2
 Q226Szvz8/IIMKUBvsOqhHTrtJ/yZ1K1tKNirUfESXvRBcibM4XvcWw1wjVqnXo476k2
 zbkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JShmE6ZCUMD+tnZIgyoQE7WPpcBn6aFht58oW5tN1UA=;
 b=obntDHJVBn1CGwXW/GkdP+e3ojo/O7Ddv5bt7bNeEVL1bApDyDOvSffSnA7JO6OIKo
 S1WwC/RFr1PrKx+rbAK+C/R+GOPPWl7hCUR1d/m5bX9wEXxsd1QsXa6xrx9o/RWo6JB0
 zf7raylIDvpJRTmcAGfQ/wxXZNzKBbO+Eyml5tb1YDS91+pcEAE5EE9smSPrSHYlu77q
 1r5NKaNimcF8gf8GBayrV8tKKSItup0E2A7+oe/O/wDEAw6TgtdZdHcusfzXAwIDmFFo
 i/u9inAJ8ttedJ8J/RrvIdv9u9KJZg57cWKRitSl4mikBj04Y49FEb7u5kgLY7s5nPEI
 R+mg==
X-Gm-Message-State: APjAAAXhuB7JKdk+TzxWQJc2wGF3Wf17fTs0V6X+xhgMm5mrHDg1iapq
 EbORD47e569izvnkAB5Klg3sgYw4c/73nDIX9NdZPQ==
X-Google-Smtp-Source: APXvYqyun1LqXt6dBIPHCrtLzYLxmavJoKpLuUCa/wxsg+tN/Ux05v18TL04qXpBRE4X/d5UzQ8b7wPSqmeJrT/dWWQ=
X-Received: by 2002:aca:ac48:: with SMTP id v69mr4557315oie.48.1562108711951; 
 Tue, 02 Jul 2019 16:05:11 -0700 (PDT)
MIME-Version: 1.0
References: <1562079681-19204-1-git-send-email-pbonzini@redhat.com>
 <156210201797.16064.1193142357173483033@c4a48874b076>
 <20190702213824.GS5198@habkost.net>
In-Reply-To: <20190702213824.GS5198@habkost.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 Jul 2019 00:05:00 +0100
Message-ID: <CAFEAcA-SgwO28MqYxcW8YRLGbv=wRUgRqZ70+q5SyL0bFrpvJw@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-devel] No symbols in LeakSanitizer output (was Re: [RFC
 PATCH 0/7] target/i386: support VMX features in "-cpu")
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
Cc: patchew-devel@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 liran.alon@oracle.com, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2 Jul 2019 at 22:40, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> Can the asan build test in Patchew be updated to include
> symbolize=1?
>
> For reference, below is the full stack trace of the leak.  It
> looks like it existed for a long time.

Yeah. What's new is that now we build that device for
the x86-64 config that patchew runs the asan tests against.
(I sent a patch with a suggested fix earlier today.)

thanks
-- PMM

