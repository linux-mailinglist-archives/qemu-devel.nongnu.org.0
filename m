Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 431F86E0C5E
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 13:22:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmv21-00060a-J9; Thu, 13 Apr 2023 07:22:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pmv1z-00060P-L3
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 07:22:23 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pmv1x-0006mj-Nu
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 07:22:23 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-54f6fc7943eso157405267b3.3
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 04:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681384940; x=1683976940;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/qSz6Ixx0eQPYCxyizN+fDFeMs5OmcVOYeAm26quQd0=;
 b=h/jxJ+LNQ+EKyL61b6d/Kz7GOMYBpWcfz5aevUrJFObF8KatXk8xN2bLK3gGcSv2g+
 L0PoA7XNIDYtmmeKzDc25sxaMaEu8rr6SQzmM3d0yaRQx4ZhNdKb5ruTSBeZz8RXCVYH
 VnA4P82C4kasSXtxVuSTiAbV3rNobiysuhv/bo27VUcYpdx5Q68XcxQnMBe+CYkEWZdM
 iheeNcIYuLatDtLeXMpLQv/PIIrdsE9E1vZnXXVib7GPCV6m18ONYPkw2x2pMmXO6TYY
 jeh9tBKb4EnkhNuuAJna24jdRY+a0wMFgGeIDGWBpnNfnlIpo/wh2K5s8vrjJb0G75rn
 +RPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681384940; x=1683976940;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/qSz6Ixx0eQPYCxyizN+fDFeMs5OmcVOYeAm26quQd0=;
 b=VKfrXTRLkut+/AB4w3huI8ReQ2Il9qYcVnp60DuRKscV5bzIWU9WBaY6fIBgWFCMNB
 IjgNmcjd6HQBvYF4ycgLqc/CzLJXThVJNeZ08W0gYMfMxa9f2yA3b+Sr3gi24djmdGBO
 eYLlDhN5M2Ej/OYBWXHZvJEltbhWyIEK/S8OoctBy/OyC5LO1z0hmWQhUsHyxzDJ2acX
 pwSj5XEUw5juwTSTlrWT66OyGvVYjpjSfHYnujShxTBUotGZe181f0AhTLmLEs+sYN3r
 kS1Jq8wlQZ2FT4khO90uaz+dCQnU2B7treJDI1cHChtZvFbeW45U42QCzeyOOxE4PtJW
 PApw==
X-Gm-Message-State: AAQBX9fSFducqfUvmzUadbYrRavYaSf4Tolai4OEWqtzWRjuUTEfp8Sj
 BcpmgxnQJ64VmxGskAE0Nak09ZQatTL1z1aLw/U=
X-Google-Smtp-Source: AKy350ZoWr2DCRiSXO+hWurR0djp55pjuTXtfJgo2CdfNGwSHrVAxd7wJK604Q644HMmkmS7lJnH+dw1HbqLus6aukY=
X-Received: by 2002:a81:c142:0:b0:541:a17f:c779 with SMTP id
 e2-20020a81c142000000b00541a17fc779mr1141797ywl.4.1681384939602; Thu, 13 Apr
 2023 04:22:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230411150515.14020-1-hreitz@redhat.com>
 <20230411150515.14020-4-hreitz@redhat.com>
 <20230412211447.GD2813183@fedora>
 <44fac0de-d651-1b1b-e263-161587c40d3b@redhat.com>
In-Reply-To: <44fac0de-d651-1b1b-e263-161587c40d3b@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 13 Apr 2023 07:22:07 -0400
Message-ID: <CAJSP0QUSX88veQ2o7A8bLiDHpn3i6q26yR8j13BG49m5iUmaAA@mail.gmail.com>
Subject: Re: [PATCH 3/4] vhost: Add high-level state save/load functions
To: Hanna Czenczek <hreitz@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 virtio-fs@redhat.com, German Maglione <gmaglione@redhat.com>,
 Anton Kuchin <antonkuchin@yandex-team.ru>, 
 Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Thu, 13 Apr 2023 at 05:04, Hanna Czenczek <hreitz@redhat.com> wrote:
