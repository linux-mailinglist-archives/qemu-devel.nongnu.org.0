Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D5813BED3
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 12:48:16 +0100 (CET)
Received: from localhost ([::1]:52620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irh9j-0004Do-Rt
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 06:48:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42483)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1irh8E-0003Zf-8A
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 06:46:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1irh8D-0001Nn-A8
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 06:46:42 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:48311)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1irh80-0001GM-PM; Wed, 15 Jan 2020 06:46:29 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M9Evp-1ilu6W42Xn-006PH8; Wed, 15 Jan 2020 12:46:20 +0100
Subject: Re: [PATCH] hw/input: Do not enable CONFIG_PCKBD by default
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20200115113748.24757-1-thuth@redhat.com>
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
Message-ID: <670ab2be-d6ba-1eef-fd56-e6f8df7e0085@vivier.eu>
Date: Wed, 15 Jan 2020 12:46:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200115113748.24757-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:kvfy+3kkfW2V91r9ucLOZkc0zl/6GmpBQSEztxtAEmbHqKIuxeP
 dcqU9VJpX271cMKh8dPzfRK8iNXj+NUqE3LKb2WSHEEBf7TUJCtjfyILpZGgA/DgtgOfKYs
 AQG3hgfjG0SUzk+AE74oSBVuRph38IAj6gTkWELgkQq/2FAkMVI7V33wS5i+WDU6V7KDp2P
 84u9lB3m2beOB6RR6Twuw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ThCZdMmmXd8=:PNMoScXttedZYbnq+Pkep2
 hOzAl7DJMY3JJiIBc5UuEB5hnMj8N2560NzmtYYZkgnn1czci56iomWhpb5Jl0HfxV+qxbD84
 QwYGM8Dd6tyOVxaW1xIlt/G/6bKquMqQdpf56fIpjfucc0lK/5MQ2lttct7gn0zYliOaYNfs8
 1bpkta7gCGWN/gDZX6esE9ZIKya/zIFc4O/KdrgAFSl/ZghqeCEPaF/9l6DBJ0mMDeJLKzjKy
 XQnSTeWi8Dwz/b1dt6v9q6U/1N5E1kokmCQxLEy65hlI6M78pVA3jrfMa6GdWV5tjLc7NZ2sJ
 5Klckik27j5mXgI+GL88MNw8ZQMU7iDB5eGg5M69tI1F7tES9NE82Jvz0T2KtJFM6/Jz5mLEC
 hkjp8SXM0NOlPuzZa94TMjA8Bm3wUgmL60Xqrh8x1/lo+KxrmbpBK4fNj/LvBQiE1byN6vmX5
 6z5w2x5HARMf2iv79PlXld7R+4A3EjUqa6Gttj5UNcLdthCmQyb9gvTH4NIPe9DMOKNSVNBtY
 0/jJeekCqKAnEGoBo8UV6SPkgZ478Zlh17KByz3cDwXPD3EXGfMBeN/HYK132ZSGqV9pfBlMK
 yLkOggRqI+GFVFl5VGCtTF7hJ4IexGpNTr7cCNOFB1tERecVJhRke6LZVdhDPyFe/LqOqR9u5
 J7xzTLH5CIlvR1RzObY835VPepXWoqIU8hY1nZZZwlWPNjflR5KNMF1wa1rVSdPKe2mfh8Cfs
 fWcCFTmul6BYmM1vh3oLaX36OJdop8NRf2m3/0px4ayIK5GwTj9/tpDOVpOvTQYloSvPauGA7
 VI6B9ZTEW/lcRCyUE3NrIIZrHpRX4XE40Vc4pvknJ0QSh1d5UYZAgR2HpPzdSS9c3yzoP+wHH
 juhjBuLbp6diU7K959JA==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.17.10
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
Cc: qemu-trivial@nongnu.org, Philippe Mathieu-Daude <philmd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 15/01/2020 à 12:37, Thomas Huth a écrit :
> The i8042 device is part of the chipset of a machine, so it should
> be selected by the machines or chipsets (e.g. SuperIO chipsets),
> and not be enabled by default.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/input/Kconfig | 1 -
>  hw/isa/Kconfig   | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/input/Kconfig b/hw/input/Kconfig
> index 287f08887b..a2f25725be 100644
> --- a/hw/input/Kconfig
> +++ b/hw/input/Kconfig
> @@ -7,7 +7,6 @@ config LM832X
>  
>  config PCKBD
>      bool
> -    default y
>      select PS2
>      depends on ISA_BUS
>  
> diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
> index 8a38813cc1..c7f07854f7 100644
> --- a/hw/isa/Kconfig
> +++ b/hw/isa/Kconfig
> @@ -16,6 +16,7 @@ config I82378
>  config ISA_SUPERIO
>      bool
>      select ISA_BUS
> +    select PCKBD
>  
>  config PC87312
>      bool
> 

It is also used by R4K but the Kconfig already includes it, so:

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

