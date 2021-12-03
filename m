Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CBC4679E0
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 16:00:05 +0100 (CET)
Received: from localhost ([::1]:59806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtA2d-0002ad-SD
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 10:00:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mtA0v-0001Px-Lp
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 09:58:17 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:57751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mtA0t-0000uN-Lg
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 09:58:17 -0500
Received: from [192.168.100.1] ([82.142.19.82]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MmDAc-1mBGYW4C6S-00iFhi; Fri, 03 Dec 2021 15:58:13 +0100
Message-ID: <279356d0-de72-6577-6bc3-ff03b483cc3b@vivier.eu>
Date: Fri, 3 Dec 2021 15:58:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211202204900.50973-1-richard.henderson@linaro.org>
 <20211202204900.50973-7-richard.henderson@linaro.org>
 <0286cb5b-0aee-be3b-7343-e6c606b1eadc@vivier.eu>
 <ad52f239-1595-8631-f992-c594ae5755b3@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v2 06/15] target/m68k: Fix address argument for EXCP_CHK
In-Reply-To: <ad52f239-1595-8631-f992-c594ae5755b3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:PaUBCHzWNlK89TpdTBtCiwFv92VQuBWYkq3jdoccSgYGeZf9qsI
 jlYPcLwl44jdk3RLCq4C5X2mnahKITddwnF5hrp+RJC2n9ZV76MxM7lEZAZDnL6OmsSF1Bw
 UkrTkKWPelfRK6DwrOUEiVoC+r/Puici3SyDJ+StDl5tXuMUW8tpyZWs/+GN4Hx2XhDB24N
 x6ol7sX8lgWH+HNfWFNlA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KwXQ4wwW4b8=:xY5URedoklVELLs+bxrBsJ
 4bl5FeIVFI/HvV9n/X7ZkncDqtZfqFR0RaBbc3MsO9jLsHYMF/C/iSteM4emmnqBJPA4Pmlfv
 74U3smX6JYlK6iDAuvwIAvmq4w62mdUfGHwnki9rBQMdMbFFeIlg900x800mHdF51+zlN0hzA
 u0Hv2Sb0s+Ls8V6B2TeUzfJKyc48vAC4hXidm/WYOP5g+lrKlRnGxDmGMsP4Mg1yBZv34xtug
 Mc8TjHszSfC/x6dje6PeAJoUgt86m6S8acnziev9GN34Qo2BZHoKi2ZkZhjRB5KWk6CRviJQD
 pDo7x//6tsvc6oCY4bksedLtum+NVtHiIbf5KnFkqJNeoYtNwEuwULYYaxYHLaVfrPYTplsNd
 2GOo46nORd+pSrpe+hryoz9rrMptw8eWG7/Vdk2dc+J6McH5RAISEDwhM5cwe68/s1wBZHzXJ
 OmUhxf6DTQ8C5QL5OUsHXOcE10V46ZhcgI+Yin6/isIz6P9hiDpqxFi5PehP69X/69Q9+zBQE
 oy2Efku4432bPZwW2LS10P9Uh5sGaupk+jUYvgFbRdBC5VDU+hmQqF2d3X05HLMXRuM8Sxl8k
 XcbCMgqhg8Knc0yT3WlLY3vIfbXxmHH/uzodRjRDDZ85eYZxas4LjiKTHHDiBOpDoj0tmpfFK
 xS6v28pHjUP0PIHafT3byO2hX8gZv5UCvwt4bizizG/7nxyfgxCWRX7uGkYfHt6zsoQI=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.938,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Le 03/12/2021 à 15:29, Richard Henderson a écrit :
> On 12/3/21 6:27 AM, Laurent Vivier wrote:
>> Le 02/12/2021 à 21:48, Richard Henderson a écrit :
>>> According to the M68040 Users Manual, section 8.4.3,
>>> Six word stack frame (format 2), CHK, CHK2 (and others)
>>> are supposed to record the next insn in PC and the
>>> address of the trapping instruction in ADDRESS.
>>>
>>> Create a raise_exception_format2 function to centralize recording
>>> of the trapping pc in mmu.ar, plus advancing to the next insn.
>>
>> It's weird to use mmu.ar as the field is used for MMU exceptions.
> 
> Should I rename the field to "excp_addr" or something?
> 

No, I'm wondering if we shoud move it or duplicate it. It's not clear. I think we can keep it like 
this and later do a cleanup.

But I think you should add a comment in CPUM68KState next to ar to point out that it is also used to 
store address of CHK/CHK2/DIV/TRAP/....

Thanks,
Laurent

