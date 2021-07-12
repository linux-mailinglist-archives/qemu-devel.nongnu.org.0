Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB213C64BC
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 22:07:12 +0200 (CEST)
Received: from localhost ([::1]:52292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m32Ct-0001xJ-LL
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 16:07:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m32Aw-0000kM-Ph
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 16:05:10 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:47233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m32Au-0002Cy-Vr
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 16:05:10 -0400
Received: from [192.168.100.1] ([82.142.17.146]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N0o3Z-1lFlYm2OV3-00wkrm; Mon, 12 Jul 2021 22:04:37 +0200
Subject: Re: [PATCH 0/3] linux-user: update headers to linux v5.13
To: qemu-devel@nongnu.org
References: <20210708215756.268805-1-laurent@vivier.eu>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <bd073d0b-338e-1562-8853-ee2657a5db3f@vivier.eu>
Date: Mon, 12 Jul 2021 22:04:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708215756.268805-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:vZgDmq0N7AwTQCty3qL/pVYn6xGdCfZF51d0Rn+Agi0xwtHxvzk
 QeGUjnc9BzvVVJe0k81Irf6kvFhX48gATarwAvLRs4pTzNDOY5kzHHd8TngD9R5SUiaRaMx
 LmG/9AkoGIXZ8sUfh9LGlDzX4f8pHh0jR4YiwYdmWdJLpGU3EWF0zOlrQ75W1xIT1cGdn49
 qkVcBFND0vsvhvkxa7IGA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MTKvrE0DamM=:BjeDULE9ORZD8Gz833dFCX
 d+CSoSH7atvdnxUDHVXljdXogqoh5lHdMbkXLZiE/FIopQskE+l6UzD80z0LgyUkE/AzrmM3q
 NSduGtrSQTxyXcS2JOkF0SaPG9w9GLSolvl0uytzP/D2p1UQnn6PEuApBjak+k1pH3CGFzVs0
 y/YqdSGeEmkyBgejRyCrJRghE1FZtd0nHxURLmbMTW2LYPvadAe8p4kM+6HH9GVZr30VDB5nI
 MoJkr77PRB6Ju4dUT9z2AKapdoovfjHTVFgitd3k7vfRireK41KN+vsxsZG8w/NCGpEIMPDUm
 jI4DWeKGP5t6Z6WJcPhTtNQRV86qY0plHLk7UEwuned8p39yOPfyRfyQ6S+E1ymCebxvr/s3B
 od2ebVlKU9dXStpew64z4+Reqw3rlV80qaPXeBTaIURl7RUeZZDC/rjX+rJ9GFw70MgdChNE0
 bJX+rZpTp2bflQpORtIzUqkTAv49K1eou+Imu5PRJXSI2a6ka20n17ogbCHoue266n4X4tLKI
 SYIDS2g6qb2oJsS81f7DuYHafW/J+efK8WrUiATVns1JEI/oJuanuzbwhQTXv0qXAG8n0nUa2
 me7X7sFTEfFne4daA7JsMtvHA35X7XfEhlA7j5IDien5Uk7iRkpgnnB/uuG1jHcUjTpkg26jK
 +1pMj9+aU47QPXa/SUgPAV4dHF7tIvGs9GWk2cijm5Tdi3z+zYuaJG7WjlQO9HGA93NDdyOrg
 ARK0Ro/Tq/AI+/y7nLeXd+oKuLGQqhYo2l3u9Jijz2AlufiehzEy7LG6GySQ+UZOaYw9GS+0c
 eIre364oQfOzf7uVsvk7nS4GLijJUFby1/IT4vEQXZy5h6dG00VfkhdkHUOg+l0elRlHMIu
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.479,
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 08/07/2021 à 23:57, Laurent Vivier a écrit :
> All headers are updated using tools from scripts/
> 
> gensyscalls.sh, update-mips-syscall-args.sh, update-syscalltbl.sh
> 
> update-mips-syscall-args.sh has been updated to work with the
> file directory changes of strace.
> 
> Laurent Vivier (3):
>   linux-user: update syscall_nr.h to Linux v5.13
>   linux-user,mips: update syscall-args-o32.c.inc to Linux v5.13
>   linux-user: update syscall.tbl to Linux v5.13
> 
>  linux-user/aarch64/syscall_nr.h        |  8 +++++-
>  linux-user/alpha/syscall.tbl           |  7 +++++
>  linux-user/arm/syscall.tbl             |  7 +++++
>  linux-user/hexagon/syscall_nr.h        | 12 +++++++-
>  linux-user/hppa/syscall.tbl            | 31 ++++++++++++--------
>  linux-user/i386/syscall_32.tbl         | 21 +++++++++-----
>  linux-user/m68k/syscall.tbl            |  7 +++++
>  linux-user/microblaze/syscall.tbl      |  7 +++++
>  linux-user/mips/syscall-args-o32.c.inc |  5 +++-
>  linux-user/mips/syscall_o32.tbl        | 19 +++++++++----
>  linux-user/mips64/syscall_n32.tbl      | 19 +++++++++----
>  linux-user/mips64/syscall_n64.tbl      |  7 +++++
>  linux-user/nios2/syscall_nr.h          |  8 +++++-
>  linux-user/openrisc/syscall_nr.h       |  8 +++++-
>  linux-user/ppc/syscall.tbl             | 39 ++++++++++++--------------
>  linux-user/riscv/syscall32_nr.h        |  8 +++++-
>  linux-user/riscv/syscall64_nr.h        |  8 +++++-
>  linux-user/s390x/syscall.tbl           | 19 +++++++++----
>  linux-user/sh4/syscall.tbl             |  7 +++++
>  linux-user/sparc/syscall.tbl           | 19 +++++++++----
>  linux-user/x86_64/syscall_64.tbl       | 27 ++++++++++++------
>  linux-user/xtensa/syscall.tbl          |  7 +++++
>  scripts/update-mips-syscall-args.sh    | 13 +++++----
>  23 files changed, 227 insertions(+), 86 deletions(-)
> 

Series applied to my linux-user-for-6.1 branch.

Thanks,
Laurent


