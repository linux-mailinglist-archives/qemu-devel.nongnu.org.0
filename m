Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 969A7654F5A
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 11:54:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8fgc-0002G9-U8; Fri, 23 Dec 2022 05:53:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p8fga-0002G0-Dk
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 05:53:56 -0500
Received: from mout.gmx.net ([212.227.15.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p8fgY-00043X-KX
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 05:53:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1671792831; bh=eDR4df3XLaGTCCmPvLXoTPVxr7zPqo1TSlezAHocREQ=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=bbMgTtLVRMEbQTdnGwEKht5oaDVVa6v3ikhF1b9xjjGNhSjPWvkVHX8zwhuK80QkC
 dD4Y4UDvO7hvZHRS+xMRVa2E7VHLd64TQ6l6ovHiZICbak/wzqd9mYV8zNKscpU/R3
 ccWoryaQuhzO8lozl2E4dP1yy/hAs7hryncxxsr9tTSMvbQpAgYhJ15xaUlLeqm4NJ
 sVqFlWcNM3T41EvN67AEYFsOW/TkX83R5VnDt++3nTGOe6IA/lyRAccqfSvRqymLLq
 qN5qPq6C1QgYV2dB1drc7gRphIphPktO/mHc4NdvPi44Uq9Z+98zD++edGCDJ4kyRW
 ehkz0GOULb+MA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.152.212]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MC30Z-1p0jBa2JvZ-00CUA0; Fri, 23
 Dec 2022 11:53:51 +0100
Message-ID: <69357647-288c-a032-27f9-2912c6483418@gmx.de>
Date: Fri, 23 Dec 2022 11:53:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] linux-user: Improve strace output of personality() and
 sysinfo()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20221223100107.17303-1-deller@gmx.de>
 <5780556e-ef12-408d-7f8b-9104314cf9f4@linaro.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <5780556e-ef12-408d-7f8b-9104314cf9f4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nPoPdSlcHNcP0j7jjsocsA1Qjl5iPmEKN+uK0Uzq0c0ZvKRvbcg
 jhO7rIjLBnMvaVbHlq4BisZV5zy0WZxSqSnx+LMOtZU78zE2oBH7cYgTMX3mFrr3kLJ6AIr
 ZWxIN4Bv6H7J4Bhop+lql0UHLpTWaO/l5R/d/cwqwcutNZpna0KKxRixJErjbi2tSUSmLY7
 151qRzmk08IFsOdggf/IA==
UI-OutboundReport: notjunk:1;M01:P0:okOUcVgacvQ=;uqLSEYMUtEgxqJoXKGVGTaE2EBi
 DR4Bk+Pfmof9sN44/TAYQKs3045+c1DfiiZkWank0rEUEi6ozNGnfnNPMX04VZlW3CT8Pc3pC
 R1E8dnBqzpXTPw39JFpgYWT4pTVc0A0Vuixa7ANJQJZhbEOs7kXegcFWn6WFSO0hw7141747w
 r/yJKCcr8G2otutz1bVYdK9s7B0VImxo7OBpGn3ICVj8vP79RbVc6p/HqvHCqWXcln2kMj8Xp
 aMovrsc+Jk6tM2Ig/BCCik026YIfkz4HW4AcfETDZm3pYYmnNk7aCR0czsY+28fjVNPow8fMK
 lPaVmTeUTrqXvpECOl4bFMUONkDkZ4tomrjt3Ot1Pi6vB0zu1PpJN6T0Iwlwf0nRB8EIFpZcd
 9ozQSUMhlvtcIQVtwQjyGs5bWR76F3ISlf8kj4IWYeFUXHxgXcStaZC2+5Hx2jgN4Hduu8HDO
 L3oyPJiVoiUoIl1r5crgEBhvzYn5Il3XWrrFwYhYGQcmr3B9wTC1ws0CrXs1K0SHgaeU2pFkg
 qMlFvW6c3JXru51H07CEHPV9kwtnkywvbCIUSEA8cjYfMu0yeHbPysMtsENp8kLH1oApU4Wz2
 y5Myy4VT8kPB/217G6RaY0k609TPpfBTBfW9I/e0z0upuYaqDCrUP1aA0VqsuEp5MV1zxuKfU
 gB4WF/pfs3ivOHNwSe7ypSoyA54sCw+QVG25tq3bKe8j3ee9z66y67V5lN60nywLhTploM4gy
 f88eWMRbY8uqFx2GqmbiCkAzxZXcgBGinm0eXkU5Eh9zaUaeowpML/z2a42jUuYs28HNIR3M6
 /UvWnBr1FdO9foRrHotdVYc5fBEZb43n8sMwukOmdbbRc6Cos2TKOd5N2IvbyYv3SmOvuKD7O
 f/GAd1y9GLd6tGzGpmp/iwyr0KDRoeAgEdVcSDaJJJVeOPgQVhmxkm/D92m/Kvtc2pvqcGpY2
 a/+How==
Received-SPF: pass client-ip=212.227.15.19; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/23/22 11:50, Philippe Mathieu-Daud=C3=A9 wrote:
> On 23/12/22 11:01, Helge Deller wrote:
>> Make the strace look nicer for those two syscalls.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>> ---
>> =C2=A0 linux-user/strace.list | 4 ++--
>> =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/linux-user/strace.list b/linux-user/strace.list
>> index f9254725a1..909298099e 100644
>> --- a/linux-user/strace.list
>> +++ b/linux-user/strace.list
>> @@ -1043,7 +1043,7 @@
>> =C2=A0 { TARGET_NR_perfctr, "perfctr" , NULL, NULL, NULL },
>> =C2=A0 #endif
>> =C2=A0 #ifdef TARGET_NR_personality
>> -{ TARGET_NR_personality, "personality" , NULL, NULL, NULL },
>> +{ TARGET_NR_personality, "personality" , "%s(%p)", NULL, print_syscall=
_ret_addr },
>
> Shouldn't this be:
>
>  =C2=A0=C2=A0 { TARGET_NR_personality, "personality" , "%s(%u)", NULL, N=
ULL },

Basically yes, but...
it's a bitmap, so printing it as hex value (similiar to a pointer)
is easier to read/analyze.

Helge

>
> ?
>
>> =C2=A0 #endif
>> =C2=A0 #ifdef TARGET_NR_pipe
>> =C2=A0 { TARGET_NR_pipe, "pipe" , NULL, NULL, NULL },
>> @@ -1502,7 +1502,7 @@
>> =C2=A0 { TARGET_NR_sysfs, "sysfs" , NULL, NULL, NULL },
>> =C2=A0 #endif
>> =C2=A0 #ifdef TARGET_NR_sysinfo
>> -{ TARGET_NR_sysinfo, "sysinfo" , NULL, NULL, NULL },
>> +{ TARGET_NR_sysinfo, "sysinfo" , "%s(%p)", NULL, NULL },
>> =C2=A0 #endif
>> =C2=A0 #ifdef TARGET_NR_sys_kexec_load
>> =C2=A0 { TARGET_NR_sys_kexec_load, "sys_kexec_load" , NULL, NULL, NULL =
},
>> --
>> 2.38.1
>>
>>
>


