Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E74D327BFE
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 11:25:37 +0100 (CET)
Received: from localhost ([::1]:42752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGfk8-0003BU-CF
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 05:25:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lGfiV-00026N-0o
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 05:23:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lGfiR-0003eA-MJ
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 05:23:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614594230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BWKfgD45KCjV9PMoaefgjyJsQp66i69G3V9GC+E1wD0=;
 b=RNBYggbEjwTm7oLtQxeoOs1TuNZJ0S5ZNUcE+dy6657oKTodrbw1tS3bYGik3Ahx/qFpEg
 t2y4O4fPIrmgcibe2MzzNTgS1CowWFSOp/voaMsHNyxJHRl1dY7SGlDAMWeVSO7KUBH9BR
 M1Wyqb3rVGbFCvGmPScbxWlK6k/vlPc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-ZBbdsaTNN8CFsIqttMGODQ-1; Mon, 01 Mar 2021 05:23:48 -0500
X-MC-Unique: ZBbdsaTNN8CFsIqttMGODQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C1F680196C;
 Mon,  1 Mar 2021 10:23:47 +0000 (UTC)
Received: from localhost (ovpn-115-54.ams2.redhat.com [10.36.115.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 42CD95D9DB;
 Mon,  1 Mar 2021 10:23:43 +0000 (UTC)
Date: Mon, 1 Mar 2021 10:23:42 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 3/3] docs: vhost-user: replace master/slave with
 front-end/back-end
Message-ID: <YDzArmIIkO1GHoIz@stefanha-x1.localdomain>
References: <20210226143413.188046-1-pbonzini@redhat.com>
 <20210226143413.188046-4-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210226143413.188046-4-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hah5460Zj3NRCQMn"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: mst@redhat.com, jag.raman@oracle.com, qemu-devel@nongnu.org,
 sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--hah5460Zj3NRCQMn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 26, 2021 at 09:34:13AM -0500, Paolo Bonzini wrote:
> -In the current implementation QEMU is the *master*, and the *slave* is
> -the external process consuming the virtio queues, for example a
> +In the current implementation QEMU is the *front-end*, and the *back-end*
> +is the external process consuming the virtio queues, for example a
>  software Ethernet switch running in user space, such as Snabbswitch,
> -or a block device backend processing read & write to a virtual
> -disk. In order to facilitate interoperability between various backend
> +or a block device back-end processing read & write to a virtual
> +disk. In order to facilitate interoperability between various back-end
>  implementations, it is recommended to follow the :ref:`Backend program
>  conventions <backend_conventions>`.

The spec uses "backend" but this patch uses "back-end".

Searching the web shows that "back end", "back-end", and "backend" are
all commonly used. I don't think there is a right or wrong choice since
all spellings are popular. It would be nice to stay consistent and use
"backend"/"frontend" in this document.

--hah5460Zj3NRCQMn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmA8wK4ACgkQnKSrs4Gr
c8g7MAf/XNyaiAF5obpZijBXkz+CmrgRmFSTm6XhwWwFYgZpD84G3y8RlZ2DlRx9
S8RJU/BELboVJ0vY5gnn+N2/YyXt8AB6TxYE7UFsy6F2uDVqBOUFDteus5xacbn8
qTRRQQLLjImhx0rU/6R8SSaDMzK1LHlXnOMT2b+A7FTGEfOaKTMNlklSN8LZr597
tltRdQICZ1wsKVFAqbOMcLI2pM5e8zzXhQmI+kIExwiY4zugOTgKbwt5dRusFvhU
WHdTf2Aexeys0903Y8y5gXrIc+IgsB9npfbGlSEjCdtwhjE6PMawQ4aG8YS6/Nl2
dAQlAs3hdVdd/AYtxoy3MIAhR2SdVQ==
=hbnw
-----END PGP SIGNATURE-----

--hah5460Zj3NRCQMn--


