Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA452543B18
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 20:10:06 +0200 (CEST)
Received: from localhost ([::1]:42286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz085-0003L9-Dc
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 14:10:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nz06n-0002e1-0l
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 14:08:45 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:58495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nz06j-0003Li-6M
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 14:08:44 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MNL2Y-1oNi04335m-00OlWZ; Wed, 08 Jun 2022 20:08:38 +0200
Message-ID: <09f9a931-6873-bd98-74ed-e1d17318d76e@vivier.eu>
Date: Wed, 8 Jun 2022 20:08:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 0/3] target/m68k: semihosting cleanup
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220607222616.717435-1-richard.henderson@linaro.org>
 <56b31126-41c5-e7b6-5b32-2b64ba1cce67@vivier.eu>
 <8f833280-b1bb-d4f4-6603-5be44ee8e9b7@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <8f833280-b1bb-d4f4-6603-5be44ee8e9b7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:JaZJGSZ0YzHSdLOFuTLEPFTGmDLDy71N8K9s0og4rA0nz4AEiv0
 wMpp18gl0DYNUrYfTgT090b2LanOehDW1vFUgNhQE2UTBEZCq/c99jphV0Sn/y41IhpmcyL
 iooIufaMBoEre5udHiLhs8jGME0+s9B9p69NED/Di9rQmAjpcdvkirSXVJB1jARzhAcOgxT
 XjSqd9jSrn7QpkeFh8EbA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WgY0ei9oDzw=:2BXA7sj6nzAlH0DZEG0mb/
 UcbVKa38CKCH+pZLImfVebFej9ljJ0tbENq3ftoAVosR7A92KTtIOHat3tnCpRvFy1fOThS0s
 CWv+y1vHOYZkzbr9Te8JsnFyTYjUG6knnKBQZo447kstD6vSkjo0FFT781llh+BjHomX2xeBI
 RLYYrfUOMnfqlaMi1qubFhXLqJdG3XPXE4T56SumQALFJbTtT8wpHNku6K0ODWiwoFEzi7UhD
 52wL3OLS2ayqxxeu7+JwAF8O0foQ5ZY2P1DtrXdo0iVeL2q1fdigceBgCQzPkHTUaNrTScUW0
 Pmfpj6KHTAeIrQquBXD1ybnkLWE7M46PFhbUcnf6iirmHrewivsrxJLOlgBLWO9bdIvQmybyb
 uhJMW+OCFEgOTzPF1oaDjBzckwSzENRcWvMO9ESH8JFxU89sW1MKR6ok6YQ2MEfurkMS2HuX7
 7fZ7UYWcGkXUaXIZO8pcW/9X+GXmF1rIAHXfQvWkeUWSZtrZ2YPRQb7XKLhNlW5wI+zy7wAcV
 vDBDhqLJqntAVL/QitdeArw5M23QWlsXHHx193jTWPsU6WESLFXy7KU/RXS++1i/IEZANAuD+
 5HjQxJIb4CmJKY8FTQ3VIFkLbuaQyzdZAbCelKwtwaC9xlsdKGi4C5UwNUUgNYehnQBo33m7E
 1KlskVcKOkpS57REcN+1hpkQnqJzV/RdRxzBd2ufqWjJDJA9RWtcCRzEr8SmdxCc0tLdZ+q7f
 bMh0jQ2/NAssquBYUX3epMDwxq+hRKAc3nmKOA==
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

Le 08/06/2022 à 16:53, Richard Henderson a écrit :
> On 6/8/22 02:36, Laurent Vivier wrote:
>> Le 08/06/2022 à 00:26, Richard Henderson a écrit :
>>> Based-on: <20220607204557.658541-1-richard.henderson@linaro.org>
>>> ("[PATCH v4 00/53] semihosting cleanup")
>>>
>>> Changes for v4:
>>>    * Split out of v2.
>>>    * Convert host errno to gdb errno, which for m68k is guest errno.
>>>
>>
>> How do you test semihosting on m68k?
> 
> I have only compiled this.  I had been working on adding something to tests/tcg/m68k/, which is 
> where those halt patches came from, but haven't finished.
> 

But what is the use case of semihosting on m68k?
Is there a kernel implementation available for that?

Thanks,
Laurent


