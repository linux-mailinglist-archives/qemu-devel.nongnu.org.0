Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AF14BDB4F
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 18:36:04 +0100 (CET)
Received: from localhost ([::1]:45192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMCbT-0007nr-O2
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 12:36:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMCPh-000069-89
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 12:23:53 -0500
Received: from [2607:f8b0:4864:20::b2b] (port=37839
 helo=mail-yb1-xb2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMCPe-0007ek-7o
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 12:23:52 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id y189so14208314ybe.4
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 09:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=2fpL+Cal7QkJiSrFq64Z2cpd4ZK+WikmQJm8V5Fcn6M=;
 b=YgBme0PO1I0eXa96gAjW2kNrowsTk15waZBWoFPlWH+SNd8BdWeIxn6NzJrzV9ckcu
 OPTWRI1QQsjGLUYmhiwqDdN+W8M9uVLX5t32aA4iSI4/S1f07hTvH+opsTqGCy7OtsHT
 ZF4AT7Sc/qIjxq2jvbBPyxO5zwwk/ADeNuVSk5Z51PVSAQl+EqcioeqaudnT++XC3eYl
 Qh8lHoViebD2DKAAIBG3IEDQW2nAzxtKNTooRiAw3oypzb1FPuKbueRRySWz6r6lzy81
 AWZesvhCqmPPaO4Qf/V8YkjLwEvUAu73Sg0tYxvQKTVZjAKj/ih+Hw11fpuw76S7gZIc
 w/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=2fpL+Cal7QkJiSrFq64Z2cpd4ZK+WikmQJm8V5Fcn6M=;
 b=7RAVcHay4ry4CqExWT59XzZzCX+KRSoh5ngB8kHYR3VfhtSIWaKEtQS/TnpLZQOth9
 SeDby/+crxA3T7DWQ//9XCP58bZiJDOleE05B/zYfiIQtghq5Ma7w3xd0Sa2f9XeC+WH
 Qz8VyiFCi4Ak5iR/SNFOvwqlXW305xqU/CruTiEe/ATLwPuYtzThESwQqLq3K+4rFdwm
 qF9bGoxQ/YMAXTa7hFeSvs46FJH/26hJG1ZIK4faguaGtEL2X1v+P7YSPpdVKHmOAMNu
 nv1fENppxHtTlvFU1PErnOOb77q1sPL+4WMsMJ4fFbGE0tlQ2M2KQLmOfD2f+bKFjGQk
 JnDA==
X-Gm-Message-State: AOAM531VXwBEiom1eWw9akQBH4MTvpeH4PZ2VEVAo5FGKBjuq2cha8yr
 Ar8VsKQ7QZ00al5SUvySpiHDNG5QMTRlzvBf/Do0Jt5SsFs=
X-Google-Smtp-Source: ABdhPJzVR+mskIRCjibUgka+hJJxNGYuP5JkJLOocdm4QLwY0CTDE1fwta63mp1/S33RYM+zrj/tNqEXroLbKbWVufs=
X-Received: by 2002:a25:497:0:b0:624:8ba2:fc8e with SMTP id
 145-20020a250497000000b006248ba2fc8emr5846043ybe.39.1645464229105; Mon, 21
 Feb 2022 09:23:49 -0800 (PST)
MIME-Version: 1.0
References: <20220221133131.505884-1-peter.maydell@linaro.org>
In-Reply-To: <20220221133131.505884-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Feb 2022 17:23:38 +0000
Message-ID: <CAFEAcA9yWyUqj_j1x1toc+22npT_Wz0KJt-45ZqBF+kE35HASA@mail.gmail.com>
Subject: Re: [PULL v2 00/25] target-arm queue
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Feb 2022 at 13:31, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> v2: drop npcm7xx sdhci tests: new tests assert on some platforms.
>
> -- PMM
>
> The following changes since commit e670f6d825d4dee248b311197fd4048469d6772b:
>
>   Merge remote-tracking branch 'remotes/legoater/tags/pull-ppc-20220218' into staging (2022-02-20 15:05:41 +0000)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220221-1
>
> for you to fetch changes up to ca511604925eef8572e22ecbf0d3c758d7277924:
>
>   ui/cocoa: Fix the leak of qemu_console_get_label (2022-02-21 13:30:21 +0000)
>
> ----------------------------------------------------------------
> arm, cocoa and misc:
>  * MAINTAINERS file updates
>  * Mark remaining global TypeInfo instances as const
>  * checkpatch: Ensure that TypeInfos are const
>  * arm hvf: Handle unknown ID registers as RES0
>  * Make KVM -cpu max exactly like -cpu host
>  * Fix '-cpu max' for HVF
>  * Support PAuth extension for hvf
>  * Kconfig: Add I2C_DEVICES device group
>  * Kconfig: Add 'imply I2C_DEVICES' on boards with available i2c bus
>  * hw/arm/armv7m: Handle disconnected clock inputs
>  * osdep.h: pull out various things into new header files
>  * hw/timer: fix a9gtimer vmstate
>  * hw/arm: add initial mori-bmc board
>  * ui/cocoa: Remove allowedFileTypes restriction in SavePanel
>  * ui/cocoa: Do not alert even without block devices
>  * ui/cocoa: Fix the leak of qemu_console_get_label


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

