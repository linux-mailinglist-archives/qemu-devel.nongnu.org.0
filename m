Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 639045EC09A
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 13:10:18 +0200 (CEST)
Received: from localhost ([::1]:47630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od8Th-0004nZ-Eh
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 07:10:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od8Kb-0006R0-LW
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:00:53 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:53177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od8Ka-0003Y6-1z
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:00:53 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MMoOy-1ovl7024U0-00Ikry; Tue, 27 Sep 2022 13:00:50 +0200
Message-ID: <bd97df02-e4a5-42b6-e00b-7b163af7066a@vivier.eu>
Date: Tue, 27 Sep 2022 13:00:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 2/2] linux-user: Add parameters of getrandom() syscall for
 strace
Content-Language: fr
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
References: <20220927093538.8954-1-deller@gmx.de>
 <20220927093538.8954-2-deller@gmx.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220927093538.8954-2-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:RAwmfu6EIlkohweEZd3mTamjlcFjF2CPY8CW/ZhTZTPsXSPw0UT
 cKI9lbM3LKPaj+i632zKpY1ViLeMcZCKM26R5QnCtc7bFD17qCilZea2nppjMRTuu+avzz5
 g4AcgcbHbQuhZfS9t2+RStI/eQECCljuRnMxrmIIOrvTxv4ta9Cwcm7iQH1OL3F9/bl9vhG
 ic2GonhTANw55UPyk2xaA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5MLxLzZVE8k=:wqR7lAZ1J/s4Yzwus9zyp1
 dAxmAXVcngYcTCegOyVG2jnisG9/U9zQIeKoq2Etw7CYc3RnvYYZ0IPNiGclLOxajLxGlXqzB
 4ehoXE7DjIIgvYblWwQQVt4tE8W1xosWWbQ3SBuVO51ZK0ncBUQnPdOY2AUDUxHh6Bnu6TlKl
 gtmK5gIMtH89hVo1uQOOPj8219bJppabjkqxuCCRuNgQ9VFy+4xmMk4QTRtgzfMExA+n9czRs
 UmgMwJ62FT571z93EyvRppIV5mr43L8DYWD+nWvzho2W2BUhfE8GQ5Ix+hPQ9GaltxNNyUMu7
 zyKYERzBf+n5FOfdk5Nf+xbiZmNv0MXQGkvDjUPcEo21hOP5VrvsUsA/Sr/6N3ngUYThKb3Ra
 CSUF1V/Qo3jTKaIU8cbX4C9AGOxw13TWZmGGaoFOBxUXJ6hkThe8cEgR3Jrblmt4wijAhEabe
 U9kPlkffsJibgEDsUymFnVWIGI+fVvYflgLsIZO8ee856U7h9xulXv7tK2nRTyTQrguRTRpJt
 6FltgSQ6usIC//defDdQNuB7kKDKGjUrJqy/FCLR9MfxpP/WACPAdQJSwR4l/ax2INqjgvs9w
 I5yMaj0buwrzTq8NNTiCy/8WTZcuLcU2vTXq3j/8/YARz0IrUR1kUH/rf0MkW5zD26f6rrxjj
 999q05dPSjrYTePeNusOyIhkmigXizDVdmRholQv7Yft6wYdIkN8vminJOAFxAnMvmAxV+lT0
 DFqQlTh7YQz59ULNlr8y3JuSZOIAVYIT5M+Ody01sFznO1XYyoDavvBV/zQ/eX20kpn3/IZAU
 DsJ91VA
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

Le 27/09/2022 à 11:35, Helge Deller a écrit :
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>   linux-user/strace.list | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/strace.list b/linux-user/strace.list
> index 31a2ccd76d..9bb234a584 100644
> --- a/linux-user/strace.list
> +++ b/linux-user/strace.list
> @@ -358,7 +358,7 @@
>   { TARGET_NR_getpriority, "getpriority", "%s(%#x,%#x)", NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_getrandom
> -{ TARGET_NR_getrandom, "getrandom", NULL, NULL, NULL },
> +{ TARGET_NR_getrandom, "getrandom", "%s(%p,%u,%u)", NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_getresgid
>   { TARGET_NR_getresgid, "getresgid" , NULL, NULL, NULL },
> --
> 2.37.3
> 
> 

Applied to my linux-user-for-7.2 branch.

Thanks,
Laurent


