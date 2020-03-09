Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB0817DC3C
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Mar 2020 10:17:53 +0100 (CET)
Received: from localhost ([::1]:39195 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBEXn-0005gZ-T6
	for lists+qemu-devel@lfdr.de; Mon, 09 Mar 2020 05:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55385)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jBEWl-00055i-R4
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 05:16:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jBEWk-0000GA-Qr
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 05:16:47 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:50121)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1jBEWi-0000EL-67; Mon, 09 Mar 2020 05:16:44 -0400
Received: from [192.168.100.1] ([82.252.135.106]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MKbc2-1iunZ40f2i-00KxYn; Mon, 09 Mar 2020 10:16:30 +0100
Subject: Re: [PATCH] core/qdev: fix memleak in qdev_get_gpio_out_connector()
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Pan Nengyuan <pannengyuan@huawei.com>
References: <20200307030756.5913-1-pannengyuan@huawei.com>
 <CAJ+F1C+6QSYBhO_M+Vqps4XvOujnV+Wbq6o9Q+qUmC5Z0dmxSQ@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 mQINBFYFJhkBEAC2me7w2+RizYOKZM+vZCx69GTewOwqzHrrHSG07MUAxJ6AY29/+HYf6EY2
 WoeuLWDmXE7A3oJoIsRecD6BXHTb0OYS20lS608anr3B0xn5g0BX7es9Mw+hV/pL+63EOCVm
 SUVTEQwbGQN62guOKnJJJfphbbv82glIC/Ei4Ky8BwZkUuXd7d5NFJKC9/GDrbWdj75cDNQx
 UZ9XXbXEKY9MHX83Uy7JFoiFDMOVHn55HnncflUncO0zDzY7CxFeQFwYRbsCXOUL9yBtqLer
 Ky8/yjBskIlNrp0uQSt9LMoMsdSjYLYhvk1StsNPg74+s4u0Q6z45+l8RAsgLw5OLtTa+ePM
 JyS7OIGNYxAX6eZk1+91a6tnqfyPcMbduxyBaYXn94HUG162BeuyBkbNoIDkB7pCByed1A7q
 q9/FbuTDwgVGVLYthYSfTtN0Y60OgNkWCMtFwKxRaXt1WFA5ceqinN/XkgA+vf2Ch72zBkJL
 RBIhfOPFv5f2Hkkj0MvsUXpOWaOjatiu0fpPo6Hw14UEpywke1zN4NKubApQOlNKZZC4hu6/
 8pv2t4HRi7s0K88jQYBRPObjrN5+owtI51xMaYzvPitHQ2053LmgsOdN9EKOqZeHAYG2SmRW
 LOxYWKX14YkZI5j/TXfKlTpwSMvXho+efN4kgFvFmP6WT+tPnwARAQABtCJMYXVyZW50IFZp
 dmllciA8bGF1cmVudEB2aXZpZXIuZXU+iQI4BBMBAgAiBQJWBTDeAhsDBgsJCAcDAgYVCAIJ
 CgsEFgIDAQIeAQIXgAAKCRDzDDi9Py++PCEdD/oD8LD5UWxhQrMQCsUgLlXCSM7sxGLkwmmF
 ozqSSljEGRhffxZvO35wMFcdX9Z0QOabVoFTKrT04YmvbjsErh/dP5zeM/4EhUByeOS7s6Yl
 HubMXVQTkak9Wa9Eq6irYC6L41QNzz/oTwNEqL1weV1+XC3TNnht9B76lIaELyrJvRfgsp9M
 rE+PzGPo5h7QHWdL/Cmu8yOtPLa8Y6l/ywEJ040IoiAUfzRoaJs2csMXf0eU6gVBhCJ4bs91
 jtWTXhkzdl4tdV+NOwj3j0ukPy+RjqeL2Ej+bomnPTOW8nAZ32dapmu7Fj7VApuQO/BSIHyO
 NkowMMjB46yohEepJaJZkcgseaus0x960c4ua/SUm/Nm6vioRsxyUmWd2nG0m089pp8LPopq
 WfAk1l4GciiMepp1Cxn7cnn1kmG6fhzedXZ/8FzsKjvx/aVeZwoEmucA42uGJ3Vk9TiVdZes
 lqMITkHqDIpHjC79xzlWkXOsDbA2UY/P18AtgJEZQPXbcrRBtdSifCuXdDfHvI+3exIdTpvj
 BfbgZAar8x+lcsQBugvktlQWPfAXZu4Shobi3/mDYMEDOE92dnNRD2ChNXg2IuvAL4OW40wh
 gXlkHC1ZgToNGoYVvGcZFug1NI+vCeCFchX+L3bXyLMg3rAfWMFPAZLzn42plIDMsBs+x2yP
 +bkCDQRWBSYZARAAvFJBFuX9A6eayxUPFaEczlMbGXugs0mazbOYGlyaWsiyfyc3PStHLFPj
 rSTaeJpPCjBJErwpZUN4BbpkBpaJiMuVO6egrC8Xy8/cnJakHPR2JPEvmj7Gm/L9DphTcE15
 92rxXLesWzGBbuYxKsj8LEnrrvLyi3kNW6B5LY3Id+ZmU8YTQ2zLuGV5tLiWKKxc6s3eMXNq
 wrJTCzdVd6ThXrmUfAHbcFXOycUyf9vD+s+WKpcZzCXwKgm7x1LKsJx3UhuzT8ier1L363RW
 ZaJBZ9CTPiu8R5NCSn9V+BnrP3wlFbtLqXp6imGhazT9nJF86b5BVKpF8Vl3F0/Y+UZ4gUwL
 d9cmDKBcmQU/JaRUSWvvolNu1IewZZu3rFSVgcpdaj7F/1aC0t5vLdx9KQRyEAKvEOtCmP4m
 38kU/6r33t3JuTJnkigda4+Sfu5kYGsogeYG6dNyjX5wpK5GJIJikEhdkwcLM+BUOOTi+I9u
 tX03BGSZo7FW/J7S9y0l5a8nooDs2gBRGmUgYKqQJHCDQyYut+hmcr+BGpUn9/pp2FTWijrP
 inb/Pc96YDQLQA1q2AeAFv3Rx3XoBTGl0RCY4KZ02c0kX/dm3eKfMX40XMegzlXCrqtzUk+N
 8LeipEsnOoAQcEONAWWo1HcgUIgCjhJhBEF0AcELOQzitbJGG5UAEQEAAYkCHwQYAQIACQUC
 VgUmGQIbDAAKCRDzDDi9Py++PCD3D/9VCtydWDdOyMTJvEMRQGbx0GacqpydMEWbE3kUW0ha
 US5jz5gyJZHKR3wuf1En/3z+CEAEfP1M3xNGjZvpaKZXrgWaVWfXtGLoWAVTfE231NMQKGoB
 w2Dzx5ivIqxikXB6AanBSVpRpoaHWb06tPNxDL6SVV9lZpUn03DSR6gZEZvyPheNWkvz7bE6
 FcqszV/PNvwm0C5Ju7NlJA8PBAQjkIorGnvN/vonbVh5GsRbhYPOc/JVwNNr63P76rZL8Gk/
 hb3xtcIEi5CCzab45+URG/lzc6OV2nTj9Lg0SNcRhFZ2ILE3txrmI+aXmAu26+EkxLLfqCVT
 ohb2SffQha5KgGlOSBXustQSGH0yzzZVZb+HZPEvx6d/HjQ+t9sO1bCpEgPdZjyMuuMp9N1H
 ctbwGdQM2Qb5zgXO+8ZSzwC+6rHHIdtcB8PH2j+Nd88dVGYlWFKZ36ELeZxD7iJflsE8E8yg
 OpKgu3nD0ahBDqANU/ZmNNarBJEwvM2vfusmNnWm3QMIwxNuJghRyuFfx694Im1js0ZY3LEU
 JGSHFG4ZynA+ZFUPA6Xf0wHeJOxGKCGIyeKORsteIqgnkINW9fnKJw2pgk8qHkwVc3Vu+wGS
 ZiJK0xFusPQehjWTHn9WjMG1zvQ5TQQHxau/2FkP45+nRPco6vVFQe8JmgtRF8WFJA==
Message-ID: <87b027ab-7bed-249a-08a2-2c27fdd05a31@vivier.eu>
Date: Mon, 9 Mar 2020 10:16:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAJ+F1C+6QSYBhO_M+Vqps4XvOujnV+Wbq6o9Q+qUmC5Z0dmxSQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nryeCMovkafuqJxKaiOZiRlwfKTUSZRIofqOTXH1gWwaCgnw7qC
 OBqT8bLSxpJWzaWB3tu189je0vOweAU7gAoFyqUySyGcbb0ipJXrqDJ6IBFocNbcdm06ZWc
 Wep8PwgLk0AB1FguffG1Ypt0DzFEK6MtBmtfPqkOSoLia5clHUgOp5kW3WpjWUbLcVrq1an
 ObNQxaEwgEAOgxtboLmgQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3ZPX6QDt+d0=:BKdEi56kXX7+62Je9xrdCT
 0ZprflYR1y/1OM9bKUmhnEr/KAFA2X+fqJVj+nfpAqEK9S7jYpGnRPdqjo13JaFRRFZH6DAVY
 m4sa18AfNGKALhVZ9L1MzCyS3q9LpVpmf8fKSItUqORYvCwJ/NiugG5iPx96k+AKxlTtwbwyr
 sXuPVTwFiSo3ytRBwWFhTsMtHpxV7xpNxl536/h6BI6tghp0GcAwZWH/ftGjxLpmmL5ftYbAa
 bEUr/ek8YG0eAgWvnchJe918ShDZCibElKS9U1wQ0POOqoOa5FjRSn/8xt3Av6hMKMuNHdnD8
 XZyis/z0bST+cCaTuq5g0hbkexndpw2ZJCkAgw0NX/dOp46rEOYFUf6PmcertB6n8HCkSxxBm
 VfV3t9cvzRg5knUhP1Ofn+jHXOsEfcw/+gPTUWn9SQqv1BhNz+2uasC96MKRThb1M+LRw3qrb
 xaaOtlGjAYhk6ybTtELAF81lhDc7KEtP315S1aYIqGqTFa8wMv7CR4vEFs9XTOLEDs09tHqI/
 kUpgE4hF6nANJQuiS/FKA7ORJUwrVYhu8fQg+DAAXvQ+9uNi2C/QmSoihHw5z33mxFtIYAW0a
 G+uicTRqNvElXiqEjBybeiRfjoGWiuc6XGVCxmLRf2RzXNTL5pZKX8T8dffgHixFvAtXxOcuB
 NliDYEztnbzFeqrXw87wY//89AayxjA89kFEz1CYmn27356VaPzCrZ/dBYcdeJ20NrSL3vekm
 pR47rGoV8hIaDfJapdBPgh6dNO2P4C0Xa2k+FHCJr1ZOML49Q8ToFqwjBjet3kTxEm2216NOL
 F+5IZ8cZgprVD2VOS45dv0lTsFI6C8J0oS9FBn3CEV3PXAiJSd2D+zlQfYmSVSJq53W98dQ
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu trival <qemu-trivial@nongnu.org>,
 QEMU <qemu-devel@nongnu.org>, Euler Robot <euler.robot@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 07/03/2020 à 11:39, Marc-André Lureau a écrit :
> Hi
> 
> On Sat, Mar 7, 2020 at 3:53 AM Pan Nengyuan <pannengyuan@huawei.com> wrote:
>>
>> Fix a memory leak in qdev_get_gpio_out_connector().
>>
>> Reported-by: Euler Robot <euler.robot@huawei.com>
>> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
> 
> good catch,
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>

trivial question:

Why do we prefer g_autofree() to the g_free() function?

Thanks,
Laurent

>> ---
>>  hw/core/qdev.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
>> index 3937d1eb1a..85f062def7 100644
>> --- a/hw/core/qdev.c
>> +++ b/hw/core/qdev.c
>> @@ -557,7 +557,7 @@ void qdev_connect_gpio_out_named(DeviceState *dev, const char *name, int n,
>>
>>  qemu_irq qdev_get_gpio_out_connector(DeviceState *dev, const char *name, int n)
>>  {
>> -    char *propname = g_strdup_printf("%s[%d]",
>> +    g_autofree char *propname = g_strdup_printf("%s[%d]",
>>                                       name ? name : "unnamed-gpio-out", n);
>>
>>      qemu_irq ret = (qemu_irq)object_property_get_link(OBJECT(dev), propname,
>> --
>> 2.18.2
>>
>>
> 
> 


