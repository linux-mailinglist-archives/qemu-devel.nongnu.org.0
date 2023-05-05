Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA59D6F8628
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 17:49:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puxen-0001oO-TX; Fri, 05 May 2023 11:47:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jandryuk@gmail.com>)
 id 1puxel-0001ny-7D
 for qemu-devel@nongnu.org; Fri, 05 May 2023 11:47:39 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jandryuk@gmail.com>)
 id 1puxej-0006JX-9q
 for qemu-devel@nongnu.org; Fri, 05 May 2023 11:47:38 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-95f4c5cb755so342413366b.0
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 08:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683301654; x=1685893654;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K7a6OP2ZbfbLEcN+mCIl6WNnEQ1CS2Knx9ltqA+VoLI=;
 b=R1AvNbZqAwJlA3H0R1A+T2HPJ2Zj5UVscGVZpjfbImE5rGBM4MNxQhYvQIR+XVBrFn
 3m4JsqJAIFJxRw/njoLt56SrBW3FuBTSONMORidu89m3odaWR0ZIcYHieiQvRWUxj16H
 cVYSYp/X4VlUpXDksSCC5rIP4VRc3G1g7bQ+PVVNJ+iUO6eJ6nyaQWev6mscWktdNCaA
 hniLE82vr8l1yp1eOHHv6sEbJ2XSBjNtgr0XMSc+KdaSFBprcbOhltEnj2fWpp1ZXkJ2
 kFSOlt0thoskG2rshZF7ShIznTKAFqnX6qHwZzUmFCVKXF6r+18C0lX9X0P9L2jBJ4js
 mD9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683301654; x=1685893654;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K7a6OP2ZbfbLEcN+mCIl6WNnEQ1CS2Knx9ltqA+VoLI=;
 b=e+1CiEAyA0x4dKxL16fE8GbNgkzQ8BNFJBUCiP8XpHZjkdUN31t9ed18YKXSPS/bZK
 NzrHAqqhFoDdrCwuDvTOpCFKfzVbolQ3c9z4y+lt7dYlFfN55Jo5GCL/d4fnRmSnCE9+
 3tk7+7+AcvPKclKGOPEl0bCEltsTWdviOeYEDdSwwM9BMIEfOUSk9mKBo6tLHtnQAngs
 L/K2j4O3LE/5m/goXMzmAq28rZMOAEDNkd0ldIsX7l7mDzY2HPkJI6q0SIkKfwnaxAvR
 /xhJ/KDvUeFPnTFEAgHlJJLcto1cXeUYm2B3xZw3BEN/+TirF+MYvVaVD4ZSz6EbzAXu
 28hQ==
X-Gm-Message-State: AC+VfDzVkXHvfS0VUUCdPFXOTuQGU90DmkuLnw187mjH+BhwNLrrflkw
 2Dff9zRI2steijPZj2G/nqf8dBHIEvX6fMUc/jg=
X-Google-Smtp-Source: ACHHUZ6hX1NVNdLDX3FwK5tK/XaAcUVGlrMRV5iFAyo2jjZU3aDo2vBO2rgQqXR/dKciAHCN22PumPlOGHa3zLVan2Q=
X-Received: by 2002:a17:906:dc92:b0:955:34a5:ae46 with SMTP id
 cs18-20020a170906dc9200b0095534a5ae46mr1654968ejc.77.1683301653862; Fri, 05
 May 2023 08:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230502143722.15613-1-jandryuk@gmail.com>
 <43162544.QFhiSxD2Za@silver>
