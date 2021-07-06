Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1893BD4A9
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 14:13:36 +0200 (CEST)
Received: from localhost ([::1]:50436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0jxG-0006a8-WF
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 08:13:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0juj-0004uU-VZ
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 08:10:58 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:44716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0juh-0004SP-Uw
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 08:10:57 -0400
Received: by mail-ed1-x536.google.com with SMTP id l24so27685034edr.11
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 05:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cqXNh3B9rxAe5QQjdfGWXUCzeuooNe9zQTzR0+mQLD0=;
 b=o8d4rzfLb9NT6ibNG9zSyJE8r9v2wcuCvE1nZTjutqreJhkkZXldtyrwbyz7e2BiGT
 0ZxGNI8kJZilF1FjjlfFhMM1DJZyApAlEEQJJcaDIaU6jWIX+qPNGFZGF7aOdOHyp45x
 PYaA/p14ALkec0rcphBs1DmZgWiDudGShuDdcV6QtPeGUfNnD9iIdRt5nvIMpjevymsq
 3Xt5dYj3CYQ0H6kMc+JfA00iDrki0np6rWar8L3832qog5IPpVfSlKB70SV11EAHufpQ
 ve8e2067bCXWpGbqd1zFXxVKx1qatu49SFcjRlrXqoRXYZKBg1cBNqT/D56Ld+X9dwzr
 T4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cqXNh3B9rxAe5QQjdfGWXUCzeuooNe9zQTzR0+mQLD0=;
 b=gwe7hpVFMWFfYt6W4ZD6Ht22EWfv+4b9G9e3JLoUbey6TD9TP4za6huplZ3V/CZOB/
 h4QB9xgzEpdyHPCJ3iwleThO9KrvhaiKZ6f15LlcWdBTx0LaTZid9cQwwEufe1gor0De
 BOGrQ30LwT9f3y/oAzsHEn/BdO46MXZ7sP5N2PlVts7WaKFesDx5YnAjNut54ryd3dZa
 L924ro8sV3zcjqQwNAHnj66IL09vpbJluFFYnOp9MDNvS5cAqG9g/bIX5BE/HC/EkQCm
 F08edcBIdboVwG2s+C/i4VrI1O0Ho5H8byCVXy6rb+eIOZM1ejVUc0cOM9tFl/xC5n4x
 bkgA==
X-Gm-Message-State: AOAM530R0MVYvflJmZKBIuwq2myUCLNe/nxVTZ1iybudyh2HqfcIi1Xi
 e6ZBnehoNLQovddf+cqNL/6O6Ezgx1g4OHFH9jyPbw==
X-Google-Smtp-Source: ABdhPJzYs99lPHmA4EYdF0xPUW/y1cjn6lsY/Ed4YoMx0gpOkq8bHrvPPpyviU+6+JRhNdSS3bX/e0CJxe3zWd5pLzk=
X-Received: by 2002:a50:99cf:: with SMTP id n15mr23019539edb.146.1625573448504; 
 Tue, 06 Jul 2021 05:10:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210706100141.303960-1-pbonzini@redhat.com>
In-Reply-To: <20210706100141.303960-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Jul 2021 13:10:10 +0100
Message-ID: <CAFEAcA_EDNyLQ1AvrqUgJX7RSfVXjkr3s_LW+zC_PCqEQptRqA@mail.gmail.com>
Subject: Re: [PULL 00/40] Misc patches for 2021-07-06
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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

On Tue, 6 Jul 2021 at 11:19, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 715167a36c2b152f6511cff690180c1254ae039f:
>
>   Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-migration-20210705a' into staging (2021-07-05 12:45:24 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 7ca6f2ad375d32e81844788dbc2b05a04cc391b5:
>
>   config-host.mak: remove unused compiler-related lines (2021-07-06 09:35:08 +0200)
>
> ----------------------------------------------------------------
> * More Meson test conversions and configure cleanups
> * Generalize XSAVE area offset so that it matches AMD processors on KVM
> * Improvements for -display and deprecation of -no-quit
> * Enable SMP configuration as a compound machine property ("-M smp.cpus=...")
> * Haiku compilation fix
> * Add icon on Darwin
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

