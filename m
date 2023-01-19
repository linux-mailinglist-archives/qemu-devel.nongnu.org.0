Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF25967411D
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 19:40:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIZpd-0003RJ-HU; Thu, 19 Jan 2023 13:40:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1pIZpS-0003PQ-R1
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:40:04 -0500
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1pIZpL-0008Dt-3z
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:39:59 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.193])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id BC91623684;
 Thu, 19 Jan 2023 18:39:51 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG8EX2.mxp5.local (172.16.2.72)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Thu, 19 Jan
 2023 19:39:50 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005d98e6796-6e25-42f1-a59a-8cb8a4532851,
 24E9BC4E0C08A0C5F41A8E8F02276630B3C3193A) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Thu, 19 Jan 2023 19:39:49 +0100
From: Greg Kurz <groug@kaod.org>
To: <qemu-devel@nongnu.org>
CC: Stefan Hajnoczi <stefanha@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Maxime Coquelin <maxime.coquelin@redhat.com>, Laurent
 Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Yajun Wu
 <yajunw@nvidia.com>, Peter Maydell <peter.maydell@linaro.org>, Parav Pandit
 <parav@nvidia.com>, <qemu-stable@nongnu.org>, Yanghang Liu
 <yanghliu@redhat.com>
Subject: Re: [PATCH 1/2] Revert "vhost-user: Monitor slave channel in
 vhost_user_read()"
Message-ID: <20230119193949.013738a0@bahia>
In-Reply-To: <20230119172424.478268-2-groug@kaod.org>
References: <20230119172424.478268-1-groug@kaod.org>
 <20230119172424.478268-2-groug@kaod.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG8EX2.mxp5.local
 (172.16.2.72)
X-Ovh-Tracer-GUID: 59afe075-a8f7-457c-b8fb-0e4bceb2d9b1
X-Ovh-Tracer-Id: 10265673878283196917
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedruddutddguddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffheefheevleetieetheffjeetgfdttedtlefgieelfffhgedvteekvddttdehleenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhrvgguhhgrthdrtghomhenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehgrhhouhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpshhtvghfrghnhhgrsehrvgguhhgrthdrtghomhdpughgihhlsggvrhhtsehrvgguhhgrthdrtghomhdpmhgrgihimhgvrdgtohhquhgvlhhinhesrhgvughhrghtrdgtohhmpdhlvhhivhhivghrsehrvgguhhgrthdrtghomhdpmhhsthesrhgvughhrghtrdgtohhmpdihrghjuhhnfiesnhhvihguihgrrdgtohhmpdhpvghtvghrrdhmrgihuggvlh
 hlsehlihhnrghrohdrohhrghdpphgrrhgrvhesnhhvihguihgrrdgtohhmpdhqvghmuhdqshhtrggslhgvsehnohhnghhnuhdrohhrghdphigrnhhghhhlihhusehrvgguhhgrthdrtghomhdpoffvtefjohhsthepmhhoheegkedpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=46.105.48.137; envelope-from=groug@kaod.org;
 helo=9.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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

For some reason, the cover letter didn't make it, even though
git publish reported it was sent. I'll repost tomorrow if it
is still missing (or possibly craft a message manually with
the appropriate id if I find time).

Sorry for the inconvenience.

Cheers,

--
Greg


On Thu, 19 Jan 2023 18:24:23 +0100
Greg Kurz <groug@kaod.org> wrote:

