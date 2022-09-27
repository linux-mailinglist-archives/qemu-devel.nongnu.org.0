Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 071C65EBF3B
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 12:07:10 +0200 (CEST)
Received: from localhost ([::1]:45262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od7Ub-0006Ev-4D
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 06:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od7KO-0002aU-1S
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:56:36 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:52937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od7KM-0007ze-3R
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:56:35 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MysiI-1pOmCb3W5q-00vvrJ; Tue, 27 Sep 2022 11:56:31 +0200
Message-ID: <64e7fbfa-c3f3-f75b-88c6-de63b3a657b5@vivier.eu>
Date: Tue, 27 Sep 2022 11:56:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 4/8] linux-user: Convert signal number for FUTEX_FD
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220829021006.67305-1-richard.henderson@linaro.org>
 <20220829021006.67305-5-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220829021006.67305-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:HFj+wisphorqfy6oOM9rh2/JCDGbZMW+/lE3hlTtFaQpt1SWqlm
 TKkA8ExBEeLPCBglgGEg9CAI/P4PEys1SOZW6vZnEscz3BMhUhL4kM5yzWtj89u0P1ZlNpH
 sZHmdmONTBQmKeY7sHYS8VFEQPLB78ZXm0hIgybI8bxhyoNLZBAgOkRd4Sje+ex38ni6wyM
 zDeYFac15yXqiR3CqKFPw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:R0x8K0aZF/8=:4JGyLTtbYAP3a4vThWzD8+
 poha4FjYHXy1w2eApoSJPChorX3M+o/oaqwfTjuYz9ukKgMSwy0p9z7CGrT4yetEVyHJzu8O/
 7tS1uXews9SDusJEvNK/FDjB6sUm3vaXmKZilNtrTrqgkS4O8qDz+ycJg1mFox3a9TTeYTnne
 /sU/KXJe+PvWN9n/IUhKWfvIVgSxXaZFEv25GDvXGD8w1mi6Xz+QZJ7iVdN60db17HrSox1Wx
 dEwwrGFXGIPJFvrIC85KLlkHiBX3VVtCt+NUfz3LKSGF9K9I5bbMz+E68OGtCRvoA7BqshXbm
 jqnfpnCsf2ZcvPh93BPnx4lxNYo+hEOk1xJAZEAEU/k7wYgcabKjmCIUFJixaAGG2FH/HKlYp
 6SOLlVxmyW3KibrPSl5O8CdhD7mwuR99C8cJeyAjVuAE2DNEf2t4CTqnJ41wXRvJg1waVuqha
 mcXrOk2i/06H8Mq7eyIYRS/eOJ+8f0CXDOfcLPiVIUvGro0RZ6lBYwZrgjrnD5FuUo/I4MwFr
 9YJzTGyDftghnNZsiLcmaSd8vB0hqfkhl1dPpDMNu5ZElkUUN+FoiU+eXhpoX84lxJOpS0IER
 vWUhHzASgE6fFmq9X12gpc6Wyn/3WRbfcK6DzEtY5/EzqaBL/qPJ1Pscvnvi5NY9ULobKsjKn
 CgwW6oTB2b0tnSzEqMlD8JlIyNdDlfs3THbboKp+IOJoBWzZ+fLU9d/YDi9kJn+5Epl5foaw4
 mY7cpFkEITJLSgMgGHWt22SP2SY8jFTA4SZhHkBMO5LDTVKiMPYAFHeGEY1eqr60UzmLsOx9r
 NqAZthA
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.319,
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

Le 29/08/2022 à 04:10, Richard Henderson a écrit :
> The val argument to FUTEX_FD is a signal number.  Convert to match
> the host, as it will be converted back when the signal is delivered.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/syscall.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 8bf4b79a9e..f50cc70f1a 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -7778,6 +7778,7 @@ static int do_futex(CPUState *cpu, bool time64, target_ulong uaddr,
>           timeout = 0;
>           break;
>       case FUTEX_FD:
> +        val = target_to_host_signal(val);
>           timeout = 0;
>           break;
>       case FUTEX_CMP_REQUEUE:

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


