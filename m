Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EC4358499
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 15:25:57 +0200 (CEST)
Received: from localhost ([::1]:34324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUUfU-0003o1-BV
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 09:25:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lUUcB-0000z5-CM
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 09:22:31 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:36513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lUUc4-0001te-BE
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 09:22:30 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 2C6FB746340;
 Thu,  8 Apr 2021 15:22:17 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0CE597462E0; Thu,  8 Apr 2021 15:22:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 0B7FE7456B4;
 Thu,  8 Apr 2021 15:22:17 +0200 (CEST)
Date: Thu, 8 Apr 2021 15:22:17 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH-for-6.0? v2] hw/isa/Kconfig: Add missing dependency VIA
 VT82C686 -> APM
In-Reply-To: <05578055-216d-1cf3-93cc-a2b358374ca2@amsat.org>
Message-ID: <da83b8d6-3d33-8dcc-a31a-ec2287802b2c@eik.bme.hu>
References: <20210316110353.3051738-1-f4bug@amsat.org>
 <05578055-216d-1cf3-93cc-a2b358374ca2@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="3866299591-1441207379-1617888086=:57126"
Content-ID: <f8f3a1f9-cd24-b1a4-62e4-312e874b1ba9@eik.bme.hu>
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1441207379-1617888086=:57126
Content-Type: text/plain; CHARSET=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <d39bd4ff-923d-30e5-a71c-43e5e5b126@eik.bme.hu>

On Thu, 8 Apr 2021, Philippe Mathieu-Daudé wrote:
> This patch apparently got lost.

No, it's queued for 6.1 as part of my pegasos2 series in David's tree:

https://github.com/dgibson/qemu/commits/ppc-for-6.1

Regards,
BALATON Zoltan

> On 3/16/21 12:03 PM, Philippe Mathieu-Daudé wrote:
>> TYPE_VIA_PM calls apm_init() in via_pm_realize(), so
>> requires APM to be selected.
>>
>> Reported-by: BALATON Zoltan <balaton@eik.bme.hu>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> Rebased on usb-20210315-pull-request
>> Based-on: <20210315180240.1597240-1-kraxel@redhat.com>
>> ---
>>  hw/isa/Kconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
>> index 2691eae2f0c..55e0003ce40 100644
>> --- a/hw/isa/Kconfig
>> +++ b/hw/isa/Kconfig
>> @@ -48,6 +48,7 @@ config VT82C686
>>      select SERIAL_ISA
>>      select FDC
>>      select USB_UHCI
>> +    select APM
>>
>>  config SMC37C669
>>      bool
>>
>
>
--3866299591-1441207379-1617888086=:57126--

