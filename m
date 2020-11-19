Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 902102B9096
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 12:05:09 +0100 (CET)
Received: from localhost ([::1]:51736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfhkS-0004j6-6E
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 06:05:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kfhiu-00042W-1x
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 06:03:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kfhio-0000fF-Rq
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 06:03:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605783804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YlRFpA/6UPgxubL/D/EPar5/J9USqrdhXNdOwwagsSM=;
 b=EFk1j1jJOGQzL3dWgpMPEAtmMhMusqswbPGWwm0VTHLHHQy6ahx3txECm03WeWaZ5L7ode
 zHrEzlw1g4LIPxfb3b3BA//ml60adyMOBY7awcgJzE6WK7DeX55I8slanwtHIploa5Ngkr
 HoBFA38/OPafUvl4k/uOCWhihts6Cng=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-aoQin9aKOVqoeuB5q6oOMw-1; Thu, 19 Nov 2020 06:03:22 -0500
X-MC-Unique: aoQin9aKOVqoeuB5q6oOMw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C5DB1005D54
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 11:03:21 +0000 (UTC)
Received: from localhost (ovpn-115-68.ams2.redhat.com [10.36.115.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 150B460636;
 Thu, 19 Nov 2020 11:03:17 +0000 (UTC)
Date: Thu, 19 Nov 2020 11:03:16 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 4/4] [broken] meson: try link tracepoints to module
Message-ID: <20201119110316.GG701869@stefanha-x1.localdomain>
References: <20201119084448.24397-1-kraxel@redhat.com>
 <20201119084448.24397-5-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201119084448.24397-5-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JkW1gnuWHDypiMFO"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 23:36:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--JkW1gnuWHDypiMFO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2020 at 09:44:48AM +0100, Gerd Hoffmann wrote:
> Add source set to trace_events_config, use it in trace/meson.build
> so the trace objects are linked to the module not core qemu.
>=20
> Not working as intended.
> /me looks puzzled.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/display/meson.build | 1 +
>  trace/meson.build      | 9 +++++----
>  2 files changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/display/meson.build b/hw/display/meson.build
> index c2fc36e19d3e..94e355ac1e81 100644
> --- a/hw/display/meson.build
> +++ b/hw/display/meson.build
> @@ -46,6 +46,7 @@ if config_all_devices.has_key('CONFIG_QXL')
>    trace_events_config +=3D {
>      'file'  : meson.source_root() / 'hw' / 'display' / 'trace-events-qxl=
',
>      'group' : 'hw_display_qxl',
> +    'ss'    : qxl_ss,
>    }
>    hw_display_modules +=3D {'qxl': qxl_ss}
>  endif
> diff --git a/trace/meson.build b/trace/meson.build
> index 66395d3e2ba7..3f0fe7b7b74c 100644
> --- a/trace/meson.build
> +++ b/trace/meson.build
> @@ -18,6 +18,7 @@ foreach c : trace_events_config
>    trace_events_files +=3D [ trace_events_file ]
>    group =3D '--group=3D' + c.get('group')
>    fmt =3D '@0@-' + c.get('group') + '.@1@'
> +  module_ss =3D c.get('ss', trace_ss)

One idea: module_ss is already used in other files. Are you sure there
isn't an identifier naming conflict?

--JkW1gnuWHDypiMFO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+2UPQACgkQnKSrs4Gr
c8hq4gf8DYLaUmf9yfLoFzqHYNSobmM8jDt8Ac3hDrxUxM8d04L6+y80LVlI0Sdv
28v+/6HjY7c8FWi8vVdbry3KjAUj+DRGsAH2NpRZmL2KNHqZm2xV9HstWFYAphRu
BMzX7hpkmpRLU8SYVu9zps9csXPFlvXO0SvxHud72zVcezL19ghET22a7uP3tUje
omDVci/J/5AC/beHdauPYFDN2dHPoItLKklJq+lGUPcPpgYTFE/DHtYFR0YZRelD
JKhgteLUNRd2+YZtGHTU0wEaJ6JNeeGl8hmd9kqCpRjus5WEMm3LEBd/Vq73PXpC
5rWxLat9/lYuLfq/O37eTcz125YktQ==
=TD4W
-----END PGP SIGNATURE-----

--JkW1gnuWHDypiMFO--


