Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 133B7185180
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Mar 2020 23:06:19 +0100 (CET)
Received: from localhost ([::1]:38316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCsRe-0004HU-5i
	for lists+qemu-devel@lfdr.de; Fri, 13 Mar 2020 18:06:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57716)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jCsQu-0003rg-Eg
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 18:05:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jCsQt-00017G-B7
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 18:05:32 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:56117)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1jCsQt-00014v-1n
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 18:05:31 -0400
Received: from [192.168.100.1] ([82.252.135.106]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MrPVJ-1jhabs2P1b-00oXvH; Fri, 13 Mar 2020 23:05:23 +0100
Subject: Re: [PATCH 0/4] linux-user: generate syscall_nr.h from linux unistd.h
To: qemu-devel@nongnu.org
References: <20200310110759.3331020-1-laurent@vivier.eu>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <480afbc7-16b0-24dd-832d-dfdd7acdeb96@vivier.eu>
Date: Fri, 13 Mar 2020 23:05:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200310110759.3331020-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:e6HW5M7U5irLPjXQHJ2Bp/uqLSN0ly2BABZ1Fw+ocYiyjLd6f0y
 rprtg+u4BI6JKO4JhJOMDm9jKMAfxpiyypAn35lcsFZz/UMs1gDNj+uWuMb5ZGg7x4ipcTS
 LRz6Qz7EtirwFIDAS501b5wic7ruORUM1Ta17jXQ2nU3VWJRYwCJg8xQislFF87g+o+TdPQ
 yKMGCIWIjdAXj6chzZekw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8peiMimp78k=:alqGsc9bCGnAGQUIxqHfbz
 7HUkqdOUfSqQjh24lUks8MlykUgn79UTBQHv7ZOzrBDmdnivHc6dmqhIz9imJK+pbhpM+7QCi
 uWgagVb1JIHuSwo4BuX+WMygDfD7FAajfJAlKJVCgKKRMGBotgD8DAzPC02WuFuyf3qSxZmx8
 A6XE7SsvLshJiIRzvtSrFQkO33GKZIAYfiY1a5gajFU/c9Q3zIQSnzR4rpMBP9EVsHzjyFmjc
 MmZwPoGYcxKihLV1QOzwpqIOYD2uorjHsrkwWGYbaU8H3hfOmCuVGs//2NeZfF1UMedIWVssM
 GIaedmV+sHOGLrwZCfnRySMQPVQ2kxnZUn68a8pxBzfu3YeqqTvIOsbGRJA5kUuJ0z69knw3V
 fhC15d1cmtb4diIDdiAL5Ut4/G6kpJb3G2MhGmL/5jx86o7q4w/y6angcoi4tgm+kFOo7FkrT
 T2UQUhqtiwxv7z5ydLi43T0lmiDbSP0yFy1/TRY1CpFZioxs7pfJ9F+YeXkUQk7h6rVS1VuGt
 vzt9CMkkyUMg205wYEpxfFFi61XESYd2HrzxBn/sGUSEdC3XY9TGUZRjRTN7QnB1pKGpOvD4a
 mzpzM3IIvkHF0ljnv6iPOUeoAB751gDAI2c5C/DieRcf8d0Y8rZXvze5tmEhmtUtszOHhOfRp
 tVAcBeQ+WYtXn2wYuL7TerlP7xWvPVkhRSAJ55bEdOdhBbPO1Jlhco8N8kmKIHjM+BZ0dXFQE
 UVgXeTlvXajEq4gN3Iqs/iek4KwHsUb42wKCpGS2NAsfyXGp7LmMRZfJ9ZZKm0Es2ebnfZ90n
 yu/TC94JQoMt7lCn91DRxttb5NRxRlX0T5edPYU8q4SLkyoGyclLDJRPfVf6hUxvwE56AnZ
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
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
Cc: Marek Vasut <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
 Riku Voipio <riku.voipio@iki.fi>, Alistair Francis <alistair.francis@wdc.com>,
 Jia Liu <proljc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 10/03/2020 à 12:07, Laurent Vivier a écrit :
> This series adds a script to generate syscall_nr.h for
> architectures that don't use syscall.tbl but asm-generic/unistd.h
> 
> The script uses several cpp passes and filters result with a grep/sed/tr sequence.
> The result must be checked before being used, so it's why the script is not
> automatically run.
> 
> I have run the script, checked and added new files for arm64, nios2, openrisc.
> 
> I don't include result for riscv as Alistair is already working on a series
> for this architecture and it needs some changes in syscall.c as some
> syscalls are not defined.
> 
> We also need to add the _time64 variant of syscalls added by the update of the
> syscall_nr.h.
> 
> Based-on: <20200310103403.3284090-1-laurent@vivier.eu>
> 
> Laurent Vivier (4):
>   scripts: add a script to generate syscall_nr.h
>   linux-user,aarch64: sync syscall numbers with kernel v5.5
>   linux-user,nios2: sync syscall numbers with kernel v5.5
>   linux-user,openrisc: sync syscall numbers with kernel v5.5
> 
>  linux-user/aarch64/syscall_nr.h  |  32 +-
>  linux-user/nios2/syscall_nr.h    | 648 +++++++++++++++----------------
>  linux-user/openrisc/syscall_nr.h | 307 +++------------
>  scripts/gensyscalls.sh           |  94 +++++
>  4 files changed, 499 insertions(+), 582 deletions(-)
>  create mode 100755 scripts/gensyscalls.sh
> 

Applied the whole series to my linux-user branch.

Thanks,
Laurent



