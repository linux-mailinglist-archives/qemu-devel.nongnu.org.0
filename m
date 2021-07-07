Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 109783BF040
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 21:27:32 +0200 (CEST)
Received: from localhost ([::1]:50762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1DCl-0003l2-5L
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 15:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1DC3-00031G-Fe
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 15:26:47 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:50301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1DC1-0006aV-Uu
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 15:26:47 -0400
Received: from [192.168.100.1] ([82.142.13.34]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1McY0J-1lSgeF3X8n-00d1er; Wed, 07 Jul 2021 21:26:19 +0200
Subject: Re: [PATCH 02/12] linux-user/hppa: Handle TARGET_EWOULDBLOCK as
 TARGET_EAGAIN
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210704183755.655002-1-f4bug@amsat.org>
 <20210704183755.655002-3-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <e55207e6-091e-7d2e-0ffc-95956fe8e944@vivier.eu>
Date: Wed, 7 Jul 2021 21:26:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210704183755.655002-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mFu1aENlflJhxBrkyJ/Xp0YBo1iRZYOJXAuM4Bt6AsoRU7ZKrOK
 88hO5VVqO8wzMCV6w685Qo9ks0PK5C9GlOzFSawrncxiMwLWSwpLu7U/wtO+PiOqtAoJdGN
 VC8CuBi5E/fpGyBPUaGTwlEePuxKdB3yLIduhaqNAItP5qQPMDJPYMQDyo2tmI2pMtGnz+t
 fPEmWbMAM51gTmajJbYDg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ui2ttSq7x9k=:bZmPt3U7X5BRtAJPFkGoVR
 yz3+/bn0A6Gglr3jtNREWT8zN9uNSj1OSqig9peoZXV/jrZHEYNqvV/mNNLwkFCQOycFL9msW
 e9vNUa+Ai783SXxCu1/LyNylGwb6qJ1B2Sx8lontbFgSqqtMeusurUdPmZiLtlhqv4Xjs0GEH
 gKfQOXR8kmNGd04yVRUWDxETpWskEXCEZMxv+dfl67JghsqUz5fSBCP8dqPrmwT8WT4Jz4tCO
 UoA/N/voKFyksu/lwkiUSkKxXcRR91yW0Xhz/CV5JsVQQdBTximB+REvXLvDQfDS2k9n87sIE
 9Ayq6mQ3+2xKfWygopVCaarW19dV5tJYkt5eQdUFWxfmhMFqwC9rxFYiu9JM47KYh+07tSgBi
 hKGmzrdL3CM9YdvdkbPYSIKEY6Wg696kj2kyq700e0Rn/2SEr9wguYqBvETUiIb4ea36rgc8S
 XU+4IseF2ZuIvjL9ldOe8DrsgrByZPBU7iip9+8/EKcF/Bd7IbsmiXdwR9fka6mZJ5difb+j/
 6sMmD1IrQBcsdv5XEKadgt6bRCfKwDXvBNPxqn66IuZBBRW+CZ3uG8CR25aI5Jaxan+twXGs3
 5LjEIUjTB9MeC3gr+02O69FVunE+jPt4NcBaMy1+aoM9fb8tQaQBGJ2ekrcyCmQ6E82KVZi1M
 S1JngD7PLpah149iBkivGjdMB+Rfs8JZOcg8yGrV+PW4BvYUBM5Mm9pWjed+jify0vdQCNI9o
 ySGdGWqKsVX+IE59ki5fHpDCoYk8UcR5q3jv/pLwSXqICdteC6PSrfsqNnMrQvJBIOO4CqPmV
 7dLgHT1gN/Eyr1bzFFqDRlh4OjWSGBbiducNHCSHHDq6uIGt97AnCopeWD9Yfedc67+7g8D
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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
 Richard Henderson <richard.henderson@linaro.org>, Helge Deller <deller@gmx.de>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 04/07/2021 à 20:37, Philippe Mathieu-Daudé a écrit :
> Linux kernel defines EWOULDBLOCK as EAGAIN (since before v2.6.12-rc2).
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  linux-user/hppa/target_syscall.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/linux-user/hppa/target_syscall.h b/linux-user/hppa/target_syscall.h
> index f34e05edb57..97a095656d8 100644
> --- a/linux-user/hppa/target_syscall.h
> +++ b/linux-user/hppa/target_syscall.h
> @@ -27,6 +27,8 @@ struct target_pt_regs {
>  #define TARGET_MCL_FUTURE  2
>  #define TARGET_MCL_ONFAULT 4
>  
> +#undef  TARGET_EWOULDBLOCK
> +#define TARGET_EWOULDBLOCK     TARGET_EAGAIN /* Operation would block */
>  #undef  TARGET_ENOMSG
>  #define TARGET_ENOMSG          35
>  #undef  TARGET_EIDRM
> 

Applied to my linux-user-for-6.1 branch.

Thanks,
Laurent

