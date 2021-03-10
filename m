Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F30033434C
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 17:42:51 +0100 (CET)
Received: from localhost ([::1]:56470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK1v8-0002G4-HI
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 11:42:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lK1nI-0003dp-Hb
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:34:44 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:35539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lK1nF-000645-Ty
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:34:44 -0500
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1McXs5-1lsGc2452T-00d2Al; Wed, 10 Mar 2021 17:34:36 +0100
Subject: Re: [PULL 18/40] linux-user: Fix types in uaccess.c
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210216161658.29881-1-peter.maydell@linaro.org>
 <20210216161658.29881-19-peter.maydell@linaro.org>
 <ec051472-7511-62da-d485-17f7573aa460@vivier.eu>
 <CAFEAcA87oLDyFJovHvppa+zwO=XJoFOt3Q5V9Y5+7BU+zDQsVw@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <b87c934e-ab46-d862-7fcc-736d6e3442b2@vivier.eu>
Date: Wed, 10 Mar 2021 17:34:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA87oLDyFJovHvppa+zwO=XJoFOt3Q5V9Y5+7BU+zDQsVw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Oy7U66iEPsd+rW4/Vwys25nWt8AIK+2vVf0FaMLDQcVsM2jfD/R
 MDbMSxk75I7Pfi2E4RI46s2Zm6RBG9zuFKChUnMLuEaHRq9mpyFt8hCMTUw1h3EU5GLqP33
 sgc5qCDAkxY2cu6CXDQB9I2bJXXs8TE6zBSONGw2I6t5JK4StmQeuH7RQAZ8k74FBS4tLH+
 Etidmv/6bGcRrvA1bNA8Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4r4lwz4e894=:2InOkXSboLZcqjtQ+hRApw
 EA9+8gtk64OmNc5muTQ4Sp/6w0rkabvPx83VNJjWtOI3Wp3gYeWFpa0N2exlyVL/joBlNxkCd
 SYO3io4xcI8biLX4DpubAA4ENTqj2gsqWvMtm+buLG6xpGc012SJ0W3kFQMEerb1O+0UVPz0P
 kg9OhCIg3KQNWlNLvQE8bpFLMUYIAuoaPhEM8JARuTh246hK3o2Ut6u7FOAqbjzXMRt374xrS
 J+x0cKFhlMhKN+3YIQqDu6AZflr0AIITwnI5VpmA2OLPXHMmltuT1KH3SzblEx5h++A0RiLMJ
 T9djfkiu5M2GH5vse58wTAxrETurPdOqvJIC/juCPTrJa6AY+rLU9Myh+LU/JcUaHuXWy8eX0
 wmWpq8pWVCXvIx0yqqRPC27ADUNo2w1Ud77MRzcI4Ckq2Ch/waMl246pvP2JZ
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 10/03/2021 à 16:48, Peter Maydell a écrit :
> On Fri, 19 Feb 2021 at 09:21, Laurent Vivier <laurent@vivier.eu> wrote:
>>
>> Hi Richard,
>>
>> I think this commit is the cause of CID 1446711.
>>
>> There is no concistancy between the various declarations of unlock_user():
>>
>> bsd-user/qemu.h
>>
>> static inline void unlock_user(void *host_ptr, abi_ulong guest_addr,
>>                                long len)
>>
>> include/exec/softmmu-semi.h
>>
>> static void softmmu_unlock_user(CPUArchState *env, void *p, target_ulong addr,
>>                                 target_ulong len)
>> ...
>> #define unlock_user(s, args, len) softmmu_unlock_user(env, s, args, len)
>>
>> linux-user/qemu.h
>>
>> #ifndef DEBUG_REMAP
>> static inline void unlock_user(void *host_ptr, abi_ulong guest_addr, size_t len)
>> { }
>> #else
>> void unlock_user(void *host_ptr, abi_ulong guest_addr, long len);
>> #endif
>>
>> To take a signed long here allows to unconditionnaly call the unlock_user() function after the
>> syscall and not to copy the buffer if the value is negative.
> 
> Hi; what was the conclusion here about how best to fix the Coverity issue?

For what I know, there is no conclusion.

> To save people looking it up, Coverity complains because in the
> TARGET_NR_readlinkat case for linux-user we do:
>             void *p2;
>             p  = lock_user_string(arg2);
>             p2 = lock_user(VERIFY_WRITE, arg3, arg4, 0);
>             if (!p || !p2) {
>                 ret = -TARGET_EFAULT;
>             } else if (is_proc_myself((const char *)p, "exe")) {
>                 char real[PATH_MAX], *temp;
>                 temp = realpath(exec_path, real);
>                 ret = temp == NULL ? get_errno(-1) : strlen(real) ;
>                 snprintf((char *)p2, arg4, "%s", real);
>             } else {
>                 ret = get_errno(readlinkat(arg1, path(p), p2, arg4));
>             }
>             unlock_user(p2, arg3, ret);
>             unlock_user(p, arg2, 0);
> 
> and in the "ret = -TARGET_EFAULT" and also the get_errno(readlinkat(...))
> codepaths we can set ret to a negative number, which Coverity thinks
> is suspicious given that unlock_user()'s new prototype says it
> is an unsigned value. It's correct to be suspicious, because we really
> did change from doing a >=0 to a !=0 check on the length.
> 
> Unless we really want to audit all the unlock_user() callsites,
> going back to the previous semantics seems sensible.

I agree with that.

Thanks,
Laurent


