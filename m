Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFA3380E72
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:52:39 +0200 (CEST)
Received: from localhost ([::1]:44218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhb3G-00081I-Gc
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:52:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhaXm-000294-4G
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:20:06 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:37727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhaXi-00060E-N0
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:20:05 -0400
Received: by mail-ej1-x62f.google.com with SMTP id w3so45439319ejc.4
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 09:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZcJ9qhCko/Pi1GGNwwUcyPp1tos1cRZTqzwh8pQvd9s=;
 b=LkSgRAcPWkSrW/ULD49Jl7PhGgTCy/brn3sUufgxfatcnx2lvLyDyNgKqvkB3ZNf5d
 MjVM0XQyrnr49w64swuMYNpfWvqqyIS89udLscIGaw6VSbcht3/zhEBFHVxPOqln4fyw
 BElnLMy7SbI1CGxZPYHWJf09Yeb+DGclqljnPeNPYXnQM4CiFJiUPwqZetMyvcTtnpzM
 eX2iH6N7d/LASZC7jks+qKLI0JcmbG7VQXv3p9kvddoHnCltucOrnzuvzcMTAIpIfCp3
 aYAlCOtOpCxjvu1a8sZ+qluH5e0QJvdpXpdMeADUbC56nxydoWny0ai74NK4FE1Kf6vp
 uV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZcJ9qhCko/Pi1GGNwwUcyPp1tos1cRZTqzwh8pQvd9s=;
 b=Qqs0nIUY/PwZPJOgt9r8rGaSAMdsPxSx1BI2VtZmIg1Y2Z1w2gcOMdpqROm/XwE8y+
 +JPPnaU2Oy3ngExIfOIK5Fc1gFKHUiw3RAeVuPEnZP7dkfUDCDWCZXAMQHaMFy/D7GFb
 3cP8Tq2+4TWDiiJp7tRA4ZmCzoaiEW+5zTx1r+ZzL0yiVucfQFGLH7ONCUY4y3akalAQ
 0UhopxT3WsEnyFDfnhT89REPBMXocIfyTAWrSIAxn/kxN8Fsay+qJUildEtT+bxPuuDs
 W2q3XfU9WLbU3qcVQ0wm4wuM6bFB6QDaDaAJq9dR/NKbxAaoLewQf4D7FbLcaN0Zm2II
 wvgg==
X-Gm-Message-State: AOAM5321vFVR/Y027S9Fz79ZBIRJH0rnEC7aFPeNeA0PiQqGtWFtzUzC
 zq6s9k7AeVsV2/0okG882rfYi2/xCrr+XueBpiUd4g==
X-Google-Smtp-Source: ABdhPJzBqGAapb3dWEbbgkLBo28dJumsLPrco0MrROdgbZnY7LwZtKO9elBOUfUMI/iSJy4z1oAixe8aLRksxE9iQOY=
X-Received: by 2002:a17:906:b1cc:: with SMTP id
 bv12mr48984308ejb.407.1621009201008; 
 Fri, 14 May 2021 09:20:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210513215408.GC2921206@minyard.net>
In-Reply-To: <20210513215408.GC2921206@minyard.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 May 2021 17:19:48 +0100
Message-ID: <CAFEAcA9nwvb_3cSV8MpbE+AK98VFe4dcSui0DM1DxSG7_K8g3A@mail.gmail.com>
Subject: Re: [GIT PULL] I2C changes for next qemu release
To: Corey Minyard <minyard@acm.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: Hao Wu <wuhaotsh@google.com>, Patrick Venture <venture@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Havard Skinnemoen <hskinnemoen@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 13 May 2021 at 22:54, Corey Minyard <minyard@acm.org> wrote:
>
> This is the addition of a new devices used in a lot of BMCs, and adds
> the infrastructure so other devices of it's type can be added.
>
> I will update the Changelog as necessary.
>
> This was through several revisions on the mailing list recently.
>
> Thanks,
>
> -corey
>
> The following changes since commit 8fe9f1f891eff4e37f82622b7480ee748bf4af74:
>
>   Update version for v6.0.0-rc3 release (2021-04-14 22:06:18 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/cminyard/qemu.git tags/for-qemu-6.1-v1
>
> for you to fetch changes up to 065177eeceff552a5316bff9435188b50a2da1b6:
>
>   hw/i2c: add pca954x i2c-mux switch (2021-04-15 07:10:39 -0500)
>
> ----------------------------------------------------------------
> Add a bus multiplexer device
>
> This patch set adds a bus multiplexer and the necessary infrastructure
> in the I2C code to allow it to work.
>
> These are common on systems with lots of I2C devices, like an IPMI BMC.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

