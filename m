Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BA967B34F
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 14:31:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKfrK-0003e2-EQ; Wed, 25 Jan 2023 08:30:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pKfrA-0003an-AX
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 08:30:28 -0500
Received: from mout.kundenserver.de ([212.227.126.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pKfr2-0004w6-15
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 08:30:28 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MI5Dj-1pQQTb3SSN-00FD1o; Wed, 25 Jan 2023 14:30:12 +0100
Message-ID: <10887328-9d15-0cd8-c496-af85ac717a2a@vivier.eu>
Date: Wed, 25 Jan 2023 14:30:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 0/2] linux-user: revert previous workaround for glibc >=
 2.36
Content-Language: fr
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230110174901.2580297-1-berrange@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230110174901.2580297-1-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:UpMXeU1h8B5dK/sblz5Ole7/RLTT9AEEJRTsLfiD2zviMV4fmyA
 RHFWarTTlnkcpHKYy+ao2hDHxthClWytpN2PqF6rj9dJTn8ovqzR+S7F1W10CU6uVeb0Lq6
 tJ2neTmo70jTJgi5lOzhlBTC8xFKd563HuDamW1Kr/bZ4ccP4mb5DQBYlht7klEYV3INfgi
 myI0ufoF5ftwn8fUduc7w==
UI-OutboundReport: notjunk:1;M01:P0:vi1BOpyEdjQ=;GLUF7pmWII3zMCZFl6MXA/iwDXi
 sOoh7eyFMcgFryLnPKLe6yzZS9vJY2kq58b92LuhBcVTBwxJaDE2h2LAhvk3Qxtuwf8FBcOXR
 O9Dnsh2+Vcie/NceGe+oOa0B05zkPZ/v426/p9sMl8fu+Z1ddNT1GP4ZG5Sbu/9Dq80eel9js
 zJnSBaagASjFmkY08JyX4WILad1Uk8n2tfKtf/OhPtRXGlN58tqI5sirke1rD1skBAKWbCk0S
 YRsWw4+/vJBine0Xst/cfY685boR4MFkqMabVubSUdn30kifPn8JQx6sGcnSDN5XQZI4xlB57
 /LtdMFzxVk8clcDJuXiY7JFm+fq2iyEZaGgxIUzPCc0fbMhb0cyhDmv84+tSfVpa9GPhW7Zak
 af+nQ64d6S80wFjo7tQIB7KVWKALpk3FhwH5+TSjneZNWhX1tduNo2DVWSNj5bebgBL5/qEJI
 l+klcz49in06Tf+lr+DTPgUZqPdZ5F6q4qm5l8HFl9wXn4ZUj02V2x9LvIGr33EcxLGj8Ui5A
 ZzdPP2yt/qA0qy+Vunh/731wDHnYskWylp/wXucwOrA/o66OLSp8sodaJ2ZvlIGDXy1rIFaln
 M9j5XNuWOqwb8iBv+k25GLgt4MCGficCf2CbopIjMcbXPVCp2xvVnDVPfaoNouIDLgT17Vyj1
 md5fhsyS1THkY7dqeJ4UUU1VtwBnXsI5UvGBekV2Dg==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.148,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 10/01/2023 à 18:48, Daniel P. Berrangé a écrit :
> It didn't appear that glibc was going to fix the problem
> breaking includes of linux/mount.h vs sys/mount.h, so
> QEMU applied a workaround copying the symbols/structs we
> need into a local header.
> 
> Since then Linux modified linux/btrfs.h to pull in
> linux/fs.h which caused a clash with our workaround.
> Rather than invent workarounds for our workarounds,
> we can luckily just drop our previous workarounds.
> glibc has been fixed after all, and backported this
> fix to the stable 2.36 release series too. We should
> just expect distros to pull in the stable fix, which
> Fedora at least has already done.
> 
> Daniel P. Berrangé (2):
>    Revert "linux-user: add more compat ioctl definitions"
>    Revert "linux-user: fix compat with glibc >= 2.36 sys/mount.h"
> 
>   linux-user/syscall.c | 43 -------------------------------------------
>   meson.build          |  2 --
>   2 files changed, 45 deletions(-)
> 

Applied to my linux-user-for-8.0 branch.

Thanks,
Laurent


