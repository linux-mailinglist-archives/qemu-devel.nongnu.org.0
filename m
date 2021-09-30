Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E78641DE3D
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 17:57:20 +0200 (CEST)
Received: from localhost ([::1]:42366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVyQx-0003Rv-AD
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 11:57:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxpC-000163-9g
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:18:18 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:37445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxp9-0000Gw-NF
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:18:17 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 r83-20020a1c4456000000b0030cfc00ca5fso8769744wma.2
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 08:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=91U5ps3h9wK8xG3/LyLA4HyG2k6i0YWX5UKYUIaHQ98=;
 b=YroE9m2vMdo28Qpgfeuhjta+JcJmRTM4OklqXKbpKcKU/XKJxjBe/5E6xbdGDyyrAj
 UyahEOOghAjjUzrRKbJ8qBrkRHvFfZOnJFcgPhbHSTOiey4v0PXZg97bqP5Qmw7o64J3
 JpGDoY1wHmu2GmJzsvHhvdehZNPT4LVIhfkAwkIJ6v+pdItatEOqKL3e02+SaNGHS9Z9
 jxQvMIlkAb9Xn2rTGfSLcwxBsRbiqA8OxAfMJaBtzlpYR5W7LONW2RxxILhLTWV3m9jv
 BGBwUsoWxlTJT27KCFKjenKhi6DZPapkUpLvMCGxOcRTdokh+dAt7p40BGKrrVOgVPPP
 mhng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=91U5ps3h9wK8xG3/LyLA4HyG2k6i0YWX5UKYUIaHQ98=;
 b=nQTNBU5LRSnmhIZHTtgHtR7Y1dCJ8jx9g/bE55hu+kvcdjXwKSTIpGkMuV77D7yzW/
 6dIdyal2hxSyD9Ryy67lUnfaCTbIJ9gHGtEDRreRyazT8cgZtphBBhKO5c7g+pWJ33G/
 g0v6uQs/WqHvA7OkpFeFS1sTXchkbCGanDmRLO6c4L85h/0eZ/bwyRNJpgJGO3bbPjOH
 lhNOaFShEKFeSq7bfVVIAc0q3v+dT4ZefWlfaXSxQfQyIaJDCuVpsb8utWLB+TLqSU0x
 yut3IbBzk+Zv545JgYZjRjyVGPiUB0t9Y0fQo46oFKk0oZqyW7sRv/UIc6rX96L2SqFJ
 Ma1Q==
X-Gm-Message-State: AOAM5322Vhfp230KmNTHAF1sgfATY7RSlb5c99q9KauWF50mMETm2J5/
 iP+CskOg2+U1+EYd4glj92SC/K+QcaaADNOmHiIEnA==
X-Google-Smtp-Source: ABdhPJwN7C5Fnx898L5bGRk0K8q+LIinMCgq/uXXZirmjQDjicfvyEFZV2KpkR72A5UydECgOTBOE7TvvoztLoPGwMU=
X-Received: by 2002:a05:600c:1988:: with SMTP id
 t8mr16469616wmq.21.1633015093908; 
 Thu, 30 Sep 2021 08:18:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210930133250.181156-1-pbonzini@redhat.com>
 <20210930133250.181156-7-pbonzini@redhat.com>
In-Reply-To: <20210930133250.181156-7-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Sep 2021 16:17:20 +0100
Message-ID: <CAFEAcA9XtF7fNgF_tqz8Oo1Qpqe50TTJ04SB0Co++n56yuabGQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] docs: move gcov section at the end of testing.rst
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

On Thu, 30 Sept 2021 at 14:33, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> gcov testing applies to all tests, not just make check.  Move it
> out of the make check section.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  docs/devel/testing.rst | 38 +++++++++++++++++++-------------------
>  1 file changed, 19 insertions(+), 19 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

