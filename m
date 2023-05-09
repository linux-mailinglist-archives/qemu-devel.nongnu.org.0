Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5A86FC787
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 15:09:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwN56-0006wN-Gh; Tue, 09 May 2023 09:08:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwN53-0006um-8c
 for qemu-devel@nongnu.org; Tue, 09 May 2023 09:08:37 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwN50-0004fZ-DZ
 for qemu-devel@nongnu.org; Tue, 09 May 2023 09:08:36 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-50bd2d7ba74so58636567a12.1
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 06:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683637713; x=1686229713;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q8uSEboWHed3UmO+hirF6Srz0bB/o10NyzAhbiK3VQU=;
 b=PO72igLYOqtMDT8QXe7Wz5UfN/4VW2jgWCH6/DYFuX69zG69MD5YU/BFgw1/BobAme
 ktkjGPvhUAvPuFx3scy3Wr4tuYtMn+b+uROT9QaQfBs3yVrR+WZ1KVu2oLSroJ3/puOo
 oUQLXBuvQWWlo47lKJLMGSu855IBG2+gg0jdfC41sEjSnXaXRmnXUS1EcM8E3w1I1TiE
 umtzwctA1QoiFSh36hHvlnsf//TZbidGQiu5yXsW4dV65meg6MTY1V5XQ1M2kHl/a2+q
 LX0h3SxR3+Ajpj2yKvcBTPs+Qvm9Yfs50rKSKq6b3xGRrE3cXfMUyEm2TWqYV8Kxjzy5
 QiZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683637713; x=1686229713;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q8uSEboWHed3UmO+hirF6Srz0bB/o10NyzAhbiK3VQU=;
 b=PoDICSEfsoP34lKyzpOZM6Q+u6VudlKBOfdhNHNKkFVIuRoM10NevpYrs7q/E1ljJ0
 4YA1Ld1q2iepmsO+wIOr+Jt041SvNbC8I5W+M+GwPugprYZxW7MBwX/RbmGT25BX1dSL
 aT33cNEfgW9L9d/OnVtbLJXChzl9Tw0Xr1DXdRCfPPfQsm9Jm371cykNAuMUFkHRjuSm
 Kh3KNGZf6Yk+YEl6k1Z87R5Iq7AHSUTqUtlM2VIo/byC/3TpPk+MqreX5jdsd10j29/Y
 syYik1xOJLuehxrTsskKTOAFfEPOnwvRnzx3CkJiE4k5paVzcopTse9w8DtTO5eNk4ou
 UFoA==
X-Gm-Message-State: AC+VfDz0JCXXFYOOUrS1oFLY6n99jGGvamoERDk/TL0PHnUZy9SX7oVm
 rKVJyUrkwIDKoMWyWzu8HD6/sT2+Vz1+KO58CQuxNuEJnCZfsDSX
X-Google-Smtp-Source: ACHHUZ7U5AwU8E8zR2NvjXAa/pDWQWC6StnIElrCJJdpaz4T1qqnBuwJ9DmEzwxEjWcXXQucK2ZKTxHyEEJyb++vC/A=
X-Received: by 2002:a05:6402:42c6:b0:506:b94f:3d8f with SMTP id
 i6-20020a05640242c600b00506b94f3d8fmr13245161edc.5.1683637712677; Tue, 09 May
 2023 06:08:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230421163642.1151904-1-peter.maydell@linaro.org>
In-Reply-To: <20230421163642.1151904-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 May 2023 14:08:21 +0100
Message-ID: <CAFEAcA8BSo_cv_GoSgzAEAR-_xd5e7qw0Tc9A3UnZFeNJfFgRQ@mail.gmail.com>
Subject: Re: [PATCH] docs: Remove unused weirdly-named cross-reference targets
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Ping for code review?

thanks
-- PMM

