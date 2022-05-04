Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A321751A002
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 14:51:38 +0200 (CEST)
Received: from localhost ([::1]:51718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmETg-0000EC-D3
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 08:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmEQz-0006U9-4M
 for qemu-devel@nongnu.org; Wed, 04 May 2022 08:48:49 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:44573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmEQv-000332-Hu
 for qemu-devel@nongnu.org; Wed, 04 May 2022 08:48:48 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2f7d621d1caso13795677b3.11
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 05:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aA21QJau93yJY0f6ApjYpQM9mFYXJPwWAUXqbfjMDQY=;
 b=wsBomK/qUzb5xmXuduIdHi1G7/OPExAf7MfG2ostUmpQeF5vHrn4CzxH23wDGKZRzM
 PAs7yNkoMYHsqmgGjS6rsD/ZclfsBMBySR0lHltlWrJiJZB23iMnu3rwLoOalB4KF4ZM
 LsAK4Is2My4m0OWRWNbHim+gLXPzNmucjLd4YSAAy6tng208NSvCWTqpRyrAk5EL5eNO
 c66Imw7r09AnfnzZdz+KiFah+V/nUVCNgJ7CwsU9ISLBviMaErDiN6hdzAxzusq1MYaC
 m4M3wQSw8SY269XiLtlbww8bxcg21mT5sY9bmyVXIY1eYvJa8JQICBsXY35+G6YbJxyO
 gJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aA21QJau93yJY0f6ApjYpQM9mFYXJPwWAUXqbfjMDQY=;
 b=Sw+KlLmFW4W8iyKuNxiLxEtXWTkwUsQ7PJttAFEbZNL3EgbKXxS01HjZhCr4BpCAYS
 xUVJoANArEnp235nDRkQp4wdO3sOE/q9FwwcQ1S9aeoxnA57RRz2aaeyzZxNFzXxYAuw
 KrE8dIiqEeU4KSaNsi0+XifmEqCIyGcB00hQLguh+0wciIjsKio5AM4jKd7je+ChLUMe
 QOEemy92ZSwiUhDqp1iLpgln56Xa+dy443NaXIg4EpGYb+BlBdR8BPOs2yrhxQzKVvlS
 rV2uqTwWyFeKC84wYZnF2qolyaYWnwb8cLFoBRLebAjAhef2KbPD4L923ZcRnhG2LrFW
 seyQ==
X-Gm-Message-State: AOAM531JtIMlgS8igLLO4cDEWXwWFHLHUb+6R5sWt9R7XztkkeepAhVA
 v4qUj7iVO2ZAsRJdPCIqXN9ctK9Nmas9l0dqdxXHXQ==
X-Google-Smtp-Source: ABdhPJzbC2GU/VXG0R9RNppvsbjaw2ch+d0QRCYVplC2CvC3jPXuNuFtZtxwtlmAoJDwbX3cvpxuZCrcZEFsSlvpAfk=
X-Received: by 2002:a81:1dcf:0:b0:2fa:d094:14ff with SMTP id
 d198-20020a811dcf000000b002fad09414ffmr6539988ywd.10.1651668524444; Wed, 04
 May 2022 05:48:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220428132717.84190-1-alex.zuepke@tum.de>
 <243a815b-8aa6-6862-33de-81e00ca5c468@tum.de>
In-Reply-To: <243a815b-8aa6-6862-33de-81e00ca5c468@tum.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 May 2022 13:48:33 +0100
Message-ID: <CAFEAcA-W=Z4VkNGFzSi0i1A3tQKHAeOr8e61HPJqxUZawQq5-w@mail.gmail.com>
Subject: Re: [PATCH] target/arm: read access to performance counters from EL0
To: Alex Zuepke <alex.zuepke@tum.de>
Cc: "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Wed, 4 May 2022 at 09:20, Alex Zuepke <alex.zuepke@tum.de> wrote:
>
> Hi,
>
> wanted to ping again on this issue before it gets lost.

Thanks for the ping; this is on my to-review queue and I'll probably
get to it later this week.

-- PMM

