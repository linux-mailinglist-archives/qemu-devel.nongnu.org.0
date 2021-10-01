Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E048741E99C
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 11:30:06 +0200 (CEST)
Received: from localhost ([::1]:37432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWErl-00039K-EH
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 05:30:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mWEps-0002N2-KK
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 05:28:08 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:46894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mWEpq-000288-TG
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 05:28:08 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 d207-20020a1c1dd8000000b00307e2d1ec1aso6270644wmd.5
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 02:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=fZbL06BuZSE3fF/Ege1UbO1+rpUreaxhvg9BBbC7iKU=;
 b=gMonbd7ME46YEJjidrhK4F9UeOfJTfxVgsh3FRH5TXKm+we5sC8xRRwjItEFuP3kBZ
 LeisXoqHkAGOX8gaoKpIzSdYLptjiukpvDTVvVEJT2j32e7dXmaMYJVn+O9MD60uXznH
 DxSunE3E0JljTn2XecP1VGbG+8DfZjQUBPDJI9p4n6NY1TC7MEUyToIJ4UhAvi/suZQ8
 Voss98prYwBwtY5mF1+HU7jRteyDvGYlQAuO0yooDNIpiK2pFnEuuH59pF4/kGFuIZ8/
 ibfUxAah6E4v5ES+vh/PsyI8W6Y0cVO0R2S5wCkyqOdiHqbqnjJ6Uhh/Enehq/gUo47V
 xHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=fZbL06BuZSE3fF/Ege1UbO1+rpUreaxhvg9BBbC7iKU=;
 b=XnmLgY2zsKSQm1VwjevbywNZyDdhJuSXe/jE48UAczyW7Ako/oNvD4c9f+96g7j23L
 2ZFR8kFfI16hFjQnZC6PDiiv1lo20LXNrowH+jJvne5TkUb9CNsivgCgCTt0mCAv5NO7
 jaohAgfXlBsRfEXhM8nxl4jiaeMGBJch6bJpRx/uMXgujxiZ5LeYhQkYl3StYW2Z6Xzy
 z7LU9owQB6Ede0VhqV0kQQLN15xp8x3xs7abrIwzpgJpX1eWV0Z4ppBJbdYbGj0rIAi/
 eeIBY2TBael1tMbfib7ETiUx0Rsd6jJJWXM2U0xYDK4LQfvBEimQ++B9F42Erk1YUoYu
 iI2A==
X-Gm-Message-State: AOAM532OLbsg4lUuDUtKTgs1LYXmC7uHHhIMhS+tXZQbCH0Wl95CK2xo
 GNB17rteIPCpdy8cTY7wQAFmx3rJh3Nra66tYiQJ3YuSr+Y=
X-Google-Smtp-Source: ABdhPJxL0qGSA8fopB1LQwOsKpA5c951kAWrCdBfUyyK0mLvr1pK3A2EPUHASeiyRBuehNNuMo7JQrJeNQitBZNz9uY=
X-Received: by 2002:a7b:cbc4:: with SMTP id n4mr3441331wmi.37.1633080484861;
 Fri, 01 Oct 2021 02:28:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210930151201.9407-1-peter.maydell@linaro.org>
In-Reply-To: <20210930151201.9407-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Oct 2021 10:27:11 +0100
Message-ID: <CAFEAcA98H4vNwVkizpmSvi-2CNSuJYDQumG0DDSSPG254MPwLA@mail.gmail.com>
Subject: Re: [PULL 00/22] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

On Thu, 30 Sept 2021 at 16:12, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Nothing too exciting in this lot :-)
>
> The following changes since commit ba0fa56bc06e563de68d2a2bf3ddb0cfea1be4f9:
>
>   Merge remote-tracking branch 'remotes/vivier/tags/q800-for-6.2-pull-request' into staging (2021-09-29 21:20:49 +0100)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210930
>
> for you to fetch changes up to 1f4b2ec701b9d73d3fa7bb90c8b4376bc7d3c42b:
>
>   hw/arm: sabrelite: Connect SPI flash CS line to GPIO3_19 (2021-09-30 13:44:13 +0100)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * allwinner-h3: Switch to SMC as PSCI conduit
>  * arm: tcg: Adhere to SMCCC 1.3 section 5.2
>  * xlnx-zcu102, xlnx-versal-virt: Support BBRAM and eFUSE devices
>  * gdbstub related code cleanups
>  * Don't put FPEXC and FPSID in org.gnu.gdb.arm.vfp XML
>  * Use _init vs _new convention in bus creation function names
>  * sabrelite: Connect SPI flash CS line to GPIO3_19
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

