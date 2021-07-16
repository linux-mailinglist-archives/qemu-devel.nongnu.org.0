Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C3F3CBB6A
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 19:51:27 +0200 (CEST)
Received: from localhost ([::1]:35042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4Rzi-0006cN-If
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 13:51:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4RyM-0005Qa-2L
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 13:50:02 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:46877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4RyK-0000Lp-Bf
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 13:50:01 -0400
Received: by mail-ed1-x52c.google.com with SMTP id t2so13624120edd.13
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 10:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RbOPKfoAhPc+m2C0/ZPZZQWHcPutCg5gAhND+dgSpfc=;
 b=TEC71DQNGSAJIo1uYLjY1QhXDZ2AT8TVYoH22RhS2KW743lDY/+uIlOggCEqUT5CSO
 wa1aVSSQUs/3TUZfE+ruvaj08XP7/kI6ZOtxhTTenjeu+w9rqaL5rC/ANbqJ91xN3EKV
 +psCR/PfKFKrW2AazTx7xvZL8IzeJ84KVOiA/Fxk+MaLuFknErcqp/9CVNWSYTjdo/Ag
 lbsZ2GTyNEbiq2ErQhW6BsfpDc1SlwQRNoUpo+rxAk6DOe1N5XJdJKOc6pHKCpOsfJAF
 eztPgnzwLC/O7AF3WnDgMqCf616tV8Wl0kUgbuMPXGiW7YFHeVLoDJx90o+G+wsKCtGi
 boyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RbOPKfoAhPc+m2C0/ZPZZQWHcPutCg5gAhND+dgSpfc=;
 b=TqaFrb0F2XiY78gB+cEFXSGvO2mIRbmzazUWdV7qrtD4qvGTdjdtXyWGRb5eiMJ938
 GnDeHTz+v2czC4MBEAswcgAHG0zmxcr4fHFNOjEKpAZcD8ANYvt1sW+pzWhtHraXteAQ
 zm7QvjAVa2wB2rxgrQd/Vn4dkTpjJeR3vSZmNxRkekqQL64oFr0npAyML3VG4S5lGed5
 OGyxmJ0sbMaFD3X1c4J04JPt6CYbTjeZ8wHAwK2dhXSbZprfjoCXskOnwVOEgPGZIrx+
 FdwfLkZAZ84gG1wJQmIZDCNaLg1ReN9faD5vrtq/nqUU4XBawHMa6RtpHRBJ5mn/r/c3
 KZtg==
X-Gm-Message-State: AOAM532ehKRTQBq+cDKTk2DQ28RjH+z9b4h2JC+WEnpYpqGUg17uyDvw
 vk1HH/9lVOXQ/X6tC2/z15cB5r10tC5zOGXLDroI/Q==
X-Google-Smtp-Source: ABdhPJzhTOVMGiFJ2WLWyQnac18xKXj97BbcsqsX9cGxsBGrDQdkLsgjgUIZSnKOTRmcZZYEft6FUeZ2J4rQmqYi5Ps=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr16179785edt.100.1626457798592; 
 Fri, 16 Jul 2021 10:49:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210716151416.155127-1-mst@redhat.com>
In-Reply-To: <20210716151416.155127-1-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Jul 2021 18:49:18 +0100
Message-ID: <CAFEAcA8vqT_XnPz_MjSLXPNN6P-r+MkX3yvXuzWMeRzGmEMvJg@mail.gmail.com>
Subject: Re: [PULL v3 00/19] pc,pci,virtio: lots of new features
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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

On Fri, 16 Jul 2021 at 16:15, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> The following changes since commit bd306cfeeececee73ff2cdb3de1229ece72f3b28:
>
>   Merge remote-tracking branch 'remotes/awilliam/tags/vfio-update-20210714.0' into staging (2021-07-15 21:39:04 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream3
>
> for you to fetch changes up to 1e08fd0a465d70ad30d2928c66537c816f0af7f8:
>
>   vhost-vsock: SOCK_SEQPACKET feature bit support (2021-07-16 11:10:45 -0400)
>
> ----------------------------------------------------------------
> pc,pci,virtio: lots of new features
>
> Lots of last minute stuff.
>
> vhost-user-i2c.
> vhost-vsock SOCK_SEQPACKET support.
> IOMMU bypass.
> ACPI based pci hotplug.
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

