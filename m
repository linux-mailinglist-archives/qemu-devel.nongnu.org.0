Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AC36F49FC
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 20:57:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptvB0-0004PE-V4; Tue, 02 May 2023 14:56:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptvAy-0004OX-QE
 for qemu-devel@nongnu.org; Tue, 02 May 2023 14:56:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptvAv-0001yC-Ck
 for qemu-devel@nongnu.org; Tue, 02 May 2023 14:56:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683053792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JvqiB11pwfyb9mMlyyPXLE6NQZxd1luK1o/19K1fqnk=;
 b=Jl4gsC1KlQMRK0juJOoLPeJbdKQyXa0ar5TmsH51hUb7c8IzyFWx7oVpcQ7KsZ9fLU7e1y
 FFDf3I/nseYyoInDjLMk+EgL4IQGvKr/69RhcjVt0ePFUCGVC9phJK8ASvlRD0ivqxXZWi
 yTiPIzIo+9+GB2mMV5BEfCF3edfSXxs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-297-hz_-_nNRNHKLUa7zat10Kw-1; Tue, 02 May 2023 14:56:28 -0400
X-MC-Unique: hz_-_nNRNHKLUa7zat10Kw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF841811E7C;
 Tue,  2 May 2023 18:56:27 +0000 (UTC)
Received: from localhost (unknown [10.39.192.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A29F492B03;
 Tue,  2 May 2023 18:56:26 +0000 (UTC)
Date: Tue, 2 May 2023 14:56:24 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, xen-devel@lists.xenproject.org,
 eesposit@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Lieven <pl@kamp.de>, Paul Durrant <paul@xen.org>,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-block@nongnu.org,
 Stefano Garzarella <sgarzare@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefan Weil <sw@weilnetz.de>, Xie Yongji <xieyongji@bytedance.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Daniil Tatianin <d-tatianin@yandex-team.ru>
Subject: Re: [PATCH v4 03/20] virtio-scsi: avoid race between unplug and
 transport event
Message-ID: <20230502185624.GA535070@fedora>
References: <20230425172716.1033562-1-stefanha@redhat.com>
 <20230425172716.1033562-4-stefanha@redhat.com>
 <ZFEqEkG4ktn9bBFN@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Qd9ljEEGWct7+HKe"
Content-Disposition: inline
In-Reply-To: <ZFEqEkG4ktn9bBFN@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


--Qd9ljEEGWct7+HKe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 02, 2023 at 05:19:46PM +0200, Kevin Wolf wrote:
> Am 25.04.2023 um 19:26 hat Stefan Hajnoczi geschrieben:
> > Only report a transport reset event to the guest after the SCSIDevice
> > has been unrealized by qdev_simple_device_unplug_cb().
> >=20
> > qdev_simple_device_unplug_cb() sets the SCSIDevice's qdev.realized field
> > to false so that scsi_device_find/get() no longer see it.
> >=20
> > scsi_target_emulate_report_luns() also needs to be updated to filter out
> > SCSIDevices that are unrealized.
> >=20
> > These changes ensure that the guest driver does not see the SCSIDevice
> > that's being unplugged if it responds very quickly to the transport
> > reset event.
> >=20
> > Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > Reviewed-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>=20
> > @@ -1082,6 +1073,15 @@ static void virtio_scsi_hotunplug(HotplugHandler=
 *hotplug_dev, DeviceState *dev,
> >          blk_set_aio_context(sd->conf.blk, qemu_get_aio_context(), NULL=
);
> >          virtio_scsi_release(s);
> >      }
> > +
> > +    if (virtio_vdev_has_feature(vdev, VIRTIO_SCSI_F_HOTPLUG)) {
> > +        virtio_scsi_acquire(s);
> > +        virtio_scsi_push_event(s, sd,
> > +                               VIRTIO_SCSI_T_TRANSPORT_RESET,
> > +                               VIRTIO_SCSI_EVT_RESET_REMOVED);
> > +        scsi_bus_set_ua(&s->bus, SENSE_CODE(REPORTED_LUNS_CHANGED));
> > +        virtio_scsi_release(s);
> > +    }
> >  }
>=20
> s, sd and s->bus are all unrealized at this point, whereas before this
> patch they were still realized. I couldn't find any practical problem
> with it, but it made me nervous enough that I thought I should comment
> on it at least.
>=20
> Should we maybe have documentation on these functions that says that
> they accept unrealized objects as their parameters?

s is the VirtIOSCSI controller, not the SCSIDevice that is being
unplugged. The VirtIOSCSI controller is still realized.

s->bus is the VirtIOSCSI controller's bus, it is still realized.

You are right that the SCSIDevice (sd) has been unrealized at this
point:
- sd->conf.blk is safe because qdev properties stay alive the
  Object is deleted, but I'm not sure we should rely on that.
- virti_scsi_push_event(.., sd, ...) is questionable because the LUN
  that's fetched from sd no longer belongs to the unplugged SCSIDevice.

How about I change the code to fetch sd->conf.blk and the LUN before
unplugging?

Stefan

--Qd9ljEEGWct7+HKe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRRXNgACgkQnKSrs4Gr
c8ipsAf+MYIOWS+2lk+xRt3nEDpVri7B1MaNSrlKDWSw2vK6J34jE0bGdHF3I5kZ
cS6XFEpcK0BRYes0zRpFZyksJFYS1033b2up4HGodKOJp34ahYy7Vg4yNrov6pzO
pZHJAEeEkK0FrHHJkho15qjoOykxt4bib6RzUFN+EdKo3KGQzk1dEyh8fzPEm40x
CwNN7D/FJAOOM3CpgsHLUGu6EvOBlfGkd8kS7It3qOD+/BeLFHKDiLBaU5w/IXtA
WmgFKnZiOEsMQIEIFgcg+m/YrlomPy0kRPFFSFNn7/5yCmhLCU5WNY/1sTiM3LEi
20aCYTqXQJt5E6c1jk1x21IACc9qRA==
=PP5I
-----END PGP SIGNATURE-----

--Qd9ljEEGWct7+HKe--


