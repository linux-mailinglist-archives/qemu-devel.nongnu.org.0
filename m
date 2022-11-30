Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7987A63D237
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 10:41:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0JYq-0001SB-9H; Wed, 30 Nov 2022 04:39:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1p0JYl-0001Rh-Ai
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 04:39:22 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1p0JYi-00023V-MF
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 04:39:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i5+ib9EMjHBYLYirNdX8OBxBzvlhdMXsFLVysEfDj1U=; b=n63KLbkN9ukhbXTMXVT7az6HPD
 3KhWvsNqckhpSuf3ZMTP0iFkXwddFZrRQg9wKilJJ4gOOTcbK7x+4YveoeXybyOwDlpDZpUWLYIuT
 DM0G6laFrSivwiHnvKqYH60lykdAivEe0hg+vGLT4MgyAVTVEVNBUzcOxNM/83bs07k7gJf3BMVCR
 q5RffpmZ6NJ9RHYsIriaRH3V4NsYsdo9IzmczEm2XU07eCGAN51Fk5fE82Aw1DA6D0161w2eGDd0h
 18++SZcxSJ6ur562NGz0amABImDlxUTGSYvtccGP4bF1lmwuvDeUwJasjl5lS9IuLvgOfQsf3EMDz
 waZ7aJEkjawLWLvVzROhl4XM6HsPlvaqdWZKs6Xm9XwW5yiz0MMUCoJibkiteXlS8kWIyGiilzFMz
 2F6Hqf5pnjRzdLxg8JAu0FLlfdbzfgfKMRNw4IgE2Vx1IPKekewiypk7sa0TqDkA8HXoF4F76HChA
 OFfZ64y6+G5u9R4fEjCuRry7vqjMCsIe7vbe9CD94oNedu9PmxZ7prvYNQ8j5mJTDx+O4F6RAmrsM
 2RaEBaN8Yp5TjCkNv9x7jJ74gjL+CXHuxTNXxrCBjrmEyoExidzkzG1FC8/YBBnFstxm2NmNx55t2
 esBYFG8fiRiZJUaIrCmUzT0KB/XWKUN2A9H8seEkw=;
Received: from host86-149-46-27.range86-149.btcentralplus.com ([86.149.46.27]
 helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1p0JYT-000AsD-CS; Wed, 30 Nov 2022 09:39:05 +0000
Message-ID: <4cbea399-41e4-fbc1-804e-73454e68f6e6@ilande.co.uk>
Date: Wed, 30 Nov 2022 09:39:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Michael Roth <michael.roth@amd.com>, qemu-devel <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20221128092555.37102-1-thuth@redhat.com>
 <Y4TqEDYs+T4z6PX/@redhat.com>
 <CABgObfbTBN3t-OttM9gm75yPv8-5GDrp0v_Zeob0u-mp4hSQBA@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <CABgObfbTBN3t-OttM9gm75yPv8-5GDrp0v_Zeob0u-mp4hSQBA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.149.46.27
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 for-8.0 0/5] scripts/make-release: Decrease size of the
 release tarballs
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 28/11/2022 19:25, Paolo Bonzini wrote:

> Il lun 28 nov 2022, 18:04 Daniel P. Berrangé <berrange@redhat.com 
> <mailto:berrange@redhat.com>> ha scritto:
> 
>     With my distro maintainer hat I would rather QEMU ship neither the
>     ROM source, nor the ROM binaries.
> 
> 
> Annd since QEMU can finally cross compile its embedded firmware modules, too, it is 
> now easier for distros not to use any prebuilt binary.
> 
> However some firmware sources are only available from QEMU's submodules. So either we 
> distribute those submodules as separate tarballs, or distros would need to use the 
> bundled tarball as well.
> 
> Separately, I am not even sure what compiler is needed for the old Macintosh ROMs...
> 
> Paolo

I can quickly summarise what is needed for the ROMs that I'm involved with:

- OpenBIOS is currently built using the builder docker image hosted at 
https://github.com/openbios/openbios/pkgs/container/openbios-builder which is based 
upon the kernel crosstool archives.

I initially tried using the QEMU docker cross-compilers, however whilst the builds 
work the binaries generated would crash early for PPC/SPARC64. I suspect it's likely 
because of specific patches applied by Debian or the options used for the build but 
didn't really dig into it further.

- qemu_vga.ndrv is a tricky one: it's actually built by Metrowerks CodeWarrior 
running in an OS 9 VM in QEMU!

There is a project called Retro68 (https://github.com/autc04/Retro68) which is a port 
of gcc for 68k/ppc Macs which could potentially be used, however it would need 
conversion of the driver from Metrowerks to gcc, and also likely require the use of 
Apple's MPW headers which were free to distribute but whose copyright status is 
currently undetermined.


ATB,

Mark.

