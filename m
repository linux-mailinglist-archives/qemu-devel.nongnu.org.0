Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC95508AE4
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 16:39:18 +0200 (CEST)
Received: from localhost ([::1]:59776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhBUD-0000hM-Ny
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 10:39:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nhB4f-0008LN-OC
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:12:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nhB4c-00040v-MH
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:12:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650463969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g4W/mipN+iRihErlszffqLbt0UZTVysHKaszWYNTArE=;
 b=gmfLhwziofEzKnQLxalg4R2RjnXjo4ZwG8Ly5etcaqJAwh/fwiVwx090qG4a+J3vK18dZ1
 usg11ivCiwzD9DsbCcqExfo3gTJ96wmDzCd/AI+GwSRptZkGF0lw3ioF4Nh0oqq6WxSMxm
 aFZwko+sSYIw+BwxM75CLXizUb+a6tg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-128-OnF6pU9sNaqEoniyTliCEg-1; Wed, 20 Apr 2022 10:12:47 -0400
X-MC-Unique: OnF6pU9sNaqEoniyTliCEg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2D943C025C2;
 Wed, 20 Apr 2022 14:12:46 +0000 (UTC)
Received: from localhost (unknown [10.39.194.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8EBEF4087D7F;
 Wed, 20 Apr 2022 14:12:46 +0000 (UTC)
Date: Wed, 20 Apr 2022 16:12:45 +0200
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Florian Weimer <fweimer@redhat.com>
Subject: Re: Portable inline asm to get address of TLS variable
Message-ID: <YmAU3TpZofjACBKa@stefanha-x1.localdomain>
References: <Yg04Y05ccrbFVmG/@stefanha-x1.localdomain>
 <87leyaznm6.fsf@oldenburg.str.redhat.com>
 <CAJSP0QXmF=AKtaZO7GjxFtd7o5iQ9JC2xYGYDo-zC0Ea1POS5w@mail.gmail.com>
 <877d9uzgsd.fsf@oldenburg.str.redhat.com>
 <Yg4VV+VFe3Bc1BQ6@stefanha-x1.localdomain>
 <8735k1q452.fsf@oldenburg.str.redhat.com>
 <Yh4iHeb6FsnxLUNn@stefanha-x1.localdomain>
 <87lew12tr9.fsf@oldenburg.str.redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+y36pZtpxs5zPAnO"
Content-Disposition: inline
In-Reply-To: <87lew12tr9.fsf@oldenburg.str.redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Rodgers <trodgers@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Serge Guelton <sguelton@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--+y36pZtpxs5zPAnO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 19, 2022 at 01:32:42PM +0200, Florian Weimer wrote:
> * Stefan Hajnoczi:
>=20
> > On Tue, Mar 01, 2022 at 12:54:49PM +0100, Florian Weimer wrote:
> >> > I took a quick look at C++20 coroutines since they are available in
> >> > compilers but the primitives look hard to use even from C++, let alo=
ne
> >> > from C.
> >>=20
> >> Could you go into details what makes them hard to use?  Is it because
> >> coroutines are infectious across the call stack?
> >
> > Here is the simplest tutorial on C++20 coroutines I found:
> > https://itnext.io/c-20-coroutines-complete-guide-7c3fc08db89d
> >
> > The amount of boilerplate for trivial coroutine functions is ridiculous.
>=20
> Would an execution agent library reduce that usage overhead?

Paolo Bonzini wrote a proof-of-concept using C++20 coroutines:
https://lore.kernel.org/all/20220314093203.1420404-1-pbonzini@redhat.com/

Stefan

--+y36pZtpxs5zPAnO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJgFN0ACgkQnKSrs4Gr
c8iU6wgAw9zzUXB9bN8XnM+NiaCU+clZEWdohFmR25R4FErxkvCkSXtz9ySrtj/R
oN7nPB/Ieu+g5AdhCTQwU6L/XXzzUJbYGYirZZh6zamUvC5cDDiVGvRgb/8B4f/0
i50BhueT2lspz1Z/FX1caD2HFWUSQf9bLhQOdOwnTf+mI2WH2qTC5gFP6U5h1Ug1
2sKylpW4qSsJI1BY02/epfCOcJ7c/l+eDZRf/CiMK13OqX8hFerDN81YwhT4zyJJ
WogMmSZDXonwthtAyuOADT5Yi2HqVEzHKrLqcCkepjMisR4zP36HxNiIvRSYl1GN
yL2UZnqY+myvdyzcnQKGpDhSHCfrrQ==
=ZT++
-----END PGP SIGNATURE-----

--+y36pZtpxs5zPAnO--


