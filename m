Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 648383BDF2E
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 00:01:28 +0200 (CEST)
Received: from localhost ([::1]:41416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0t8B-0007ie-7S
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 18:01:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0t6p-0006hE-9v
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 18:00:03 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:38651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0t6n-0007xz-EL
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 18:00:02 -0400
Received: by mail-ej1-x62c.google.com with SMTP id gb6so19916753ejc.5
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 15:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u3CfwP6nDU0v9OiIGVM0Rzn82e3Ctj6sm9NvPWX90qw=;
 b=Tfge9qhuJMsD+VghDg85orssqHXAy8fsMa/E5PgHQwAPg2mJh3QlUqhBgVGMT+Ur/M
 DbsaCQpVUwUD4A7gujPUH6l/fA0HLVx+SGLpK/QfR2K34gqU7qxoIrC/mWDEnOaootLc
 DifeEBuvh7xkkT9oTmcd1ZeRWnnXsJAsOoY6hs8FzNiPoregzOmjfFG89BwDgsZ13Hmp
 AXewDRq2Cd1XPA57sUap61Y5TeISK5BaTtZqC5z+9A2eXHAxdCNNGL0HWWu2i0wDHstE
 28X/gxVWQpAUzujYvj76+lHtZRoN4M2/LcZ1DsJ+8OlPDWGkpg4abRihxIrbxSekG8M+
 aDaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u3CfwP6nDU0v9OiIGVM0Rzn82e3Ctj6sm9NvPWX90qw=;
 b=MZ5g/HCPjw0X3rBQfVHzkC7uJ9mecigXTpR10YMGDCdEncws3GOVoMGobOE054JJWq
 QmzJOJ9olibMt/PZLzdLoC4fecEqe7DbZtfMbdUvxZshjE8fko/abdRPnFGnLxNX7LY6
 s8PtUnqRAmbyFNVbZwK0M/qvRAbHdBuMSZM/ZGVGPQMI35iWuWOFKvf5udF034bgK1KU
 xSRqjo+g3ME68OCXqxh4t0/zlfp7yyGC45W2jO6B814gmLH5yWtyqENwRWy/ysarkpc+
 fmbEi8kNoOCrzAAaWZPACoCjIPvF8FIf+GuGV6ODc9P49rVVMqj7pkuB8whOGw8OdyBv
 86PQ==
X-Gm-Message-State: AOAM533T2Qsjb5oZ+LmEO8tioXnjs9BAS9MqxhZtDlTryYkarRg60mcv
 quCUZwT4e70ut+zC2lBHtU17puNTntRlrioc5Qbzgw==
X-Google-Smtp-Source: ABdhPJyVgt0ZEEFhz5pLllw4nKXFjBmcktFk2z4BF22x3JHDQVkGmh9ToKvqany+ar9LQOLKUXBHOWEBY59QIHhVGZg=
X-Received: by 2002:a17:906:99c2:: with SMTP id
 s2mr15389803ejn.482.1625608799262; 
 Tue, 06 Jul 2021 14:59:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210706200558.GT2921206@minyard.net>
 <CAFEAcA-dvSPpKoJ-+ATYcBs6UuLJY1ZKwx-9WYvPyJ+0MYU4ew@mail.gmail.com>
 <20210706214535.GU2921206@minyard.net>
In-Reply-To: <20210706214535.GU2921206@minyard.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Jul 2021 22:59:21 +0100
Message-ID: <CAFEAcA8Xxxo7Ubm344nUe12jctSdBO36p+nf3uP9ZjscSJBS7Q@mail.gmail.com>
Subject: Re: [GIT PULL] I2C/IPMI bug fixes for QEMU 6.1
To: Corey Minyard <minyard@acm.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Titus Rwantare <titusr@google.com>, Hao Wu <wuhaotsh@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 6 Jul 2021 at 22:45, Corey Minyard <minyard@acm.org> wrote:
>
> Hmm, it compiled for me, I wonder if there are some compiler
> differences, but I don't see how.

I'd expect it to fail when compiling for any target where
'unsigned long' is 32 bits...

-- PMM

