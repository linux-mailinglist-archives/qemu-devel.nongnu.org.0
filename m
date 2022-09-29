Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4234F5EFDD9
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 21:21:46 +0200 (CEST)
Received: from localhost ([::1]:37498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odz6P-00068R-CM
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 15:21:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1odz2O-0002di-FA; Thu, 29 Sep 2022 15:17:36 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:38493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1odz2M-0006cP-V1; Thu, 29 Sep 2022 15:17:36 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MlfGs-1p4l5525NC-00imdU; Thu, 29 Sep 2022 21:17:25 +0200
Message-ID: <c295edd3-894f-6b90-7d51-e34de24d1879@vivier.eu>
Date: Thu, 29 Sep 2022 21:17:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] .gitignore: add .cache/ to .gitignore
Content-Language: fr
To: "Wang, Lei" <lei4.wang@intel.com>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, f4bug@amsat.org, qemu-trivial@nongnu.org
References: <20220907150010.2047037-1-lei4.wang@intel.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220907150010.2047037-1-lei4.wang@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:h95zg2IX6AWEokoYw+dJ2agcTi1ia7Sz5U7DdOtqd5GsEAErHbV
 wb8DjYD2IZw9jB4sbBTnnklaUXzFMEQBnDRJQfSW7pMoxZ9tSj+t7b/AEdq+rY6WHAr9XJy
 VG8oHcClwMbi+S4CxUuVa8Sz/TF0LXWDLPAGsbR8VER1pND6HXqdVsQqMfPgh/djWOmavkt
 jtG+Mevv72nZytpNudFoA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:H0u9hVSF7fo=:mHof1dfNuSDDa5prOLeCve
 zkKla4SaDcPF1yGVCrB/R2OjsgBrvKUUjB7qZghv8HM4/auPSYbHwEgj83GdLJfL27tsmfDW/
 z05/V+GV2uT3r+3Ki8JACEfxVObVD9QXBLxCidoftmPBRKPT+bvUTD1HO6BPGDzzUv+Cemb/1
 m4BgeEd7ZkrysaEWv5mh+DyUlD1DY9spivxUWWbC78yy1AaTSJRQFHJ+aA/kiw1vyweR+T8Fu
 LKIZBe4VWBIXCzblUDhLvp9a1/TB5VI2iDHMe/xXjL2T3cuw7sR1W4Ud1LlkqHfQdMJ0UNDNf
 Hed4BpnLWbMUFOl5AxAiGA2ntni1Odj9BM9tFdAUIso/0hmM6d1wm7ZoSSG4ptiW7XlnCMzPD
 Q+iE+KQ432osbkH0m823R8i8mvOqZOMVC8DduTjwZDxAF9PGrKOii/9DLvUmMlXgu2eTRdFkN
 5b2mzgWOl1S761KOf7xxICfKFOUlY/fhGdJMlFT2F7Qatvtlgn3K2669z3BuoCmmUsLQnfpMY
 4y/hpBNHh8MV/lIYfxiz558wrqTo33ph9Z9VaHhMKeNKQ0Z72yk1/ZZYSJYIDIpy8CBJZm+Et
 SnzaHbnR7w0vo0qMeav7Y4Gq6343f3u87GCVOT2lnSBeZj77Z6GnSK7t3wJNTpf1EjsN/HGXA
 uMqfzZ09VsZJswVI7on9HE7YbhkB71NT1vmomqvELg9nbZce3yBW30D8gtNzmv79oHBBD5Pbe
 kbn+kC1AMD1qcQoWDcC8kXH6XpO2sAzjSkLQSiltu/gAh4NI689IpkO9EaOMqGxt0GdIj43DX
 ERur+ux
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.099,
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

Le 07/09/2022 à 17:00, Wang, Lei a écrit :
> $PROJECT/.cache/clangd/index is the intended location for project index
> data when using clangd as the language server. Ignore this directory to
> keep the git status clean.
> 
> Signed-off-by: Wang, Lei <lei4.wang@intel.com>
> ---
>   .gitignore | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/.gitignore b/.gitignore
> index 9726a778b3..8aab671265 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -1,5 +1,6 @@
>   /GNUmakefile
>   /build/
> +/.cache/
>   *.pyc
>   .sdk
>   .stgit-*

Applied to my trivial-patches branch.

Thanks,
Laurent


