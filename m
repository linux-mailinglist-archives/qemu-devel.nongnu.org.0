Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F60C36C66A
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 14:51:58 +0200 (CEST)
Received: from localhost ([::1]:41718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbNC0-0001ju-Sa
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 08:51:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lbNAU-00017y-5i
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 08:50:22 -0400
Received: from 10.mo51.mail-out.ovh.net ([46.105.77.235]:45471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lbNAP-0004O8-Ip
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 08:50:21 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.92])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 1292A28184F;
 Tue, 27 Apr 2021 14:50:10 +0200 (CEST)
Received: from kaod.org (37.59.142.105) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 27 Apr
 2021 14:50:10 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0069df386b5-2c89-4b96-8ac2-53ab7f6e23ea,
 B6AA52F3D5CB607530F59D2ADE64727CB37F7539) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Tue, 27 Apr 2021 14:50:08 +0200
From: Greg Kurz <groug@kaod.org>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [for-6.1 v2 0/2] virtiofsd: Add support for FUSE_SYNCFS request
Message-ID: <20210427145008.5d6914e9@bahia.lan>
In-Reply-To: <YIf1TY4MbAQnCYG0@work-vm>
References: <20210426152135.842037-1-groug@kaod.org> <YIf1TY4MbAQnCYG0@work-vm>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: d41ada90-96be-49ef-ba02-9fba257bfa0c
X-Ovh-Tracer-Id: 613052500005591474
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrvddvtddgheejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefguedvhefhueeivdeiteehgfdtgeeuleegieeiieekffeitdfglefgteelleejtdenucffohhmrghinhepghhithhlrggsrdgtohhmpdhrvgguhhgrthdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepphgsohhniihinhhisehrvgguhhgrthdrtghomh
Received-SPF: pass client-ip=46.105.77.235; envelope-from=groug@kaod.org;
 helo=10.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kvm@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org, virtio-fs@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 27 Apr 2021 12:28:13 +0100
"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:

> * Greg Kurz (groug@kaod.org) wrote:
> > FUSE_SYNCFS allows the client to flush the host page cache.
> > This isn't available in upstream linux yet, but the following
> > tree can be used to test:
> 
> That looks OK to me; but we'll need to wait until syncfs lands in the
> upstream kernel; we've got bitten before by stuff changing before it
> actaully lands in the kernel.
> 

Sure ! I'll repost an updated series when this happens.

Thanks for the feedback.

--
Greg

> Dave
> 
> > https://gitlab.com/gkurz/linux/-/tree/virtio-fs-sync
> > 
> > v2: - based on new version of FUSE_SYNCFS
> >       https://listman.redhat.com/archives/virtio-fs/2021-April/msg00166.html
> >     - propagate syncfs() errors to client (Vivek)
> > 
> > Greg Kurz (2):
> >   Update linux headers to 5.12-rc8 + FUSE_SYNCFS
> >   virtiofsd: Add support for FUSE_SYNCFS request
> > 
> >  include/standard-headers/drm/drm_fourcc.h     | 23 ++++-
> >  include/standard-headers/linux/ethtool.h      | 54 ++++++-----
> >  include/standard-headers/linux/fuse.h         | 13 ++-
> >  include/standard-headers/linux/input.h        |  2 +-
> >  .../standard-headers/rdma/vmw_pvrdma-abi.h    |  7 ++
> >  linux-headers/asm-generic/unistd.h            |  4 +-
> >  linux-headers/asm-mips/unistd_n32.h           |  1 +
> >  linux-headers/asm-mips/unistd_n64.h           |  1 +
> >  linux-headers/asm-mips/unistd_o32.h           |  1 +
> >  linux-headers/asm-powerpc/kvm.h               |  2 +
> >  linux-headers/asm-powerpc/unistd_32.h         |  1 +
> >  linux-headers/asm-powerpc/unistd_64.h         |  1 +
> >  linux-headers/asm-s390/unistd_32.h            |  1 +
> >  linux-headers/asm-s390/unistd_64.h            |  1 +
> >  linux-headers/asm-x86/kvm.h                   |  1 +
> >  linux-headers/asm-x86/unistd_32.h             |  1 +
> >  linux-headers/asm-x86/unistd_64.h             |  1 +
> >  linux-headers/asm-x86/unistd_x32.h            |  1 +
> >  linux-headers/linux/kvm.h                     | 89 +++++++++++++++++++
> >  linux-headers/linux/vfio.h                    | 27 ++++++
> >  tools/virtiofsd/fuse_lowlevel.c               | 19 ++++
> >  tools/virtiofsd/fuse_lowlevel.h               | 13 +++
> >  tools/virtiofsd/passthrough_ll.c              | 29 ++++++
> >  tools/virtiofsd/passthrough_seccomp.c         |  1 +
> >  24 files changed, 267 insertions(+), 27 deletions(-)
> > 
> > -- 
> > 2.26.3
> > 


