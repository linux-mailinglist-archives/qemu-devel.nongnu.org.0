Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 813013C64AD
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 22:04:01 +0200 (CEST)
Received: from localhost ([::1]:49172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m329o-00089d-3G
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 16:04:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m328f-0007QZ-7D; Mon, 12 Jul 2021 16:02:49 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:41343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m328d-0000kR-9k; Mon, 12 Jul 2021 16:02:48 -0400
Received: from [192.168.100.1] ([82.142.17.146]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mth79-1l9fzW13qp-00v6JM; Mon, 12 Jul 2021 22:02:37 +0200
Subject: Re: [PATCH v3 0/2] linux-user/s390x: signal with SIGFPE on
 compare-and-trap
To: Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>,
 qemu-devel@nongnu.org
References: <20210709160459.4962-1-jonathan.albrecht@linux.vnet.ibm.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <8f4dddf0-51ae-4bcf-1a33-a8fdd6cc7054@vivier.eu>
Date: Mon, 12 Jul 2021 22:02:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709160459.4962-1-jonathan.albrecht@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fiIe5eaDp8tVyZ8b5W1Pq2MdvSwB927LlVWimqoMeirnNQ8hwHt
 mMRAwovdkTfhqEfuDMlO7CfLv3SoJtEYtDMGSys1NbHqtymJe2Nj9p1YUJ5YOol7Q58QPMt
 rfr7YeeBwdVGloMJFhY3aTtkoORrn+WaJ9XQA1t/z2Xhi5drjXLvmY9eo87wonlf5S8uPN9
 6YTVtqsF0R0ApsRBBJ1UA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1H9owmcoi9w=:jWcSkm92GEjKkMsceBbbBg
 JL3LIVdvxMs/nt8oaiuRUj416dyYr+40RFYlVmYV8wKE6SWHQxG1hXx47hgGrDZ/pIydJs6W2
 a9ZHUegxGbBdJobkUOto2PNvvKSynVXX0Jv9VV6grolpQytR+c0Ks/1Xv43iXfBKzLyM7FmPI
 xIRaUFnwpG4sUIainurUjaVNpGSBDRx+BlnQ0V0wBK2Yi5bHlCI4lH3C5NvheiIXBBpMfGfUg
 Uq8/5eW7P8Aoxm4aanRIGe3LDjJ4OfXVTpdDtn9HagZuv/2/euAbJMYa91U+eWoqgq6Q//mtI
 wTKGDeCRM798/394LIEdNUsD5liNDKUR3UCwAT2tas4RrQ5kaqNHKGVP7Irp0B68WK/mL8sa5
 mNF/7j0tgkgZmPNB7Sq2DrLfjcSFr0W5mDFR0QWr7YMKxxcegzk4zIgIcZgwrwRNVn93KFeMe
 a4bJHIcD/WcBC/WbM83FpEDhDdTpo07ZhaT2FmCLJkMD8NRGWysJX1bmfzkVySXyurxDHksr0
 Sm68Mzn/x72AJrHlCONtG+vXw86oQoUUrgJMnI1J7XypOF+4imehMwcpEihidV/EHheRX7+Fa
 cecaOWACTRHuB56bT/UYnkoJcuKM85zzKqPo+v/6+bSesrlI54rIO/QLSUvyuAD2zABgL7Dyh
 E1eV/XPqLnKtiWW7T8sVr4twJYhdFdmuLQNSztJnEb4RVmwYtFX2HzC/9IlZyrzBcAzAtGAS7
 sW94kcYYXivhoDQ7HoNFxVWHla0fuhULpofYf78irZKe2hvqCzrz30nT3zDst1oudBEI5QHO8
 uS9lP6MsDkda6Z0L/V5guemdD1DWkYu6+DeLXMKyEXiylnR3k+u2cTWkKZXYSss4fdzsHJ4
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.479,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
 richard.henderson@linaro.org, borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
 krebbel@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 09/07/2021 à 18:04, Jonathan Albrecht a écrit :
> qemu-s390x signals with SIGILL on compare-and-trap instructions. This
> breaks OpenJDK which expects SIGFPE in its implementation of implicit
> exceptions.
> 
> This patch depends on [PATCH v6 0/2] target/s390x: Fix SIGILL and SIGFPE
> psw.addr reporting
> https://lore.kernel.org/qemu-devel/20210705210434.45824-1-iii@linux.ibm.com/
> 
> Based-on: 20210705210434.45824-1-iii@linux.ibm.com
> 
> v1 -> v2:
> - Update to latest version of '... psw.addr reporting' patch
> - Rebase to master and fix conflicts in tests/tcg/s390x/Makefile.target
> 
> v2 -> v3:
> - Check for non-simulated IEEE exception DXC codes explicitly when
>   getting si_codes
> - Ensure si_code is set in all cases
> - Improve comments
> 
> Jonathan Albrecht (2):
>   linux-user/s390x: signal with SIGFPE on compare-and-trap
>   tests/tcg: Test that compare-and-trap raises SIGFPE
> 
>  linux-user/s390x/cpu_loop.c     |  54 ++++++++++-------
>  tests/tcg/s390x/Makefile.target |   1 +
>  tests/tcg/s390x/trap.c          | 102 ++++++++++++++++++++++++++++++++
>  3 files changed, 137 insertions(+), 20 deletions(-)
>  create mode 100644 tests/tcg/s390x/trap.c
> 

Series applied to my linux-user-for-6.1 branch.

Thanks,
Laurent


