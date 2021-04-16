Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E40362746
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 19:57:33 +0200 (CEST)
Received: from localhost ([::1]:46112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXSii-0001Fm-SW
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 13:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lXRYM-0001Kn-OB
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 12:42:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lXRYK-0007fd-D1
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 12:42:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618591363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PfLZn06GCpWd2sD/kQWoasE4+SqYa8RYjXnZgdDZcZ0=;
 b=DK/ZrkWLSA/T+zT1oI1/ln1Uo3EyjhHUEf0FEHjarWQUhcaPFLaun1ekAgPpZfp0SqFaaW
 CIm1lptOyDQ8VA+Tk0ijmToStUEDww5ZtVOLEk5dsFhAnPgEDoKa5vgbBLzttP0tWCBryN
 G0h1g7bWoxqZADsdGYMwgnowO+yvVvo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-h4MXXkxTNOCZ9unr-w6ECw-1; Fri, 16 Apr 2021 12:42:41 -0400
X-MC-Unique: h4MXXkxTNOCZ9unr-w6ECw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56887107ACC7;
 Fri, 16 Apr 2021 16:42:40 +0000 (UTC)
Received: from localhost (ovpn-116-207.rdu2.redhat.com [10.10.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 497C660BE5;
 Fri, 16 Apr 2021 16:42:30 +0000 (UTC)
Date: Fri, 16 Apr 2021 12:42:20 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 0/8] Tests: introduce custom jobs
Message-ID: <20210416164220.GF1914548@amachine.somewhere>
References: <20210415215141.1865467-1-crosa@redhat.com>
 <ad6d0dda-ba29-d9e5-1ca9-d849ef28eb66@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ad6d0dda-ba29-d9e5-1ca9-d849ef28eb66@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Wb5NtZlyOqqy58h0"
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <willianr@redhat.com>, Auger Eric <eric.auger@redhat.com>,
 qemu-s390x@nongnu.org, Willian Rampazzo <wrampazz@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Wb5NtZlyOqqy58h0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 16, 2021 at 06:22:12PM +0200, Paolo Bonzini wrote:
> On 15/04/21 23:51, Cleber Rosa wrote:
> > Different users (or even companies) have different interests, and
> > may want to run a reduced set of tests during development, or a
> > larger set of tests during QE.
> >=20
> > To cover these use cases, this introduces some example (but
> > functional) jobs.
> >=20
> > It's expected that some common jobs will come up from common
> > requirements for different users (and maybe be added to a common
> > location such as tests/jobs), and that very specific jobs will be
> > added to directories specific to certain groups, say
> > "contrib/com.redhat/jobs" or the like.
> >=20
> > This series does*not*  add new jobs to GitLab CI pipeline, but this is
> > expected to be done later on custom runners.  That is, custom runners
> > could be used for custom jobs.  Anyway, a GitLab CI pipeline can be
> > seen here:
> >=20
> >   https://gitlab.com/cleber.gnu/qemu/-/pipelines/287210066
> >=20
> > This is based on the Avocado version bump patch:
> >=20
> >   https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg02391.html
>=20
> I admit I haven't even having read the patches (only the diffstat), but
> still: documentation please.
>=20
> Paolo
>=20

Hi Paolo,

Absolutely, formal docs are very much needed and will be provided.

For now, please refer to patch 8's commit message.  It contains basic
usage information for these jobs, and pointers to external
documentation.

PS: I'm very much interested in knowing what are user's first
questions or use cases, so that I can tune the documentation
accordingly.  Questions and ideas like the one from Phil (about a YAML
config file) would definitely help me to write a more relevant set of
docs.

Thanks,
- Cleber.

--Wb5NtZlyOqqy58h0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmB5vmYACgkQZX6NM6Xy
CfNEIg/+KpPfFWBVLXdQxsWHqUo0+vZs2fmJOiLqFcgqW/OjXm/5DPLl8FVavs/3
OSjSLiKR8TfvKOFK3aqXl0chtB8BeWKtUCPgNyTwEgxM3XLBtRudySHbSOg4u9OS
yNJZ5SwidxPTOIgvHMBArYeTPv5I60U/7ny1tOc6ht1u8+Fc7yBr+v+bLaFFvbu3
v7Xck46+Vpbel3Dam5Q3YOv3LUiydNB6kgTWRjiiH7Rl4vIwlWSIRIM/MzhALHY7
V93WHGRImG6g82J/OK3t2AztcNCsxnD/21jYjNkGNKjUhm3w6TQrgBlpT6eXE6R/
fNoMwH45DDuJqY2zzMhlZaJgAtsuA82WQHTXPXVfjtyjBMcMHgYwWeOnJpW39vEQ
E0fdS3VHpkBVp4k5j3QKlN7/nvkoVMSxuwpoqTMHsaH9drTCilcu/E7uMzvzl0+R
8r7lkQ+AGM77AxSA/AJf45C+Ff+lIg+9NyTDaWWbdx+3fDyi9429VJk9eKV2T85Z
T9UwiIhQKzTHMRyyh0tDUE0rBGlpaY6UTV6UlZal993PJI0NmWmT3UHWZiGUgNKg
YFxlC6nsIoIc6cTAQL0zlCSln9N/DDVgkQZVfMLTMf/R3DUJSXmxYKoSbGeOB4/L
r92GEYp+b5gSd8+1Am4Om9z/8OimC2VZ9XhMHB6iyzHceNI9GGQ=
=jbBv
-----END PGP SIGNATURE-----

--Wb5NtZlyOqqy58h0--


