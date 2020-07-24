Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE4C22CEE2
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jul 2020 21:51:33 +0200 (CEST)
Received: from localhost ([::1]:44502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jz3jA-00083K-Fd
	for lists+qemu-devel@lfdr.de; Fri, 24 Jul 2020 15:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1jz3iQ-0007cx-T5
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 15:50:46 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:52921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1jz3iP-0005JS-0C
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 15:50:46 -0400
Received: from [192.168.100.1] ([82.252.135.186]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MJW18-1kEWCX2ca8-00JuO8; Fri, 24 Jul 2020 21:50:41 +0200
Subject: Re: [PATCH] linux-user: Fix syscall rt_sigtimedwait() implementation
To: Filip Bozuta <Filip.Bozuta@syrmia.com>, qemu-devel@nongnu.org
References: <20200724181651.167819-1-Filip.Bozuta@syrmia.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <87b87aad-a650-d8ac-c519-102b41f78bdf@vivier.eu>
Date: Fri, 24 Jul 2020 21:50:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200724181651.167819-1-Filip.Bozuta@syrmia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:TFz+eMfGUDq1Qvmm5prKXFY7BUXiwRt46qXvdJ2Vuffxi9AtcWX
 OdQc9SOTXQjF0j2cZeAf6aYaWhIR8i0lXcKrdoLCdX5IOE9s8BgbRCpNulp0VwEcSKGMDmd
 yZBYmwd/MqA7Iyb6SKxqJhBv3JYwo0rZ3sPvtwlI2i3dppzGrTOaDz6mArdkakVybyDUh0Q
 Gej8Oc7n58ZamF8CcqklA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bd3w7LQJKnI=:c5YTGuCDB4NfH/2UYcmasS
 mn8ppFCyvKWd+wHtHlADJzcCOQ/wsuNAbSfpUw26ilVQo+NBrf1mT7RosYmYQYA2CWBtLx7B8
 2atn2k98f1Z+IGm/3bBsqsmDwTtk8Y7QSr0I92/uhwH/aINq7AnH6lz9fFjQzjiiHJp/fDEvo
 UPBNXfdiBjRlQYNn8OpqP1V9Vhzs8Xp6l3BPR1SkxbAatb/l+RHm9fmzmChghT62aTqI5FN9S
 IajNovc8HtCA9VEkoqqrdfE+NXdT7vJo2TCps/ADJIrBUf4KyRIEcGic0ZoOY2qwbO3GSjkrA
 k4mksq6UAOJvqxf02RM1CPUyoJhZgOLzbCGdqK2I8FrvrhnrpGePOKllaQVTJp+ec9pW4FEp7
 cmApogKq1HDl4ZrRopZehZzdSKdRuLP8RxMqq2eoCG8JStq2U3cu92ZYPhAohXoXzGR6IHgR7
 VW2RfQ30bytX31BUV+oG4OClMudLrBNd0tlZ41L5ivaOlMsHublubdwOYjVjhNcbwDCr0Kov4
 j9WyWM7SJnKYDNaI4CUcp+sxIIMEwcuXKoOVGmc8YjLtnXpuQlwwFRmlRLPNMFvCBYn+Q9hou
 v5ITIvZqe6ci2P5gh5dHy++2563E4xLR/Yd8tss6TTBC87B4XPXWERukxAohmsgxKwdY0RFrg
 oWOEKkUZPVocnI+r5+rTJQEAL9tDaoNmrDMGOE95IVBvaQi7I/X7b0P9eq3HWaaMaOmgMuzMr
 6D25InSQc9tV/aRrplbi4VMHULvFtcmSkaq9p55g3XavsRO3AL4JBT6bkpm2ea2ZIuARKSyzC
 8+/7lsui74TbNcWs39+ogO2jhLoU5I8M+H/oYVm0Mh+0uh2reCDTo1Ox50zHbFnFAnfXFyH
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/24 15:50:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 24/07/2020 à 20:16, Filip Bozuta a écrit :
> Implementation of 'rt_sigtimedwait()' in 'syscall.c' uses the
> function 'target_to_host_timespec()' to transfer the value of
> 'struct timespec' from target to host. However, the implementation
> doesn't check whether this conversion succeeds and thus can cause
> an unaproppriate error instead of the 'EFAULT (Bad address)' which
> is supposed to be set if the conversion from target to host fails.
> 
> This was confirmed with the LTP test for rt_sigtimedwait:
> "/testcases/kernel/syscalls/rt_sigtimedwait/rt_sigtimedwait01.c"
> which causes an unapropriate error in test case "test_bad_adress3"
> which is run with a bad adress for the 'struct timespec' argument:
> 
> FAIL: test_bad_address3 (349): Unexpected failure: EAGAIN/EWOULDBLOCK (11)
> 
> The test fails with an unexptected errno 'EAGAIN/EWOULDBLOCK' instead
> of the expected EFAULT.
> 
> After the changes from this patch, the test case is executed successfully
> along with the other LTP test cases for 'rt_sigtimedwait()':
> 
> PASS: test_bad_address3 (349): Test passed
> 
> Signed-off-by: Filip Bozuta <Filip.Bozuta@syrmia.com>
> ---
>  linux-user/syscall.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 1211e759c2..72735682cb 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8868,7 +8868,9 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>              unlock_user(p, arg1, 0);
>              if (arg3) {
>                  puts = &uts;
> -                target_to_host_timespec(puts, arg3);
> +                if (target_to_host_timespec(puts, arg3)) {
> +                    return -TARGET_EFAULT;
> +                }
>              } else {
>                  puts = NULL;
>              }
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

