Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE454FDF7C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 14:29:05 +0200 (CEST)
Received: from localhost ([::1]:37462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neFdo-0003gl-35
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 08:29:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1neFc1-000219-Ck
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 08:27:13 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:51513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1neFbz-0003ie-Uo
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 08:27:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=94lnfMet/iYq3YBGMHwtHfnLCLTwTwD8HISLQJ3VTps=; b=CegHCMnYRBLcA9Mi8D9Lu8/Q+t
 K5P53Z//iYuHjUG/ldF8KHWY5xjiLZHQFyCn0vfad/XV0vZeeOvArPHbMcavM1RoN+TzHoHJNbIPa
 dIKkMCAxxwel4Rx7HYUch8qqguTI6rL4WacwbRhhNSMFw8V4XHJrBDHr+Kx2qda6GC25xie9GGzC9
 x5LE+pvzsP0wwD4RHYNTG0UdhLF2J+lJjs2Dcw5Sqcbv8FvlEDAHhuonaQRriMolQgbHSiI6K17tl
 iFCGXSkmGAwXFoSB8yqzn3mB79XKhrV4UQhdWv5XXGXsbeEjtxMh/j7EBxMa0v0GSq28I5ZX3SVw8
 z2xqAX0Ob8iNzIUeYcY4JKzvWcOl/6CA8VNgMnCulyb5sX94VmAMTXWKYcM/Sne220jNKGob5tAF5
 r7ZGoAl/iGmSie+IzuX6xdfvL68/TRr9dqNNmrOm0c7KU4UyEZUkuAVjyPMUIrgjgpHMLkal+wpDg
 7ZBnoRPCSIuX2OVIEzKSrAwW21tnkAZdlVTbmjATdnuh+JEUzFxH8rG+YPs059X+4+ZEpUO+soAZe
 Mwec2K8odwDmSe9eQkJHe4+BaVV1vwUol5s0cm7ItuMk7yOaoSQ4u7H1Zc8sC3SeaS3chkTV5SyAR
 R74wqvnTeLwHXDioi5mvidawTJlI0UmzTd5932jYY=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org, Bin Meng <bmeng.cn@gmail.com>
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [RFC PATCH 0/4] 9pfs: Add 9pfs support for Windows host
Date: Tue, 12 Apr 2022 14:27:08 +0200
Message-ID: <1937840.tFbQv4iVWk@silver>
In-Reply-To: <20220408171013.912436-1-bmeng.cn@gmail.com>
References: <20220408171013.912436-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Freitag, 8. April 2022 19:10:09 CEST Bin Meng wrote:
> At present there is no Windows support for 9p file system.
> This series adds initial Windows support for 9p file system.

Nice!

> Only 'local' file system driver backend is supported. security_model
> should be 'none' due to limitations on Windows host.

We have 3 fs drivers: local, synth, proxy. I don't mind about proxy, it is in 
bad shape and we will probably deprecate it in near future anyway. But it 
would be good to have support for the synth driver, because we are using it 
for running test cases and fuzzing tests (QA).

What are the limitations against security_model=mapped on Windows? Keep in 
mind that with security_model=none you are very limited in what you can do 
with 9p.

> Example command line to test:
> 
>   "-fsdev local,path=c:\msys64,security_model=none,id=p9 -device
> virtio-9p-pci,fsdev=p9,mount_tag=p9fs"
> 
> 
> Guohuai Shi (4):
>   fsdev: Add missing definitions for Windows in file-op-9p.h
>   hw/9pfs: Update 'local' file system backend driver to support Windows
>   fsdev: Enable 'local' file system driver backend for Windows
>   meson.build: Turn on virtfs for Windows host
> 
>  meson.build         |  10 +-
>  fsdev/file-op-9p.h  |  33 ++++++
>  hw/9pfs/9p-util.h   |   4 +
>  hw/9pfs/9p.h        |  22 ++++
>  fsdev/qemu-fsdev.c  |   2 +
>  hw/9pfs/9p-local.c  | 273 +++++++++++++++++++++++++++++++++++++++++++-
>  hw/9pfs/9p.c        |  85 +++++++++++++-
>  hw/9pfs/codir.c     |  17 +++
>  fsdev/meson.build   |   1 +
>  hw/9pfs/meson.build |  10 +-
>  10 files changed, 449 insertions(+), 8 deletions(-)



