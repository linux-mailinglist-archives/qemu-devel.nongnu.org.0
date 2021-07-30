Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C08993DB748
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 12:40:32 +0200 (CEST)
Received: from localhost ([::1]:50748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9PwN-0001eB-RY
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 06:40:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9PvB-0000mt-UK
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 06:39:17 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:41920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9PvA-000530-Ht
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 06:39:17 -0400
Received: by mail-ed1-x52e.google.com with SMTP id x90so12476474ede.8
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 03:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lmywFJnflwU76wFQbROM6OrQ7ircdidd18ZIgbK9tfM=;
 b=ibWkzx/TOvzS5GioXJLm9gy7AYlhi9dPh9kiD9oT97AzWuvpaUEXYYc7CgynRfxJ6A
 UfyBnHGMO/fY1jpUlJ3/4h44bxQ2bRGVJEOcMxuopFObH6VorXWxhAhEQQ6Rc/VrxEly
 3gP1YdMc4csLv0Nr4nL7xHsyY9B0aIudTxSvBvBCMUugtAgy3gaO+YProzIFJGSkl15j
 WYGCFCckLBG4H4VRvLW+tozWrkmEcNptfEpzJLLV5SyJ7jCRR9EvjyHPwJrKiqWaLwct
 +D8qM4O3lBET2T3pUq0mfGfpTLVSdsBDACHbm/E6VStgLLZypZm5KoYclN1r/BPGzwzx
 xOSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lmywFJnflwU76wFQbROM6OrQ7ircdidd18ZIgbK9tfM=;
 b=bBu/ve4JyhMjWZGuUv1hEYwb4D0eMrJJju5rHcqJxmco6klkTWUJUlKLf8zfWFZ9D1
 4LGbTTsDImZLksXk95/KVYTrcrGHtFDHcpuujuwQUCAYvqX9kypbvX940qqDd5Rztbka
 h2SP5czbwExVM3UI6VF+sGfnhptvFKGH8cVbqPI/yOI7lwm8CkH1qCkD4Vcjf4Fx0NSP
 rCUTiw7bcG2QtfG2OdUTLMiSSDBIayTO/4TPgH2BeejN4qaCo1mv7CeNEslFbU52HWZR
 zN4mNKiqUfBSUaYfLt/bIlFgu2gd5CLmwb2n8oz/pgk76qMzH6tAKoo1ZII/5IVd2D14
 mnmw==
X-Gm-Message-State: AOAM531a4ft3aMe3mo5wgYQ4EmQFHeKkAIWumaxlSY+W60am8Tr21lij
 zfZJCrkf93yXolC8BE9Z0zQ48FJkPo3I8+poyAhCzg==
X-Google-Smtp-Source: ABdhPJwR3TsBfRcyQsxxFws4XitDcK1amm9SL3yKQ/s9JDRDwuhEI4rASqDi1ziq7wR42uLL58HlYzb3fTPMe0NnjoY=
X-Received: by 2002:aa7:d30e:: with SMTP id p14mr2144728edq.204.1627641555103; 
 Fri, 30 Jul 2021 03:39:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210730030821.231106-1-ishii.shuuichir@fujitsu.com>
In-Reply-To: <20210730030821.231106-1-ishii.shuuichir@fujitsu.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Jul 2021 11:38:31 +0100
Message-ID: <CAFEAcA_=685EKqdsLh=rnXPXQNSRJ+PNuDYec5LTxr_rcAbeOQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Add support for Fujitsu A64FX processor
To: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Jul 2021 at 04:08, Shuuichirou Ishii
<ishii.shuuichir@fujitsu.com> wrote:
>
> This is the v2 patch series.
>
> v2:
> No features have been added or removed from the v1 patch series. Removal
> of unused definitions that were added in excess, and consolidation of
> patches for the purpose of functional consistency.
>
> For patch 1, ARM_FEATURE_A64FX is not used in the v1 patch series, so it
> was deleted this time, and will be added again when it is used.
>
> For patch 2, since the a64fx_cp_reginfo structure is not used in the v1
> patch series, I deleted the empty definition and added the TODO in the
> aarch64_a64fx_initfn function. Also fixed the appearance, and cleaned up
> and removed some things for patch consistency.
>
> For patch 3, a64fx was added to docs/system/arm/virt.rst and
> hw/arm/virt.c respectively, as a modification to the patch consistency
> cleanup done in patch 2.

I'm afraid this isn't the way a v2 patchseries should be structured.
The idea is that a v2 series should be complete in itself, not based
on whatever v1 was. So when you make the changes requested in review
of v1, you update the commits in your local git branch, and then you
send out the patches as the v2. v2 should apply cleanly on to master,
and all the patches in it should be logically separated out changes
(with no "patch 1 makes a change and then patch 2 changes the code
that was added in patch 1" effects).

thanks
-- PMM

