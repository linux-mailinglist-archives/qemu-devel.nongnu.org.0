Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4236C4AAEE7
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 11:54:32 +0100 (CET)
Received: from localhost ([::1]:36944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGfBe-00051Q-UE
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 05:54:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nGf2U-0003fN-76
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 05:45:02 -0500
Received: from [2a00:1450:4864:20::333] (port=40701
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nGf2R-0004Fm-PF
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 05:45:01 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 m126-20020a1ca384000000b0037bb8e379feso1376146wme.5
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 02:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+edp2yIAnXvWwGf29V0Q12tzpZVArxENIf5dnL+dD/E=;
 b=KVXPRa1mwhuprMel5m8VeIlcOVkQzjCT3QmobZuond33a3Xvd28daa5d5mmvOzkgRV
 wSNa37nyXUWmPiocdjSzeFnwgcQSIS3y6E0EAQmAu2Ab1gK+2X17eL7nZ4L9qFVEXxzh
 W3hTgF7kzTIDHpLLUPlmgpVBeo5dIBdDGrUwKN+BkpyomrYYypZ/nZvMxs/Hy0KKquJq
 kfpJvOTrg4ERvUO+YXjOB/adQtfErjjK9rsN3MbOUBRSx0UD/daGNUqfIDQB0CeFAze1
 YUyEMRZZsxA7FmIAB3EGmEZDrqYcSY5JzaWWeI0WXxEgqcBVrvlTsyoQSzDUIEtF3yRS
 MNtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+edp2yIAnXvWwGf29V0Q12tzpZVArxENIf5dnL+dD/E=;
 b=HvsTXR6v1lP1a6/OcM1q441rPAUJ3fc7RPBXV2E70nW2f9JGostMXwUZHBvve0ZUjD
 bmd8BojnjDYE8IwXpejHWRnRh32x3RDpdwANDDZELVEhKwqTaj4yM4INHW+4qHhJOu9h
 LyY86eyd94rLdUXgsC4+01oyb3c8EGHBHn6LoQHc6X5QCyY9ev0NytDtyQusKPur4M/l
 sT0Yngph8PJvzAw6mtOkCG9yZPd/MnovOXUxQFiAO8UPQqE75S58vX6nbHoEIHr/tq0b
 FBNigG4KfCb2unZm6cL8X5BL/sDkXETwoRdnSl/AY3xttrzGnTzKtpL0/2iIbDyUaRWm
 30kw==
X-Gm-Message-State: AOAM533c0wFYz5HJzRzL2NcVlu/ZPGoCXBdd6ikR/3+e/H47363UQcyp
 GuDRrTnmi0F4exNws2EL+noMMEtLgIuqnwhUnHLtjoI17mQ=
X-Google-Smtp-Source: ABdhPJwRQedwMV5e0dkSh5QAj5Lgjg7kCweLStsbA8h/Xg2F5gt+YD7Rtdwr74itnLBbxvkI/3OSU0Kz/AA6L28vgFU=
X-Received: by 2002:a05:600c:2d05:: with SMTP id
 x5mr4750496wmf.133.1644144298448; 
 Sun, 06 Feb 2022 02:44:58 -0800 (PST)
MIME-Version: 1.0
References: <20220205014149.1189026-1-mst@redhat.com>
 <CAFEAcA91cVDym5fVCXgHFHJ8fkt8GhrOis-EPHN6YWpVn9TOCA@mail.gmail.com>
 <20220205072452-mutt-send-email-mst@kernel.org>
 <CAFEAcA-RJ8OkwaXWx=bRHJCDoWrQvZbdSEuuyz1j9ZFod0kcfg@mail.gmail.com>
 <20220205124235-mutt-send-email-mst@kernel.org>
 <CAFEAcA_kbt0HOp=8w--ZR9g+EgZvownyrbWYseSxuArd1g4CBw@mail.gmail.com>
 <20220206042826-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220206042826-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 6 Feb 2022 10:44:47 +0000
Message-ID: <CAFEAcA8gGj-QQRtRze4vq=cM4nges32QL5ac6vddEXC=GQ0TeQ@mail.gmail.com>
Subject: Re: [PULL 00/32] virtio,pc: features, cleanups, fixes
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 6 Feb 2022 at 09:29, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Sat, Feb 05, 2022 at 09:05:12PM +0000, Peter Maydell wrote:
> > On the build-tsan and build-cfi-x86_64 jobs and also on macos
> > (this is a "clang is pickier than gcc about unused functions" one):
> > https://gitlab.com/qemu-project/qemu/-/jobs/2058536617
> > https://gitlab.com/qemu-project/qemu/-/jobs/2058536571
> >
> > ../tests/qtest/erst-test.c:91:20: error: unused function 'out_reg64'
> > [-Werror,-Wunused-function]
> > static inline void out_reg64(ERSTState *s, unsigned reg, uint64_t v)
> > ^
>
>
> That's a weird one - it's static inline, compiler should not warn I
> think. compiler bug? I can drop this for sure but still. Is this
> what we should be doing?

This is a gcc-vs-clang difference. gcc will not warn about any
unused "static inline" function. clang will not warn for them
in .h files but will warn for them in .c files.

In this case clang is entirely correct -- the function is defined
and never used, not even conditionally depending on #ifdefs.

thanks
-- PMM

