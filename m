Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5437431EC4B
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 17:36:07 +0100 (CET)
Received: from localhost ([::1]:43342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCmHZ-0005Za-5e
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 11:36:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lCmEv-0003oR-DQ
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 11:33:17 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:40164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lCmEs-0001I1-Uz
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 11:33:17 -0500
Received: by mail-ej1-x632.google.com with SMTP id u20so5957862ejb.7
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 08:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k/3EqGv62k1kx2n1s9CJWFCFFlJwLFhb7d7En2mxzJ0=;
 b=guahUtEVU0KlaWJ1MkdlYbOOx5ylR7MZElaZZlqYNDFxcKAXGYjMgo3G63B8XQj5v/
 t4nlGKca9rRGBMyN3GHDBR/Ptdp2aoxWIFqyt3dmw1AmWfbbA4oxk//EGL6REpg7Vu+L
 KxRdn0v3oR27iSSOFtF5A/q+/4yYIKVcUDvBd9ta2q0Qr+zgN3aIKasKgPA6/gW7xsGw
 PE7a3JpZVBD9WcA6D3xjk+qHUPS0LqRlN6PlC2TJqXoV/6J7vBwMotU7VtPwZ0szcdbV
 9lOEcHrdSwFd3+uIu6tGeFrOSKo6JGANhVJ6opru3K66KF4LJwbcp7M5PoVzLv6rxBkB
 NBQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k/3EqGv62k1kx2n1s9CJWFCFFlJwLFhb7d7En2mxzJ0=;
 b=pHvrrs4ztpcRD8pPE4HBkSzSPuza3Gcv1GwZe0fjyz20Ghx/B/RkDl5vod7R3L4Ith
 wt2sGo+1xQrWxDy2XbsA+/ndd+u8hXd+ZOQXA/8/rcZRLu4lXxQ9UYpTBykOqwx5LPbk
 hlwYpDv2wswUZ+UHsyecJ7hNre5P272OLn5SdIaiDAl5+PPxD0TyepWZYVRFM2JStOm2
 QcHjSyy2XzMX5mWdu0Lh/tbG3AgCQEmo3mtIjeNKhFgNhrV+GTO0Sc6t5oHF5QUJuJDa
 KNFHzDjbWzGTKHxeDEPKmB1B3GhzoGhOhuJWa6aHfoFaa36utQ240ggy21ZycCzYoslA
 dnMw==
X-Gm-Message-State: AOAM5312lkESBTRSVtcCL7k9+nEmv3F0ysUMh6W39vYzS1ozvOrZeQP/
 iilXE8SEMjuV40yQwLdKalXM0lputvX/4fV6qxoGBA==
X-Google-Smtp-Source: ABdhPJyx0W/rVZMtJuipXBFCW/1IX2q2GzLQ5Ok6gfR2C/+RC26//g5oFVFfpfWmoZLsRyV0EhWG2STPvqvhe9lBhEY=
X-Received: by 2002:a17:906:3556:: with SMTP id
 s22mr3835787eja.85.1613665992931; 
 Thu, 18 Feb 2021 08:33:12 -0800 (PST)
MIME-Version: 1.0
References: <20210218115201.2765071-1-kraxel@redhat.com>
In-Reply-To: <20210218115201.2765071-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Feb 2021 16:33:01 +0000
Message-ID: <CAFEAcA9ZQ+gOWST_X=0eJ8xu97NpS49a4DbCLfs7tn1S0NSeGw@mail.gmail.com>
Subject: Re: [PULL 0/2] Usb 20210218 patches
To: Gerd Hoffmann <kraxel@redhat.com>
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

On Thu, 18 Feb 2021 at 11:57, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 18543229fd7a2c79dcd6818c7b1f0f62512b5220:
>
>   Merge remote-tracking branch 'remotes/cleber-gitlab/tags/python-next-pull-r=
> equest' into staging (2021-02-16 14:37:57 +0000)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/usb-20210218-pull-request
>
> for you to fetch changes up to 6ba5a437ad48f10931592f649b5b7375968f362d:
>
>   usb/pcap: set flag_setup (2021-02-17 14:29:12 +0100)
>
> ----------------------------------------------------------------
> usb: two bugfixes.
>
> ----------------------------------------------------------------
>
> Gerd Hoffmann (1):
>   usb/pcap: set flag_setup
>
> Nick Rosbrook (1):
>   usb-host: use correct altsetting in usb_host_ep_update
>
>  hw/usb/host-libusb.c | 18 +++++++++++++++---
>  hw/usb/pcap.c        |  2 ++
>  2 files changed, 17 insertions(+), 3 deletions(-)


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

