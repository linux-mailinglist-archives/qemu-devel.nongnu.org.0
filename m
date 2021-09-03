Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB3F3FFB10
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 09:28:50 +0200 (CEST)
Received: from localhost ([::1]:36974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM3d2-0004LD-Ab
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 03:28:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mM3bu-0002l3-VH
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 03:27:39 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:42749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mM3bs-0007YM-TA
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 03:27:38 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 k20-20020a05600c0b5400b002e87ad6956eso2927539wmr.1
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 00:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PpnuZ+7VsYQuMl6JxVprC9fNo6To5IX2mHkPxrYHLMc=;
 b=MDDVMjwzpZx/I55GNmHeng7g3tEkR+R6adz0ay1MCv0DKqVhY4vHjR5v/kLi/otqQK
 iwRIfCVAG3bMUbc0ZNf2JtbMTFe8vFuq/QkDlaNxNjkHRvBj285daT7vsWN5pxOtxxMR
 Bjnz3yf9NdCfDTeeEzPh6k2ZZlB5Uu3iNaIZL1egS8EvnRmKc1QxwBym6RFDv1kVRUcb
 tVerqVfKzFz01UKbZSK3ewSLZ4SzW0+xMsLAoY4QKBiKKZps4MqmLCoqjUqTe9KoI/fP
 +s2ZpUkkEG78Xegcnda3gpJGgMA/SLhFCHYvvi0os6QBvh4jP6EH3OCOSdhESPhieGnw
 f9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PpnuZ+7VsYQuMl6JxVprC9fNo6To5IX2mHkPxrYHLMc=;
 b=PTX0vgjIKUhx6WxfkKbpPPNhxel5hRQ6OzMMxI6iizimzcmabPC/iroqvNwBdfXWT6
 tr52i+Y18eB2TqXGGZvrgfUucDPBkHQWhL4VWlVkKxu4RRBtz4T6D6g2SRgYdF1BulyJ
 aEZXKKqHYWZWrnBn0bf/SNmm/9rcp8pU3dLo3N3gwJQQEA2pzcLAiii6RE6ZYNhm9rrf
 JNgkTZPFFeob53fgChGC6h9Gy1ocZQuZtHSeHF2tAphNLZJ4zN/8sQuT1S7JzMXKfrsj
 mTAUpbuhqBM1SMLIvZWT176UkjqbNebEC1xAc51ij6BCDXetbn1mnoE1LXg1ILb3cRFZ
 0g3w==
X-Gm-Message-State: AOAM530XJjKO8w7KhTPxenBt6DZYzfx7DbTowqEaJFcTpWlbwbZgVh/Z
 oLDplmpHOEKqvi1oQ77HLIm490F5zwMc0rHxhuSQWQ==
X-Google-Smtp-Source: ABdhPJyWbTGvVqi1DEcSmi2UsajQbk4/Tz/HX1B1rcLMBGS/C8EAOaB1C3tiJiiWRZaQ8rykZ3ILRgg8GY9dfyzhmEM=
X-Received: by 2002:a1c:f30b:: with SMTP id q11mr6840675wmq.91.1630654055366; 
 Fri, 03 Sep 2021 00:27:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210901115004.34768-1-alxndr@bu.edu>
In-Reply-To: <20210901115004.34768-1-alxndr@bu.edu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Sep 2021 08:26:47 +0100
Message-ID: <CAFEAcA8B+s3APHs_5TAE0AsF9v007M3Kwc+nchai2xBktrQEog@mail.gmail.com>
Subject: Re: [PULL v3 0/8] Fuzzing Patches for 2021-09-01
To: Alexander Bulekov <alxndr@bu.edu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: bonzini@redhat.com, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 1 Sept 2021 at 12:50, Alexander Bulekov <alxndr@bu.edu> wrote:
>
> Hello Peter,
>
> The following changes since commit ec397e90d21269037280633b6058d1f280e27667:
>
>   Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20210901-2' into staging (2021-09-01 08:33:02 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/a1xndr/qemu/ tags/fuzz-pull-2021-09-01
>
> for you to fetch changes up to 5d32fc3b60ffad175cab27dfaf07e0929a4f5755:
>
>   MAINTAINERS: add fuzzing reviewer (2021-09-01 07:33:13 -0400)
>
> Thank you
>
> ----------------------------------------------------------------
> Fuzzing Patches for 2021-09-01
>  * Add Darren and Qiuhao as reviewers
>  * Make coverage-instrumentation and timeouts more granular
>  * Fix a problem with impossible writes in the DMA callback, leading to
>    false-positives
>  * Attempt to fix oss-fuzz coverage builds, by dealing with a
>    signal-related problem
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

