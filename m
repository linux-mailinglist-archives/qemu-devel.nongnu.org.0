Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A51948852F
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 19:07:56 +0100 (CET)
Received: from localhost ([::1]:49962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6G8B-00028V-Fr
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 13:07:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n6G6q-0000iI-Th
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 13:06:32 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:44165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n6G6p-0002LR-DR
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 13:06:32 -0500
Received: from [192.168.100.1] ([82.142.12.178]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M9nAB-1n2fk81TqH-005qc6; Sat, 08 Jan 2022 19:06:29 +0100
Message-ID: <53068dc5-06b2-de85-9d91-cb79c7bc7df9@vivier.eu>
Date: Sat, 8 Jan 2022 19:06:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 0/4] linux-user: prctl follow-ups
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220106225738.103012-1-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220106225738.103012-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:XDt1/HdAp6/ErceeaELABnl81GAaLp1AaMLb9BxPx6k0adv1hCY
 uNX7xavgjOG8Wm9mNu4vFR6ke6mUysBxOo64yAlp9f8BkxU9o2Cx2soCeRYPE0Ezl3Cd/H0
 8jmN/Zcg44ImEl9yUPZu8+Gf5H6IRMujJ0WW8tsXG+0KnymxCquWe7I5hsF2VCQKij6UQq4
 qwshHmjRBf7f3Dig6f5IA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:a3NqZJr1of8=:ybhMUQTVMcvBLgNki8oZ20
 XhllNLZSZJTGitaUAgA1BRb9kandDtgXErh+7QlNk6DdDDAN+WtQnSQs7xjzuSTHwJqha17Jj
 /ixrL1xgpXD81paBB5uELGpUqd/fguAh4NHQfSxOCVMQ4t2cBpQ0oYG3nad81qcTjjTTFA1A0
 wpy9LqUZAoTDEhle07wIdMtw0MqsV9B+zWgnXqEt5NIX6u+cWke4Pd138euPwmYEpT6U7z7mJ
 EW1Q3ut1bXLyawely+xQTXg9OyBWbdMFxKcN0AOUZ7ygUNMugNpH12dx5EXaS1NxpitV0kyno
 cf1EGih3/bRGTa07EGGvWxJgeEIdeKGlbRdo7zulay068nJEgt6EVWoLXYzZzURXs0CMpQToU
 5DEbvAPapDqwNJFm8wYE922jknOv17Fc8P75vScBwto6jMxHA+q/DfInSU6eRMDvSW7Wt9Izv
 rNLocdYl0duZOxP/n/3ZHwcIndUyZoJVprQUty6dORp4JOBZa6aeEG2HdBT8i8PsG30mSs8KO
 FUVJKRM+k98kqR+5NbrKTkX2QCHf7rZfsDmdQPTWJJbpXmZBj4NpPIC14AepJva1YO01SPFOW
 RDCBKDzloN7VaI0r1ylfTs4xkRVf6hfYxctYUBKwG22h1zff4VbgDcCGX4MjE7954/Jjq8eMM
 tBRuhV6EIIcq41jzHkra2Y365wOFzzWV0o62Pj7p0y/cMNitYrz72XQwHAVBLZWWX17U=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.199,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Le 06/01/2022 à 23:57, Richard Henderson a écrit :
> Hi Laurent, as requested.  I did all of the cap_task_prctl options,
> and fixed a few existing bugs with PR_GET_DEATHSIG.
> 
> r~
> 
> Richard Henderson (4):
>    linux-user: Do not special-case NULL for PR_GET_PDEATHSIG
>    linux-user: Map signal number in PR_GET_PDEATHSIG
>    linux-user: Implement PR_SET_PDEATHSIG
>    linux-user: Implement capability prctls
> 
>   linux-user/syscall.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 

Series applied to my linux-user-for-7.0 branch.

Thanks,
Laurent

