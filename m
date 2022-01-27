Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E67D349E356
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 14:24:10 +0100 (CET)
Received: from localhost ([::1]:48936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD4l0-00005w-0z
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 08:24:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nD4hc-0006lC-86
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 08:20:40 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:59303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nD4ha-0002pL-G4
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 08:20:39 -0500
Received: from [192.168.100.1] ([82.142.25.174]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MPXQi-1mqa2b03gQ-00Mfh1; Thu, 27 Jan 2022 14:20:35 +0100
Message-ID: <a5205eb8-7591-f922-3999-5bd7b725ec2c@vivier.eu>
Date: Thu, 27 Jan 2022 14:20:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/3] linux-user: Remove unnecessary 'aligned' attribute
 from TaskState
Content-Language: fr
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220114153732.3767229-1-peter.maydell@linaro.org>
 <20220114153732.3767229-2-peter.maydell@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220114153732.3767229-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:G5p0SbB/B59f+yB37usi4tO5tno86Kk/Y+cJJzqsG6n1wC7I+rr
 2s84h/vpVpJ9F28B0lnHqvhK1J6T1X2O92OlYd7muhVgk2nCjTbLuPb3LwiS9+EbyH96nY9
 NapFXgIs92CNKyXsVrF67sBppFujxuVh1wxq9hbnpHVRzQZ1Hzod8O5Ml50nxaoXVuejhLV
 40xz6nGhEBCw2HegxTPqQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PAhYxtyTWMQ=:Xu6TK2fr6QdMBG25Ob5XBi
 IBFxgNDG+6Am1A0VOCoqrw9E/oBKq6l9c0a8xP79dRnsTBXBQWtNMGrSib4i8TRPPhDAfTJrc
 kQ8gvahKDrZ7kf7hQy5/U47My9kEMvSBdWCb7pVRINXXU94C4mib8V2Y8+x12naxAhpsa+E9H
 PAFt4Ak6rCVh3W5tg6ped2HU9C8Li076FXpxDGl8SkBpF670fnJQmXE9LxNeOG1tpJS6q5UYY
 bEm74WSjs0G1rzr1ZJ9Ky6njkElr+ClY/WeFVVx84IMEm6YzH1rILusM7k3cq1SmL1ZzGNgg1
 8x3rwkmC7bWR1RKlJPQO2gSIs4TSY3kc8Gd7tFv2krnYSsCzDk4CStyjvUV0zRExsqREtEGvg
 4yUdOv8cMTH7XNixG+lr2M9nOFZxe7rdRI9N/XP+xTmZ8NZMhvEroehhxNNL93aLijcKNBisL
 Cp76cW7v59gTQHfPHzL9nU6miauyDwCgg70fcPK4b84+NIg3JVtGl7VvRvEzBW943+V1PRZqf
 QD3KMo+jZUCFVkP5AoaDuZwGj5hMkfVRQRyCJ9HGn1DNLmVhpMabc77TpH3krYygiEQnoWxVj
 EgHy89vouQs5rWP1DIdI19N3FMaXet1uSmuyfHOD1HmoJyo+Uuz1Iq2M+mgF5l12DmuVfmYIL
 1NBZWjI6RIES3DODzAYSeTA0zUyuRYwWn2pgwHKV2ZQX8gO3rJREnKg1qFFCzv8P6atU=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 14/01/2022 à 16:37, Peter Maydell a écrit :
> The linux-user struct TaskState has an 'aligned(16)' attribute.  When
> the struct was first added in commit 851e67a1b46f in 2003, there was
> a justification in a comment (still present in the source today):
> 
> /* NOTE: we force a big alignment so that the stack stored after is
>     aligned too */
> 
> because the final field in the struct was "uint8_t stack[0];"
> But that field was removed in commit 48e15fc2d in 2010 which
> switched us to allocating the stack and the TaskState separately.
> Because we allocate the structure with g_new0() rather than as
> a local variable, the attribute made no difference to the alignment
> of the structure anyway.
> 
> Remove the unnecessary attribute, and the corresponding comment.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   linux-user/qemu.h | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/linux-user/qemu.h b/linux-user/qemu.h
> index 5c713fa8ab2..bd0559759ae 100644
> --- a/linux-user/qemu.h
> +++ b/linux-user/qemu.h
> @@ -96,10 +96,6 @@ struct emulated_sigtable {
>       target_siginfo_t info;
>   };
>   
> -/*
> - * NOTE: we force a big alignment so that the stack stored after is
> - * aligned too
> - */
>   typedef struct TaskState {
>       pid_t ts_tid;     /* tid (or pid) of this task */
>   #ifdef TARGET_ARM
> @@ -160,7 +156,7 @@ typedef struct TaskState {
>   
>       /* This thread's sigaltstack, if it has one */
>       struct target_sigaltstack sigaltstack_used;
> -} __attribute__((aligned(16))) TaskState;
> +} TaskState;
>   
>   abi_long do_brk(abi_ulong new_brk);
>   

Applied to my linux-user-for-7.0 branch.

Thanks,
Laurent

