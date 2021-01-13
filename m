Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 937612F4CC5
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 15:11:12 +0100 (CET)
Received: from localhost ([::1]:42504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzgrf-0005bP-K9
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 09:11:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave.anglin@bell.net>)
 id 1kzgjg-0001IJ-2M
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:02:59 -0500
Received: from belmont80srvr.owm.bell.net ([184.150.200.80]:54812
 helo=mtlfep01.bell.net)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dave.anglin@bell.net>)
 id 1kzgjX-00027g-H7
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:02:55 -0500
Received: from bell.net mtlfep01 184.150.200.30 by mtlfep01.bell.net with ESMTP
 id <20210113140244.NPAN120733.mtlfep01.bell.net@mtlspm02.bell.net>
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 09:02:44 -0500
Received: from [192.168.2.49] (really [70.50.109.22]) by mtlspm02.bell.net
 with ESMTP
 id <20210113140244.LMMY3672.mtlspm02.bell.net@[192.168.2.49]>;
 Wed, 13 Jan 2021 09:02:44 -0500
To: Helge Deller <deller@gmx.de>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Stefan Weil <sw@weilnetz.de>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 debian-hppa@lists.debian.org, debian-superh@lists.debian.org
References: <20210107140039.467969-1-pbonzini@redhat.com>
 <20210107140039.467969-2-pbonzini@redhat.com>
 <CAFEAcA9yyUUmd+hj6kgAV8KWtCC41Q55JRfE0q1zTaDaOofgOQ@mail.gmail.com>
 <a5cd4c43-2f12-2dbf-8db7-21acc7abc73d@redhat.com>
 <20210107160653.GD1029501@redhat.com>
 <d1b5a493-0658-3bba-b1b4-0116f337031d@amsat.org>
 <46e79fb0-2ce1-35a8-3ce8-44699508a1d1@gmx.de>
From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH 1/8] build-system: clean up TCG/TCI configury
Message-ID: <c9a0b098-2b37-a91f-091c-eead03a5b0c5@bell.net>
Date: Wed, 13 Jan 2021 09:02:43 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <46e79fb0-2ce1-35a8-3ce8-44699508a1d1@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-CM-Analysis: v=2.4 cv=cZIXElPM c=1 sm=1 tr=0 ts=5ffefd84
 a=S6gQgrXzeH76ECG4GouVuA==:117 a=S6gQgrXzeH76ECG4GouVuA==:17
 a=IkcTkHD0fZMA:10 a=EmqxpYm9HcoA:10 a=xNf9USuDAAAA:8 a=FBHGMhGWAAAA:8
 a=MRVTRUKAWiJvNyYUdQIA:9 a=QEXdDO2ut3YA:10 a=2NN82kjv6m0A:10
 a=SEwjQc04WA-l_NiBhQ7s:22 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4xfGUzVVb3Ry0kriVSiCcGFsHDzoA0fcAAoToze0BKDqbAN0jHUv4FtTrtSwZwpaS20Up1zkdNcdkrPcupzpr2uT1qyX2l2FQ40PPunhEj318I6e/2DwKG
 PrZLNoccC6iwJAnEDSyIZC4T2cy4OISSjOMKRUCnJ8rdccEd3zmCBJdiXpVlpEMIvcT9pm9z+hiJbw==
Received-SPF: pass client-ip=184.150.200.80; envelope-from=dave.anglin@bell.net;
 helo=mtlfep01.bell.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021-01-13 8:42 a.m., Helge Deller wrote:
>>> ia64 is a dead host architecture and doesn't exist in any OS distro t=
hat
>>> we target anymore, so I don't think we need to consider it.
> I have no opinion about ia64.
>
>>> Likewise parisc/hppa doesn't seem exist in Debian since Squeeze, so I=

>>> think we can rule that out too.
> Can we please keep parisc/hppa.
> It's not an official platform any longer, but quite active in the
> "unstable" debian-ports repository:
> https://buildd.debian.org/status/architecture.php?a=3Dhppa&suite=3Dsid
>
>>> Only sh4 still seems to be supported in Debian. I expect the primary
>>> need there is for sh4 guest support rather than sh4 host support.
> Same as for hppa/parisc, sh4 is in debian-ports too.
The status of the platforms in debian-ports is here:
https://www.ports.debian.org/archive
https://buildd.debian.org/status/architecture.php?a=3Dhppa&suite=3Dsid

There is some effort to maintain all the platforms in debian-ports.=C2=A0=
 The hppa platform is also still
in gentoo, and one or two bsd distros.

Regards,
Dave

--=20
John David Anglin  dave.anglin@bell.net



