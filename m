Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA9023DA24
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Aug 2020 13:54:10 +0200 (CEST)
Received: from localhost ([::1]:44478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3eTJ-0001vS-FN
	for lists+qemu-devel@lfdr.de; Thu, 06 Aug 2020 07:54:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1k3eSN-0001UU-Es
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 07:53:11 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40493
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1k3eSK-0007c2-O0
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 07:53:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596714787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NqV9gCnAUxzr6+qbJqyweRulLHzxkJcR01K3EXI43R8=;
 b=SkqlVRnWXowc4GGMZZiiTVIxFDXVVHgxiEXfbijHaUFAGup5xHNTDeOxDCZ32gcxkd8y6a
 qRVgOmZsNhn/kvHLpTvI9JpwQoJnDuTAJvuBZ3d87izo3GkgkdCHU5i4CqLD/yozj3H4XW
 wqAloDy/17TTN7Y0km500mNK2H0tp54=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-7fKRVda8OzWDHSlBF6LMRQ-1; Thu, 06 Aug 2020 07:51:51 -0400
X-MC-Unique: 7fKRVda8OzWDHSlBF6LMRQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C549110059D8;
 Thu,  6 Aug 2020 11:51:49 +0000 (UTC)
Received: from localhost (ovpn-112-129.rdu2.redhat.com [10.10.112.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5733E5C1D2;
 Thu,  6 Aug 2020 11:51:49 +0000 (UTC)
Date: Thu, 6 Aug 2020 13:51:48 +0200
From: Sergio Lopez <slp@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: Why QEMU should move from C to Rust (clickbait alert ;))
Message-ID: <20200806115148.7lz32dro645a3wv6@mhamilton>
References: <CAJSP0QWF8g7r5VqU_PRbskWZU3ahCq+eobR8GexUcPrAiYoCPQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJSP0QWF8g7r5VqU_PRbskWZU3ahCq+eobR8GexUcPrAiYoCPQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7hscaeo53h5onxw4"
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=slp@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/06 03:10:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Dave Gilbert <dgilbert@redhat.com>, "Oleinik, Alexander" <alxndr@bu.edu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--7hscaeo53h5onxw4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 06, 2020 at 11:24:13AM +0100, Stefan Hajnoczi wrote:
<snip>
> Conclusion
> ---------------
> Most security bugs in QEMU today are C programming bugs. Switching to
> a safer programming language will significantly reduce security bugs
> in QEMU. Rust is now mature and proven enough to use as the language
> for device emulation code. Thanks to vhost-user and vfio-user using
> Rust for device emulation does not require a big conversion of QEMU
> code, it can simply be done in a separate program. This way attack
> surfaces can be written in Rust to make them less susceptible to
> security bugs going forward.
>=20

Having worked on Rust implementations for vhost-user-fs and
vhost-user-blk, I'm 100% sold on this idea.

That said, there are a couple things that I think may help getting
more people into implementing vhost-user devices in Rust.

 1. Having a reference implementation for a simple device somewhere
 close or inside the QEMU source tree. I'd say vhost-user-blk is a
 clear candidate, given that a naive implementation for raw files
 without any I/O optimization is quite easy to read and understand.

 2. Integrating the ability to start-up vhost-user daemons from QEMU,
 in an easy and portable way. I know we can always rely on daemons
 like libvirt to do this for us, but I think it'd be nicer to be able
 to define a vhost-user device from the command line and have QEMU
 execute it with the proper parameters (BTW, Cloud-Hypervisor already
 does that). This would probably require some kind of configuration
 file, to be able to define which binary provides each vhost-user
 device personality, but could also be a way for "sanctioning"
 daemons (through the configuration defaults), and to have them adhere
 to a standardized command line format.

Thanks,
Sergio.

--7hscaeo53h5onxw4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAl8r7tMACgkQ9GknjS8M
AjXA+BAAiK8Xk6r7h+7WgA4PJ8I64ehDKAETS6Ir21a9hYODI1oIsC5k4ukjBe0S
4AfBMaBETX+QWzNR0irLWGyCsWQbj3JwSQZybCTsjo1OeTL0P3+wOvvLQQogdxln
YdtzlDWjVAB9jt6BmwGG6oQFGG4jKKIyjDTcUTXf7UbCk2v6lJ/uXe68Iytkkof3
y+WbHE1JYgSGEqpyePBYsGvVzHAH2qNwVjChBpUWdgtOTcRLuRwxcQtGa4E2ezj+
Oc+D5GjVKJ1CJ0eGP+5I2/J7039q6k18Igm8F3jW1TDUl94SUcvdH8oEpUKQczSF
rEp/jQrlVgXqH7HzT9zXMSE+ZcqlB4BfCnFfHNJgz3eVEurg6+Qg81hUANRUDDhG
sdMU7gzNKmdyEFbP+Pnu/6HvX6mm4KoZholnDTPoFoNcdPUuthUPGA23EA49CUrI
VAj4GqDFio6+TIX0nSvvA8RWRrd4B95JcZk4HP3JKI/R81ugwT4GghuUtE5SRl6F
ltRYIJ/f3I4DcpCYgv30pOqXB6VMMHNqNu6OmWrchfgWGV3yTb3nyhnoNjqpzn3A
4qVUThQt0nLNJC7JVr0hrVB1BOTTOdIbs4IXPqVCM4O22DxEiebmKoAxgRCTb4c/
ldnA3YLsh6uhv3svJ54F0anY/T5zyPcTMmyYUwhCZ0Md8I5Ldd0=
=LfpU
-----END PGP SIGNATURE-----

--7hscaeo53h5onxw4--


