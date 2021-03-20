Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A28342E77
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 17:57:03 +0100 (CET)
Received: from localhost ([::1]:42308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNeuL-0003zO-NJ
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 12:57:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lNet6-0003Pd-Pu
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 12:55:44 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:46597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lNet5-0002K1-2U
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 12:55:44 -0400
Received: by mail-ej1-x633.google.com with SMTP id t18so14542525ejc.13
 for <qemu-devel@nongnu.org>; Sat, 20 Mar 2021 09:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iJbanrUcfAD0cuRuzNTqqSmA3kn/C9QT/3L9u79Ed2s=;
 b=JfwojN0dOUYssikwxO8LMuPfxthAE2mmYHUT6D5KZD+WY86FzBR2Y+5VgSxSu2+fWC
 CYec8eIebOMh6ESHky3L8/Y8ksmCRY2Aylp8rTVz8iY2MaLXynkpP1Q16txfLsw1G7rz
 wieZanTREpZAF0a6QGml9i4RhsB7WiUcv863IyCiDaAPbrVo7kYZaZbnM6O5fKG/9lv2
 T47oryPW/tHakdNcqhfc6CbDsTIkGm9w3uBLHyM00nip7ZYaAZrMQoj40z5huFkjGNo3
 JklSTzrW1jFSAYVHyxh0maam3fVmd23RbdNAQv5H8UDIMSdSLP6O38JvlTEbj1Ai7r9C
 d0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iJbanrUcfAD0cuRuzNTqqSmA3kn/C9QT/3L9u79Ed2s=;
 b=DTsY3862qXep1/RqTEgpgoLQSTcCAP5m2nRiyv1tdsYSeA4T4pr/4en87nqtUQhng+
 l4QHd9uCfdwT8C3lJTb9WJj9jZUmFpgC0WX2t3Ffs7CfjQHPGP+r4j3SMeXRwKZIPhuj
 FE062981r3AZKXUcnOE5fNPfp+7Fue4jnR5hd5dvYeWcfhHBej/rZJmha/cdTOfPsOwi
 q+kMva5Pw4bloAp6vABzw21gcgD6kevhoLc/d0KQoCakH10T5Kb4cxJthJVuTt00gwyU
 9qiWpOrzEbfTHTR3snXASs8oB35FNEjoIPm1SyYhyoMm2hkj28hmN38ZaT8v4bnIbH5M
 BPVg==
X-Gm-Message-State: AOAM5328X3L1n7wNZjdp7Nw5JthPKF3pzkgLCLkWRSb9BTzyvchXH+lg
 /MMhGEJTbUZcXr1TnuoWMnTo2W9JJT8JGNLN9p5RBQ==
X-Google-Smtp-Source: ABdhPJykyrBcMDb7AbyET6HLW6icVUfbmB04UUdsnvNN9u6TO+qzCUkcFfIGBv+slbQhMwiw+rCASa0mmlBouf3yJUk=
X-Received: by 2002:a17:906:16ca:: with SMTP id
 t10mr10652705ejd.85.1616259341002; 
 Sat, 20 Mar 2021 09:55:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210319143924.2173798-1-pbonzini@redhat.com>
In-Reply-To: <20210319143924.2173798-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 20 Mar 2021 16:55:14 +0000
Message-ID: <CAFEAcA_phNxvEwc_3DmZ=6iULe1XZ97_rQx+PxzvX--9cX5O5w@mail.gmail.com>
Subject: Re: [PULL 0/8] Misc bugfixes for QEMU soft freeze
To: Paolo Bonzini <pbonzini@redhat.com>
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 19 Mar 2021 at 14:42, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit cf6b56d4f2107259f52413f979a1d474dad0c1e1:
>
>   Merge remote-tracking branch 'remotes/philmd/tags/pflash-20210318' into staging (2021-03-18 23:04:41 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to af05ffffd7fa28010d4df9f5744514b16e71055d:
>
>   tests/qtest: cleanup the testcase for bug 1878642 (2021-03-19 10:37:46 -0400)
>
> ----------------------------------------------------------------
> * fixes for i386 TCG paging
> * fixes for Hyper-V enlightenments
> * avoid uninitialized variable warning
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

