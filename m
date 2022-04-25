Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDBD50DB83
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 10:46:15 +0200 (CEST)
Received: from localhost ([::1]:41694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niuMI-0008JJ-Be
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 04:46:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1niu3z-0002hQ-W6
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:27:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1niu3y-0003QR-FO
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:27:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650875237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+mKA4yeP9uZXtzhnCquN3iktfhiti14D31AdNyu3AC4=;
 b=Yoo1R+WwDvMq+4YegVYhoPQBDbF08GbZ3cmIjau7X3EiCulJj2Iya6/JhX76LhXVqxOIlQ
 8JYj0gUjLc9DRfha912cCcfoNxaoDCOHCinx09dH4iDcDDTA6n1JpMOvnqL1FJN7gX0JU/
 bWQEpifHupOfplI2I22WicUyzmcDtWY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-B9_dezBFOW2JJsK2a5agOA-1; Mon, 25 Apr 2022 04:27:14 -0400
X-MC-Unique: B9_dezBFOW2JJsK2a5agOA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82EE41C0BF3A;
 Mon, 25 Apr 2022 08:27:13 +0000 (UTC)
Received: from localhost (unknown [10.39.192.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D9BEC52D63;
 Mon, 25 Apr 2022 08:27:07 +0000 (UTC)
Date: Mon, 25 Apr 2022 09:27:06 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v8 07/17] vfio-user: define vfio-user-server object
Message-ID: <YmZbWlQhF28FW4Lz@stefanha-x1.localdomain>
References: <cover.1650379269.git.jag.raman@oracle.com>
 <0ed6764870ae871ce03409f45c8e7dbe3bb31ba0.1650379269.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gQ4nQ13n02ArczXu"
Content-Disposition: inline
In-Reply-To: <0ed6764870ae871ce03409f45c8e7dbe3bb31ba0.1650379269.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, thuth@redhat.com,
 john.g.johnson@oracle.com, berrange@redhat.com, bleal@redhat.com,
 john.levon@nutanix.com, mst@redhat.com, armbru@redhat.com, quintela@redhat.com,
 f4bug@amsat.org, qemu-devel@nongnu.org, thanos.makatos@nutanix.com,
 kanth.ghatraju@oracle.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--gQ4nQ13n02ArczXu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 19, 2022 at 04:44:12PM -0400, Jagannathan Raman wrote:
> diff --git a/qapi/qom.json b/qapi/qom.json
> index eeb5395ff3..e7b1758a11 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -703,6 +703,20 @@
>  { 'struct': 'RemoteObjectProperties',
>    'data': { 'fd': 'str', 'devid': 'str' } }
> =20
> +##
> +# @VfioUserServerProperties:
> +#
> +# Properties for x-vfio-user-server objects.
> +#
> +# @socket: socket to be used by the libvfiouser library

For consistency: libvfio-user library

--gQ4nQ13n02ArczXu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJmW1oACgkQnKSrs4Gr
c8gYDAgAnF/mYKFEIszkimfyLP0Rdg/qLSS4SFKwmkWFtWXJ2PfG8gR+UlM1ihMm
TDBt3fASktQUEePi/ybID9123o9LetFGtDIn4iORiCrGphTEuvlFDMgCVvX3KJf1
9TTyYSvfADGZCGT5zSgu9XcQji55+T+ZzsD857AhO5M5GVYtBTW9UXfQAnEIQoNe
1GXq2Ku+IAjuIycT6Vc04NjKyyjPA8ifpXCe6vgDWnz1yqQKzv97w8P7b/RbdEkc
pOsigIfu0CKjqS2fNu5BnWCjvIwgY45RauJqcQktB2hvTR1fD85OMQWnSTvZMEbE
EQ2HNTGV2PkcfoF0Qx/hqixSb8BQ9g==
=kPTy
-----END PGP SIGNATURE-----

--gQ4nQ13n02ArczXu--


