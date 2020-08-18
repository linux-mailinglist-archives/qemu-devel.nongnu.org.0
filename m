Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0673B248F85
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 22:15:02 +0200 (CEST)
Received: from localhost ([::1]:40938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k880a-0006of-S9
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 16:15:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1k87zp-0006PJ-GX
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 16:14:13 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:36501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1k87zn-0003i3-4m
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 16:14:13 -0400
Received: from [192.168.100.1] ([82.252.135.186]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MWBGG-1kAtyX1zpq-00XZ4Y; Tue, 18 Aug 2020 22:14:07 +0200
Subject: Re: [PATCH v3] linux-user: Fix 'semop()' and 'semtimedop()'
 implementation
To: Filip Bozuta <Filip.Bozuta@syrmia.com>, qemu-devel@nongnu.org
References: <20200818180722.45089-1-Filip.Bozuta@syrmia.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 mQINBFYFJhkBEAC2me7w2+RizYOKZM+vZCx69GTewOwqzHrrHSG07MUAxJ6AY29/+HYf6EY2
 WoeuLWDmXE7A3oJoIsRecD6BXHTb0OYS20lS608anr3B0xn5g0BX7es9Mw+hV/pL+63EOCVm
 SUVTEQwbGQN62guOKnJJJfphbbv82glIC/Ei4Ky8BwZkUuXd7d5NFJKC9/GDrbWdj75cDNQx
 UZ9XXbXEKY9MHX83Uy7JFoiFDMOVHn55HnncflUncO0zDzY7CxFeQFwYRbsCXOUL9yBtqLer
 Ky8/yjBskIlNrp0uQSt9LMoMsdSjYLYhvk1StsNPg74+s4u0Q6z45+l8RAsgLw5OLtTa+ePM
 JyS7OIGNYxAX6eZk1+91a6tnqfyPcMbduxyBaYXn94HUG162BeuyBkbNoIDkB7pCByed1A7q
 q9/FbuTDwgVGVLYthYSfTtN0Y60OgNkWCMtFwKxRaXt1WFA5ceqinN/XkgA+vf2Ch72zBkJL
 RBIhfOPFv5f2Hkkj0MvsUXpOWaOjatiu0fpPo6Hw14UEpywke1zN4NKubApQOlNKZZC4hu6/
 8pv2t4HRi7s0K88jQYBRPObjrN5+owtI51xMaYzvPitHQ2053LmgsOdN9EKOqZeHAYG2SmRW
 LOxYWKX14YkZI5j/TXfKlTpwSMvXho+efN4kgFvFmP6WT+tPnwARAQABtCJMYXVyZW50IFZp
 dmllciA8bGF1cmVudEB2aXZpZXIuZXU+iQI4BBMBAgAiBQJWBTDeAhsDBgsJCAcDAgYVCAIJ
 CgsEFgIDAQIeAQIXgAAKCRDzDDi9Py++PCEdD/oD8LD5UWxhQrMQCsUgLlXCSM7sxGLkwmmF
 ozqSSljEGRhffxZvO35wMFcdX9Z0QOabVoFTKrT04YmvbjsErh/dP5zeM/4EhUByeOS7s6Yl
 HubMXVQTkak9Wa9Eq6irYC6L41QNzz/oTwNEqL1weV1+XC3TNnht9B76lIaELyrJvRfgsp9M
 rE+PzGPo5h7QHWdL/Cmu8yOtPLa8Y6l/ywEJ040IoiAUfzRoaJs2csMXf0eU6gVBhCJ4bs91
 jtWTXhkzdl4tdV+NOwj3j0ukPy+RjqeL2Ej+bomnPTOW8nAZ32dapmu7Fj7VApuQO/BSIHyO
 NkowMMjB46yohEepJaJZkcgseaus0x960c4ua/SUm/Nm6vioRsxyUmWd2nG0m089pp8LPopq
 WfAk1l4GciiMepp1Cxn7cnn1kmG6fhzedXZ/8FzsKjvx/aVeZwoEmucA42uGJ3Vk9TiVdZes
 lqMITkHqDIpHjC79xzlWkXOsDbA2UY/P18AtgJEZQPXbcrRBtdSifCuXdDfHvI+3exIdTpvj
 BfbgZAar8x+lcsQBugvktlQWPfAXZu4Shobi3/mDYMEDOE92dnNRD2ChNXg2IuvAL4OW40wh
 gXlkHC1ZgToNGoYVvGcZFug1NI+vCeCFchX+L3bXyLMg3rAfWMFPAZLzn42plIDMsBs+x2yP
 +bkCDQRWBSYZARAAvFJBFuX9A6eayxUPFaEczlMbGXugs0mazbOYGlyaWsiyfyc3PStHLFPj
 rSTaeJpPCjBJErwpZUN4BbpkBpaJiMuVO6egrC8Xy8/cnJakHPR2JPEvmj7Gm/L9DphTcE15
 92rxXLesWzGBbuYxKsj8LEnrrvLyi3kNW6B5LY3Id+ZmU8YTQ2zLuGV5tLiWKKxc6s3eMXNq
 wrJTCzdVd6ThXrmUfAHbcFXOycUyf9vD+s+WKpcZzCXwKgm7x1LKsJx3UhuzT8ier1L363RW
 ZaJBZ9CTPiu8R5NCSn9V+BnrP3wlFbtLqXp6imGhazT9nJF86b5BVKpF8Vl3F0/Y+UZ4gUwL
 d9cmDKBcmQU/JaRUSWvvolNu1IewZZu3rFSVgcpdaj7F/1aC0t5vLdx9KQRyEAKvEOtCmP4m
 38kU/6r33t3JuTJnkigda4+Sfu5kYGsogeYG6dNyjX5wpK5GJIJikEhdkwcLM+BUOOTi+I9u
 tX03BGSZo7FW/J7S9y0l5a8nooDs2gBRGmUgYKqQJHCDQyYut+hmcr+BGpUn9/pp2FTWijrP
 inb/Pc96YDQLQA1q2AeAFv3Rx3XoBTGl0RCY4KZ02c0kX/dm3eKfMX40XMegzlXCrqtzUk+N
 8LeipEsnOoAQcEONAWWo1HcgUIgCjhJhBEF0AcELOQzitbJGG5UAEQEAAYkCHwQYAQIACQUC
 VgUmGQIbDAAKCRDzDDi9Py++PCD3D/9VCtydWDdOyMTJvEMRQGbx0GacqpydMEWbE3kUW0ha
 US5jz5gyJZHKR3wuf1En/3z+CEAEfP1M3xNGjZvpaKZXrgWaVWfXtGLoWAVTfE231NMQKGoB
 w2Dzx5ivIqxikXB6AanBSVpRpoaHWb06tPNxDL6SVV9lZpUn03DSR6gZEZvyPheNWkvz7bE6
 FcqszV/PNvwm0C5Ju7NlJA8PBAQjkIorGnvN/vonbVh5GsRbhYPOc/JVwNNr63P76rZL8Gk/
 hb3xtcIEi5CCzab45+URG/lzc6OV2nTj9Lg0SNcRhFZ2ILE3txrmI+aXmAu26+EkxLLfqCVT
 ohb2SffQha5KgGlOSBXustQSGH0yzzZVZb+HZPEvx6d/HjQ+t9sO1bCpEgPdZjyMuuMp9N1H
 ctbwGdQM2Qb5zgXO+8ZSzwC+6rHHIdtcB8PH2j+Nd88dVGYlWFKZ36ELeZxD7iJflsE8E8yg
 OpKgu3nD0ahBDqANU/ZmNNarBJEwvM2vfusmNnWm3QMIwxNuJghRyuFfx694Im1js0ZY3LEU
 JGSHFG4ZynA+ZFUPA6Xf0wHeJOxGKCGIyeKORsteIqgnkINW9fnKJw2pgk8qHkwVc3Vu+wGS
 ZiJK0xFusPQehjWTHn9WjMG1zvQ5TQQHxau/2FkP45+nRPco6vVFQe8JmgtRF8WFJA==
Message-ID: <99b9168a-ea77-14f7-27a2-b2dc6d92cd19@vivier.eu>
Date: Tue, 18 Aug 2020 22:14:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200818180722.45089-1-Filip.Bozuta@syrmia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4MZw2FqWCWRifNObCaoGB7UuIRsl4WWTsVSJiioHj2kFx8NvJH4
 7eK2PmH9MLFTtO/H+OGxR4zj+xAjAOrPd/B1MTj6UXXZy+1d+jVsNDEnPnGPen90h7Ds6ZE
 ISKzcgBEjb6FSIXhicVgTzyyym3WHyuOe/YdOIQBarepao6pfYjkSmrU9UxA7ZhMfpMWVhM
 ACeAmm5xfgxECe0umPjug==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/TJmMCZZNnY=:TMODWkV4uDaG6wp8V1nsWg
 4+C8baRQnr8hbCTkl6fkNT/qVAc4QS7kakurI2yI7HVJpC4kDr1g8vHb1jBDaDU3W5yrGxgeK
 DOKAe5Ds2fbS8489pae6q22R31JkFP0BKh1IRM9o9CNd7utEGexDRsBwXbQJz1RIFkITs0u8b
 IaJPSNrne6sr+vXPQPEeUl7Z9fEMa44wjADRy35k5Utdvk+/gSdUIwcvZh1D7sZGtHMd7XI2V
 8xCxRX183bJqFB5Y2FumhTy7rHVobu6b/KYk45SsBsZUxqSbiU0n+F6pv1rhmLQ7sAuXUe1yw
 0l5vBQVBSic/dNx86UN89370Tprxyo2yAl1qjEU6g+DSUE4kkR/pOu3Quu+30NUcY6iis89x+
 PxhsJHnltbA1Dpn1h8Y94IZbHMql7JaPjoyUdj/wYjEgS9FcqLFeXaojPcxtY7g87q5aqBVyQ
 izqI9qQPLlbyXLaYmOcgiWILKNLv39EZWnOUkjjnxc/Dgr5zXFIjF7KJmJsDdOl7AULaFnFXC
 lUlwWVcPxzbSQlzssQfquipYkKFxG6ozLr9FAmSgRPWNDxB9Nm9mUWhOHfyxk914ZrsWfdONl
 3eB+EGPnBU6qpuqfx72P6zbXqHmIA9pSUsPLoLO4E+ngr3ZP2uWL7n2MmbLbSsvNMivEOGf+3
 vHWe0ben9lT0QdK0wDhvUzVZz4+1OFQZd5iMW7eQv0CE1LUgeTys0UITB5fjnV8tP7HkYLZim
 6V0j55tvDQmtlzyUPqY2Ox/6tgl7vR9bNOAVmP/Okrj2gSao4hTY0Th9r25B/2EQ3GKArEC7N
 WjW/P3Lm5ekF84fzW0dVtdAHpSxA6ao/grhTB1FylOl9briCGj82NA1sPdicXPX64CbdLb1
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 16:14:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 18/08/2020 à 20:07, Filip Bozuta a écrit :
> The implementations of syscalls 'semop()' and 'semtimedop()' in
> file 'syscall.c' use function 'target_to_host_sembuf()' to convert
> values of 'struct sembuf' from host to target. However, before this
> conversion it should be check whether the number of semaphore operations
> 'nsops' is not bigger than maximum allowed semaphor operations per
> syscall: 'SEMOPM'. In these cases, errno 'E2BIG' ("Arg list too long")
> should be set. But the implementation will set errno 'EFAULT' ("Bad address")
> in this case since the conversion from target to host in this case fails.
> 
> This was confirmed with the LTP test for 'semop()' ('ipc/semop/semop02') in
> test case where 'nsops' is greater than SEMOPM with unaproppriate errno EFAULT:
> 
> semop02.c:130: FAIL: semop failed unexpectedly; expected: E2BIG: EFAULT (14)
> 
> This patch changes this by adding a check whether 'nsops' is bigger than
> 'SEMOPM' before the conversion function 'target_to_host_sembuf()' is called.
> After the changes from this patch, the test works fine along with the other
> LTP testcases for 'semop()'):
> 
> semop02.c:126: PASS: semop failed as expected: E2BIG (7)
> 
> Implementation notes:
> 
>     A target value ('TARGET_SEMOPM') was added for 'SEMOPM' as to be sure
>     in case the value is not available for some targets.
> 
> Signed-off-by: Filip Bozuta <Filip.Bozuta@syrmia.com>
> ---
>  linux-user/syscall.c      | 13 +++++++++++--
>  linux-user/syscall_defs.h |  2 ++
>  2 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 1211e759c2..e4d12c29d3 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -3904,7 +3904,7 @@ static inline abi_long do_semtimedop(int semid,
>                                       unsigned nsops,
>                                       abi_long timeout)
>  {
> -    struct sembuf sops[nsops];
> +    struct sembuf *sops;
>      struct timespec ts, *pts = NULL;
>      abi_long ret;
>  
> @@ -3915,8 +3915,16 @@ static inline abi_long do_semtimedop(int semid,
>          }
>      }
>  
> -    if (target_to_host_sembuf(sops, ptr, nsops))
> +    if (nsops > TARGET_SEMOPM) {
> +        return -TARGET_E2BIG;
> +    }
> +
> +    sops = g_new(struct sembuf, nsops);
> +
> +    if (target_to_host_sembuf(sops, ptr, nsops)) {
> +        g_free(sops);
>          return -TARGET_EFAULT;
> +    }
>  
>      ret = -TARGET_ENOSYS;
>  #ifdef __NR_semtimedop
> @@ -3928,6 +3936,7 @@ static inline abi_long do_semtimedop(int semid,
>                                   SEMTIMEDOP_IPC_ARGS(nsops, sops, (long)pts)));
>      }
>  #endif
> +    g_free(sops);
>      return ret;
>  }
>  #endif
> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> index 3c261cff0e..f7f77346be 100644
> --- a/linux-user/syscall_defs.h
> +++ b/linux-user/syscall_defs.h
> @@ -46,6 +46,8 @@
>  #define IPCOP_shmget		23
>  #define IPCOP_shmctl		24
>  
> +#define TARGET_SEMOPM     500
> +
>  /*
>   * The following is for compatibility across the various Linux
>   * platforms.  The i386 ioctl numbering scheme doesn't really enforce
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

