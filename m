Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EC2348529
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 00:19:27 +0100 (CET)
Received: from localhost ([::1]:54496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPCmc-0004mT-JO
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 19:19:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lPCgL-0000XT-PT
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 19:12:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lPCgJ-0001e8-LA
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 19:12:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616627574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5Fy8cV+wvVetMrpUGY9G9yO801jZuxKox6uq2Kbq6kg=;
 b=BabxIcac433PQrHqdXDrMyjtT7xLnEHFXv4z2HbApAQlUsj20Tb1FhzX2bqNqaMam+TACN
 jSNI8e9YzkRrOBg0njmh7rqski+iSggwOuzo6Fk2R5z8aySY8GDmnv7EkKgzpPQUjejLs/
 eqOHFAgwgPlLOZ+XtL+1U2AVsibBAqQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-03tVtLhZMMaQTUvKJ6Evug-1; Wed, 24 Mar 2021 19:12:52 -0400
X-MC-Unique: 03tVtLhZMMaQTUvKJ6Evug-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02EE6911E4;
 Wed, 24 Mar 2021 23:12:51 +0000 (UTC)
Received: from localhost (ovpn-119-39.rdu2.redhat.com [10.10.119.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5FC85C730;
 Wed, 24 Mar 2021 23:12:43 +0000 (UTC)
Date: Wed, 24 Mar 2021 18:27:18 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH v2 05/10] Acceptance Tests: add port redirection for ssh
 by default
Message-ID: <20210324222718.GC3592254@amachine.somewhere>
References: <20210323221539.3532660-1-crosa@redhat.com>
 <20210323221539.3532660-6-crosa@redhat.com>
 <3d9fc9c8-d6ac-2829-9ddb-6484142463d0@redhat.com>
MIME-Version: 1.0
In-Reply-To: <3d9fc9c8-d6ac-2829-9ddb-6484142463d0@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GZVR6ND4mMseVXL/"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Eric Auger <eauger@redhat.com>,
 John Snow <jsnow@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--GZVR6ND4mMseVXL/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 24, 2021 at 10:10:50AM +0100, Auger Eric wrote:
> Hi Cleber,
>=20
> On 3/23/21 11:15 PM, Cleber Rosa wrote:
> > For users of the LinuxTest class, let's set up the VM with the port
> > redirection for SSH, instead of requiring each test to set the same
> also sets the network device to virtio-net. This may be worth mentioning
> here in the commit msg.

Absolutely, I've added that note.

> > arguments.
> >=20
> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>=20
> Thanks
>=20
> Eric
>

Thank you!
- Cleber

--GZVR6ND4mMseVXL/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmBbvMYACgkQZX6NM6Xy
CfMH+w//Ttca0FkL+GUTs0BS3iWBMUkpb+ZruJHCTnJulZ2+3EBpG/cp2KrKW12a
cMLpO8/Nj9JBv5jvZ0JJnNDPN0qENdAyZ7yo93jRqu+eFgpVAoAZICDfJjkjDtfT
stjpWtjeDYQKrjFj1PFMbTNefB1/oHaXZrQlQdwggjMPiBh3nDXAlWv+QIOG6jHF
ynk2wc0mLm/H9KgpfAnucGXCeji8UK6aNzXZMz7AdxgLMoKHmVfX8pIZlOW3TWGv
e535c6Xl1uugBwicQGogwLvB8htYR1ap3RGfXrVvXWr/wpS5RVj5ssyxh7EI0jVJ
xlwiMSYZy6a0Ao8W21hTVlHCeWFgMpkVOuzxTyLiNZQ5XJjtMGM+i7fqpNmKT6DL
cZ6dmkZJfnJh3Jp5oQiIkorihnmBMsll3hFZrsOqzGsGXUK04m15/DaVobf6MoMV
7UAtlUxfR7osl/KHsxB3L4XSwigipFUSIL9N2V1In14W6TaeeKv892YXle5FxZW2
5LZjR9yDEqnycg+aEw9NIY5WYMNlkrVsJ3/UUlx9tBIo5eAqsR9x3hFFvRBPjwMh
g022dm+5CKVbmSfbiypiXdkXfvTk3Xsm1XzbDa/jfantPYIaUPIIkfNiTnuqjk1G
TwmDfrQQCIZ0sAqHsNmjO75wfn9JgCvznCVgRoYDJb8QgZ7USGg=
=PbwA
-----END PGP SIGNATURE-----

--GZVR6ND4mMseVXL/--