>
> On 12.04.23 23:14, Stefan Hajnoczi wrote:
> > On Tue, Apr 11, 2023 at 05:05:14PM +0200, Hanna Czenczek wrote:
> >> vhost_save_backend_state() and vhost_load_backend_state() can be used =
by
> >> vhost front-ends to easily save and load the back-end's state to/from
> >> the migration stream.
> >>
> >> Because we do not know the full state size ahead of time,
> >> vhost_save_backend_state() simply reads the data in 1 MB chunks, and
> >> writes each chunk consecutively into the migration stream, prefixed by
> >> its length.  EOF is indicated by a 0-length chunk.
> >>
> >> Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
> >> ---
> >>   include/hw/virtio/vhost.h |  35 +++++++
> >>   hw/virtio/vhost.c         | 196 ++++++++++++++++++++++++++++++++++++=
++
> >>   2 files changed, 231 insertions(+)
> >>
> >> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> >> index 29449e0fe2..d1f1e9e1f3 100644
> >> --- a/include/hw/virtio/vhost.h
> >> +++ b/include/hw/virtio/vhost.h
> >> @@ -425,4 +425,39 @@ int vhost_set_device_state_fd(struct vhost_dev *d=
ev,
> >>    */
> >>   int vhost_check_device_state(struct vhost_dev *dev, Error **errp);
> >>
> >> +/**
> >> + * vhost_save_backend_state(): High-level function to receive a vhost
> >> + * back-end's state, and save it in `f`.  Uses
> >> + * `vhost_set_device_state_fd()` to get the data from the back-end, a=
nd
> >> + * stores it in consecutive chunks that are each prefixed by their
> >> + * respective length (be32).  The end is marked by a 0-length chunk.
> >> + *
> >> + * Must only be called while the device and all its vrings are stoppe=
d
> >> + * (`VHOST_TRANSFER_STATE_PHASE_STOPPED`).
> >> + *
> >> + * @dev: The vhost device from which to save the state
> >> + * @f: Migration stream in which to save the state
> >> + * @errp: Potential error message
> >> + *
> >> + * Returns 0 on success, and -errno otherwise.
> >> + */
> >> +int vhost_save_backend_state(struct vhost_dev *dev, QEMUFile *f, Erro=
r **errp);
> >> +
> >> +/**
> >> + * vhost_load_backend_state(): High-level function to load a vhost
> >> + * back-end's state from `f`, and send it over to the back-end.  Read=
s
> >> + * the data from `f` in the format used by `vhost_save_state()`, and
> >> + * uses `vhost_set_device_state_fd()` to transfer it to the back-end.
> >> + *
> >> + * Must only be called while the device and all its vrings are stoppe=
d
> >> + * (`VHOST_TRANSFER_STATE_PHASE_STOPPED`).
> >> + *
> >> + * @dev: The vhost device to which to send the sate
> >> + * @f: Migration stream from which to load the state
> >> + * @errp: Potential error message
> >> + *
> >> + * Returns 0 on success, and -errno otherwise.
> >> + */
> >> +int vhost_load_backend_state(struct vhost_dev *dev, QEMUFile *f, Erro=
r **errp);
> >> +
> >>   #endif
> >> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> >> index 90099d8f6a..d08849c691 100644
> >> --- a/hw/virtio/vhost.c
> >> +++ b/hw/virtio/vhost.c
> >> @@ -2125,3 +2125,199 @@ int vhost_check_device_state(struct vhost_dev =
*dev, Error **errp)
> >>                  "vhost transport does not support migration state tra=
nsfer");
> >>       return -ENOSYS;
> >>   }
> >> +
> >> +int vhost_save_backend_state(struct vhost_dev *dev, QEMUFile *f, Erro=
r **errp)
> >> +{
> >> +    /* Maximum chunk size in which to transfer the state */
> >> +    const size_t chunk_size =3D 1 * 1024 * 1024;
> >> +    void *transfer_buf =3D NULL;
> >> +    g_autoptr(GError) g_err =3D NULL;
> >> +    int pipe_fds[2], read_fd =3D -1, write_fd =3D -1, reply_fd =3D -1=
;
> >> +    int ret;
> >> +
> >> +    /* [0] for reading (our end), [1] for writing (back-end's end) */
> >> +    if (!g_unix_open_pipe(pipe_fds, FD_CLOEXEC, &g_err)) {
> >> +        error_setg(errp, "Failed to set up state transfer pipe: %s",
> >> +                   g_err->message);
> >> +        ret =3D -EINVAL;
> >> +        goto fail;
> >> +    }
> >> +
> >> +    read_fd =3D pipe_fds[0];
> >> +    write_fd =3D pipe_fds[1];
> >> +
> >> +    /* VHOST_TRANSFER_STATE_PHASE_STOPPED means the device must be st=
opped */
> >> +    assert(!dev->started && !dev->enable_vqs);
> >> +
> >> +    /* Transfer ownership of write_fd to the back-end */
> >> +    ret =3D vhost_set_device_state_fd(dev,
> >> +                                    VHOST_TRANSFER_STATE_DIRECTION_SA=
VE,
> >> +                                    VHOST_TRANSFER_STATE_PHASE_STOPPE=
D,
> >> +                                    write_fd,
> >> +                                    &reply_fd,
> >> +                                    errp);
> >> +    if (ret < 0) {
> >> +        error_prepend(errp, "Failed to initiate state transfer: ");
> >> +        goto fail;
> >> +    }
> >> +
> >> +    /* If the back-end wishes to use a different pipe, switch over */
> >> +    if (reply_fd >=3D 0) {
> >> +        close(read_fd);
> >> +        read_fd =3D reply_fd;
> >> +    }
> >> +
> >> +    transfer_buf =3D g_malloc(chunk_size);
> >> +
> >> +    while (true) {
> >> +        ssize_t read_ret;
> >> +
> >> +        read_ret =3D read(read_fd, transfer_buf, chunk_size);
> >> +        if (read_ret < 0) {
> >> +            ret =3D -errno;
> >> +            error_setg_errno(errp, -ret, "Failed to receive state");
> >> +            goto fail;
> >> +        }
> >> +
> >> +        assert(read_ret <=3D chunk_size);
> >> +        qemu_put_be32(f, read_ret);
> >> +
> >> +        if (read_ret =3D=3D 0) {
> >> +            /* EOF */
> >> +            break;
> >> +        }
> >> +
> >> +        qemu_put_buffer(f, transfer_buf, read_ret);
> >> +    }
> > I think this synchronous approach with a single contiguous stream of
> > chunks is okay for now.
> >
> > Does this make the QEMU monitor unresponsive if the backend is slow?
>
> Oh, absolutely.  But as far as I can tell that=E2=80=99s also the case if=
 the
> back-end doesn=E2=80=99t respond (or responds slowly) to vhost-user messa=
ges,
> because they=E2=80=99re generally sent/received synchronously. (So, notab=
ly,
> these synchronous read()/write() calls aren=E2=80=99t worse than the prev=
ious
> model of transferring data through shared memory, but awaiting the
> back-end via vhost-user calls between each chunk.)
>
> I don=E2=80=99t know whether it=E2=80=99s even possible to do it better (=
while keeping
> it all in the switch-over phase).  The VMState functions aren=E2=80=99t
> coroutines or AIO, so I can=E2=80=99t think of a way to improve this.
>
> (Well, except:)
>
> > In the future the interface could be extended to allow participating in
> > the iterative phase of migration. Then chunks from multiple backends
> > (plus guest RAM) would be interleaved and there would be some
> > parallelism.
>
> Sure.  That would also definitely help with an unintentionally slow
> back-end.  If the back-end making qemu unresponsive is a deal-breaker,
> then we=E2=80=99d have to do this now.

Yes, vhost-user trusts the backend to respond within a reasonable
amount of time.

I think iterating over multiple devices can wait until iteration is needed.

Stefan