In-Reply-To: <43162544.QFhiSxD2Za@silver>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 5 May 2023 11:47:22 -0400
Message-ID: <CAKf6xpsAYSd68jhCt7d603eDuLh5YJ9N8zihGBi9XvAZabNVwA@mail.gmail.com>
Subject: Re: [PATCH] 9pfs/xen: Fix segfault on shutdown
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>, 
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=jandryuk@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, May 5, 2023 at 6:05=E2=80=AFAM Christian Schoenebeck
<qemu_oss@crudebyte.com> wrote:
>
> Hi Jason,
>
> as this is a Xen specific change, I would like Stefano or another Xen
> developer to take a look at it, just few things from my side ...
>
> On Tuesday, May 2, 2023 4:37:22 PM CEST Jason Andryuk wrote:
> > xen_9pfs_free can't use gnttabdev since it is already closed and NULL-e=
d
>
> Where exactly does it do that access? A backtrace or another detailed com=
mit
> log description would help.

The segfault is down in the xen grant libraries during the free
callback.  The call stack is roughly:
xen_pv_del_xendev(struct XenLegacyDevice *xendev)
xen_9pfs_free() (->free() callback)
xen_be_unmap_grant_refs(&xen_9pdev->xendev, ...)
qemu_xen_gnttab_unmap(xendev->gnttabdev, ...)
xengnttab_unmap(xgt, ...) <- segfault.

The device went through the "disconnect" state before free() is
called, so xen_be_disconnect() already ran which did:
    if (xendev->gnttabdev) {
        qemu_xen_gnttab_close(xendev->gnttabdev);
        xendev->gnttabdev =3D NULL;
    }

gnttabdev being used by xengnttab_unmap().

> > out when free is called.  Do the teardown in _disconnect().  This
> > matches the setup done in _connect().
> >
> > trace-events are also added for the XenDevOps functions.
> >
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> > ---
> >  hw/9pfs/trace-events     |  5 +++++
> >  hw/9pfs/xen-9p-backend.c | 36 +++++++++++++++++++++++-------------
> >  2 files changed, 28 insertions(+), 13 deletions(-)
> >
> > diff --git a/hw/9pfs/trace-events b/hw/9pfs/trace-events
> > index 6c77966c0b..7b5b0b5a48 100644
> > --- a/hw/9pfs/trace-events
> > +++ b/hw/9pfs/trace-events
> > @@ -48,3 +48,8 @@ v9fs_readlink(uint16_t tag, uint8_t id, int32_t fid) =
"tag %d id %d fid %d"
> >  v9fs_readlink_return(uint16_t tag, uint8_t id, char* target) "tag %d i=
d %d name %s"
> >  v9fs_setattr(uint16_t tag, uint8_t id, int32_t fid, int32_t valid, int=
32_t mode, int32_t uid, int32_t gid, int64_t size, int64_t atime_sec, int64=
_t mtime_sec) "tag %u id %u fid %d iattr=3D{valid %d mode %d uid %d gid %d =
size %"PRId64" atime=3D%"PRId64" mtime=3D%"PRId64" }"
> >  v9fs_setattr_return(uint16_t tag, uint8_t id) "tag %u id %u"
> > +
>
> Nit-picking; missing leading comment:
>
> # xen-9p-backend.c

Will do, thanks.

