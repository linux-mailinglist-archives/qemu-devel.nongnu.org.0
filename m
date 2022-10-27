Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E4E60FD2C
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 18:34:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo5nI-0002vh-1H; Thu, 27 Oct 2022 12:31:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oo5nF-0002qn-VX
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 12:31:45 -0400
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oo5nB-0008UK-Qh
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 12:31:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=aIX7DoWyd+eolGrjWtXM+k8pxhGeWRtJ/wx9mu6dgFY=; b=riZE3kObVib2f1HPU1L3sETEsF
 w925muPxdt3mn0v/1AMvLkjXRsLdZSRBMbET1D5Bjs6YWDrUCTEJe5pbJo6xt9hKQ/RAZZGV/xado
 H8b+Z/9cbEXKnpQtAmZ5X9066FhktXbh69AduPdkUHDp3gWqG+WkQjAfUXl3o/P5rsJW/D7F+ObaO
 bBO084DhtjZl2gwDOFDggAlelG7iodSUUFBzFaD9g7rTas6hRyRdZ/saciG4nY8T1Y5selbnPB3fP
 zcEtEGS8LGKe049w6cQfV2IwmzLjr6Qj5ahz0m4Fa7zcKpkk6FEmqIubJKYRMRe6fdZiNsWcPR/ys
 XZBYZUeeRGTdS16q3iGdBiGqI3vPm1twINjYjkII90A4q8fmn2khtSWYt88J833qqIUTHa/VJ5xzd
 XAXeUA+p4bZ23ZDBddQ/yYQVkfj8Jccb2v68P1DSBRpunnin46zDCGTGB9G68qv0yiPC53b76a53y
 JIM8fExP0lxBu5FBHL3o5SLLvPpkRhyFsnjlybYM1NgU3dpSfy/albZy4C/yBgDCixtl2NmRlJd4S
 OQuA3q73Mf8uwjBthRgEVioVtnGKh8QshRQMxHPe3jf5kJUrXRgsJ3h8HLExPwdKJg64z5JLm5kFo
 Ok4Ztno5HzW/2ddjjndaI0Qxmzcm5hY38hdHxhF5Q=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 Keno Fischer <keno@juliacomputing.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>, Will Cohen <wwcohen@gmail.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: Re: [PATCH 00/16] hw/9pfs: Add 9pfs support for Windows
Date: Thu, 27 Oct 2022 18:30:02 +0200
Message-ID: <13126592.PNbLGPOa45@silver>
In-Reply-To: <CAEUhbmV632N-w7yAj2jcmRMa_XMGi+jRJ-riFK5jBZFjgoyrAg@mail.gmail.com>
References: <20221024045759.448014-1-bin.meng@windriver.com>
 <CAEUhbmV632N-w7yAj2jcmRMa_XMGi+jRJ-riFK5jBZFjgoyrAg@mail.gmail.com>
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thursday, October 27, 2022 6:19:27 PM CEST Bin Meng wrote:
> Hi Christian,
> 
> On Mon, Oct 24, 2022 at 1:16 PM Bin Meng <bin.meng@windriver.com> wrote:
> >
> > At present there is no Windows support for 9p file system.
> > This series adds initial Windows support for 9p file system.
> >
> > 'local' file system backend driver is supported on Windows,
> > including open, read, write, close, rename, remove, etc.
> > All security models are supported. The mapped (mapped-xattr)
> > security model is implemented using NTFS Alternate Data Stream
> > (ADS) so the 9p export path shall be on an NTFS partition.
> >
> > 'synth' driver is adapted for Windows too so that we can now
> > run qtests on Windows for 9p related regression testing.
> >
> > Example command line to test:
> >
> >   "-fsdev local,path=c:\msys64,security_model=mapped,id=p9 -device virtio-9p-pci,fsdev=p9,mount_tag=p9fs"
> >
> >
> > Bin Meng (5):
> >   qemu/xattr.h: Exclude <sys/xattr.h> for Windows
> >   hw/9pfs: Drop unnecessary *xattr wrapper API declarations
> >   hw/9pfs: Replace the direct call to xxxat() APIs with a wrapper
> >   hw/9pfs: Introduce an opaque type 9P_FILE_ID
> >   hw/9pfs: Update P9_FILE_ID to support Windows
> >
> > Guohuai Shi (11):
> >   hw/9pfs: Add missing definitions for Windows
> >   hw/9pfs: Implement Windows specific utilities functions for 9pfs
> >   hw/9pfs: Handle current directory offset for Windows
> >   hw/9pfs: Disable unsupported flags and features for Windows
> >   hw/9pfs: Update the local fs driver to support Windows
> >   hw/9pfs: Add Linux error number definition
> >   hw/9pfs: Translate Windows errno to Linux value
> >   fsdev: Disable proxy fs driver on Windows
> >   hw/9pfs: Update synth fs driver for Windows
> >   tests/qtest: virtio-9p-test: Adapt the case for win32
> >   meson.build: Turn on virtfs for Windows
> >
> 
> With the latest 9p test case refactoring in the mainline, I will have
> to cherry-pick the following 2 patches in this series, to v6 of
> "tests/qtest: Enable running qtest on Windows" series [1], in order to
> get qtest on Windows build successfully.
> 
> [06/16] hw/9pfs: Add missing definitions for Windows
> [15/16] tests/qtest: virtio-9p-test: Adapt the case for win32
> 
> I will include the above 2 patches in the v6 qtest windows support series.

No need to add those patches as they are already being queued separately. Just
add appropriate tag(s) to the first patch:

Based-on: <MESSAGE-ID>

I already had a quick look on this version, will try to give feedback
tomorrow.

This feature won't make it into 7.2 release anyway, so patience please. ;-)

Best regards,
Christian Schoenebeck

> [1] http://patchwork.ozlabs.org/project/qemu-devel/list/?series=321695
> 
> Regards,
> Bin
> 



