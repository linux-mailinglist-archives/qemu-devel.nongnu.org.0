Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5C2368053
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 14:25:56 +0200 (CEST)
Received: from localhost ([::1]:43536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZYP5-0005aI-A8
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 08:25:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lZYLd-0003U7-CJ
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 08:22:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lZYLY-00006w-KT
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 08:22:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619094135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=asYyKVuxHyFyXVs+Pc2sN6OCbtRy0W8YaOrlbNlDrA0=;
 b=gtJUVFRE2E/nDpxCv0esbavN4bcwI08Hgw/ZznINvcKfTFPPKJhu+9TgdAycidvEwHVmVP
 B3uNLN6ppj+GqlHNf5U4pmK1yUDDJr62ots12xkQjcCITECI8zC44nvzdoc7MesSP3BWQ2
 SClHcT5bGUv6pNy+oVy4Nffoc6VC+ao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-EyaNTzB7MtSrnBF-oFozIA-1; Thu, 22 Apr 2021 08:22:11 -0400
X-MC-Unique: EyaNTzB7MtSrnBF-oFozIA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F058110C40CC;
 Thu, 22 Apr 2021 12:22:09 +0000 (UTC)
Received: from localhost (ovpn-112-237.rdu2.redhat.com [10.10.112.237])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B650F62688;
 Thu, 22 Apr 2021 12:22:06 +0000 (UTC)
Date: Thu, 22 Apr 2021 08:17:36 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v2 6/7] tests/acceptance: Add set_vm_arg() to the Test
 class
Message-ID: <20210422121736.GF2153290@amachine.somewhere>
References: <20210408195237.3489296-1-wainersm@redhat.com>
 <20210408195237.3489296-7-wainersm@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210408195237.3489296-7-wainersm@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FoLtEtfbNGMjfgrs"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: wrampazz@redhat.com, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 pavel.dovgaluk@ispras.ru, pbonzini@redhat.com, philmd@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--FoLtEtfbNGMjfgrs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 08, 2021 at 04:52:36PM -0300, Wainer dos Santos Moschetta wrote=
:
> The set_vm_arg method is added to avocado_qemu.Test class on this
> change. Use that method to set (or replace) an argument to the list of
> arguments given to the QEMU binary.
>=20
> Suggested-by: Cleber Rosa <crosa@redhat.com>
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>  tests/acceptance/avocado_qemu/__init__.py | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance=
/avocado_qemu/__init__.py
> index 7f8e703757..5314ce70eb 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -240,6 +240,22 @@ def get_vm(self, *args, name=3DNone):
>                  self._vms[name].set_machine(self.machine)
>          return self._vms[name]
> =20
> +    def set_vm_arg(self, arg, value):
> +        """
> +        Set an argument to list of extra arguments to be given to the QE=
MU
> +        binary. If the argument already exists then its value is replace=
d.
> +
> +        :param arg: the QEMU argument, such as "-cpu" in "-cpu host"
> +        :type arg: str
> +        :param value: the argument value, such as "host" in "-cpu host"
> +        :type value: str
> +        """
> +        if arg not in self.vm.args:
> +            self.vm.args.extend([arg, value])
> +        else:
> +            idx =3D self.vm.args.index(arg)
> +            self.vm.args[idx + 1] =3D value
> +

This assumes that the arg will have a value, but that's not always the
case.  And, even if you were to pass an empty string, the logic would
overwrite the next (unrelated) arg.

Regards,
- Cleber.

--FoLtEtfbNGMjfgrs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCBaWAACgkQZX6NM6Xy
CfMAOhAAtGKJFxXrbY3w2nbMB/biaqwHDu8tYfGZNWtfENKUyrAbSOkwUa6NcHwX
tDOYdo0Tmi5Vmrl+7ZqYh3e8G1aUZjBvCOZ/KS7HsR9Hb3e3JE48CfS3IRpG8BHE
5WoENJRMNTjGG/HOM6+TXUepFjLuqFo9XRG1k4d10ME+kBdtbujvE1kNnvvwTMBM
D2rB5erj9ghE9bpnTleoKjEdPmqZLK7Yvotch+LpRDpkG7RD1+jqh5pHJ++7qsB6
j/GI4lEwubOJgGvamLpauGb6OrW4kVnCT8gwdbqUNOEOwbttEq/XWntMXYHz7per
QUZ0ROWu3jqIgjEUu/314F2t2jpKh8VDv8+JVeI2ZRcSmqKYmsSQFO1vkNWnHPvl
j5jMhI5PVCrFILmMLk6pS/t1wX2M3AFH+AOawthH09M03O9oitcp3Z0ryAa2wJ9a
t1b3ZHa8ZHWfhBoF4wLt3ygDql7mH8iOU0njZs/TLT/q1ji28xx3bdRRxFx9J6x2
iNwm0ZI/K9yOedM1wkhCgXAyTyvDh11lbbAtEG9eg2MB6fsyGBi80gsh/Cvo6zYv
NmURJ2qR7L+pNMV9NjIr09KmobuOd/Pr5guTwvsYxpSL0t2dylMA9dem7RqGZDgA
O4M9tSwxcwfYQYW1fdObxS3UtRKv/IyePfr1abUqkInwxhDEfTk=
=eRNL
-----END PGP SIGNATURE-----

--FoLtEtfbNGMjfgrs--


