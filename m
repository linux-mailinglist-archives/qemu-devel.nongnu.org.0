Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2AE36FB1E
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 15:04:02 +0200 (CEST)
Received: from localhost ([::1]:55410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcSoL-0003Jw-B2
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 09:04:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcSXM-0007mh-9w
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 08:46:28 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:35567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcSXJ-0005YF-4u
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 08:46:27 -0400
Received: by mail-ed1-x531.google.com with SMTP id di13so209019edb.2
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 05:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=2MPi7HW1d6RrzGvmqWXms32rIcHUsQn+SuOEkAZNuAU=;
 b=uiE0GF+Zk0D5UcLo6FLO5ROCEpfqnQVzazzpf8l88GQ/ZReQ7Mw6mxCcZaM5ItpaNr
 HrH8syAk1wn72KaVNjRmBGXb9NlDvZAE7P8xEs/BS2v0SllT+j5CykLYiDsB+HFStpVL
 oqLvZv1P1rgzf2JtJoQgYVTIqSrCvEvEBfKtaLOd/dqlzF1yuuGLetsB/rB6mVX8Z9/Q
 keT9qUJ55lWj9jAsItILhPCrWA9jeFjxIlr8YUHUpyi0f57aGUnZJa7My8LBaH1iRhHZ
 Ng5LI26QcxUYVo+W6Sj5TqVm4zAhIUPEyi4st7wxhujODkarqXIydC83btBWT8SEsJ2q
 kb0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=2MPi7HW1d6RrzGvmqWXms32rIcHUsQn+SuOEkAZNuAU=;
 b=sENmPs7Y1SAy+WPXrUkBLUwoQo2o2sIt09euCRTH6w6QiENznguKO8aSMOzFvNjrfa
 2PKkEooQpKmgKDiAAAAFKafcYGEfB5jqq+RRSLNyJWfFZTagjENIb9f0J4wLHiVw0G7v
 psmosB6DAD+3HavfmXMY2jv6Oeg6uOpl8jFExtEv4ua+IGKPVyClA7yPc9ylift4BXfm
 pgQ64T1cYJm6gAx3iOktsOWy5W0oqejNGTp4T17/iQ2yr5xyZsbrOf2SQiZSDSYgcnHt
 LmcKddflEE/LEKMy9Zk/dYkLWLEA9Xg1rMpPO0O5L7q0PBG6PdTGFucyV7002T+0wTDR
 vVCA==
X-Gm-Message-State: AOAM532YUr5Eam19ysjytwpn4JhUOKz/6jtyy4fXbyqY45jePnkERZF4
 wf/PWnXAOEQJrfaNT1gYVRQxfljTDefxkxZG2j5W8L6CAHY=
X-Google-Smtp-Source: ABdhPJxuBaXg73KKW0C2ntE9O4z8t7VmgbPhajPrJgcDt4tGEL8a1mYBQfAyK6SEhBVGLC5sKn6ZJNH94mfTvDdmfrI=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr5665504edv.44.1619786783304; 
 Fri, 30 Apr 2021 05:46:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210430103437.4140-1-peter.maydell@linaro.org>
In-Reply-To: <20210430103437.4140-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Apr 2021 13:45:21 +0100
Message-ID: <CAFEAcA-nwxa2KwPamYAAb3CrgHkYBLq_17McS14CsoPZijFddw@mail.gmail.com>
Subject: Re: [PULL 00/43] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 11:34, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> First arm pullreq for 6.1 cycle. The big stuff here is RTH's alignment series.
>
> thanks
> -- PMM
>
> The following changes since commit ccdf06c1db192152ac70a1dd974c624f566cb7d4:
>
>   Open 6.1 development tree (2021-04-30 11:15:40 +0100)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210430
>
> for you to fetch changes up to a6091108aa44e9017af4ca13c43f55a629e3744c:
>
>   hw/pci-host/gpex: Don't fault for unmapped parts of MMIO and PIO windows (2021-04-30 11:16:52 +0100)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * hw/pci-host/gpex: Don't fault for unmapped parts of MMIO and PIO windows
>  * hw: add compat machines for 6.1
>  * Fault misaligned accesses where the architecture requires it
>  * Fix some corner cases of MTE faults (notably with misaligned accesses)
>  * Make Thumb store insns UNDEF for Rn==1111
>  * hw/arm/smmuv3: Support 16K translation granule
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

