Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15789368079
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 14:29:57 +0200 (CEST)
Received: from localhost ([::1]:49064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZYSy-0007zt-6I
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 08:29:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lZYLk-0003VO-Aw
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 08:22:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lZYLe-0000DT-8P
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 08:22:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619094141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2aT+ajWFkzjBJGhFuxA9Lgn64hY+OUwB027IreV64Rg=;
 b=bb59zyyt4yzdjplOmcHwhpn4LTwPBW11ckxd5xr1SlOKLBnpCS4jYC0ontpjdJsEQH4itK
 2z2TBCSPOoFAITKQxo8JS1J+lqoTQHpqVmQ2oAleHHJtNjSldrmigLPTjk3LkqRJvpp2/c
 NhUF+wOB8o0y7kqB7rLyhWy/9vZkryg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-mMhpV9_pOpe5bpDyol1J_A-1; Thu, 22 Apr 2021 08:22:19 -0400
X-MC-Unique: mMhpV9_pOpe5bpDyol1J_A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C79387504E;
 Thu, 22 Apr 2021 12:22:18 +0000 (UTC)
Received: from localhost (ovpn-112-237.rdu2.redhat.com [10.10.112.237])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CAC9B369A;
 Thu, 22 Apr 2021 12:22:14 +0000 (UTC)
Date: Thu, 22 Apr 2021 08:19:02 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v2 5/7] python/qemu: Add args property to the QEMUMachine
 class
Message-ID: <20210422121902.GG2153290@amachine.somewhere>
References: <20210408195237.3489296-1-wainersm@redhat.com>
 <20210408195237.3489296-6-wainersm@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210408195237.3489296-6-wainersm@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lQSB8Tqijvu1+4Ba"
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

--lQSB8Tqijvu1+4Ba
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 08, 2021 at 04:52:35PM -0300, Wainer dos Santos Moschetta wrote=
:
> This added the args property to QEMUMachine so that users of the class
> can access and handle the list of arguments to be given to the QEMU
> binary.
>=20
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>  python/qemu/machine.py | 5 +++++
>  1 file changed, 5 insertions(+)
>

Reviewed-by: Cleber Rosa <crosa@redhat.com>

--lQSB8Tqijvu1+4Ba
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCBabYACgkQZX6NM6Xy
CfOaHg/+J5ZBj+fGyzRIxaIvYWXleK841BKJ+m2oD45w0fDSnm/9WahseU+ktewJ
kAbzrJW2O8Gs7gtMpuj2UdCOayCPPmewAPAcTLf8evfG0uOz6M++pj+mukLWK0jc
LHFdaWKcIS0jswtjZN1EX5aLKwBisGsAQmHwAc5dxulTu+o0gitMsmhsGmxG4Fhi
4L9mCX+netx1KLcWVL0Lt4qSkaxZbj1wEmQbgHLZohtjN+fwUporu6V+dlg0rqlr
g0F9y5up+9HLUIrNulR7m6eXjLKk4EDXGcwAXaxpkE77NQkJVJfeZ26hZe46P/fZ
tPLnUT2Ypo+QxgeBJJweGRRQzBUDGGbdMfxm/UE3uZMzXte0Wh4pf1VCoWAWgDcV
eQj0K6JI+ncOtw5aIl0moqKuLkiHy3QHimIg/y6iUzr4TXC/rWMZNRkXHd9ofWZB
aCX8ZVFdACF7ke1/tGDsUTGFumITFsSnjaywQMnSs58K6JURrmG5hUOubV7kCgyF
ewMgEo+vwvypox/oQ9G1kgRfZ+UiLNCgISHMM3tQVtRydPHQzSuHpdyRURC8u6Og
C6hKwRsT8+QHQxsZt/mNBqUaiGLoL94GwDqOQnHQ1ibRz45eqpRt2MjWEubywRhf
TpfI8oR1ChGzQpcxXPB59etk+dxepHnBnJTXK+oWloC7lDncQuU=
=Z/QK
-----END PGP SIGNATURE-----

--lQSB8Tqijvu1+4Ba--


