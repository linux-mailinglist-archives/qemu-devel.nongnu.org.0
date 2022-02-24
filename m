Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D9A4C28C9
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 11:03:24 +0100 (CET)
Received: from localhost ([::1]:44974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNAy3-0002ie-JM
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 05:03:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nNAwB-0001jr-MP
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 05:01:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nNAw9-000682-Pn
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 05:01:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645696885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f+/uZmUlUmwIbcHwqdk/cqR3zsjY5DR6yznwd5+XZv0=;
 b=gDLHcyjcdim8op+EDfIAboKmER5o41K2hnYB6E3TtwopTm/ohhEXJM3rFJNeQ+I2NjcuHc
 5u6F4bmb3oEwr+Wb8hSmqfCY0W7VkpuJjgikBbmTHngJoEtd7RraxR1pA7UQQYY48D6S4Y
 FU3z6WlWPyhKjXNLStDlgdq13Z+UC6U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-dO1bcN1sPQCEY98TAFgG3A-1; Thu, 24 Feb 2022 05:01:21 -0500
X-MC-Unique: dO1bcN1sPQCEY98TAFgG3A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3EA71100C609;
 Thu, 24 Feb 2022 10:01:20 +0000 (UTC)
Received: from localhost (unknown [10.39.194.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3B606C92D;
 Thu, 24 Feb 2022 10:01:19 +0000 (UTC)
Date: Thu, 24 Feb 2022 10:01:18 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Nicolas Saenz Julienne <nsaenzju@redhat.com>
Subject: Re: [PATCH 2/3] util/main-loop: Introduce the main loop into QOM
Message-ID: <YhdXbtLpdXrL2rve@stefanha-x1.localdomain>
References: <20220221170843.849084-1-nsaenzju@redhat.com>
 <20220221170843.849084-3-nsaenzju@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OBuOrYBN/OdftshA"
Content-Disposition: inline
In-Reply-To: <20220221170843.849084-3-nsaenzju@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, fam@euphon.net, berrange@redhat.com,
 qemu-block@nongnu.org, michael.roth@amd.com, mtosatti@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, eduardo@habkost.net,
 hreitz@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--OBuOrYBN/OdftshA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 21, 2022 at 06:08:44PM +0100, Nicolas Saenz Julienne wrote:
> diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
> index 8dbc6fcb89..fea5a3e9d4 100644
> --- a/include/qemu/main-loop.h
> +++ b/include/qemu/main-loop.h
> @@ -26,9 +26,20 @@
>  #define QEMU_MAIN_LOOP_H
> =20
>  #include "block/aio.h"
> +#include "qom/object.h"
> +#include "util/event-loop.h"
> =20
>  #define SIG_IPI SIGUSR1
> =20
> +#define TYPE_MAIN_LOOP "main-loop"
> +
> +struct MainLoop {
> +    EventLoopBackend parent_obj;
> +};
> +typedef struct MainLoop MainLoop;
> +
> +DECLARE_INSTANCE_CHECKER(MainLoop, MAIN_LOOP, TYPE_MAIN_LOOP)

 * Direct usage of this macro should be avoided, and the complete
 * OBJECT_DECLARE_TYPE macro is recommended instead.

Is there a reason for using DECLARE_INSTANCE_CHECKER() instead of
OBJECT_DECLARE_TYPE()?

> @@ -882,7 +883,8 @@
>        'input-barrier':              'InputBarrierProperties',
>        'input-linux':                { 'type': 'InputLinuxProperties',
>                                        'if': 'CONFIG_LINUX' },
> -      'iothread':                   'IothreadProperties',
> +      'iothread':                   'EventLoopBackendProperties',
> +      'main-loop':                  'EventLoopBackendProperties',
>        'memory-backend-epc':         { 'type': 'MemoryBackendEpcPropertie=
s',
>                                        'if': 'CONFIG_LINUX' },
>        'memory-backend-file':        'MemoryBackendFileProperties',

Does this commit the QAPI schema to keeping iothread and main-loop
properties identical or can they diverge over time, if necessary?

I think we have the freedom to switch the QAPI schema to different
structs for iothread and main-loop in the future because QMP clients
aren't supposed to rely on the exact type, but I wanted to double-check.

> diff --git a/qga/meson.build b/qga/meson.build
> index 1ee9dca60b..3051473e04 100644
> --- a/qga/meson.build
> +++ b/qga/meson.build
> @@ -52,7 +52,7 @@ qga_ss =3D qga_ss.apply(config_host, strict: false)
> =20
>  qga =3D executable('qemu-ga', qga_ss.sources(),
>                   link_args: config_host['LIBS_QGA'].split(),
> -                 dependencies: [qemuutil, libudev],
> +                 dependencies: [qemuutil, libudev, qom],

Looks like a change because the first patch added the base class to qom
instead of qemuutil. Maybe this can be undone if the base class is added
to qemuutil instead.

--OBuOrYBN/OdftshA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIXV24ACgkQnKSrs4Gr
c8g4OAf+OJZIY7Tf/acbe1NqdV5a7zCEfS0BoSrPmUISIJcLI/GvCf5pjq1UOpqD
zbCogk5wobcRUK7jlOFa0qTRB9SC7mkFCXdHaijeH2737V6NuDeiuf/xhZjgXoJD
tsdIBJ2rn3+pGUXMo3ER2v02LDGMxEExMu0LpkTS+hwie5FosFQx3YUFHYRoZzWe
k/AhM+ZVu+tqIJe/WYexe+FmMu80UHOsXcUUs5jxiP9lSFPD7HWjIJBxflCgMaBr
M+9oBOsoZS0AB7ISqRvyP+g9APkGuKdxuEUVo706uM9eQ3+xIhc5hCDMNIrrm+s0
92gxqtgP309P/oVP5TQ+zVpqMSw+wg==
=d7eX
-----END PGP SIGNATURE-----

--OBuOrYBN/OdftshA--


