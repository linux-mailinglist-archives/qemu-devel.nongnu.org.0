Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CA934761E
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 11:29:32 +0100 (CET)
Received: from localhost ([::1]:34990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP0lX-0007y1-8f
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 06:29:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lP0kI-00074T-Ev; Wed, 24 Mar 2021 06:28:14 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:48123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lP0kF-0007cH-5x; Wed, 24 Mar 2021 06:28:14 -0400
Received: from [192.168.100.1] ([82.142.25.162]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MJV9M-1l5I2E1Kzw-00JuvS; Wed, 24 Mar 2021 11:28:02 +0100
Subject: Re: [PATCH 1/1] linux-user/s390x: Apply h2g to address of sigreturn
 stub
To: Andreas Krebbel <krebbel@linux.ibm.com>
References: <20210324085129.29684-1-krebbel@linux.ibm.com>
 <5070a253-cd95-59b0-dbdb-2eb549e9f61c@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <b48b73ee-b27b-1e3d-3387-ce818e7b0c15@vivier.eu>
Date: Wed, 24 Mar 2021 11:28:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <5070a253-cd95-59b0-dbdb-2eb549e9f61c@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:vdf2LxqzDu4NmELyKRKdZF0i4VmFVw7KOu6HhBYaohRRhjdEzA+
 kxq8LgCeEVBcWTZRsDfKcsUZ6CGyvMuSVAoHCZpg1ZEE8MnJJVthd8DyUtj8Ed3+PJ4DdhO
 k9GCF9BDzeeqqv3OkzOGH8+Auq4nBB/MY3QYH14SmkKR+69tnEVwWRZRf8+Qgce4PTUXpV1
 cM5pkKHmjfBaNgDgsvnxg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cJW3rKYgI4g=:mqHAk92x5cRFqdlXKMz6bn
 PB9h7pU3Y0EjqFGJ4gRS+GaI4v+HAgd5mo7y1/kLGr2e7FBwQ40PNAYElwjUiMUTtrYgq5AWe
 s59H2AVcsM7NwHdPJ7ed0YFX4fl78Q2uD1/Fm59oTSoD/p1HBbQ0KvhyT+0nWjYCEbQt4sXVC
 lEwhRCueSSVzNZFNcGMkKWoVGq+yRymC9JiATTJsYDCMbbot69vEVGLMYfUudUztC/OesRFYF
 0AgPBTkne3+tFwKfkhsLb4kPyNaR+PWIwziX6OSUyuvAkK/geXasFc941y6aB1bGKbLLi24sz
 lRVMnJ+rD3v9LTzHI3J2JQeUTl3lpgUeppOKED8cquSNVDNxkxGD1amNVmVktVjUQAZMSR8q7
 U8CiL5h9HAstBhUs6CYYtba7TVn6Do5OTj3i6xaLFNOSZsnN8H5yFtoYeq+JumPvUB0aIJMXz
 lmnu6w2EEZBRMeaLjpFIm+Q8s0fxJJi2bZRBJ3KK6BtKWDrsBqhZ
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 24/03/2021 à 10:17, David Hildenbrand a écrit :
> On 24.03.21 09:51, Andreas Krebbel wrote:
>> The sigreturn SVC is put onto the stack by the emulation code.  Hence
>> the address of it should not be subject to guest_base transformation
>> when fetching it.
>>
>> The fix applies h2g to the address when writing it into the return
>> address register to nullify the transformation applied to it later.
>>
>> Note: This only caused problems if Qemu has been built with
>> --disable-pie (as it is in distros nowadays). Otherwise guest_base
>> defaults to 0 hiding the actual problem.
>>
>> Signed-off-by: Andreas Krebbel <krebbel@linux.ibm.com>
>> ---
>>   linux-user/s390x/signal.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
>> index ecfa2a14a9..1412376958 100644
>> --- a/linux-user/s390x/signal.c
>> +++ b/linux-user/s390x/signal.c
>> @@ -152,7 +152,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
>>           env->regs[14] = (unsigned long)
>>                   ka->sa_restorer | PSW_ADDR_AMODE;
>>       } else {
>> -        env->regs[14] = (frame_addr + offsetof(sigframe, retcode))
>> +        env->regs[14] = h2g(frame_addr + offsetof(sigframe, retcode))
>>                           | PSW_ADDR_AMODE;

Well, it really doesn't sound good as frame_addr is a guest address (and sa_restorer is too)

Where is the code that does the g2h() you want to nullify?

Thanks,
Laurent

