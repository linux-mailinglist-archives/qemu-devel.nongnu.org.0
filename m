Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA28569D1B4
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 17:52:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU9Ny-00057f-Dz; Mon, 20 Feb 2023 11:51:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pU9Nw-00055h-W2
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 11:51:29 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pU9Nu-0008C4-He
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 11:51:28 -0500
Received: by mail-pl1-x629.google.com with SMTP id ko13so2783823plb.13
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 08:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=X5FJk2ng5r/hBG4SF/doTLdyE8K6R1FaA/ifVw+43fI=;
 b=Q3fUO/gcn23baHjpsSNZIXSgsQTa9uGUjJfV5NQ6SGXOTMpd8vU2FZH62Uo2uthuaN
 xMHWASG/MYgJahQpczevW1Oc/NCYD2o4NCFjTSqjq7jMxH8Q48w41qQNaSnQyo5R4h72
 hJ4CAN/WS5DDn/LnvG6Ks3ceJ4/33OTpVKHoh3XnvUvrExeWj4l9Fgl2mKqi+Qbxi9pO
 wuASpnYq4SiZU/1KiYzem3uRcFKDaUsuR3B/T9/G3tTflBm+EanHWPbqvI2HgJS7oArL
 BU/GTucqIYbZX5PcNSTcfPQYOTglIZfcC1VAnQ1ZEp3xZgWQeqd9SelfWUHS71njF8Nk
 2gIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X5FJk2ng5r/hBG4SF/doTLdyE8K6R1FaA/ifVw+43fI=;
 b=oDSbYzan5H3IkR9zmQQ0eJzTjBCs/ppBqggNbWlqxFdEe7SrZdD5ZUwh187VDuXbKt
 4KfK5MA7G+c2bRkqslDSkNfSoDtIGrScF60Pc6r3jNkTQ9P1OCudqmmk99lHQy4ix+Zo
 W6ZSHXMV8kJq/IjRjg3nLnJb8+E4r6vl8dFa5qE8osLOo6C2qZcV1gguI54OKtiG2KgB
 GqdVrxsX5UYXr4REFi7LMPogpFTFih86kbLwO9LyPYQgT9z3zAYXuBJzuLO+9iDZFSHo
 /5W8KWqHNtfRqWVPmmrxeOL+8B0hRRpWZBXV492wn+Iv4RaUxGzo7M9xPOUY/jiDiGFX
 vCSw==
X-Gm-Message-State: AO0yUKUvyioriwjPowQUYp8miyVWb/v92UovyBB1IkpHcoQPhf6Unkgh
 NZTXxruSJHfZNLWNJ8ZZS7Zzsd+QTO8p4RBJSQByLw==
X-Google-Smtp-Source: AK7set9KV+9rVHmHY00BW+CyZY3RnA7ykk602vSJwsHD+GjVyaDqFZkABxu7G+x9sJWO1+SCUupb6LY2RFHJ8N20n80=
X-Received: by 2002:a17:903:4285:b0:19a:efe3:b922 with SMTP id
 ju5-20020a170903428500b0019aefe3b922mr231233plb.9.1676911883512; Mon, 20 Feb
 2023 08:51:23 -0800 (PST)
MIME-Version: 1.0
References: <20230214163048.903964-1-richard.henderson@linaro.org>
 <20230214163048.903964-14-richard.henderson@linaro.org>
In-Reply-To: <20230214163048.903964-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Feb 2023 16:51:12 +0000
Message-ID: <CAFEAcA8bC5kR9Hg60MvrkQEDrk5-bf10=bcn=0GKr_h=nwiHpg@mail.gmail.com>
Subject: Re: [PATCH 13/14] target/arm: Export arm_v7m_get_sp_ptr
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, David Reiss <dreiss@meta.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 14 Feb 2023 at 16:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: David Reiss <dreiss@meta.com>
>
> Allow the function to be used outside of m_helper.c.
> Move to be outside of ifndef CONFIG_USER_ONLY block.
> Rename from get_v7m_sp_ptr.
>
> Signed-off-by: David Reiss <dreiss@meta.com>
> [rth: Split out of a larger patch]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/internals.h | 10 +++++
>  target/arm/m_helper.c  | 84 +++++++++++++++++++++---------------------
>  2 files changed, 51 insertions(+), 43 deletions(-)

Depending on the ifdeffery in patch 14, if all the callsites
are inside ifndef CONFIG_USER_ONLY then we won't need to
move the function definition. Otherwise:

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

