Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 003024C288D
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 10:52:14 +0100 (CET)
Received: from localhost ([::1]:34564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNAnD-00035u-WD
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 04:52:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nNAjv-0001tJ-L4
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 04:48:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nNAjs-0001X7-DB
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 04:48:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645696122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t3FCEfcDI7XCtW/zLj/OvvTBCQDBwwP4kEHf7mAHnFM=;
 b=Ic1AmaaKb8dDIcVkeFk0Br0l9YRo18+2dklgJbV0oOPY6iSd9y2LYb1DcuyoCPjorcm0gh
 sL+Et81kMqpbYD6JuTOyivI27vy6JPDEH/rxnsUvHI56YZPUFkPU2TIEaahjQa4eLXIX3n
 1kvyHwU7mmT0XugtihtYn4DznlE3+VI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-GwdcBxRUPtmtfh32V_EzrA-1; Thu, 24 Feb 2022 04:48:40 -0500
X-MC-Unique: GwdcBxRUPtmtfh32V_EzrA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABDF4800496;
 Thu, 24 Feb 2022 09:48:39 +0000 (UTC)
Received: from localhost (unknown [10.39.194.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89E466F977;
 Thu, 24 Feb 2022 09:48:34 +0000 (UTC)
Date: Thu, 24 Feb 2022 09:48:33 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Nicolas Saenz Julienne <nsaenzju@redhat.com>
Subject: Re: [PATCH 1/3] util & iothread: Introduce event-loop abstract class
Message-ID: <YhdUcRNi95PY0X98@stefanha-x1.localdomain>
References: <20220221170843.849084-1-nsaenzju@redhat.com>
 <20220221170843.849084-2-nsaenzju@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6HdCQivyIgFFaPKx"
Content-Disposition: inline
In-Reply-To: <20220221170843.849084-2-nsaenzju@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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


--6HdCQivyIgFFaPKx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 21, 2022 at 06:08:43PM +0100, Nicolas Saenz Julienne wrote:
> diff --git a/qom/meson.build b/qom/meson.build
> index 062a3789d8..c20e5dd1cb 100644
> --- a/qom/meson.build
> +++ b/qom/meson.build
> @@ -4,6 +4,7 @@ qom_ss.add(files(
>    'object.c',
>    'object_interfaces.c',
>    'qom-qobject.c',
> +  '../util/event-loop.c',

This looks strange. I expected util/event-loop.c to be in
util/meson.build and added to the util_ss SourceSet instead of qom_ss.

What is the reason for this?

>  ))
> =20
>  qmp_ss.add(files('qom-qmp-cmds.c'))
> diff --git a/util/event-loop.c b/util/event-loop.c
> new file mode 100644
> index 0000000000..f3e50909a0
> --- /dev/null
> +++ b/util/event-loop.c

The naming is a little inconsistent. The filename "event-loop.c" does
match the QOM type or typedef name event-loop-backend/EventLoopBackend.

I suggest calling the source file event-loop-base.c and the QOM type
"event-loop-base".

> @@ -0,0 +1,142 @@
> +/*
> + * QEMU event-loop backend
> + *
> + * Copyright (C) 2022 Red Hat Inc
> + *
> + * Authors:
> + *  Nicolas Saenz Julienne <nsaenzju@redhat.com>

Most of the code is cut and pasted. It would be nice to carry over the
authorship information too.

> +struct EventLoopBackend {
> +    Object parent;
> +
> +    /* AioContext poll parameters */
> +    int64_t poll_max_ns;
> +    int64_t poll_grow;
> +    int64_t poll_shrink;

These parameters do not affect the main loop because it cannot poll. If
you decide to keep them in the base class, please document that they
have no effect on the main loop so users aren't confused. I would keep
them unique to IOThread for now.

--6HdCQivyIgFFaPKx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIXVHEACgkQnKSrs4Gr
c8gEfgf/bpWTGZTHH4vw5mON4jlMFx33lBTDRBQyy7uZVvVb1avMW98IBfK+Rc5A
BE66Pr4f0s7SVdcYSW3QHDHJhDUT+CsO1am2RZignlgATnhLUc2H0QFXtwdXTNBm
ReVn0HUv42MxJC6WMPzsP20zCk2cUkpxJeGcTm+YffGmH2zCnCSQ75BZN8bHJe83
QRBrQtUR8OWpBxBX582HX5qz2aliWbGYldg6Lw8mjSbxbskj//daJeURkqY5lLD5
RuYN1RdqTzx8KGAeRJohfM0j6VmIGJfB1lQaRUApE5GKej4EfQA2Ih5eGhciu7mO
vaLhyTU+uuWvJNR6qeCr9RnjUBRCAw==
=Lz28
-----END PGP SIGNATURE-----

--6HdCQivyIgFFaPKx--


