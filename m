Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB54931C996
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 12:22:22 +0100 (CET)
Received: from localhost ([::1]:44998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lByQw-0000ma-0X
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 06:22:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lByP5-0000A3-Q0
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 06:20:27 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:35757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lByP2-0003nS-Qn
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 06:20:27 -0500
Received: by mail-ej1-x632.google.com with SMTP id g5so12398893ejt.2
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 03:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cr4QwzwU2wpdvusmlXrL1U64H0zNGQ44GZVIK5iBXQI=;
 b=gGvGQtsWohl3lOirr2B3sFLI5bivTmqrmMQG+db53QN+x1u4wnuG9I8qFvSU8LunjM
 QUkkb5H34CYfOb4vZloLXGBYX8OtGH2zB8dIGVrLRs1F9VgiHmwQUH4vwpK4VfMp2yMN
 VjoGqNoIbFyBSPfDA/bAZjYZoo5/zskrS2elM2wKU9NqFbmDtA6Lv5MIcRHkkZKRRFCU
 FsSm5VG5a2QMft2cLxtBtCcCg5eH9FMJPuiO6B5GopavJfcYqbfoRLoB4IEQfKUhFgR5
 61MjHOjA2Aro3PuTIwJhLjhkyeq6fE7WGj8B++cFS4r7n/rOI6ywzrinpmgAUtpK0uZn
 Fcvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cr4QwzwU2wpdvusmlXrL1U64H0zNGQ44GZVIK5iBXQI=;
 b=pk06stZ0wdcb4HbjIgvFDHydVKmjdtNBloyHm8SWhzvkNuYcs0tmbmcMF8L8y0C7QN
 maguNUGxaAQfqlKPOKnrJ5MV63pTpddrRvYJuquEKUucweSWHj26GiEsf+bewh5bOCxy
 hSmGEFfc3ZjWpVd3t6UgbEwRUZD0CDLSAwQF9U85nKPySwVNHr+qq+cvd4fQprLbJBGE
 8sT5VLcayvZX1qD5hgBUnfKUihd3owvXDMNZBiImTXu6/NP9kgtTavnT1/UFf9h173P7
 lwDG83YqWK1mGLKNFXb1zzq8OG43IPBWgY9cZ00LRvcQDeb0ctui4I77yhmQmU+Hjh/v
 f3tQ==
X-Gm-Message-State: AOAM5334AKBJmNCC0UnMpmGolx07iV27BScV7lqo9UcYhAOeQPJABFfy
 wbKkBTgXS6MN6tiXeouyrMIq0zQsXDTU0tjeFuCHhQ==
X-Google-Smtp-Source: ABdhPJxnNXCjLMM+bOaV4RTDYrgIj+FCggc/nfK2XCJLwInDL5f0PNTc4pmsDiWJAQNyKAQL/TrPMrDdbSvdNiE1D3w=
X-Received: by 2002:a17:906:b4a:: with SMTP id
 v10mr19409713ejg.382.1613474423172; 
 Tue, 16 Feb 2021 03:20:23 -0800 (PST)
MIME-Version: 1.0
References: <cover.1612747873.git.haibo.xu@linaro.org>
In-Reply-To: <cover.1612747873.git.haibo.xu@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2021 11:20:11 +0000
Message-ID: <CAFEAcA9ex-yxv82ixBahQSuYphiasGtGB59nmpYZR3WXgSqw6g@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] target/arm: Add MTE support to KVM guest
To: Haibo Xu <haibo.xu@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adding the migration maintainers to the cc list, because
the real meat of this patchset is "how should the migration
of MTE tags be integrated into the migration/ram.c code",
which is pretty well out of my area of expertise...

thanks
-- PMM

On Mon, 8 Feb 2021 at 03:20, Haibo Xu <haibo.xu@linaro.org> wrote:
>
> This series add support for MTE(Memory Tagging Extension)[1]
> in KVM guest. It's based on Steven Price's kernel KVM patches
> V7[2], and has been tested to ensure that test case[3] can be
> passed in a KVM guest. Basic pre-copy migration test also passed
> between two MTE enabled kvm guest.
>
> This is a RFC patch series becuase:
> (1) Need to add some arm MTE specific codes to the ram migration
>     loop. There may be better way to do that in a more abstract way.
> (2) Only pre-copy migration is supported and tested currently,
>     post-copy as well as compress/zero page migration are still WIP.
>
> All kinds of feedbacks are very welcomed, especially for the migration
> support.
>
> Note:
> (1) To support MTE migration, tags for one page are appended to
>     the page data during ram save iteration which make it easier
>     to sync the page data and tags.
>
> [1] https://community.arm.com/developer/ip-products/processors/b/
>     processors-ip-blog/posts/enhancing-memory-safety
> [2] https://lwn.net/Articles/842827/
> [3] https://elixir.bootlin.com/linux/latest/source/Documentation/
>     arm64/memory-tagging-extension.rst
>
> Haibo Xu (5):
>   Update Linux headers with new MTE support
>   Add basic MTE support to KVM guest
>   Add APIs to get/set MTE tags
>   Add migration support for KVM guest with MTE
>   Enable the MTE support for KVM guest
>
>  hw/arm/virt.c             | 44 +++++++++++++-------
>  include/hw/arm/virt.h     |  2 +
>  include/migration/misc.h  |  1 +
>  linux-headers/linux/kvm.h | 15 +++++++
>  migration/ram.c           | 86 ++++++++++++++++++++++++++++++++++++++-
>  target/arm/cpu.c          |  2 +-
>  target/arm/kvm.c          |  9 ++++
>  target/arm/kvm64.c        | 31 ++++++++++++++
>  target/arm/kvm_arm.h      |  2 +
>  9 files changed, 176 insertions(+), 16 deletions(-)

