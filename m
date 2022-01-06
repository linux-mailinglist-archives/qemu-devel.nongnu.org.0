Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A717648637D
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 12:09:32 +0100 (CET)
Received: from localhost ([::1]:58350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5QeB-0003Dj-Q0
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 06:09:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QI4-0003Js-U8
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:46:41 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:53591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QI3-00067N-FD
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:46:40 -0500
Received: from [192.168.100.1] ([82.142.12.178]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Miqzy-1mQbpQ0eSi-00eu38; Thu, 06 Jan 2022 11:46:36 +0100
Message-ID: <10eb36e7-0d95-602e-fc07-16394efc26f8@vivier.eu>
Date: Thu, 6 Jan 2022 11:46:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 0/6] linux-user: prctl improvements
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>
References: <20211220214135.189157-1-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211220214135.189157-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qB+pfuqpsmFwdn1dAAAJOpXaf3JwF7AubqDu5/JvPPPVqXYvO4t
 x3Zu5LbUFNMn0qxtdUUTTMcAufqq0/d2uNonLfPC0btEZyujp3VvGL/qFx4/yJFHPe/WE+I
 EBs3CHQbziHbwCqfTnBxazJDnQ/wJNSCKrTpRZVYn6/PUq0dci7CcXfFZSRSxIoj3qDCWt9
 qpynTFEn2eMd+5ARMivWg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hU0kJzZGnt0=:ew85eDwsPIZHykXA1D/aAn
 IhhYMkwAc9WxrmsMe6c02Vw2wwXKIXdjIiJCpBKj8fz3fz2a7s1RYHjs5WXkyit87RXTIQ0IR
 S+GNLK+BjlCiMVHRbJsuUK613UszgfeNkHvHhWgxN99KYTiFdzyPWFe4tJn1PRwi5ByI2dQtR
 Ly7WqoAkAji2J15XQ8ZZ5BEh+EbskrdQtT6Ck1codVx05BNJ76smVnLwrVIRgLcMttKke6bOQ
 /Ceyc22qaC2E6dkmu0t28mOxyL03n/pc0i1UR9e3lbrgO8CZ5OvLhmM+ccJLmi1b5XgvWHpva
 +qd71Lr6w5IMVK8OBIKpeG5zjj0Gq5T7jYhIvx1E+EuMLKKOETZuQ6ARBHSzP4C+CVUhCXyb+
 FWUTWI/xIt2p/Dt26JPDJB8oStJ6ug4io2hVn3If2Jwqa0YSs+9zzLeqauicwaJGq48SRYLTi
 zFu448lJ4qIrQOMr6dPhCJ/vxb8m1Fs7XQwn04qcmY2alHCD1JX0tU3gEDoQ6IZK4dCFW47cF
 MeRz5fuo1pwcCDt6CJwB3IjPvffmYzHG/8/4QWzNC9QNohvK8vHbaoJi+z9t378EZxpgjwjAR
 pdIFxWPycKTnRjJgA2WGdYTc4PB5HV9vV+A2HEcoLW7NqTKUMHzmn9Y9WwuOPwXkYg4BQkgp1
 EH7Rdi0X6rzBCaiItDhge7Coa+0XRxWWovQEcH55SQ1nSegCGRspdInjTUa0EiH98t78=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.691,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 20/12/2021 à 22:41, Richard Henderson a écrit :
> This is split out from a larger patch set for unaligned accesses.
> The changes in target/ have no effect without the changes in tcg/,
> but this allows the syscall to be handled separately.
> 
> 
> r~

Hi Richard,

while I was testing the series for the pull request I found some regressions on commands that were 
passing on before and are not now.

Could you send a follow up patch to add at least PR_CAPBSET_DROP and PR_SET_PDEATHSIG to make the 
LTP testsuite (20200930) happy again (capset02, prctl01, prctl02, prctl03)?

Thanks,
Laurent