> This reverts commit db8a3772e300c1a656331a92da0785d81667dc81.
> 
> Motivation : this is breaking vhost-user with DPDK as reported in [0].
> 
> Received unexpected msg type. Expected 22 received 40
> Fail to update device iotlb
> Received unexpected msg type. Expected 40 received 22
> Received unexpected msg type. Expected 22 received 11
> Fail to update device iotlb
> Received unexpected msg type. Expected 11 received 22
> vhost VQ 1 ring restore failed: -71: Protocol error (71)
> Received unexpected msg type. Expected 22 received 11
> Fail to update device iotlb
> Received unexpected msg type. Expected 11 received 22
> vhost VQ 0 ring restore failed: -71: Protocol error (71)
> unable to start vhost net: 71: falling back on userspace virtio
> 
> The failing sequence that leads to the first error is :
> - QEMU sends a VHOST_USER_GET_STATUS (40) request to DPDK on the master
>   socket
> - QEMU starts a nested event loop in order to wait for the
>   VHOST_USER_GET_STATUS response and to be able to process messages from
>   the slave channel
> - DPDK sends a couple of legitimate IOTLB miss messages on the slave
>   channel
> - QEMU processes each IOTLB request and sends VHOST_USER_IOTLB_MSG (22)
>   updates on the master socket
> - QEMU assumes to receive a response for the latest VHOST_USER_IOTLB_MSG
>   but it gets the response for the VHOST_USER_GET_STATUS instead
> 
> The subsequent errors have the same root cause : the nested event loop
> breaks the order by design. It lures QEMU to expect responses to the
> latest message sent on the master socket to arrive first.
> 
> Since this was only needed for DAX enablement which is still not merged
> upstream, just drop the code for now. A working solution will have to
> be merged later on. Likely protect the master socket with a mutex
> and service the slave channel with a separate thread, as discussed with
> Maxime in the mail thread below.
> 
> [0] https://lore.kernel.org/qemu-devel/43145ede-89dc-280e-b953-6a2b436de395@redhat.com/
> 
> Reported-by: Yanghang Liu <yanghliu@redhat.com>
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2155173
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  hw/virtio/vhost-user.c | 35 +++--------------------------------
>  1 file changed, 3 insertions(+), 32 deletions(-)
> 
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index d9ce0501b2c7..7fb78af22c56 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -356,35 +356,6 @@ end:
>      return G_SOURCE_REMOVE;
>  }
>  
> -static gboolean slave_read(QIOChannel *ioc, GIOCondition condition,
> -                           gpointer opaque);
> -
> -/*
> - * This updates the read handler to use a new event loop context.
> - * Event sources are removed from the previous context : this ensures
> - * that events detected in the previous context are purged. They will
> - * be re-detected and processed in the new context.
> - */
> -static void slave_update_read_handler(struct vhost_dev *dev,
> -                                      GMainContext *ctxt)
> -{
> -    struct vhost_user *u = dev->opaque;
> -
> -    if (!u->slave_ioc) {
> -        return;
> -    }
> -
> -    if (u->slave_src) {
> -        g_source_destroy(u->slave_src);
> -        g_source_unref(u->slave_src);
> -    }
> -
> -    u->slave_src = qio_channel_add_watch_source(u->slave_ioc,
> -                                                G_IO_IN | G_IO_HUP,
> -                                                slave_read, dev, NULL,
> -                                                ctxt);
> -}
> -
>  static int vhost_user_read(struct vhost_dev *dev, VhostUserMsg *msg)
>  {
>      struct vhost_user *u = dev->opaque;
> @@ -406,7 +377,6 @@ static int vhost_user_read(struct vhost_dev *dev, VhostUserMsg *msg)
>       * be prepared for re-entrancy. So we create a new one and switch chr
>       * to use it.
>       */
> -    slave_update_read_handler(dev, ctxt);
>      qemu_chr_be_update_read_handlers(chr->chr, ctxt);
>      qemu_chr_fe_add_watch(chr, G_IO_IN | G_IO_HUP, vhost_user_read_cb, &data);
>  
> @@ -418,7 +388,6 @@ static int vhost_user_read(struct vhost_dev *dev, VhostUserMsg *msg)
>       * context that have been processed by the nested loop are purged.
>       */
>      qemu_chr_be_update_read_handlers(chr->chr, prev_ctxt);
> -    slave_update_read_handler(dev, NULL);
>  
>      g_main_loop_unref(loop);
>      g_main_context_unref(ctxt);
> @@ -1807,7 +1776,9 @@ static int vhost_setup_slave_channel(struct vhost_dev *dev)
>          return -ECONNREFUSED;
>      }
>      u->slave_ioc = ioc;
> -    slave_update_read_handler(dev, NULL);
> +    u->slave_src = qio_channel_add_watch_source(u->slave_ioc,
> +                                                G_IO_IN | G_IO_HUP,
> +                                                slave_read, dev, NULL, NULL);
>  
>      if (reply_supported) {
>          msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;


