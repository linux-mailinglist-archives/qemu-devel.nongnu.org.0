Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3626AE20B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 15:19:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZY9W-0004pM-Nq; Tue, 07 Mar 2023 09:18:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZY9K-0004ix-Bx
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:18:43 -0500
Received: from mout.kundenserver.de ([212.227.126.130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZY9G-0004ZK-I4
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:18:40 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MuVOM-1qPrYJ3Mtm-00rV2G; Tue, 07 Mar 2023 15:18:33 +0100
Message-ID: <88ec0341-92fb-f3b5-796e-23a0c6f8c390@vivier.eu>
Date: Tue, 7 Mar 2023 15:18:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] linux-user/mips: Low down switchable NaN2008 requirement
Content-Language: fr
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: BALATON Zoltan via <qemu-devel@nongnu.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20230211173401.13902-1-jiaxun.yang@flygoat.com>
 <AB7D213A-2A88-42E5-B142-BA6127103FCF@flygoat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <AB7D213A-2A88-42E5-B142-BA6127103FCF@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:7ncHMZUzSXIv8yhJD+3zTZiHfHPbDQG1rI+Yt3WVW+Z35cw1bOD
 7Th1NNPxT0OUDz+3Se5xo57/e1hMMIxSSiqbHUuh0Jfk9ui8up/XctBD8mZpd8NaGNkMgOG
 g3x1LKVuF4mA49Vdt7JsscZYsy3rNIqQq6GnvxGPIneqwa2utjE6tx/xFIq+h/qMB3zKzcD
 j3u4mcFTgWGfSElOcQcQg==
UI-OutboundReport: notjunk:1;M01:P0:2RHkXnn9UpI=;u7m28m+J0neeEB+tbt7DwNjjY+/
 vgQUAbBBuXG9w8Y/XbUE8AXmvrW1CJfwDEw5kbNCDDtseEz5WC/0Vfh233PDNtXTjNX7kpO2b
 Lm1WmI3T7khq5cEtGCwDVib8S4de13o1gKUTGnrCOZkaBAyd0fpMKEclKkl8gXKXLJiJSs2OU
 YAA2AQlP9Ks6XBAAfDmdOJbUeapVD34IMvxNUGuJ+lElmQav8lhlp9CIynqn3X2XTaU5PuF/7
 q1e7tLlXXBT/SJazREXSWOQmajBxpuJo+Qtq1Xmdzluw+zjpChD1HY+LEUhBwKpeyPkSEE/6+
 lJKCjXfsqgxffAWT5SlG8M/y6UjOeWvt3Xc9cdFQCSeb3JhXY0m6ssMEWYl2aJYzeM7MpGh0m
 xvwDTI3gq6tuNI4+brqFFOtWd7rFZ2So448eGyuRKVUm09ZyqysgXcSJv/gl2JpRfGWSwHaJj
 VYYAIc/WFLCKvlBgnc5pc5iP2GBPFIhndHjAZiEKVYnuGekoDikJfFZZpSgjtQr3l4j5cvg+Y
 fFpN6SZTiHiwNvWMDTzZgqOHBmbhxLBn+9eX2r6wMf1DNDrFzYATBRykxnfbWf4U/4zDR5HUL
 /IH6/BapARzDORNTQItTKXaranEB+6lMl2HnOKZr0VEIoJmliR0HMJOm3h7AOMdWEcHhxSms3
 +3vVkxbv/eZfIatyEkn7+g/XQiqn9dOsLeiryzhbpA==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Phil (or someone else that knows mips), could you review?

With one review I will apply to my linux-user branch.

Thanks,
Laurent

Le 22/02/2023 à 11:28, Jiaxun Yang a écrit :
> Ping？
> 
>> 2023年2月11日 17:34，Jiaxun Yang <jiaxun.yang@flygoat.com> 写道：
>>
>> Previously switchable NaN2008 requires fcsr31.nan2008 to be writable
>> for guest. However as per MIPS arch spec this bit can never be writable.
>> This cause NaN2008 ELF to be rejected by QEMU.
>>
>> NaN2008 can be enabled on R2~R5 processors, just make it available
>> unconditionally.
>>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>> linux-user/mips/cpu_loop.c | 3 +--
>> 1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
>> index d5c1c7941d..b5c2ca4a3e 100644
>> --- a/linux-user/mips/cpu_loop.c
>> +++ b/linux-user/mips/cpu_loop.c
>> @@ -301,8 +301,7 @@ void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
>>      }
>>      if (((info->elf_flags & EF_MIPS_NAN2008) != 0) !=
>>          ((env->active_fpu.fcr31 & (1 << FCR31_NAN2008)) != 0)) {
>> -        if ((env->active_fpu.fcr31_rw_bitmask &
>> -              (1 << FCR31_NAN2008)) == 0) {
>> +        if (!(env->insn_flags & ISA_MIPS_R2)) {
>>              fprintf(stderr, "ELF binary's NaN mode not supported by CPU\n");
>>              exit(1);
>>          }
>> -- 
>> 2.37.1 (Apple Git-137.1)
>>
> 
> 


