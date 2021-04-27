Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CB536C231
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 11:55:08 +0200 (CEST)
Received: from localhost ([::1]:56454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbKQo-0003cE-BA
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 05:55:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lbKPn-0003B9-FO
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 05:53:59 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:57123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lbKPj-0001AG-P3
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 05:53:59 -0400
Received: from [192.168.100.1] ([82.142.25.254]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MaIKJ-1m4h7d2A1V-00WGCW for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021
 11:53:52 +0200
To: qemu-devel@nongnu.org
References: <161950107824.17271.5936509317690090363.malonedeb@chaenomeles.canonical.com>
 <161951314717.4719.489219171575884785.malone@gac.canonical.com>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [Bug 1926246] Re: chrome based apps can not be run under qemu
 user mode
Message-ID: <53e1e1cf-c5ce-f363-74a6-63a0f21832ee@vivier.eu>
Date: Tue, 27 Apr 2021 11:53:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <161951314717.4719.489219171575884785.malone@gac.canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:UNcCB85hK7skzG4EwzuF8tokr1IQEr1HHMztl8v4uq10RqHFOa1
 Be6gCJAUeq5offrkF9dwpmewoeD+xxlXrngg7kK3mWb7je+3OksxjzJzdTh9WXrqGuN6kWT
 LrLPkGLaoS9mDrabjL7VoV3QcmrQmAJ1AHh6p+IU+w/io6PTeYo9Gs4Q0zb8dnWGcBAnUyl
 /vKgnlGK7nABKyjDVhLQg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tLi4YUVTg9s=:BAfYu5rjHM1lkvju5pP5+0
 EgAkfmgoVnNxQdKxtu4HVlPV5D4wNWSp7oAyLHOHqaftFzEnQNPsFoNHwvoLVup+ChTNMYujI
 Tf7XwmGpdpepncS6tvPAMkkPNcV7u4ggc1Cd1SbsgcPvpW24voSHPNsQOcnrlOlO8psKJsOcV
 s0LKRfi+SXqhi/TbW2LYSWUGxKCx1ZMwdQ0olf2wQWwV66j+rOkj1hMXtu3lMkOiuKHtJZ2iH
 sYhWsbynwZRrLXnA16k0vqUK49Pq/cXxTpOjAaXdSE7XasPxAvTWRkSv1vHoDHH+5PCWQVoyp
 M0Wan2VFjmXwhobPaYGbV74GJ4NoRHci3idwcVXGph6wXKG4E7FKbA3Eb4nFtBH48M2JDUDrB
 MVuQ6KJwjt3I7/W5ejAjAWy1JkIctqIcmP6vMzB9cVivf2jyQh2E52vyTxGs/ZUSD+mGyvMML
 SQdwfonZUP1auDBDDEf6KusF1F6yDqPxlU3P42BH2aPqu4XzbZ+1xOP4CiJhgpfQDcwyWlmoP
 XSiAn6DJ9gHOf38w0u+6ww=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 27/04/2021 à 10:45, Wind Li a écrit :
> qemu patch:  
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 95d79ddc43..227d9b1b0e 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8537,7 +8537,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>               * before the execve completes and makes it the other
>               * program's problem.
>               */
> -            ret = get_errno(safe_execve(p, argp, envp));
> +            ret = get_errno(safe_execve(is_proc_myself(p, "exe") ? exec_path : p, argp, envp));
>              unlock_user(p, arg1, 0);
>  
>              goto execve_end;
> 

I think this is the good approach to fix the problem, but exec_path can be not set in the case of
AT_EXECFD (binfmt_misc with credential flag) because we use execfd instead. You should use
do_openat() to get the file descriptor and execveat() to start the process.

Thanks,
Laurent

