Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D087A5E93F3
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 17:27:04 +0200 (CEST)
Received: from localhost ([::1]:56550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocTX5-0007YZ-HB
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 11:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ocTVW-0005T6-BZ
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 11:25:26 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:42367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ocTVU-0006PS-PF
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 11:25:26 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MIxqu-1owlF70cB8-00KSBG; Sun, 25 Sep 2022 17:25:19 +0200
Message-ID: <cf69b8fb-f853-5927-156c-006a640e6eaa@vivier.eu>
Date: Sun, 25 Sep 2022 17:25:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 03/12] linux-user: Add pidfd_open(),
 pidfd_send_signal() and pidfd_getfd() syscalls
Content-Language: fr
To: Helge Deller <deller@gmx.de>, Stefan Hajnoczi <stefanha@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220918194555.83535-1-deller@gmx.de>
 <20220918194555.83535-4-deller@gmx.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220918194555.83535-4-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ZL4D5K2fj/XT92taCiuhzlDM0fqK7yXkxY/NKADYtaCKWv+5UsU
 NLNq0L5viilZi29knqT/JIhuZXChbOqIXgHlXY5OQQfNVsf+nboUNjIHXLEBrqKxROhBFDM
 FNHIKsXT6sXlkcbFSUHfBAiWS8jn1eXJx33X3os6h4i2NhEwJzTUr+lAKC1A1TXlsWC8xIm
 g8AGQHXYplLSyi6zkw06w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3EOu1uIfXrk=:ld5PvbXoaJmjo7e7HuOdtP
 s2CYphOGaxh9DGDM9u6Q8yGsdLmPggicsJQ5aEIyG/jWRRE2ROQH4lcf7KyRT3MCUgnBLs/vT
 t0Yw1emuffMllJwom+wiE9TfZsmIt/SXUflQoLq+kORDRjxIlU79kF6boJRU+qEO973/G7pkf
 7zvOe0GkMKiPRXHdrIP7Xl2D1jAzDOs6J2w2wWsnR2Y5PxT3urwLpGpZz8Uf1at05NG68h7x+
 5ymRxvSO2Q/emHGYmFPDESq/sNzrKZqfZpbK5/SvZnpzwrV01FJvVud6fUbpEWW49xEtFL4Eo
 WekDdOMsEh0qCbRbdjeM3Z5y7Ly9qVSkszvdupfTnt3hjf7vekj5f67taXmg94VWyuLewGkGQ
 OX4XhB5lhaLH9ci/ddaaCvSMi9vUd6ZpCHRAbAX4TOMavDmK9W7ZfuUpR3kRdr25xvuu+3+l3
 fmRvq0mTp0DgSHgljHdQhXAs22+nDhc/o2d6yXbCD1W23iSSMacPrBfWrqPhoyhBiVDVyQH8O
 R+AUSCxS7PFHMEHyk9WqMLAjjx0SQJFLJ+r1cg+XpBepAbH5KGQQjVs+mPWM2uLB2WETCM/g3
 vQ5/PJeqbsY6YqOVWyImTSPliayk5SopLCY7cD6tAa0oiSOem1r8xwZ9Ea6rfmMj1FUM0oQa0
 E42E6fiS2UtIhZqgaZF/L9rcpspepzQTBPrcDnQZ4EVyZvmn1G6lL0Mqae0roSJtCTLzK75hY
 ef9kd6+3hwuoG53GdtmmmTqM7LxPcJJlUN/Zbaw+JIUG9qjK5xzOGE8Tpv/TG3JMbo4RaPW4G
 zxogCOq
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.766,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 18/09/2022 à 21:45, Helge Deller a écrit :
> I noticed those were missing when running the glib2.0 testsuite.
> Add the syscalls including the strace output.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>   linux-user/strace.c    | 28 ++++++++++++++++++++++++++++
>   linux-user/strace.list |  9 +++++++++
>   linux-user/syscall.c   | 34 ++++++++++++++++++++++++++++++++++
>   3 files changed, 71 insertions(+)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>



