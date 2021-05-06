Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B13375650
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 17:14:11 +0200 (CEST)
Received: from localhost ([::1]:54926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lefha-0002pO-55
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 11:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1leffp-0001no-2O
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:12:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1leffm-0004hY-2o
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:12:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620313936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xpPrlLB02dlLF+VZotAd2Gu6violmAcQfXU6pjJpY3A=;
 b=jLezlYYWYEV/aWhfd4screPDpbZMiZDUxwgGld9z/ebF2UYPatcFmlKUbMFcHsvuzc0Ws1
 cD5oO2c5a6Tp8jfG+izICDTOzy/IfDNW22/Op7PHu2QFQg1GKFLqJeMdFmSqMxcyNUw7Wf
 8qGkELxqhL9XYqS092Is4U6LKOyf0vc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-mVOQbP78OnerzI_WJ1JmYw-1; Thu, 06 May 2021 11:12:13 -0400
X-MC-Unique: mVOQbP78OnerzI_WJ1JmYw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F4B26D5D5;
 Thu,  6 May 2021 15:12:12 +0000 (UTC)
Received: from localhost (ovpn-115-109.ams2.redhat.com [10.36.115.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 969F516909;
 Thu,  6 May 2021 15:12:08 +0000 (UTC)
Date: Thu, 6 May 2021 16:12:07 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH v3 18/26] DAX/unmap: virtiofsd: Add VHOST_USER_SLAVE_FS_IO
Message-ID: <YJQHRwkUhXT+PLtT@stefanha-x1.localdomain>
References: <20210428110100.27757-1-dgilbert@redhat.com>
 <20210428110100.27757-19-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210428110100.27757-19-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zBYl7lu5d6PCY1UM"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org, vgoyal@redhat.com,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--zBYl7lu5d6PCY1UM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 28, 2021 at 12:00:52PM +0100, Dr. David Alan Gilbert (git) wrot=
e:
> @@ -220,6 +222,99 @@ uint64_t vhost_user_fs_slave_unmap(struct vhost_dev =
*dev, int message_size,
>      return (uint64_t)res;
>  }
> =20
> +uint64_t vhost_user_fs_slave_io(struct vhost_dev *dev, int message_size,
> +                                VhostUserFSSlaveMsg *sm, int fd)
> +{
> +    VHostUserFS *fs =3D (VHostUserFS *)object_dynamic_cast(OBJECT(dev->v=
dev),
> +                          TYPE_VHOST_USER_FS);
> +    if (!fs) {
> +        error_report("%s: Bad fs ptr", __func__);
> +        return (uint64_t)-1;
> +    }
> +    if (!check_slave_message_entries(sm, message_size)) {
> +        return (uint64_t)-1;
> +    }

These early error returns don't close(fd).

> +
> +    unsigned int i;
> +    int res =3D 0;
> +    size_t done =3D 0;
> +
> +    if (fd < 0) {
> +        error_report("Bad fd for io");
> +        return (uint64_t)-1;
> +    }
> +
> +    for (i =3D 0; i < sm->count && !res; i++) {
> +        VhostUserFSSlaveMsgEntry *e =3D &sm->entries[i];
> +        if (e->len =3D=3D 0) {
> +            continue;
> +        }
> +
> +        size_t len =3D e->len;
> +        uint64_t fd_offset =3D e->fd_offset;
> +        hwaddr gpa =3D e->c_offset;
> +
> +        while (len && !res) {
> +            hwaddr xlat, xlat_len;
> +            bool is_write =3D e->flags & VHOST_USER_FS_FLAG_MAP_W;
> +            MemoryRegion *mr =3D address_space_translate(dev->vdev->dma_=
as, gpa,
> +                                                       &xlat, &xlat_len,
> +                                                       is_write,
> +                                                       MEMTXATTRS_UNSPEC=
IFIED);
> +            if (!mr || !xlat_len) {
> +                error_report("No guest region found for 0x%" HWADDR_PRIx=
, gpa);
> +                res =3D -EFAULT;
> +                break;
> +            }
> +
> +            trace_vhost_user_fs_slave_io_loop(mr->name,
> +                                          (uint64_t)xlat,
> +                                          memory_region_is_ram(mr),
> +                                          memory_region_is_romd(mr),
> +                                          (size_t)xlat_len);
> +
> +            void *hostptr =3D qemu_map_ram_ptr(mr->ram_block,
> +                                             xlat);
> +            ssize_t transferred;

What happens when the MemoryRegion is not backed by RAM?

> +            if (e->flags & VHOST_USER_FS_FLAG_MAP_R) {
> +                /* Read from file into RAM */
> +                if (mr->readonly) {
> +                    res =3D -EFAULT;
> +                    break;
> +                }
> +                transferred =3D pread(fd, hostptr, xlat_len, fd_offset);
> +            } else if (e->flags & VHOST_USER_FS_FLAG_MAP_W) {
> +                /* Write into file from RAM */
> +                transferred =3D pwrite(fd, hostptr, xlat_len, fd_offset)=
;
> +            } else {
> +                transferred =3D EINVAL;

I don't see how this is handled below by the error checking code. Should
this be:

  errno =3D EINVAL;
  transferred =3D -1;

?

> +            }
> +
> +            trace_vhost_user_fs_slave_io_loop_res(transferred);
> +            if (transferred < 0) {
> +                res =3D -errno;
> +                break;
> +            }
> +            if (!transferred) {
> +                /* EOF */
> +                break;
> +            }
> +
> +            done +=3D transferred;
> +            fd_offset +=3D transferred;
> +            gpa +=3D transferred;
> +            len -=3D transferred;
> +        }
> +    }
> +    close(fd);
> +
> +    trace_vhost_user_fs_slave_io_exit(res, done);
> +    if (res < 0) {
> +        return (uint64_t)res;
> +    }
> +    return (uint64_t)done;
> +}

--zBYl7lu5d6PCY1UM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCUB0cACgkQnKSrs4Gr
c8iZ5wf/ZQOaGftr7HIQpHnZ4wuFclA73AXhUikkrArkY9zDyv6dOTtQp5n2w59y
nKR5UNyhoxfywNAqA6CyxIh1ApG6AwQ2AC7XI0Bcf+snVQyWTtJOPa2LMFcviQr+
VAxvXZFnTHWezqzJCQDJd2MBy5MEgGSseJti+QFC5K4xR/hqB9KptXkFdeGlQZVw
MAy9nDYZRHrIiW2p4b8HGTtHaz31cBtF9SLOBbLsiCoTwuV0rp4FeRKUCaiPjery
Xl2qgpj8mGngRYEtXX00PMK1sV7YpBHf2vKGT1OpLIL4TKxfrHwwZ38kl+fnl6J7
aq1sTkgRD4SHDeVy2KWHsD23phFgkw==
=0c8x
-----END PGP SIGNATURE-----

--zBYl7lu5d6PCY1UM--


