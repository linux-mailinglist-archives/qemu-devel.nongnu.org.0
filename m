Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3330D484925
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 21:18:11 +0100 (CET)
Received: from localhost ([::1]:35172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4qG1-0004AP-PP
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 15:18:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n4qET-00038I-Da
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 15:16:33 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:50865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n4qER-0006by-Nq
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 15:16:33 -0500
Received: from [192.168.100.1] ([82.142.30.62]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MDgxt-1nDKgu29fb-00AmLQ; Tue, 04 Jan 2022 21:16:27 +0100
Message-ID: <93c0bcb7-3064-9450-81b6-7621b68f2e9f@vivier.eu>
Date: Tue, 4 Jan 2022 21:16:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] common-user: Fix tail calls to safe_syscall_set_errno_tail
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220104190454.542225-1-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220104190454.542225-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6Rb1PImW5FG1BXoZ+y5Ogbic42qnG5+9FHcpB/7QZ+NdfQNPrKb
 /OQ8NArCysXk8hecM2Kr3bY66Cgz9kyYB58VdcxYrLU23p740tBBtwZ2yTUf/rzb9Q6mU97
 bnvccXpM+XBVOKME/FVhU2imzWYm4UwqFdNrC/2TdnhMIbs5vyNlBo2v1lIGAHHMqcQFfLY
 SxZWaQt/lLV5AAV0QtJGA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uOb4juMIA0c=:YYPwvfu7wX3oztUr3ifvxQ
 56VuO+LJXi93fwZTUDR/Bz5VI+OH8RYxuFNP8q9h/emJ14E/6TLg2ZxFeCCZh+rkTeKeS45e1
 GwUkL9rYBu8WlCkRrdZgt3NPnKWewOjtcjEJUOSATVZaMPbSOaxCNbcVNsJ1VQhPXaKJE8QfV
 T0j+ij44e5sXatjbiUCET078gruRIO413qzeokKcrkvNV6m7U5Eu401y0j2ySBX2n2LtYSLsa
 2YDnfpGPLiI4z4qA7sPhQgOwNJGISyw4Syn39VrZ9xj/vz46DUAAxZnm0fGAAdgMuBxID4k26
 AZTguIRs2InbMm1f3z57ZtCVY4+9sa8t9aqxtIVynrZdetXYiC+R5D8vfN+WSQGOdN/JOW+qB
 DA9ioHLqCarWORwDgVTrm5Z3kcTSZ/z05qX21r+X/KRaX6Fabut7aEWotAu4fsVf3Rz5bKgS0
 61p7MmKFFMWJzQa4v8nDWWSkxK0hU/wQfSLO7tj7NAME0k42bNScrqA+vE/QhLdx9Wafy05SJ
 4E3ZVD9wVGeFpC7DtKfsgFY2tRh+u83xdW9eHmgAH0Z1yTWMJE70a2VzpCcTfjzVrh4AdzZxT
 zel3l/3DFKkycZo42DrxfsCa44XNbGFtNu6dCP14Y+O+BbNTwj8g1Epxmqk7W5oN0JsR8aq31
 O1i9r1ibXmcPMtOVkPAg2CpGjixntx9NrQ5Fn2hhCjfEBFaqGiWsw6UDngMb37DV5fZk=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) NICE_REPLY_A=-3.354, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

Le 04/01/2022 à 20:04, Richard Henderson a écrit :
> For the ABIs in which the syscall return register is not
> also the first function argument register, move the errno
> value into the correct place.
> 
> Fixes: a3310c0397e2
> Reported-by: Laurent Vivier <laurent@vivier.eu>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   common-user/host/i386/safe-syscall.inc.S   | 1 +
>   common-user/host/mips/safe-syscall.inc.S   | 1 +
>   common-user/host/x86_64/safe-syscall.inc.S | 1 +
>   3 files changed, 3 insertions(+)
> 

Tested-by: Laurent Vivier <laurent@vivier.eu>


