Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6579922F9C8
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jul 2020 22:04:12 +0200 (CEST)
Received: from localhost ([::1]:52958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k09M3-0007kD-FV
	for lists+qemu-devel@lfdr.de; Mon, 27 Jul 2020 16:04:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1k09LF-0007K1-R9
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 16:03:21 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:40107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1k09LD-0006HQ-UT
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 16:03:21 -0400
Received: from [192.168.100.1] ([82.252.135.186]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MBDvU-1k54lZ2vcc-00CeqS; Mon, 27 Jul 2020 22:03:15 +0200
Subject: Re: [PATCH] linux-user: Ensure mmap_min_addr is non-zero
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20200724212314.545877-1-richard.henderson@linaro.org>
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
Message-ID: <ee0fb932-ccd9-7568-ea54-e5ef264dac5d@vivier.eu>
Date: Mon, 27 Jul 2020 22:03:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200724212314.545877-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:z4B8liKZx3FFdhqCoOhyYYZtiMtAZfTDaSYjmbVlN02j5ddu3q/
 Xs/FIZFjJfn7lA1pDiEjzhDttwgX0owOP6RPHD5X9C3DknPYVFuO6Ly4IszgW1zWNyoUAad
 Ii0SJHOsmHxCJKojFr6+Pwf2Ay0UGKrUfFezZA6tJlyCwv56DHbhTmrxsgY1K1H+ehq3iJb
 MAEQwisPq8J8lIf1oW1PA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gr74velpwNk=:5j04W0/B97dTZbZ2yonpLa
 PAM7TKZuNrlgVVxWvMuGbVVfDEMp8j8BocdXi+0sV/h7llOikoCMJIPp8JYXsQDqwZGQt5eto
 Il5GHNkiy75Ahv4k96URqFm06MlzgmfLCl5o1Iy8T1bPgUvflSfajdRv6d9P0weOhjDAEXZKr
 zRSsec/wTsBjEZB2vm5RI3UGhR/oIvccHdbHgCgeh3he5hQh/iq4GNBFkTA8T3DT2gZAA/yV/
 GnzmZVRxeCnZpJydyzvGCxJgGte49vaEsPwp8vHm0qDG2zvjBIr0kWi5XHj/OrSNdrcYo2QVl
 9eYeeWmbjw2De0oAzeCTdCZaVVk5oQFbZKUbt06Ds1rwi7ZwMytGnX3aKeD2imy9Dp/pDMJW2
 tioQMK3l/JDUxid2qd6MQ3Y/qJml2s1/KTMuA9Quh4umgkTBY8U6GdXEXrD7oLW97+GhY1VTG
 iZmgJpJ9Cwqj2JOYtp012FAkOW/D2sSHrbEmg+41dwULXkoQBlCmkuZz9DuS3DDZo7+FwJHLW
 LBx2i3Wt5aPK85Ixda2S2Nf+Y9VReS2WLhgFpZAmNm0gjEMs391dww6iotlzWYpZb8P842hj/
 WgOPXE3zM6s8gB9KfxKGb/hUUu7mAfjjAHPlTmKtwB1oWKAVHlNCxln1z23IxPSgq6bJZ48Qe
 Xb0SmaNoJVew60mCHaqf6LkiXxAU5Uu8GJWqaYfyADeFqvnQqLodNkBsQwM/f/03TGeUgeDSc
 fxiBHinhl1vuG5Us1MghYxMPohBNkatGzCpyZV3zjwewU0Tq7NZZr1w9rAaamQELMHqYrARQo
 FGRN46PlA3CIJVflxL/RvRO1wRNfVaOamGUnblnMOxppItNxv0/Zzy8HFfOh5k1pRYnyJ2/
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/27 16:03:18
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
Cc: alex.bennee@linaro.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 24/07/2020 à 23:23, Richard Henderson a écrit :
> When the chroot does not have /proc mounted, we can read neither
> /proc/sys/vm/mmap_min_addr nor /proc/sys/maps.
> 
> The enforcement of mmap_min_addr in the host kernel is done by
> the security module, and so does not apply to processes owned
> by root.  Which leads pgd_find_hole_fallback to succeed in probing
> a reservation at address 0.  Which confuses pgb_reserved_va to
> believe that guest_base has not actually been initialized.
> 
> We don't actually want NULL addresses to become accessible, so
> make sure that mmap_min_addr is initialized with a non-zero value.
> 
> Buglink: https://bugs.launchpad.net/qemu/+bug/1888728
> Reported-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/main.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/main.c b/linux-user/main.c
> index 3597e99bb1..75c9785157 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -758,14 +758,26 @@ int main(int argc, char **argv, char **envp)
>  
>          if ((fp = fopen("/proc/sys/vm/mmap_min_addr", "r")) != NULL) {
>              unsigned long tmp;
> -            if (fscanf(fp, "%lu", &tmp) == 1) {
> +            if (fscanf(fp, "%lu", &tmp) == 1 && tmp != 0) {
>                  mmap_min_addr = tmp;
> -                qemu_log_mask(CPU_LOG_PAGE, "host mmap_min_addr=0x%lx\n", mmap_min_addr);
> +                qemu_log_mask(CPU_LOG_PAGE, "host mmap_min_addr=0x%lx\n",
> +                              mmap_min_addr);
>              }
>              fclose(fp);
>          }
>      }
>  
> +    /*
> +     * We prefer to not make NULL pointers accessible to QEMU.
> +     * If we're in a chroot with no /proc, fall back to 1 page.
> +     */
> +    if (mmap_min_addr == 0) {
> +        mmap_min_addr = qemu_host_page_size;
> +        qemu_log_mask(CPU_LOG_PAGE,
> +                      "host mmap_min_addr=0x%lx (fallback)\n",
> +                      mmap_min_addr);
> +    }
> +
>      /*
>       * Prepare copy of argv vector for target.
>       */
> 

Applied to my linux-user-for-5.1 branch.

Thanks,
Laurent

