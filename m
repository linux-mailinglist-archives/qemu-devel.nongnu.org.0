Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBFD149999
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jan 2020 08:55:53 +0100 (CET)
Received: from localhost ([::1]:60188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ivcls-000478-B8
	for lists+qemu-devel@lfdr.de; Sun, 26 Jan 2020 02:55:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47887)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1ivcl7-0003iF-Gw
 for qemu-devel@nongnu.org; Sun, 26 Jan 2020 02:55:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1ivcl4-0007cX-B4
 for qemu-devel@nongnu.org; Sun, 26 Jan 2020 02:55:03 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:33761
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1ivcl3-0007b8-Vu
 for qemu-devel@nongnu.org; Sun, 26 Jan 2020 02:55:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580025301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=Jz+O8jVmN1HBYU4C8JFsdR+zD+ETvl3Jdzr+7/mOeac=;
 b=fviWSHekLhzMugPeFBDWjq74UZXeXZwJpUDOysx29NtHXbmJV/5Et2Y2cZheW6N70NbbLx
 40oZllvPyHWo7jo7jnW3kBIFlGgzsbSUfAJNvaxzLvPGQfxv18SgMHBuUfPDL6EZl9Bwv8
 c0SnMOqGePLv3B+hXHHRBj71tOXqjKQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-Q8y0YQioOE2P4HMIYhf6kw-1; Sun, 26 Jan 2020 02:54:59 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2E38800D41;
 Sun, 26 Jan 2020 07:54:57 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-22.ams2.redhat.com [10.36.116.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 78CE78DC20;
 Sun, 26 Jan 2020 07:54:53 +0000 (UTC)
Subject: Re: [PATCH] .travis.yml: Add description to each job
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200125183135.28317-1-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <79c2d168-498c-88eb-0857-4c3b195f7e32@redhat.com>
Date: Sun, 26 Jan 2020 08:54:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200125183135.28317-1-f4bug@amsat.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: Q8y0YQioOE2P4HMIYhf6kw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/01/2020 19.31, Philippe Mathieu-Daud=C3=A9 wrote:
> The NAME variable can be used to describe nicely a job (see [*]).
> As we currently have 32 jobs, use it. This helps for quickly
> finding a particular job.
>=20
>   before: https://travis-ci.org/qemu/qemu/builds/639887646
>   after: https://travis-ci.org/philmd/qemu/builds/641795043

Very good idea, correlating a job in the GUI to an entry in the yml file
was really a pain, so far.

> [*] https://docs.travis-ci.com/user/customizing-the-build/#naming-jobs-wi=
thin-matrices
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  .travis.yml | 101 ++++++++++++++++++++++++++++++++++------------------
>  1 file changed, 67 insertions(+), 34 deletions(-)
>=20
> diff --git a/.travis.yml b/.travis.yml
> index 6c1038a0f1..d68e35a2c5 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -94,24 +94,28 @@ after_script:
> =20
>  matrix:
>    include:
> -    - env:
> +    - name: "[x86] GCC static (user)"

Could you please drop the [x86] and other architectures from the names?
Travis already lists the build architecture in the job status page, so
this information is redundant.

[...]
>      # Alternate coroutines implementations are only really of interest t=
o KVM users
>      # However we can't test against KVM on Travis so we can only run uni=
t tests
> -    - env:
> +    - name: "[x86] check-unit coroutine=3Ducontext"
> +      env:
>          - CONFIG=3D"--with-coroutine=3Ducontext --disable-tcg"
>          - TEST_CMD=3D"make check-unit -j3 V=3D1"
> =20
> =20
> -    - env:
> +    - name: "[x86] check-unit coroutine=3Dsigaltstack"
> +      env:
>          - CONFIG=3D"--with-coroutine=3Dsigaltstack --disable-tcg"
>          - TEST_CMD=3D"make check-unit -j3 V=3D1"
>

Off-topic to your patch, but aren't coroutines something that is only
used in the softmmu targets? If so, we could add --disable-user to the
above two builds to speed things up a little bit.

> =20
>      # Check we can build docs and tools (out of tree)
> -    - env:
> +    - name: "[x86] tools and docs"
> +      env:
>          - BUILD_DIR=3D"out-of-tree/build/dir" SRC_DIR=3D"../../.."

Also off-topic, but I think we can now remove the above line and fix the
comment - since all builds are now out-of-tree anyway, see commit
bc4486fb233573e.


> @@ -250,7 +271,8 @@ matrix:
> =20
> =20
>      # Python builds
> -    - env:
> +    - name: "[x86] GCC Python 3.5 (x86_64-softmmu)"
> +      env:

Off-topic again:
Python 3.5 is the default on xenial, and since we stopped using Python
2.7, I think we could remove this job now.

We could add some jobs with Bionic + Python 3.7 and 3.8 instead.

>          - CONFIG=3D"--target-list=3Dx86_64-softmmu"
>          - CACHE_NAME=3D"${TRAVIS_BRANCH}-linux-gcc-default"
>        language: python
> @@ -258,7 +280,8 @@ matrix:
>          - "3.5"
> =20
> =20
> -    - env:
> +    - name: "[x86] GCC Python 3.6 (x86_64-softmmu)"
> +      env:
>          - CONFIG=3D"--target-list=3Dx86_64-softmmu"
>          - CACHE_NAME=3D"${TRAVIS_BRANCH}-linux-gcc-default"
>        language: python

 Thomas


