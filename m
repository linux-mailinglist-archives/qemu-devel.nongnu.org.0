Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA7551A96D
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 19:17:42 +0200 (CEST)
Received: from localhost ([::1]:57974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmIdB-0007ow-J5
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 13:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nmIbk-00075H-Ki
 for qemu-devel@nongnu.org; Wed, 04 May 2022 13:16:12 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:41757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nmIbi-0007ox-Rm
 for qemu-devel@nongnu.org; Wed, 04 May 2022 13:16:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=6emf5GdoD3Ufzidugd92x0Gp3f4FhwnX8/VXmZX9XKE=; b=YQVq/HjoVECcy3CW/E0bX4Cy7d
 PP1PXWtEB4gHWr1z0+e0f+eXoSFIza21QEOLWkNDwEIxffp6cpukvgPhub7w2bdLHc8VmqfUgWY+/
 r/liVbMLVAi7Vh54jxvae4FIWgqVd9C1D6/599+q/4Vhsk/GQ/yA3tTNsW5JM/nBn03bTbnApHn/E
 h1D9vSc2T8xSRANPIO/1mPt2xund9jTk6YU9vIWyEPUgMCeCFzTaJM6jZYmorxJvFfoAWq84NmHC6
 Na3cRgwLKj8m2jN9JIxGZbSOuUeE9SajfDlAaNKIKZKQgoHey+Ffkc9vkeN40LswzBEnf4Gh4LBnu
 c3kOnAaVBrO10rbBaC50J0roH4Opmq3xPBbziJ8H7PNYtsCaO43ISsW1R1StgH4h+5KfVn6fAmAcp
 RuH1LzHNj36iQ2R3fX9SqmQOejMWE3Lwj+u33NhcQFB6EzaZzIDJq0HaGkwSWDt8/hkrvwR23aNqI
 Z2phkjGFNLabX7HOb50zWQnZ9QeofskY3iOl/IAuM6iFtXS2NLcw1fvPOx4cTSLC3Y1l0volKEvJn
 o72D415aqd0n1yo+28uI/m24oAGJGcuAouZEnh7pSPY+5roS7RdCLiAfu6vTaQn3pCgnQT/GvG4ti
 y6RWsibod/daOD2TAi88fAmbPE+oBVOIKzaGTItvs=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Guohuai Shi <guohuai.shi@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH 0/9] 9pfs: Add 9pfs support for Windows host
Date: Wed, 04 May 2022 19:16:04 +0200
Message-ID: <8929528.cynvPzpogj@silver>
In-Reply-To: <CAEUhbmX7fww8qXrr50rKFWU+sf1pz=LDp8daKSWOvkeJVbjWhw@mail.gmail.com>
References: <20220425142705.2099270-1-bmeng.cn@gmail.com>
 <CAEUhbmV6mDnkoKfzJMgs8PSrtTjQ9SnSE3XtgOuY3qaO+F7wJA@mail.gmail.com>
 <CAEUhbmX7fww8qXrr50rKFWU+sf1pz=LDp8daKSWOvkeJVbjWhw@mail.gmail.com>
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

On Dienstag, 3. Mai 2022 05:42:03 CEST Bin Meng wrote:
> On Tue, Apr 26, 2022 at 9:41 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > +Mark
> > 
> > On Mon, Apr 25, 2022 at 10:27 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > At present there is no Windows support for 9p file system.
> > > This series adds initial Windows support for 9p file system.
> > > 
> > > 'local' file system backend driver is supported on Windows,
> > > including open, read, write, close, rename, remove, etc.
> > > All security models are supported. The mapped (mapped-xattr)
> > > security model is implemented using NTFS Alternate Data Stream
> > > (ADS) so the 9p export path shall be on an NTFS partition.
> > > 
> > > 'synth' backend driver is updated only to build sucessuflly
> > > in a Windows build. Funtionalities are not tested as test
> > > cases do not run on Windows at present.

Like I mentioned in the previous RFC version; I don't really see a show 
stopper for the tests to run on Windows:
https://lore.kernel.org/all/4649965.RNUEIdHhq1@silver/

> > > 
> > > Example command line to test:
> > >   "-fsdev local,path=c:\msys64,security_model=mapped,id=p9 -device
> > >   virtio-9p-pci,fsdev=p9,mount_tag=p9fs"
> Any comments to v1 before we send a v2 which will be rebased on master?
> 
> Regards,
> Bin



