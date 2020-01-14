Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AFB13ACDB
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 16:01:49 +0100 (CET)
Received: from localhost ([::1]:41278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irNhU-0006Op-Kb
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 10:01:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36044)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1irNg1-0005w4-VP
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 10:00:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1irNfy-0007Xh-9P
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 10:00:17 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:57423)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1irNfx-0007WR-Vp
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 10:00:14 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MUok5-1jHT5x2fz7-00QmS3; Tue, 14 Jan 2020 15:59:56 +0100
Subject: Re: [PATCH v5 08/20] linux-user: xtensa: Remove unused constant
 TARGET_NR_syscall_count
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>, qemu-devel@nongnu.org
References: <1578947683-21011-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1578947683-21011-9-git-send-email-aleksandar.markovic@rt-rk.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <1ed5cdc9-c685-3981-d336-80a7744e54ba@vivier.eu>
Date: Tue, 14 Jan 2020 15:59:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <1578947683-21011-9-git-send-email-aleksandar.markovic@rt-rk.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:yNQMHXwOZ0xuHGp/4g8leizL4nq8FeGtwhy7Pt00mgKN/EEGHbG
 vTGd7uXtRHewKCnxuvCDUQE5Yn3W+QjkBqb7x73H72ZogNhj283A/4Z6OqR71UV8gPTo/qF
 W2BjsR5hFw+scis5jUrcnViozf7wHUgUvgQ3gSVaNkZev4UaqFqSgok4ObmNRRmPDrXpLKs
 Wsb5AJbVHq1I23LYsK8lA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gPXqNfHA4i8=:p7ePy6ZgdGSscH9A3waHCZ
 q2Ii5SFaKbApQleSIkhfaNjnhXZ0x7ZVKoOoNR7Et/S8a7rnjhOwzcTJvWF6rLXPfSRADDVLv
 zyNYe9HbXF3PvX+oFXvTpFN8kMyp5ZU5EP38pp/KI+ZWmZtBMNNh9Yf3YS96O2yvsctk/atPF
 bE4jFZeAFQ4x/mrK6XmRbg524ud7ElAnpIuN764U2S+Js+PbNtJAdygUPulPueqpxkPU0r8cb
 L/IE3Fc97mqHqAl+M2qz2KH3Y+iJtMGA8u9ANL80T0Gi0MHM5DyUjykIHG283JpTPioKC3V22
 Fr7JowseO8+XyYeTmEjWU7Yyht6YUk91SNZ0Y9gnXs+1CR0p3OsiQPbZUHMsgx3hmk0pr3iRm
 xn00+RCXyVlXVvrXjWIfnid7KlZQMlM/MMUtDapF4LDCmI3HBIVBZstRUt6p123zRPPk4+IoS
 fdQN4dfaHDLL1vryumwhysz5CRqiQlFJpwkkOCPU300HdtTU/PcVdN4JDUXsZUtTkVKQPqK72
 G23cbFDzYzCnHM7/cgOn6zsLnN2oMXQWUbfPXjWQ3NHfud5jr2ecojEJRqbCSDNMwbRPVSXUA
 /05k86fxMmJXVjsW7t06cU0RGTmldWp0kspws1ckaQq94saTvQRy5rqvHAYKwpB/ThyJXlc3v
 I/OkQXgeiY3uymkMuJOACN7gRimRZsLLmfqWjH4h7cZSxOFQEgUcegJ2sDCgNK9IRM+CZVe9e
 +5F1bOyUr+8DJrVapBbSbMfAATsR8UXMApG4ZO5GYV5gw8+VjnhIqyFSm5WTYZYQ94ImF38/G
 wsCC9Bw9l80FpilUgmMwaVQGC/PBDRsJIxNm9XjQYqly3hpYcBP0mS8/5LMQhxYLy6cD52ZX4
 qYQrntK9Sr+cEoDJlO9Zmy2xlWKLL7ghUAhEEoBIU=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.130
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
Cc: Max Filippov <jcmvbkbc@gmail.com>, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 13/01/2020 à 21:34, Aleksandar Markovic a écrit :
> From: Aleksandar Markovic <amarkovic@wavecomp.com>
> 
> Currently, there is no usage of TARGET_NR_syscall_count for target
> xtensa, and there is no obvious indication if there is some planned
> usage in future.
> 
> Acked-by: Max Filippov <jcmvbkbc@gmail.com>
> Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
> 
> ---
> 
> cc: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  linux-user/xtensa/syscall_nr.h | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/linux-user/xtensa/syscall_nr.h b/linux-user/xtensa/syscall_nr.h
> index 3d19d0c..39bff65 100644
> --- a/linux-user/xtensa/syscall_nr.h
> +++ b/linux-user/xtensa/syscall_nr.h
> @@ -466,6 +466,4 @@
>  #define TARGET_NR_pidfd_open                         434
>  #define TARGET_NR_clone3                             435
>  
> -#define TARGET_NR_syscall_count                      436
> -
>  #endif /* XTENSA_SYSCALL_NR_H */
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

