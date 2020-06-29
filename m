Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 719C920CE1F
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jun 2020 13:18:02 +0200 (CEST)
Received: from localhost ([::1]:58524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jprnV-0007Ni-FR
	for lists+qemu-devel@lfdr.de; Mon, 29 Jun 2020 07:18:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1jprmC-0006TA-To
 for qemu-devel@nongnu.org; Mon, 29 Jun 2020 07:16:40 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:35467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1jprm7-00011G-CR
 for qemu-devel@nongnu.org; Mon, 29 Jun 2020 07:16:40 -0400
Received: from [192.168.100.1] ([82.252.135.106]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M9Ezx-1jmr6W2apz-006M5U; Mon, 29 Jun 2020 13:16:31 +0200
Subject: Re: [PATCH v3 0/2] Add strace support for printing arguments for
 ioctls
To: Filip Bozuta <filip.bozuta@syrmia.com>, qemu-devel@nongnu.org
References: <20200619124727.18080-1-filip.bozuta@syrmia.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <d10fca2a-41f9-52d3-3448-15aad2b24f1f@vivier.eu>
Date: Mon, 29 Jun 2020 13:16:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200619124727.18080-1-filip.bozuta@syrmia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:otPuEZwSKFA3zDEwzK+89RgtJxjgbfovvv/HlpW+k8C4Ml3Yxyv
 02FVI5dh+qPhN2dB7V46I7ZuQ7LRiTj7CM1bn1m1i54kReeSvzSLAJ3NBsaUub4qKcj86KI
 fZJ/NHiG/KcF7Ha6S/9IEW+/1oT8F/7C/WXznnlgNkKAxhQ+aipUQ1psg1OoAtMxQrlyNXc
 lbmmc5h8YP4BXqlh1lG0w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qqu6FUD7cNs=:SChkmlyqoCJPcvRI0/9JGH
 6xUXqoqJp3gCiLAEYQKPs7/Ag2NFQnKReCpQ5KoK21dPuMT/Hui+1bf+XLfB+j0xa00hkgJeq
 B2IZh2x64og+Wc3emgISK892pBh2IxPiVeM93p/fat+55Exy/xH5B0g17/CjM9SenwzCcRuWL
 44r1rSi5zLKIFYcZJSl4qwxQSTbUf798+gpxCTADDjTn8jsVv8vQcA/iPSfeArP3e7VNDwzDQ
 eUfVj0I5bvPIL3LJ1mPu2361J73z+LmdBwKNWldJTDA5MOyU7t4EJBYcP8i6WY8rZVqMbk7s8
 dea4+gWX3G0ZQIzlPTDekdM8un/QvVPxBza5OslqQGJklbQe01z17YJi9JgnEgnEb4Ls/t7Sr
 2Qbx/bBWzKmykbEeoTZaC+jQM6i6fzJBT7mc0pVffMRksTtSy8hWhq1qoxALZFd79fJGgtdZA
 o2Nj3rPCPg49dIyJRXCW4p+a+habIQPkkXfc7k+gYPxfcRjhub3hb7DdTXMr3UxvurSYJCt1f
 xttaKtIOpf24GOJdtNyBKv1QlSRinybw2n9qt/hP2yFkWqnE75eF1Ne9qeeIyyZlavUW5vyod
 FtsJLMhWbM4C5yWpO7CWnXnCr/ZZxTWX/EYFfC450PDvhrMBWkT6a1+VF+AsiNv/YRSBe/LnN
 c0w7oWRCkYDXZ7tct+EVMfMvDfSib8rQsxU/6Pt0dwrmNXTN0KQEaVm6vQnLyiyNdlo2o1YaF
 g2vLqBD3OXPFwGRM90NMGbi2UuRlbwXalv/UiijK6snDJPRAM65FZkgh1XBRDYbccR+L7yKl9
 lTBkoHfVkB05FktxlxwTY728HbkzujAVAdhNjlJilRHXNOS6LI4dIB1sZT90Z+RLgV0Vkvz
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/29 07:16:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=_AUTOLEARN
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
Cc: riku.voipio@iki.fi
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 19/06/2020 à 14:47, Filip Bozuta a écrit :
> From: Filip Bozuta <Filip.Bozuta@syrmia.com>
> 
> This series introduces the functionality in strace to print arguments for
> ioctls. This is gonna be a useful adittion as it indroduces a good debugging
> and diagnostic mechanism for user programs cross compiled for different
> architectures.
> 
> The first patch in the series introduces missing thunk argument types for ioctls
> SIOCGSTAMP and SIOCGSTAMPNS needed for strace argument printing. The second patch
> introduces the argument printing functionality. The implementation details are
> described in the patch commit messages.
> 
> Testing method:
> 
>     Mini test programs were written that run ioctls that are implemented in qemu.
>     These programs covered different varieties of ioctls. Some covered rtc ioctls
>     with both basic argument types (like RTC_IRQP_SET and RTC_IRQP_READ) and
>     structure types (like RTC_RD_TIME and RTC_SET_TIME). Some covered loop ioctls
>     LOOP_SET_STATUS and LOOP_GET_STATUS that use "struct loop_info" which contain
>     special types olddev_t (in qemu presented as OLDDEV_T). Some covered alsa timer
>     ioctls like SNDRV_TIMER_IOCTL_GSTATUS, SDNRV_TIMER_IOCTL_STATUS which contain
>     complex third argument types (structures that contain other structures and strings
>     as fields).
> 
>     Programs were compiled (sometimes using cross-compilers) for the following
>     architectures:
> 
>         * Intel 64-bit (little endian) (gcc)
>         * Power pc 32-bit (big endian) (powerpc-linux-gnu-gcc)
>         * Power pc 64-bit (big endian) (powerpc64-linux-gnu-gcc)
>         * Mips 32-bit (little endian) (mipsel-linux-gnu-gcc)
>         * Mips 64-bit (little endian) (mips64el-linux-gnuabi64-gcc)
> 
>     All applicable compiled programs were in turn executed with "-strace"
>     through QEMU and the strace printing results obtained were the same
>     ones gotten for native execution.
> 
> v2:
>     * Removed case TYPE_LONGLONG, TYPE_ULONGLONG from print_ioctl()
>     * Changed error printing in print_syscall_ret_ioctl() to use
>       error printing function from another series
>     * Added and #ifdef directive in "syscall.types.h" to manage the
>       case when the "u_sec" filed in timeval structure is of type int
> 
> v3:
>     * Moved "Based-on" tag to cover letter
> 
> Based-on: <20200619123331.17387-1-filip.bozuta@syrmia.com>
> 
> Filip Bozuta (2):
>   linux-user: Add thunk argument types for SIOCGSTAMP and SIOCGSTAMPNS
>   linux-user: Add strace support for printing arguments of ioctl()
> 
>  include/exec/user/thunk.h  |   1 +
>  linux-user/ioctls.h        |  12 ++-
>  linux-user/qemu.h          |  20 +++++
>  linux-user/strace.c        | 107 ++++++++++++++++++++++++++
>  linux-user/strace.list     |   3 +-
>  linux-user/syscall.c       |  20 +----
>  linux-user/syscall_types.h |  22 ++++++
>  thunk.c                    | 154 +++++++++++++++++++++++++++++++++++++
>  8 files changed, 315 insertions(+), 24 deletions(-)
> 

Applied to my linux-user-for-5.1 branch.

Thanks,
Laurent

