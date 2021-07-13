Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0E93C7016
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 14:02:59 +0200 (CEST)
Received: from localhost ([::1]:36468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3H7q-0001Wc-5W
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 08:02:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m3H6y-0000nP-QZ; Tue, 13 Jul 2021 08:02:04 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:45257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m3H6x-0007ES-2b; Tue, 13 Jul 2021 08:02:04 -0400
Received: from [192.168.100.1] ([82.142.17.146]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N6bsG-1l5KHs3gcw-0180bH; Tue, 13 Jul 2021 14:01:55 +0200
Subject: Re: [PATCH v3 0/2] linux-user/s390x: signal with SIGFPE on
 compare-and-trap
To: "jonathan.albrecht" <jonathan.albrecht@linux.vnet.ibm.com>
References: <20210709160459.4962-1-jonathan.albrecht@linux.vnet.ibm.com>
 <8f4dddf0-51ae-4bcf-1a33-a8fdd6cc7054@vivier.eu>
 <164fbc7d882876098a9d8f0899fce1d3@imap.linux.ibm.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <f9bc4183-f3a3-ab16-8451-e72925ee0837@vivier.eu>
Date: Tue, 13 Jul 2021 14:01:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <164fbc7d882876098a9d8f0899fce1d3@imap.linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:xo8CPkV46GiNKmjRaIVkwChJkm6RsRXjxVVwUH9Y+J7IthoPZSx
 ZE2X6Tm0dBohrY6tMynk2b347EEqveMYBNqJbyJyBfc7K4xGmRnI9SP7Sn6XK1m50ghhTU9
 fof7gQs/3SZ3axN+UnHgmJ6YUY4V8dnfyBkLYZaiTLCIlcHVT7A/mDvJ+fcPZt/dekbGfRx
 zZQDY6S8bvy9r5Vw8V11Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Baxj7jcKmRg=:5eZJsx3fC73f463jnEkwya
 S8fd2jW6E9x5u0ugRyvpxdaD+r4E0JwAEF5bkI6MbQIg0kmNoI7c5OJp7SgmOq1vQ3oeUFAA9
 qoeuV20AxIe+9M6V6cBRGsmANzfxzB6Q7QbZYx7uCTQlHINFPQFZb0Vfdxibf+Q+Cbn8D/OCb
 xD8DIbR4fMWmDpLZ98m0k+Do1UCv5QsrYuj7phM0m7iNXvuFy2g2AhzIAOywcp86ENH4fl4qF
 iqgki4ksGCjzRGEfC3ivjia1ZGxWtsedXcMfBWuUQFfHfH98Vii/tfTcUQXOqa/7/E86mNzLg
 NkTj2hIXZbdbdD3zdO1yYRQrd+WLw5vuN+3bEQmgXAIugV4RYX7L9XxSytqKa5yagN2ZRQnpc
 U2X6HJ/6moQYjxoMNdeu7UkSONagUZwu+A9Wee5G+V3mLPf87bZs3prHXApBnEWd0L6d5R7rQ
 sVIyBwAvvVjT7JjMXYHruFUwtRDfyN9zcRndY8U92EkWInMOVkaOtUmw1QNRitAB5moAQyVeT
 Lo3ZPgWOqqThgms1qgzYfx2mX1WNPf7xejziNL26805teNwTN+EGPWt5Iho5d8PDPsc+UYXbY
 LZIUZDSSxw/Rn3TG+TUFPjg4DxN5KHOQ8JzVPYiqwSldcvN8zLJwfFhSX8EF8zcdxpa+Suvzh
 I6N7YhIjB0H5MI5kMqTtOeqKvphre1gGG2PebxPY2zVom4215B7hGgdbXKtpj8ShL/8p+73OK
 nbcWP0gxKCK8qVQpiBriQagUbLAvghN2/6YUdoMznPbcLyQcajw3rKxMlweHmVN1r258RalzM
 1MoCqwUjloV86zAUC9R835YxGkDWa4ucvTJsIiswoK99hzx7fOertXweFYovK+8AtbI7rO0
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.368,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: ruixin.bao@ibm.com, iii@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org, krebbel@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 12/07/2021 à 23:29, jonathan.albrecht a écrit :
> On 2021-07-12 4:02 pm, Laurent Vivier wrote:
>> Le 09/07/2021 à 18:04, Jonathan Albrecht a écrit :
>>> qemu-s390x signals with SIGILL on compare-and-trap instructions. This
>>> breaks OpenJDK which expects SIGFPE in its implementation of implicit
>>> exceptions.
>>>
>>> This patch depends on [PATCH v6 0/2] target/s390x: Fix SIGILL and SIGFPE
>>> psw.addr reporting
>>> https://lore.kernel.org/qemu-devel/20210705210434.45824-1-iii@linux.ibm.com/
>>>
>>> Based-on: 20210705210434.45824-1-iii@linux.ibm.com
>>>
>>>
>>
>> Series applied to my linux-user-for-6.1 branch.
>>
> 
> Thanks Laurent, I see this series has been applied to
> https://github.com/vivier/qemu/commits/linux-user-for-6.1 but the following series that this is
> based on also needs to be applied:
> 
> https://lore.kernel.org/qemu-devel/20210705210434.45824-1-iii@linux.ibm.com/
> 
> Did some local testing and looks like missing that series caused
> https://app.travis-ci.com/github/vivier/qemu/jobs/523853464 to fail.
> 
> Oh, just saw Ilya's email that the test patch has not been reviewed. Hopefully that can happen so
> they can both make it in.

I've removed these two patches from my patch queue. I'll do a new one with both series when they
will be ready.

Thanks,
Laurent

