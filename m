Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F152B940C
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 15:02:32 +0100 (CET)
Received: from localhost ([::1]:51454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfkW7-00066c-Ck
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 09:02:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kfkUI-0005Q1-8g
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 09:00:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kfkU6-0004YW-Rb
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 09:00:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605794425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v5zriwP0OnSwK6NKoqnrYTRLRPG7ftIOBDrM7ASp+mk=;
 b=YXwin5MB4v9BVaW1qCdjqP2m+2uFvE3wr7vE/29E/1E6rHHj9sCrZUaotjYHchXqpZWv0L
 GrRiOc7NbF349Eid0gxvnCHrOE8g/7kPWg84qovaKldmRuG1toOzmJXS//w4kE1DwvMP8E
 qVKCURhW55CEANHNFbUH1h4UClqBC/Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-oD-l0DRzPcOrndzkvWo3nw-1; Thu, 19 Nov 2020 09:00:21 -0500
X-MC-Unique: oD-l0DRzPcOrndzkvWo3nw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 796B9100C603;
 Thu, 19 Nov 2020 14:00:19 +0000 (UTC)
Received: from localhost (ovpn-115-68.ams2.redhat.com [10.36.115.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD0B15D6A8;
 Thu, 19 Nov 2020 14:00:11 +0000 (UTC)
Date: Thu, 19 Nov 2020 14:00:10 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 00/10] vhost/qemu: thread per IO SCSI vq
Message-ID: <20201119140010.GD838210@stefanha-x1.localdomain>
References: <1605223150-10888-1-git-send-email-michael.christie@oracle.com>
 <20201117164043.GS131917@stefanha-x1.localdomain>
 <b3343762-bb11-b750-46ec-43b5556f2b8e@oracle.com>
 <20201118044620-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20201118044620-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8nsIa27JVQLqB7/C"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 03:44:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: fam@euphon.net, linux-scsi@vger.kernel.org, jasowang@redhat.com,
 qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org,
 target-devel@vger.kernel.org, pbonzini@redhat.com,
 Mike Christie <michael.christie@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--8nsIa27JVQLqB7/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2020 at 04:54:07AM -0500, Michael S. Tsirkin wrote:
> On Tue, Nov 17, 2020 at 01:13:14PM -0600, Mike Christie wrote:
> > On 11/17/20 10:40 AM, Stefan Hajnoczi wrote:
> > > On Thu, Nov 12, 2020 at 05:18:59PM -0600, Mike Christie wrote:
> > >> The following kernel patches were made over Michael's vhost branch:
> > >>
> > >> https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git/log/?h=
=3Dvhost
> > >>
> > >> and the vhost-scsi bug fix patchset:
> > >>
> > >> https://lore.kernel.org/linux-scsi/20201112170008.GB1555653@stefanha=
-x1.localdomain/T/#t
> > >>
> > >> And the qemu patch was made over the qemu master branch.
> > >>
> > >> vhost-scsi currently supports multiple queues with the num_queues
> > >> setting, but we end up with a setup where the guest's scsi/block
> > >> layer can do a queue per vCPU and the layers below vhost can do
> > >> a queue per CPU. vhost-scsi will then do a num_queue virtqueues,
> > >> but all IO gets set on and completed on a single vhost-scsi thread.
> > >> After 2 - 4 vqs this becomes a bottleneck.
> > >>
> > >> This patchset allows us to create a worker thread per IO vq, so we
> > >> can better utilize multiple CPUs with the multiple queues. It
> > >> implments Jason's suggestion to create the initial worker like
> > >> normal, then create the extra workers for IO vqs with the
> > >> VHOST_SET_VRING_ENABLE ioctl command added in this patchset.
> > >=20
> > > How does userspace find out the tids and set their CPU affinity?
> > >=20
> >=20
> > When we create the worker thread we add it to the device owner's cgroup=
,
> > so we end up inheriting those settings like affinity.
> >=20
> > However, are you more asking about finer control like if the guest is
> > doing mq, and the mq hw queue is bound to cpu0, it would perform
> > better if we could bind vhost vq's worker thread to cpu0? I think the
> > problem might is if you are in the cgroup then we can't set a specific
> > threads CPU affinity to just one specific CPU. So you can either do
> > cgroups or not.
>=20
> Something we wanted to try for a while is to allow userspace
> to create threads for us, then specify which vqs it processes.

Do you mean an interface like a blocking ioctl(vhost_fd,
VHOST_WORKER_RUN) where the vhost processing is done in the context of
the caller's userspace thread?

What is neat about this is that it removes thread configuration from the
kernel vhost code. On the other hand, userspace still needs an interface
indicating which vqs should be processed. Maybe it would even require an
int worker_fd =3D ioctl(vhost_fd, VHOST_WORKER_CREATE) and then
ioctl(worker_fd, VHOST_WORKER_BIND_VQ, vq_idx)? So then it becomes
complex again...

Stefan

--8nsIa27JVQLqB7/C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+2emoACgkQnKSrs4Gr
c8jXaAf/eOlKgp0ihGCZvY9wziHeB36cX6eC0Dv+PJy3mJGo2l+FH5eS5saaT9As
OchpLrd+7iNH5qN6NL9GxP3TuiWa7mjIjAxNA7QQYq976m6sZShkVldvzZGcxron
M2ow96BMZznx/O9FlXS5GOqB9GOjL8cq1b5g4lt4uVbMHQL/MhqBc5byq0UzX6NG
Aw2wcTfrsqX7hXFb0Y2dj/BE2+tCAuMYsVzs107UQdaxezKVkU+Xhpy17U04iD7h
Ej1D4O088QNDcx8YTlrGRBG4O1A63u4SWSFcSut+W+vGqUJ8mdUrahqp7iyM9mkY
sxBWIzLKVhQ0VkKsGxeDGeeYVNEpiA==
=1sap
-----END PGP SIGNATURE-----

--8nsIa27JVQLqB7/C--


