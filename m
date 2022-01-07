Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A474874B1
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 10:30:58 +0100 (CET)
Received: from localhost ([::1]:50412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5laL-0004iM-3U
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 04:30:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5lXS-0003to-MB
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 04:27:58 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:39119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5lXP-0006MM-3k
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 04:27:56 -0500
Received: from [192.168.100.1] ([82.142.12.178]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MIxJq-1mmamn09sI-00KQFQ; Fri, 07 Jan 2022 10:27:39 +0100
Message-ID: <670ca57b-370f-f20d-5684-65191084920e@vivier.eu>
Date: Fri, 7 Jan 2022 10:27:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: gaosong <gaosong@loongson.cn>
References: <20211220214135.189157-1-richard.henderson@linaro.org>
 <10eb36e7-0d95-602e-fc07-16394efc26f8@vivier.eu>
 <f9533da4-f674-2c31-3c18-ce29698e4711@loongson.cn>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH 0/6] linux-user: prctl improvements
In-Reply-To: <f9533da4-f674-2c31-3c18-ce29698e4711@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:FJ+Hfp60LUwUZM6mXl7OYmw3kGW4XmjFc7Nx+Eiz73vIzyvTrCi
 YKl83Ix2UXUQoOLn5Jl6zFtqHdL2QT+HOXcrCR+vvuh7U66znpCql3UdO1+0tCqqXrE3hmm
 lRaDczBQxG34+us0vHz6gmMm4cPkLq7x+kWvFYiGlCsUsLXVU0k0TfUIbp0uJiStXXv5l+l
 RgyLt8iWeKheWg7JZBGPA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:eanOgFpquXI=:IRhMFW3Z+2PgVej1Unti9D
 9qcfMfd/6dCaPI8ej4d9u/7tN60FKW3EV2C7ERDLnraE6VJzScmBNK5R2CR6x98MTXGEljWAJ
 QaJIUTx3wRK7aRkZ4qYFzpfiWL9DQvHya8GQs7zhyxnmUSNPX7qYxKXtz/tHrz+X6PsQ6SXIm
 +e8NcpfZP4uCYJwfk16SulcWgRuu27tpxAKvkySiaIUqGGfQ1mdjCMpRpKj+txxUWTpoQVcuT
 hRhzio9Lis18M6QHcoN1BJPXz9xhsgdVYrnkgH6LWXYcN/BinkKTDUQGqoQL8M9uTdRN3v9JJ
 WQTav23itPMnlAtOuDByjBPQu92zn2rt+uXsVbSfstVieWv3zDjpfTWqBBimECXsVsDI36akM
 6vP29FqZX+Zh6uDzjTR5RzMnc4qMxvC5DBkdSZttcLz4HV/3cAA8t76Xjovcg66uBY+4umrMs
 YFvMukiXFoiW4+jNyqh2LgwO+6m5dHBYoHv6aCiI35aD8wUlYQfkHO+lkvONuCrVMRwpFY54A
 dEq4YYHJSgYOkpgJPbhtMMHxpOEtmbKIsNltRiZEKNEYnxSwoBbWUF50J3aDEwMd73jXV7c06
 89r5Qg4A7lCPDXl/M73fz4en1oBEue22JYW/bAiMabVz9nv41pKlASaE7PE1rgzvWsrmIk5rX
 uK+IpZ3ICt8rgMUxhq6oLXQujSXJRJFbtKKoXF2/dhEpXpxnJVh4KCfLG3iTL/DY1+aw=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Hi Gaosong,

Le 07/01/2022 à 09:46, gaosong a écrit :
> Hi Laurent,
> 
> On 2022/1/6 下午6:46, Laurent Vivier wrote:
>> make the LTP testsuite (20200930) happy again (capset02, prctl01, prctl02, prctl03)? 
> 
> Do we have LTP test documents?   or What test methods do we have for linux-user?

I run the Linux Test Project test suite in a container (unshare command) using binfmt_misc:

https://linux-test-project.github.io/

I have some scripts to automatically create debian chroots and build/run the suite inside:

https://github.com/vivier/linux-user-test-scrips

My top script is "run_all.sh" that creates the chroots and run the ltp_test.

The list of the targets I test is in targets.conf:

etch="m68k"
stretch="s390x ppc64le mipsel mips64el mips arm aarch64"
jessie="ppc"
wheezy="sparc32plus"
lenny="hppa alpha"
sid="m68k ppc64 sh4 riscv64 alpha aarch64 s390x hppa sparc64"
trusty="aarch64 ppc ppc64le"
bionic="aarch64 arm ppc64le s390x"

Than I compare the results with the previous run using diff_ltp.sh

This means I don't test architectures that don't have debian support, and only test on x86_64 host.

Thanks,
Laurent

