Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 530614A888E
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 17:29:36 +0100 (CET)
Received: from localhost ([::1]:41558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFezG-0005m7-V5
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 11:29:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nFeuL-0003es-DK
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 11:24:30 -0500
Received: from [2a00:1450:4864:20::42b] (port=34493
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nFeuI-0007Ib-Vk
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 11:24:29 -0500
Received: by mail-wr1-x42b.google.com with SMTP id f17so6098766wrx.1
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 08:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6HZacZqdXx4u4KaRLwRyebg5A5+N6ALrTzUzWMe6iM8=;
 b=ALyY73JnTrzlfv9epO3kaWQbtgQeqTHfFXrR+kvJBDANiG12lWtLsdu9zs9NAxLJ8o
 uWVaqKwP++WBx6j2AdXfS9uK8clv1QQx6SfIFV0xI0VZqhk1bpw43CnUT/h3b4OA7MLi
 VTVXaYaY0dVHWPPLWjD25gwq07kDmbHW/aV3nIrsKiUyihgibbTmSminLqvLGrMlaG9S
 fAg4W10Ai0NslzxuP3PMbLuDZJgWvKvrVEKjr0s4F1/S7DyZY/3j9025Is5ww+cyQJRS
 VPQYk5qSj2JKt5XPsJZKANrTU63iUZpnTt6dtQg2uQa3lv69ZGq5EyCuTbjfpqF62I8N
 b52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6HZacZqdXx4u4KaRLwRyebg5A5+N6ALrTzUzWMe6iM8=;
 b=gcsOsk8SdsVnf5SWje8LjYXjOJbL4CZY4wIJ/x6WHO42+eiULzxYyNYevWfX5tmIv0
 kTk2lUzE3UnPMImsmsKYMYXWGeXTCQ9In4VgRHytUx7ihpVvjoXFnaBcm5/JsfCd2BDG
 Ncl2/QxvtBinuaqgm08FTAZyYPUhVqqfZgiheUh1ih9YuhcbeQHe3OE5fwwO/MZwHhNk
 05stK9UHC/PryrtyayImFi4xn8uqFCBU3Rugo5Epgjjc1byodxxWw8gSG9lmdSVsQl3C
 9zA0uNcb/9r5YF7llBvNTp+nQrRjA4/gawE+mWmYjYWS2GDtzF6wczYVTALxB6BAg0Jl
 xmlA==
X-Gm-Message-State: AOAM530zzY0gVnAWWPr8Tv8NZUfaH16C5Qj6+n6sX4diROavgjxBSYDE
 McnD543OIJ/am/K1aOtz76xh/e7/IdZANI6t9s0El1t7Ph1c3Q==
X-Google-Smtp-Source: ABdhPJzKu6nSJLm71qhIwW3riGA6atOOtW9hAUxFTdwaRy78QtiJIMhVOiV+XFyf2G4i+XaUZuHNKKJH0QU/mUdgw9Y=
X-Received: by 2002:a05:6000:258:: with SMTP id
 m24mr30841539wrz.2.1643905464556; 
 Thu, 03 Feb 2022 08:24:24 -0800 (PST)
MIME-Version: 1.0
References: <20220128101513.646792-1-pbonzini@redhat.com>
In-Reply-To: <20220128101513.646792-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Feb 2022 16:24:13 +0000
Message-ID: <CAFEAcA_ttmvA0emS-41R5+k3w_KAbFvC30qdAShJfr7U+3q=CA@mail.gmail.com>
Subject: Re: [PULL v2 00/14] Misc patches for 2022-01-27
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

On Fri, 28 Jan 2022 at 10:18, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit aeb0ae95b7f18c66158792641cb6ba0cde5789=
ab:
>
>   Merge remote-tracking branch 'remotes/jsnow-gitlab/tags/python-pull-req=
uest' into staging (2022-01-22 12:03:22 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 479ca4ccd54afcd54b0163532709079233d64b97:
>
>   configure: fix parameter expansion of --cross-cc-cflags options (2022-0=
1-28 11:13:33 +0100)
>
> ----------------------------------------------------------------
> * configure and meson fixes
> * "meson test" switch for iotests
> * deprecation of old SGX QAPI
> * unexport InterruptStatsProviderClass-related functions

Has this switch to 'meson test' for the iotests broken the
"V=3D1" support for 'make check'? I find that iotest failures
now no longer print the useful information about what went wrong;
instead you just get something like:

=E2=96=B6 1/1 qcow2 qsd-jobs                OK
1/1 qemu:block / qemu-iotests qcow2 ERROR          243.14s   exit status 1

which means we no longer are capturing enough information in
build logs to be able to diagnose failures.

thanks
-- PMM

