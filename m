Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E19E3A9E
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 20:06:44 +0200 (CEST)
Received: from localhost ([::1]:49732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNhVT-0004zT-8q
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 14:06:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39924)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iNgrc-0003gq-UP
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 13:25:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iNgrb-00061H-76
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 13:25:32 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:45061)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1iNgrX-000607-Pb; Thu, 24 Oct 2019 13:25:31 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MAwPZ-1iGqIG0FrN-00BIAA; Thu, 24 Oct 2019 19:25:09 +0200
Subject: Re: [Qemu-devel] [PATCH] pci_bridge: fix a typo in comment
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 maozy <maozhongyi@cmss.chinamobile.com>, qemu-devel@nongnu.org
References: <20181108122102.9915-1-maozhongyi@cmss.chinamobile.com>
 <1898dc23-c512-88bd-cb73-5a2cffccd176@redhat.com>
 <7f3e7954-3574-9f44-7710-4a488c1d0fe2@cmss.chinamobile.com>
 <f68aacf9-2ac3-2a9d-8aab-6a86c52cbacb@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <6e4e6d91-5b79-8c7f-b0bd-846db8850f2c@vivier.eu>
Date: Thu, 24 Oct 2019 19:25:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <f68aacf9-2ac3-2a9d-8aab-6a86c52cbacb@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jxyzHHTiVQKPQ+1SDPElemjsGE7X8wtNaycwJCQpd4LuOp84HgW
 /FoaPHe0NUi6nvoL0s4qbSIIz6frM+IwTgtmfGbXOHxJZvBhvBPjRl4f4rbSltd+/zncanC
 dR32jNXcWrPZSe9GO/jnecVzEjhUlmGpVjLGEKnasb6yjKunbtaSH9qoZIzkv3AWvW/MiWk
 I6e1kl4X2Fz5FwLPbRbMQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dGlWQQgmkJA=:aF0jztbc6xwHvx8ooBQiBf
 +6ESL21OqrPxEtndDPJ+XIN+t27ZxnvGfFZ1WEZq9miEYHRNgCwR3xtl26KznOJaIrTgWhzQ+
 3ZTCoiDPiWdBjkGcTUrito+IzWq24HfYXPDdnMIPWqTag8oaiEoenY2Gdy4YrbCrDYJCfhETy
 kXJ5+R0cDcwow3VggHdoKCVLoXanWwTABc67R1w9FtcUDIldT+l6OyeowcOE9x8u2/M1dqN91
 5Mv59LenJ+wi/iNwVOrDlRJAJDZu8M6cCD6RkGR2mpHyRwFQi5nzFvIC39V6DsZM8HS1jlYGZ
 TEU/BXkyOTlTvRqHIlr7qSYuyvwlOp2+VSReHGSEJxx+oCcj+fILCHAB7giGgueKKwLdnOH7m
 Pmu31yTX0vGrXIAF3ZlSYjJVPSPfFYAwwTZlikLCrNV3iAXNjxI/1yk1f7xSz0Cw0nOupa/Rd
 2qPWHzRa1IMzL3vqRMNJj5OJkQLIJ808AmjLZU+7rYmW0fd1v6+YPmfXujGD5uCLFRY6l4MEE
 uH104SPHOG3LqYwLkKBRvmpsshBw5Y8w/FUGn3Aj4bFpXkawAzTIjqTwhg9wr9o3ljx1ptuo2
 ApNoLkzjBQlXyNsNoWPAdk91GcZtnSY6dWppTjFjyGfUTE+6pMPxf3rEdKa+xruIdfjDTMWdM
 8yTUArl4JQmnblSSgojHnZj1r4rhM1/oaqvd0PveIjwK9zzgpIY0nfK8unAt3h3Nw5EjVZQvQ
 QYzV2/3LHZSjUobot6fhRWj30fKDRs+ZraiVBK5p6rrm7/v+8AD8KjjIyJ3Hlz9R9fnTb4DNM
 nV+H60+v1L7ysz6lh326JY7R7090GvvQrsGyA8SDmDQYQtMlDziZvkM8ONATreoq2tYrW0lhe
 gcMuIFVeEA3cFXXjTsPgd1tKQAtTob7JTazqwNcX8=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.134
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 23/10/2019 à 12:47, Philippe Mathieu-Daudé a écrit :
> On 10/23/19 5:32 AM, maozy wrote:
>> ping...
> 
> I'm not sure qemu-trivial@ received this one because the email address
> looked odd (now fixed).
> 
>>
>> On 11/8/18 9:12 PM, Philippe Mathieu-Daudé wrote:
>>> Cc'ing qemu-trivial@
>>>
>>> On 8/11/18 13:21, Mao Zhongyi wrote:
>>>> Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
>>>
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>
>>>> ---
>>>>   hw/pci/pci_bridge.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
>>>> index ee9dff2d3a..da8daa3ff2 100644
>>>> --- a/hw/pci/pci_bridge.c
>>>> +++ b/hw/pci/pci_bridge.c
>>>> @@ -310,7 +310,7 @@ void pci_bridge_reset(DeviceState *qdev)
>>>>       /*
>>>>        * the default values for base/limit registers aren't specified
>>>> -     * in the PCI-to-PCI-bridge spec. So we don't thouch them here.
>>>> +     * in the PCI-to-PCI-bridge spec. So we don't touch them here.
>>>>        * Each implementation can override it.
>>>>        * typical implementation does
>>>>        * zero base/limit registers or
>>>>
>>>
>>
>>
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

