Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8A45EC0DD
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 13:16:56 +0200 (CEST)
Received: from localhost ([::1]:33990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od8a6-0003SG-UW
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 07:16:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od8Ji-0005qS-7s
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:59:58 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:54463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od8Je-0003JL-SH
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:59:57 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M3UlW-1oca5F3gtW-000gWs; Tue, 27 Sep 2022 12:59:52 +0200
Message-ID: <86cef816-90c0-f5e9-3e5b-28beffff1c51@vivier.eu>
Date: Tue, 27 Sep 2022 12:59:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 0/8] linux-user: Futex improvements
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220829021006.67305-1-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220829021006.67305-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:aHibNxb1WRj1g9bsWfrRE64kG7Kp7zWa1lZu62SGLcp2GzdWM3e
 ojMTO/PRV+oqQucpGmliplxkwcPdd6z0XM7hNee+E5feRUtwSetbAITbe9LfnEdMUJX9x2y
 COjsVPtBJkWSyQgWoylPF7IdO3rtsmRHBhiGYA6sFoqRXIrv3lFy4kCdqsdF5Wy6d3bQ7bV
 mvtmbWl0tlsE1lx+7uB7w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gjYnqpofYJk=:QVDmQd13NIDirOwDbPtiPg
 3obfQeszf/xzNJSVbvdbBtVVyqO4rYAL6Cp1m2twinF3wI1xmz4JPLiZ6DUPQkkNS4gh0lDoK
 tuC9GWULdleLs1Cp2UENKxhEP3V37N16mmKKwDTtR08z3nynkNj4u2Q2jcFDdMLAaFJKGmYhp
 jIQQ/xX4tAJAgbtKE1ghU4YAB9cJuacDtIgawbCpoAYUNkQCvXlKEiqtQuInDlD00aViImVQ6
 /wgeA09X6PdC9czNdiIkF/qvmD38eqQ7viWYDhwpNlSXcGUYZex56jfXinliK4qTjQYJgNfyj
 31IoPrwvUBp5RF2VjXAY+j4VO89d3INvHspYqCCJw5uxm+n28VVk9u0LQOwojVoP6c78ErieY
 f0+/Ca7rImCn3t6WAE21R26olCb2CADze9iPLoB/B2zKaINq2J8S3pw4K42XSQ+6jS2fpprOr
 ntVH8masEcpYNdLD0m/Go1FUxoyKqnJOzgwjbhHhHtoCcY1PqrKK1hO723iS3vhoBYIJaTSz2
 1/ieJ0bSEPhMBB8yOHEpdHvx5tdsq4Jrmw0GPj7fHYo3jjZtaplrL87ppWs9NG6lDM7gJfGMb
 lyj3HUulb1H3+zgrEO+RPUAxTy9O1ZLdRuMKCYtlIJXlt1dRj0e6OEYL4Q9QOiWvDMxXtRkrS
 4dG+BFCoFEdNNL+o/l78dsMr0QItBVNyvb9JImUO1AENN4nflIF92qMXtXwBR+bUY0Fcoyh4I
 5EKvkmkH9f/0BSUdz8P9RY1Zr+gkpkfW10eNCpOMFLTIRQTpnWKLpNiYo7mnQpRTrHdLAlPSo
 wjdbANt
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 29/08/2022 à 04:09, Richard Henderson a écrit :
> Fixes a bug in FUTEX_FD, and implements a bunch of other ops.
> Also, some assorted strace fixes.
> 
> r~
> 
> Richard Henderson (8):
>    linux-user: Combine do_futex and do_futex_time64
>    linux-user: Sink call to do_safe_futex
>    linux-user: Implement FUTEX_WAKE_BITSET
>    linux-user: Convert signal number for FUTEX_FD
>    linux-user: Implement PI futexes
>    linux-user: Update print_futex_op
>    linux-user: Lock log around strace
>    linux-user: Log tid for strace
> 
>   linux-user/syscall_defs.h |   3 +
>   linux-user/strace.c       | 130 ++++++++++++++++++++++----------------
>   linux-user/syscall.c      | 125 ++++++++++++++----------------------
>   3 files changed, 125 insertions(+), 133 deletions(-)
> 

Series applied to my linux-user-for-7.2 branch.

Thanks,
Laurent


