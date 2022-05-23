Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E46AC531DAE
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 23:28:20 +0200 (CEST)
Received: from localhost ([::1]:49096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntFb9-0002mJ-Pd
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 17:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ntF4m-0002ek-DO; Mon, 23 May 2022 16:54:53 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:38381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ntF4k-00066p-P7; Mon, 23 May 2022 16:54:52 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M1HuU-1nqVFh0LFK-002pEI; Mon, 23 May 2022 22:54:43 +0200
Message-ID: <862f30f6-6b90-e949-0954-8d1d819dab96@vivier.eu>
Date: Mon, 23 May 2022 22:54:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] linux-user/host/s390: Treat EX and EXRL as writes
Content-Language: fr
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>
References: <20220504114819.1729737-1-iii@linux.ibm.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220504114819.1729737-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:umd5vFHMRJiElc5EAXdFzHlTZN33FGO9JWjgH1e1VVXlD2oTf5i
 b3IBIaXvZb3pOnBjQSww98s+kIKRNk5A9POegMPuGXL1cXTPON3hxfmoZTni7XqIta/ic7b
 kr8G32MfHh0EolN45z27l+D7VuPY9ud3DmMKip0thmDxvExEinO/+jHOhk5ChU1k+kXxaZO
 0Y49/5qN5e2ilLcx0MzjA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SK63QrcjU8s=:gnT1DAz/YQ+V/w8dCYHW/L
 xS6IrDtBYJZ97/mcNeG3oIallGd6riyvdaHEUY1GlTs1FFROZm3asU8ztajteqVd2eoBmXoaZ
 1eRuEVc9qLGH416//73th6Vu7T7tsYTlqWmHOGdbw4O7q2wFgosLLXEflIVgXmmxgPgZhzPPH
 dcZtw5LMkLcUl9GqS3W/RQVqz/kqf6ko3KOi6Fb9b+k5iVeHrHaaKp1zbvQS/ysNNWNQeidIP
 8p7Q3sXVyOD36mgMT/lr8QvqIWoEP57uzH5WafngURUHNSgjYRW6PGuzbRRcSRVMQOUNjkOAZ
 fWWvmF3LMG7i9okgKSTHSNTy4PScFkrOOdaRBw/DdkdsSGn04ZzebWTBYmpIDWy3iCMTaskyU
 L7c7lFWur6uPNuZ2E0YsKkaec98Hz1/SFnRUzHqoPndgSTTQ1B8pAr0j2catC1IHR4pQE9rsu
 18WA4YVnyiRW1yXMXrTy88Axk/oVKttvw4xB4Al3jCiPSLzuT9TdDywNqrhhYtBTYOL6oqwcx
 hCDco/FRC0LQ9xqozBG4Yi1c2UXhdCh43za8GAL1Wbj23PkSuMs0tqk6v7nCr3A7fx7dF8uQl
 P5+z194lN43itg7QMudGjrasiMcsvZjXyL54KlRHcex4BQJtfl3DKkjrLuK0hzpWr15KkS9K/
 AMBLbv9zDgRYM+q65ylLgVXI4+5FUY+4mIvYGcBR0uGLOh62DBnKxXhzWfhbjymCzhrY88/Xj
 x664ZzH0Z/TT7zis8XRNNfJNTHISUymrQsup4Q==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 04/05/2022 à 13:48, Ilya Leoshkevich a écrit :
> clang-built s390x branch-relative-long test fails on clang-built s390x
> QEMU due to the following sequence of events:
> 
> - The test zeroes out a code page, clang generates exrl+xc for this.
> 
> - do_helper_xc() is called. Clang generates exrl+xc there as well.
> 
> - Since there already exists a TB for the code in question, its page is
>    read-only and SIGSEGV is raised.
> 
> - host_signal_handler() calls host_signal_write() and the latter does
>    not recognize exrl as a write. Therefore page_unprotect() is not
>    called and the signal is forwarded to the test.
> 
> Fix by treating EXRL (and EX, just in case) as writes. There may be
> false positives, but they will lead only to an extra page_unprotect()
> call.
> 
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   linux-user/include/host/s390/host-signal.h | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/linux-user/include/host/s390/host-signal.h b/linux-user/include/host/s390/host-signal.h
> index 6f191e64d7..25fefa00bd 100644
> --- a/linux-user/include/host/s390/host-signal.h
> +++ b/linux-user/include/host/s390/host-signal.h
> @@ -50,6 +50,7 @@ static inline bool host_signal_write(siginfo_t *info, host_sigcontext *uc)
>       case 0x50: /* ST */
>       case 0x42: /* STC */
>       case 0x40: /* STH */
> +    case 0x44: /* EX */
>       case 0xba: /* CS */
>       case 0xbb: /* CDS */
>           return true;
> @@ -61,6 +62,12 @@ static inline bool host_signal_write(siginfo_t *info, host_sigcontext *uc)
>               return true;
>           }
>           break;
> +    case 0xc6: /* RIL-b format insns */
> +        switch (pinsn[0] & 0xf) {
> +        case 0x0: /* EXRL */
> +            return true;
> +        }
> +        break;
>       case 0xc8: /* SSF format insns */
>           switch (pinsn[0] & 0xf) {
>           case 0x2: /* CSST */

Applied to my linux-user-for-7.1 branch.

Thanks,
Laurent