On Fri, 21 Apr 2023 at 17:36, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In the doc sources, we have a few cross-reference targets with odd
> names "pcsys_005fxyz".  These are the legacy of the semi-automated
> conversion of the old info docs to rST (the '005f' is because ASCII
> 0x5f is '_' and the old info link names had underscores in them).
>
> Remove the targets which nothing links to, and rename the two targets
> which are used to something a bit more descriptive.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/system/devices/igb.rst     | 2 +-
>  docs/system/devices/ivshmem.rst | 2 --
>  docs/system/devices/net.rst     | 2 +-
>  docs/system/devices/usb.rst     | 2 --
>  docs/system/keys.rst            | 2 +-
>  docs/system/linuxboot.rst       | 2 +-
>  docs/system/target-i386.rst     | 4 ----
>  7 files changed, 4 insertions(+), 12 deletions(-)
>
> diff --git a/docs/system/devices/igb.rst b/docs/system/devices/igb.rst
> index 70edadd5743..0bcdd857473 100644
> --- a/docs/system/devices/igb.rst
> +++ b/docs/system/devices/igb.rst
> @@ -29,7 +29,7 @@ Using igb
>  =========
>
>  Using igb should be nothing different from using another network device. See
> -:ref:`pcsys_005fnetwork` in general.
> +:ref:`Network_emulation` in general.
>
>  However, you may also need to perform additional steps to activate SR-IOV
>  feature on your guest. For Linux, refer to [4]_.
> diff --git a/docs/system/devices/ivshmem.rst b/docs/system/devices/ivshmem.rst
> index b03a48afa3a..e7aaf34c200 100644
> --- a/docs/system/devices/ivshmem.rst
> +++ b/docs/system/devices/ivshmem.rst
> @@ -1,5 +1,3 @@
> -.. _pcsys_005fivshmem:
> -
>  Inter-VM Shared Memory device
>  -----------------------------
>
> diff --git a/docs/system/devices/net.rst b/docs/system/devices/net.rst
> index 4b2640c448e..2ab516d4b09 100644
> --- a/docs/system/devices/net.rst
> +++ b/docs/system/devices/net.rst
> @@ -1,4 +1,4 @@
> -.. _pcsys_005fnetwork:
> +.. _Network_Emulation:
>
>  Network emulation
>  -----------------
> diff --git a/docs/system/devices/usb.rst b/docs/system/devices/usb.rst
> index 37cb9b33aea..74166810731 100644
> --- a/docs/system/devices/usb.rst
> +++ b/docs/system/devices/usb.rst
> @@ -1,5 +1,3 @@
> -.. _pcsys_005fusb:
> -
>  USB emulation
>  -------------
>
> diff --git a/docs/system/keys.rst b/docs/system/keys.rst
> index e596ae6c4e7..0fc17b994d3 100644
> --- a/docs/system/keys.rst
> +++ b/docs/system/keys.rst
> @@ -1,4 +1,4 @@
> -.. _pcsys_005fkeys:
> +.. _GUI_keys:
>
>  Keys in the graphical frontends
>  -------------------------------
> diff --git a/docs/system/linuxboot.rst b/docs/system/linuxboot.rst
> index 228650abc5e..5db2e560dc5 100644
> --- a/docs/system/linuxboot.rst
> +++ b/docs/system/linuxboot.rst
> @@ -27,4 +27,4 @@ virtual serial port and the QEMU monitor to the console with the
>                      -append "root=/dev/hda console=ttyS0" -nographic
>
>  Use Ctrl-a c to switch between the serial console and the monitor (see
> -:ref:`pcsys_005fkeys`).
> +:ref:`GUI_keys`).
> diff --git a/docs/system/target-i386.rst b/docs/system/target-i386.rst
> index 77c2f3b9799..1b8a1f248ab 100644
> --- a/docs/system/target-i386.rst
> +++ b/docs/system/target-i386.rst
> @@ -3,8 +3,6 @@
>  x86 System emulator
>  -------------------
>
> -.. _pcsys_005fdevices:
> -
>  Board-specific documentation
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> @@ -32,8 +30,6 @@ Architectural features
>     i386/sgx
>     i386/amd-memory-encryption
>
> -.. _pcsys_005freq:
> -
>  OS requirements
>  ~~~~~~~~~~~~~~~
>
> --
> 2.34.1
>

