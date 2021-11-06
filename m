Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1701446EFC
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Nov 2021 17:35:02 +0100 (CET)
Received: from localhost ([::1]:52308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjOej-0005n7-6p
	for lists+qemu-devel@lfdr.de; Sat, 06 Nov 2021 12:35:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mjOdX-0004x3-2P; Sat, 06 Nov 2021 12:33:47 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:49347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mjOdU-0006V8-Rk; Sat, 06 Nov 2021 12:33:46 -0400
Received: from [192.168.100.1] ([82.142.14.190]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mae7u-1mBhVq3dbG-00cAQk; Sat, 06 Nov 2021 17:33:37 +0100
Message-ID: <addd8778-e14f-a185-26d2-0b9acb57e0a3@vivier.eu>
Date: Sat, 6 Nov 2021 17:33:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] meson: Fix 'interpretor' typo
Content-Language: fr
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20210521103423.2780345-1-philmd@redhat.com>
 <7d9abdeb-575d-3ec5-904b-bc676313ca14@vivier.eu>
 <CAP+75-U0wK7BKxFywWr8tWUbZ-nc5W8cdcOWM=gPp162gPAtiQ@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <CAP+75-U0wK7BKxFywWr8tWUbZ-nc5W8cdcOWM=gPp162gPAtiQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Q8SWsts1Bw4PUuaUMXvLres0+zuDsoQI3oRVyFo+WLTHnGI05hs
 r7295r7PE+vL3Qt5hd3bxyIDC95wZORQWCI7ORFkISk9iUGfxwW92RIqe2SI280EkeT4axD
 GrsO7hSpCpgNmoS4jJR6gGkHydVemLF49pYnTTWGdy8/4AoVe+YzH1IPAlTM/VT6hGLwDzr
 XnlE9zNhHyqlU/9NzIFlQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YWxDH4oxZ/g=:Fuoq+o2hlsVVUr5TqM5BS1
 5q70YVpznDmmqYab+ftBMvG1e6wkBnl/gp8PMfE6GW+OkX0Nu/H7yvn2DIY3Mwu7DHgB5rO8g
 YP9hZx4Oz4jkjX02zeWmhYwbcEgn+x2AU57h/aUizcqartdHa37+pPIr5FRDJH8Z2r9rdODCC
 Cr5aiJSDGYvTT9S6YY81tu2IqFHS7mIVkVILqNa1CHqQSLblJ2RPz4rzfdPA1TfWtiE1Hqyt3
 xfqHdREDq6Qspv74xp/XJNV7RqhnYuVrl+3Ba5CLJLV2pnvZon6qRE/Wa+SHwn4dZLFG+hmFE
 E8oB14Z+0b0QFMDmeZ/DwWEUzqiuZiJIdTiPhpZ6y4Wh/CTTPl6MwSNfvdNMiU/vtPrwhi6QD
 IlDZQoj79NJWti0UbZBn5tOC6OR/2e0eBAcKUjigg3ga/cIYFZjNBfNbjP/AjnLP/V/CsqcZ0
 D8yNXKEYEpi0khd0/tbunqyC42EdUKJHY1V1SxJ26X+3kVHmbWqqxNojdVRtMGMgKH6YlBtVK
 bzt5N90TfZh0Whh3rBSSvTxLPY2rcZl9t+ItXjDIiGWNaL/DiKYCfvYTllfPbMI4iZyG6T8Wc
 spsrprs26oY/do5O3LG6md8SXmMo3vj10EwNQ4rlTflGK9N7tMdMQYAtxREQKwUyLNjYhHrgo
 PPJWSjwQiZuiVeAMEgNW2Z04jUTzUUU4NOkw+LbPlO5RgG77Jpwl6uGxGAWwKig6ejxU=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.407,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 06/11/2021 à 15:53, Philippe Mathieu-Daudé a écrit :
> ping...
> 
> https://lore.kernel.org/qemu-devel/20210521103423.2780345-1-philmd@redhat.com/
> 
> On Sat, Jun 5, 2021 at 9:03 PM Laurent Vivier <laurent@vivier.eu> wrote:
>>
>> Le 21/05/2021 à 12:34, Philippe Mathieu-Daudé a écrit :
>>> Fix a typo from commit fa2f7b0b9b7 ("meson: Warn when TCI is
>>> selected but TCG backend is available").
>>>
>>> Reported-by: Peter Maydell <peter.maydell@linaro.org>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> ---
>>>   meson.build | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meson.build b/meson.build
>>> index 1559e8d873a..230a0e4b558 100644
>>> --- a/meson.build
>>> +++ b/meson.build
>>> @@ -247,7 +247,7 @@
>>>         error('Unsupported CPU @0@, try --enable-tcg-interpreter'.format(cpu))
>>>       endif
>>>     elif get_option('tcg_interpreter')
>>> -    warning('Use of the TCG interpretor is not recommended on this host')
>>> +    warning('Use of the TCG interpreter is not recommended on this host')
>>>       warning('architecture. There is a native TCG execution backend available')
>>>       warning('which provides substantially better performance and reliability.')
>>>       warning('It is strongly recommended to remove the --enable-tcg-interpreter')
>>>
>>
>> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>>
> 
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


