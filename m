Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1E036E4E2
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 08:28:57 +0200 (CEST)
Received: from localhost ([::1]:34296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc0AS-0002R9-9n
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 02:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1lc08j-0001zb-Vy
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 02:27:10 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:43689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1lc08g-0000JX-2U
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 02:27:09 -0400
Received: by mail-oi1-x22a.google.com with SMTP id t24so8113240oic.10
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 23:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=azgJfdtceO/DLWcy2vvLysjVJTWl0vQ4G4a1Muy+aKo=;
 b=fmlTBdmtas+3CfQQgKx+u+jnQThm0cCzyvYRMLeunmTiP5/ENKXuvmBHHWDNmmKM/z
 HbOlmmraU52+hh7XuRfcCDVdHKFfQjl8yFScQgWHLy1H/axoWUJ9mGVyF9Y3AOEHydUY
 pzNpnT6dYWo0Y3FXaI/bKLIfQQaYnSrHQYaEt7Q68FNx7CxCMIOmb11hSxeROqGz0+6w
 OIVO1MCn2NwWBFV259nX4Ol0jkMoQqCQEfPurInsL/Ms6ig+fCTmIeKadAfNN4O/dKG8
 aBL+tcqgtps+Cs5GyRvV9zRBAY7F0OYW9FMLYKBkOjOXCaLVAg3OOyaJ++sBtzEt4+Dn
 TKCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=azgJfdtceO/DLWcy2vvLysjVJTWl0vQ4G4a1Muy+aKo=;
 b=s/HKSQUJHqjeuSXEFtbUXibDYHf4nc71ie4ZSo5bZBBNDO7Saee1AFhj/f7Y6JOvx7
 7blG9PL9WXa4tPfgpxvrezdsEzckJbrWXbUNqU+zH9KZO8mniqv35c/wrb97AGaj/V1b
 TVsNp+WAHnqJnZc7Yd/yCBcXEO7IHXP/NTAkDbcPZgtfYsrWQ9aJxVKn4yPEsYn99ONh
 Zd5OYoSvmcjcRNiAzBOVlrhdo42e6P4OAwc3vPbZ87T0bZZ2bculpWCitMBAvOtYvNEN
 4lDYGywIY4zt5lpbwUG+W52rKMJRWPdpTVVX5K+Lk8o0Sm6ip4bPNB3zbPynyNTCC9fR
 3dZw==
X-Gm-Message-State: AOAM532kWwBVWAnpdkl7KXvAatVVZKGt2t4o64ZYXpNO5+XiGeTQ3b1L
 jikigFmx7/MGKWxZK6RrAUghDxmMrteapj6P3oS9bYwlSDA=
X-Google-Smtp-Source: ABdhPJwvS30Co7mhSQyhmQe5oQg7ty+g660xkph1YHSnBADaX6qyXYsC0wX64JYrj3fZod5efxDdJ82wqur6MgpP8w0=
X-Received: by 2002:a05:6808:f12:: with SMTP id
 m18mr22226936oiw.62.1619677623650; 
 Wed, 28 Apr 2021 23:27:03 -0700 (PDT)
MIME-Version: 1.0
References: <161963801251.13717.437360863998468941.malonedeb@wampee.canonical.com>
 <161964487066.14015.8898428089827057186.malone@wampee.canonical.com>
In-Reply-To: <161964487066.14015.8898428089827057186.malone@wampee.canonical.com>
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Thu, 29 Apr 2021 08:26:51 +0200
Message-ID: <CABLmASGjYD=okbcHbENPjRfhkrvBKtTKGsY7yGXTkeC398+btg@mail.gmail.com>
Subject: Re: [Bug 1926497] Re: dp83932 stops working after a short while
To: Bug 1926497 <1926497@bugs.launchpad.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=hsp.cat7@gmail.com; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: qemu-devel qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 28, 2021 at 11:31 PM Jeff <1926497@bugs.launchpad.net> wrote:
>
> It looks like using
> https://cdimage.debian.org/cdimage/ports/snapshots/2021-04-17/debian-10.0.0
> -m68k-NETINST-1.iso instead fixes the issue. Perhaps the instruction on
> https://wiki.qemu.org/Documentation/Platforms/m68k should be updated.
>
> --
> You received this bug notification because you are a member of qemu-
> devel-ml, which is subscribed to QEMU.
> https://bugs.launchpad.net/bugs/1926497
>
> Title:
>   dp83932 stops working after a short while
>
> Status in QEMU:
>   New
>
> Bug description:
>   Following the instructions here
>   https://wiki.qemu.org/Documentation/Platforms/m68k I was able to
>   successfully install debian. However, running apt-get update stalls
>   after the first 1-2MB.
>
>   root@debian:~# apt-get update
>   Get:1 http://ftp.ports.debian.org/debian-ports sid InRelease [55.3 kB]
>   Ign:1 http://ftp.ports.debian.org/debian-ports sid InRelease
>   Get:2 http://ftp.ports.debian.org/debian-ports sid/main all Packages [8,735 kB]
>   18% [2 Packages 2,155 kB/8,735 kB 25%]
>
>   After running apt-get update. I don't seem to be able to send any
>   packets anymore. ping host lookups fail and a subsequent apt-get
>   update makes no progress.
>
>   I'm launching qemu with:
>
>     qemu-system-m68k -boot c \
>    -M q800 -serial none -serial mon:stdio -m 1000M \
>    -net nic,model=dp83932 -net user \
>    -append "root=/dev/sda2 rw console=ttyS0 console=tty" \
>    -kernel vmlinux-4.16.0-1-m68k \
>    -initrd initrd.img-4.16.0-1-m68k \
>    -drive file=m68k-deb10.qcow2,format=qcow2 \
>    -nographic
>
>   I see this with qemu v6.0.0-rc5
>
> To manage notifications about this bug go to:
> https://bugs.launchpad.net/qemu/+bug/1926497/+subscriptions

I've updated the page to include:

Please note that the instructions below use kernel versions that might
have been superseded by newer ones on the most recent installation cd
images! Also, during installation on hard disk image the update
process might install a newer kernel. Always make sure to extract the
latest kernel and initrd.gz from your hard disk image after
installation or update and replace the kernel names in the examples
below with what is currently installed.

