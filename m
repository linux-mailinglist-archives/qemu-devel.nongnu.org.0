Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 189205E6506
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 16:22:12 +0200 (CEST)
Received: from localhost ([::1]:41936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obN5f-0004Q8-6f
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 10:22:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1obLpH-0005cz-UL
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 09:01:17 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:37203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1obLp6-0006pt-I6
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 09:01:05 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MbjBo-1p7vQ013V8-00dEBm; Thu, 22 Sep 2022 15:00:54 +0200
Message-ID: <7f42b999-c31b-a5de-727e-506042e41c63@vivier.eu>
Date: Thu, 22 Sep 2022 15:00:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PULL 00/12] Publish1 patches
Content-Language: fr
To: Peter Maydell <peter.maydell@linaro.org>, Helge Deller <deller@gmx.de>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@gmail.com>
References: <20220920173152.199359-1-deller@gmx.de>
 <CAFEAcA8cwqSeYooqFSE4Xa1_4XCC8+gTSU9oLfNXHKE+YkDZKA@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <CAFEAcA8cwqSeYooqFSE4Xa1_4XCC8+gTSU9oLfNXHKE+YkDZKA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:75VDgX0wjHyCN+xYZvr1hPZFlBKVI7YcN94pkh5yWVvxN1a7KoP
 ITF+fFyA23yiuddOqTjh1zKWo3R14znZsP8wdMvev1PJSLI+n2EEi+SngMsuRPdsTJfyNnr
 qxoTFIu23cj0WqfENtXq2sR/FxFJsmOqkigsN6G2fr4WjgCDKhqncxC8LC4yNrj9adGumka
 /3VbHk9dbcGkvb9DebDbA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:y9ISlp7co+s=:mfv2Z+0VW2cvR5BTOfhFIf
 h4W4dwMKm/zb74S+iTJpEoSt3V7nrwSkDCJgqNOQTz4m3cy7z5ePr61N5RlGU3rgNfCZgHzBI
 rUdUiJ1f/NjYJSAgmprtxof6PYDlyX8KoZV8Vg9hz0Z0taFLREOp9IrCVsUaAQ3QcWTnJXXtr
 5YCLqvgfBvr40VT0U7H9gh7Cki40QIzNBLdA/5QaEU1bGkgcSA24AaIdnWTIwG3VPLSWt2uIe
 Plj69147hka/SY0vTsm8tsUVXY2ilwrmaLKZYyI10mAqTjvIp+j61JQKdBQuTUuCJGp+e5Xet
 imipXM4Uzm/aFp0+xddQStqgJqmpKZ2xB+HZnDfbOVblNYSExKEi67PVqi/1WCW4/rFo9cD1F
 ddf4R37ameGOkClz6t5W4xnaiMZO5Tw2Ti5kErQm1fQkl6PHDfljshNVMQ7V8nhS+43/mG5N1
 YsJiW9P4TNUiJRGX0znx5KnIfmS2BgcQ8GQb6hxJS7ji29xUXJelAhhtRz8+iV5bKFUMHrzlJ
 digZkKKKLecBi6v49BHyFEE0JA9uYBm2G0tCBO13j0TawHujjM3p+UlBykWXvhShyQAUonORJ
 RCtp3ObP4Cw0HvUKEPQ8PZdA/AG4DyxtdrdY7zGt62/x5+kl/HCwPKyYL30xZQTuDcEhbuJKn
 QVDjKOmvCED964bdTV8VWfGpuQwBnt87S49/OPueSnh0nfeMIV/BjeD8OjG8AGph4lGE4BwZw
 mfae6z2bBjlVGZcUYGuFl1tPKjEM7P4qQ4QmYa87t6OdzYhSrcHA1MzvY0uBkdZ/Ljt0Hg+Z8
 z7bwUjt
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.893,
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

Le 22/09/2022 à 11:37, Peter Maydell a écrit :
> On Wed, 21 Sept 2022 at 00:00, Helge Deller <deller@gmx.de> wrote:
>>
>> The following changes since commit 621da7789083b80d6f1ff1c0fb499334007b4f51:
>>
>>    Update version for v7.1.0 release (2022-08-30 09:40:11 -0700)
>>
>> are available in the Git repository at:
>>
>>    https://github.com/hdeller/qemu-hppa.git tags/publish1-pull-request
>>
>> for you to fetch changes up to 7f8674a61a908592bb4e8e698f5bef84d0eeb8cc:
>>
>>    linux-user: Add parameters of getrandom() syscall for strace (2022-09-18 21:35:27 +0200)
>>
>> ----------------------------------------------------------------
>> linux-user: Add more syscalls, enhance tracing & logging enhancements
>>
>> Here is a bunch of patches for linux-user.
>>
>> Most of them add missing syscalls and enhance the tracing/logging.
>> Some of the patches are target-hppa specific.
>> I've tested those on productive hppa debian buildd servers (running qemu-user).
> 
> Maybe I've missed some context in previous mailing list threads,
> but I think overall it would be better for linux-user patches to
> go through the linux-user tree; most of these don't seem hppa
> specific.

I'm sorry Peter, I think it's my fault, I didn't answer to people email [1] so they try to find 
another way to have their work merged.

I'm going to have a look to Helge series.

Thanks,
Laurent
[1] send me a private email if you want your email not filtered by my email client.

