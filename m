Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3923C5E7AFF
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 14:42:03 +0200 (CEST)
Received: from localhost ([::1]:47322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obi0H-0002te-SB
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 08:42:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1obhR3-00044p-JK
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 08:05:39 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:40959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1obhQy-00015K-KK
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 08:05:34 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MIdW7-1oVuep0pl7-00Efbe; Fri, 23 Sep 2022 14:05:18 +0200
Message-ID: <ccd23883-e668-001b-4fb0-bcb14fd60481@vivier.eu>
Date: Fri, 23 Sep 2022 14:05:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2] linux-user: use 'max' instead of 'qemu32' / 'qemu64'
 by default
Content-Language: fr
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220923110413.70593-1-berrange@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220923110413.70593-1-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:raNG8QWy35foizikEiwexFXuAST2JuQPmKfPMFmtPobiD/8olOG
 W4PwzORCCmPK/jc5GFehhQCrslxZNUWkqChf48XQMBqf+meIAW4jwn0Fm+92MNfpfmccPn7
 X+sEWz1y3eYV+84vH/lN4akKP+bgywqkhcFiwQl6l0tHzl1E7uoToJl9jZqE9OWDMlwoaMW
 3lgIH3GCdPlpEOkom345w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qRL+SsmLgek=:lN5bFFlp0cZaDfkRsupj7d
 nxnkaHngVMXFMra5OSxcadW40Ls+3dhCscI74IsbOwK8WMw9Hu7IFVN9tZxCfGUYTLaX3l4wO
 HoctOT77HY/ltrM3b6rExQexSuApMUBucHAuRr4aJFMVmCvU00na/zwDLEg1RkK2eCBpXpb8T
 XSzRGxeXZ5W3N9DRxZK5+JCP5fyHbUmeurZz5pr8QF8uCjW0/o63aeHxpTdqOIyCd4QOyqndW
 CXxuZVYT058/lS2Sy92q2+kkGBGPiBi03L8qUKijyr0aozSXaYu4Ev0Z3HwittZp4tJDOFdQi
 c+RmzO8ivDE6RIhn8sgiCLdRRXyCiQNXFXGbpy0dAqc9HomPs3wOTURhwm4vlGSmbOl74f2Kc
 O1L8aun6ajUnUHh1spRHlB2WGUOTh6tW64GZKoCYjfwjoxl3+6q7dyrfMPcizPpJWyKjQa2WF
 wCYcDVIJ1hrjC6+YjMmOjfm8tz6ZxgRckhM8clRCGZ6l0XQKZ5Q0vsyvor1SWKCV1pwH77Y5s
 IDjCKpb4Iv8taeYtfDb8YpXZSK/HRMpCKMV7rWCHsnNHOCfVOD2m5jspJqhmxnadKj33lhXN8
 9wTRH7FQ9NP4OmWunKQSs7R/3uO3/WKxuFWrQLiHRTS4dtlgEHfk3zGlNtunKZ1L7Kwc4ydv9
 eH+P41Ojgx8iAdgtE/o32luRGWi6DArgIgAkISDTykrD9JfmAUSsRj1cB0QzGL0bbHR9TESaO
 fwOZbAOo3w/rN385W/MBJh5FN/WwPWdEfjLYZqqtHoMwaNCrIhmphLWHFwBNdiAG0W2Z2e45q
 cucGXa2
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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

Le 23/09/2022 à 13:04, Daniel P. Berrangé a écrit :
> The 'qemu64' CPU model implements the least featureful x86_64 CPU that's
> possible. Historically this hasn't been an issue since it was rare for
> OS distros to build with a higher mandatory CPU baseline.
> 
> With RHEL-9, however, the entire distro is built for the x86_64-v2 ABI
> baseline:
> 
>    https://developers.redhat.com/blog/2021/01/05/building-red-hat-enterprise-linux-9-for-the-x86-64-v2-microarchitecture-level
> 
> It is likely that other distros may take similar steps in the not too
> distant future. For example, it has been suggested for Fedora on a
> number of occasions.
> 
> This new baseline is not compatible with the qemu64 CPU model though.
> While it is possible to pass a '-cpu xxx' flag to qemu-x86_64, the
> usage of QEMU doesn't always allow for this. For example, the args
> are typically controlled via binfmt rules that the user has no ability
> to change. This impacts users who are trying to use podman on aarch64
> platforms, to run containers with x86_64 content. There's no arg to
> podman that can be used to change the qemu-x86_64 args, and a non-root
> user of podman can not change binfmt rules without elevating privileges:
> 
>    https://github.com/containers/podman/issues/15456#issuecomment-1228210973
> 
> Changing to the 'max' CPU model gives 'qemu-x86_64' maximum
> compatibility with binaries it is likely to encounter in the wild,
> and not likely to have a significant downside for existing usage.
> 
> Most other architectures already use an 'any' CPU model, which is
> often mapped to 'max' (or similar) already, rather than the oldest
> possible CPU model.
> 
> For the sake of consistency the 'i386' architecture is also changed
> from using 'qemu32' to 'max'.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
> 
> Changed in v2:
> 
>   - Fixed commit message typos
> 
>   linux-user/i386/target_elf.h   | 2 +-
>   linux-user/x86_64/target_elf.h | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/i386/target_elf.h b/linux-user/i386/target_elf.h
> index 1c6142e7da..238a9aba73 100644
> --- a/linux-user/i386/target_elf.h
> +++ b/linux-user/i386/target_elf.h
> @@ -9,6 +9,6 @@
>   #define I386_TARGET_ELF_H
>   static inline const char *cpu_get_model(uint32_t eflags)
>   {
> -    return "qemu32";
> +    return "max";
>   }
>   #endif
> diff --git a/linux-user/x86_64/target_elf.h b/linux-user/x86_64/target_elf.h
> index 7b76a90de8..3f628f8d66 100644
> --- a/linux-user/x86_64/target_elf.h
> +++ b/linux-user/x86_64/target_elf.h
> @@ -9,6 +9,6 @@
>   #define X86_64_TARGET_ELF_H
>   static inline const char *cpu_get_model(uint32_t eflags)
>   {
> -    return "qemu64";
> +    return "max";
>   }
>   #endif

Applied to my linux-user-for-7.2 branch.

Thanks,
Laurent


