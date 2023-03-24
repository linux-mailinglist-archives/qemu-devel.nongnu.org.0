Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B10AC6C8633
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 20:50:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfnPd-0006yp-OW; Fri, 24 Mar 2023 15:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pfnPb-0006ui-BR
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 15:49:19 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pfnPY-0006hz-Rj
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 15:49:18 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 84E9BB82422;
 Fri, 24 Mar 2023 19:49:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56834C433D2;
 Fri, 24 Mar 2023 19:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679687345;
 bh=cZHI95NBMO6NF+Emv35KZyyHSTxgf/4L9fm7V7z/+kA=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=eamg7WrN4Navjb8od46+FrzVL10ItXTBdtpe3Qwxtps1JtCuBkSNgNqCRMEKgyFyo
 Df6L/DNgNHKoxYz9YsiyOUT3TDzg1j1+tVtLbzbnanz1UsPS9r+b7tEEI4lWpjlr6v
 5eJgAJQ9Iy9ASPm355tK0arj6WKmaWrUVl2/XUlDoaH+3CLMJuHvnEJfqeGm7SuUTj
 g/L4Hvz0BMRLTUH/Egamz6zOAW2L51dvfSUOTtUZPvQfDw8eXK+Y3XcekRWtrTidlD
 1imMMhKGaByXiNb/3WmKAaRNvxFLhFlkIpHxm6ZWi8RIse+Q6AV5qoq0gzqiSpNf6m
 EMZBCF9E9xftg==
Date: Fri, 24 Mar 2023 12:48:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: David Woodhouse <dwmw2@infradead.org>
cc: Remi Duraffort <remi.duraffort@linaro.org>, 
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 Anders Roxell <anders.roxell@linaro.org>, 
 qemu-devel <qemu-devel@nongnu.org>, 
 Vikram Garhwal <vikram.garhwal@amd.com>, 
 Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: Adding default config options to the tuxrun baseline kernels
 and enabling sshd
In-Reply-To: <3e6fb10defaac2ac0e6445e61631b6b612672ddd.camel@infradead.org>
Message-ID: <alpine.DEB.2.22.394.2303241240350.4066@ubuntu-linux-20-04-desktop>
References: <87h6ua4dkw.fsf@linaro.org>
 <CANJfhHe-E-+F_P_=+ww46Szp_To=C4QWxKG5hdeCriwQr821jg@mail.gmail.com>
 <3e6fb10defaac2ac0e6445e61631b6b612672ddd.camel@infradead.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1873736637-1679686972=:4066"
Content-ID: <alpine.DEB.2.22.394.2303241248100.4066@ubuntu-linux-20-04-desktop>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=sstabellini@kernel.org; helo=ams.source.kernel.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1873736637-1679686972=:4066
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2303241248101.4066@ubuntu-linux-20-04-desktop>

On Fri, 24 Mar 2023, David Woodhouse wrote:
> On Fri, 2023-03-24 at 13:53 +0100, Remi Duraffort wrote:
> > Le ven. 24 mars 2023 à 12:02, Alex Bennée <alex.bennee@linaro.org> a écrit :
> > >   version: 1
> > >   name: Xen Guest Kernels
> > >   description: Build Xen Test Kernels
> > >   jobs:
> > >   - builds:
> > >       - {target_arch: x86_64, toolchain: gcc-12, kconfig: [defconfig, "CONFIG_XEN=y", "CONFIG_XEN_PVHVM=y", "CONFIG_XEN_BLKDEV_FRONTEND=y", "CONFIG_XEN_PVHVM_GUEST=y"]}
> > >       - {target_arch: i386, toolchain: gcc-12, kconfig: [defconfig, "CONFIG_XEN=y", "CONFIG_XEN_PVHVM=y", "CONFIG_XEN_BLKDEV_FRONTEND=y", "CONFIG_XEN_PVHVM_GUEST=y"]}
> > >     test: {device: qemu-x86_64, tests: [ltp-smoke]}
> > 
> > 
> > The kernels and rootfs are built by this gitlab
> > project: https://gitlab.com/LinaroLtd/tuxsuite.com/tuxtest/tuxtest-bu
> > ildroot using buildroot.
> > So for sure we can add sshd support quickly. Regarding the support
> > for xen, this can be added for arm64 if you want (only arm64 or
> > something else)?
> 
> Thanks. This request was for x86_64 and i386 kernels, rather than
> arm64.
> 
> I think arm64 Xen support is coming to qemu but it requires real Xen —
> while what we're wanting to test here is *emulating* Xen on Linux/KVM,
> which isn't something that we support on arm64. So I suspect there's
> not a lot of benefit in adding it to the arm64 builds? Vikram, Stefano,
> what do you think?

Yes, not useful for what we are trying to do.

From my point of view, it would be useful to run a test inside QEMU
(emulating a full aarch64 platform) running Xen, Linux and QEMU (QEMU
running on Linux, all inside QEMU) to test the new xenpvh machine in the
inner QEMU. Not asking, just FYI.
--8323329-1873736637-1679686972=:4066--

