Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7343CFAE0
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 15:41:48 +0200 (CEST)
Received: from localhost ([::1]:43322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5q0J-0005rw-Ra
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 09:41:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1m5pvg-0007cx-Kt
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:37:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1m5pvd-00032X-GU
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:36:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626788212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CSkZzP/ymEKBJtbhDpRghf3ByQZT7DLFmb6muezrKaM=;
 b=V39OQHXqfXuBBu+lVz3wTectNPqXZ+hpVfy9Eo0b9tsBYXzkzvejW8kEoNSzY051em7xVo
 Z6SOXU9QrQj6aagcH0mYQkytnPry8KMPRip9xyUhUkQ+8UETi2UlvhXT6Wch7wCBlb4uuq
 kl8SKFr5dfyrrCOY9pDzEfwCSRUbnZs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-M8vH0E6pPnanRjRhsHFz-w-1; Tue, 20 Jul 2021 09:36:50 -0400
X-MC-Unique: M8vH0E6pPnanRjRhsHFz-w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76AE5107B276
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 13:36:49 +0000 (UTC)
Received: from localhost (unknown [10.33.37.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C83B269CB4;
 Tue, 20 Jul 2021 13:36:48 +0000 (UTC)
Date: Tue, 20 Jul 2021 15:36:47 +0200
From: Sergio Lopez <slp@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 11/16] microvm: Drop dead error handling in
 microvm_machine_state_init()
Message-ID: <20210720133647.ssk6gjdprvgkwtoa@mhamilton>
References: <20210720125408.387910-1-armbru@redhat.com>
 <20210720125408.387910-12-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210720125408.387910-12-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="f7boh2q2rxcfe4kz"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--f7boh2q2rxcfe4kz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 20, 2021 at 02:54:03PM +0200, Markus Armbruster wrote:
> Stillborn in commit 0ebf007dda "hw/i386: Introduce the microvm machine
> type".
>=20
> Cc: Sergio Lopez <slp@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/i386/microvm.c | 5 -----
>  1 file changed, 5 deletions(-)
>=20
> diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
> index aba0c83219..f257ec5a0b 100644
> --- a/hw/i386/microvm.c
> +++ b/hw/i386/microvm.c
> @@ -458,15 +458,10 @@ static void microvm_machine_state_init(MachineState=
 *machine)
>  {
>      MicrovmMachineState *mms =3D MICROVM_MACHINE(machine);
>      X86MachineState *x86ms =3D X86_MACHINE(machine);
> -    Error *local_err =3D NULL;
> =20
>      microvm_memory_init(mms);
> =20
>      x86_cpus_init(x86ms, CPU_VERSION_LATEST);
> -    if (local_err) {
> -        error_report_err(local_err);
> -        exit(1);
> -    }
> =20
>      microvm_devices_init(mms);
>  }
> --=20
> 2.31.1
>=20

Reviewed-by: Sergio Lopez <slp@redhat.com>

--f7boh2q2rxcfe4kz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmD20W4ACgkQ9GknjS8M
AjVOuA//dgdqdLE1PgL4+EnkR4ylFG9PGzvedjDJMed+bM0KtP6TAeXzH8NgSS6w
nnG4fKLx9vEUSaHtqNK7lAUqrxI/6dhMhmBF7RvhjTQkD7JsS7HV94ecQ7BXF6Wn
vkuy5ej6KGjLhQNqUiWHZ1UhIdkVBAO6NIZD62Zk0VFCP/GsqXyJu/cSmg5geCjd
tWtbBOLC1dUJMnnQlaz6xdfPJTigapkw3L1XigEUPFerOoYVGYc5+1miLCPOQuIS
sTwc7yhJhET9CEKWf5citWW8BGYg9f5xEruBOObWJdQTXsTe26ZWztmURj4IdyYF
65WbC296rZs4oAJvs3heD4ZFoKgGDSYfJBDn7iIAgy5YBmyEL8CKfgM7+BH6sJ8x
okWf2t0DYuLQZ+MOqwlXqaTgBQAR1BhTk6M7ZqvLehMPFrMJ+R8PD5IaQ/g58drM
/u8Fx+s81DHMI9pV1DgQcDMY4oRpndyWorH2kARtNw2to2+08o+F9Bi8jWtgp4rh
rgG5KU9JQhMwtxiMHFxxJ6sU8Qjpx2MuwUFccHgmejVw5hJNtjqoscaAiv1a3oDL
/rhVPvyj4Io6PkR0qaYiAme6spEmUOZDCZYLum78ZVzZyJt8pHXDUoacZ1vwQP23
1NMPYWBqeLOnXUSBhJMUCp/KQbFViEzY4P34WFnuVa/Si9XM2UA=
=gQ+y
-----END PGP SIGNATURE-----

--f7boh2q2rxcfe4kz--