> > +xen_9pfs_alloc(char *name) "name %s"
> > +xen_9pfs_connect(char *name) "name %s"
> > +xen_9pfs_disconnect(char *name) "name %s"
> > +xen_9pfs_free(char *name) "name %s"
> > diff --git a/hw/9pfs/xen-9p-backend.c b/hw/9pfs/xen-9p-backend.c
> > index 0e266c552b..c646a0b3d1 100644
> > --- a/hw/9pfs/xen-9p-backend.c
> > +++ b/hw/9pfs/xen-9p-backend.c
> > @@ -25,6 +25,8 @@
> >  #include "qemu/iov.h"
> >  #include "fsdev/qemu-fsdev.h"
> >
> > +#include "trace.h"
> > +
> >  #define VERSIONS "1"
> >  #define MAX_RINGS 8
> >  #define MAX_RING_ORDER 9
> > @@ -337,6 +339,8 @@ static void xen_9pfs_disconnect(struct XenLegacyDev=
ice *xendev)
> >      Xen9pfsDev *xen_9pdev =3D container_of(xendev, Xen9pfsDev, xendev)=
;
> >      int i;
> >
> > +    trace_xen_9pfs_disconnect(xendev->name);
> > +
> >      for (i =3D 0; i < xen_9pdev->num_rings; i++) {
> >          if (xen_9pdev->rings[i].evtchndev !=3D NULL) {
> >              qemu_set_fd_handler(qemu_xen_evtchn_fd(xen_9pdev->rings[i]=
.evtchndev),
> > @@ -345,40 +349,42 @@ static void xen_9pfs_disconnect(struct XenLegacyD=
evice *xendev)
> >                                     xen_9pdev->rings[i].local_port);
> >              xen_9pdev->rings[i].evtchndev =3D NULL;
> >          }
> > -    }
> > -}
> > -
> > -static int xen_9pfs_free(struct XenLegacyDevice *xendev)
> > -{
> > -    Xen9pfsDev *xen_9pdev =3D container_of(xendev, Xen9pfsDev, xendev)=
;
> > -    int i;
> > -
> > -    if (xen_9pdev->rings[0].evtchndev !=3D NULL) {
> > -        xen_9pfs_disconnect(xendev);
> > -    }
> > -
> > -    for (i =3D 0; i < xen_9pdev->num_rings; i++) {
> >          if (xen_9pdev->rings[i].data !=3D NULL) {
> >              xen_be_unmap_grant_refs(&xen_9pdev->xendev,
> >                                      xen_9pdev->rings[i].data,
> >                                      xen_9pdev->rings[i].intf->ref,
> >                                      (1 << xen_9pdev->rings[i].ring_ord=
er));
> > +            xen_9pdev->rings[i].data =3D NULL;
> >          }
> >          if (xen_9pdev->rings[i].intf !=3D NULL) {
> >              xen_be_unmap_grant_ref(&xen_9pdev->xendev,
> >                                     xen_9pdev->rings[i].intf,
> >                                     xen_9pdev->rings[i].ref);
> > +            xen_9pdev->rings[i].intf =3D NULL;
> >          }
> >          if (xen_9pdev->rings[i].bh !=3D NULL) {
> >              qemu_bh_delete(xen_9pdev->rings[i].bh);
> > +            xen_9pdev->rings[i].bh =3D NULL;
> >          }
> >      }
> >
> >      g_free(xen_9pdev->id);
> > +    xen_9pdev->id =3D NULL;
> >      g_free(xen_9pdev->tag);
> > +    xen_9pdev->tag =3D NULL;
> >      g_free(xen_9pdev->path);
> > +    xen_9pdev->path =3D NULL;
> >      g_free(xen_9pdev->security_model);
> > +    xen_9pdev->security_model =3D NULL;
> >      g_free(xen_9pdev->rings);
> > +    xen_9pdev->rings =3D NULL;
> > +    return;
> > +}
> > +
> > +static int xen_9pfs_free(struct XenLegacyDevice *xendev)
> > +{
> > +    trace_xen_9pfs_free(xendev->name);
> > +
> >      return 0;
> >  }
>
> xen_9pfs_free() doing nothing, that doesn't look right to me. Wouldn't it=
 make
> sense to turn xen_9pfs_free() idempotent instead?

The callbacks are:
    .alloc      =3D xen_9pfs_alloc,
    .init       =3D xen_9pfs_init,
    .initialise =3D xen_9pfs_connect,
    .disconnect =3D xen_9pfs_disconnect,
    .free       =3D xen_9pfs_free,

.initialise (connect) and .disconnect are matched operations.  So
.disconnect should be cleaning up from .connect, which this patch
implements.

Also, neither xen_9pfs_alloc() nor xen_9pfs_init,() perform any
allocations, so that is why the .free callback is now empty.

Thanks for taking a look!

Regards,
Jason

