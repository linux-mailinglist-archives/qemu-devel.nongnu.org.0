Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F3740541F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 15:28:10 +0200 (CEST)
Received: from localhost ([::1]:43868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOK65-00057R-LL
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 09:28:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOK4m-0003nv-Uh
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 09:26:48 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:43626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOK4l-0003tc-A9
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 09:26:48 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 n7-20020a05600c3b8700b002f8ca941d89so1401140wms.2
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 06:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ng8/SB8N3FvOfTxYqnkzKHp9I59IsBdybMXFXdT7laA=;
 b=odFQnzILMLVY9jdBoc6nXnBOlU+6KGSICZ+pFZHwi/s/KsZFXubjc1B2eAWWp55lHq
 34YAh6qtAgQcXdr5Vv+eIrp3J5eSbK5IcmTkQqk20c9eVP904PTBH+bPtuYsOHJjibYA
 JwaO1x2qVqf4OeYnOOS1JoxPiHNatBJMnba2ft5q2nLDWugDaBUSMOEjuEuy+vhAu0d2
 1he92jT1BBMZVHEOLXk3vM9NNKZYAmVFW4D/Vu773eu2+DKJ7ZquslhUoC45KGbiIuyi
 vYPLq74Panh0W5I1ucfwUzNEqkYIlJDA20SyWswC91YFEF5jMCWcMmHHpl85Gf51m4RX
 8cag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ng8/SB8N3FvOfTxYqnkzKHp9I59IsBdybMXFXdT7laA=;
 b=2nc6WAb92IEzxQ7L/sfq5AHTB1fOSQtT63WnKdmyl6OcfwymRS+JHuT3X4k8bJwB1K
 V3LhbN7CwMvZVEcPWbmcisi3s8Exe0OOtc2qgKbvllv0Wz1g+rOn0uloHJ57lKsLTYEi
 hVchYaQH8V8QoqyJ6LLagZ1ZVONLFiKYipK6GlFgAwQWJxtqFmh56sXryD6hIURa8+xd
 Hch5uwiscoR6jYdOIcWYH4J57O0S+09xmRe0VNwIJm4PY1++Xyls7fO9T8pe3Lj8xTNB
 vJvn7GDxLJUoC9IqvmJ7F8s45w9H9+Hk5CchdOiZR8AmPzYa644vPav3fRv+06Ta0JQG
 iH3A==
X-Gm-Message-State: AOAM533TZoNgD+HFi6zNVHdnTs6YjkPor5z5okyodm1WPsKuBdJ133Xv
 Om9wBLg+tlrDM27w8PtMYANrrIxQphOCc/9vZjYQbg==
X-Google-Smtp-Source: ABdhPJwOCicOxR3nxR3s/sK6ElQtmF6KbevO5XgpiyBrhOJ6pbTln0JhapnHWI3N6fQ7BmX/EvKv9DFB2kuyguxGSAE=
X-Received: by 2002:a7b:ce87:: with SMTP id q7mr3113493wmj.126.1631194005582; 
 Thu, 09 Sep 2021 06:26:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210908100426.264356-1-pbonzini@redhat.com>
In-Reply-To: <20210908100426.264356-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Sep 2021 14:25:55 +0100
Message-ID: <CAFEAcA-3GX07Ub9cEOFyC36Yj9N+G2Awq2pKg-wVJvv1Oif8Jg@mail.gmail.com>
Subject: Re: [PULL v4 00/43] (Mostly) x86 changes for 2021-09-06
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

On Wed, 8 Sept 2021 at 11:07, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit f9128631fbeb40a55f7bc145397981c963d40909:
>
>   Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-request' into staging (2021-09-07 13:24:43 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 3b942628231462c56c883a6273cf137d2a382f8f:
>
>   ebpf: only include in system emulators (2021-09-08 08:07:04 +0200)
>
> ----------------------------------------------------------------
> * SGX support (Sean, Yang)
> * vGIF and vVMLOAD/VMSAVE support (Lara)
> * Fix LA57 support in TCG (Daniel)
> * Avoid pointless warnings for static user-only compilation (Thomas)
> * Fix --disable-system compilation if libbpf is found
> * target-i386.rst restructuring
>

Philippe seems to have some review remarks on the SGX patches,
and also I found that on my local machine this was pretty
consistently hanging in the migration test. David G says there's
a maybe fix for that in another pullreq, so I'll see if that helps...

-- PMM

