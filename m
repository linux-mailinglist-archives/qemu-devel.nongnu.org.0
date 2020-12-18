Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D891F2DDF7F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 09:26:48 +0100 (CET)
Received: from localhost ([::1]:42368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqB67-0000Fj-Df
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 03:26:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqB4C-0008Fj-EK
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 03:24:48 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:37545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqB49-0007Nj-Fz
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 03:24:48 -0500
Received: from [192.168.100.1] ([82.252.144.198]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N95Nf-1k3YAY3mkh-0165EH; Fri, 18 Dec 2020 09:24:42 +0100
Subject: Re: [PATCH v2 0/8] fcntl, sockopt, and ioctl options
To: Shu-Chun Weng <scw@google.com>, qemu-devel@nongnu.org
References: <cover.1597129029.git.scw@google.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <bb068f91-d3df-1245-1798-85af33598e9a@vivier.eu>
Date: Fri, 18 Dec 2020 09:24:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <cover.1597129029.git.scw@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:3q7gvSBuRcIhKfZ06gel94Qqi3i+WhbeLbhvicTq7VUpTQw9CSO
 qqiU7TAG5ErBJ70J11KtJNXvyjhNiDFJshpbCbCXkwmBimCnhVFdq621o6cQbaAEsezq1jC
 PR0STfg4cNtwG7hyS73f4rsPamB6dMW2GmI/dji4hyMRSec1GeZTppAq628rAW49Dks/JiT
 N0UUYRPlFJA4Uf859Yx2A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ErDgR2jRq1g=:dkIx5vl+UKla/KgNuauGbp
 jAxWKSTkoeBgrdtY4cigLh5329yfERgzBwcHhXxKDullYieyzQKmVwq9MmqVzM8c2VbSV2Any
 Al2oN0TU8CHiUA9Y6za9PvjuuumbYwkZzsPD72Xm0KarnFBVrFk2F2LucC4fB3J9tRaPJvxaO
 qJ8nw9MmqLC7Kkaf2nI5Wz14WAdOpzuw0XV/i19Ral16pe03+RsdFnxJi9DMAuitPWFyaxyby
 5/WKPK/191t6qTdeMKZuMD2kqd9Iuw0K+cAB/3meyvx+4/5k5w6V1Z8ooefcLLTJTGLpo8bO6
 uWGrwStgv3rh56y7buCkstRrcM4Y4qz7srfQa2Keer+rGU+xl2aM70muPIP4aftSvh12K9+kM
 u0APEp1GVn7VWJYxgzUPydu8E1SvY7qpHDRfgbYCJuQslOlMISHTDP2t6enhP
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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

Hi Shu-Chun,

I'm sorry for the delay.

Your series doesn't apply anymore.

Could you rebase it and send a new version. I'll merge the 4 first patches.

Thanks,
Laurent

Le 11/08/2020 à 09:09, Shu-Chun Weng a écrit :
> Hi Laurent,
> 
> This is a series of 8 patches in 4 groups, putting into a single thread for
> easier tracking.
> 
> [PATCH v2 1/8] linux-user: Support F_ADD_SEALS and F_GET_SEALS fcntls
>   An incidental follow up on
>   https://lists.nongnu.org/archive/html/qemu-devel/2019-09/msg01925.html
> 
> [PATCH v2 2/8] linux-user: add missing UDP get/setsockopt option
> [PATCH v2 3/8] linux-user: add missing IPv6 get/setsockopt option
> [PATCH v2 4/8] linux-user: Add IPv6 options to do_print_sockopt()
>   Updated https://lists.nongnu.org/archive/html/qemu-devel/2019-09/msg01317.html
>   to consistently add them in get/setsockopt
> 
> [PATCH v2 5/8] linux-user: Update SO_TIMESTAMP to SO_TIMESTAMP_OLD/NEW
> [PATCH v2 6/8] linux-user: setsockopt() SO_TIMESTAMPNS and SO_TIMESTAMPING
>   Updated https://lists.nongnu.org/archive/html/qemu-devel/2019-09/msg01319.html
>   to only use TARGET_SO_*_OLD/NEW
> 
> [PATCH v2 7/8] thunk: supports flexible arrays
> [PATCH v2 8/8] linux-user: Add support for SIOCETHTOOL ioctl
>   Updated https://lists.nongnu.org/archive/html/qemu-devel/2019-08/msg05090.html
> 
> v1 -> v2:
>   Address comments on the first 5 (was 3) patches.
>   Fix style problems.
> 
> Shu-Chun Weng (8):
>   linux-user: Support F_ADD_SEALS and F_GET_SEALS fcntls
>   linux-user: add missing UDP get/setsockopt option
>   linux-user: add missing IPv6 get/setsockopt option
>   linux-user: Add IPv6 options to do_print_sockopt()
>   linux-user: Update SO_TIMESTAMP to SO_TIMESTAMP_OLD/NEW
>   linux-user: setsockopt() SO_TIMESTAMPNS and SO_TIMESTAMPING
>   thunk: supports flexible arrays
>   linux-user: Add support for SIOCETHTOOL ioctl
> 
>  include/exec/user/thunk.h              |  24 +
>  linux-user/Makefile.objs               |   3 +-
>  linux-user/alpha/sockbits.h            |  21 +-
>  linux-user/ethtool.c                   | 840 +++++++++++++++++++++++++
>  linux-user/ethtool.h                   |  20 +
>  linux-user/ethtool_entries.h           | 107 ++++
>  linux-user/generic/sockbits.h          |  17 +-
>  linux-user/hppa/sockbits.h             |  20 +-
>  linux-user/ioctls.h                    |   2 +
>  linux-user/mips/sockbits.h             |  16 +-
>  linux-user/qemu.h                      |   1 +
>  linux-user/sparc/sockbits.h            |  21 +-
>  linux-user/strace.c                    | 188 +++++-
>  linux-user/syscall.c                   | 286 ++++++++-
>  linux-user/syscall_defs.h              |  26 +-
>  linux-user/syscall_types.h             | 280 +++++++++
>  tests/tcg/multiarch/ethtool.c          | 423 +++++++++++++
>  tests/tcg/multiarch/socket_timestamp.c | 540 ++++++++++++++++
>  thunk.c                                | 152 ++++-
>  19 files changed, 2916 insertions(+), 71 deletions(-)
>  create mode 100644 linux-user/ethtool.c
>  create mode 100644 linux-user/ethtool.h
>  create mode 100644 linux-user/ethtool_entries.h
>  create mode 100644 tests/tcg/multiarch/ethtool.c
>  create mode 100644 tests/tcg/multiarch/socket_timestamp.c
> 


