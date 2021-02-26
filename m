Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63755326A54
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Feb 2021 00:07:21 +0100 (CET)
Received: from localhost ([::1]:56716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFmCd-00018L-S9
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 18:07:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lFmAj-00005k-Gf
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 18:05:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lFmAe-0006qQ-9H
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 18:05:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614380711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q7ptpAIiMS0K/3HRfZ3slnpheNWzoNJfhlm9Z6QW6H4=;
 b=Ee1OrYNQLTanOr817SUMbIrvNzSKv+gC0U3xvm+xfmDIw9jWP7iGpcoZDzFNRHYWidHo5y
 PpgA1ECcRAA0RPk6codswv/+Y41IhnlyZwn11un4kc1WMPDkuMjRyhbkqZPqV+G0Wi2uoH
 Y6vN8/uvAnrAYakqpFPHMEjfzp98jyE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-1XYQT_lrNpimyqUgbg0y7g-1; Fri, 26 Feb 2021 18:05:07 -0500
X-MC-Unique: 1XYQT_lrNpimyqUgbg0y7g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4686180196E;
 Fri, 26 Feb 2021 23:05:06 +0000 (UTC)
Received: from localhost (ovpn-114-28.rdu2.redhat.com [10.10.114.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E15675D9CA;
 Fri, 26 Feb 2021 23:05:02 +0000 (UTC)
Date: Fri, 26 Feb 2021 18:04:38 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 1/2] Acceptance Tests: restore downloading of VM images
Message-ID: <20210226230438.GA1329285@amachine.somewhere>
References: <20210225232122.1254879-1-crosa@redhat.com>
 <20210225232122.1254879-2-crosa@redhat.com>
 <3e7370f0-c094-e1b9-50d2-bdc63170404d@redhat.com>
MIME-Version: 1.0
In-Reply-To: <3e7370f0-c094-e1b9-50d2-bdc63170404d@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="n8g4imXOkfNTN/H1"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=crosa@redhat.com;
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <wrampazz@redhat.com>,
 Marcelo Bandeira Condotta <mbandeir@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 26, 2021 at 01:01:28AM +0100, Philippe Mathieu-Daud=E9 wrote:
> On 2/26/21 12:21 AM, Cleber Rosa wrote:
> > The "get-vm-images" target defined in tests/Makefile.include is a
> > prerequisite for "check-acceptance", so that those files get
> > downloaded before the Avocado job even starts.
> >=20
> > It looks like on c401c058a1c a TARGETS variable was introduced with a
> > different content than it was previously coming from the main
> > Makefile.  From that point on, the "get-vm-images" succeed without
> > doing anything because there was no matching architecture to download.
>=20
> Any idea about how to detect such side effects (tests silently
> disabled) automatically?
>=20

It wasn't really that any tests were disabled... they all continued to
run.  In this case it was a broken make rule that caused the download
of the images, ahead of time, to not be performed.

But your question is still valid and something that could happen.  The
best answer I have is that all job results could and should also be
persisted in a structured way that is succeptible to being queried.
Then on top of that, you can build queries to show stability metrics,
regressions, etc.

To that regards, I can speak about three possibilities:

1) Avocado has support for Fedora's resultsdb[1][2]

2) Because the Acceptance tests are already communicating the test
results to GitLab (via junit), using the GitLab API that lets you
query the detailed test results

3) In addition to that, Marcelo (cc'd here) has written an Avocado plugin
that will export test resutls suitable to be used on a datawarehouse
tool developed by the Continuous Kernel Integration project[3]. This
is not generally available at the moment, but should be available
soon.

Regards,
- Cleber.

[1] - https://taskotron.fedoraproject.org/resultsdb/results
[2] - https://avocado-framework.readthedocs.io/en/85.0/plugins/optional/res=
ults.html#resultsdb-plugin
[3] - https://cki-project.org

--n8g4imXOkfNTN/H1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmA5foMACgkQZX6NM6Xy
CfOvkhAAuqhewltJ9oQPFSABdYaUvjhvZkvaEh+cGFmbB6gtNgfRZHWTZuZT/UcM
uKYmSEXjCyNWYXSh4JssAr/Elxp9rp1oY0m/8zj3yvNfAIKeWJPOzoEUh7CIsfNm
v2olNUidigGVN1qKDBmUhyHr8JkbbE63t/H4Ol14u2Bl+QygRPFQM0QHnWdqxUmi
lQKxoWPzNsE9HZhiujqmihRjhvkTxwt2gE40qlaeZYRLMIASkoY/+CQUYbs5RdHH
+ri1CYrupLwufyfEkGDexNIHm2O1lpKOaNJsuEvTwECF2EfcTE8KQbtHHI2Kv1vD
iSs75fzMYZjE34kyD0k8DX8vJNmw/vThstP6AvrKWIxT/oRigzizJw6uINAC0k2Z
LfJWSvgd1A2TFS7363pumk52rtlOYpY6kXu9FY8Z+11Pfzi3wYiGtTiCGCXAM+74
P8yYanuVnucKKjmwUqc5YAK6ypyuDd6JME5iFcXadsurwaAiGncQiacJZBtGyAXB
4Qmnn5NGddi9DnoyvMGHs2JD0GoEYgNWmErJfU2zZ5n0f3hOcl2vLtMHFhcxPuGM
+pKylAm44aVoPxW0RtodYwIJclYzmv31Y7DSBg2TS85/6D1rzYcf0f8V8pFGjlkS
O8cenHq1L93aC6xoibHmQXS7NAKF/6zVD2u1T/hu2xyXh11/xEk=
=zyI0
-----END PGP SIGNATURE-----

--n8g4imXOkfNTN/H1--


