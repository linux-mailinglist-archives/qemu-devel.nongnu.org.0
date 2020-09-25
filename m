Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32209277D8D
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Sep 2020 03:18:43 +0200 (CEST)
Received: from localhost ([::1]:33062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLcNm-0000yd-7S
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 21:18:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kLbzU-0002iz-07
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 20:53:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kLbzS-00030N-IC
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 20:53:35 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600995213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jBWwA9YQkFiTnyrtWj706IaOsdbVQ0rmeigSw66uBeo=;
 b=Amc6N04r++WKVxDrDXJHH9ZnROU3X5LVcqz9sxSgSGJ+9t/eMTd3Xb1zBc46wsoHVzKoQl
 +JBtQHjA70AdCucNbjsU1j2QIvnkr81jausKGUv4cChPmdXDUjw0GD5UHJeh3+gYw9uPvp
 hEEnzUdhjCKVQ6UE878ASAZE7W3j70Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-C89NbZcNNUKKBG-6OkA2CQ-1; Thu, 24 Sep 2020 20:53:31 -0400
X-MC-Unique: C89NbZcNNUKKBG-6OkA2CQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6945F802B70;
 Fri, 25 Sep 2020 00:53:30 +0000 (UTC)
Received: from localhost.localdomain (ovpn-119-55.rdu2.redhat.com
 [10.10.119.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB05D1002C0D;
 Fri, 25 Sep 2020 00:53:29 +0000 (UTC)
Date: Thu, 24 Sep 2020 20:53:27 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 11/16] qapi/expr.py: enable pylint checks
Message-ID: <20200925005327.GD368253@localhost.localdomain>
References: <20200922211313.4082880-1-jsnow@redhat.com>
 <20200922211313.4082880-12-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200922211313.4082880-12-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eqp4TxRxnD4KrmFZ"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/24 01:10:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.199,
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
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--eqp4TxRxnD4KrmFZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 22, 2020 at 05:13:08PM -0400, John Snow wrote:
> Signed-off-by: John Snow <jsnow@redhat.com>

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>

--eqp4TxRxnD4KrmFZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAl9tP4cACgkQZX6NM6Xy
CfMcjA/7Bd/OJDUCauRTK0mkCj4Q6N57kn5o+dyTDyCyh1MmXrQmOqDJiS6LvEMd
Ngsin7Hsg15dP/nvZWmmXqX+WKbsmrljGRkSVGpbS9laWKyeGzyA9iw37Dz2YxTQ
sEqzMxdprUvl2mQcu4pxctLIWgDqQya4d0gaBX1ep662b4chEcE43PRIYuLf+eCi
YtbRzjgifRsfA1HKvbV4so+Vj9IJ23hIQWV2puPlUf3rTofYs8l4jfQ7mpP2lcz1
NcdBFr2fDfK/3wxyH+1IJfKE/WbS27Hp0xJzCsN54EvkevFAzMSJt0WYrtuEIgA3
iWFv4b32BQK6QUGf3E0lTHbsF8rG6PyPqnEHociA0MffmjCgHPLxe1ynpjgz72LC
0zUPst4NCPUdVpEjjenHTfjU+P5TbADf0z9XiXyqIw9wZKJOFZW1Q4xjsiaO434/
RahRfLqbyU0dzbd6wkiL55I5ZTSr0N9TAjB58t/Bp/q/pugE/1uHuHgH1UgnyS1x
YFEJKnY9HWQ/0012g1nIhQEy8i/ixxxO0QWBEn6TkaP9ntkFYiGcuZ0IzgADF3sW
KOVADrn7tbO5mrMaxhMncYTrDOiT1b2fVWzZBdCdJvPrR0bOGjP7mZT7eN6TVv1P
xmX49Jwj81FdwI9gFbQaaF/1BYtjTE6dr9kqCfzjGfFSsxhTOPk=
=N/y/
-----END PGP SIGNATURE-----

--eqp4TxRxnD4KrmFZ--


