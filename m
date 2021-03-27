Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A68934B598
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Mar 2021 10:12:28 +0100 (CET)
Received: from localhost ([::1]:47088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQ4za-0002hk-QB
	for lists+qemu-devel@lfdr.de; Sat, 27 Mar 2021 05:12:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lQ4ya-0002Hu-9P
 for qemu-devel@nongnu.org; Sat, 27 Mar 2021 05:11:25 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:57163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lQ4yV-0000df-Nz
 for qemu-devel@nongnu.org; Sat, 27 Mar 2021 05:11:24 -0400
Received: from [192.168.100.1] ([82.142.25.162]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MC2k1-1lVpCJ2DOv-00CPdW; Sat, 27 Mar 2021 10:11:14 +0100
Subject: Re: [PATCH v2] linux-user: allow NULL msg in recvfrom
To: Zach Reizner <zachr@google.com>, qemu-devel@nongnu.org
References: <CAFNex=DvFCq=AQf+=19fTfw-T8eZZT=3NnFFm2JMFvVr5QgQyA@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <157fc176-ef49-b9eb-24b4-c1cafea99e6a@vivier.eu>
Date: Sat, 27 Mar 2021 10:11:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAFNex=DvFCq=AQf+=19fTfw-T8eZZT=3NnFFm2JMFvVr5QgQyA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:TgyxnLyc1vsGNLYtKLLqQye43JuL4UjEV7do3UTYFljsDH7Vn+H
 0zAU5UpjojTuX0D8QGalO7f/PNAKUHABk0qbKr42R2SRyhr/zEbZF84pgWTDHY/znvf6ON6
 LaBoymIcHtVK+20csacxWOLxyaU69gRhHE6MjpMB69rgNT1Ht0lfV7PhjhG4/sQ7mWqPutD
 it9hKgRucoYSh9YschFKg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jNlHpbShiIQ=:+WIWMKnNptOZR9yrAD56d/
 1iSy1XqwNBtAvxAp34k3zjqQrmL8cBiimHtkauoywlxUYbU+hImyn9YRL8IwtZx+eKAqNOlHi
 bBW4vG/QDUHRz7wXUyWN9+6WIoxaSMU9+78eDTDQSxWVCZtOhAfcAsidLvnt5xqrM9v+df3m+
 wOgGmzvOqa51d/3h0q+v45L3+bJfsnYb/DEBPTj4BAqA3DHFsdiFKGB+YfbWsAFzX+oAZeZRj
 /eIh8Av+01ikPH5tLUfpbPRNCkf1nxN/lsOmgCpXjHBXASA61FbfgD4kOtez1K9ueshjP5ph8
 trV6PhbBDjN4L7xLGQ9LMyMILHi11Ism10CmT2oGPHXidbQhaUIpvinxUeRNxUXbVGnUR5uZg
 0FEOV6Pn+nOHuIlvJgTCp0iO+PwI6/5EP6itXD8qs4UNMW8/s3UbB5qLwBYGZfytIMFteLR07
 S+FcwPnDf7nPUqXyd32IBzAh8gD3DVauAfsllh0biEIlaN3zT1Ts
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 27/03/2021 à 03:11, Zach Reizner a écrit :
> The kernel allows a NULL msg in recvfrom so that he size of the next
> message may be queried before allocating a correctly sized buffer. This
> change allows the syscall translator to pass along the NULL msg pointer
> instead of returning early with EFAULT.
> 
> Signed-off-by: Zach Reizner <zachr@google.com>
> ---
> v2:
>  - return -TARGET_EFAULT on non-null invalid msg pointer
> 
>  linux-user/syscall.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 1e508576c7..294779c86f 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -3679,9 +3679,14 @@ static abi_long do_recvfrom(int fd, abi_ulong
> msg, size_t len, int flags,
>      void *host_msg;
>      abi_long ret;
> 
> -    host_msg = lock_user(VERIFY_WRITE, msg, len, 0);
> -    if (!host_msg)
> -        return -TARGET_EFAULT;
> +    if (!msg) {
> +        host_msg = NULL;
> +    } else {
> +        host_msg = lock_user(VERIFY_WRITE, msg, len, 0);
> +        if (!host_msg) {
> +            return -TARGET_EFAULT;
> +        }
> +    }
>      if (target_addr) {
>          if (get_user_u32(addrlen, target_addrlen)) {
>              ret = -TARGET_EFAULT;
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

