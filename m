Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8122D36FC7
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jun 2019 11:25:22 +0200 (CEST)
Received: from localhost ([127.0.0.1]:57041 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYoe9-0005ou-K1
	for lists+qemu-devel@lfdr.de; Thu, 06 Jun 2019 05:25:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37512)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hYocL-00052D-Fh
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 05:23:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hYocK-0005NJ-IU
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 05:23:29 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:59283)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hYocI-0005Hx-Be; Thu, 06 Jun 2019 05:23:26 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
	1MFbeI-1hL4on2diA-00H73S; Thu, 06 Jun 2019 11:23:07 +0200
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
References: <20190604080010.23186-1-armbru@redhat.com>
	<ff72b9fc-003f-275a-d382-860f2a483d60@redhat.com>
	<803fdb35-f28e-c033-b5ac-02d230dacf94@redhat.com>
	<56d043be-efd0-cfb5-2c68-30855eb42d03@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <9808b3e6-a7f6-cd4d-05f7-ed314965adbc@vivier.eu>
Date: Thu, 6 Jun 2019 11:23:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <56d043be-efd0-cfb5-2c68-30855eb42d03@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8byMmjlxvLjVs4vQ8Epfs1FL7be4u3zAPk0HFhMrJnztfEgpdbP
	RWtUXcseWDUPtmgmnJXDUws/WCk8csQz4Q1+H7pUaxyztjoMbgQObsEWC+aLmRwmo/UXqYr
	+q9Q+ivo9Yf2UbbqvbuqrUmVnLIcdFACnTL2DePaMT3bb54ubWSFRwajNQQ3kW6WU7hQO+N
	aPXF5MhBVryTywmbceHAA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FcX0Exxx+kU=:K6aH7REDbD/ZWq/2ebonHr
	GtkqbpOElTa7nslp6b7f62pTORVAzETgQlkMmufZMEM7TPXTHyxecUZhN8gr1oE15HyfAdAWh
	LBSy2iflP08hhJk7B80of7Gjd3Y/WV3lzY8NB/zn9/Bqv223zMlINY15fDVnGUBN+ZtTMFIed
	5qqV90fRkIB4279altrmEPJRoXFG5pkOiT92g9g3/bz30nr0QBzIEh1oQKrm/LVrO0aTlC3Zh
	nqrKTHOOmtQOjk7Dz5/I0D7RT4SB92qHXFMTITkIWXBbZqBOKv93ZXloKr3dbDVlN8XnpDGEN
	tqi5qY5UzDkXSWq96/Kgrs9QVyuZVT+DFrIXm3rbnoMxlcMjktQ23JzX+AjWOwzMZ2LsAFA3B
	h6gt7/bwR40s9ZAh96xIg1+7XfewOitl7DAmBkUBCd3lCfMAw0XJG4V3R/L0BLMaMs9UGot/L
	44mlgwiRFD9v8c/sbFWeGlnnLDFRNwhh/tX4B0vNw1v/K7RXGEUJ3rVYtLrVLJ0ZzmLMn2mDI
	g4Q/1PsQdJ4S0CEo6e8m4+AWg+fJwkm9BukP2+AkO+RMmlW9gCF1RE0PORNC6dDCfdf1CmVgg
	4+MmC7lrS+ii0pIk3+XY78ou6uBTwZy29xOkRBdknCnCAmCEbjT55plR4PBOPU8RFgpF1VU9F
	vQQF8bkmEdB0XF7CvwY+KDKlVMdIhdm6ZqmVug7F7sxsEqTOor1SCZOXiOcJ7VxBG9a80SktF
	8L67Vku8IIj66XEBobGl7PY1tNxi8TaKZc3yqgfgG9VbERgHP6Kbm20YREU=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.135
Subject: Re: [Qemu-devel] [Qemu-trivial] [PATCH] test: Fix make target
 check-report.tap
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 04/06/2019 à 10:42, Philippe Mathieu-Daudé a écrit :
> On 6/4/19 10:28 AM, Paolo Bonzini wrote:
>> On 04/06/19 10:09, Philippe Mathieu-Daudé wrote:
>>>>  check-report.tap: $(patsubst %,check-report-qtest-%.tap, $(QTEST_TARGETS)) check-report-unit.tap
>>>> -	$(call quiet-command,./scripts/tap-merge.py $^ > $@,"GEN","$@")
>>>> +	$(call quiet-command, cat $^ | scripts/tap-merge.pl >$@,"GEN","$@")
>>> Paolo, did you intend to submit a new tap-merge.py script in commit
>>> 9df43317b82?
>>>
>>
>> No, it's really just y vs l.
> 
> OK!
> 
>>
>> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
>> Cc: qemu-trivial@nongnu.org
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

