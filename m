Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 525C717077D
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Feb 2020 19:19:48 +0100 (CET)
Received: from localhost ([::1]:48480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j71Hf-0008J2-EK
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 13:19:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44163)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j71Gq-0007m0-Bf
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 13:18:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j71Gp-0001ia-BP
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 13:18:56 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:40023
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j71Gp-0001iI-6Z
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 13:18:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582741134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2o73uRGSBgrIBM185jP59p4QfYDtNl6ohT6e8UTynUs=;
 b=Uq16kaxEm+QaHBqi34Oq/Jxm/DbVM70nsLmNIGDJYxkkJ+vWtGc3dqEokRUFxQ0rRqDjnL
 DCnojISimKmuI4I2eOx901DyN1Pk/g8JmrEA7TUTd7P4gY8YuR/oH4aLI0gpflI6crqI0s
 DTNJvgfNpYCgTg3o6zWxH9M7cplvBLQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-0ZwuJ56-OfaJHDNxElU1dQ-1; Wed, 26 Feb 2020 13:18:53 -0500
X-MC-Unique: 0ZwuJ56-OfaJHDNxElU1dQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AD01801E5C;
 Wed, 26 Feb 2020 18:18:51 +0000 (UTC)
Received: from [10.36.116.59] (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CBC20101D482;
 Wed, 26 Feb 2020 18:18:46 +0000 (UTC)
Subject: Re: [PATCH v3 00/10] vTPM for aarch64
To: Stefan Berger <stefanb@linux.ibm.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20200226102549.12158-1-eric.auger@redhat.com>
 <31e81f4b-ef00-692e-540f-ef3d9be5bb9a@linux.ibm.com>
 <22380cd3-b13e-aede-a7f5-158d86ca6136@redhat.com>
 <a8913524-4de3-dc0a-0b2c-2deb88c33859@linux.ibm.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <df345076-8def-9ba5-6c11-2bcaa2293ca1@redhat.com>
Date: Wed, 26 Feb 2020 19:18:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <a8913524-4de3-dc0a-0b2c-2deb88c33859@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: marcandre.lureau@redhat.com, lersek@redhat.com, ardb@kernel.org,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Stefan,

On 2/26/20 6:53 PM, Stefan Berger wrote:
> On 2/26/20 12:47 PM, Auger Eric wrote:
>> Hi Stefan,
>>
>> On 2/26/20 2:32 PM, Stefan Berger wrote:
>>> On 2/26/20 5:25 AM, Eric Auger wrote:
>>>> This series adds the capability to instantiate an MMIO TPM TIS
>>>> in ARM virt. It is candidate to qemu 5.0.
>>> Looks good. Can you run the checkpatch script over the patches and
>>> address the warnings?
>>>
>>>
>> Thank you for you review!
>>
>> About warnings
>>
>> - There are warnings due to new files added but I think they all have an
>> entry in MAINTAINERS as wildcards are used.
>>
>> - In tpm: Add the SysBus TPM TIS device.
>> =C2=A0=C2=A0 There is line over 80 chars but I think it is fine
>>
>> #define TPM_TIS_SYSBUS(obj) OBJECT_CHECK(TPMStateSysBus, (obj),
>> TYPE_TPM_TIS_SYSBUS)
>=20
>=20
> Ok, leave it as it is.
and sorry, what about the comment style issues derived from existing files?

"
- test: tpm-tis: Get prepared to share tests between ISA and sysbus devices
has lots of warnings due to old comment style being used in
tests/qtest/tpm-tis-test.c. I did not fix the style issue because I just
copy the code into tpm-tis-util.c

Do you want me to fix them in the same patch, in a separate patch or
ignore the style issue for now?
"

Thanks

Eric


>=20
>=20
> =C2=A0=C2=A0 Stefan
>=20
>=20


