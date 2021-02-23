Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 272D5323054
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 19:13:07 +0100 (CET)
Received: from localhost ([::1]:33078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEcBG-0000lC-7N
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 13:13:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lEc8j-0007t8-Ov
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:10:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lEc8e-0000m3-0J
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:10:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614103822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v6G1rgHe9thhfsbkAmS6zjeB9s9cZiM/nHYHZZzIOTk=;
 b=HSEcg9Ovgje3tyrNTi0rsl9vCt3wtWV5SY0iPkCZQ40m9dp+kyax2PKxScib6c5cTN2B6j
 jpYxINRUJc2Ky2+KFPe6M7UMKoSKq915VoDCjEkxHiyAYZm3n5tbVeJRogR4QPaXNEG8Tu
 eESUwEoBnsvkVB5BKAFrOGcwI+pRyAg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-8hpOtvx1MjqVqtDBWbMfiw-1; Tue, 23 Feb 2021 13:10:19 -0500
X-MC-Unique: 8hpOtvx1MjqVqtDBWbMfiw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E780A100961D;
 Tue, 23 Feb 2021 18:10:17 +0000 (UTC)
Received: from localhost (ovpn-114-28.rdu2.redhat.com [10.10.114.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2EC35D6A1;
 Tue, 23 Feb 2021 18:10:14 +0000 (UTC)
Date: Tue, 23 Feb 2021 13:09:32 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v5 1/4] Jobs based on custom runners: documentation and
 configuration placeholder
Message-ID: <20210223180932.GF987581@amachine.somewhere>
References: <20210219215838.752547-1-crosa@redhat.com>
 <20210219215838.752547-2-crosa@redhat.com>
 <3f0a3854-425d-27e7-d466-f6f4db4dd9aa@redhat.com>
 <e884e35a-cb4c-059b-7b67-1c69f7869347@redhat.com>
 <20210223164718.GA987581@amachine.somewhere>
 <8de62a35-7e66-b182-a182-4d021b713b5a@redhat.com>
 <bf8a9dd0-c20f-7bef-ae65-2c3c1e10da68@redhat.com>
MIME-Version: 1.0
In-Reply-To: <bf8a9dd0-c20f-7bef-ae65-2c3c1e10da68@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bGR76rFJjkSxVeRa"
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--bGR76rFJjkSxVeRa
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2021 at 06:34:07PM +0100, Philippe Mathieu-Daud=E9 wrote:
> On 2/23/21 6:24 PM, Philippe Mathieu-Daud=E9 wrote:
> > On 2/23/21 5:47 PM, Cleber Rosa wrote:
> >> On Tue, Feb 23, 2021 at 05:37:04PM +0100, Philippe Mathieu-Daud=E9 wro=
te:
> >>> On 2/23/21 12:25 PM, Thomas Huth wrote:
> >>>> On 19/02/2021 22.58, Cleber Rosa wrote:
> >>>>> As described in the included documentation, the "custom runner" job=
s
> >>>>> extend the GitLab CI jobs already in place.=A0 One of their primary
> >>>>> goals of catching and preventing regressions on a wider number of h=
ost
> >>>>> systems than the ones provided by GitLab's shared runners.
> >>>>>
> >>>>> This sets the stage in which other community members can add their =
own
> >>>>> machine configuration documentation/scripts, and accompanying job
> >>>>> definitions.=A0 As a general rule, those newly added contributed jo=
bs
> >>>>> should run as "non-gating", until their reliability is verified (AK=
A
> >>>>> "allow_failure: true").
> >>>>>
> >>>>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> >>>>> ---
> >>>>> =A0 .gitlab-ci.d/custom-runners.yml | 14 ++++++++++++++
> >>>>> =A0 .gitlab-ci.yml=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0 1 +
> >>>>> =A0 docs/devel/ci.rst=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 2=
8 ++++++++++++++++++++++++++++
> >>>>> =A0 docs/devel/index.rst=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 1 +
> >>>>> =A0 4 files changed, 44 insertions(+)
> >>>>> =A0 create mode 100644 .gitlab-ci.d/custom-runners.yml
> >>>>> =A0 create mode 100644 docs/devel/ci.rst
> >>>>>
> >>>>> diff --git a/.gitlab-ci.d/custom-runners.yml
> >>>>> b/.gitlab-ci.d/custom-runners.yml
> >>>>> new file mode 100644
> >>>>> index 0000000000..3004da2bda
> >>>>> --- /dev/null
> >>>>> +++ b/.gitlab-ci.d/custom-runners.yml
> >>>>> @@ -0,0 +1,14 @@
> >>>>> +# The CI jobs defined here require GitLab runners installed and
> >>>>> +# registered on machines that match their operating system names,
> >>>>> +# versions and architectures.=A0 This is in contrast to the other =
CI
> >>>>> +# jobs that are intended to run on GitLab's "shared" runners.
> >>>>> +
> >>>>> +# Different than the default approach on "shared" runners, based o=
n
> >>>>> +# containers, the custom runners have no such *requirement*, as th=
ose
> >>>>> +# jobs should be capable of running on operating systems with no
> >>>>> +# compatible container implementation, or no support from
> >>>>> +# gitlab-runner.=A0 To avoid problems that gitlab-runner can cause=
 while
> >>>>> +# reusing the GIT repository, let's enable the recursive submodule
> >>>>> +# strategy.
> >>>>> +variables:
> >>>>> +=A0 GIT_SUBMODULE_STRATEGY: recursive
> >>>>
> >>>> Is it really necessary? I thought our configure script would take ca=
re
> >>>> of the submodules?
> >>>
> >>
> >> I've done a lot of testing on bare metal systems, and the problems
> >> that come from reusing the same system and failed cleanups can be very
> >> frustrating.  It's unfortunate that we need this, but it was the
> >> simplest and most reliable solution I found.  :/
> >>
> >> Having said that, I noticed after I posted this series that this is
> >> affecting all other jobs.  We don't need it that in the jobs based
> >> on containers (for obvious reasons), so I see two options:
> >>
> >> 1) have it enabled on all jobs for consistency
> >>
> >> 2) have it enabled only on jobs that will reuse the repo
> >>
> >>> Well, if there is a failure during the first clone (I got one network
> >>> timeout in the middle)=20
> >=20
> > [This network failure is pasted at the end]
> >=20
> >>> then next time it doesn't work:
> >>>
> >>> Updating/initializing submodules recursively...
> >>> Synchronizing submodule url for 'capstone'
> >>> Synchronizing submodule url for 'dtc'
> >>> Synchronizing submodule url for 'meson'
> >>> Synchronizing submodule url for 'roms/QemuMacDrivers'
> >>> Synchronizing submodule url for 'roms/SLOF'
> >>> Synchronizing submodule url for 'roms/edk2'
> >>> Synchronizing submodule url for
> >>> 'roms/edk2/ArmPkg/Library/ArmSoftFloatLib/berkeley-softfloat-3'
> >>> Synchronizing submodule url for
> >>> 'roms/edk2/BaseTools/Source/C/BrotliCompress/brotli'
> >>> Synchronizing submodule url for
> >>> 'roms/edk2/BaseTools/Source/C/BrotliCompress/brotli/research/esaxx'
> >>> Synchronizing submodule url for
> >>> 'roms/edk2/BaseTools/Source/C/BrotliCompress/brotli/research/libdivsu=
fsort'
> >>> Synchronizing submodule url for
> >>> 'roms/edk2/CryptoPkg/Library/OpensslLib/openssl'
> >>> Synchronizing submodule url for
> >>> 'roms/edk2/MdeModulePkg/Library/BrotliCustomDecompressLib/brotli'
> >>> Synchronizing submodule url for
> >>> 'roms/edk2/MdeModulePkg/Universal/RegularExpressionDxe/oniguruma'
> >>> Synchronizing submodule url for
> >>> 'roms/edk2/UnitTestFrameworkPkg/Library/CmockaLib/cmocka'
>=20
> So far, beside the repository useful for QEMU, I cloned:
>=20
> - boringssl
> - krb5
> - pyca-cryptography
> - esaxx
> - libdivsufsort
> - oniguruma
> - openssl
> - brotli
> - cmocka
>

