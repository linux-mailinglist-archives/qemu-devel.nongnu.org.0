Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 991A9415F4A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 15:13:56 +0200 (CEST)
Received: from localhost ([::1]:57398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTOXz-0001sg-DV
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 09:13:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mTOWM-0008UR-6a; Thu, 23 Sep 2021 09:12:14 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:58631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mTOWJ-0004aR-R3; Thu, 23 Sep 2021 09:12:13 -0400
Received: from [192.168.100.1] ([82.142.21.142]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MY5wD-1mLpsz35xt-00YSoO; Thu, 23 Sep 2021 15:12:08 +0200
Subject: Re: [PATCH for-6.2 0/7] linux-user: Clean up siginfo_t handling for
 arm, aarch64
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210813131809.28655-1-peter.maydell@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <cc70282b-0d50-0a05-29de-198b601a6dfd@vivier.eu>
Date: Thu, 23 Sep 2021 15:12:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210813131809.28655-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:409Wz/rV+1kaOPrJsQh9zzIOFTOgjg0jY59x8ZNJh7Zfx/3lO2P
 VxigpHrg3CZDdFHJy7Duo1YCpd+rVlJg53BtPPx351AGheeDyyspyZjvfVBxOPCUWmN+T+a
 mNO8fhbEPYzOwrkftwZFRlVt8AFukpEI/Wwme1K6jzHNnkeYt+V+pbxHsf8MSg1AyXNzn8X
 Akbvba7aaIMdO+Wv+awAw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7nwVqu+hnV4=:SR8bLxU7MNQIE3Dp3FSgN5
 UlktaqMFWNT3Y3DepdRSkcppN6CqyQDlkN6Kph9S2O+/sy8qxL7IRd+hmDq/EKCAhI/JvlYdd
 BFX4RTcOJ1W0Votr8f0QQdm13tuCsxTqwNbfnpDIFcjwgzIWRlNPUOhf5oK2vcRUC/X/6lOKy
 CoXAlvmKMVz6DS+2okiVwJ+MG4EcgWJnbEMfKBVp3FPl/hjTNV8UqwVajgkTn2mdrjkO88NQX
 YoxVWanl3bED2FsqDiZTge0Eql2cIk6tq0Wo5gLgxzM5QypwRsj9JXo7rJwECgtGwtJh7+u58
 uYY3/YTE6bAZLtXriMlm9LzG5m3Q+dv5RgI9luDFKYSKz7qNF342+5JrOREZP4Y034MA3WUmN
 cxtw07LougJ34n5izak1ZeZuQYC7xLraM3QwYw3CIWsCArz90spGV3uyHIG1M4noSWL0GCKMJ
 P+eT5h7B4u41R78pdwHaZvYVR6E369HqBHJFqqKPClK9GmCYK4+bgGOwLbiGKfBCJOoM7tOnC
 76F7jnQ1io4/SuxWiyb9N/hMfJFNwzRT5c1DPeRtiY7ndehTK7PzgbnvsPvm7CSR/aWzV9pS5
 W8cnGDsPxxJOsNzpARqrs3lWVmj0WlBxY+hhu/HfIaxS6MoKN5jwrS6dlcym75Ry0+S5IGXi/
 /8GgF/PQJ5oSGRp3cVAizg07hyE3KEujCwf0ktIraHKxssVxJdZlvjc3FvIAEcm9bpnBuFbNi
 19lHecu9NFnYLkSxisYZmFBieP5bsAkpiin1uQ==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 13/08/2021 à 15:18, Peter Maydell a écrit :
> Coverity reported that we don't set the _sifields union when queuing
> the SIGTRAP for EXCP_DEBUG events on aarch64. This series fixes that
> bug and a few others, and cleans up the way we queue fault signals
> to be less error-prone.
> 
> The underlying cause of the bug is that when queueing a signal
> the code must set the right field in the _sifields union depending
> on the si_type that it passes to queue_signal(), and there's nothing
> guarding against forgetting to do this. The "fill in a whole struct
> and then call queue_signal()" code is also a bit longwinded. In the
> real kernel, there is a function force_sig_fault() which does this
> for the SI_FAULT signal type. The series provides a QEMU implementation
> of this (which goes alongside the existing force_sig() that does this
> for SI_KILL signals), and uses it in the arm and aarch64 code.
> Because force_sig_fault() takes the address as an argument, it's
> not possible for the caller to forget to fill it in.
> 
> Obviously we should also convert the other targets where they are
> directly calling queue_signal() (there are other places that forget
> to fill in the sifields union fields; I don't know why Coverity
> hasn't spotted those). But I thought it better to send this out
> for review of the new API and approach before spending time on
> converting other targets. (In particular fixing places where
> EXCP_DEBUG handling forgets to set the sifields address is a
> pain, because in the real kernel different architectures might
> either report the PC or else report a zero address here, so it
> requires looking into the kernel sources to check which...)
> Once all the archs are cleaned up we might be able to make
> queue_signal() static so it's local to signal.c.
> 
> PS: there's probably a trivial conflict with my include-file-split
> patchseries.
> 
> thanks
> -- PMM
> 
> Peter Maydell (7):
>   linux-user/aarch64: Set siginfo_t addr field for SIGTRAP signals
>   linux-user/arm: Set siginfo_t addr field for SIGTRAP signals
>   linux-user/arm: Use force_sig() to deliver fpa11 emulation SIGFPE
>   linux-user: Zero out target_siginfo_t in force_sig()
>   linux-user: Provide new force_sig_fault() function
>   linux-user/arm: Use force_sig_fault()
>   linux-user/aarch64: Use force_sig_fault()
> 
>  linux-user/signal-common.h    |  1 +
>  linux-user/aarch64/cpu_loop.c | 33 +++++-------------
>  linux-user/arm/cpu_loop.c     | 64 +++++++++++------------------------
>  linux-user/signal.c           | 19 ++++++++++-
>  4 files changed, 48 insertions(+), 69 deletions(-)
> 

Applied to my linux-user-for-6.2 branch.

Thanks,
Laurent


