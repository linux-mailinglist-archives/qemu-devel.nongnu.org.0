Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2BC341B78
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 12:28:55 +0100 (CET)
Received: from localhost ([::1]:38246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNDJG-0000c1-C3
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 07:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lNDHr-0007jh-MX
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:27:27 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:38773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lNDHp-0002VC-PX
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:27:27 -0400
Received: by mail-ed1-x533.google.com with SMTP id h13so10326600eds.5
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 04:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hPA6Dnps10NIjpggJdJfAsmzO4pqfkzCYQO/XE4spqU=;
 b=L6eK/mJbXnq6qYF8a2vLc0m2HUCtivrKOr7eTDMFcAWL5cHF7AksWT1WyhoZf+CLRo
 2JAuAw+dA2XqPoO6Pgy9c1NhupFTEfYIdIdr//lon70h1MVv5kQb5bZtk/Lgz4umMRR9
 7scRPHCvrUiIDt65w4mu2vI5HaCNGusLXZdq79hJVoeYuSCtmwjE6UzUrjxRrsbDD4LG
 htwMR9xk163NvErQOjAWW/h+SidSdx996aVssR2mj7DvV8jJgk3InXe7QF4r7mVaXhZ2
 Bg0MqtaXq3K7GeSwyhPkP62Kab4pTXhsqJ+n2dkuZufaj388r49VA+a2Jsojs5dO5xSt
 P5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hPA6Dnps10NIjpggJdJfAsmzO4pqfkzCYQO/XE4spqU=;
 b=LzWVoDeLGj7h92MhvVCHC4pI1Uw06bRQlLoTWsiBG+ZzBcXj3gspfEUWgqT/KGKIFl
 N4jOQDUO0LFc3nY7xcirirCvB7vsq0gsKpiUgXKwNsOENr99vI+NyKWaFHRdVDP6VVwA
 C/b0Zx9hSDI+5KBTnRTB9P4tDW1zsuPbB4PXddY0pBwEpLP6VgZaf0DKZVYmIbvqJSyS
 ncKuPrW7UgT/WSAkrdJk6YRsnf18OpiKmpChCJh/MYsmzIisxHed5om4PHZGihape+D6
 JYh9SsQXSHrkVjHxR+bkTl0BHDbIg/vEovw/ubKytu8C9uk/9Iv5O7oWDDW/wcb95Jr5
 2Bkw==
X-Gm-Message-State: AOAM530SuUml2DM4lRarPCEoEqmJHP07W5vQi8L2p1HXovyUXX2zYV80
 BiW8ieAx7ACCVufKgvtTyQu4CJy927Vx9uGn+/ySgA==
X-Google-Smtp-Source: ABdhPJzpqrsUVRHeE0R3IU5jFH3cnaZ9ajJK00/hdYn/81QmxibVCBzQTYhKxvw6SKdtihtwCu3L7/3RrHD3bVeULvs=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr8776093edv.44.1616153243482; 
 Fri, 19 Mar 2021 04:27:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210319064517.1496467-1-armbru@redhat.com>
In-Reply-To: <20210319064517.1496467-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Mar 2021 11:26:58 +0000
Message-ID: <CAFEAcA-yKzM5o3X020L-3w13D=kJ26fbcNZTxXBnPQXBDONwfg@mail.gmail.com>
Subject: Re: [PULL v4 0/6] QOM and fdc patches patches for 2021-03-16
To: Markus Armbruster <armbru@redhat.com>
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

On Fri, 19 Mar 2021 at 06:45, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit 8a40754bca14df63c6d2ffe473b68a270dc50679:
>
>   Merge remote-tracking branch 'remotes/nvme/tags/nvme-next-pull-request' into staging (2021-03-18 19:55:37 +0000)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-qom-fdc-2021-03-16-v4
>
> for you to fetch changes up to 0c727a621a646504ccec2b08e55fd48030448466:
>
>   memory: Drop "qemu:" prefix from QOM memory region type names (2021-03-19 06:55:49 +0100)
>
> ----------------------------------------------------------------
> QOM and fdc patches patches for 2021-03-16
>
> ----------------------------------------------------------------
> Markus Armbruster (6):
>       docs/system/deprecated: Fix note on fdc drive properties
>       fdc: Drop deprecated floppy configuration
>       fdc: Inline fdctrl_connect_drives() into fdctrl_realize_common()
>       blockdev: Drop deprecated bogus -drive interface type
>       hw: Replace anti-social QOM type names
>       memory: Drop "qemu:" prefix from QOM memory region type name

Looks like this breaks the sanitizer gitlab CI job:
 https://gitlab.com/qemu-project/qemu/-/jobs/1111697105

Testing ./build-oss-fuzz/DEST_DIR/qemu-fuzz-i386-target-generic-fuzz-sdhci-v3
...
==8556==WARNING: ASan doesn't fully support makecontext/swapcontext
functions and may produce false positives in some cases!
==8556==WARNING: ASan is ignoring requested __asan_handle_no_return:
stack type: default top: 0x7ffcb7805000; bottom 0x7f960e9fd000; size:
0x0066a8e08000 (440919949312)
False positive error reports may follow
For details see https://github.com/google/sanitizers/issues/189
i386: -drive if=sd,index=0,file=null-co://,format=raw,id=mydrive:
machine type does not support if=sd,bus=0,unit=0

thanks
-- PMM

