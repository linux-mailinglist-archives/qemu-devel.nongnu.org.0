Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E955B4D448E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 11:27:08 +0100 (CET)
Received: from localhost ([::1]:43828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSG0h-0005cK-V6
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 05:27:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nSFz9-00049l-5t
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 05:25:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nSFz5-00060j-Ia
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 05:25:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646907926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Et4IBWpkFoWPMc4c7XkXpIJqjFvDs9v6ccmJntAXor0=;
 b=ZMZXiUhqlO2UNYnBc2ejvW5ZHPoiZhLF6I289mbkO5cgGCYWepb1iAdZWCSUkkxsqkdPC0
 xX44DNrz/fjTdNp7KFizAjr93yzqMrUKYp/8IfMoKNb9I3vACoR5hAZCfDwdPYcxYUcP13
 H8aK+DmRBozhg3iyt/KazpuYaIpHH/g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-512-fYX1EqE-Obm7N3pf3HMpkw-1; Thu, 10 Mar 2022 05:25:23 -0500
X-MC-Unique: fYX1EqE-Obm7N3pf3HMpkw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CCEF1006AA6;
 Thu, 10 Mar 2022 10:25:22 +0000 (UTC)
Received: from localhost (unknown [10.39.195.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2BE94105958C;
 Thu, 10 Mar 2022 10:25:21 +0000 (UTC)
Date: Thu, 10 Mar 2022 10:25:19 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Nicolas Saenz Julienne <nsaenzju@redhat.com>
Subject: Re: [PATCH v2 2/4] Introduce event-loop-base abstract class
Message-ID: <YinSD8xxujd5lOSy@stefanha-x1.localdomain>
References: <20220303145822.518887-1-nsaenzju@redhat.com>
 <20220303145822.518887-3-nsaenzju@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wjrnXLCXv6SUfAN/"
Content-Disposition: inline
In-Reply-To: <20220303145822.518887-3-nsaenzju@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


--wjrnXLCXv6SUfAN/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 03, 2022 at 03:58:20PM +0100, Nicolas Saenz Julienne wrote:
> @@ -2935,13 +2947,6 @@ qemu_syms =3D custom_target('qemu.syms', output: '=
qemu.syms',
>                               capture: true,
>                               command: [undefsym, nm, '@INPUT@'])
> =20
> -qom_ss =3D qom_ss.apply(config_host, strict: false)
> -libqom =3D static_library('qom', qom_ss.sources() + genh,
> -                        dependencies: [qom_ss.dependencies()],
> -                        name_suffix: 'fa')
> -
> -qom =3D declare_dependency(link_whole: libqom)
> -

Why was it necessary to move qom_ss and subdir('hw') up? Can
event_loop_base be defined down here instead?

(The benefit of less code churn is it reduces the risk of patch conflicts.)

--wjrnXLCXv6SUfAN/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIp0g8ACgkQnKSrs4Gr
c8iHRwf/ZC18qUXaxvozWEFJ1m73FbE9/v4NjblZMFBDibBcYOblQy2BVb/+UNxt
rW/L9k783iIruzvk/ZmcbCXdgvC+xrE+7IaJEUnz2YdV0bBGDax/imf4wz+7k6/L
Vo8s1qwa+oDG+YFE67NGzHJeqd5atrSnk1e15VXRLDjLVuw+HkHolTy1hJr3/y6h
+19hQgmi0zUWFDko1jeXG3iENTAt7gENDKz5yBIl7ndryrbNNtxuz8ONemSzs7NK
MGRgePg2ULW6iJjatvlj38MWdrBIZy0IJFO2LbcKCBB3IZPCdJbQdJfXFhIUjXVB
NlwPzN6sKAfWSjdZ/5sz8tGG+ZX7Vg==
=9Y7i
-----END PGP SIGNATURE-----

--wjrnXLCXv6SUfAN/--


