Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EA035C939
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 16:52:19 +0200 (CEST)
Received: from localhost ([::1]:58206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVxvG-0000Dl-UR
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 10:52:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVxtz-00081a-8A
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 10:50:59 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:41791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVxtv-0008UG-7S
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 10:50:58 -0400
Received: by mail-ed1-x533.google.com with SMTP id z1so15427033edb.8
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 07:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=3AWIgtPMg1NC920Lqy3AOrHTSlNW0MFMXjNqoCbpgDM=;
 b=ijHsTv2ivWt1E6IoqfcCeFR/BQmayDr01DxDz01XUVfEJXHzkKK0K0voDQ2O6ZZf+x
 vsub+PZdLxKanqTngK+eeagsnnf9K0GkYEFQdRTqi/ymUVWKRC8BK+q5znSPDael76Jr
 Hiv81PhCFyxCXcmxdZJqnI3xsR/c/tmoHMwl0Dl4C0YJ+iCePmX2UTfMPlkrdmlCzD33
 aPgroGsCWGqxUFXlyRCpUo0OZkN5u/Pp1ksZ8Q36VZ1lH/Jfdwoo1cbj4GWYW58pyKdv
 CA4ZwTVKZc5wgWOx1oWiX0rzqicCB7lxl+QL5NK3CA5/wzKxzjFXDk7pupIMIFkYbUDc
 Wveg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=3AWIgtPMg1NC920Lqy3AOrHTSlNW0MFMXjNqoCbpgDM=;
 b=BdBi9+CvxesFkPPSMssym13PwcvzzWc8YyoTJ+3jAfEwO699d17W8xzN+o54ej/DTN
 xO2dJ/EcGBQz7U3yKwxBF/1DwsOqZWsjFLfNXpiarHEN9LXcCvvFwm+X9bXsIiitz6f8
 4GfpHGWLR94JgJLLS6iwBWv+UL/h8MR8FCYlFKoZYyu4OpqIN3e9JHQU+qGPNe3b9pv4
 9zyMjSCUu90iXeIprtEs8TvQvYzVDWaIM/qR9LX5omM1cQTEIJ9WseKDHv2lkb/N72gI
 mPTXFr9uRB/mvgQbXMLAUwhbnElSBhq6QG0z481LeWr2S2bOTxdl6gqKTZgOoEK1F8Ji
 LZMA==
X-Gm-Message-State: AOAM532XP7PwZuiv+PWKG7kHhLr9NeGM6L2SFdgWQfB1KDLIYhuaq68Q
 Q1LTe05lossAiJllTPQCDR+aleNhL6XQcyqvLvtpLnIEVF8=
X-Google-Smtp-Source: ABdhPJyRQabIP+KrzOERXtTxFVnCgIQ5gK6EwojPvovCh4C+rtAkmCnLD0kedsNyYeGJcUAlMjUE/azJkvbSdn8RPwQ=
X-Received: by 2002:aa7:d843:: with SMTP id f3mr24062933eds.52.1618239053187; 
 Mon, 12 Apr 2021 07:50:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210412103152.28433-1-peter.maydell@linaro.org>
In-Reply-To: <20210412103152.28433-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Apr 2021 15:50:08 +0100
Message-ID: <CAFEAcA_QdObVhxqe-WzNHq4YtTpSea968spbyfPRukQ_Ot0onw@mail.gmail.com>
Subject: Re: [PULL 0/5] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 12 Apr 2021 at 11:31, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Handful of arm fixes for the rc.
>
> The following changes since commit 555249a59e9cdd6b58da103aba5cf3a2d45c899f:
>
>   Merge remote-tracking branch 'remotes/ehabkost-gl/tags/x86-next-pull-request' into staging (2021-04-10 16:58:56 +0100)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210412
>
> for you to fetch changes up to 52c01ada86611136e3122dd139788dbcbc292d86:
>
>   exec: Fix overlap of PAGE_ANON and PAGE_TARGET_1 (2021-04-12 11:06:24 +0100)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * hw/arm/virt-acpi-build: Fix GSIV values of the {GERR, Sync} interrupts
>  * hw/arm/smmuv3: Emulate CFGI_STE_RANGE for an aligned range of StreamIDs
>  * accel/tcg: Preserve PAGE_ANON when changing page permissions
>  * target/arm: Check PAGE_WRITE_ORG for MTE writeability
>  * exec: Fix overlap of PAGE_ANON and PAGE_TARGET_1
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

