Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1C32AF3EC
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 15:42:09 +0100 (CET)
Received: from localhost ([::1]:54628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcrK4-0000IT-9k
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 09:42:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kcrEj-0005HH-Kj
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 09:36:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kcrEh-0005Yw-VW
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 09:36:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605105395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0lQfXVZdtj2Zh7wL+GR68eMDmLyL5zvKlPAec6bl7Nk=;
 b=DboydOtpIf8Wkv0ZHW7e4iJ5xeqb6T+m/3PfcRiMmmAQZvozSWFEw+QztZbTrJs7Gzup2v
 WjwYiOKd0HVRdDRVuFa7Nun6rj3LGmqyD2a7qaWXZd1Xl6RuuwAwnE4jz4+02Leb/IssDs
 s689lfTsMQaQ4gL5T21Hv/F2gAbFisQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-k0sHuuvzNnmaZ_iDMEJLGA-1; Wed, 11 Nov 2020 09:36:28 -0500
X-MC-Unique: k0sHuuvzNnmaZ_iDMEJLGA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDD46873112;
 Wed, 11 Nov 2020 14:36:26 +0000 (UTC)
Received: from localhost (ovpn-112-222.ams2.redhat.com [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 74F6B5B4D0;
 Wed, 11 Nov 2020 14:36:17 +0000 (UTC)
Date: Wed, 11 Nov 2020 14:36:15 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Daniel Berrange <berrange@redhat.com>
Subject: Re: [RFC v3] VFIO Migration
Message-ID: <20201111143615.GA1421166@stefanha-x1.localdomain>
References: <20201110095349.GA1082456@stefanha-x1.localdomain>
 <64fb6a41-fbfa-994c-9619-4df41ac97fde@redhat.com>
MIME-Version: 1.0
In-Reply-To: <64fb6a41-fbfa-994c-9619-4df41ac97fde@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: John G Johnson <john.g.johnson@oracle.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, mtsirkin@redhat.com,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 quintela@redhat.com, Jason Wang <jasowang@redhat.com>, "Zeng,
 Xin" <xin.zeng@intel.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Felipe Franciosi <felipe@nutanix.com>,
 Christophe de Dinechin <dinechin@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2020 at 12:12:31PM +0100, Paolo Bonzini wrote:
> On 10/11/20 10:53, Stefan Hajnoczi wrote:
> > "allowed_values"
> >    The list all values that the device implementation accepts for this =
migration
> >    parameter. Integer ranges can be described using "<min>-<max>" strin=
gs.
> >=20
> >    Examples: ['a', 'b', 'c'], [1, 5, 7], ['0-255', 512, '1024-2048'], [=
true]
> >=20
> >    This member is optional. When absent, any value suitable for the typ=
e may be
> >    given but the device implementation may refuse certain values.
>=20
> I'd rather make this simpler:
>=20
> - remove allowed_values for strings.  Effect: discourages using strings a=
s
> enums, leaving them only for free-form values such as vendor name or mode=
l
> name.

And introduce an enum type?

> - remove allowed_values for bools.  If off_value is absent the only allow=
ed
> value is init_value.  If off_value is present, both true and false are
> allowed (and !off_value is the "on_value", so to speak).

Makes sense.

> - change allowed_values into allowed_min and allowed_max for int values.
> Advantage: avoids having to parse strings as ranges.  Disadvantage: remov=
es
> expressiveness (cannot say "x must be a power of two"), but I'm not sure
> it's worth the extra complication.

Yes, the current syntax supports sparse ranges and multiple ranges.

The trade-off is that a tool cannot validate inputs beforehand. You need
to instantiate the device to see if it accepts your inputs. This is not
great for management tools because they cannot select a destination
device if they don't know which exact values are supported.

Daniel Berrange raised this requirement in a previous revision, so I
wonder what his thoughts are?

Stefan

--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+r9t8ACgkQnKSrs4Gr
c8ioVggAmwMj9RIchO0Mtxv1zWZiSf5lChQCx+G1+BfPV578FMT0Q2ZskcCD8l3P
4Ex4jSLIGhIVrCk1cKD+w1KSxwgqXKEiwkMpWlObd0MZyAPivjv4LIDL3b943wDi
OH8W425uMcTmgIvfO66GhS3fXWDkhBalbGZMANfILWe49rMmoktwzYhbTTKLMU0A
1wR+r+cyFlihJ8mpjPQ/1FfWJi4gDcbj4GZgfmyfr/Qph1Rt4TwLK3B1SimkWNvq
Xg/nWm7zUiOjWI8LEOOpg04q0IUoy2IiMXYEf4iwC0Sj56zTOucSDxCXC32ccD1C
0ggGLzKMiFAy7U+H6mwJFYhLVnpKOA==
=TB+o
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--


