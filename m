Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F6E532F12
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 18:35:56 +0200 (CEST)
Received: from localhost ([::1]:51742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntXVj-0004Lq-8z
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 12:35:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ntX4D-0004LV-Cs; Tue, 24 May 2022 12:07:31 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:60855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ntX4B-00019k-GU; Tue, 24 May 2022 12:07:29 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mbj3e-1nHjTO0cGM-00dGyH; Tue, 24 May 2022 18:07:16 +0200
Message-ID: <2baaa63c-2ac2-7e8b-2d08-a7eb59644ac5@vivier.eu>
Date: Tue, 24 May 2022 18:07:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: PING: [PATCH 2/2] tests/tcg/s390x: Test unwinding from signal
 handlers
Content-Language: fr
To: Thomas Huth <thuth@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ulrich Weigand <ulrich.weigand@de.ibm.com>
References: <20220503225157.1696774-1-iii@linux.ibm.com>
 <20220503225157.1696774-3-iii@linux.ibm.com>
 <03b9e56549edc455d8afe89a9fcad01715b88475.camel@linux.ibm.com>
 <f6e0826a-c60d-b806-79f1-1b5b5f6038e9@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <f6e0826a-c60d-b806-79f1-1b5b5f6038e9@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mHAY2jsOvhruitFjlBdyxJZe52lcA0pUwpM36HRPfnjfNOtCw6G
 zF+z+CsloJw6Wzs8y0N9zRxKTFl5noDeYzwGyQ1K40hHBcxycl6Fz8Ax5tJn4JFPblRRxGw
 gJisy5VH+ZHydC2A3w5vSxrseeB2M6aPD5TVrNVyGxJlIjRis4zPQC2+HLasJ7EeKD2yVgD
 FG5Z3qgzdDQERyPBeNm4w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kWbeD8OJX+4=:k1ctrWmK5La+gaHS/buKVy
 8NqXLEYGsYXoDJWKzAvq5nS/+TRO+IU/cvaakeV8rFRLTkImt9y7n4Xh2i3KI2Srwo4fzcC9L
 5iQaBRFTXQ9/pBVULMK4/HH4GQI3B+YRf242+BHHMC5+A1pxf9UJYuUPKznrkGRISt2fYdyeP
 wnw8wcwZJ7UfAVl21AguARopaq7h5u01bcR/a8LDw8I8ntnQJ5TMnUhov3+eGPvaOmjgbqVjr
 NoUCf9bLHnQ/3yBwEwotCiGclBZ0m2dS3wm0BZldAwTjLFIXqtrwxWQakG1xl4ueLAYv90NjG
 B6SX7ccer1E2Rc1W6xLFjhHp/I/qmzHE07Uy+SD+1Vy7kY8MTz7kx8M+ohCnNSFylhonRV4fD
 M+2PIZkZUY8vvgUBnO1DygvLldXrg3gpd9I5d8pt7vt/Fi7hKFxGWnWPXNgEWskU8P6b1yfYB
 znqdWmWiZHQTQViCXbbTigF5JTC0+HbJu94DlpRcoU1YvY+uytclbf/B+RjuZhXShLeUVgCJI
 cvjtl7T3F6siJ8RLshhhTz5XEtp6+RmrexckEIKmoP307acxU/QMj4dRmJihKHpeKfy/HuoN5
 3syuedy1mzuXSlNhOsbHo+e3IG8tLHKPaHgd1OULZYVwjbHfhv5dg9Ck/p5f27WzYC+AuhAiF
 BkBfkxOpfJZIO0fvHk21pXqhiYtKvIwW9tq2rIfllj7C1BHwkBCv2R3SDHvhc+5TBEPCHJhem
 nb6mt3K0npCINNKYvL1wNvJE+TlBsbuEX7icnA==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 24/05/2022 à 11:56, Thomas Huth a écrit :
> On 19/05/2022 13.34, Ilya Leoshkevich wrote:
>> On Wed, 2022-05-04 at 00:51 +0200, Ilya Leoshkevich wrote:
>>> Add a small test to prevent regressions.
>>>
>>> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
>>> ---
>>>   tests/tcg/s390x/signals-s390x.c | 69 ++++++++++++++++++++++++++-----
>>> -- 
>>>   1 file changed, 55 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/tests/tcg/s390x/signals-s390x.c
>>> b/tests/tcg/s390x/signals-s390x.c
>>> index dc2f8ee59a..48c3b6cdfd 100644
>>> --- a/tests/tcg/s390x/signals-s390x.c
>>> +++ b/tests/tcg/s390x/signals-s390x.c
>>> @@ -1,4 +1,5 @@
>>>   #include <assert.h>
>>> +#include <execinfo.h>
>>>   #include <signal.h>
>>>   #include <string.h>
>>>   #include <sys/mman.h>
>>> @@ -11,22 +12,28 @@
>>>    * inline asm is used instead.
>>>    */
>>> +#define DEFINE_ASM_FUNCTION(name, body) \
>>> +    asm(".globl " #name "\n" \
>>> +        #name ":\n" \
>>> +        ".cfi_startproc\n" \
>>> +        body "\n" \
>>> +        "br %r14\n" \
>>> +        ".cfi_endproc");
>>> +
>>>   void illegal_op(void);
>>> -void after_illegal_op(void);
>>> -asm(".globl\tillegal_op\n"
>>> -    "illegal_op:\t.byte\t0x00,0x00\n"
>>> -    "\t.globl\tafter_illegal_op\n"
>>> -    "after_illegal_op:\tbr\t%r14");
>>> +extern const char after_illegal_op;
>>> +DEFINE_ASM_FUNCTION(illegal_op,
>>> +    ".byte 0x00,0x00\n"
>>> +    ".globl after_illegal_op\n"
>>> +    "after_illegal_op:")
>>>   void stg(void *dst, unsigned long src);
>>> -asm(".globl\tstg\n"
>>> -    "stg:\tstg\t%r3,0(%r2)\n"
>>> -    "\tbr\t%r14");
>>> +DEFINE_ASM_FUNCTION(stg, "stg %r3,0(%r2)")
>>>   void mvc_8(void *dst, void *src);
>>> -asm(".globl\tmvc_8\n"
>>> -    "mvc_8:\tmvc\t0(8,%r2),0(%r3)\n"
>>> -    "\tbr\t%r14");
>>> +DEFINE_ASM_FUNCTION(mvc_8, "mvc 0(8,%r2),0(%r3)")
>>> +
>>> +extern const char return_from_main_1;
>>>   static void safe_puts(const char *s)
>>>   {
>>> @@ -49,8 +56,9 @@ static struct {
>>>   static void handle_signal(int sig, siginfo_t *info, void *ucontext)
>>>   {
>>> +    int err, i, n_frames;
>>> +    void *frames[16];
>>>       void *page;
>>> -    int err;
>>>       if (sig != expected.sig) {
>>>           safe_puts("[  FAILED  ] wrong signal");
>>> @@ -86,6 +94,17 @@ static void handle_signal(int sig, siginfo_t
>>> *info, void *ucontext)
>>>       default:
>>>           break;
>>>       }
>>> +
>>> +    n_frames = backtrace(frames, sizeof(frames) /
>>> sizeof(frames[0]));
>>> +    for (i = 0; i < n_frames; i++) {
>>> +        if (frames[i] == &return_from_main_1) {
>>> +            break;
>>> +        }
>>> +    }
>>> +    if (i == n_frames) {
>>> +        safe_puts("[  FAILED  ] backtrace() is broken");
>>> +        _exit(1);
>>> +    }
>>>   }
>>>   static void check_sigsegv(void *func, enum exception exception,
>>> @@ -122,7 +141,7 @@ static void check_sigsegv(void *func, enum
>>> exception exception,
>>>       assert(err == 0);
>>>   }
>>> -int main(void)
>>> +int main_1(void)
>>>   {
>>>       struct sigaction act;
>>>       int err;
>>> @@ -138,7 +157,7 @@ int main(void)
>>>       safe_puts("[ RUN      ] Operation exception");
>>>       expected.sig = SIGILL;
>>>       expected.addr = illegal_op;
>>> -    expected.psw_addr = (unsigned long)after_illegal_op;
>>> +    expected.psw_addr = (unsigned long)&after_illegal_op;
>>>       expected.exception = exception_operation;
>>>       illegal_op();
>>>       safe_puts("[       OK ]");
>>> @@ -163,3 +182,25 @@ int main(void)
>>>       _exit(0);
>>>   }
>>> +
>>> +/*
>>> + * Define main() in assembly in order to test that unwinding from
>>> signal
>>> + * handlers until main() works. This way we can define a specific
>>> point that
>>> + * the unwinder should reach. This is also better than defining
>>> main() in C
>>> + * and using inline assembly to call main_1(), since it's not easy
>>> to get all
>>> + * the clobbers right.
>>> + */
>>> +
>>> +DEFINE_ASM_FUNCTION(main,
>>> +    "stmg %r14,%r15,112(%r15)\n"
>>> +    ".cfi_offset 14,-48\n"
>>> +    ".cfi_offset 15,-40\n"
>>> +    "lay %r15,-160(%r15)\n"
>>> +    ".cfi_def_cfa_offset 320\n"
>>> +    "brasl %r14,main_1\n"
>>> +    ".globl return_from_main_1\n"
>>> +    "return_from_main_1:\n"
>>> +    "lmg %r14,%r15,272(%r15)\n"
>>> +    ".cfi_restore 15\n"
>>> +    ".cfi_restore 14\n"
>>> +    ".cfi_def_cfa_offset 160");
>>
>> Ping.
> 
> Acked-by: Thomas Huth <thuth@redhat.com>
> 
> Laurent, do you want to take these two patches through your linux-user branch, or shall I take them 
> via the s390x branch?

I will take both.

Thanks,
Laurent


