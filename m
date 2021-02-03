Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4F630E4A5
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 22:07:46 +0100 (CET)
Received: from localhost ([::1]:47720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7PNI-00005S-SU
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 16:07:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1l7PLv-00083U-4i
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 16:06:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1l7PLs-00048P-MF
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 16:06:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612386374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4fngXSnF8DS9h8yI2kqsaj7pdbR36X5eEzvzGXuRklE=;
 b=WuOKJnKmPq6xHvQEflD1H7BPoMCtbwVXWYXR8pf/UVz44gtPahDZBII5WVDM98pTsr6fFo
 LyvYUsd2j9vsb/L12Y2Fv/KtGjn8fJU8kGhSlqbUBKVbqA7HJbAfXc2+5OqygQcmecXRKa
 9iVQhNd6IentAg6FmIqwy2MmfNYb6rA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-GGpHCnr1MjORKd_0ID4ZQg-1; Wed, 03 Feb 2021 16:06:10 -0500
X-MC-Unique: GGpHCnr1MjORKd_0ID4ZQg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93A3E106BC6A;
 Wed,  3 Feb 2021 21:06:09 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-89.rdu2.redhat.com
 [10.10.116.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 091EF5C233;
 Wed,  3 Feb 2021 21:06:04 +0000 (UTC)
Date: Wed, 3 Feb 2021 16:06:03 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v4 0/4] GitLab Custom Runners and Jobs (was: QEMU Gating
 CI)
Message-ID: <20210203210603.GB1432466@localhost.localdomain>
References: <20201019015003.1527746-1-crosa@redhat.com>
 <e253800c-815c-d561-1fd7-ac9b581c5b2b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e253800c-815c-d561-1fd7-ac9b581c5b2b@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DKU6Jbt7q3WqK7+M"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--DKU6Jbt7q3WqK7+M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 28, 2021 at 12:51:20PM +0100, Thomas Huth wrote:
> On 19/10/2020 03.49, Cleber Rosa wrote:
> > TL;DR: this should allow the QEMU maintainer to push to the staging
> > branch, and have custom jobs running on the project's aarch64 and
> > s390x machines.  Simple usage looks like:
> >=20
> >     git push remote staging
> >     ./scripts/ci/gitlab-pipeline-status --verbose --wait
>=20
>  Hi Cleber,
>=20
> since the QEMU project is now using the gitlab repo as main repository, i=
t
> should now be possible to finally enable these custom runners, too, I thi=
nk.
>

I couldn't agree more!

> Could you elaborate on what's left to do to get the s390x and aarch64
> runners enabled, and rebase your patches if necessary?
>

Basically what's needed is to enable the jobs, meaning committing the
relevant snippets to the "gitlab-ci.{yml,d/*}" files.

Both ansible playbooks have been run on both machines, so the gitlab-runner
and tooling to build QEMU are in place.  The gitlab-runners have also
been registered on the "qemu-project/qemu" GitLab repo.

I'll send a rebased/updated version of the playbooks, gitlab-ci.yml
configurations, etc.  In it, I'll propose that we enable the jobs, but
ignore errors for now (allow_failure: true), because it'll ease the
review.  Once the jobs prove mature, waiving of failures can be
removed.

How does that sound?

Thanks,
- Cleber.

>  Thanks,
>   Thomas

--DKU6Jbt7q3WqK7+M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmAbEDgACgkQZX6NM6Xy
CfOYQBAApc9YCxQcd3TdpziDjI8klqdvWMBPXuGWChYXy85Co8dnJpRxLPT7wL1q
MmeYkqzckgTh52BcBzW89ShZ95ktE16qSCKOTHCkzoJTpttU76vNAfjDL8wb+nvy
poBuaiuqLHlHts0+XFcwdtWVyRCMBBUs+XcKc+oK4a9z5FTXgilfQY0UR7iAuIg8
3box9i5JO9t9SKsSDNkr9HGmagag8AFxjgGj11YKpxG4iok//nPDi/dFHcOazeTk
iSZeff3HeCtqmIf2TtU3L1wP4qMLqxCpQDr7nI+1Vz9gaAkumltHywfpNQ48U7HH
MYGITreCxKiRD7xeMmKkw9dmaqxqmCvXco84TWp3pxm/vGM3hcPEXaU8PhgKuAtv
ThhreehDXlc2ROZFeF8M/UpIhFGmopJEotk1VasqXn/gdEdFGXq1R355lxQTRqfw
2dqqeR3O63B9qZTC6hDWPHS3TJGbSk8AekmmPxDv1vpL//OewdLXO1MzF4YpDBFI
ncK3ssKXdRVrfrNNpLMg17T7JjTpajag55Anw5iXpIA3KeVHD4hQOMcHAW4yHSQM
wmPpwSY8LIrGchQS9OGtThtHRGK/xq1DhXghOcQfZbpyzXIz3CPmF8H73CaIICB2
WxFLz7oifPoBOWyhEuFWQKeHBVwwPZAsE1LmIh99VKMMEjExGc0=
=37ZL
-----END PGP SIGNATURE-----

--DKU6Jbt7q3WqK7+M--


