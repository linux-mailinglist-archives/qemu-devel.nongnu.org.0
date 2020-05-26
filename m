Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEF61C3668
	for <lists+qemu-devel@lfdr.de>; Mon,  4 May 2020 12:06:40 +0200 (CEST)
Received: from localhost ([::1]:59552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVXzj-0002zl-Te
	for lists+qemu-devel@lfdr.de; Mon, 04 May 2020 06:06:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1jVXyC-00012s-Po; Mon, 04 May 2020 06:05:04 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:38125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1jVXy9-0001w3-W8; Mon, 04 May 2020 06:05:04 -0400
Received: from [192.168.100.1] ([82.252.135.106]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N336J-1j1KTd2mTt-013MBj; Mon, 04 May 2020 12:04:56 +0200
Subject: Re: [PATCH v3 0/9] misc: Trivial static code analyzer fixes
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200422133152.16770-1-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <d207c198-d8e9-7ca6-dd5a-56223db45cd3@vivier.eu>
Date: Mon, 4 May 2020 12:04:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200422133152.16770-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:RdBR9BuuAMP3pdzIUQfjU0Yy6eP+6DVTVntJR9iaD2Kgo1wnTS3
 qFyN7/IvytbdCNcBTeIWS/Ubdw+rWhFOX9GY443O+8ETrDDwFNnSyOo7O1U0N8N9CgtaUwf
 Z9aboQNMM/VxrbcqApX8Uur48e5KpD8CeAScXzKsppKeN8xKnuQvj7nGMNzhulRQsfgTXeD
 0y3uU0DKJBhjrWZ4J91ww==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jhIUCYqChxk=:aOOphGg51vxjpkuhf520Bv
 6HEFY6mEwApcsjGFkNk55HxQGcCFb9SoGFwuWbW+ITKoeq5f1EWQIZ0G8ZKhE5wVXMq1BucvL
 4YHC3em+sNbYfsIvHDEpEbKyx8Gji1czPxsm3i8Svzd0e0u2i9+XmRVfx+sb8LsLL35+agyJf
 ECayzpoH6vK1LFbnmGu3UDde5fcnAmuZ6zbx7ROkzHGhqNPs40gLjbPz7Aa6YtmyIcZkLzzHm
 swhTbVwB0Cw10wPFB8wKxPHu7TpcFNAH6V14bt1YIvLvEDwqKgTQ9GGFpr9oDFWLB5KqxvkZs
 FuSz+mi48g2tlxozbdIOZjaYySQFo72H32Kuerkvh9pev8mMWqJ/6LbJfvMgyDV0JU3jVVln2
 cVK9RbdAplYvbQtEO3AFvptkuMDPQytuzslmwa3isVYDUTdmRpN9ipvs9tX/eShLo6AM1FDQT
 8bjxcloP53SjoI+P5pn4ZYZfqQOskZ0A6KkK+0ZLJMPnr9qhMXl6IJmC6QznmfNWsSOlSsbKw
 eJb8KmIaNcoQkwvV8yIGAPBOpY+o7q83+paGUswE4by2pcXkYsQDly5XeOHk3RtLvJSfAutA9
 Up5x4jY+6Y8u7c/umYq1QUugJqTXKM+pEIZKgHJVMaO6x8JL6jELII1CBhvdwUOcQyWaJCEnn
 UewhsJfgheQTUSTu2QfLIl3ca295a0i/OKjGmcRkMnty0wWhC42nAqtGPLLsJwRoS4R75D4Rr
 vyYVJR668z40LFJXf8NqtwxxJX0f3HdfRaK/Okmnd51OvKSzM7byGMSuCSh8qSFu2DNvtesww
 xWR8OSE+QRlbPgRqq0N5+uowMa/o5xNrTBQ3pOpUdH1CfTApush1PY5Gxos/Y7vHC2LZsdv
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 06:04:59
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 22/04/2020 à 15:31, Philippe Mathieu-Daudé a écrit :
> Fix trivial warnings reported by the Clang static code analyzer.
> 
> Only patch #2 'blockdev: Remove dead assignment' misses review.
> 
> The official Clang static code analyzer documentation is on:
> https://clang-analyzer.llvm.org/
> 
> On Fedora I simply used it as:
> 
>   $ sudo dnf install clang-analyzer
>   $ ../configure
>   $ scan-build make
> 
> Since v2:
> - Based on lvivier/trivial-patches-for-5.1
> - Removed dup patches from Kuhn Chenqun
> Since v1:
> - Addressed Markus/Zoltan/Aleksandar review comments
> 
> Philippe Mathieu-Daudé (9):
>   block: Avoid dead assignment
>   blockdev: Remove dead assignment
>   hw/i2c/pm_smbus: Remove dead assignment
>   hw/input/adb-kbd: Remove dead assignment
>   hw/ide/sii3112: Remove dead assignment
>   hw/isa/i82378: Remove dead assignment
>   hw/gpio/aspeed_gpio: Remove dead assignment
>   hw/timer/stm32f2xx_timer: Remove dead assignment
>   hw/timer/pxa2xx_timer: Add assertion to silent static analyzer warning
> 
>  block.c                    | 2 +-
>  blockdev.c                 | 2 +-
>  hw/gpio/aspeed_gpio.c      | 2 +-
>  hw/i2c/pm_smbus.c          | 1 -
>  hw/ide/sii3112.c           | 5 +++--
>  hw/input/adb-kbd.c         | 6 +-----
>  hw/isa/i82378.c            | 8 ++++----
>  hw/timer/pxa2xx_timer.c    | 1 +
>  hw/timer/stm32f2xx_timer.c | 1 -
>  9 files changed, 12 insertions(+), 16 deletions(-)
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


