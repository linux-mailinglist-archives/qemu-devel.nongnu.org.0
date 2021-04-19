Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A77364735
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 17:36:00 +0200 (CEST)
Received: from localhost ([::1]:48132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYVwN-0000eA-C5
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 11:35:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1lYVs4-0006Xx-HN; Mon, 19 Apr 2021 11:31:32 -0400
Received: from smtpout1.mo3005.mail-out.ovh.net ([79.137.123.220]:34299
 helo=smtpout1.3005.mail-out.ovh.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1lYVs1-0000Lk-KL; Mon, 19 Apr 2021 11:31:32 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.240])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id 5FE8813FF2C;
 Mon, 19 Apr 2021 15:31:25 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 19 Apr
 2021 17:31:24 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G00266e39b21-393b-4979-995d-e4b84320a30e,
 46AAC9759BA53E9FB91E72FBECCB4B778E055062) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Mon, 19 Apr 2021 17:31:23 +0200
From: Greg Kurz <groug@kaod.org>
To: <qemu-devel@nongnu.org>
Subject: Re: [for-6.1 0/4] virtio: Improve boot time of virtio-scsi-pci and
 virtio-blk-pci
Message-ID: <20210419173123.05f20e6e@bahia.lan>
In-Reply-To: <20210407143501.244343-1-groug@kaod.org>
References: <20210407143501.244343-1-groug@kaod.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 155257eb-64ef-4e58-8607-ead5fdffe075
X-Ovh-Tracer-Id: 11695003807436020015
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrvddtgedgledtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedvfefgtdegleduudejjeelfffghfehtdeigefggfduvdfgkeevgfeftedtjeehveenucffohhmrghinheprhgvughhrghtrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgslhhotghksehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=groug@kaod.org;
 helo=smtpout1.3005.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping ?

On Wed, 7 Apr 2021 16:34:57 +0200
Greg Kurz <groug@kaod.org> wrote:

> Now that virtio-scsi-pci and virtio-blk-pci map 1 virtqueue per vCPU,
> a serious slow down may be observed on setups with a big enough number
> of vCPUs.
> 
> Exemple with a pseries guest on a bi-POWER9 socket system (128 HW threads):
> 
>               virtio-scsi      virtio-blk
> 
> 1		0m20.922s	0m21.346s
> 2		0m21.230s	0m20.350s
> 4		0m21.761s	0m20.997s
> 8		0m22.770s	0m20.051s
> 16		0m22.038s	0m19.994s
> 32		0m22.928s	0m20.803s
> 64		0m26.583s	0m22.953s
> 128		0m41.273s	0m32.333s
> 256		2m4.727s 	1m16.924s
> 384		6m5.563s 	3m26.186s
> 
> Both perf and gprof indicate that QEMU is hogging CPUs when setting up
> the ioeventfds:
> 
>  67.88%  swapper         [kernel.kallsyms]  [k] power_pmu_enable
>   9.47%  qemu-kvm        [kernel.kallsyms]  [k] smp_call_function_single
>   8.64%  qemu-kvm        [kernel.kallsyms]  [k] power_pmu_enable
> =>2.79%  qemu-kvm        qemu-kvm           [.] memory_region_ioeventfd_before
> =>2.12%  qemu-kvm        qemu-kvm           [.] address_space_update_ioeventfds
>   0.56%  kworker/8:0-mm  [kernel.kallsyms]  [k] smp_call_function_single
> 
> address_space_update_ioeventfds() is called when committing an MR
> transaction, i.e. for each ioeventfd with the current code base,
> and it internally loops on all ioventfds:
> 
> static void address_space_update_ioeventfds(AddressSpace *as)
> {
> [...]
>     FOR_EACH_FLAT_RANGE(fr, view) {
>         for (i = 0; i < fr->mr->ioeventfd_nb; ++i) {
> 
> This means that the setup of ioeventfds for these devices has
> quadratic time complexity.
> 
> This series simply changes the device models to extend the transaction
> to all virtqueueues, like already done in the past in the generic
> code with 710fccf80d78 ("virtio: improve virtio devices initialization
> time").
> 
> Only virtio-scsi and virtio-blk are covered here, but a similar change
> might also be beneficial to other device types such as host-scsi-pci,
> vhost-user-scsi-pci and vhost-user-blk-pci.
> 
>               virtio-scsi      virtio-blk
> 
> 1		0m21.271s	0m22.076s
> 2		0m20.912s	0m19.716s
> 4		0m20.508s	0m19.310s
> 8		0m21.374s	0m20.273s
> 16		0m21.559s	0m21.374s
> 32		0m22.532s	0m21.271s
> 64		0m26.550s	0m22.007s
> 128		0m29.115s	0m27.446s
> 256		0m44.752s	0m41.004s
> 384		1m2.884s	0m58.023s
> 
> This should fix https://bugzilla.redhat.com/show_bug.cgi?id=1927108
> which reported the issue for virtio-scsi-pci.
> 
> Changes since RFC:
> 
> As suggested by Stefan, splimplify the code by directly beginning and
> committing the memory transaction from the device model, without all
> the virtio specific proxying code and no changes needed in the memory
> subsystem.
> 
> Greg Kurz (4):
>   virtio-blk: Fix rollback path in virtio_blk_data_plane_start()
>   virtio-blk: Configure all host notifiers in a single MR transaction
>   virtio-scsi: Set host notifiers and callbacks separately
>   virtio-scsi: Configure all host notifiers in a single MR transaction
> 
>  hw/block/dataplane/virtio-blk.c | 36 +++++++++++++++++++--
>  hw/scsi/virtio-scsi-dataplane.c | 56 ++++++++++++++++++++++-----------
>  2 files changed, 72 insertions(+), 20 deletions(-)
> 


