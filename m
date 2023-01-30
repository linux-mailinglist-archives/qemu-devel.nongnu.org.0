Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F07680972
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 10:28:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMQRD-00041j-B6; Mon, 30 Jan 2023 04:26:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pMQRB-00041Q-0E
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 04:26:53 -0500
Received: from mout.kundenserver.de ([212.227.126.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pMQR9-00060z-CY
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 04:26:52 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M2gt5-1pMgkh3hpX-0048XR; Mon, 30 Jan 2023 10:26:49 +0100
Message-ID: <521ea804-5afc-fb19-db72-e1ed73300781@vivier.eu>
Date: Mon, 30 Jan 2023 10:26:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: fr
To: Helge Deller <deller@gmx.de>
Cc: qemu-devel@nongnu.org
References: <Y9Q7BlDc/VX+1SBL@p100>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v2] linux-user: Improve strace output of pread64() and
 pwrite64()
In-Reply-To: <Y9Q7BlDc/VX+1SBL@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:bKbj8jQ9MefMOpCx1cwF/ZWQ42HtH7iMhc/Ytao5T0CEweGMfMT
 nizzt1o/NZ6MRjYvSHncJhA6lTnf0KkPWhB/mt60XVjrZYprNTvIXriQw/+xnzbxzA4l4K4
 0M7HK2y8bDJkZIucVdX2yKByDNPx223L5lhRL7O/eb1WWCfKfiOP09CKND/XbherV6Sv5n0
 xe/XrT61Ti1qkjGR0S1NQ==
UI-OutboundReport: notjunk:1;M01:P0:l00FRzxugSQ=;+fVg/N66Q5gdtwA24Iz1YC7XmVW
 HXzoKbJvxCp7TZKIbYSJGgI2uuBqpGbpXc4iFDMvlvWCgOcVF9sJtKHQFtj2C3kbUFPR2YfT1
 cAdNOvmJZ+8l3SHPSUAcaiK2Wo3ZyJekX7EC8taUSWsw1wqhdo5b7mo2tOzVNKOKhG775kLaM
 eixCrspQo+t8QwnKEUfqTMK532oJBejkSDysg6WTdo8rbSRaEFg3GLp3jeg++LY/Y7X9ckQES
 CLDHa3xVbSiI2NqsbSgW8JT5+DOsrX54r1xZ8RUn9tyLz8V7GTOCAySZIDICa9UiBPC92wm0a
 T2I9O6iqc6snwv5bsWESmKLDXBu+6hD+kIp+1M5u0jGHha6CkPHwaMXED3COxAkmscGaG+HSf
 pc/Qa++bTblhLU+2KHFruR3ecGIQfBo8Xy0XWb2oOxkLBBsnbmFcUz8PiqPDcTRtzDe/PQQAl
 wCbD4csmv8eRXza23W5N18+k9t7NVzIJI153/+xF2tcu/2RAS7cDH6BMDJXGEXklD5o55P8sm
 s61NKrjqc/poRI42c5jM1zUt5mFHHaqdq7qSeWFSVG9M7kyWoxJrnKl6mtxaMCN/0eC1HCMH6
 iAPiMy7Mn/mJUPPD17EHIes41odIt3d0wKzk++PizmqwquSjQueIoYs0rLkk6lXMmgBsP7cLn
 ulvjWt3si8xJfqKHAEDQ16ve3rkdsvRgd4xIwopw6A==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.092,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 27/01/2023 à 21:58, Helge Deller a écrit :
> Make the strace look nicer for those two syscalls.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
> v2: Use regpairs_aligned() and target_offset64(), noticed by Laurent Vivier
> 
> diff --git a/linux-user/strace.c b/linux-user/strace.c
> index 82dc1a1e20..379536f5c9 100644
> --- a/linux-user/strace.c
> +++ b/linux-user/strace.c
> @@ -3824,6 +3824,25 @@ print_rlimit64(abi_ulong rlim_addr, int last)
>       }
>   }
> 
> +#if defined(TARGET_NR_pread64) || defined(TARGET_NR_pwrite64)
> +static void
> +print_preadwrite64(CPUArchState *cpu_env, const struct syscallname *name,
> +           abi_long arg0, abi_long arg1, abi_long arg2,
> +           abi_long arg3, abi_long arg4, abi_long arg5)
> +{
> +    if (regpairs_aligned(cpu_env, TARGET_NR_pread64)) {
> +        arg3 = arg4;
> +        arg4 = arg5;
> +    }
> +    print_syscall_prologue(name);
> +    print_raw_param("%d", arg0, 0);
> +    print_pointer(arg1, 0);
> +    print_raw_param("%d", arg2, 0);
> +    qemu_log("%lld", (long long)target_offset64(arg3, arg4));

better to use:

print_raw_param("%" PRIu64, target_offset64(arg3, arg4), 1);

Thanks,
Laurent

