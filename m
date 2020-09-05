Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A15B25EAE9
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Sep 2020 23:08:05 +0200 (CEST)
Received: from localhost ([::1]:43222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kEfPo-0002r0-7q
	for lists+qemu-devel@lfdr.de; Sat, 05 Sep 2020 17:08:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kEfOh-0002Pm-AD
 for qemu-devel@nongnu.org; Sat, 05 Sep 2020 17:06:55 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:51769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kEfOf-0006Dl-NM
 for qemu-devel@nongnu.org; Sat, 05 Sep 2020 17:06:55 -0400
Received: from [192.168.100.1] ([82.252.135.186]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MF3U0-1kLCpm36oS-00FWhT; Sat, 05 Sep 2020 23:06:50 +0200
Subject: Re: [PATCH] linux-user: fix ppc/termbits.h
To: qemu-devel@nongnu.org
References: <20200830181620.422036-1-laurent@vivier.eu>
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
Message-ID: <fd58993b-511e-5b05-1aae-16177bd034cc@vivier.eu>
Date: Sat, 5 Sep 2020 23:06:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200830181620.422036-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:5IuaP+TMCFF92xogSIThBzGcOScinIRprD3goXMy1enQLO53/p0
 cUu7fPyjQKaCLDo7ja3lIu8U52Uyiag/x9dJLovHZRHiOSSRP7sXvkR+OZGbZdb+5nCr0ue
 ThdO3KiNnXU6pCKMH5ROxG9VGr7SAwvAMDJ44Dm5C8vJcW8+9xZd6EMzTwxEAlWQin7imzz
 gez/sBA5e66V2yhKoiqMg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uPmCUsK4Q3o=:ClKn3bvC7ax77NsLQd1HH6
 rNVOzmBF7wPe637mMK333bTBgY/Y7d9IWtMEwNslRPxNrMdTf2gm33CI0MGMAncIZvHNwZg47
 B0OwxBgj0rrXhRorj0TxvegiI8c/WPxAF0iUvYKF2Lf3YCEePNQFUZSP4d6ZRKcoX+1bVfRY3
 Aq45LibxqmpDueyjCwcYP11QgXhaOnM/tIrU2R+YYGt4buedtIHWi7q5PSfma8oiBgL/ltCf9
 BqlROJXkcq5XBInAz3ZqCY/zCqEuKwXxR4LFeZUg64gfWcM1DO0nojnmOXaEgx8hF+72e2Sqr
 eGD2FFmcrbzkay85NL90ANlraljunecyxGTTIAyLS2Bg8bauYBec8f4rxb0egWoZhVnjPGxSE
 e+mN8GXIpyalyRGvYXJKBYXl2yb10GPvobb+LPqCllK3enNHQpaE8iZssu3ubiczWS6Qdj9N+
 D3uhqh0aLMwa3QbEqqtg+d+lmbDs6JE4wZkzXTgkX08ZmLFIU8M4ebALAUiNKcLcs/VgYcjte
 RO2f+xJ+8ynRZpSjHgDZiEiIYxD2QcomAlZnkosl5DdSAENZeuqmKmrkOsBMiz+pBs+J+uKEB
 zgO37vMq4GuTyb/Tx2ARdmctN1cvwr5sLEoXNfaDvHgj2WdJ83ywk64co5dBNZk8jeI+ioOIl
 3GljsWkXYAUbHMiwRT85EUo8sy3WgFIJu4bCK9itOhjGO3naP44Kj0WHoG9C/rHE79OMgPtLE
 ID+ndRnxJ1vXydLT2AymmQH2YTVOPCvd2C/xAXS7zwBqZIoP4aiESjBrietCsq2NRO4vzcQbk
 7kuy7RbkZD6y9nctdDK87TDD4hqvwFUiV7XATCuJOIwwQbtiGTrb2dVwd42dBrFswrbr3sO
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/05 16:41:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.107,
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
Cc: Filip.Bozuta@syrmia.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 30/08/2020 à 20:16, Laurent Vivier a écrit :
> On ppc, in termios, c_line is after c_cc, not before .
> 
> Fixes: c218b4ede4f9 ("linux-user: Add missing termbits types and values definitions")
> Cc: Filip.Bozuta@syrmia.com
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  linux-user/ppc/termbits.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/ppc/termbits.h b/linux-user/ppc/termbits.h
> index 7066d1e5523d..eb226e099980 100644
> --- a/linux-user/ppc/termbits.h
> +++ b/linux-user/ppc/termbits.h
> @@ -14,8 +14,8 @@ struct target_termios {
>      target_tcflag_t c_oflag;               /* output mode flags */
>      target_tcflag_t c_cflag;               /* control mode flags */
>      target_tcflag_t c_lflag;               /* local mode flags */
> -    target_cc_t c_line;                    /* line discipline */
>      target_cc_t c_cc[TARGET_NCCS];         /* control characters */
> +    target_cc_t c_line;                    /* line discipline */
>      target_speed_t c_ispeed;               /* input speed */
>      target_speed_t c_ospeed;               /* output speed */
>  };
> 


Applied to my linux-user-for-5.2 branch.

Thanks,
Laurent

