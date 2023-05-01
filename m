Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A7F6F333D
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 17:56:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptVrb-0006HH-UI; Mon, 01 May 2023 11:54:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ptVrW-0006H1-C7
 for qemu-devel@nongnu.org; Mon, 01 May 2023 11:54:50 -0400
Received: from mout.kundenserver.de ([212.227.126.134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ptVrU-0001gr-Dr
 for qemu-devel@nongnu.org; Mon, 01 May 2023 11:54:49 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M72Xn-1ptoyo0s5H-008dqE; Mon, 01 May 2023 17:54:45 +0200
Message-ID: <aac07e1b-5b6d-1c07-cb4b-d5357ca785e8@vivier.eu>
Date: Mon, 1 May 2023 17:54:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/2] linux-user: Add new flag VERIFY_NONE
Content-Language: fr
To: =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <thomas@t-8ch.de>, qemu-devel@nongnu.org
References: <20230422100314.1650-1-thomas@t-8ch.de>
 <20230422100314.1650-2-thomas@t-8ch.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230422100314.1650-2-thomas@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6koRns64lPUQiRjpDalHUB4fnkgRdoab59OAsEPbtvnACWghrIm
 UNMsoyeofkAt13nHHq2YyUOPSvdK/RHFHJEZ6DUs/ThmajFOGUASJa8t6yn1A9MPnHdjXoz
 MQ1icXzCFJWsVgMdawnimClDNaOfpWkcJhIH+xmLq+3UXXCkWEN2kq7eYGMQUhLvjyl3FNw
 HWUJI6Gm+mfSRdf0ukVfw==
UI-OutboundReport: notjunk:1;M01:P0:VBkuwM3UEEU=;gNb8/oRKJma63PQjWheGdhBRaJ3
 ZLXrg5NM4oHZrs3qvCInnedpQ6u8crg4Nc1yWsQ+JNUBPRwrBt8eql9nF906vpXPh9BxsvVdO
 kwpWRLHIAU+lFHPJyG2/w0ZyqAXyLCpweo8g3BCvKh7DBS/9nFIb6RFNwGsekNTs9A8j4x2yv
 mcavIzKHU45ceM5qCRfwN7fCP0f2JLs0C6wRUxliw7w9ESCPkg5ahcDmki2v9a7uMYI5I+c48
 OtqBW0V+eY0Mn4bX7sOPtUJzsSfmFlucw9EGunXs+rLH47CRWPf4Ic4e8Ub7SAHp7G+SLeT0O
 6eVnzR0Rs4+CqxAuWUjFWqhrM7y9sJJxS0cQMPxnryy1QsvP7C3p6XcuXAvoVQGUQnS4aJBww
 SnT5gOZZoX5QccRpO+acKJ3wFTu5qMZNhjNqhmwNREW6Vk5YqKu4pFkeDN0DM3u5O6UcT0s6n
 F9EuAEb8ZimnCGWExktmMkZlC9+Hc+QVFXX6O9TyN7Lvh+yITEChTZdFEsNyV4tjJUevM78Lu
 FsY2Oh+q3Mizvf5N83EA6wUDVBZ9cjjOSH6ngkpygDTO3F5tf0BKNCZ3gKc/WjtTlvV7v8YoD
 2LyC2nI2jrQWRMo1BG4Oc+9F9kc+hHNunqR5l91dUBpVxAANJ/FgajijdtkHBqJ+DolI6to7i
 ahiHAJ06wQcMIi66L8G1f7AIL18sP+dtI9k+ZR1vPg==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.422,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 22/04/2023 à 12:03, Thomas Weißschuh a écrit :
> This can be used to validate that an address range is mapped but without
> being readable or writable.
> 
> It will be used by an updated implementation of mincore().
> 
> Signed-off-by: Thomas Weißschuh <thomas@t-8ch.de>
> ---
>   linux-user/qemu.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/linux-user/qemu.h b/linux-user/qemu.h
> index e2e93fbd1d5d..92f9f5af41c7 100644
> --- a/linux-user/qemu.h
> +++ b/linux-user/qemu.h
> @@ -168,6 +168,7 @@ abi_long do_brk(abi_ulong new_brk);
>   
>   /* user access */
>   
> +#define VERIFY_NONE  0
>   #define VERIFY_READ  PAGE_READ
>   #define VERIFY_WRITE (PAGE_READ | PAGE_WRITE)
>   

Applied to my linux-user-for-8.1 branch.

Thanks,
Laurent


