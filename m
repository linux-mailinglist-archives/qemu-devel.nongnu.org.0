Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 317145FED51
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 13:46:14 +0200 (CEST)
Received: from localhost ([::1]:45676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojJ8f-0000sN-QX
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 07:46:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ojJ0u-0004Cb-Q0
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 07:38:04 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:46047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ojJ0r-0003B9-Um
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 07:38:04 -0400
Received: by mail-pg1-x52a.google.com with SMTP id r18so4055135pgr.12
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 04:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aRG8BR/IjK0Fu7mwIu3t8Q/l3cqVsdtbHs7LyCSzDA8=;
 b=q71dWE/rBnsBURF2swDUuwLNF04lco66KjL92NR/thC3jNAWKdHIUUaaJWkd0Fxiwc
 dguxJFLUY5K+G3KRv4xWffIC7CjocOyPOo3gQ87AegudSjADEeKMtsu/pnhPe1AAZ0fd
 wSc/Abo5OQ1Srzw76cx98aEapFMZZhzCgPV+pOiI+fhCbq4ik51cy6SvFoCgTuQrqnbU
 Qloewf9ebZb6usSpDgtRwwaue3IH08xs0K0FudGDhtsB7BECjUWvwyX8HSQz3I+7zob5
 YmbN4+Aq67lsh3GHelznHUpdF36umyvm7wFRAGFSStkV949X6iYh11QXrS3tDQ0tosKo
 b7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aRG8BR/IjK0Fu7mwIu3t8Q/l3cqVsdtbHs7LyCSzDA8=;
 b=PONkBED2TpPXTshz6ljeaAFDUVNX7rJFpqozAskK2FDFc26oAYP6Sh1LjPUmjb4yn4
 1JAYJFckgtHE8mlzeqKui1tOaKcqmkdI6jAc+Xl+Yq9tdBIAPI/lduKx7liUTV6+De2H
 c6ChqkuOOUq7MqeCxjsQxnsyxbfZAFkO0CMH8lYKxC5l9RAGw7EP33vBWC8eQIGYIFLn
 90nn4pYRUW2wgImi4aH5YEuO3lB90yH0pLe8nGg9PFzdvVmcAZfn4gdOuWW0Sm7uddhl
 1IzuGj3eBOtnev6+W3XelO4Rtf7u+nIOV8wa8RGWgDNQrgmI/cQi3ihD1jX4wfhv6K4N
 ChYQ==
X-Gm-Message-State: ACrzQf3OhWyzzPI2s2Aee2lT9yuhufD2ZZDw65fhnvN6+kVcUe85waAI
 1r/NhR5liqi2kQpwZcTaxq/GhdtNQwE+2cfYqwxcpA==
X-Google-Smtp-Source: AMsMyM5OX4E/g46xukSazONofNUoMp/20TGw/aVdC2CpIfhkgNEpHzZWdkz8wgOi6WMPXfbljmKPBunxzWyBnztl3vw=
X-Received: by 2002:a05:6a00:b54:b0:566:917:e57e with SMTP id
 p20-20020a056a000b5400b005660917e57emr4719755pfo.26.1665747479989; Fri, 14
 Oct 2022 04:37:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220927100347.176606-1-jean-philippe@linaro.org>
 <20220927100347.176606-5-jean-philippe@linaro.org>
 <CAFEAcA-5BDiv6sXJ_kpzCwpu20PJRQzOpS08bAswyJiFMSiT4w@mail.gmail.com>
 <CAL_Jsq+nw2g4fDr4-G3g2OL_mUkAGvNM0DJjuKqzFUijut1Hsw@mail.gmail.com>
In-Reply-To: <CAL_Jsq+nw2g4fDr4-G3g2OL_mUkAGvNM0DJjuKqzFUijut1Hsw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Oct 2022 12:37:48 +0100
Message-ID: <CAFEAcA9OWDiWh3S=0Co7Z27EtOp-1B9H7FxyQy1T2sFnTyNdqA@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] hw/arm/virt: Fix devicetree warning about the
 gpio-key node
To: Rob Herring <robh+dt@kernel.org>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-arm@nongnu.org, 
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 13 Oct 2022 at 22:47, Rob Herring <robh+dt@kernel.org> wrote:
>
> On Tue, Sep 27, 2022 at 6:56 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> > Please don't retrospectively make perfectly valid working DTs
> > non-valid. I don't see any reason to change QEMU here.
> >
> > More generally, the set of things you might want the
> > validator to warn about for a fresh new human-written DTB
> > doesn't necessarily correspond to the set of things you want
> > to enforce for a pre-existing code-generated DTB. For the
> > former it makes much more sense to impose "coding style"
> > and "naming convention" type rules.
>
> I too would like to distinguish that, but haven't come up with a way
> to do that in json-schema yet. The way schemas are applied
> independently makes that a challenge. So far it's been low on the
> priority list as any platforms with few enough warnings to get to 0
> haven't been a problem to fix (in a few cases we do end up relaxing
> the schemas).
>
> On the flip side, even existing things eventually get updated for
> coding style or evolving conventions. As long as we don't break ABIs,
> the same should apply to DT.

Yeah, but from QEMU's point of view pretty much the whole DT
*is* ABI, because we have no idea what the guest will be
doing with it, whether it is looking for things in the
"correct" way or if it happens to have hard-coded a node
name or similar: and the guest could be any of a wide
variety of operating systems or custom code, and including
pretty old versions of OSes as well as the latest-and-greatest.
This is different from Linux's handwritten device trees,
which only need to work with Linux and only with the associated
Linux version, at that. So the set of things I'm happy changing
tends to be more restricted than the set of things it's worth
cleaning up in the dt sources that ship with the kernel.

thanks
-- PMM

