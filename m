Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E3B3825F1
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 09:57:36 +0200 (CEST)
Received: from localhost ([::1]:37086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liY88-0001vZ-1P
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 03:57:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1liY6Z-00014M-KO
 for qemu-devel@nongnu.org; Mon, 17 May 2021 03:55:59 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:28284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1liY6Y-0004bX-6B
 for qemu-devel@nongnu.org; Mon, 17 May 2021 03:55:59 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-NN-Fz79fM66gia3Oezz5fw-1; Mon, 17 May 2021 03:55:45 -0400
X-MC-Unique: NN-Fz79fM66gia3Oezz5fw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6419F107ACCD;
 Mon, 17 May 2021 07:55:43 +0000 (UTC)
Received: from bahia.lan (ovpn-112-167.ams2.redhat.com [10.36.112.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2845E5C290;
 Mon, 17 May 2021 07:55:33 +0000 (UTC)
Date: Mon, 17 May 2021 09:55:31 +0200
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [RFC PATCH v3] ppc/spapr: Add support for
 H_SCM_PERFORMANCE_STATS hcall
Message-ID: <20210517095531.6a9502c1@bahia.lan>
In-Reply-To: <YKIL/Gqc50GO+UTk@yekko>
References: <20210515073759.10505-1-vaibhav@linux.ibm.com>
 <YKIL/Gqc50GO+UTk@yekko>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eA9K0e+.INAxjAOyJIsiYVr";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: xiaoguangrong.eric@gmail.com, mst@redhat.com, aneesh.kumar@linux.ibm.com,
 bharata@linux.vnet.ibm.com, qemu-devel@nongnu.org, kvm-ppc@vger.kernel.org,
 shivaprasadbhat@gmail.com, qemu-ppc@nongnu.org, imammedo@redhat.com,
 Vaibhav Jain <vaibhav@linux.ibm.com>, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/eA9K0e+.INAxjAOyJIsiYVr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 17 May 2021 16:23:56 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Sat, May 15, 2021 at 01:07:59PM +0530, Vaibhav Jain wrote:
[...]
> > +    rc =3D (result =3D=3D MEMTX_OK) ?
> > +        scm_perf_check_rr_buffer(perfstats, addr, size, &num_stats) :
> > +        H_PRIVILEGE;
>=20
> This is a bit cryptic.  Just deal with the memtx error first, then run
> the buffer validation.  Actually, you can unify the exit paths for
> these and the success case by using a goto label near the end which
> has the g_free() and return rc.
>=20

It seems all the g_free() calls could even be avoided by
converting perfstats to g_autofree.

--Sig_/eA9K0e+.INAxjAOyJIsiYVr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAmCiIXMACgkQcdTV5YIv
c9ZwLxAAgYWFcOCyq62LzVGEhiaKGoC6r4gjnCTVvt0uX6SSep4hVfq05diuNCY2
L79ZovwdIzqUXD1axXd/RIhLZhyXDK7vZmISHo7YetiCP30CY7SfsCpqhYJsZD0w
/AjVhPj4T6Qp3hIJMURePTp6jYdiGSPbfJr/n+kD/hTOab/OMxYXSZI3SBjqS06d
8r1OSDYhEyG0WmsVlohOQVkBdBO3iRGeZcgHazDmcQaNANrXHobHXCHQdtboyRPB
473y/+zDx2pxIRPaHy4Cligk1R5t7j3LljTBbdttsbjhU5/pX0Lv45Eaex0dHpJH
NEWlo9ehlOfytoAnEVagnV5NS9522GjGmTw1qoywfq9DI0pHKlMBR1eYAgKp3gle
tL2wrFiNloSSab67yfHV+OItKrpOEoITW2GhWzcp/v8bzKBzCBymMs0pKucHTnZ8
48O0StfrsB7yC+Wb/zE2iWTKrK5BEpxBTGRSC0ZB1H4FpVfAJvI+sRNp3qWDSacf
80QnsIBjcTg0SZBbvu4JuZOOuLJ/0fUPZzc8JMvo7rqJj4tCzQ00cqGWUfTyIyTX
RL7sp5767UPp3J12VmEUTLCRovuQ6Y5cjM1Kw4f9neGq/6PJ7YBeLpsYWu/L8KjX
xhhu/zgSbDLkXzIZi5eN6IWZQ0zxR7Z6NvxVYFqhVjcueXnBRrc=
=Yx9T
-----END PGP SIGNATURE-----

--Sig_/eA9K0e+.INAxjAOyJIsiYVr--