Hi Phil,

I'm not following what you meant by "I cloned"... Are you experimenting
with this on a machine of your own and manually cloning the submodules?

> But reach the runner time limit of 2h.
>
> The directory reports 3GB of source code.
>=20
> I don't think the series has been tested enough before posting,

Please take into consideration that this series, although simple in
content, touches and interacts with a lot of moving pieces, and
possibly with personal systems that I did not have, or will have,
access to.  As far as public testing proof goes, you can see a
pipeline here with this version of this series here:

   https://gitlab.com/cleber.gnu/qemu/-/pipelines/258982039/builds

As I said elsewhere, I only noticed the recursive submodule being
applied to the existing jobs after I submitted the series.  Mea culpa.
But:

 * none of the jobs took noticeably longer than the previous baseline
 * there was one *container build failure* (safe to say it's not
   related)
 * all other jobs passed successfully

And, along with the previous versions, this series were tested on all
the previously included architectures and operating systems.  It's
unfortunate that because of your experience at this time (my
apologies), you don't realize the amount of testing done so far.

> I'm stopping here my experiments.
>
> Regards,
>=20
> Phil.
>=20

I honestly appreciate your help here up to this point.

Regards,
- Cleber.

--bGR76rFJjkSxVeRa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmA1RNkACgkQZX6NM6Xy
CfPv/RAAk6kjr3kc6QHV59btK7LzuiOVEbYd1VsXrCTTESbAR100h/3XNIy4Xe6T
IScLU/NfiC376VAFHrkQbqukaXh8Di3G5vG2gRcC10EI4rGWZkX5uz72ajkF+Qz0
w2BSlp7caclmJpsTVjfodY+OQxlR7c92Gvl3HGA+MOsmvOFPYwzSGzO0aRukBTdL
8WlHPcIhCKax6gY5aXqsvahD1HKXopfyaOUQK+YdLo7mCzbf3g+hIHtzWh32+ZUC
/0XUIbmNaQwYF2PUdFeWqL5tJKLvLUoJC9iltzJWZ3bpQ0CBtHYYnDaL19JD71fF
VdGGX6cTg7razqi6IQ9uaxRnWpOVYvBefgHqzj4Zg9ns15vzyeIYaS91zNwaIthe
solt0mhnWUZU7T+pGTTAiYVj2IKpUqh0spy0DLSpJ23XooBo9p4M3f11pUAbAxuc
juzUguwUZpNENzQDQk69dTchYjOdgsBuJUs74e2O3T8qlEbrJC3ycJAgc9DDinuV
Hyp6YReYvOxxTiAMk54MgTGiwJCueRRUxI0cxeTpnmQ3Ql95Wdeud/r2hK+PNBGJ
RlVrBJk/Qjzpd2RTn0KWcEXpwqjCf0TJqRrjgRUV5FRp5PtRiUaCN/m5vbIEAsNv
OHZ+kV4aDrtMUPZ4h3c/vgq9/5gi8Pz2yQpgA/rPdK1sbkL5NBQ=
=+El/
-----END PGP SIGNATURE-----

--bGR76rFJjkSxVeRa--


