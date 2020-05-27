Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E653C1E4632
	for <lists+qemu-devel@lfdr.de>; Wed, 27 May 2020 16:41:27 +0200 (CEST)
Received: from localhost ([::1]:40832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdxFF-0000iJ-KH
	for lists+qemu-devel@lfdr.de; Wed, 27 May 2020 10:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1jdxEO-0008Vh-BD
 for qemu-devel@nongnu.org; Wed, 27 May 2020 10:40:32 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:46997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1jdxEN-0006Nr-8z
 for qemu-devel@nongnu.org; Wed, 27 May 2020 10:40:31 -0400
Received: from [192.168.100.1] ([82.252.135.106]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M7auL-1jfJ40390H-0085tg; Wed, 27 May 2020 16:39:45 +0200
Subject: Re: [PATCH] linux-user/strace.list: fix epoll_create{,1} -strace
 output
To: Sergei Trofimovich <slyfox@gentoo.org>, qemu-devel@nongnu.org
References: <20200416175957.1274882-1-slyfox@gentoo.org>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <86cdd49a-7be6-c56b-bf61-0b0268b0f469@vivier.eu>
Date: Wed, 27 May 2020 16:39:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200416175957.1274882-1-slyfox@gentoo.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:CWnGqrdA3rZSkok1XjnnONBj6UXxtXfIwaDRbdRxDDd3VYDSogj
 fwJUAzcM4vvUPNKj5hJf7Xnen7MNYaAx14yyRVDTUILUuISUNUj+MHJUfNXXjhQWJezZYmA
 5HtCQOP+MrWSDh+kzZLPol0/yPwyvfUrTPn2LSVK/JyD6txymB2hDm2paEHT5mym4opHix9
 G0al5oHVmPXPGTqLDz2pQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:aKTzLtVsqIE=:SmHkd5545zYwSo0MPArj/c
 k+tKLvdJmRLGQ+X6MjdfkyeMSK3hmAbHvnz5wWzGHTnUQSKeLRRt/bP55stStN+lCtO/X4o7n
 C9iZ1/xw/fqh2GPkvFESqMYtIIZ4u5BbuhtwPCftbAw5s5U1FaoOvFENctBI2as/Ucbk5Zgn5
 fa2F9he4BbKooqqahNsBCse9Kf3sBIcFgjmCTM26j13E9CzG5zIELRGhaf2zWvxfstLERK9LR
 QL5Xj8n3hedBU1KtMjEu8G/WS4+8YfwN8eLcc+izFUC7SraqQOjPOF9ZokVqVr6f/TlrbAAau
 qvUZ6rYOMxVHFhiA4xIOk4ZQP/A/ciCwq8K/KYqgFHgsEH2WpDecsGbsxPvVoJeXrJZimmrq5
 DNk5TpiwkKqKykH5cgpgm305hnKf5GghKvOH7ESaQSFL9fFKHkVDcoECDotyAFhMsx3KBcFv5
 EMNcCJuCVbW0zGaA1IWpOfpSOLY8ZgNX1QwjLcgc2XRFzfVt6x4WyXgxzkrocO9AoLBSWvBeA
 g5WRoB3s3bAFV6jSbIFDKPHet0dfrNEVVo58q3gpY3NcmxatwEUBpb7SiM2YPv3Q4vlA0uSTl
 yJ7J/pjaxJMCNkxIbv6HoMcAHMCui0yDGuczIyPFTMKjYRbywqMJjvA26HE7Oyfm7ttqxUxG9
 thM+HsW9o01blaTT/Vc3lmXYSma6fKQ5KjtWOu6Mx9rc4+pz1q/bz1370Y9UZAdRn9YKvORrD
 +Ek3UeU5bYAFCIoQOEQXAqfT/umclKtTNCQSCJTe/x5MvXcK/oCSzF5i9pQAjz8+IwzT2bjoD
 O0xg13kiX5Lio7hkTyTN+XYBZUHMCUOUmF61JGzVG6KKJBG0vKeECncjEfhA/IO+K0sMKhD
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/27 10:32:27
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
Cc: Riku Voipio <riku.voipio@iki.fi>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 16/04/2020 à 19:59, Sergei Trofimovich a écrit :
> Fix syscall name and parameters priinter.
> 
> Before the change:
> 
> ```
> $ alpha-linux-user/qemu-alpha -strace -L /usr/alpha-unknown-linux-gnu/ /tmp/a
> ...
> 1274697 %s(%d)(2097152,274903156744,274903156760,274905840712,274877908880,274903235616) = 3
> 1274697 exit_group(0)
> ```
> 
> After the change:
> 
> ```
> $ alpha-linux-user/qemu-alpha -strace -L /usr/alpha-unknown-linux-gnu/ /tmp/a
> ...
> 1273719 epoll_create1(2097152) = 3
> 1273719 exit_group(0)
> ```
> 
> Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
> CC: Riku Voipio <riku.voipio@iki.fi>
> CC: Laurent Vivier <laurent@vivier.eu>
> ---
>  linux-user/strace.list | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/strace.list b/linux-user/strace.list
> index d49a1e92a8..9281c0a758 100644
> --- a/linux-user/strace.list
> +++ b/linux-user/strace.list
> @@ -125,10 +125,10 @@
>  { TARGET_NR_dup3, "dup3" , "%s(%d,%d,%d)", NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_epoll_create
> -{ TARGET_NR_epoll_create, "%s(%d)", NULL, NULL, NULL },
> +{ TARGET_NR_epoll_create, "epoll_create", "%s(%d)", NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_epoll_create1
> -{ TARGET_NR_epoll_create1, "%s(%d)", NULL, NULL, NULL },
> +{ TARGET_NR_epoll_create1, "epoll_create1", "%s(%d)", NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_epoll_ctl
>  { TARGET_NR_epoll_ctl, "epoll_ctl" , NULL, NULL, NULL },
> 

Applied to my linux-user branch.

Thanks,
Laurent


