Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEE92B9A93
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 19:28:11 +0100 (CET)
Received: from localhost ([::1]:42308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfofC-0000Za-Q5
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 13:28:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfodR-00083h-VH
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 13:26:21 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:34827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfodP-0003rN-Vo
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 13:26:21 -0500
Received: by mail-ej1-x635.google.com with SMTP id f23so9316956ejk.2
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 10:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eL9isAmCAAHl7zj4oJb8/ncVnpz8WQrlwXXWyB7tEPE=;
 b=muwtat5GwATyBDsLRMCK0t74Zk3vrm66plIRwohoZfE4rGuwimwfZwgZyZsT8eqhVT
 V9eMgfAxjFuxcmSC/+bsqNM6NnuTQZhLIBCFEN0enlxrHYy4D3XKnYE1+jt5lTLEBx1s
 xY79aBU0MC/wW4Z0qv+runnI9YJgr5fn6+ccBe2kiINgkpk52sJjWGxE3RdOM4qBYEsT
 /Y26//S52IZJNSTmK5n8wYU1/0iHxRzWvlZm6ky1eFv+epWnBBbMrn8jtqmTMlLb/ExW
 gYPL+qNhepjq2pl7Bb37K4/i1aTMf74VO6SOhAJ1MQ5gCeYhuAp07kg50A0ZFqlPRzzS
 ZdpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eL9isAmCAAHl7zj4oJb8/ncVnpz8WQrlwXXWyB7tEPE=;
 b=WjizZn7kIyxYRM7HODiysQHutXazfaAX47DCAT60zLjuzDbXdGC4xYjKsCViD+YNDE
 Pebtpy4CrHZ3X2CxuvGNkLgkU4boiHtzVwwVVHws0XghsR0iJuaaFUP6be3mKyJ48Iga
 RtFuMC3zVe1ifURf6MUr5mwwH3v4hKUQV/vuddj26mqqBfSfVJckcdRN7mF9TS5IZjhx
 e5a3MtvIa3aj+SDdfkY+dLi088Qae4uaheZUjjqVvm9Dp7pnWVWlSa2nNJGDhTuKQFgZ
 mwaSn0+pKCu9Ya1TXaJMBoXxxhApsyVhd0oT0hhpAF1zkFMhJgpuVYbeh7etqTm2QAcu
 6kxw==
X-Gm-Message-State: AOAM530C1bS4AVgSXlxSw0UIJ2GNbA66DyzX7AuoTPtv81hctR4Hzdpf
 fTgI9RzAgb+RJci8KJjfgYdVqP391/iujVLZpCIUKA==
X-Google-Smtp-Source: ABdhPJwKlWexxYVrUVJn/BtEgSZ1H6eAAhun3PsSNTckjQ4yeV2XSBVaOn2snqSGAn7TOZKprgcQYM2UImbq15IcCFM=
X-Received: by 2002:a17:906:680d:: with SMTP id
 k13mr1332751ejr.482.1605810378215; 
 Thu, 19 Nov 2020 10:26:18 -0800 (PST)
MIME-Version: 1.0
References: <20201119164758.939980-1-stefanha@redhat.com>
In-Reply-To: <20201119164758.939980-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Nov 2020 18:26:07 +0000
Message-ID: <CAFEAcA9ur=byZYSbaD9Q=K_+M1Fa0N_Aded_ECxkcrBJcxvgUw@mail.gmail.com>
Subject: Re: [PULL for-5.2 0/1] Tracing patches
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 19 Nov 2020 at 16:48, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The following changes since commit ff85db769ffd431f86d263d5e954e809a83be92f:
>
>   Merge remote-tracking branch 'remotes/cohuck/tags/s390x-20201119' into staging (2020-11-19 10:36:53 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stefanha/qemu.git tags/tracing-pull-request
>
> for you to fetch changes up to 4b265c79a85bb35abe19aacea6954c1616521639:
>
>   trace: use STAP_SDT_V2 to work around symbol visibility (2020-11-19 16:41:09 +0000)
>
> ----------------------------------------------------------------
> Pull request
>
> Fix --enable-modules --enable-trace-backends=dtrace with recent SystemTap
> releases.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

