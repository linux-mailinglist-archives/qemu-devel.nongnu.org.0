Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 084EF4B3553
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 14:39:35 +0100 (CET)
Received: from localhost ([::1]:45148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIscf-0004jq-EL
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 08:39:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nIsZ5-0002W1-Eo
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 08:35:52 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:60779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nIsZ3-00071C-F4
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 08:35:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=t3QIX/mumTX9q8aDJxkp/skgej557vSeUeOhar2nJGw=; b=OLEo2poX/+eamfM9k2pqk0AyjP
 BKLW5XopthKWA3h0W6687E8+RWEbohIzhaK7xPwzRi+I2q4SQ1BPwzfelZogzSt8m72jbG+rQxpEJ
 td2rj48MM6Kwk0jDig9CEuD2yGX2UHfeUcIEfHuFlIDfPtxNBjQPt7HnRrW9p4dKtJ0VMbBvAdSuS
 0kaJNf4dI+Z3ymwf9KIE+l3vRIgLxYblP0pRBriHGMRI0rwQJLltG6PPD9WNOhGofThLraUI8QC0p
 iEdERZd5XMp97VCUm+spcKamhvjg14JdbjSqiqokdXGfa9OJth5Zt9H8V/Oql62mLVaelsi+oQu88
 7JmJZ1jHyGukjv19J+e1VKBIBnBTLZM8zu4N6l/zuyinnXBuDtzdVguIQfJG9R6gqJ3YoabxfIY0w
 zBo8C7ncHkqlXi59pIgFpy2Z8iAmyz3JzGF0aDwLECItnPUNyFXb5vAlbj6SQFhz7Mn/NlJAG/7gB
 fp/n8QxPQoXdc/LrkaiOIFOSy0d5W4kl13+0x7fBzr1OktvmNjd1QITGGqfbRRx1q3hcrm7Mza6gO
 m/2zMSkhLJrhW2h9F6Aq9Mx77qQX1tF3vUjWztiDl8bqRg+NKyttSX+ni12xk9ZWIATB7QPq727E0
 kpImrUwJ0nZRdX/mJU168ZSCaM7zk1YUnVRQZtB3o=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>
Cc: Cameron Esfahani <dirty@apple.com>,
 Peter Maydell <peter.maydell@linaro.org>, Will Cohen <wwcohen@gmail.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Li Zhang <lizhang@suse.de>
Subject: Re: [PATCH v4 09/13] block/file-posix: Remove a deprecation warning
 on macOS 12
Date: Sat, 12 Feb 2022 14:35:43 +0100
Message-ID: <37380262.lnchNC68Or@silver>
In-Reply-To: <20220211163434.58423-10-f4bug@amsat.org>
References: <20220211163434.58423-1-f4bug@amsat.org>
 <20220211163434.58423-10-f4bug@amsat.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Freitag, 11. Februar 2022 17:34:30 CET Philippe Mathieu-Daud=E9 via wrot=
e:
> When building on macOS 12 we get:
>=20
>   block/file-posix.c:3335:18: warning: 'IOMasterPort' is deprecated: first
> deprecated in macOS 12.0 [-Wdeprecated-declarations] kernResult =3D
> IOMasterPort( MACH_PORT_NULL, &masterPort );
>                    ^~~~~~~~~~~~
>                    IOMainPort
>=20
> Replace by IOMainPort, redefining it to IOMasterPort if not available.
>=20
> Suggested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

>  block/file-posix.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>=20
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 1f1756e192..13393ad296 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -3319,17 +3319,23 @@ BlockDriver bdrv_file =3D {
>  #if defined(__APPLE__) && defined(__MACH__)
>  static kern_return_t GetBSDPath(io_iterator_t mediaIterator, char *bsdPa=
th,
> CFIndex maxPathSize, int flags);
> +
> +#if !defined(MAC_OS_VERSION_12_0) \
> +    || (MAC_OS_X_VERSION_MIN_REQUIRED < MAC_OS_VERSION_12_0)
> +#define IOMainPort IOMasterPort
> +#endif
> +
>  static char *FindEjectableOpticalMedia(io_iterator_t *mediaIterator)
>  {
>      kern_return_t kernResult =3D KERN_FAILURE;
> -    mach_port_t     masterPort;
> +    mach_port_t mainPort;
>      CFMutableDictionaryRef  classesToMatch;
>      const char *matching_array[] =3D {kIODVDMediaClass, kIOCDMediaClass};
>      char *mediaType =3D NULL;
>=20
> -    kernResult =3D IOMasterPort( MACH_PORT_NULL, &masterPort );
> +    kernResult =3D IOMainPort(MACH_PORT_NULL, &mainPort);
>      if ( KERN_SUCCESS !=3D kernResult ) {
> -        printf( "IOMasterPort returned %d\n", kernResult );
> +        printf("IOMainPort returned %d\n", kernResult);
>      }
>=20
>      int index;
> @@ -3342,7 +3348,7 @@ static char *FindEjectableOpticalMedia(io_iterator_t
> *mediaIterator) }
>          CFDictionarySetValue(classesToMatch, CFSTR(kIOMediaEjectableKey),
>                               kCFBooleanTrue);
> -        kernResult =3D IOServiceGetMatchingServices(masterPort,
> classesToMatch, +        kernResult =3D
> IOServiceGetMatchingServices(mainPort, classesToMatch, mediaIterator); if
> (kernResult !=3D KERN_SUCCESS) {
>              error_report("Note: IOServiceGetMatchingServices returned %d=
",



