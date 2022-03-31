Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2284EE1C6
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 21:35:51 +0200 (CEST)
Received: from localhost ([::1]:48820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na0aE-0003hm-Lz
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 15:35:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1na0Xo-0002OB-6h; Thu, 31 Mar 2022 15:33:20 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:56125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1na0Xl-0000mk-PM; Thu, 31 Mar 2022 15:33:19 -0400
Received: from [192.168.100.1] ([82.142.13.234]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mz9lL-1nvxGo2S5z-00wBXJ; Thu, 31 Mar 2022 21:33:09 +0200
Message-ID: <4c36c35d-b992-43d1-f90e-cb30ad1d0e06@vivier.eu>
Date: Thu, 31 Mar 2022 21:33:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] tests/lcitool: Do not use a hard-coded /usr/bin/python3
 as python interpreter
Content-Language: fr
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20220329063958.262669-1-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220329063958.262669-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:xk7bxR26qm4d15v7yVUuS3Aw0UG0PZREBDVSxhQmJQbxdn51IZ4
 cA0T0rdObL0VkhiGxoN0GnIM2jA96B1JbF3EooJwU+EcPuGUF186w6ytlrZCPbuRKlnEwwU
 YDb5W75rt1phTqH9XK0P9exRauPO6bx8/RP1iVum1mi/T0ZJG5vEmLRtRwC2U8ZB5JwZHNi
 kBZiGR93krNFwDPUXJeug==
X-UI-Out-Filterresults: notjunk:1;V03:K0:P6k+VeD6RmI=:opaPj98SC9xII9oiNyoYx2
 r7xHwICtMot3LcUvw2PGKu+qRyBpZPelqxs7gQvrK0LAPt/oRBFTFZQrB4jFces/0JT7TVNE/
 BxBrcy8kng7Wr8YovgEMU3SM7HLNy4IOFbffjdqZLe4qqBQYkpMGCK5UMEeFRnHRlug9jEwOp
 bxcileZBUHycEk8vfRTaYH8O6pjHbqog9yPB4oOEfIVpZd+BvGEHzchFXghz/XP8LpC/KTin+
 LQH6SGEzBu5Ddt4hHAOd+4BY74VPDbZQGNAkuFgDGtD+Z5eDW7fvE+5cN0gJm9sSRV/GMywBg
 TCu8e3JieqAnfBMWneimj2DOvcmUgXCqVHW5BGmXuLEjsXmw8h2oEU0tZwaSv5jZnfm6gnLof
 aCrvsZyrs/bgh7d6e3vKWWvrMO/qFdq4Ih3Cjbp+CA4foXN3pSdoTBbi8iM0kyI1VHrHH4TQl
 Eb3nz25kAc32Sv7yQLnaajCFOQnouGhgyAVjf6AaliH379Q3foBZG/m/xvstCzh7F3Z9HSA16
 bsf1g/zguMRqVJNuJ9My3iJ9fTgmbyU2ZDX9lAb3orQqHJQwyhyEtPi6lRj30FsXe42arT5jj
 bwucwtwRStdgv7PR6UMEs+RqEgs6UQ3xAkWIjQmP36UdoGRJnse932NSB7bjPagcmKb6HvnoJ
 D8t2V67sDIuPUGz6HECKpCilQezz+/hPMpxtOzFPaEgdjLwtXwVzMCChASvciiBPNglA=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-trivial@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 29/03/2022 à 08:39, Thomas Huth a écrit :
> When running "make lcitool-refresh", this currently uses the hard-coded
> /usr/bin/python3 from the script's shebang line for running Python.
> That's bad, since neither /usr/bin/python3 is guaranteed to exist, nor
> does it honor the python interpreter that the user might have chosen
> while running the "configure" script. Thus let's rather use $(PYTHON)
> in the Makefile, and improve the shebang line in the script in case
> someone runs this directly.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/lcitool/Makefile.include | 2 +-
>   tests/lcitool/refresh          | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/lcitool/Makefile.include b/tests/lcitool/Makefile.include
> index 6b215adcd1..3780185c7c 100644
> --- a/tests/lcitool/Makefile.include
> +++ b/tests/lcitool/Makefile.include
> @@ -14,4 +14,4 @@ lcitool-help: lcitool
>   
>   lcitool-refresh:
>   	$(call quiet-command, cd $(SRC_PATH) && git submodule update --init tests/lcitool/libvirt-ci)
> -	$(call quiet-command, $(LCITOOL_REFRESH))
> +	$(call quiet-command, $(PYTHON) $(LCITOOL_REFRESH))
> diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
> index 1f00281b44..2d198ad281 100755
> --- a/tests/lcitool/refresh
> +++ b/tests/lcitool/refresh
> @@ -1,4 +1,4 @@
> -#!/usr/bin/python3
> +#!/usr/bin/env python3
>   #
>   # Re-generate container recipes
>   #

Applied to my trivial-patches branch.

Thanks,
Laurent


