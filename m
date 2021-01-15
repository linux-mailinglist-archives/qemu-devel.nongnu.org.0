Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE062F6F65
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 01:23:49 +0100 (CET)
Received: from localhost ([::1]:53892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Cu4-0001wd-8j
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 19:23:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l0Cq4-00004q-87; Thu, 14 Jan 2021 19:19:40 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:54327 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l0Cq1-0003Py-Sa; Thu, 14 Jan 2021 19:19:40 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DH1yV6T8Gz9sRR; Fri, 15 Jan 2021 11:19:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1610669970;
 bh=6rt0Brp3CktLo2ypYITM1g/ZFLRPD910BAU72R0cilE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FYDuAjxwhiUNKxS9D35s9dvZZmwu0f3se06n5K9yHIarBa8dXbQrzonT4pCCdOJ6s
 dcBA0D0OmDA7npY1IrgnZY89HWSnX8tCaZ0Cpi2XGobOJ5xO8fOYooWZ+RabDG8mq0
 yKQqoicd5A8fzMBzZ7RrVmpOxu1zcgt0osyxfpqI=
Date: Fri, 15 Jan 2021 11:13:27 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [PATCH v7 13/13] s390: Recognize confidential-guest-support option
Message-ID: <20210115001327.GP435587@yekko.fritz.box>
References: <20210113235811.1909610-1-david@gibson.dropbear.id.au>
 <20210113235811.1909610-14-david@gibson.dropbear.id.au>
 <ba08f5da-e31f-7ae2-898d-a090c5c1b1cf@de.ibm.com>
 <aa72b499-1b84-54a3-fd06-2fec4402b699@de.ibm.com>
 <471babb9-9d5a-a2fa-7d90-f14a7d289b8d@de.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qSHHer9gQ0dtepKr"
Content-Disposition: inline
In-Reply-To: <471babb9-9d5a-a2fa-7d90-f14a7d289b8d@de.ibm.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: pair@us.ibm.com, cohuck@redhat.com, brijesh.singh@amd.com,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, frankja@linux.ibm.com, mst@redhat.com,
 mdroth@linux.vnet.ibm.com, pasic@linux.ibm.com, pragyansri.pathi@intel.com,
 andi.kleen@intel.com, thuth@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, dgilbert@redhat.com,
 Greg Kurz <groug@kaod.org>, qemu-s390x@nongnu.org, jun.nakajima@intel.com,
 berrange@redhat.com, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--qSHHer9gQ0dtepKr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2021 at 10:24:57AM +0100, Christian Borntraeger wrote:
>=20
>=20
> On 14.01.21 10:19, Christian Borntraeger wrote:
> >=20
> >=20
> > On 14.01.21 10:10, Christian Borntraeger wrote:
> >>
> >>
> >> On 14.01.21 00:58, David Gibson wrote:
> >> [...]
> >>> +int s390_pv_init(ConfidentialGuestSupport *cgs, Error **errp)
> >>> +{
> >>> +    if (!object_dynamic_cast(OBJECT(cgs), TYPE_S390_PV_GUEST)) {
> >>> +        return 0;
> >>> +    }
> >>> +
> >>> +    if (!s390_has_feat(S390_FEAT_UNPACK)) {
> >>> +        error_setg(errp,
> >>> +                   "CPU model does not support Protected Virtualizat=
ion");
> >>> +        return -1;
> >>> +    }
> >>
> >> I am triggering this and I guess this is because the cpu model is not =
yet initialized at
> >> this point in time.
> >>
> > When I remove the check, things seems to work though ( I can access vir=
tio-blk devices without
> > specifying iommu for example)
>=20
> Maybe we can turn things around and check in apply_cpu_model if the objec=
t exists but
> unpack was not specified?

That might work.  If unpack *is* specified, you'd also need to set the
ready flag there, of course.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--qSHHer9gQ0dtepKr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAA3iUACgkQbDjKyiDZ
s5JVOg//ZK/jqzfMra5QZC8J9RxUz3vcxD/TjIOg6c+ekzbJMveK1GpkYS7O25T1
3R90+6T+/6ZQm419GJrsD/46MsH+DrXTx4y+eWdwWqHzxcrANHIA99dwEepJfj8m
ZQqXtMx4uWi4hVtVyyIkYmosN8sinTHl0XbYr65dg7etNXvASyeDx8xGi+4niVm1
mGJGHouxCsJzN0ov2eLzwr8hx4rlrUXobiIGOfpTtBNNlOvokz73ZF+zAb6VL/si
QBV8fYuiDBcUqRNUTV5xHWjmbfS+qOC/Dw+S/ad07LUtPS/oQVB/dej86HGi6UeW
FaPR/qXL/6vwEhtgychNj3a5TillBjTlbRLVDuYRVzbB5eJD9ORA7pcanS8RjEHa
z9IUEt+SnzUfIZTpI4kjiwdwDYfoySs7tWxdJZUMmCiw1RQCaOQXqdlXqk4Kk7mr
Pq4rIB/Prh4g59IX9ZDymFFYYNQo4urvLb3wJifJquk0NPNmYN1p3v2QdKGtVn41
MRih1c/f51v5Q03k/UU0TAtPKKzyWfLlcAP6BfNz8lY8jrcmn2j1kyhd7vKZyyI/
kf+2jdS2o0QkGb0A6uIWP+IHbXgBo8M6YoOWOcM+v2eDfNLJL8CyMCFjxZdEOXLJ
DfyvIypwN/ASmS7N3s4PaBSKaA1CzcgQmdK8F0lSI5ySD0O0cKg=
=ydH6
-----END PGP SIGNATURE-----

--qSHHer9gQ0dtepKr--

