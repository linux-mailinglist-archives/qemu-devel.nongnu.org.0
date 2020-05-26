Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 989011BD875
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Apr 2020 11:39:55 +0200 (CEST)
Received: from localhost ([::1]:36332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTjC6-0005Dr-El
	for lists+qemu-devel@lfdr.de; Wed, 29 Apr 2020 05:39:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34696)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jTjBH-0004hK-BY
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 05:39:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jTjBG-0005Ct-F1
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 05:39:03 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:46061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1jTjBF-0005Bg-PZ
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 05:39:02 -0400
Received: from [192.168.100.1] ([82.252.135.106]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MG9c2-1jOH7j2MKS-00GdIu; Wed, 29 Apr 2020 11:38:56 +0200
Subject: Re: [PATCH 2/2] target/m68k: fix gdb for m68xxx
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1588094279-17913-1-git-send-email-frederic.konrad@adacore.com>
 <1588094279-17913-3-git-send-email-frederic.konrad@adacore.com>
 <d565528d-426f-bf00-5974-5653eaf5cd25@vivier.eu> <877dxyljxg.fsf@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <d3e2bc6a-2f2a-c1ef-00f2-213c91e1ae9c@vivier.eu>
Date: Wed, 29 Apr 2020 11:38:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <877dxyljxg.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2Hn/vA/Ahtv42SM1VeyKpWZk0etWUNT06VuKWtrkBzKOzhhNmpg
 2StjuFevMb6t/gDye6+iSTx99POv6jVIb9dvauYmocjxIu4IYt9hmDMVHIEdOcb6WvM8hWa
 79AG/8cgW5vqTp19ZKaEbmRXtofG+wqsN5uWeN0tszBxEUF/XvWvCGuPLT/aFMJVacpJpXf
 6oq+tUF5hhxLyCqpMY6gQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PKLstXCAWtE=:zX11Xocg+I3yzXCYodBXb0
 xCUEP/pfShwIZBfNtEO+TUhC56smo7+64cPPW8qZ5df/JrQmIXj9Q1Z1D5Fn2v7hg2s3V5mig
 VcxPrxaPlUdsZb37yugYqJqEs1Rk07ohnlKoc0NARCrlTbj6/OKIlpGQ1QtU0GPPm2OZ9L8fi
 l147IKtVatrGAfomGlhIF7FZ2cYESG+EkGFYHgQ9pTIKbZZHxLRJV7Frn5z/cpcDA40x5c3SH
 XEGmSxLPmDPxdOsHmgmPJE2vZqcQTevKYZqF/xmICdL1huzA1nItZ7AQOe4R3auKCTdybd5vq
 1EmJ8dm55OCwyn75SVoQB/mVbhpiB8p5erFSiqhxPSJjIBvAr/FZrfJyYgq+5Df8QchYArc3G
 XGMvNOeGtt80dfs8wtE1b5nz2hBXtnCUsLpc4M9Mo4VK2DEsghtjjhaCwxEozpRVGiUIK8vu8
 H5Bl8ut4BriGruN3N0TKZL0SEiOJPc5FfAnr9RKDjybjnYK811KTxFqo93f7je79QNo87UAXr
 mT9GrbkfRExSkgx5UoJR/NUJFUha0wY7wh7Myd9D6lD6HC1EfGS4/9EkjtAni/7lnsH5R1+ls
 shdxG4DWbhVbEqQ3ONd5P4pgGY2cxvYd0wRNsnNfHKdYXLc63sW31PM0H5ClLO6j7JsbSUA7k
 jmbwo6b4uDavQMCdsLfux0VOWDVK1dn3mzNGWx2EJ0rm4N98SK8917boJo9GdKx3RYu0EImBm
 2GOeGaZ7/rD2F8PyKH9JkRULi2BJYmCNHsd6nvJUT6PmQf9z6iByioUsPHOkCxbbgjHyFAcF6
 tNGcmkcY3R7KKA8l5pn2dXAQgd6qAP8IcCTxa27Y7B+Fxxk7WvdiMn5bGQJFR4gBhIdy1FK
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 04:48:56
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Received-From: 212.227.17.10
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
Cc: KONRAD Frederic <frederic.konrad@adacore.com>, philmd@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 29/04/2020 à 11:28, Alex Bennée a écrit :
> 
> Laurent Vivier <laurent@vivier.eu> writes:
> 
>> Le 28/04/2020 à 19:17, KONRAD Frederic a écrit :
>>> Currently "cf-core.xml" is sent to GDB when using any m68k flavor.  Thing is
>>> it uses the "org.gnu.gdb.coldfire.core" feature name and gdb 8.3 then expects
>>> a coldfire FPU instead of the default m68881 FPU.
>>>
>>> This is not OK because the m68881 floats registers are 96 bits wide so it
>>> crashes GDB with the following error message:
>>>
>>> (gdb) target remote localhost:7960
>>> Remote debugging using localhost:7960
>>> warning: Register "fp0" has an unsupported size (96 bits)
>>> warning: Register "fp1" has an unsupported size (96 bits)
>>> ...
>>> Remote 'g' packet reply is too long (expected 148 bytes, got 180 bytes):    \
>>>   00000000000[...]0000
>>>
>>> With this patch: qemu-system-m68k -M none -cpu m68020 -s -S
>>>
>>> (gdb) tar rem :1234
>>> Remote debugging using :1234
>>> warning: No executable has been specified and target does not support
>>> determining executable automatically.  Try using the "file" command.
>>> 0x00000000 in ?? ()
>>> (gdb) p $fp0
>>> $1 = nan(0xffffffffffffffff)
>>>
>>> Signed-off-by: KONRAD Frederic <frederic.konrad@adacore.com>
>>> ---
>>>  configure             |  2 +-
>>>  gdb-xml/m68k-core.xml | 29 ++++++++++++++++++++++++++++
>>>  target/m68k/cpu.c     | 52 ++++++++++++++++++++++++++++++++++++---------------
>>>  3 files changed, 67 insertions(+), 16 deletions(-)
>>>  create mode 100644 gdb-xml/m68k-core.xml
>>
>> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> 
> Are you going to take this through your tree or do you want me to add it
> to my small pile of gdbstub fixes?
> 

Please add it to your pile.

Thanks,
Laurent

