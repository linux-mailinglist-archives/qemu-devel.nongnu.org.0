Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9972B6A7E
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 17:42:27 +0100 (CET)
Received: from localhost ([::1]:58040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf43m-0004IC-B6
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 11:42:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kf42M-00039U-Up
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:40:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kf42K-0002wp-Nz
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:40:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605631253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PrtrctB9G5pEBnZheqS7Drb5ElIcN9MmGROgGZcsg40=;
 b=NdLNpNQ9gfUKEYJzQS1epA20e9JF7J4BQGBjrMCvtbORHQux8SKxoNwatP0WUoYmg/7nvd
 usVUEajWpxRxMBt9aLfi1CahNFkM4obZYEmMLyQhy93hr1oymLvqEYiVrk5DikhQqETv0o
 LCndprbQsCehPlDop0gompKHr6Uvgvs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-QV2m57Y7MBm9bV8zp4uIdg-1; Tue, 17 Nov 2020 11:40:48 -0500
X-MC-Unique: QV2m57Y7MBm9bV8zp4uIdg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91A2A80364C;
 Tue, 17 Nov 2020 16:40:47 +0000 (UTC)
Received: from localhost (ovpn-115-113.ams2.redhat.com [10.36.115.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B1A35D9CC;
 Tue, 17 Nov 2020 16:40:43 +0000 (UTC)
Date: Tue, 17 Nov 2020 16:40:43 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Mike Christie <michael.christie@oracle.com>
Subject: Re: [PATCH 00/10] vhost/qemu: thread per IO SCSI vq
Message-ID: <20201117164043.GS131917@stefanha-x1.localdomain>
References: <1605223150-10888-1-git-send-email-michael.christie@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1605223150-10888-1-git-send-email-michael.christie@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fqIB0bRxfTYxTb/F"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: fam@euphon.net, linux-scsi@vger.kernel.org, mst@redhat.com,
 jasowang@redhat.com, qemu-devel@nongnu.org,
 virtualization@lists.linux-foundation.org, target-devel@vger.kernel.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--fqIB0bRxfTYxTb/F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2020 at 05:18:59PM -0600, Mike Christie wrote:
> The following kernel patches were made over Michael's vhost branch:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git/log/?h=3Dvh=
ost
>=20
> and the vhost-scsi bug fix patchset:
>=20
> https://lore.kernel.org/linux-scsi/20201112170008.GB1555653@stefanha-x1.l=
ocaldomain/T/#t
>=20
> And the qemu patch was made over the qemu master branch.
>=20
> vhost-scsi currently supports multiple queues with the num_queues
> setting, but we end up with a setup where the guest's scsi/block
> layer can do a queue per vCPU and the layers below vhost can do
> a queue per CPU. vhost-scsi will then do a num_queue virtqueues,
> but all IO gets set on and completed on a single vhost-scsi thread.
> After 2 - 4 vqs this becomes a bottleneck.
>=20
> This patchset allows us to create a worker thread per IO vq, so we
> can better utilize multiple CPUs with the multiple queues. It
> implments Jason's suggestion to create the initial worker like
> normal, then create the extra workers for IO vqs with the
> VHOST_SET_VRING_ENABLE ioctl command added in this patchset.

How does userspace find out the tids and set their CPU affinity?

What is the meaning of the new VHOST_SET_VRING_ENABLE ioctl? It doesn't
really "enable" or "disable" the vq, requests are processed regardless.

The purpose of the ioctl isn't clear to me because the kernel could
automatically create 1 thread per vq without a new ioctl. On the other
hand, if userspace is supposed to control worker threads then a
different interface would be more powerful:

  struct vhost_vq_worker_info {
      /*
       * The pid of an existing vhost worker that this vq will be
       * assigned to. When pid is 0 the virtqueue is assigned to the
       * default vhost worker. When pid is -1 a new worker thread is
       * created for this virtqueue. When pid is -2 the virtqueue's
       * worker thread is unchanged.
       *
       * If a vhost worker no longer has any virtqueues assigned to it
       * then it will terminate.
       *
       * The pid of the vhost worker is stored to this field when the
       * ioctl completes successfully. Use pid -2 to query the current
       * vhost worker pid.
       */
      __kernel_pid_t pid;  /* in/out */

      /* The virtqueue index*/
      unsigned int vq_idx; /* in */
  };

  ioctl(vhost_fd, VHOST_SET_VQ_WORKER, &info);

Stefan

--fqIB0bRxfTYxTb/F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+z/QoACgkQnKSrs4Gr
c8hlxAgAt5dzFMEBdSdRp7hlgZgQqjlbY0sBm70KpODN/xBzs8Q2v0wdnoQb31pX
hxrxuWMrrEyu0RPvaCbTZNhTnyU58Eo12Ydeh4DQ+nlJYrk6c91aXU1ii6PvxQDd
xJNaxUljcMW36zNpL1Qy7BISbEkh2kRCyPmV9OmDhlmGDJfZg0kGlRorga+q9HrJ
mI/kS2ajFdXy/9ovk38seIcHJRxpWawgN/ORuV5YX8D/y/O7Gb5Cc+l0Ai6Pe5At
pYjhIw428VQjyQg/L9zGM8oF+llegHH2V7MUfvqFOFRN45JR6bblohEt7x3TrS2j
U3ufXEGBhhwEEII1h6f2QaC6YUeyuQ==
=uA/X
-----END PGP SIGNATURE-----

--fqIB0bRxfTYxTb/F--


