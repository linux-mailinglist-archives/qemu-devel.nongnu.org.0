Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0C9265A3
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 16:26:26 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44207 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTSCH-00063L-BQ
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 10:26:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51753)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hTSAE-000539-NB
	for qemu-devel@nongnu.org; Wed, 22 May 2019 10:24:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hTSAD-0006bo-BL
	for qemu-devel@nongnu.org; Wed, 22 May 2019 10:24:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36802)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hTSAA-0006EO-FQ; Wed, 22 May 2019 10:24:14 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BFCC0307D945;
	Wed, 22 May 2019 14:24:08 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-162.ams2.redhat.com [10.36.116.162])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5B4A55427C;
	Wed, 22 May 2019 14:24:05 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20190514100019.13263-1-thuth@redhat.com>
	<20190514100019.13263-2-thuth@redhat.com>
	<b8cd670b-7a76-6197-1949-3600a8d1dbe0@redhat.com>
	<1d0b60e6-2d0c-3d91-eaad-ccb076064ac9@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; keydata=
	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
Organization: Red Hat
Message-ID: <311455f4-6760-2383-6222-b1341c5d307e@redhat.com>
Date: Wed, 22 May 2019 16:24:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1d0b60e6-2d0c-3d91-eaad-ccb076064ac9@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Wed, 22 May 2019 14:24:08 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 1/4] hw/core: Add a config switch for the
 "register" device
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/05/2019 12.38, Thomas Huth wrote:
> On 14/05/2019 12.31, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 5/14/19 12:00 PM, Thomas Huth wrote:
>>> The "register" device is only used by certain machines. Let's add
>>> a proper config switch for it so that it only gets compiled when we
>>> really need it.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>  hw/core/Kconfig       | 3 +++
>>>  hw/core/Makefile.objs | 2 +-
>>>  hw/dma/Kconfig        | 1 +
>>>  hw/timer/Kconfig      | 1 +
>>>  4 files changed, 6 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/core/Kconfig b/hw/core/Kconfig
>>> index c2a1ae8122..d11920fcb3 100644
>>> --- a/hw/core/Kconfig
>>> +++ b/hw/core/Kconfig
>>> @@ -9,3 +9,6 @@ config FITLOADER
>>> =20
>>>  config PLATFORM_BUS
>>>      bool
>>> +
>>> +config REGISTER
>>> +    bool
>>> diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
>>> index a799c83815..d493a051ee 100644
>>> --- a/hw/core/Makefile.objs
>>> +++ b/hw/core/Makefile.objs
>>> @@ -16,7 +16,7 @@ common-obj-$(CONFIG_SOFTMMU) +=3D machine.o
>>>  common-obj-$(CONFIG_SOFTMMU) +=3D loader.o
>>>  common-obj-$(CONFIG_FITLOADER) +=3D loader-fit.o
>>>  common-obj-$(CONFIG_SOFTMMU) +=3D qdev-properties-system.o
>>> -common-obj-$(CONFIG_SOFTMMU) +=3D register.o
>>> +common-obj-$(CONFIG_REGISTER) +=3D register.o
>>>  common-obj-$(CONFIG_SOFTMMU) +=3D or-irq.o
>>>  common-obj-$(CONFIG_SOFTMMU) +=3D split-irq.o
>>>  common-obj-$(CONFIG_PLATFORM_BUS) +=3D platform-bus.o
>>> diff --git a/hw/dma/Kconfig b/hw/dma/Kconfig
>>> index 751dec5426..5c61b67bc0 100644
>>> --- a/hw/dma/Kconfig
>>> +++ b/hw/dma/Kconfig
>>> @@ -16,6 +16,7 @@ config I8257
>>> =20
>>>  config ZYNQ_DEVCFG
>>>      bool
>>> +    select REGISTER
>>> =20
>>>  config STP2000
>>>      bool
>>> diff --git a/hw/timer/Kconfig b/hw/timer/Kconfig
>>> index 51921eb63f..f575481210 100644
>>> --- a/hw/timer/Kconfig
>>> +++ b/hw/timer/Kconfig
>>> @@ -36,6 +36,7 @@ config TWL92230
>>> =20
>>>  config XLNX_ZYNQMP
>>>      bool
>>> +    select REGISTER
>>> =20
>>>  config ALTERA_TIMER
>>>      bool
>>>
>>
>> Annoying, this clashes with "hw/microblaze: Kconfig cleanup" which is
>> already queued by Paolo:
>> https://lists.gnu.org/archive/html/qemu-devel/2019-04/msg04669.html
>=20
> Ok, I'll wait for the merge of Paolo's next PULL request before sending
> the v2 of my series.

Looks like your patches were not included in Paolo's last PULL request?
Did the patches fall through the cracks?

 Thomas

