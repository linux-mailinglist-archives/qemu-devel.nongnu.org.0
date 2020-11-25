Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 790152C4982
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 22:06:56 +0100 (CET)
Received: from localhost ([::1]:44696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ki207-0007tl-0j
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 16:06:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1ki1wS-0005Wr-Mx
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 16:03:08 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:58418
 helo=v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1ki1wQ-0005If-Bs
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 16:03:08 -0500
Received: from localhost (localhost [127.0.0.1])
 by v2201612906741603.powersrv.de (Postfix) with ESMTP id 3B1EDDB2D73;
 Wed, 25 Nov 2020 22:02:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
 by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id O9VDSKO_mFPH; Wed, 25 Nov 2020 22:01:51 +0100 (CET)
Received: from edv-macbook-pro.fritz.box (p57b420e8.dip0.t-ipconnect.de
 [87.180.32.232])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 6EE98DA34D8;
 Wed, 25 Nov 2020 21:59:49 +0100 (CET)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201125191833.964753-1-sw@weilnetz.de>
 <CAFEAcA-oo6M8W=uX=-FSyAkioQtPLQ5fe2V1CUaj1KkiK9efig@mail.gmail.com>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH for-5.2] nsis: Fix build for 64 bit installer
Message-ID: <024f86eb-c91f-6a3c-565f-4a42e3bb4eec@weilnetz.de>
Date: Wed, 25 Nov 2020 21:59:48 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-oo6M8W=uX=-FSyAkioQtPLQ5fe2V1CUaj1KkiK9efig@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 25.11.20 um 20:28 schrieb Peter Maydell:

> On Wed, 25 Nov 2020 at 19:23, Stefan Weil <sw@weilnetz.de> wrote:
>> Pass cpu instead of cpu_family to the NSIS installer script.
>>
>> That script checks for "x86_64" which is the cpu value,
>> while cpu_family is "x86".
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>   meson.build | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> Very unfortunate that this has only surfaced after rc3,
> which should in theory be the cutoff point for 5.2 changes.
> Is it possible to get something into the CI/make check
> so that we find Windows installer issues sooner?
>
> thanks
> -- PMM


I am afraid there are more open issues for QEMU on Windows. They can be=20
fixed in 5.2.1, so don't hesitate to finish 5.2.0.

The Meson based build sets bindir=3D/qemu/. which does not work correctly=
=20
in get_relocated_path().

Finding such issues would require a CI environment which not only builds =

QEMU for Windows, but also runs the results. Some basic tests could be=20
done on Linux using Wine, more advanced tests would require a real=20
Windows host.

Regards,
Stefan




