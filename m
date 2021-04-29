Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3547336EDBB
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 17:57:48 +0200 (CEST)
Received: from localhost ([::1]:52908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc92x-0007Ir-B7
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 11:57:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lc90x-00064m-76
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 11:55:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lc90m-0000Sr-6E
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 11:55:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619711731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gV1rD9bP2auaigdAbuGR4mySJTtzY5Cye9xn+YBFw4I=;
 b=C5RBZeJ+bzS5noHP6HYevr44njVhsAPO2pGJq/lle342aeazllojLJehpjGWXYqGColYPX
 fl8VmQl3bEGs9kclBrdV3uj2hkAkoIU5DxKK0xUVZeArP5GtDKI44HnKtKw47oPm0mbCT6
 00yvGiJC/csppcD9DygrZoPOthutLNo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-RWF37mhfMXigVq3nHW7iqA-1; Thu, 29 Apr 2021 11:55:27 -0400
X-MC-Unique: RWF37mhfMXigVq3nHW7iqA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E6B08026BB;
 Thu, 29 Apr 2021 15:55:25 +0000 (UTC)
Received: from localhost (ovpn-115-28.ams2.redhat.com [10.36.115.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E21A319C59;
 Thu, 29 Apr 2021 15:55:14 +0000 (UTC)
Date: Thu, 29 Apr 2021 16:55:13 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Subject: Re: [PATCH v4 0/3] nvdimm: Enable sync-dax property for nvdimm
Message-ID: <YIrW4bwbR1R0CWm/@stefanha-x1.localdomain>
References: <161966810162.652.13723419108625443430.stgit@17be908f7c1c>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Rcrw00CWvSVPCG9y"
Content-Disposition: inline
In-Reply-To: <161966810162.652.13723419108625443430.stgit@17be908f7c1c>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, mst@redhat.com, qemu-devel@nongnu.org,
 linux-nvdimm@lists.01.org, aneesh.kumar@linux.ibm.com, armbru@redhat.com,
 bharata@linux.vnet.ibm.com, haozhong.zhang@intel.com, ehabkost@redhat.com,
 richard.henderson@linaro.org, groug@kaod.org, kvm-ppc@vger.kernel.org,
 qemu-arm@nongnu.org, imammedo@redhat.com, kwangwoo.lee@sk.com,
 david@gibson.dropbear.id.au, xiaoguangrong.eric@gmail.com,
 shameerali.kolothum.thodi@huawei.com, shivaprasadbhat@gmail.com,
 qemu-ppc@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Rcrw00CWvSVPCG9y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 28, 2021 at 11:48:21PM -0400, Shivaprasad G Bhat wrote:
> The nvdimm devices are expected to ensure write persistence during power
> failure kind of scenarios.
>=20
> The libpmem has architecture specific instructions like dcbf on POWER
> to flush the cache data to backend nvdimm device during normal writes
> followed by explicit flushes if the backend devices are not synchronous
> DAX capable.
>=20
> Qemu - virtual nvdimm devices are memory mapped. The dcbf in the guest
> and the subsequent flush doesn't traslate to actual flush to the backend
> file on the host in case of file backed v-nvdimms. This is addressed by
> virtio-pmem in case of x86_64 by making explicit flushes translating to
> fsync at qemu.
>=20
> On SPAPR, the issue is addressed by adding a new hcall to
> request for an explicit flush from the guest ndctl driver when the backend
> nvdimm cannot ensure write persistence with dcbf alone. So, the approach
> here is to convey when the hcall flush is required in a device tree
> property. The guest makes the hcall when the property is found, instead
> of relying on dcbf.

Sorry, I'm not very familiar with SPAPR. Why add a hypercall when the
virtio-nvdimm device already exists?

Stefan

--Rcrw00CWvSVPCG9y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCK1uEACgkQnKSrs4Gr
c8g/QAf/Zl3J7k2z3nQpWi/HcgKIqmiZ/gYlHxU610TnzxB0pWJfprNzeuJEWeaC
tT9RloGdmS+KmKkKjX7LQplDEry2hc6tEbyUfj3YemUW5Lz8gouaagtSkfLOFsVb
Gpd74EcslwzSzeTmaczXTLP6MVsNaLBJx94C2/tIouGbAZwHcXSWPk/czqFm3YfL
1Zddp77kaNiEOxk62DmL2+iW5NHzNNNzQZyMOod6el05nvuCQrobqzu3HuJ9LklE
CWyi3GbrFLVIsB/xFKIGykaCOaQLpdc/KP6ckdN4mWTStJv9DUCd4ypomrhd1utY
NaKyqhVKEC95PHCEz1YZk9BP8SwUlg==
=jrRj
-----END PGP SIGNATURE-----

--Rcrw00CWvSVPCG9y--


