Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3043C9226
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 22:33:31 +0200 (CEST)
Received: from localhost ([::1]:38850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3lZS-0000Ys-B5
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 16:33:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3lY5-00084E-Ij
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 16:32:05 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:42721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3lY3-0007SR-Og
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 16:32:05 -0400
Received: by mail-ed1-x536.google.com with SMTP id k27so4891072edk.9
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 13:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N6dwKcApYBQ6YGiIDzi8HkPJr0ZO/l7+LJZ+hpWg66g=;
 b=b6C0nZBLIbhK8wT4S2oTzz519M8JaPxX+25Qc9SKdyCv7/4JFbyyTOUFehPtxTCHSp
 rR2h9Ob97XIm1FIZCeg/CeSeZECEy/+i5+VnF3G1TLTmELuW+PqhZsWQJ75mgLMOwhMx
 Hkbjy/TwwstjowxuTTkK3De2WQz0+Cw6ZWPYKkUCeQFHoTndxtqiXPTyBFUBTkfyNECX
 KRf3/eSUqUI5KzEil0JXxJgy+JrLV7O8oTIgsFK3cZKj4xAxpEjYZ47VgTCOeUBiY+I1
 OI/Zq+bMeaptA95Ps+HAuiGg9Sx/EGmAqp3YQSNgR3hPvzoLM3WYPWe1+FqkMrigREeE
 TORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N6dwKcApYBQ6YGiIDzi8HkPJr0ZO/l7+LJZ+hpWg66g=;
 b=dNhTnyxUJkYWYbkyJy1evXmybW02df7oQouw8wbWTVMWWNHAc5Zqd2e6fiv36y1ba6
 Ay4iBT1PnMaWCNE6bFP/U/AMaBiAZPNjUfkPaOf2C4oLmDZtO2K7v7HiU3PRQmx7ovA4
 pDIBAGIJxOOL02ZgA0J3qzv2q4oadEVFnyYO2AYWPs+bzdljR3BDOK4diCjmpjIMCO5R
 mHx0LD/IIuosIrBMqfiJRswMHCQOwYdK3GLBPKRLBEOjOoxaldwjM8rncREDhPXTiHNO
 4lZ7qk9y+VFAhLeot56AAGjex3QHBFZ+9ZldT/ZmjUK5skmFiUKIgTMzExRqA7kntO/x
 ueeg==
X-Gm-Message-State: AOAM5339RhHMHCtNE1X6vScnjjLMLtLuNupQfcK1nSAsyEJMFpjbAbT5
 wBL3jiF/pqRAfjtXq+Mprx9KkcVoANljEdM5cDBx8g==
X-Google-Smtp-Source: ABdhPJwljxSJEKFvOprIfkcoS+7MlhiebqrZGurpIIH/G7qnFJf8xDqe7gEykPd6X46NGFn7okuzZUaosa1bXwRnfbo=
X-Received: by 2002:a05:6402:1ca4:: with SMTP id
 cz4mr227356edb.52.1626294721597; 
 Wed, 14 Jul 2021 13:32:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210713220946.212562-1-mst@redhat.com>
In-Reply-To: <20210713220946.212562-1-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 14 Jul 2021 21:31:21 +0100
Message-ID: <CAFEAcA_ykJOv0s_44VKWFa3ti9pVD_u_3_G1MpAFdLRZ9oPH5w@mail.gmail.com>
Subject: Re: [PULL 00/23] pc,pci,virtio: lots of new features
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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

On Tue, 13 Jul 2021 at 23:10, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> The following changes since commit 708f50199b59476ec4b45ebcdf171550086d6292:
>
>   Merge remote-tracking branch 'remotes/ericb/tags/pull-nbd-2021-07-09-v2' into staging (2021-07-13 14:32:20 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
>
> for you to fetch changes up to cf171f90d5e41730ad3e0ce23f1990f34b7e63ef:
>
>   vhost-vsock: SOCK_SEQPACKET feature bit support (2021-07-13 16:59:12 -0400)
>
> ----------------------------------------------------------------
> pc,pci,virtio: lots of new features
>
> Lots of last minute stuff.
>
> vhost-user-rng.
> vhost-user-i2c.
> vhost-vsock SOCK_SEQPACKET support.
> IOMMU bypass.
> ACPI based pci hotplug.
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

This seems to produce a new meson warning:

Configuring 50-qemu-gpu.json using configuration
Configuring 50-qemu-virtiofsd.json using configuration
Configuring 50-qemu-rng.json using configuration
../../tools/vhost-user-rng/meson.build:7: WARNING: The variable(s)
'libexecdir' in the input file
'tools/vhost-user-rng/50-qemu-rng.json.in' are not present in the
given configuration data.
Configuring 50-edk2-i386-secure.json using configuration
Configuring 50-edk2-x86_64-secure.json using configuration
Configuring 60-edk2-aarch64.json using configuration

(the build then seems to go on to complete OK).

-- PMM

