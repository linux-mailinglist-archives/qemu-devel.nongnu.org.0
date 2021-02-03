Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7785E30DD45
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 15:53:33 +0100 (CET)
Received: from localhost ([::1]:36206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7JXA-0003TI-Gp
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 09:53:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7JVd-00029j-5G
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:51:57 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:40945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7JVa-0004ks-0I
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:51:56 -0500
Received: by mail-ed1-x533.google.com with SMTP id s3so13491903edi.7
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 06:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AFZD98nX5t3RgZfI3RQ3atbjCIcVW9hw1/Cb3+3gSNc=;
 b=bYxEgJj8i5LRfCNbwE//WbfKqMIrA+Y0BaGY1qHOFLhSknivQvcFAePFuYPNuh6Qyx
 NR2vTbJokwXtStACBSLFVTr+Pt4Mv8OPz7vi2jDKkPUbo0E0i+qDlwlcU0/z+H4hjix2
 okv0dkPPmxCvFeF+/Dt64F1Ec3qcOl5IQ+Jlv9thHd8fcYh4uHS7unQXdLDEgrzvjQiG
 +eLtCCvp+n4ur4XKE3ylLZKz2vV41iNSWYfqnaPYOQZIZIswXbOjya9QphkAKEWTR7L8
 dTbewEcji+Ia4XchM6T4xu5DZMnI7cCQqRaUddAVD16p+wrxkt8/f8QUg6pFUXJ8let7
 aOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AFZD98nX5t3RgZfI3RQ3atbjCIcVW9hw1/Cb3+3gSNc=;
 b=Qgc9mF+Da3AVvq/lLBt1wnLaeTZZSSR1WTpTkbmhBPSW5hpmjRg3P+SrqG/w8AeFxM
 QDecvKc5gLctDSZXKUVoQ2NndXcc+y+sz2iC8jZ2lFljLzUqiHJSADE/zPMbaCPsAQGs
 PeJCMF5fo9fTlQC8YTft4zYtksQo1cdEhWjeeuAFA48sSM4Ro+ohTfgeHgrkltEpSjVD
 K9VM5moJuabDUefdjXpo0nlFnr04PKaINtAvYXhrGzPkqCX539/01YPB2I5JY8WQyeUn
 R+BzZta8Z+sjZNaKfm2h0l3I1ZLiSVX7AhRQxkyoZhDtnbNcddsIh9mnGVc+Ivge66aC
 lcVA==
X-Gm-Message-State: AOAM530xrpKc2Qi4VtLWa8UjXSMSY+bgktADXAQOTg8CT8rZRENbP2bV
 mzJ+v+L5Kat2NcnRrsxrSWw8B7DKQAMCasRawwwb4Q==
X-Google-Smtp-Source: ABdhPJz/50dGc+hJn5pk0WGQt4/q1a8wvrfXVG75f7Sdm9Ss7OnUYdKyerwuSV6EhlsqaCqRKjGHMAROYGQkNDAxV/k=
X-Received: by 2002:aa7:dd12:: with SMTP id i18mr3328500edv.36.1612363912398; 
 Wed, 03 Feb 2021 06:51:52 -0800 (PST)
MIME-Version: 1.0
References: <20210203132451.158395-1-pbonzini@redhat.com>
In-Reply-To: <20210203132451.158395-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 Feb 2021 14:51:41 +0000
Message-ID: <CAFEAcA8sDLbQRtwafGzddRPm2YCM4xcngSvsPVzkvpKi0sfvmA@mail.gmail.com>
Subject: Re: [PULL v4 00/36] Misc patches (buildsys, i386,
 fuzzing) for 2021-01-29
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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

On Wed, 3 Feb 2021 at 13:27, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit cf7ca7d5b9faca13f1f8e3ea92cfb2f741eb0c0e:
>
>   Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/tracing-pull-request' into staging (2021-02-01 16:28:00 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 4e1cd7b1d59727ae471bae95db4002739eda085b:
>
>   pc-bios/descriptors: fix paths in json files (2021-02-03 14:20:21 +0100)
>
> ----------------------------------------------------------------
> * Fuzzing improvements (Qiuhao, Alexander)
> * i386: Fix BMI decoding for instructions with the 0x66 prefix (David)
> * initial attempt at fixing event_notifier emulation (Maxim)
> * i386: PKS emulation, fix for "qemu-system-i386 -cpu host" (myself)
> * meson: RBD test fixes (myself)
> * meson: TCI warnings (Philippe)
> * Leaner build for --disable-guest-agent, --disable-system and
>   --disable-tools (Philippe, Stefan)
> * --enable-tcg-interpreter fix (Richard)
> * i386: SVM feature bits (Wei)
> * HVF bugfix (Alex)
> * KVM bugfix (Thomas)

Fails to build, OSX:

../../target/i386/hvf/hvf.c:739:41: error: no member named 'hvf' in
'struct CPUState'
                env->cr[4] = rvmcs(cpu->hvf->fd, VMCS_GUEST_CR4);
                                   ~~~  ^
1 error generated.

Looks like Alex's hvf patch was based on some of the hvf
refactoring in his "hvf: Implement Apple Silicon support" patchset,
so it needs changes to work with current master.

thanks
-- PMM

