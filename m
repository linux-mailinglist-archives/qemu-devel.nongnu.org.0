Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EF6577F7B
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 12:18:50 +0200 (CEST)
Received: from localhost ([::1]:43324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDNpw-0003QM-Rz
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 06:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDNmm-0008Jr-BD
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 06:15:32 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:41889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDNmg-0007EE-65
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 06:15:30 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id 6so19922309ybc.8
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 03:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=58W0570Jka+/QTu+LKm1ttkum7tKXr80GanuQK2uK1w=;
 b=T7UPwhkwl3W5zjli0U2ynv8Eoi5T6UfeJQbj70yfsXTQalce93HIKEg36MAehfb/UY
 JT7Pisbw/d01mCkXcVSKm0KBZZRIMhOgfvD5pYGMvMKxaPIWJKYXb1Bsae9rLtjB4wkb
 DSalzARC2af53YA2Gf4wpniJnrSu0ZNx87iULzN6Hzy9wTEpyQnty0ifM3tMJNOON0/+
 yR8QGMZP4XPfbN4MDwsWM8mSxhHlw72m2n6vua277b3cWOecRDfuI7ZKcBXs/LLuDr2G
 gEFgHq3iapHN9v5uesfze1Am9lNYHatW4eWDQ507tih+HvYsLeL4qmEcu0qLb2fEPJui
 FjxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=58W0570Jka+/QTu+LKm1ttkum7tKXr80GanuQK2uK1w=;
 b=GB7gecUD8Od1oQYmoQkHIqCgaBsXaX8hvZAjZ1DCklZ5GnbZGt5QzzAk8TQyn40I5C
 d+UHi/ZWA1HK2P9kOmlLWkZmkJhbDzt7Zjeh39EyenCE7kF0d+gf8jHVkX5prTvZOzd2
 GS4NiOckIe5cc2XImGkNTDPBAOZrDMbeaKmP8/pKIgGRqSM7SZAh0zSsUPfrQSM/S+om
 Jg536hJ9ETWJIRSSDnYgier03C8++7s9IS0fVNTGfCeVhYFrS4I39awn+3LNIaBIqgwD
 xjdXMAq9D9mXY6v2JvvJnLbQU+Va04EKfG/oAGrnipkdtnkYzmL+ncyO3fjBZ2yGPiFM
 T2ww==
X-Gm-Message-State: AJIora9EWfPILKpLWAC7m0i5cosNsEOZzn+3Ao62290RL+43+eJKQGpu
 ETvpbrstDiVi057cl4n2tjwPG+uRrwMJXmnCOW9VpA==
X-Google-Smtp-Source: AGRyM1t8B2h4iSf3FnToRx4GmRZlAX5YHQQTp9GSUSnoNXbET+oKWKdzS2QAqfG4JGEXijeeb1NlANGuGJZk7WvCnP0=
X-Received: by 2002:a25:d381:0:b0:66e:2943:1c9d with SMTP id
 e123-20020a25d381000000b0066e29431c9dmr25475138ybf.67.1658139317617; Mon, 18
 Jul 2022 03:15:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220713172010.39163-1-ben.dooks@sifive.com>
 <d2b2a868-4e12-35f4-40e9-5e520e07cb3e@sifive.com>
In-Reply-To: <d2b2a868-4e12-35f4-40e9-5e520e07cb3e@sifive.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jul 2022 11:15:06 +0100
Message-ID: <CAFEAcA9qngx_1BzF+THHqpp4OyiSa+Do7hPKwqZ1v=0psGXrWw@mail.gmail.com>
Subject: Re: [PATCH] gpio: designware gpio driver
To: Ben Dooks <ben.dooks@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Jude Onyenegecha <jude.onyenegecha@sifive.com>,
 Sudip Mukherjee <sudip.mukherjee@sifive.com>, 
 William Salmon <william.salmon@sifive.com>,
 Adnan Chowdhury <adnan.chowdhury@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, 18 Jul 2022 at 11:05, Ben Dooks <ben.dooks@sifive.com> wrote:
>
> On 13/07/2022 18:20, Ben Dooks wrote:
> > A model for the DesignWare GPIO (v1) block.
>
> Is there anyone else who should be reviewing these that
> was missed off the original list? I'd like to get an idea
> if there is any work to do. I've got a couple more drivers
> to submit and was waiting on feedback from this before
> getting these submitted.


My overall feedback is: this isn't a pluggable device (PCI, etc),
so what's it intended to be used by? Generally we don't take
device models except when there's a board model that's using them.

thanks
-- PMM

