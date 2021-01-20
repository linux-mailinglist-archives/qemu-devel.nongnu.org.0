Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9BB2FD4C0
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 17:03:44 +0100 (CET)
Received: from localhost ([::1]:33512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2FxP-00049c-Be
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 11:03:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l2Fui-0002W8-Ku
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 11:00:58 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:47689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l2Fug-0004j5-34
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 11:00:56 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MpUEO-1lnifm1Ocm-00psEE; Wed, 20 Jan 2021 17:00:42 +0100
Subject: Re: [PULL 3/5] linux-user: add missing IPv6 get/setsockopt option
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210119175427.2050737-1-laurent@vivier.eu>
 <20210119175427.2050737-4-laurent@vivier.eu>
 <58abf222-2bcb-4433-7608-ebcc999a2241@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <c2a2537c-b042-9065-dac6-749815f66ba4@vivier.eu>
Date: Wed, 20 Jan 2021 17:00:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <58abf222-2bcb-4433-7608-ebcc999a2241@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:xoPXrq3dljSt+9qTeYBMXLr2/P1r34xo6mLerRPzyKOa8ptiHPn
 KpIdyaMaP+7siUeKon972+XQoSNCkxbJDfhQBfB+bNj6UmjeKPdEoDiz0xrjoKMOdNmXsma
 I1n046toDcfrg6T2ZOyjTPGHrkTHgKj+qrPYgxWwoPEArdX5NHeTp5OKHTQd3ozEDo32h3w
 b3S/+TFh/Q2mI3mlYUaDQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:v7HbTZUQvGI=:Whe8KG0LfobpOmLuaso5df
 r9f9p3/BMqPmNsY7aVsfWdZXJCpmoGNEpGQ3dPoRb98eChbAcHrVAvJ2u1nkg7Uo1E0ctgkUB
 a2AswvguAmF7z+AbXiBNqO8G7NVa8H9nyUWNpAOaC0UmWTiXbAwq4ryQXYJ5vIwS9/HKHY3F9
 tJwuX411GHtToUqsRb2AneFZU33wK5BYIOoSdQgcOgJ2LUqlTHQB9ZwWIixTun4QqluNAheJ1
 n1nokgwnaedEREtDgsUxDqVxmYmKtU6vbRjk2bMh581TXCM8IYy0Kxed0EVUWzQhE/3B4h6Bp
 Pg4kTOskj/J9Hh0G68pClt8Y4cWpoZPHXN3VYS8fFfDzHD45F1xe1SbxIjk2ie3bki35MgM40
 26wRb6MVtkb9JRPttdcScff9MCGwJDzbTGGfw81KL7CoEkf8pCc5w+FO3xMjr
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Shu-Chun Weng <scw@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 20/01/2021 à 13:16, Philippe Mathieu-Daudé a écrit :
> On 1/19/21 6:54 PM, Laurent Vivier wrote:
>> From: Shu-Chun Weng <scw@google.com>
>>
>> IPV6_ADDR_PREFERENCES (RFC5014: Source address selection) was not supported.
>>
>> Signed-off-by: Shu-Chun Weng <scw@google.com>
>> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>> Message-Id: <20201218193213.3566856-4-scw@google.com>
>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>> ---
>>  linux-user/syscall.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> index 969db2008104..70c61d15ebf8 100644
>> --- a/linux-user/syscall.c
>> +++ b/linux-user/syscall.c
>> @@ -51,6 +51,7 @@
>>  #include <sys/sysinfo.h>
>>  #include <sys/signalfd.h>
>>  //#include <sys/user.h>
>> +#include <netinet/in.h>
>>  #include <netinet/ip.h>
>>  #include <netinet/tcp.h>
>>  #include <netinet/udp.h>
>> @@ -2272,6 +2273,7 @@ static abi_long do_setsockopt(int sockfd, int level, int optname,
>>          case IPV6_RECVDSTOPTS:
>>          case IPV6_2292DSTOPTS:
>>          case IPV6_TCLASS:
>> +        case IPV6_ADDR_PREFERENCES:
>>  #ifdef IPV6_RECVPATHMTU
>>          case IPV6_RECVPATHMTU:
>>  #endif
>> @@ -2926,6 +2928,7 @@ get_timeout:
>>          case IPV6_RECVDSTOPTS:
>>          case IPV6_2292DSTOPTS:
>>          case IPV6_TCLASS:
>> +        case IPV6_ADDR_PREFERENCES:
>>  #ifdef IPV6_RECVPATHMTU
>>          case IPV6_RECVPATHMTU:
>>  #endif
>>
> 
> Building on Centos7:
> 
> ../linux-user/syscall.c: In function 'do_setsockopt':
> ../linux-user/syscall.c:2276:14: error: 'IPV6_ADDR_PREFERENCES'
> undeclared (first use in this function)
>          case IPV6_ADDR_PREFERENCES:
>               ^
> ../linux-user/syscall.c:2276:14: note: each undeclared identifier is
> reported only once for each function it appears in
> ../linux-user/syscall.c: In function 'do_getsockopt':
> ../linux-user/syscall.c:2931:14: error: 'IPV6_ADDR_PREFERENCES'
> undeclared (first use in this function)
>          case IPV6_ADDR_PREFERENCES:
>               ^
> 

Strange... this is defined since kernel v2.6.26 in /usr/include/linux/in6.h

7cbca67c0732 [IPV6]: Support Source Address Selection API (RFC5014).

Could try adding the include?

Thanks,
Laurent

