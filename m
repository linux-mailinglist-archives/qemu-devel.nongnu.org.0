Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB674B51BD
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Sep 2019 17:44:26 +0200 (CEST)
Received: from localhost ([::1]:47476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAFeT-0003rR-Mj
	for lists+qemu-devel@lfdr.de; Tue, 17 Sep 2019 11:44:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36002)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pkrempa@redhat.com>) id 1iAFY1-0007Tq-5w
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 11:37:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pkrempa@redhat.com>) id 1iAFY0-0002D6-0L
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 11:37:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58258)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pkrempa@redhat.com>)
 id 1iAFXw-0002C2-SN; Tue, 17 Sep 2019 11:37:41 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4037085545;
 Tue, 17 Sep 2019 15:37:39 +0000 (UTC)
Received: from andariel.pipo.sk (ovpn-204-94.brq.redhat.com [10.40.204.94])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D9A05C1D8;
 Tue, 17 Sep 2019 15:37:37 +0000 (UTC)
Date: Tue, 17 Sep 2019 17:37:35 +0200
From: Peter Krempa <pkrempa@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Message-ID: <20190917153735.GI1835@andariel.pipo.sk>
References: <20190917110443.2029-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="X+nYw8KZ/oNxZ8JS"
Content-Disposition: inline
In-Reply-To: <20190917110443.2029-1-kwolf@redhat.com>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Tue, 17 Sep 2019 15:37:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 0/2] block/snapshot: Restrict set of
 snapshot nodes
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--X+nYw8KZ/oNxZ8JS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 17, 2019 at 13:04:41 +0200, Kevin Wolf wrote:
> This fixes internal snapshots with separately defined protocol nodes
> (like libvirt will do with -blockdev).

The code change is exactly what I thought would be necessary in this
case. I've tested it with my blockdev code in libvirt enabled and all
three internal snapshot commands seem to work as expected even when
fully using blockdev and also only the top layer gets the snapshot.

I'll send patches that attempt adding introspection to allow libvirt
detecting this fix.

Reviewed-by: Peter Krempa <pkrempa@redhat.com>
Tested-by: Peter Krempa <pkrempa@redhat.com>

--X+nYw8KZ/oNxZ8JS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUn7DGLvflazX+2GwHGwCByjY1GoFAl2A/b0ACgkQHGwCByjY
1GpuHBAA0YhcAHAu5eqSxEumxtRcoUUJ3XcJwi3g7pmWlDdOsBx+k7P3MhhYQ8f7
l6Xv7P8IYUqR28O1GEEE3rKFEpnvvRAlHJ3PVCxWypu58vFWsvquR+XPgpr8eXP2
vb5Hlpt6VLLM1+9KWqlgzcI6RTEobWQlZ7W3FVJ55Dk4jqWN4x9oCdRuu/n60lHP
r66nX+wwiBmYEsfLtAb8J+BHsVM5wA8sfBWKEEkbqPo9GbOTzI30xOAAfcfp5Bf6
lnd5So08KobHt7s2WLIDmh7xw32FbYw0SMWsfCjrLgay2dEdz64o++tELyRX3G4N
bQEOREk0wapmN6jLEWhezOpkSTrZP87Mb+AccnoH7vZwMEvl0tM/LQVxvfQXt3Vd
Kl45xUnWEkiQW/l/nj4Qe4HBY6kpgiJ/Z9xnAiiAmhcCzXXseZRgi6t2J9Xmgo29
mg+Du4wqkgt+bNYKCWdlUnPFhxGT2qlDWWSrhygaE1eFwI8K/Qm7j91Ku5V9/q0C
VeyqFequeuN76Ceq0GiGZdyqc5PNErmoZzweUOKq+4dTSf9vnavDeQYlnXNO29ue
4iOvN9KPHLa2VincokwpfxAJOTOdE6BX5x2KvRJCPNOnpc/cUMO3eFoiCkVRdQdd
c1ONlno4VsDF3yTOXFRX0Ub4F4HFlLHf4sYaiQaWZqLcqn8cnPo=
=zkSj
-----END PGP SIGNATURE-----

--X+nYw8KZ/oNxZ8JS--

