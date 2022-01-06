Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1659648634C
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 11:58:19 +0100 (CET)
Received: from localhost ([::1]:33712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5QTK-0002s3-4O
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 05:58:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n5QLc-0003Da-9I; Thu, 06 Jan 2022 05:50:20 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:51745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n5QLa-0007KF-HW; Thu, 06 Jan 2022 05:50:19 -0500
Received: from [192.168.100.1] ([82.142.12.178]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MPGNn-1mkk7i2W7x-00Pbqs; Thu, 06 Jan 2022 11:50:03 +0100
Message-ID: <99120e18-eb22-e04c-7768-8f7491757569@vivier.eu>
Date: Thu, 6 Jan 2022 11:50:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] linux-user: Remove the deprecated ppc64abi32 target
Content-Language: fr
From: Laurent Vivier <laurent@vivier.eu>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20211215084958.185214-1-thuth@redhat.com>
 <88fff234-b5c1-16e5-58ab-c3b9bc19e3b9@vivier.eu>
In-Reply-To: <88fff234-b5c1-16e5-58ab-c3b9bc19e3b9@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:OVrZYMj2Yy4K4vMCtnbO8tw6LR/SIaIXXZ+z9vcBvPts/9nQjGE
 EZZW+LB3rJTQT6JR4FpMY5koXLxad5hUiVxFmKZp9njflElmCnaUHUjZfYv9TLhHGu9g+Eh
 zeQ4jFbqx2RMo3IOJJdVz+nvAEs7kNwE3oGQQcy9hzigg3QKqTaBxnMFh9hWIefx3k9YydH
 cw+an1bJNdsFYysKHTJTg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JYNHGlkqfxE=:ZdIcYY9gw39lwIcY+7V6ah
 kEFPsNGPBLbPGFvxK9d+QbwsGreh5ttbQ9xMjQyPzxJ2LwdOzXmU1dkUddtCQUBuoajrhKqKl
 SUGsbkuzcN8o69qKH0srJFUhGa6H7KMoELM3sw0ZXp6QQ/buEevjaTPYKhlL5ragmKsk0rkxv
 lWtNd5tk3OAP9MlErjvWruW/KCE5HWf4OIcIh+fDjeZEP4XoVYaTXi03Y2/St4G4AuonoiYy0
 tw+b0davRkkAQi5UWkJejJIwOWdzwheED7ARF+JyWS9W1+isPRbEnGd7BbG6FroFn4yfzFJKf
 9Kx3/UyZWvzM/IrAaxIOODMxjh7GCI0D+aAE4RGe3I+ZoM5or2xVs5ZQlgtkSFaHzrr5hCGPC
 I3c9Ql4fe4dWpJeJ1XEJhJi67gTaQFRKiHcMau1gplAqgecTkcFaaaa1l9pgc5J/kMELj14av
 /qKe/eUld5WMfgTzKUDW6QlxwhaRyx64u7MudZIOWO73pYZM8J1vwFCAguiwmLgmg8Uo0p7bY
 bQZm7vMoMYQPD78COlOkc8Ww5/UMpznK4csic8Kv9dfFwGPi6uytea8gsV3sHDfqFW9t8Jh7i
 j+xOkLO5ca7RcwMbW4RCqudLRF8tV8GXpLekD9AX/Y9wyvIEXF2gsmMlZbo18nF4rBKyhKUgM
 em0UqLqUsawxMPdazBHSODtbGTn7mHu9EznFQMKcjtQLSLS8MjJ1L4fIceZaDHG6773c=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 20/12/2021 à 17:01, Laurent Vivier a écrit :
> Le 15/12/2021 à 09:49, Thomas Huth a écrit :
>> It's likely broken, and nobody cared for picking it up again
>> during the deprecation phase, so let's remove this now.
>>
>> Since this is the last entry in deprecated_targets_list, remove
>> the related code in the configure script, too.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   .gitlab-ci.d/buildtest.yml                    | 27 -----------------
>>   configs/targets/ppc64abi32-linux-user.mak     |  8 -----
>>   configure                                     | 29 +------------------
>>   docs/about/deprecated.rst                     |  7 -----
>>   docs/about/removed-features.rst               |  8 +++++
>>   docs/user/main.rst                            |  1 -
>>   linux-user/elfload.c                          |  4 +--
>>   linux-user/ppc/signal.c                       | 11 ++-----
>>   linux-user/ppc/target_syscall.h               |  4 +--
>>   linux-user/syscall_defs.h                     |  6 ++--
>>   .../dockerfiles/debian-ppc64el-cross.docker   |  2 +-
>>   tests/tcg/configure.sh                        |  2 +-
>>   12 files changed, 21 insertions(+), 88 deletions(-)
>>   delete mode 100644 configs/targets/ppc64abi32-linux-user.mak
>>
> 
> Applied to my linux-user-for-7.0 branch.

I've removed the patch from my series as Alex has added it to his testing/next branch.
As it modifies the gitlab CI and the dockerfiles, I think it better fits in his branch.

Thanks,
Laurent

