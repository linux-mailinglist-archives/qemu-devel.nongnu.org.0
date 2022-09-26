Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6105EB35F
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 23:43:39 +0200 (CEST)
Received: from localhost ([::1]:54686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocvt4-0005Hw-Ci
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 17:43:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ocvll-00040h-CR
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 17:36:05 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:43155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ocvlj-0005Ns-Mj
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 17:36:05 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N8XDT-1pH1ft2cUb-014WAf; Mon, 26 Sep 2022 23:36:00 +0200
Message-ID: <4d123633-4870-553f-2fca-6fcca2af8de1@vivier.eu>
Date: Mon, 26 Sep 2022 23:35:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 2/2] target/m68k: use M68K_FEATURE_MOVEFROMSR_PRIV feature
 for move_from_sr privilege check
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 richard.henderson@linaro.org, lucienmp.qemu@gmail.com, qemu-devel@nongnu.org
References: <20220925134804.139706-1-mark.cave-ayland@ilande.co.uk>
 <20220925134804.139706-3-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220925134804.139706-3-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Trqb8DKsLl6zBnEv9lA8cAKKdkA2QxgLRQU28zncPmyyE7esHZY
 YqqMrCtJJMLkLJ/FfQEea/R0FFQWlo0XvvdGjmaDRD6avhQuM1eB9f3AUHPjAjDQjeW5xYg
 bco9tQv1CSj4onezdJVGciIcECehdq3R7S7ckAFPoTrXyYGkfHSb1xSl1ocgVkwRtdiTlsi
 h6kr3rZnkQpEBKSLngKLg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jqBvgLcoxOg=:TMcjBfzj00v4OdvcvPmRv+
 774nmeoTXO9u3F1eTHqqKYc0MW7OGPw8VJHC/NqKCpmdXl9rLVJ1QWx6f7rF2WjV4fxd/Ms4m
 5ltRviz6HEUTtZiUMunP0nfG7BndRQ9XoOkU1fRGygJOvfrG1FTNR1uupHwAAnUSbC3gFzV8H
 ZUK1gvkB2Bg7fI1xJHrKtqoR0bYAR4it3sD0bBXNFXPkAPR0vvdJGdhfyeXQTEjmVL6yzmdE8
 p2ep2uFTZruiYIfb1WxSQH4SKCS670roua7KHS9SaUuJKTG3UKoknWJttUNIlc16QZhrWcx4L
 3Iy113iXuv7GUVj+hbQPtkU/53ujFL72xeHgtGlWnSITweBOb0V7aqZB5rW4Lziw99rEgP9Wk
 9y4iGHDme5V0xcEjBCbSc7lRvgVAhcTCR2UN7wi2nJfgWRkFvEjfLRlLv8h/NSiulAJyXuNSi
 f+QWV9VWxwMlfngtZAnp/ou61IYgvyAUY/z0W8Sc2cycl1uw8jW5Q0Cde6J8SH0uIVLXBgdTW
 PNdJJ+aUJaCK0Y16weqMX7LOm7tmfNXIsfEr8UoW/5BMzhjKgg40Gfvovxt6oNIwiZUfISNI/
 GhN6+wEFpSZJvS59nxk9cz5MoepDc+pURpv9LHMAdnOvHxLsAACGM1U07oxYkFk7Xtdkchv9a
 MYuYUxKfUEh5ivy9z5QLqNYnQWTVVVB8O7wwzRqVkd/dFW//rj615W+bzB/nmjEwFrkItc9Ju
 zhm9h5fFtSN2cRy0rrS87KfPeJStZ8fn4JnYtz/hsFYNd439zBNnOSwY/qhQflSk40AqpZcms
 s+Dp9S6
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Le 25/09/2022 à 15:48, Mark Cave-Ayland a écrit :
> Now that M68K_FEATURE_M68000 has been renamed to M68K_FEATURE_M68K it is easier
> to see that the privilege exception check is wrong: it is currently only generated
> for ColdFire CPUs when in fact it should also be generated for Motorola CPUs from
> the 68010 onwards.
> 
> Introduce a new M68K_FEATURE_MOVEFROMSR_PRIV feature which is set for all non-
> Motorola CPUs, and for all Motorola CPUs from the 68010 onwards and use it to
> determine whether a privilege exception should be generated for the MOVE-from-SR
> instruction.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/m68k/cpu.c       | 5 +++++
>   target/m68k/cpu.h       | 2 ++
>   target/m68k/translate.c | 2 +-
>   3 files changed, 8 insertions(+), 1 deletion(-)
> 

Applied to my m68k-for-7.2 branch

Thanks,
Laurent



