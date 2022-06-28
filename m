Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC6955C0C0
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 13:37:51 +0200 (CEST)
Received: from localhost ([::1]:41044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o69XS-0003AM-Pa
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 07:37:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o69Rd-0006vF-HE
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:31:49 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:52611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o69RY-0005fL-H4
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:31:49 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MjSwu-1nLEqV1Ay2-00kwxe; Tue, 28 Jun 2022 13:31:41 +0200
Message-ID: <571af860-cf2b-4af7-9158-aaabfd577d82@vivier.eu>
Date: Tue, 28 Jun 2022 13:31:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 1/2] target/m68k: Use semihosting/syscalls.h
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220628110047.666612-1-richard.henderson@linaro.org>
 <20220628110047.666612-2-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220628110047.666612-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:eAr//QOP5gBaFUMDSEEPXOLBrF9KjVxko4LEUkShoJ7b9xeSHfB
 b+KY8WEzvyH9eM/l71tb2FlXc87tSb9/D5uiL9doqpR6OIn2DOjN6RCigdDGvgukU+sXcNJ
 iQ3KIwt1i7OFUjXvYhKriYwtBFO0I15vGTNNA3hJMbaVHDh/CpGSJIbzSPHw7VmM3CqlkQ2
 cQdcaAiqy48j3m/90cP3g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GNKXxn6tl/I=:5HInwncAhZ4fQuJ4Yq4POT
 QhtOdlDHHhFpZtJRuZOQiWRqMKBNmbTy5z5y3sly76cKnxSpSvL7VfJuPikg/diNCSOF6+0lx
 XNG1P/9xgJt5B9jwo6+pDxVna/UGObUoo481+2NaG8NIcuECJOGaHzcw4Sb+1MnaBBsD8XJkL
 87+PmDtCR/q84rsTigHQ1P0FI++5FRqY8+6HXfmmKO41Kmh6e0TR6VrLZYDFPID2WeYQWw9NR
 o4toPmIL4wZRyO88/yfgRlUcGMBkGgvWrlrtapzESk8QhnKbyyep93VtQR9jxP2rxxeACuNGI
 T4+5i/13pjOGAM1bsqBkBpAJvUCxRhh9ZCSrxXuN6pwbJ/TEgrSeuzj8vxnUbcrOVQspyB2OA
 APWG1mIEOko2zo0Cdq/BN77PJBbxM20YD9CgIJ0+KSIj/8KKDUHMi3UU7z+tV/sWTtzuhnxNU
 vIAFX8fG7heaKFU/ySkawig0SL2O/kRPpBRWs+uw/nQB464+rZr2LwXvo0TpEQWufiLOIVzOo
 4aDhyWWJhcFiino320tJEvtMwfW91iuzCKG+E9paeCese+YvgYI2Wz6R0agQ5ENpe8toIkSQ9
 E8eces1uo5mQnu7Txlg59X2aR3goh6ZY482GUPDgOSEa5uC4/MR4RrViHqlLOjPqM6QnHo6lZ
 bdyQ+/SM2JyTI/sCV8tVgtggMia5iLryxscgafFkDfsIQ8TWrIMmkC7uZTkk2d9r1asB8owZt
 yx8ZuFAf9aI4oEaqXpuaTta6PrwWMyHLUjTAbg==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Le 28/06/2022 à 13:00, Richard Henderson a écrit :
> This separates guest file descriptors from host file descriptors,
> and utilizes shared infrastructure for integration with gdbstub.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/m68k/m68k-semi.c | 281 +++++++---------------------------------
>   1 file changed, 49 insertions(+), 232 deletions(-)

Acked-by: Laurent Vivier <laurent@vivier.eu>


