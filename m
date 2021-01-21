Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A352FE8F3
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 12:37:44 +0100 (CET)
Received: from localhost ([::1]:49766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2YHW-0003V6-Pd
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 06:37:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2YG4-0002v3-HQ
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 06:36:12 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:46533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2YG1-0003Cq-40
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 06:36:12 -0500
Received: by mail-ej1-x62c.google.com with SMTP id rv9so2087723ejb.13
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 03:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/uxYLEB1qhtDZqC5kd8l3FchjenP19sIED0EpzqOFMQ=;
 b=cj/qj/vECbBgfjn/xZ+aZlHTqxPEEd0Dbh6iq7KGfBU9tmu10yWCrhVzyU1IjoSnYC
 1bMTEk4+YcUQ4GzUmKxYfC7vovz6K5TcYXA84+JBQcC6I9rZy6T9mxUi5Gt141KiOgtC
 DrkFEIolCR3Jcg+5mVF85uajDIcoSGT989b87GJJm8seuscVwkQzCsqrqlfrQ8xny5Ur
 50h+wGUBBbEHBNFGeQiJvZn60PIRgrRc29Hb/uD9hZm82wXdHbjdaaHEwue394ZaMvwG
 wGyEAE35YpiYXx/PWW2wEEBMIpKmcYTN94goNr/K1PF9kzPdK/wGbz3x2AvH6Mo8Xi/r
 jsvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/uxYLEB1qhtDZqC5kd8l3FchjenP19sIED0EpzqOFMQ=;
 b=cjQ8twhbD4VuJ33KGdePqbQlrTPF39dddlRfNG1Bu7eEHRxjxPfS1ra2fWMfQEVrz/
 3mDyuIIcml/s6dBe2WQaHt4S+FRCJkbBFJ+9Uy3TyS3HQnrOKR9XLLkYtIT1CTxVb2rg
 jKbuWiJEYu46OIeeU5fo18vsAyYXpavLCGjyq9mMMBw2K+mapx9zWw8QfStTGGxINNKs
 iDOQqdGYOlT4CI7g+KbUN4lMpiQ8/H1X6e5gbnJAlkaiu7kdifVtIpHqL393cgWYSOYL
 iuJ4Ugq9AqnvcKr+fv8Sv6nz0VfLytSI0s4qGAOvjCBKDY1OPFeEhxHmhadO6hQfd7x+
 mkyQ==
X-Gm-Message-State: AOAM532PvATZFiT1Uxs/W9EkP0Msg2u6OQfRzhuYpZq9wij7PGUjuBbq
 q1SzesRKM04VCPYsQCEUbAABUNMLO96pfLKVu5zUFg==
X-Google-Smtp-Source: ABdhPJwgbfSeF0dQztkhGBFSN/dEqBaDKWhm7e7oVd1QAgqYI4VLpCfhv5C1XamEBf+PudzX9EQlLyzK+05l1tVbEC0=
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr9285881ejd.250.1611228967303; 
 Thu, 21 Jan 2021 03:36:07 -0800 (PST)
MIME-Version: 1.0
References: <20210121023657.1186241-1-eblake@redhat.com>
In-Reply-To: <20210121023657.1186241-1-eblake@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Jan 2021 11:35:56 +0000
Message-ID: <CAFEAcA8eSCStz6e+nrZaFs2=t+aoHDL1=CQvtVCiM5i-Pz-gCw@mail.gmail.com>
Subject: Re: [PULL 00/13] NBD patches through 2021-01-20
To: Eric Blake <eblake@redhat.com>
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 21 Jan 2021 at 02:39, Eric Blake <eblake@redhat.com> wrote:
>
> The following changes since commit 48202c712412c803ddb56365c7bca322aa4e7506:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210119-1' into staging (2021-01-19 15:47:23 +0000)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2021-01-20
>
> for you to fetch changes up to f874e7fa3b6583c79a74aea9e781af920ddd8091:
>
>   iotests.py: qemu_io(): reuse qemu_tool_pipe_and_status() (2021-01-20 20:24:51 -0600)
>
> ----------------------------------------------------------------
> nbd patches for 2021-01-20
>
> - minor resource leak fixes in qemu-nbd
> - ensure proper aio context when nbd server uses iothreads
> - iotest refactorings in preparation for rewriting ./check to be more
> flexible, and preparing for more nbd server reconnect features
>



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

