Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 124EF1000CD
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Nov 2019 09:54:42 +0100 (CET)
Received: from localhost ([::1]:59493 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iWcnx-0003IV-0K
	for lists+qemu-devel@lfdr.de; Mon, 18 Nov 2019 03:54:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53614)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iWcmH-0002k1-9M
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 03:52:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iWcmF-0005ak-EG
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 03:52:56 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:49333
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iWcmF-0005aR-B6
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 03:52:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574067174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uj//TRfL6/3wwgnBTxP9o2XPXQ/0l5M4gq/5/A9dFw8=;
 b=irVtFRgYFevU53+PLc49QNcUivj7a+e7JMq5j3EFN2RuZYRkpNnhEchX4DQIid209ugO2E
 e175S0PcxURdgm3fHqss3oWsHSNZjQ4AirW6fVTaJ1rwrcJvFZHTJ2P03FFY3B7L5RpR0U
 t1KT28G63VsvFgxVy7U48YJRgpTMkn4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-Pcsma_RuOJ2Mmz3u4vfcAQ-1; Mon, 18 Nov 2019 03:52:52 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E099395B25;
 Mon, 18 Nov 2019 08:52:50 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-200.ams2.redhat.com
 [10.36.116.200])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EFC5561073;
 Mon, 18 Nov 2019 08:52:49 +0000 (UTC)
Subject: Re: [PATCH] Modify tests to work with clang
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1574032465-12186-1-git-send-email-tsimpson@quicinc.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <bbad38fa-d2fa-2acd-7f01-eabae34fbc18@redhat.com>
Date: Mon, 18 Nov 2019 09:52:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <1574032465-12186-1-git-send-email-tsimpson@quicinc.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: Pcsma_RuOJ2Mmz3u4vfcAQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/11/2019 00.14, Taylor Simpson wrote:
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>  tests/tcg/multiarch/float_helpers.c | 2 --
>  tests/tcg/multiarch/linux-test.c    | 6 +++++-
>  2 files changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/tcg/multiarch/float_helpers.c b/tests/tcg/multiarch/fl=
oat_helpers.c
> index 8ee7903..bc530e5 100644
> --- a/tests/tcg/multiarch/float_helpers.c
> +++ b/tests/tcg/multiarch/float_helpers.c
> @@ -79,11 +79,9 @@ char *fmt_16(uint16_t num)
> =20
>  #ifndef SNANF
>  /* Signaling NaN macros, if supported.  */
> -# if __GNUC_PREREQ(3, 3)
>  #  define SNANF (__builtin_nansf (""))
>  #  define SNAN (__builtin_nans (""))
>  #  define SNANL (__builtin_nansl (""))
> -# endif
>  #endif
> =20
>  static float f32_numbers[] =3D {
> diff --git a/tests/tcg/multiarch/linux-test.c b/tests/tcg/multiarch/linux=
-test.c
> index 673d7c8..8a7c15c 100644
> --- a/tests/tcg/multiarch/linux-test.c
> +++ b/tests/tcg/multiarch/linux-test.c
> @@ -485,7 +485,11 @@ static void test_signal(void)
>      act.sa_flags =3D SA_SIGINFO;
>      chk_error(sigaction(SIGSEGV, &act, NULL));
>      if (setjmp(jmp_env) =3D=3D 0) {
> -        *(uint8_t *)0 =3D 0;
> +        /*
> +         * clang requires volatile or it will turn this into a
> +         * call to abort() instead of forcing a SIGSEGV.
> +         */
> +        *(volatile uint8_t *)0 =3D 0;
>      }
> =20
>      act.sa_handler =3D SIG_DFL;
>=20

Reviewed-by: Thomas Huth <thuth@redhat.com>


