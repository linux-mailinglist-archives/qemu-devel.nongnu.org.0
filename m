Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD6347A140
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Dec 2021 17:09:31 +0100 (CET)
Received: from localhost ([::1]:46316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myykc-0007cB-GT
	for lists+qemu-devel@lfdr.de; Sun, 19 Dec 2021 11:09:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1myyj4-0006xC-7H
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 11:07:54 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:47373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1myyj2-000670-Kf
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 11:07:53 -0500
Received: from [192.168.100.1] ([82.142.30.186]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MC2wN-1mmdSx2gAf-00CPzL; Sun, 19 Dec 2021 17:07:46 +0100
Message-ID: <1aacbcc4-36d1-a533-877f-c6a32694793b@vivier.eu>
Date: Sun, 19 Dec 2021 17:07:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2] linux-user: Mark cpu_loop() with noreturn attribute
Content-Language: fr
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211106113916.544587-1-f4bug@amsat.org>
 <802e3402-29b6-f312-534c-aaea97c3e9f1@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <802e3402-29b6-f312-534c-aaea97c3e9f1@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:7K05/LyGntN/nNWkQ6oQfArZ5RnqKE+Gnz8xd7mHna2S3W9xucd
 bi84FN5Dqtw6CCU4hYPpzVoR4aVlKbWCR7YPi4hL1ws+nzXCon4hfOI/O3JYCy7+c6f8HOi
 f+KAM1PWMFQjsoLxrRP+U9Q1CrCpJ+z7fpF6rFSMA29dixdz6aj4ZmxV7+QPlz9Lhpf7c9n
 sEpWHfcypPjq1bqxDiZmA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:n6+Kii6b1J4=:mpBonHErUf01wuOPPtEfq+
 hcBqYvEMP0LHj+u0i53iduP9YZoC5k+ZoVg98W4DFdzobeKEutbGiXuPZTXccR+um0XDiHyD3
 zOq46lHEJSeFCMAqhJM1j2MBPZW/yDUTQqew8cIAZcndaG0J0A9gQjwRlp3fBxaz5/bOTID6z
 Z6d+RDEfhh+59K4RlM77qdoBqOWH1ylVpBIvK/lgOljkUk1I8fwOGgN6E89RFdTMxJVhVxVPF
 5OJor51R3LrLjBlnRqnVr/+KxVQW3fMubiDaI04n+KrC02dPcM7gjd1p8wMM2cqlRpRdDdzKl
 Vo0nK4pk+l7aBtZmcFV48cKytA5gJBrtOzs3x1vEFwaL+HfeGnHvQvsKnZ9JMkNHMg3OA0rvI
 uYKiGU0FLe4h02+EAgJ2Jh2TU8h0d/TthqvB0k4WNhfAs0HBi5shMsX04nkcngOEi3r1j7M2l
 xCO1smoOOjyFspGwih9zHEEjzgH6acAVMMUo1EqrzTznv+SPxiCGtO55Qd61F6g4V0DwR44H8
 5ocx/Q65iMhP+UydbMYEMaEDItYlmRaGfrZJ/bcz7WwP136elLtCM9+th323ZQeV2FKqAmbAD
 fJop4iaBeY803OKH3Gh8Wohx6vTkdt3KEpj9nFYqAg/YVloFDswbWO5Q08NsAO1dkLWEi8EYo
 7i3ExjMEDQ42hRTe5dm+9I7A1ond+Jp4Si+Z+a7IDaxphP9qYfL87cDidksomuWR5SOo=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.563,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Bin Meng <bmeng.cn@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 15/12/2021 à 11:55, Philippe Mathieu-Daudé a écrit :
> Ping? (patch reviewed)
> 
> On 11/6/21 12:39, Philippe Mathieu-Daudé wrote:
>> cpu_loop() never exits, so mark it with QEMU_NORETURN.
>>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Reviewed-By: Warner Losh <imp@bsdimp.com>
>> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> v2:
>> - rebased
>> - restricted to linux-user
>>
>> Supersedes: <20210905000429.1097336-1-f4bug@amsat.org>
>> ---
>>   linux-user/user-internals.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/linux-user/user-internals.h b/linux-user/user-internals.h
>> index 661612a088b..c7ad00268af 100644
>> --- a/linux-user/user-internals.h
>> +++ b/linux-user/user-internals.h
>> @@ -65,7 +65,7 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
>>                       abi_long arg5, abi_long arg6, abi_long arg7,
>>                       abi_long arg8);
>>   extern __thread CPUState *thread_cpu;
>> -void cpu_loop(CPUArchState *env);
>> +void QEMU_NORETURN cpu_loop(CPUArchState *env);
>>   const char *target_strerror(int err);
>>   int get_osversion(void);
>>   void init_qemu_uname_release(void);
>>
> 

Applied to my linux-user-for-7.0 branch.

Thanks,
Laurent

