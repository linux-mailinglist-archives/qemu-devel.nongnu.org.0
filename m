Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E05315020
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 14:27:28 +0100 (CET)
Received: from localhost ([::1]:60588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9T39-0008QA-Nz
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 08:27:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9T0P-0006rj-PV
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:24:37 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:36086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9T0M-00025p-MH
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:24:37 -0500
Received: by mail-ej1-x632.google.com with SMTP id lg21so31388585ejb.3
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 05:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2in+IWQD+rdh2SLim7ww73U482++9rK4snIjHqzDI2g=;
 b=ZAYVQtZ/rGn9jMKtHtJ4itgmUVBDTNMacP5EmdoeBABbguCj7a/G/SzFKi7QmsCCzg
 0/xnjwKCv7A2awSN75+aQKivpmjPxCaZWs6/VrSRj6lqNbiRb5Ufgb0Y98+KS1MuRJWO
 n4TQPJp4nJVf6sARzx5PsyRrzNaXmNPEIB8XtJgy4GYHfzelsQnnspSTK95xTUYPIvom
 TDCYUFH/vBCR9nbRG2U979xvhK2Thc9QgGuXi++Wanuzg1TmA1uKtptw7JTjr8BzMRXN
 Ij1e8kWDZtTRLEwRQGEU4dGh0Qxo+WZFj7/z5ZpIInr2jvmN6+ebV10YNULxZUIUKSV5
 5LnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2in+IWQD+rdh2SLim7ww73U482++9rK4snIjHqzDI2g=;
 b=mvnsfFT3tq/KehZeUrIqYUwjF0/Jd1w9nEXLlqU4nkITQP/odkMVxZnNWOiw2F2YXv
 0M9A/JYJc3lx0bYiS/oTrD3WrsVh3ny/4b1Y/R23NkAFBhdIyRWrP/lMAolviku9n9I8
 YGkCcygMOccuJcMrdlh8dO5QRf05sE89u8BYSfjzzpnybUcQV1tw1qAC7WQe0SdgE+8h
 OAewPj12ZKMJwgWoGmn+DfNfTzo/CVCgoz41pu74smJdjayrlzsZv23imwHedtO2fFpm
 +Pi0DietkqrN6WMLmEA7zzg+R64ChGrpIlRSZP7b3qabGrwqG5hBMdMge7MUcJ62t94P
 7yEQ==
X-Gm-Message-State: AOAM532S8kkhv8RVpsh/CmiXMUsPA3/6PYvo+VDa+vfvt+1gbdGNNoZe
 Z1obsot2ABQ+7Gi6Rr4vCgPvKoxrAr4Mbk6BG11qUw==
X-Google-Smtp-Source: ABdhPJx8Q+7lD0DKp9tSPbGCmMeYzFFqcOe0zvPx/EseOC8vOsKazo7ouPLlgedF63TgdINVhhWd1uonP4TS2h9TAmg=
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr23036310ejd.250.1612877072818; 
 Tue, 09 Feb 2021 05:24:32 -0800 (PST)
MIME-Version: 1.0
References: <20210208182331.58897-1-pbonzini@redhat.com>
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Feb 2021 13:24:21 +0000
Message-ID: <CAFEAcA-CM1NyiFvMOOWeWnOwQ1UjA99scS31twXi7Vus8L6FFg@mail.gmail.com>
Subject: Re: [PULL 00/46] Misc patches for 2021-02-08
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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

On Mon, 8 Feb 2021 at 22:50, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 6f0e9c26dbae9ac18b89d359791008fe3432ca91:
>
>   Merge remote-tracking branch 'remotes/dg-gitlab/tags/cgs-pull-request' into staging (2021-02-08 11:11:26 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 52a44ad2b92ba4cd81c2b271cd5e4a2d820e91fc:
>
>   target/i386: Expose VMX entry/exit load pkrs control bits (2021-02-08 15:15:32 +0100)
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
> * KVM bugfix (Thomas H.)
> * Add missing MemoryRegionOps callbacks (PJP)


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

