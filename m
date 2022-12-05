Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEC764254F
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 10:03:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p27M8-0003vF-J5; Mon, 05 Dec 2022 04:01:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d.tihov@yadro.com>)
 id 1p27M4-0003uJ-RQ; Mon, 05 Dec 2022 04:01:40 -0500
Received: from mta-02.yadro.com ([89.207.88.252] helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d.tihov@yadro.com>)
 id 1p27M2-0002ni-6E; Mon, 05 Dec 2022 04:01:40 -0500
Received: from mta-01.yadro.com (localhost.localdomain [127.0.0.1])
 by mta-01.yadro.com (Proxmox) with ESMTP id AE3233414AD;
 Mon,  5 Dec 2022 12:01:31 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; h=cc
 :cc:content-type:content-type:date:from:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to; s=mta-01; bh=zwcLhcbsAC1JE6IxnCmahivf6NR9dLNrhKKWNby3Trg=; b=
 TjEpIEUL7ZI4iz2Nu0xhTPkf91eV26f1Yy8kaadfIOJeOnnmnRFPULnq9srQgyl8
 GgAPvprv38E1SlwsxNWzvVrFU6/mB5PpZtIn/peyatVn9L4aOnbODKNFOx7rKjRj
 SHgCe6j32JTAa0VtQyvUN5ReCA5vsagpGNtvgOBKkPk=
Received: from T-EXCH-08.corp.yadro.com (unknown [172.17.10.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Proxmox) with ESMTPS id A2E5F3414A5;
 Mon,  5 Dec 2022 12:01:31 +0300 (MSK)
Received: from T-EXCH-09.corp.yadro.com (172.17.11.59) by
 T-EXCH-08.corp.yadro.com (172.17.11.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.9; Mon, 5 Dec 2022 12:01:31 +0300
Received: from archlinux (10.199.17.226) by T-EXCH-09.corp.yadro.com
 (172.17.11.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1118.9; Mon, 5 Dec 2022
 12:01:30 +0300
Date: Mon, 5 Dec 2022 12:01:29 +0300
From: Dmitry Tihov <d.tihov@yadro.com>
To: Klaus Jensen <its@irrelevant.dk>
CC: <qemu-block@nongnu.org>, <qemu-devel@nongnu.org>, <kbusch@kernel.org>,
 <linux@yadro.com>, <m.malygin@yadro.com>, <a.buev@yadro.com>,
 <ddtikhov@gmail.com>, Kevin Wolf <kwolf@redhat.com>, Hanna Reitz
 <hreitz@redhat.com>
Subject: Re: [RFC 0/5] Protection information pass-through for block devices
Message-ID: <20221205090129.enmhx6lq34g2owkw@archlinux>
References: <20221124155821.1501969-1-d.tihov@yadro.com>
 <Y4ByUi5gOH6swqMS@cormorant.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y4ByUi5gOH6swqMS@cormorant.local>
X-Originating-IP: [10.199.17.226]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-09.corp.yadro.com (172.17.11.59)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=d.tihov@yadro.com;
 helo=mta-01.yadro.com
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

On Fri, Nov 25, 2022 at 08:44:18, Klaus Jensen wrote:
> +CC: block layer maintainers (Kevin, Hanna)
> 
> On Nov 24 18:58, Dmitry Tihov wrote:
> > This patch set allows using End-to-End Data Protection in NVMe subsystem
> > with integrity capable host devices as the NVMe namespaces backend.
> > The patch series is based on io-uring kernel interface feature not merged
> > to kernel upstream yet:
> > https://lore.kernel.org/linux-block/20220920144618.1111138-1-a.buev@yadro.com/
> > 
> > The main advantage of this approach is that it allows using the
> > same protection information enabled disks in multiple VMs
> > concurrently. This may be useful in cluster setups.
> > 
> > Please let me know what do you think, are this kind of changes appropriate
> > for QEMU upstream, what should be changed, etc.
> > 
> > Dmitry Tihov (5):
> >   docs/nvme: add new feature summary
> >   block: add transfer of protection information
> >   hw/nvme: add protection information pass parameter
> >   hw/nvme: implement pi pass read/write/wrz commands
> >   hw/nvme: extend pi pass capable commands
> > 
> >  block/file-posix.c           | 130 ++++++++++++-
> >  block/io_uring.c             | 109 ++++++++++-
> >  docs/system/devices/nvme.rst |  15 ++
> >  hw/nvme/ctrl.c               | 361 ++++++++++++++++++++++++++++++++---
> >  hw/nvme/dif.c                | 303 +++++++++++++++++++++++++++++
> >  hw/nvme/dif.h                |  18 ++
> >  hw/nvme/ns.c                 |  59 +++++-
> >  hw/nvme/nvme.h               |   2 +
> >  hw/nvme/trace-events         |   6 +
> >  include/block/block-common.h |   2 +
> >  include/block/raw-aio.h      |   3 +-
> >  include/qemu/iov.h           |   6 +
> >  util/iov.c                   |  24 +++
> >  13 files changed, 992 insertions(+), 46 deletions(-)
> > 
> > -- 
> > 2.38.1
> > 
> 
> Hi Dmitry,
> 
> Neat.
> 
> But this is largely depending on how the API turns out in block/ and I
> am not the right one to comment on that. It's great that you have an
> example device to utilize the API, but this needs comments from the
> block layer maintainers before we consider it in hw/nvme.

You mean API in QEMU block layer right? Specifically the second patch
of this series. Should I send it in a distinct RFC for review by block
layer maintainers?


