Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 273EA443E03
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 09:07:29 +0100 (CET)
Received: from localhost ([::1]:45040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miBIu-0008R6-9s
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 04:07:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1miBFb-0006Qq-1m; Wed, 03 Nov 2021 04:04:03 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:41117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1miBFX-0005Nt-Uu; Wed, 03 Nov 2021 04:04:01 -0400
Received: from [192.168.100.1] ([82.142.14.190]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N0Ip5-1mVtb30xKJ-00xHDC; Wed, 03 Nov 2021 09:03:54 +0100
Message-ID: <738c96dc-bd19-8edb-4842-3f6f88ea8660@vivier.eu>
Date: Wed, 3 Nov 2021 09:03:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] hmp: Add shortcut to stop command to match cont
Content-Language: fr
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <20211030095225.513D4748F48@zero.eik.bme.hu>
 <dcb85274-cc53-f5c9-2975-184229cc78d@eik.bme.hu>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <dcb85274-cc53-f5c9-2975-184229cc78d@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ZGjTXy209hyEkMY1RpeopVr+kGKliLEvoviwxR/qPmPiwTgs6Uo
 p2lcYg2SHsGircDCl3T5MG0yiy63QqjCKfpA8ThGvDZg8mBELwwai/rtr4IGdG3ih+oe0gi
 mKeEfZHyzBr3XnjoZD+6PvpwX+L88uzjdZqhKNzXK0jvwuSwpramAlaCG0JlwLFGsXEFQk4
 iafUNNSJmDn1A3mVAiviw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+WeabcB30jk=:mBfjXauv1ME7Eo4I2mldW3
 D+KD5D29LwJhs8Z5RLrQ7s4oYwIuPMBlQIDuSQXIqSpQ8vIij14/XGseu9uvijmicgGtxHcn/
 GPQQihc649+7y3YM/KZaMlfKPwUI3tteUuAZhuCE+rBct8Ny5n8Q3ZTEAtSTUHU7KZZUsbJCP
 PKz3jEIHpu+dEoTSGdiwbOTSoycMaeOn5IP+Hdeqzw8ZJyPavqMcGzfRwbksJIOogCjQfOk6E
 KmZ7IuT4ioMVZUB2ba9phkML7zsSdV/ppqeJiNTSFzAmXk/zyVJxLmn+3hwEmZGWROuui3SPc
 ZUigXyWb+UTDKFFdf3RbcvlRFI4kUn/R25uMyebJsapwmQncmcEQbSjc+AjTa0jgfxqQCmPDm
 CvIwWaYRskgVT46DDFTa5iMZbooA1NpXo07DVm0g4BBmsiXxJCcNJLgLeb+IqxIHX+NL6uAB+
 gpm1xQ36jcQRK01aIX6htBKXmLGpkZo05kJyJ0ZDUCwhtgD7bCl7FpFN4+5/LIRHUBj82uiLI
 e46l4sb5ZpVb59V2m3VZGr8xsz9kbUfMMADtcR0WSIpsS98u2on9m59aYCQeY2M6OlZy0JvoC
 6x4p59Nuavjmc+4N05HeYxzqbJfdO5Aj0x98fxK/XLvOVWaem+o182B1Ozxk5yEaaUyV8FWkQ
 mIq+4aEQlN1VWe0SvTVrcgx5xyy+JkjAPbUWid5E8ACjnoisuXNyu7D7pBBshO+tATQ0=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.549,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 01/11/2021 à 23:56, BALATON Zoltan a écrit :
> Ping? This is really simple addition that sholdn't take long to review.
> 
> On Sat, 30 Oct 2021, BALATON Zoltan wrote:
>> Some commands such as quit or cont have one letter alternatives but
>> stop is missing that. Add stop|s to match cont|c for consistency and
>> convenience.
>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>> c2: Fixed typo in commit title
>>
>> hmp-commands.hx | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hmp-commands.hx b/hmp-commands.hx
>> index cf723c69ac..07a738a8e2 100644
>> --- a/hmp-commands.hx
>> +++ b/hmp-commands.hx
>> @@ -382,7 +382,7 @@ SRST
>> ERST
>>
>>     {
>> -        .name       = "stop",
>> +        .name       = "stop|s",
>>         .args_type  = "",
>>         .params     = "",
>>         .help       = "stop emulation",
>> @@ -390,7 +390,7 @@ ERST
>>     },
>>
>> SRST
>> -``stop``
>> +``stop`` or ``s``
>>   Stop emulation.
>> ERST
>>
>>
> 

Applied to my trivial-patches branch.

I'll do a new PR before the hard freeze.

Thanks,
Laurent

