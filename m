Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F273DA2F7
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 14:18:32 +0200 (CEST)
Received: from localhost ([::1]:39798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m94zf-0004r3-I0
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 08:18:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m94yW-0003uB-GO
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 08:17:20 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:40545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m94yU-0003Ct-DK
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 08:17:19 -0400
Received: by mail-ej1-x633.google.com with SMTP id oz16so10327695ejc.7
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 05:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JNHoXa+5Bric6Or6dHn7hKaQM3oeViu79IPjvn1GDro=;
 b=NXEQUVrJ8FAjGYoWwArUWXrfocMLABy+ibo+WDFLV9mQaK3pNXEQGIF7ShzQZ+pTro
 Dcdbk+vYi29+icSthgxoNGBN6EywaMgM388nmp1v8D680ziYptGFvQUcXOmQiSDr/MVK
 wZCcQX5DbQmHLfe2v2FyRboBEMIMSevyixX9cOKkQDKwspkgShDqF89mYVVDmh2YISFf
 vLb3InHuBDvD3OG9QHcJxMZG/zE9I7JZNTK0jdd2azvE/c1aaB2PRdZP9VUO9kUm0TJt
 azaLhaKm4eSR/l2qz0IzVydV+gpa+mPyZcEnBHNTl7A0V6EMNfbEAIMgxtywEW8mrgbR
 hWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JNHoXa+5Bric6Or6dHn7hKaQM3oeViu79IPjvn1GDro=;
 b=Mab++T2n1woSTRCx1TLJUOldHx5/SvlT2rRUTdUA2riBR7q8R3kBLjzvRvPS3ZaqxY
 /clCiDYuPCGjg0Wo/DBRLBypwKVFZVyO6DDJHBbtRW9BM9inOSoaMBBM73S+ty50jJvD
 TyBQo0zHcCBj+z2XA84anF5JVk/62ILEsKQGAde41ACqDC5vXna7fLMLVNqk8ksmPuTo
 VMZEFNF03o9u5OoDjar7jt6IWbA5ZNLkXgj/HI5aN1V6VK/zNeGBP5Ika48fAkCi9IUb
 RsVULeaWrf8Pjw1Gkc7imsgk2S+c0glVlSGTAZ/pPHgzu6Imh176i2MqrSs80vKis+Vm
 Z/vQ==
X-Gm-Message-State: AOAM530YVxPamShbDuHIIwR4KOgqM1NMNjH4BePSsiA+y06jRn2MyDPQ
 Mt9Bsc8d3kAY4Vy3DfHiBLXFxT/um4nsJWEvyvAOkA==
X-Google-Smtp-Source: ABdhPJyMvapZgWayFMH1l8SU+LEEdFeFxlS7jkq4m86OASg3H6VTvFiXKRnPrHrQl27KBXHMV/ZTYOWBNtj1e3gy7HU=
X-Received: by 2002:a17:906:948f:: with SMTP id
 t15mr4376958ejx.85.1627561036729; 
 Thu, 29 Jul 2021 05:17:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210729070135.422262-1-david@gibson.dropbear.id.au>
In-Reply-To: <20210729070135.422262-1-david@gibson.dropbear.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Jul 2021 13:16:34 +0100
Message-ID: <CAFEAcA8TP6eLU3yz0eU2sYyeP2qTMCXKKh99vF-a7rsdsHa+Hw@mail.gmail.com>
Subject: Re: [PULL 0/5] ppc-for-6.1 queue 20210729
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, Greg Kurz <groug@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 29 Jul 2021 at 08:01, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> The following changes since commit 69ea12b19a15ae006521cd5cc0f627f27f738746:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-misc-2021-07-27' into staging (2021-07-28 13:32:12 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.1-20210729
>
> for you to fetch changes up to 380e49297c302fdcf8e5d56abdbe07868d3af8d8:
>
>   kvm: ppc: Print meaningful message on KVM_CREATE_VM failure (2021-07-29 10:59:49 +1000)
>
> ----------------------------------------------------------------
> ppc patch queue 2021-07-29
>
> Here's a small batch of bufixes for the ppc target to go into qemu-6.1.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

