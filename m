Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D973540D7BF
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 12:47:22 +0200 (CEST)
Received: from localhost ([::1]:55486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQovJ-0005HQ-Ve
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 06:47:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQopC-0005m7-M9; Thu, 16 Sep 2021 06:41:02 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:44635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQop9-0006eI-UY; Thu, 16 Sep 2021 06:41:02 -0400
Received: from [192.168.100.1] ([82.142.27.6]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mv3M8-1micFY2nnk-00qy8O; Thu, 16 Sep 2021 12:06:20 +0200
Subject: Re: [PATCH RESEND 1/1] multi-process: fix usage information
To: Dongli Zhang <dongli.zhang@oracle.com>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713004718.20381-1-dongli.zhang@oracle.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <dae38fa9-b774-b81b-bce0-ff962e84b6e3@vivier.eu>
Date: Thu, 16 Sep 2021 12:06:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713004718.20381-1-dongli.zhang@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:cljIZFqySIgreF29A9GrcTYNUhQtGG1hmaupsypSVIck7lu5t3t
 Ygsr8V8inohn0OreZRCxYUAAVFUBpyxJbskcXDoSL/i5QzTpoiAwDrlD+E1mXR5edzBD1W/
 2opUCHH5vUoc09uT9ERKjz/RjxEaAMbIRHJHrhaDPvQNPiIl5hzbOgt6WN5vER+E6/c2nNB
 04pUE8D5jB/Km0G/QC5Gw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8JRi2jGYc8o=:u/ysYoViRMC/zUkt+z+vXZ
 1wDgLJM3454w6zMKspsUAY/68KJ68iRQoiTsTn66vOsyh8bNMapbAcZC7U6vOCHTtW+C1XiB2
 yBKkA+jQOOtvYE9gXgzzVps+5Q7lh9ykjLleQoFVJU/P4H7MWO11v3nQtlZmH4tVCe9aQSFe6
 hpeaw9xCHUG3QiwiSdCrgESvxrPy1PwMTcW6+lkDhgad/NjHYotgEzB6W9FaXCnkUFDfOElPu
 MOsDjcwtk8VLue4EILpNgqoN81fZYKy/uhR8k1qgQFEeffuKeqP0R4GlaMExLfegT1DZFifO+
 sEvTcs0on8VHbidqKgTS3oGulAX3wcwq3ROW7IVQG0fbH6sFt0S2DQE0FILC37/EDyuGDPn0R
 l8yY6vFvgzxeUIhNwsLo45HTvxt3QcniY07iySF4OGWkXu12ZAEGfDAhtZAJk9H3l16ZVYUTH
 6K6L9QNJNrFI6tC2QfIn89Sq+e1YtcZctHMUsWQj2zMg0qfQ3o/9xZ+pnltWQl6HRXBFtIGaO
 Aqq1JYF/OdKhDi5d61J6ZlgDuTJv2LdeicFZBQH71hvOdHXpjUSujAtPM4VGqZIGCYRz5bBAN
 P7xyWK8Ppel1q62zW+8V6491SeCK/Qo2S+ep5t/Tl5YUi2iMs4VcG3BGuK/0IZwDBiu/Q2YI2
 ZNdMcQiZqIxtw6x6N1zlJkHdKcyP5rMGtijiGdU3ZxAKa5R8bTpRa2lBShX0UKNrhXmmkW8Me
 wsM1SosR6iSEqWpovFy+gPAwTOPROQP6qEBl+R9khhsiIQqmO8ghOKG5Yu2rnQp3WAnjpk+Hg
 xQL7BLX
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.698,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: elena.ufimtseva@oracle.com, mjt@tls.msk.ru, jag.raman@oracle.com,
 john.g.johnson@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 13/07/2021 à 02:47, Dongli Zhang a écrit :
> From source code, the 'devid' of x-remote-object should be one of devices
> in remote QEMU process.
> 
> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
> Reviewed-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
> Resend to be applied as trivial patch.
> 
> I have verified by reading the code and playing with below orchestrator.
> https://github.com/finallyjustice/sample/blob/master/kvm/multiprocess/orchestrator.py
> 
>  docs/system/multi-process.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/system/multi-process.rst b/docs/system/multi-process.rst
> index 46bb0cafc2..210531ee17 100644
> --- a/docs/system/multi-process.rst
> +++ b/docs/system/multi-process.rst
> @@ -45,7 +45,7 @@ Following is a description of command-line used to launch mpqemu.
>        -device lsi53c895a,id=lsi0                                         \
>        -drive id=drive_image2,file=/build/ol7-nvme-test-1.qcow2           \
>        -device scsi-hd,id=drive2,drive=drive_image2,bus=lsi0.0,scsi-id=0  \
> -      -object x-remote-object,id=robj1,devid=lsi1,fd=4,
> +      -object x-remote-object,id=robj1,devid=lsi0,fd=4,
>  
>  * QEMU:
>  
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

