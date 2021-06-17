Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB31A3AB480
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 15:19:20 +0200 (CEST)
Received: from localhost ([::1]:49324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltrvT-0004xP-Qj
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 09:19:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ltrcD-0000l9-N0; Thu, 17 Jun 2021 08:59:25 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:55045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ltrc9-0005oS-Jj; Thu, 17 Jun 2021 08:59:25 -0400
Received: from [192.168.100.1] ([82.142.19.46]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MfYHW-1lN1uI2lC4-00g4Ci; Thu, 17 Jun 2021 14:59:18 +0200
Subject: Re: [PATCH v2] linux-user/trace-events: fix minor typo in format
 string
From: Laurent Vivier <laurent@vivier.eu>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210614144245.17660-1-alex.bennee@linaro.org>
 <17fb7318-14ba-bd77-aeaf-ad9ec33118f8@vivier.eu> <874kdwg1bl.fsf@linaro.org>
 <104b4a05-fe6f-cb58-b803-70dc8c5e50d8@vivier.eu>
Message-ID: <3005eb50-fa4b-4e10-2182-102e71f71f59@vivier.eu>
Date: Thu, 17 Jun 2021 14:59:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <104b4a05-fe6f-cb58-b803-70dc8c5e50d8@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:rMe7NfxwPtIqlEqM7zBRfqq8Gsfw/F8WX8DZBbQ5tpGkLlSSBZi
 jQqyPf3j6vkM2nKf+5lnaEAx9f+cdgYZxUYoS5CgRjvv7nbVyfTs+YCXF9GHcxREAQWNifH
 BHT1moHrJimOEC92l+r+aFAorGLmkCGzpTceK12sjUuTvcEaDRhReDc5u90Tel4yBtFcV5+
 LexvGWg0SpdD5rHsa97vA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:pjNWovph8UQ=:gashL+isvDlHppEr+TeJHn
 U1448T+QwgQ4MmjlWidViVq3mIzeSe+A4NKBWkjIohnWK2N20wGMDYbKOwkK6/oPTQn2D9owM
 rqM5y3A7T2cAzpGBjTMjX7VveZCuuhwXyk4+umE8NHumZDvSa4JH42s32k5ltGHqHOE0lFim8
 feRYOGrCoihT174120Kkyyes7DaqRgVWMzv+EZ1qOecctwSdbANYCJHzg2m90zMYjliG/oALL
 gP6cAugV8qcEQd8ElokMFft32ryUePa302mdLSVAL+azbk302FVgNMqeH820uAiHyLbdxi9JE
 G7IVm+zsZ78QVlpfa8n7n0AHQVAYEe+lvobGkDiFJXDrFdP04q1Wc7HyG2K9hIPXGtTwRkVjI
 tLc09wbwSE68fhhY07ie1fkCBBqg4MyvkCY6ZZYtr22iwMp++civePIn5bYzCvHSwr4b6HbI0
 GrwZOeBxmtVwHLobOsuYGpbSaZilstAUNkKlYTC3+tT1zopF/rcMLmcNf+Dk0Ic+M2OfQvB8H
 X5wcvg9iKlEt9bLz8JD3to=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.254,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 17/06/2021 à 14:20, Laurent Vivier a écrit :
> Le 17/06/2021 à 13:47, Alex Bennée a écrit :
>>
>> Laurent Vivier <laurent@vivier.eu> writes:
>>
>>> Le 14/06/2021 à 16:42, Alex Bennée a écrit :
>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>>
>>>> ---
>>>> v2
>>>>   - fix typo in summary :-O
>>>> ---
>>>>  linux-user/trace-events | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/linux-user/trace-events b/linux-user/trace-events
>>>> index 1ec0d11ee3..e7d2f54e94 100644
>>>> --- a/linux-user/trace-events
>>>> +++ b/linux-user/trace-events
>>>> @@ -11,7 +11,7 @@ user_do_rt_sigreturn(void *env, uint64_t frame_addr) "env=%p frame_addr=0x%"PRIx
>>>>  user_do_sigreturn(void *env, uint64_t frame_addr) "env=%p frame_addr=0x%"PRIx64
>>>>  user_force_sig(void *env, int target_sig, int host_sig) "env=%p signal %d (host %d)"
>>>>  user_handle_signal(void *env, int target_sig) "env=%p signal %d"
>>>> -user_host_signal(void *env, int host_sig, int target_sig) "env=%p signal %d (target %d("
>>>> +user_host_signal(void *env, int host_sig, int target_sig) "env=%p signal %d (target %d)"
>>>>  user_queue_signal(void *env, int target_sig) "env=%p signal %d"
>>>>  user_s390x_restore_sigregs(void *env, uint64_t sc_psw_addr, uint64_t env_psw_addr) "env=%p frame psw.addr 0x%"PRIx64 " current psw.addr 0x%"PRIx64
>>>>  
>>>>
>>>
>>> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>>
>> Are you going to queue or shall I add it to my pile of "misc"?
>>
>>
> 
> You can put it in your pile if you think you're going to do a pull request soon.
> 
> I don't plan to do a trivial branch pull request before next week.

But I'll try to do a linux-user one before...

Thanks,
Laurent


