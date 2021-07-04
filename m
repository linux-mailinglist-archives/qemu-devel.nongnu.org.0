Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE0D3BAD10
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 15:05:55 +0200 (CEST)
Received: from localhost ([::1]:49862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m01oo-0004fu-7Z
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 09:05:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m01nD-0003ux-M0
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 09:04:17 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:39452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m01n7-0008Bz-2E
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 09:04:14 -0400
Received: by mail-ej1-x632.google.com with SMTP id ga42so7345522ejc.6
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 06:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=TS6udhO2lsvPrTQQoH2RtPJApY5re3LJmD7fmP2lEyE=;
 b=o0BRACcNILuu2E/f/CFBdVry7wTMDVA1A47bBaw6lj7JpayaolV0GZ5BgWfPopuQuK
 3hpPFxWsOohLTvuCL6wR8lQ14kMofSVciadlRzGX/SKJrkFTwYrzvcEMUN9+mjq5/c51
 kupLa6BStIpCRpq2HIxdfxFA0cDQ9L0fV2WURgGp11Qf0laT5silNsaOFSccQxxnYj6+
 hpSu/s9VuHO5GvtzCAD/ma+EbHNZlmZdImiVVmSJYUWiv0Dxkb8DI0NqJ7/d7GDrNcvx
 ARagG2EbeSPnEq9BgSWW/yS7E3a8EQb60BwvCOIwhwSuCONKpUMWnqEN8SrP4pmmo0Jm
 dbgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=TS6udhO2lsvPrTQQoH2RtPJApY5re3LJmD7fmP2lEyE=;
 b=iLJzWhVO6oUh21kTmbda3sbQKJOdTMZDGmVkXXwFK2bmX/RyXMWU9EE3JtZt14EooA
 6xcLjlaR5/wVKwBmAj32d18GWOLSKJjYXTaEnNwNN+d+SwC49DJls8J4tRXd4ZNtGxN+
 IVSivZYoBg3nXUC0QP93NAUzRGznTWfj+UQtgQE1MB1+xIg0+nA8LNG2Ex0Iz67vez1g
 GIHc2PweUgh3BSmbuQkSLwebP32Y85gASwalotS4Oqr+DtSohuKxI08rU94h/+sTz+Yr
 8VL1EQ9sY4HQeBNNP+fB6EvtjaFqXG5vILU3veGHXE9CBC3HEiGUdlnFfCLIV8URC98R
 sLQQ==
X-Gm-Message-State: AOAM533Qh8PszFj0xNf6dGtMdiyA3bXdyVQc2hMZirKM4yvwiwpClvdo
 sySQZGg+qMGFk5Kmg+rYvzOlJ/ZRjO50YnQyUIzU+D0g9fzrkw==
X-Google-Smtp-Source: ABdhPJyg8ksAsqfC9rabnVVSe2tSo42mKdoWbAwBE5DFHGO1Db6GxXRdliW4xcknw07RoHxcAiCVLAHJ5ozNFB14GJo=
X-Received: by 2002:a17:907:1691:: with SMTP id
 hc17mr8619328ejc.382.1625403846744; 
 Sun, 04 Jul 2021 06:04:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210702125954.13247-1-peter.maydell@linaro.org>
In-Reply-To: <20210702125954.13247-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 4 Jul 2021 14:03:28 +0100
Message-ID: <CAFEAcA-jeX92rveOM0L+A06ofv=sGVUeCqQup7LbfW8RYHeOnA@mail.gmail.com>
Subject: Re: [PULL 00/24] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2 Jul 2021 at 13:59, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The following changes since commit 5a67d7735d4162630769ef495cf813244fc850df:
>
>   Merge remote-tracking branch 'remotes/berrange-gitlab/tags/tls-deps-pull-request' into staging (2021-07-02 08:22:39 +0100)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210702
>
> for you to fetch changes up to 04ea4d3cfd0a21b248ece8eb7a9436a3d9898dd8:
>
>   target/arm: Implement MVE shifts by register (2021-07-02 11:48:38 +0100)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * more MVE instructions
>  * hw/gpio/gpio_pwr: use shutdown function for reboot
>  * target/arm: Check NaN mode before silencing NaN
>  * tests: Boot and halt a Linux guest on the Raspberry Pi 2 machine
>  * hw/arm: Add basic power management to raspi.
>  * docs/system/arm: Add quanta-gbs-bmc, quanta-q7l1-bmc
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

