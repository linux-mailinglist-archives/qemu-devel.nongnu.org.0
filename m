Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1542244C5C2
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 18:14:19 +0100 (CET)
Received: from localhost ([::1]:52630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkrAw-0006Zm-2D
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 12:14:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mkr1g-00066i-48; Wed, 10 Nov 2021 12:04:44 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:47525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mkr1e-0001nN-7N; Wed, 10 Nov 2021 12:04:43 -0500
Received: from [192.168.100.42] ([82.142.14.190]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.184]) with ESMTPSA (Nemesis) id
 1MQ5jC-1n6ld40ciG-00M5w5; Wed, 10 Nov 2021 18:04:34 +0100
Message-ID: <26f2b736-bcc7-488c-6f0a-34bacd7dbc70@vivier.eu>
Date: Wed, 10 Nov 2021 18:04:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PULL 03/54] target/ppc: Move load and store floating point
 instructions to decodetree
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, peter.maydell@linaro.org,
 danielhb413@gmail.com, groug@kaod.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20211109055204.230765-1-david@gibson.dropbear.id.au>
 <20211109055204.230765-4-david@gibson.dropbear.id.au>
 <fed70819-21be-b375-b2b8-2c34618f3d11@vivier.eu>
 <e69dd6b9-dc86-7887-8374-0caa196705ce@kaod.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <e69dd6b9-dc86-7887-8374-0caa196705ce@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:V0jVdiIQrx7rsQ8gewIXT4nGv5wwjVicX6E5py9Wdmg/AjObYCW
 ZagxNkPDlbEyKwI7a28R8AyVD0EsGrFjOfCx5E0mDMKuQhzbO70qpa4dJ7CkD8AoI+NJx6G
 /YDPEBTn7Ksk1301c82ySsQGZip7ZuJULN6PvO0Osb4hjEs8kaQk3h24pFr6XzloNd1NuWb
 uIFM+8rWdHRAOiTcg7Csg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Sp62ZCiibDY=:XPsTNJLFhwdOvgNoL+xF8S
 ZLWNgouUeMcRAH8TWnwDw+dRDUtB3YnIo/xvWZeHSmQEd7yeFiWCizrgbhm0/oNiGNFzUUycy
 qBfg/8Ld1rmslUhqra0sS8bVSfzJoKZDnxhcHeBoFtkg+ke+ZAiIheDlQWT25d6/yE1GFsjtO
 Xx+Ck8ZUIozYYTrUXpBHDpZ1of+e6fZudW5lzsHiVQMb5ERAE2sj9kr1wLMdDTNkRBoB4d62A
 13a2w+41kZTpKJ4Tt30lAzBkGW2606ZgYwSJGMI6TQTwtfv7aHokI63DPWsB9uFvB7NaiWhc+
 AmKiUqyqj/+lSTgvn/9Y+b6e4MgnwIqFf4sB7HOJGwlzCFjWyGWz80C7Uh5/v5pjUFMGqgsH5
 yoBM+jxPXYftbvcDr/hPqU9L+e5kRKFh+wySN9QOqVLe0on4XgDpzBa+WlmloftFtRAq0r3ib
 z7dGiGXSFPYpKc+B3BIaRAGOFcPGj+oEDHy2np2NFK7UJ4gG9sefv6RFon535VvH14lCF79jU
 4kShotOUfkjPwxkPU3xJmuZEA5ER/WndPfO0zdf3nDHXVbLUB2N5DLwXlK1SGqStq6ffHpEEZ
 +nJWfyMdGzIgmUhlOx+OPa2F1b2Nwue/GP9fUvufUTERpPyuWB/jLrbj3SEhxm8hj8i+4TqcA
 6RbyXxitl7aj4qunynCYVBio8madm+uMlMhZVjS5DO5V3FGILd2pIcXtgHw0bhwTMpG4=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.678,
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
Cc: Fernando Eckhardt Valle <phervalle@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>, qemu-ppc@nongnu.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/11/2021 17:56, Cédric Le Goater wrote:
> On 11/10/21 17:33, Laurent Vivier wrote:
>> On 09/11/2021 06:51, David Gibson wrote:
>>> From: Fernando Eckhardt Valle <phervalle@gmail.com>
>>>
>>> Move load floating point instructions (lfs, lfsu, lfsx, lfsux, lfd, lfdu, lfdx, lfdux)
>>> and store floating point instructions(stfs, stfsu, stfsx, stfsux, stfd, stfdu, stfdx,
>>> stfdux) from legacy system to decodetree.
>>>
>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>> Signed-off-by: Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>
>>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>> Message-Id: <20211029202424.175401-4-matheus.ferst@eldorado.org.br>
>>> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
>>> ---
>>>   target/ppc/insn32.decode           |  24 +++
>>>   target/ppc/translate/fp-impl.c.inc | 247 +++++++++--------------------
>>>   target/ppc/translate/fp-ops.c.inc  |  29 ----
>>>   3 files changed, 95 insertions(+), 205 deletions(-)
>>>
>>
>> This patch breaks qemu linux-user with an ubuntu bionic chroot.
>>
>> The fix proposed by Matheus [1] fixes it for me.
>> When will it be merged?
>> It's needed in 6.2
> 
> 
> It's queued for 6.2 :
> 
>    https://github.com/legoater/qemu/commits/ppc-6.2
> 
> I wanted to wait the end of the week before sending a PR. Unless
> this is critical for you of course.

Not it's not critical. It can wait the end of the week.

Thanks,
Laurent


