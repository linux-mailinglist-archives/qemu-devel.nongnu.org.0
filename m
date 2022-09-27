Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E38C25EBEBC
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 11:36:09 +0200 (CEST)
Received: from localhost ([::1]:57888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od70b-0005pJ-0J
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 05:36:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od6tj-0006RO-3q
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:29:03 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:44677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od6td-0003i5-OS
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:29:02 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MOm9H-1otIIY3rJ9-00QDaM; Tue, 27 Sep 2022 11:28:50 +0200
Message-ID: <d3cab69d-27e1-c484-0784-a2d9c6832708@vivier.eu>
Date: Tue, 27 Sep 2022 11:28:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2 1/2] linux-user: Introduce stubs for ELF
 AT_BASE_PLATFORM
Content-Language: fr
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: f4bug@amsat.org, qemu-devel@nongnu.org
References: <20220803103009.95972-1-jiaxun.yang@flygoat.com>
 <20220803103009.95972-2-jiaxun.yang@flygoat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220803103009.95972-2-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:KijQFaR/9ELGzfPGJCkPw3fwu1p3u7IBf/z1nV2HVibRRgY6/xi
 0EYMaBYCGH4KGLfR6uiUPUH8AnHNSwExhHNwYMl2P1778UEqh4Bm6pCRuOXLyIukts2xTwf
 Z46VUvlxOTpaNh5IQdXaj4Edg9Xruxck4XzD8jgvjKH1FzhRC5I4SgozKhWZ5Lpc6LJZ1Ux
 VYfohy1/7s73p8QWJBPqw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:s/iTDasrWeM=:h5yvvzG25M/xRhd/RitFwQ
 QRbxj0c1q2+hDSb3JjLEvtFznWZC4vJU8Fq4OtxDiQth70Nu3kzmGq7kb54LnDg9XDecW4Xpk
 PJF84M4DMMqcLtG4v8S2G938JGxcmvLyTBBKiCRUOTNh6SD5m2lGSq57hQohYhtR5IxDIeeSV
 V1X3z78tsQ5C1M4wPVTvLH7UeZIVvhTHRnbp4iGbacieSZ9BZOkF7Jqj+tUdpqjEK6pO4gPef
 VASAfTh1Dw/FbRi8vAVEO2g6Un5s7f82igqS2vUK8xrGmR0V2aN3BLfV4sTHk77YWfe1t5sno
 PBKFJDh79LDNUJOuxIjgz0PD1lsI4eg2UyFDY1yUKUSp6wJrH/dbYseIWZworrqLiI1XmdNAG
 J+u7U36aUSJc48n2ekBq7+KDEHdhg7JMQZLliHSMSk4GURPW33hCWa5Cg2r8b8lFPKHFmnQ3K
 uRitnvA1eePx1xZ0+w45x0inceI3b1rBejGBJXQFIgPGPJOdccMyjzZ53vKq4616xT3mMz5Gc
 iXywxVMby7goxTXJA1WouTiwah8wIoBlZjBN0EHjFuzbr2RSm33fQOcjHVzEuzXPohI3fhi++
 R6Bj3iy5wxd5v9T4jr+jIi4V7FcChyAsCKLpJpZT+Qg76E1EW16pMf+JjYRniPzerNetdoqVy
 02cSz7twEjn/d8VFgqtgIGlfFNuwKYnjJaBEBrJEZL5z/orWUUfq2k2K/1jLIOQ8h8F9b5YtJ
 D/zil3aN0P0UC/bhotFqFgQayJLc4aiuvVSZi4R/4w58WwJQeZLHuPEwkdGfJC/ugU5u51QmJ
 TEUh1da
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
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

Le 03/08/2022 à 12:30, Jiaxun Yang a écrit :
> AT_BASE_PLATFORM is a elf auxiliary vector pointing to a string
> to pass some architecture information.
> See getauxval(3) man-page.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   linux-user/elfload.c | 29 +++++++++++++++++++++++++++--
>   1 file changed, 27 insertions(+), 2 deletions(-)
> 

Applied to my linux-user-for-7.2 branch.

Thanks,
Laurent



