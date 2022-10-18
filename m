Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A54F36028E4
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 11:59:21 +0200 (CEST)
Received: from localhost ([::1]:54360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okjNT-0005ZO-IA
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 05:59:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1okiwt-0006Ga-Gg
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 05:31:47 -0400
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30]:35812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1okiwm-00044N-MT
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 05:31:47 -0400
Received: by mail-qv1-xf30.google.com with SMTP id i12so8950218qvs.2
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 02:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mSLkimdil4ajonqIditqCY2iyzrJgT7sILhjO7y07xI=;
 b=M2dbUxhw52T73FzBi5HzhZ7fMfHqARKNErV9307EUEIbX2WQcHl5RLQuGFbRp21/V9
 EIrN2SHsPtbd9ssVmIgXCUzIWkzikckBXEjRbjZht5vbufIQhqa+4mqbbOn9zgBarGmB
 47MOOpYxHjny/jUyd3FULMHFAyVDlGghxhTTHrEayKGVMSHuW5TgSMi0TXG1qvyzCbAz
 abqx73G2YnZ1Emw1dclkI9rOiGbLMhAWyy8m1eK7TXyr4wIENBgQXSzkXep/ME1nVTir
 ricI1oyeIgK4sQciQ0TzBQro3Gu39/um8VaOUjXPoJZGso5bXJh540O+lzxW5FjWBDyJ
 Um5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mSLkimdil4ajonqIditqCY2iyzrJgT7sILhjO7y07xI=;
 b=vPGlxtpzzTmAuZrIk/c4/1luk97bK1Eg8vbRraZQm/S/BJD8pX3nqTmImg5qSaautL
 MjU8ehc9pu6J50JPlxFwGeuVyRpQEuQQOvwyDnxedscNTAZCTVwf5ELhs1H5ZW7pa6l/
 GCySIIH/bpXTzNvrRkBldxR+jpv2Bh3kM/ulGjepXREIfHW7ZDss3DOvSCnCzq1SHGBf
 ASzNUzsbbIO/dveHM7B+Co+pdoJob7FvlJSVRaoRg5Hs9DQCMH9ZlQW3JgWg+PkqcEaP
 URUj6qemxQ/6JUgnOJcp+IDJ0zqO34qqy0q36VSZv65FvfAuaxo2pZBhimhV4U6wNZ29
 tlJw==
X-Gm-Message-State: ACrzQf2842QHLzIyt8dw/UI9u6b+sLn+SpxkMMZxQaeYQDoU2649WOFU
 q4+KsP/6I4zWgQPSCorKBA6qQ6ykuAe2uawHBX0=
X-Google-Smtp-Source: AMsMyM7C73R5FfZUwMKHNiRmuw+GbvtMGqzkGFf+Qemi0kg9MZcMB8b4pTVwQMLrx0uQZqJ1G52gD1rQ8WQ7AaUvz6c=
X-Received: by 2002:a05:6214:e85:b0:4b1:7e5a:3604 with SMTP id
 hf5-20020a0562140e8500b004b17e5a3604mr1304703qvb.114.1666085498584; Tue, 18
 Oct 2022 02:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <20221018084341.16270-1-nivanov@cloudlinux.com>
 <20221018084341.16270-2-nivanov@cloudlinux.com>
In-Reply-To: <20221018084341.16270-2-nivanov@cloudlinux.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 18 Oct 2022 17:31:27 +0800
Message-ID: <CAEUhbmW6MEWXfWZUo-Y8q4-vKhaGxAMuE4vq9Pc4KpG4wMg_jQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] Refactoring: refactor TFR() macro to
 RETRY_ON_EINTR()
To: Nikita Ivanov <nivanov@cloudlinux.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf30.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 18, 2022 at 4:44 PM Nikita Ivanov <nivanov@cloudlinux.com> wrote:
>
> Rename macro name to more transparent one and refactor
> it to expression.
>
> Signed-off-by: Nikita Ivanov <nivanov@cloudlinux.com>
> ---
>  chardev/char-fd.c      | 2 +-
>  chardev/char-pipe.c    | 8 +++++---
>  include/qemu/osdep.h   | 8 +++++++-
>  net/tap-bsd.c          | 6 +++---
>  net/tap-linux.c        | 2 +-
>  net/tap-solaris.c      | 8 ++++----
>  net/tap.c              | 2 +-
>  os-posix.c             | 2 +-
>  tests/qtest/libqtest.c | 2 +-
>  9 files changed, 24 insertions(+), 16 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

