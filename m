Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D56119C05
	for <lists+qemu-devel@lfdr.de>; Fri, 10 May 2019 12:56:10 +0200 (CEST)
Received: from localhost ([127.0.0.1]:41043 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hP3CD-0006mY-5b
	for lists+qemu-devel@lfdr.de; Fri, 10 May 2019 06:56:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60282)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hP354-0001Lq-0V
	for qemu-devel@nongnu.org; Fri, 10 May 2019 06:48:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hP352-0005Kp-Ts
	for qemu-devel@nongnu.org; Fri, 10 May 2019 06:48:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58164)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hP34z-0005H2-Jj; Fri, 10 May 2019 06:48:41 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D41FE3082208;
	Fri, 10 May 2019 10:48:39 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-72.ams2.redhat.com [10.36.116.72])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7E139648A9;
	Fri, 10 May 2019 10:48:34 +0000 (UTC)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org
References: <20190510102918.2705-1-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; keydata=
	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
Organization: Red Hat
Message-ID: <55dd9cf4-cb06-48b1-0cec-ff03113c7c17@redhat.com>
Date: Fri, 10 May 2019 12:48:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190510102918.2705-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Fri, 10 May 2019 10:48:39 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3] tests/qemu-iotests: re-format output to
 for make check-block
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/05/2019 12.29, Alex Benn=C3=A9e wrote:
> This attempts to clean-up the output to better match the output of the
> rest of the QEMU check system when called with -pretty. This includes:
>=20
>   - formatting as "  TEST    iotest: nnn"
>   - calculating time diff at the end
>   - only dumping config on failure (when -pretty enabled)
>=20
> The existing output is mostly preserved although the dumping of the
> old time at the start "Ns ..." was removed to keep the logic simple.
> The timestamp mode can still be used to see which tests are "hanging".
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20190503143904.31211-1-alex.bennee@linaro.org>
>=20
> ---
> v3
>   - revert echo to printf
>   - add _report_test_start
> ---
>  tests/qemu-iotests/check | 101 ++++++++++++++++++++++++++-------------
>  1 file changed, 68 insertions(+), 33 deletions(-)
>=20
> diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
> index 922c5d1d3d3..ac481f905bf 100755
> --- a/tests/qemu-iotests/check
> +++ b/tests/qemu-iotests/check
> @@ -27,6 +27,7 @@ bad=3D""
>  notrun=3D""
>  casenotrun=3D""
>  interrupt=3Dtrue
> +pretty=3Dfalse
> =20
>  # by default don't output timestamps
>  timestamp=3D${TIMESTAMP:=3Dfalse}
> @@ -88,6 +89,22 @@ _full_platform_details()
>      echo "$os/$platform $host $kernel"
>  }
> =20
> +_full_env_details()
> +{
> +    cat <<EOF
> +QEMU          -- "$QEMU_PROG" $QEMU_OPTIONS
> +QEMU_IMG      -- "$QEMU_IMG_PROG" $QEMU_IMG_OPTIONS
> +QEMU_IO       -- "$QEMU_IO_PROG" $QEMU_IO_OPTIONS
> +QEMU_NBD      -- "$QEMU_NBD_PROG" $QEMU_NBD_OPTIONS
> +IMGFMT        -- $FULL_IMGFMT_DETAILS
> +IMGPROTO      -- $IMGPROTO
> +PLATFORM      -- $FULL_HOST_DETAILS
> +TEST_DIR      -- $TEST_DIR
> +SOCKET_SCM_HELPER -- $SOCKET_SCM_HELPER
> +
> +EOF
> +}
> +
>  # $1 =3D prog to look for
>  set_prog_path()
>  {
> @@ -256,6 +273,7 @@ other options
>      -o options          -o options to pass to qemu-img create/convert
>      -T                  output timestamps
>      -c mode             cache mode
> +    -pretty             pretty print output for make check

"pretty" is likely just a matter of taste ... so maybe this should be
named differently instead? "--makecheck" ? Or "--one-shot" ?

>  testlist options
>      -g group[,group...]        include tests from these groups
> @@ -403,7 +421,10 @@ testlist options
>                  command -v xxdiff >/dev/null 2>&1 && diff=3Dxxdiff
>              fi
>              ;;
> -
> +        -pretty)   # pretty print output
> +            pretty=3Dtrue
> +            xpand=3Dfalse
> +            ;;
>          -n)        # show me, don't do it
>              showme=3Dtrue
>              xpand=3Dfalse
> @@ -704,23 +725,30 @@ END        { if (NR > 0) {
> =20
>  trap "_wrapup; exit \$status" 0 1 2 3 15
> =20
> +# Report the test start and results, optionally pretty printing for ma=
ke
> +# args: $seq
> +_report_test_start()
> +{
> +    if $pretty; then
> +        printf "  TEST    iotest: %s" "$1"

Could you maybe change the "iotest:" into "iotest-$IMGFMT:" ? ... so
that when you run "make check SPEED=3Dslow" you also see which kind of
format is currently under test?

And this currently also does not play very nicely when running "make -j8
check" in parallel:

  [...]
  TEST    iotest: 001  TEST    check-qtest-alpha: tests/qmp-test
  TEST    check-qtest-alpha: tests/qmp-cmd-test
  TEST    check-qtest-aarch64: tests/boot-serial-test
  TEST    check-qtest-aarch64: tests/migration-test
  TEST    check-qtest-arm: tests/tmp105-test
  TEST    check-unit: tests/check-qnum
  TEST    check-unit: tests/check-qstring
  TEST    check-unit: tests/check-qlist
  TEST    check-unit: tests/check-qnull
 2s (last 2s)
  TEST    iotest: 002  TEST    check-qtest-arm: tests/pca9552-test
  TEST    check-unit: tests/check-qobject
  TEST    check-qtest-cris: tests/qmp-test
  [...]

I think the "make check" mode should only print out one time for each
test, preferable at the end, like the other tests (like qtests) are
doing it...?

 Thomas

