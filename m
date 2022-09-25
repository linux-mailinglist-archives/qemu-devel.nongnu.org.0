Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 521FC5E9424
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 17:59:11 +0200 (CEST)
Received: from localhost ([::1]:44144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocU2A-0007kK-FR
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 11:59:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ocTzZ-0005YX-A9
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 11:56:29 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:56623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ocTzX-0002Z7-Mb
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 11:56:29 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MIxBc-1owkhR1xIA-00KO58; Sun, 25 Sep 2022 17:56:23 +0200
Message-ID: <ec489f39-2cb3-9690-89bb-62d6d42c8daa@vivier.eu>
Date: Sun, 25 Sep 2022 17:56:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 2/7] linux-user: Add proper strace format strings for
 getdents()/getdents64()
Content-Language: fr
To: Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220924114501.21767-1-deller@gmx.de>
 <20220924114501.21767-3-deller@gmx.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220924114501.21767-3-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:1grdgBDejd7iA5zU+RMVZiiIUUod16s2uR0PBAhEdC/DCKQTQ4W
 glIZTBATy0Se/hPGB3lqQuioGHodR3LNnTgrmnWsrW4i6hnTMdoLpDgpLY688q70Yv6IWSf
 LecFEiPhbGyqUx2J4bhIYa4MIX5XZ+74XPP+qKi//igHhs5UpEn8AQFKWOZadxiaGdprD3u
 3B2PsYARDldsysrHUI2QQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZjyXS2DLq58=:STWmgoxQHWejYFUPqfubXT
 MojtklBntm5oEFEF48YdcfwiekBJGlFtCL7rneU2Vy78RuscAgXuoISYPyVlZKddvPSeF55vz
 CUvoYtuoYfQT6tm/l+gJrhazTZD0V7x4kV9FDzA7Qd8EkwBIGvUIFXNZmdngfxrxhGPVtlYBa
 pN31kbxzlPpLSnHbmKXDey4pUXriIhF/jVnTzyXZ6Eo7O7Dg2skwutJQmiU89FkyuicbqRHjG
 o8RLhfCiEkud5gbsbE4GKyvLFyCbV7Wz00tMiqxrXxD/pjUOuMOYUNXLzvWd7mCDzpYmIyyzK
 ZzVwyFbAxSkf77Cl8bQdLmMzzf4KVWlRfG0Kg2P1w+JBfToz/Rhk16DkFlLDKYx1IaZMGs3tm
 KP0AURFbqT9trOxKhtxTlyO1NV1dtUXU5edyknQLQHPma6CQ3+BQybuAauRbfwHXVN87PYca0
 DjXkEBOx78vdN9wGqkZ8UWxLCcmQx8WnaQGZxpIvK3MZRN+2ODIO2j4lGvzg0G0I3GduIlKt/
 ixlw1pA1/VPNwZdBDtBtrv7cvwrLUT1VbAY56L671JqJY4TsJ/p/rywo6ph8pRwcVO3JOu5JW
 YzwMV7Y4NuxlT7T/cl1ej/944rnhzWFMTBKmwCINZ6CdeglExLW79PRgIFEi41rryn52tuMjh
 TiVyXMjF6DoH6ge5GxOsETIhtcbZPC0mO8cFUopFrFiJpp9EIu3hmt9IQHvWgeMrVsldcalAK
 oIilmWC9C685cIfHclT6S3w8lHj4l+dQUQDTo2EgMdw0niKlPNkFRTg/Ti2tFesthTRuvJslZ
 Q437A4L
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.766,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Le 24/09/2022 à 13:44, Helge Deller a écrit :
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>   linux-user/strace.list | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/strace.list b/linux-user/strace.list
> index da8c1bf34e..bfef568d18 100644
> --- a/linux-user/strace.list
> +++ b/linux-user/strace.list
> @@ -285,10 +285,10 @@
>   { TARGET_NR_getcwd, "getcwd" , "%s(%p,%d)", NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_getdents
> -{ TARGET_NR_getdents, "getdents" , NULL, NULL, NULL },
> +{ TARGET_NR_getdents, "getdents" , "%s(%d,%p,%u)", NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_getdents64
> -{ TARGET_NR_getdents64, "getdents64" , NULL, NULL, NULL },
> +{ TARGET_NR_getdents64, "getdents64" , "%s(%d,%p,%u)", NULL, NULL },

3rd argument is a size_t.
I think it should be TARGET_ABI_FMT_lu.

Thanks,
Laurent
>   #endif
>   #ifdef TARGET_NR_getdomainname
>   { TARGET_NR_getdomainname, "getdomainname" , NULL, NULL, NULL },
> --
> 2.37.3
> 
> 


