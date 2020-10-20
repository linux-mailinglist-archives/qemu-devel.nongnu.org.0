Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD1328BAB7
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 16:22:26 +0200 (CEST)
Received: from localhost ([::1]:41222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRyiX-0000MA-56
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 10:22:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kRyh3-0007fd-Dd; Mon, 12 Oct 2020 10:20:53 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:36079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kRyh1-0005JR-4O; Mon, 12 Oct 2020 10:20:53 -0400
Received: from [192.168.100.1] ([82.252.141.186]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MV5G4-1kriVG3haQ-00S9yp; Mon, 12 Oct 2020 16:20:45 +0200
Subject: Re: [PATCH] softmmu/memory: Log invalid memory accesses
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201005152725.2143444-1-philmd@redhat.com>
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
Message-ID: <a28bffcf-dcb8-b5d2-5fe9-d9fd19515d08@vivier.eu>
Date: Mon, 12 Oct 2020 16:20:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201005152725.2143444-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BfBLmUPHKMzooFGI6i7HWiSBGH/NdV2OOzBv6hAHt6qjCfoBDwv
 nGAymryaknEb0VrCbip+6FWmXYkaT6v21Sg2k9xBybY14bBiwu7KP2asAkiYqXie05Tu6HU
 tRTbi1t07VY32Ltp0cLFp/RjDKF7lU8XAFYYnWzf7QIM1vkHj0Yc+MwiCdrGD/14981/Udl
 DaRnrre+zN6MEaQ4RV4ug==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ofLw6fGvMDU=:/rdnpN89TrxECVBlOBRxLK
 7R5E6337/qxLRIjHt/NEf282pJySUfngsnQWwPGJBYMARSAbC6FQOc5o4aXTMxU4rhBp/ZK7i
 CT1AfxwNf71LaCzN04pDuZoxfcUVPfEe5QyRUAJ7tnYm4QcTTf3jr5KDz5Z0XpwGSQLZOYNnH
 Q+UifOXQg+IJSsiXsl7mDd6K6qC0FqrjvNNY1DLyrZfHNB88/ixYANBw3Hn9tkvaHf0PklR2K
 LtMH+RbrgdGqeoHEzwhKQWgB39AqPVL6kqCrQiwcNRjKfU/0xyrUHG7iG41/AILMDTMQkcjEJ
 TAbCQ/J4LjvNCo2v+otjeIgMWFKGRoLq2Vv9HtudAUBkkCWFXIhJyg1fbGhfHdIfVuavqyJMK
 BtO/cJ2O0K7OE1E4e+Do+stjVdSiPK2jmYsQ8Yr/Ghc0BMIZ6OYwv4aZHJZAjlo44F4cTDhSt
 v8WW/YFjyJN5V5uXMEV+hsQJ8ZSFFEser/0XYr3RoE1a8kWIAvp2ycX5Zzpbd7Tn/BPxExVaE
 6zAhCH22ywsxgMpxV0Q9nc8OGjTogxhmCIZpiDQ0iU1JbRqoW8tRl0ej84+yOTnOKdmurCgVp
 hdf2poElo5iBCZy9lpvoveFZ8ItOLsTqdlLM1aEqIogiiLljCj2c/xX89SryEWe2ptAskll8j
 mKZGfdcYvPrrV0qiPhf8TDrkO7Yrl0t8cF9J+oLG+Ux6bCpyX8M8MdEMcfmbNZBHDD9swEZO6
 Nih/hr2Qg0L3eY3UoCnHBaLVEv8EgfgiBAxCmEHVZC/EABV4Nx2vhdOUXgbTI1ivDEDw7P/96
 4YD3+PGjL0b7jrclV76oz7YDX0T0bXfwVa7DSXIimTr+1cXMAKQZgnRcVaTiLrfmyDE2218
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 10:20:48
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 05/10/2020 à 17:27, Philippe Mathieu-Daudé a écrit :
> Log invalid memory accesses with as GUEST_ERROR.
> 
> This is particularly useful since commit 5d971f9e67 which reverted
> ("memory: accept mismatching sizes in memory_region_access_valid").
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  softmmu/memory.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index fa280a19f7..403ff3abc9 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -14,6 +14,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qemu/log.h"
>  #include "qapi/error.h"
>  #include "cpu.h"
>  #include "exec/memory.h"
> @@ -1353,10 +1354,18 @@ bool memory_region_access_valid(MemoryRegion *mr,
>  {
>      if (mr->ops->valid.accepts
>          && !mr->ops->valid.accepts(mr->opaque, addr, size, is_write, attrs)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "Invalid access at addr "
> +                                       "0x%" HWADDR_PRIX ", size %u, "
> +                                       "region '%s', reason: rejected\n",
> +                      addr, size, memory_region_name(mr));
>          return false;
>      }
>  
>      if (!mr->ops->valid.unaligned && (addr & (size - 1))) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "Invalid access at addr "
> +                                       "0x%" HWADDR_PRIX ", size %u, "
> +                                       "region '%s', reason: unaligned\n",
> +                      addr, size, memory_region_name(mr));
>          return false;
>      }
>  
> @@ -1367,6 +1376,13 @@ bool memory_region_access_valid(MemoryRegion *mr,
>  
>      if (size > mr->ops->valid.max_access_size
>          || size < mr->ops->valid.min_access_size) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "Invalid access at addr "
> +                                       "0x%" HWADDR_PRIX ", size %u, "
> +                                       "region '%s', reason: invalid size "
> +                                       "(min:%u max:%u)\n",
> +                      addr, size, memory_region_name(mr),
> +                      mr->ops->valid.min_access_size,
> +                      mr->ops->valid.max_access_size);
>          return false;
>      }
>      return true;
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


