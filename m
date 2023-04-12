Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EDC6E0093
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 23:15:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmhnu-0002xM-PJ; Wed, 12 Apr 2023 17:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pmhnr-0002xB-Ex
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 17:14:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pmhnp-00010F-2I
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 17:14:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681334092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OuOy7rPagKkuXIYJemYg9IwBZM214ZIa1eL0VoO7NkM=;
 b=DyvCGvZV4xs609WKe/KggZygpqo08NlQfl4frKeFHj2TAOpMIPRgAGh53zdEuO82GIBcg8
 xX1G024ujm+CT9iAXeQfw2y4goixS1Zz3Py/CfFLuqs91TGx75jT8rTaefKaJezvfahJBP
 mIQs479/wS1cfUHTlKmb3Ex0iWGyEZ8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-lhSfhA1vNU2IBGYQ47RAgQ-1; Wed, 12 Apr 2023 17:14:50 -0400
X-MC-Unique: lhSfhA1vNU2IBGYQ47RAgQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE74D101A54F;
 Wed, 12 Apr 2023 21:14:49 +0000 (UTC)
Received: from localhost (unknown [10.39.192.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4CA5240C6E70;
 Wed, 12 Apr 2023 21:14:49 +0000 (UTC)
Date: Wed, 12 Apr 2023 17:14:47 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Hanna Czenczek <hreitz@redhat.com>
Cc: qemu-devel@nongnu.org, virtio-fs@redhat.com,
 German Maglione <gmaglione@redhat.com>,
 Anton Kuchin <antonkuchin@yandex-team.ru>,
 Juan Quintela <quintela@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH 3/4] vhost: Add high-level state save/load functions
Message-ID: <20230412211447.GD2813183@fedora>
References: <20230411150515.14020-1-hreitz@redhat.com>
 <20230411150515.14020-4-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cWkPnFTmNbNsrwz3"
Content-Disposition: inline
In-Reply-To: <20230411150515.14020-4-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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


--cWkPnFTmNbNsrwz3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 11, 2023 at 05:05:14PM +0200, Hanna Czenczek wrote:
> vhost_save_backend_state() and vhost_load_backend_state() can be used by
> vhost front-ends to easily save and load the back-end's state to/from
> the migration stream.
>=20
> Because we do not know the full state size ahead of time,
> vhost_save_backend_state() simply reads the data in 1 MB chunks, and
> writes each chunk consecutively into the migration stream, prefixed by
> its length.  EOF is indicated by a 0-length chunk.
>=20
> Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
> ---
>  include/hw/virtio/vhost.h |  35 +++++++
>  hw/virtio/vhost.c         | 196 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 231 insertions(+)
>=20
> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> index 29449e0fe2..d1f1e9e1f3 100644
> --- a/include/hw/virtio/vhost.h
> +++ b/include/hw/virtio/vhost.h
> @@ -425,4 +425,39 @@ int vhost_set_device_state_fd(struct vhost_dev *dev,
>   */
>  int vhost_check_device_state(struct vhost_dev *dev, Error **errp);
> =20
> +/**
> + * vhost_save_backend_state(): High-level function to receive a vhost
> + * back-end's state, and save it in `f`.  Uses
> + * `vhost_set_device_state_fd()` to get the data from the back-end, and
> + * stores it in consecutive chunks that are each prefixed by their
> + * respective length (be32).  The end is marked by a 0-length chunk.
> + *
> + * Must only be called while the device and all its vrings are stopped
> + * (`VHOST_TRANSFER_STATE_PHASE_STOPPED`).
> + *
> + * @dev: The vhost device from which to save the state
> + * @f: Migration stream in which to save the state
> + * @errp: Potential error message
> + *
> + * Returns 0 on success, and -errno otherwise.
> + */
> +int vhost_save_backend_state(struct vhost_dev *dev, QEMUFile *f, Error *=
*errp);
> +
> +/**
> + * vhost_load_backend_state(): High-level function to load a vhost
> + * back-end's state from `f`, and send it over to the back-end.  Reads
> + * the data from `f` in the format used by `vhost_save_state()`, and
> + * uses `vhost_set_device_state_fd()` to transfer it to the back-end.
> + *
> + * Must only be called while the device and all its vrings are stopped
> + * (`VHOST_TRANSFER_STATE_PHASE_STOPPED`).
> + *
> + * @dev: The vhost device to which to send the sate
> + * @f: Migration stream from which to load the state
> + * @errp: Potential error message
> + *
> + * Returns 0 on success, and -errno otherwise.
> + */
> +int vhost_load_backend_state(struct vhost_dev *dev, QEMUFile *f, Error *=
*errp);
> +
>  #endif
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index 90099d8f6a..d08849c691 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -2125,3 +2125,199 @@ int vhost_check_device_state(struct vhost_dev *de=
v, Error **errp)
>                 "vhost transport does not support migration state transfe=
r");
>      return -ENOSYS;
>  }
> +
> +int vhost_save_backend_state(struct vhost_dev *dev, QEMUFile *f, Error *=
*errp)
> +{
> +    /* Maximum chunk size in which to transfer the state */
> +    const size_t chunk_size =3D 1 * 1024 * 1024;
> +    void *transfer_buf =3D NULL;
> +    g_autoptr(GError) g_err =3D NULL;
> +    int pipe_fds[2], read_fd =3D -1, write_fd =3D -1, reply_fd =3D -1;
> +    int ret;
> +
> +    /* [0] for reading (our end), [1] for writing (back-end's end) */
> +    if (!g_unix_open_pipe(pipe_fds, FD_CLOEXEC, &g_err)) {
> +        error_setg(errp, "Failed to set up state transfer pipe: %s",
> +                   g_err->message);
> +        ret =3D -EINVAL;
> +        goto fail;
> +    }
> +
> +    read_fd =3D pipe_fds[0];
> +    write_fd =3D pipe_fds[1];
> +
> +    /* VHOST_TRANSFER_STATE_PHASE_STOPPED means the device must be stopp=
ed */
> +    assert(!dev->started && !dev->enable_vqs);
> +
> +    /* Transfer ownership of write_fd to the back-end */
> +    ret =3D vhost_set_device_state_fd(dev,
> +                                    VHOST_TRANSFER_STATE_DIRECTION_SAVE,
> +                                    VHOST_TRANSFER_STATE_PHASE_STOPPED,
> +                                    write_fd,
> +                                    &reply_fd,
> +                                    errp);
> +    if (ret < 0) {
> +        error_prepend(errp, "Failed to initiate state transfer: ");
> +        goto fail;
> +    }
> +
> +    /* If the back-end wishes to use a different pipe, switch over */
> +    if (reply_fd >=3D 0) {
> +        close(read_fd);
> +        read_fd =3D reply_fd;
> +    }
> +
> +    transfer_buf =3D g_malloc(chunk_size);
> +
> +    while (true) {
> +        ssize_t read_ret;
> +
> +        read_ret =3D read(read_fd, transfer_buf, chunk_size);
> +        if (read_ret < 0) {
> +            ret =3D -errno;
> +            error_setg_errno(errp, -ret, "Failed to receive state");
> +            goto fail;
> +        }
> +
> +        assert(read_ret <=3D chunk_size);
> +        qemu_put_be32(f, read_ret);
> +
> +        if (read_ret =3D=3D 0) {
> +            /* EOF */
> +            break;
> +        }
> +
> +        qemu_put_buffer(f, transfer_buf, read_ret);
> +    }

I think this synchronous approach with a single contiguous stream of
chunks is okay for now.

Does this make the QEMU monitor unresponsive if the backend is slow?

In the future the interface could be extended to allow participating in
the iterative phase of migration. Then chunks from multiple backends
(plus guest RAM) would be interleaved and there would be some
parallelism.

> +
> +    /*
> +     * Back-end will not really care, but be clean and close our end of =
the pipe
> +     * before inquiring the back-end about whether transfer was successf=
ul
> +     */
> +    close(read_fd);
> +    read_fd =3D -1;
> +
> +    /* Also, verify that the device is still stopped */
> +    assert(!dev->started && !dev->enable_vqs);
> +
> +    ret =3D vhost_check_device_state(dev, errp);
> +    if (ret < 0) {
> +        goto fail;
> +    }
> +
> +    ret =3D 0;
> +fail:
> +    g_free(transfer_buf);
> +    if (read_fd >=3D 0) {
> +        close(read_fd);
> +    }
> +
> +    return ret;
> +}
> +
> +int vhost_load_backend_state(struct vhost_dev *dev, QEMUFile *f, Error *=
*errp)
> +{
> +    size_t transfer_buf_size =3D 0;
> +    void *transfer_buf =3D NULL;
> +    g_autoptr(GError) g_err =3D NULL;
> +    int pipe_fds[2], read_fd =3D -1, write_fd =3D -1, reply_fd =3D -1;
> +    int ret;
> +
> +    /* [0] for reading (back-end's end), [1] for writing (our end) */
> +    if (!g_unix_open_pipe(pipe_fds, FD_CLOEXEC, &g_err)) {
> +        error_setg(errp, "Failed to set up state transfer pipe: %s",
> +                   g_err->message);
> +        ret =3D -EINVAL;
> +        goto fail;
> +    }
> +
> +    read_fd =3D pipe_fds[0];
> +    write_fd =3D pipe_fds[1];
> +
> +    /* VHOST_TRANSFER_STATE_PHASE_STOPPED means the device must be stopp=
ed */
> +    assert(!dev->started && !dev->enable_vqs);
> +
> +    /* Transfer ownership of read_fd to the back-end */
> +    ret =3D vhost_set_device_state_fd(dev,
> +                                    VHOST_TRANSFER_STATE_DIRECTION_LOAD,
> +                                    VHOST_TRANSFER_STATE_PHASE_STOPPED,
> +                                    read_fd,
> +                                    &reply_fd,
> +                                    errp);
> +    if (ret < 0) {
> +        error_prepend(errp, "Failed to initiate state transfer: ");
> +        goto fail;
> +    }
> +
> +    /* If the back-end wishes to use a different pipe, switch over */
> +    if (reply_fd >=3D 0) {
> +        close(write_fd);
> +        write_fd =3D reply_fd;
> +    }
> +
> +    while (true) {
> +        size_t this_chunk_size =3D qemu_get_be32(f);
> +        ssize_t write_ret;
> +        const uint8_t *transfer_pointer;
> +
> +        if (this_chunk_size =3D=3D 0) {
> +            /* End of state */
> +            break;
> +        }
> +
> +        if (transfer_buf_size < this_chunk_size) {
> +            transfer_buf =3D g_realloc(transfer_buf, this_chunk_size);
> +            transfer_buf_size =3D this_chunk_size;
> +        }
> +
> +        if (qemu_get_buffer(f, transfer_buf, this_chunk_size) <
> +                this_chunk_size)
> +        {
> +            error_setg(errp, "Failed to read state");
> +            ret =3D -EINVAL;
> +            goto fail;
> +        }
> +
> +        transfer_pointer =3D transfer_buf;
> +        while (this_chunk_size > 0) {
> +            write_ret =3D write(write_fd, transfer_pointer, this_chunk_s=
ize);
> +            if (write_ret < 0) {
> +                ret =3D -errno;
> +                error_setg_errno(errp, -ret, "Failed to send state");
> +                goto fail;
> +            } else if (write_ret =3D=3D 0) {
> +                error_setg(errp, "Failed to send state: Connection is cl=
osed");
> +                ret =3D -ECONNRESET;
> +                goto fail;
> +            }
> +
> +            assert(write_ret <=3D this_chunk_size);
> +            this_chunk_size -=3D write_ret;
> +            transfer_pointer +=3D write_ret;
> +        }
> +    }
> +
> +    /*
> +     * Close our end, thus ending transfer, before inquiring the back-en=
d about
> +     * whether transfer was successful
> +     */
> +    close(write_fd);
> +    write_fd =3D -1;
> +
> +    /* Also, verify that the device is still stopped */
> +    assert(!dev->started && !dev->enable_vqs);
> +
> +    ret =3D vhost_check_device_state(dev, errp);
> +    if (ret < 0) {
> +        goto fail;
> +    }
> +
> +    ret =3D 0;
> +fail:
> +    g_free(transfer_buf);
> +    if (write_fd >=3D 0) {
> +        close(write_fd);
> +    }
> +
> +    return ret;
> +}
> --=20
> 2.39.1
>=20

--cWkPnFTmNbNsrwz3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQ3H0cACgkQnKSrs4Gr
c8hLCQf/VwAM+f6t+Fz6g5hH489G1t5vyiYHcNVOd9skShV/2PKQh+7FmBuR2Glb
xo6bfmsR0ZaTrIgLO7MkMklPTJHgjCvi/bw5fAnaDuIIBiRhXCPRZwdnlmGQO12j
oQLmCnDeMYFEe5l6hn4dggMlboKc85dfBsjdqiKvFYm+V1ni+O8n1rx6T7qVAQD6
8W0mSyOKBz2tIuna63sYmYtDBpl3Rr/eibIN9Xz4SeE1YZOiAx8hDR8vU8W4jGkT
v2KlnVYZ4MGPcl5SuUeOA7guVs+EvW/OgAQ+GIME+4q4cMHtn2jaPwrSO60xE2V5
CJ3zS/w0fpp+eRWYo7UB3qofQ3zQ5Q==
=JDE4
-----END PGP SIGNATURE-----

--cWkPnFTmNbNsrwz3--


