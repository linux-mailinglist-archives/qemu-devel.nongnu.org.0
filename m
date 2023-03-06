Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E81FC6AC2C6
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 15:15:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZBcn-0004S5-8D; Mon, 06 Mar 2023 09:15:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pZBcW-0004E7-KL
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:15:27 -0500
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pZBcT-0000xT-4O
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:15:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=CAQDfVtq7wC1LUvf8Tll812QBlmmucFWCn7COftXWKg=; b=JqIgB0YZtm1xJiwnzL0n2/OyHs
 hUUsiKjeBCEKgFlC4r1KVwYeaSgS/5jjvUnkOXtKF0muKOHvPqTrS5771BTqn3zFk/ttDjFor0cVe
 ap9Ij+6+PsRjB4Tdr182iOLW/Ya6CauFqVbqyz/famVmwLqhEnWp3OowigGGyGwfeswcHYvcDVS9s
 uxkvdWWc57gvnOWXoadv+Xqy8k9pFXYhPW+r+I2En4AR6RxFDMYT7XP1/W7PckZqjvfKgk8RmPe+f
 vGVSevP1BIc9bBpGS2aPJoatA+6caE1v7PD8WM40sQ9ZTYl8hZX+ua3qoej3KUwRGsRkOVRV9TqLv
 Ae+KuncmW3utm200aDywI28QrxQxy8oAvSqHkYDyoviZMS+ccq2PMDhApeJa3hq5nbZUr2AwLR3zd
 HJ1ySnzoAxSZyVXh3ECtUVfSOjSyQWU24uak2u4r3zh62QG1KSjQ0LWDmub033kIR2WVPH/S1TD7O
 vHEtUmgIe1vwx4vcMVUEyd9ljUP/S5nE+eya8n7bCYW80fj45O1DcLUqLDF5BKrDB+0MHfhuPPZX1
 hbD8BWMAyFq+BOapJ4YLdcGX8IRRDHAzi6XbjeSuo6/vGdOcC9W4zM/umpwnkErgf/QIhbGqR+S5X
 sIIJgYj3dhFhyLPqbGxFZG8dZ+cceZD1KDG0rKM/M=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: Re: [PATCH v5 00/16] hw/9pfs: Add 9pfs support for Windows
Date: Mon, 06 Mar 2023 15:15:10 +0100
Message-ID: <5311946.tteGgEznqY@silver>
In-Reply-To: <20230220100815.1624266-1-bin.meng@windriver.com>
References: <20230220100815.1624266-1-bin.meng@windriver.com>
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

On Monday, February 20, 2023 11:07:59 AM CET Bin Meng wrote:
> At present there is no Windows support for 9p file system.
> This series adds initial Windows support for 9p file system.
> 
> 'local' file system backend driver is supported on Windows,
> including open, read, write, close, rename, remove, etc.
> All security models are supported. The mapped (mapped-xattr)
> security model is implemented using NTFS Alternate Data Stream
> (ADS) so the 9p export path shall be on an NTFS partition.
> 
> 'synth' driver is adapted for Windows too so that we can now
> run qtests on Windows for 9p related regression testing.
> 
> Example command line to test:
>   "-fsdev local,path=c:\msys64,security_model=mapped,id=p9 -device 
virtio-9p-pci,fsdev=p9,mount_tag=p9fs"
> 
> Changes in v5:
> - rework Windows specific xxxdir() APIs implementation

I didn't have the chance to look at this v5 yet.

In general it would help for review to point out in the cover letter which 
patch(es) have changed, what decisions you have made and why.

In this case I guess that's patch 4.

Best regards,
Christian Schoenebeck

> Bin Meng (2):
>   hw/9pfs: Update helper qemu_stat_rdev()
>   hw/9pfs: Add a helper qemu_stat_blksize()
> 
> Guohuai Shi (14):
>   hw/9pfs: Add missing definitions for Windows
>   hw/9pfs: Implement Windows specific utilities functions for 9pfs
>   hw/9pfs: Replace the direct call to xxxdir() APIs with a wrapper
>   hw/9pfs: Implement Windows specific xxxdir() APIs
>   hw/9pfs: Update the local fs driver to support Windows
>   hw/9pfs: Support getting current directory offset for Windows
>   hw/9pfs: Disable unsupported flags and features for Windows
>   hw/9pfs: Update v9fs_set_fd_limit() for Windows
>   hw/9pfs: Add Linux error number definition
>   hw/9pfs: Translate Windows errno to Linux value
>   fsdev: Disable proxy fs driver on Windows
>   hw/9pfs: Update synth fs driver for Windows
>   tests/qtest: virtio-9p-test: Adapt the case for win32
>   meson.build: Turn on virtfs for Windows
> 
>  meson.build                           |   10 +-
>  fsdev/file-op-9p.h                    |   33 +
>  hw/9pfs/9p-linux-errno.h              |  151 +++
>  hw/9pfs/9p-local.h                    |    8 +
>  hw/9pfs/9p-util.h                     |  139 ++-
>  hw/9pfs/9p.h                          |   43 +
>  tests/qtest/libqos/virtio-9p-client.h |    7 +
>  fsdev/qemu-fsdev.c                    |    2 +
>  hw/9pfs/9p-local.c                    |  269 ++++-
>  hw/9pfs/9p-synth.c                    |    5 +-
>  hw/9pfs/9p-util-win32.c               | 1452 +++++++++++++++++++++++++
>  hw/9pfs/9p.c                          |   90 +-
>  hw/9pfs/codir.c                       |    2 +-
>  fsdev/meson.build                     |    1 +
>  hw/9pfs/meson.build                   |    8 +-
>  15 files changed, 2155 insertions(+), 65 deletions(-)
>  create mode 100644 hw/9pfs/9p-linux-errno.h
>  create mode 100644 hw/9pfs/9p-util-win32.c




