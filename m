Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8190C1503C9
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 11:02:39 +0100 (CET)
Received: from localhost ([::1]:37368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyYYw-0005EJ-Jn
	for lists+qemu-devel@lfdr.de; Mon, 03 Feb 2020 05:02:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34713)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iyYXl-0004YL-CG
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 05:01:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iyYXk-0006gI-59
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 05:01:25 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:43393
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iyYXk-0006fm-0X
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 05:01:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580724083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=WbkSeQ7dIG80xlHLDtt2syhRQw3GfD/1ps6gcsUGOac=;
 b=glY3SHChf2CxDNK5pSoMqD0TXg9kCeoSw2Y8ot/DFfy+J8EcQ9rBgamWbZzmRxZc+H3TRr
 /9GSbC+VeLmFsZy0nM4kBoHBFhI9JbYuMyACotuyyRZ2KPc3myFIa6oghp5a0DnzU9Szwt
 EvEsuyDnMVo3cTeiOr3BB2/XKXs1paQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-vVRLvXZAM-u7eJANZHW1qw-1; Mon, 03 Feb 2020 05:01:21 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E476A800D53;
 Mon,  3 Feb 2020 10:01:19 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-129.ams2.redhat.com [10.36.116.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BCE7A8E610;
 Mon,  3 Feb 2020 10:01:07 +0000 (UTC)
Subject: Re: [PATCH v3 17/17] .travis.yml: single thread build-tcg
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20200203090932.19147-1-alex.bennee@linaro.org>
 <20200203090932.19147-18-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <e1f501e7-b3c4-5d88-3f10-cd2c1c7a1cd6@redhat.com>
Date: Mon, 3 Feb 2020 11:01:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200203090932.19147-18-alex.bennee@linaro.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: vVRLvXZAM-u7eJANZHW1qw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: fam@euphon.net, berrange@redhat.com, stefanb@linux.vnet.ibm.com,
 richard.henderson@linaro.org, f4bug@amsat.org, cota@braap.org,
 stefanha@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/02/2020 10.09, Alex Benn=C3=A9e wrote:
> I've theorised that a parallel build-tcg is somehow getting confused
> when two fedora-30 based cross compilers attempt to build at the same
> time. From one data-point so far this may fix the problem although the
> plugins job runs quite close to timeout.
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  .travis.yml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/.travis.yml b/.travis.yml
> index c1c6df475a8..3b35b7cf04d 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -380,7 +380,7 @@ matrix:
>      - name: "GCC check-tcg (user)"
>        env:
>          - CONFIG=3D"--disable-system --enable-debug-tcg"
> -        - TEST_BUILD_CMD=3D"make -j${JOBS} build-tcg"
> +        - TEST_BUILD_CMD=3D"make build-tcg"
>          - TEST_CMD=3D"make check-tcg"
>          - CACHE_NAME=3D"${TRAVIS_BRANCH}-linux-gcc-debug-tcg"
> =20
> @@ -391,7 +391,7 @@ matrix:
>      - name: "GCC plugins check-tcg (user)"
>        env:
>          - CONFIG=3D"--disable-system --enable-plugins --enable-debug-tcg=
 --target-list-exclude=3Dsparc64-linux-user,cris-linux-user"
> -        - TEST_BUILD_CMD=3D"make -j${JOBS} build-tcg"
> +        - TEST_BUILD_CMD=3D"make build-tcg"
>          - TEST_CMD=3D"make check-tcg"
>          - CACHE_NAME=3D"${TRAVIS_BRANCH}-linux-gcc-debug-tcg"

Squash it into patch 14/17 ?

 Thomas


