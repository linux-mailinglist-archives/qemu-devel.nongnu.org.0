Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5236845D7AB
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 10:52:31 +0100 (CET)
Received: from localhost ([::1]:48652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqBQc-0004yj-2f
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 04:52:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mqBOu-0003wr-2N
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 04:50:44 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:36439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mqBOs-00036S-3p
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 04:50:43 -0500
Received: from [192.168.100.1] ([82.142.2.234]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MLhsE-1n7iFV1Xyy-00Hiiz; Thu, 25 Nov 2021 10:50:33 +0100
Message-ID: <5daa4045-60ee-26af-148e-dabe0fd16cb2@vivier.eu>
Date: Thu, 25 Nov 2021 10:50:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] linux-user: target_syscall.h remove definition
 TARGET_MINSIGSTKSZ
Content-Language: fr
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1637830681-4343-1-git-send-email-gaosong@loongson.cn>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <1637830681-4343-1-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:w7QY8s2RDOlH1IWEjjTxZhEZoJRZWyagvQe4bkkNlVt2QpJ41LN
 a2rAYelo00zD7MlGzo5UFs7dz1TrsQ/MgLT48tasuxAOY7azyiHJvig4Cio7URom3OszG9b
 8qBIz/uXVzxqwd0+as+VYKQcmR66v5xkaUHQnQv70oz2eM03RsQRvbMsoEaQmGt5WDGmc8a
 YrGjnPY0wwaReBJIB5JLg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2VVQtdX1I40=:RwDSD4rLZxLRuIYkgHShTW
 oiMSgNyXUYNgbW8oXcYpJvDhkJasb6SGKNHGCBQNuH14lpz7iOdFou5/VavXcYyrQE9hPdJT+
 yOjZdmusHKp9p1Ed9kIM/3yw08FdW1L799R2aIyNJu/VJB0vb2SNiayD+III3kn+PkYWof/4K
 yMMc6nYCFfu3NiRX4VG6EL9vnZ+pS8f37ZEdR83rRKijF26ACYZrODXan66d7+z4bq02vGUxD
 7qogB/IA+tkn0oQ13a9VyfFA/tRvUYQnTtPpXxZN/kX3Uf+omhSNVPwWGUSMf4oaIExmT4URq
 zkUF5HeaJwPSD8W67IflgzBa47BbBnFPlSNZQwLNqNg4V6Hn8LV4A0Oryrm8R97f517n7TVDk
 kmejBw3OLI8mON1Mw6jRiA7v4o+PieRuSNaGm+zzQ/z5U6KlS4LSinZOMxpoPkSSO5N1u8zP/
 lL9704d9VMlZoLgY8qL5jC4hHN+//1NNNXwm31oqDlY2p/7TyFt5B/DepqOOM2dLXDUkdBFfG
 fpl6eAFkgZOFKz1n3urYBkBzg+jqpeVv9lPW+tvlh4QgyqVsqP2Q1JMwObFtEoXZWyv3Kmsi+
 CblC1FML8V+dElDUfeDscqNhg4rFmNgdzBGlEDur3XDkBplI0zzCfiM6XTKl9eyFoAQmpLMPT
 U56cRXoAEmx4e3USI8o8lFezdHU/Hg6og+zvZby2JzbqmzDmW3W1/B4ge+aFSEBwN0ao=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: alex.bennee@linaro.org, richard.henderson@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 25/11/2021 à 09:58, Song Gao a écrit :
> TARGET_MINSIGSTKSZ has been defined in generic/signal.h
> or target_signal.h, We don't need to define it again.
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   linux-user/aarch64/target_syscall.h    | 1 -
>   linux-user/alpha/target_syscall.h      | 1 -
>   linux-user/arm/target_syscall.h        | 1 -
>   linux-user/cris/target_syscall.h       | 1 -
>   linux-user/hppa/target_syscall.h       | 1 -
>   linux-user/i386/target_syscall.h       | 1 -
>   linux-user/m68k/target_syscall.h       | 1 -
>   linux-user/microblaze/target_syscall.h | 1 -
>   linux-user/mips/target_syscall.h       | 1 -
>   linux-user/mips64/target_syscall.h     | 1 -
>   linux-user/nios2/target_syscall.h      | 1 -
>   linux-user/openrisc/target_syscall.h   | 1 -
>   linux-user/ppc/target_syscall.h        | 1 -
>   linux-user/riscv/target_syscall.h      | 1 -
>   linux-user/s390x/target_syscall.h      | 1 -
>   linux-user/sh4/target_syscall.h        | 1 -
>   linux-user/sparc/target_syscall.h      | 1 -
>   linux-user/x86_64/target_syscall.h     | 1 -
>   18 files changed, 18 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


