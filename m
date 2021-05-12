Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8273D37C7F5
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 18:38:41 +0200 (CEST)
Received: from localhost ([::1]:46822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgrse-0004O3-K8
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 12:38:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lgrip-0001dG-Ce
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:28:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lgril-0002oi-OV
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:28:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620836907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dHbrN1xaMvo6dTi8uRfa019081ahI997R/ZAQeyi+Os=;
 b=GookzJFNGEBCP4j7iiglY9Z7STj9U0f2iYElhDhoLWveE1YFK4mZgGf8wP+A2ZH+n0qSPS
 KsmzD3d4IS4KI2ANF+x+pTbkUVMAI8cc7LIaN9/HXPuZ5jFeFww8LdMBoWmpOUlOLVgCBk
 d/tiFSnSuFVh7V4MFCSuFz9z7rHjHpQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-2TLLCjSoPuC91pFOIFvRTQ-1; Wed, 12 May 2021 12:28:25 -0400
X-MC-Unique: 2TLLCjSoPuC91pFOIFvRTQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EF0F801107;
 Wed, 12 May 2021 16:28:23 +0000 (UTC)
Received: from localhost (ovpn-115-51.ams2.redhat.com [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 46F701E6;
 Wed, 12 May 2021 16:28:01 +0000 (UTC)
Date: Wed, 12 May 2021 17:27:59 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Steve Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V3 06/22] vl: add helper to request re-exec
Message-ID: <YJwCD4flWBGOkSGW@stefanha-x1.localdomain>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
 <1620390320-301716-7-git-send-email-steven.sistare@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1620390320-301716-7-git-send-email-steven.sistare@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3Vz1R70jDcdQsfkG"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--3Vz1R70jDcdQsfkG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 07, 2021 at 05:25:04AM -0700, Steve Sistare wrote:
> @@ -660,6 +673,16 @@ void qemu_system_debug_request(void)
>      qemu_notify_event();
>  }
> =20
> +static void qemu_exec(void)
> +{
> +    const char *helper =3D "/usr/bin/qemu-exec";

The network up script is get_relocated_path(CONFIG_SYSCONFDIR
"/qemu-ifup"). For consistency maybe this should use the same path
rather than /usr/bin/.

--3Vz1R70jDcdQsfkG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCcAg8ACgkQnKSrs4Gr
c8jHyAf9EAS6a2H6Pe3lDn89NMjTUwPNl78p8k8rJpP/2uI9Ck4BQx5rXo5qLu8U
4SiENfqj1UH5Pcs4xHhYy2oIuHzJhECJ+HIlzVbkyDTyfMqUXxDUu71qpKMyaV0b
Hmx4NbZvWCCKiQ/QBMpc86R36bbgnu0N3G5bSjHj59nT5e/fszf1a9+Yj+5QyA3f
ktgZQbrFFdEJl0ppyESQWMohBjWfGsB0x9q0fkj1rfMoS0CPF9H6munxm60Dn+zi
i4AMAhOk/uE8hhLVSJXJ9lyZhnfOSdp2PrN+HSRH19D/vyPHnXFeSd3EdqlpNfRd
wIpLFQ6MiI3wTOxulyYMt0WGkxtxMQ==
=jTQT
-----END PGP SIGNATURE-----

--3Vz1R70jDcdQsfkG--


