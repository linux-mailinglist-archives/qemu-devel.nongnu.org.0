Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF4A3AEA83
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 15:53:42 +0200 (CEST)
Received: from localhost ([::1]:46936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvKMu-0002Nn-Ur
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 09:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvKLd-0001KJ-Fh
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 09:52:21 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:44776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvKLb-0001Zw-TM
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 09:52:21 -0400
Received: by mail-ej1-x62d.google.com with SMTP id gt18so28892246ejc.11
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 06:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2uPMCg0kTyBS4ZUI7SMP4KNmuH+dV9VzH38ND5qAqv0=;
 b=I8g2yeLEa9SoBlC8lm1WEjzC9BBRR408BAjbWmZA8NPFYet/kYa//cvQad20x7M0gQ
 J5rh3GW+PhthpVMMHz3Gt6UI4SyLS8LidtwGLDLFvtXt98ujPbFMQV2FZdhkjySbYTue
 MgmhfegSlSQOfenghYpX0TBfBMwNXSOcMuuK9xc5+TgpQzJQyt/oRUOPU3bSf0W8i2aA
 bOWrzjjmEsw68xA3u7DvGLs69a+O3OFMFFgEoeVRswEQW6qNO9Lq7nsZlmkbPzTJ+0TT
 mdLgnhgzAzYpVUgYCWZ82fpUvIziEIXeYs11TLXguN+Ds/aVkCBixSMuIyAKGDoL0ONu
 nZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2uPMCg0kTyBS4ZUI7SMP4KNmuH+dV9VzH38ND5qAqv0=;
 b=M3UZS1UuanMY3aImjYCh9PGQRV/3ozjsN/8jgfh2UzETHeyVj91Ptp5tW93hOUTsAE
 3WQMVvUXzairXlc6jtBhTDBWmWCZ156d6z+7JUVM2Q00KhYTffJhoxgd6GXqa5LxKIF6
 dMpEgIukIpu5ecHM+Un+/u+Js7y+RAk66KQEsUdhsBsv1Q6lgjiRokHnpbYlfVrAD+Fv
 FMoAiV9ubmj/aXk5nh+98MQNjM8DEcrOXBZNRG0kuGdGZ+Nj/Iu8rDVyEnOVfRF6qSty
 3QG+zron27UMCNnSKFy7XOVMLz9N2ZZBNeIrhPs1LRmrdaj4UKtnJXthtc00VzfvqqzX
 SfXQ==
X-Gm-Message-State: AOAM531gflxZdyjD5FSPw6DNhsJqEN3763GzUBh1lazFh0TJyyWBf8OS
 ypBaTsB/u4rPVfkQ/qLn98O5Ey+3IfCP35AQaC7cVA==
X-Google-Smtp-Source: ABdhPJzm4gIqYZDkGIRWbl0BLMHS/xZR7LpP2ltri4M84xtaFaGToPrkxHWbor9qljAMEws37uDD31Nq7KERWJgVhMw=
X-Received: by 2002:a17:907:a064:: with SMTP id
 ia4mr23220685ejc.482.1624283538175; 
 Mon, 21 Jun 2021 06:52:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-2-richard.henderson@linaro.org>
 <CAFEAcA9ktX0famPUabJ3J_nhBp7CHOzd7S_auHEML7kPi9Yysw@mail.gmail.com>
In-Reply-To: <CAFEAcA9ktX0famPUabJ3J_nhBp7CHOzd7S_auHEML7kPi9Yysw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jun 2021 14:51:42 +0100
Message-ID: <CAFEAcA9Rg9O7n24Jpee3BxyE35e5z+a7m8CiQqJqeJ9hNffYjQ@mail.gmail.com>
Subject: Re: [PATCH 01/28] tcg: Add flags argument to bswap opcodes
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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

On Mon, 21 Jun 2021 at 14:41, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 14 Jun 2021 at 09:43, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > This will eventually simplify front-end usage, and will allow
> > backends to unset TCG_TARGET_HAS_MEMORY_BSWAP without loss of
> > optimization.
> >
> > The argument is added during expansion, not currently exposed
> > to the front end translators.  Non-zero values are not yet
> > supported by any backends.
>
> Here we say non-zero values are not yet supported by the backend...

Looking at the tcg/README docs, I think what you mean is that
at the moment all the backends assume/require that the caller passes
one of TCG_BSWAP_IZ or (TCG_BSWAP_IZ | TCG_BSWAP_OZ), since the
pre-flags implementation requires the top bytes to be zero and leaves
them that way. But then the parts of your patch that pass in a zero
flags word would be wrong...

-- PMM

