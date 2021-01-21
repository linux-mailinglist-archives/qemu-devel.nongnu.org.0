Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5839F2FE862
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 12:09:26 +0100 (CET)
Received: from localhost ([::1]:34772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Xq9-0000Ay-EQ
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 06:09:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l2Xo4-00072A-S1
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 06:07:16 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:55029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l2Xo2-0006uM-9g
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 06:07:16 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N49Qd-1m1tvy2EVt-0100e6; Thu, 21 Jan 2021 12:07:11 +0100
Subject: Re: [PULL 0/5] Linux user for 6.0 patches
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210120195317.84222-1-laurent@vivier.eu>
 <CAFEAcA_jGAWW=3YxJirzOGosLrrgoXhpWHELeJnGJT3u=TPxcw@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <a3565e8c-1e4e-6544-1784-37a5d2cd33ab@vivier.eu>
Date: Thu, 21 Jan 2021 12:07:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_jGAWW=3YxJirzOGosLrrgoXhpWHELeJnGJT3u=TPxcw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:E1tEyPRayrpq+c+TPOZOdB2Cu+hqhh2glvRtYlhmZj5xgXDWXnC
 7syQEceDbx6Z3lzcl3MXH5Gx/rpldyc/OKgHM08GuUGX4nsOWrrM+KGNjHrC2MbVBoQ4Qiy
 028a/JVkYOSE1LYtkeMbuP4Zfz35NSme8LipyqDPPGsc6DbzLSHmtOYkCaohe5I5Iiw1NOY
 6MiKKOxSmNitVFRL2oSUA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wz/Qb/smFuM=:yePInUTIddRPBUHng0iWii
 5c5HlDQtKEgP6tEhgoonPqDhrG9AdH7kshiZ8Alv0XwLXthahvBEZZlZopvpYQSF7t757UxkG
 ZuhOiGF2cu5aOunmOUaVCNp3GseYDZUdLj7OvUt+9ieB2YHkWnR28VUFiJdoYyan0ytcDmOOL
 7vPW1wncP/Lcm70/mFPSp9B7ogOkV4IcLDz/mSKaasyQ+OL2PLauEP0DYE/7ZiUGwfanc8+J6
 fcG6hv9UpxAMS6YCHBLooQoSbbak36mD7t6we3i/iZjAoRf6VgYtGeJ1mucgPF/WIAdWqyFfj
 Mjbfw11gnlfVVig92Bot2D4XRlO3Sju6bKf2BSjmQI53G7RyWKpFMo+b3i34ccLvQZlMdmvJp
 dL3gLfIUQ3sp7KD7Ri/dkZVN//F9nC7A26K8DmyFiHw4z/5cnVkMy5QjfjLqEcXqzcMpiaKVi
 OZxk8J4a7g==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.094,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 21/01/2021 à 11:44, Peter Maydell a écrit :
> On Wed, 20 Jan 2021 at 19:56, Laurent Vivier <laurent@vivier.eu> wrote:
>>
>> The following changes since commit 48202c712412c803ddb56365c7bca322aa4e7506:
>>
>>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-2021011=
>> 9-1' into staging (2021-01-19 15:47:23 +0000)
>>
>> are available in the Git repository at:
>>
>>   git://github.com/vivier/qemu.git tags/linux-user-for-6.0-pull-request
>>
>> for you to fetch changes up to 8a7e49050b8d5477a567b0ec5d764a564481abdb:
>>
>>   linux-user: Remove obsolete F_SHLCK and F_EXLCK translation (2021-01-20 18:=
>> 26:46 +0100)
>>
>> ----------------------------------------------------------------
>> linux-user pull request 20210119-v2
>>
>> Remove obsolete F_SHLCK and F_EXLCK translation
>> Update sockopt
>> Add F_ADD_SEALS and F_GET_SEALS
>>
> Now fails with:
> 
> ../../linux-user/strace.c: In function ‘do_print_sockopt’:
> ../../linux-user/strace.c:2831:14: error: ‘IPV6_ADDR_PREFERENCES’
> undeclared (first use in this function)
>          case IPV6_ADDR_PREFERENCES:

Probably the same cause, in a different file.

This should fix the problem.

diff --git a/linux-user/strace.c b/linux-user/strace.c
index bc3bb6b2f949..7b43668b9b0e 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -11,6 +11,7 @@
 #include <netinet/udp.h>
 #include <linux/if_packet.h>
 #include <linux/netlink.h>
+#include <linux/in6.h>
 #include <sched.h>
 #include "qemu.h"

I will try to reproduce it before re-sending the PR.

Thanks,
Laurent

