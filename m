Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 648155E8512
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 23:43:15 +0200 (CEST)
Received: from localhost ([::1]:49922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obqS1-000247-PP
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 17:43:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1obqQb-0000UI-Hr
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 17:41:45 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:36777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1obqQZ-0005aW-Q5
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 17:41:45 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MpDVx-1p3BhU2Htv-00qfoD; Fri, 23 Sep 2022 23:41:39 +0200
Message-ID: <28764f7e-a5c2-93c7-47b2-834493475672@vivier.eu>
Date: Fri, 23 Sep 2022 23:41:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] linux-user: fix readlinkat handling with magic exe symlink
Content-Language: fr
To: Jameson Nash <vtjnash@gmail.com>, qemu-devel@nongnu.org
References: <20220808190727.875155-1-vtjnash@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220808190727.875155-1-vtjnash@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/Djchh2/35UyU+rSq1MDY1yin6Yv8SH/59wuoN/sjEKlJBdbR4R
 xIVSHtdtXE0xmLY5Db6gEKxMWe/QxLV8sKUPgKHhGvC1HgpGMwzfCpfjsOduDbvwK8EnoQm
 L5woSC0CwHhfFpSaXakNLOc1/WMh/Ms1v09EDTfUIiLDrY8mgv1rxiOhlNuYRfwA+KFiu/Y
 d6/YP81ZHG5gOCGknbBOQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LdET97F30Js=:vShL/dJI4nmTgn46XqhhJl
 apFU4KVmoofIrGTaxOT0O0R0UYmh6wTasSPixSjU35gbe3oZBn4O1kgM+EY8e5PgNnesBHh3l
 kvviiGuwbfIO5rhiRXt2GOsY953cFv3K7T2t/5wF+Rlj+6m4dIAFqJ6l4Nw4XOkKoTB2FMCfl
 KkMu6pKIMsyfk/9jNhapK1kZDe7tvoZI2V26mfiyCTQuyfAB4Ho0dqJVmi8pMBV3VvDfxaUXQ
 dZQLC8ZFdVTiA7sEyEJqzGewBD1Tpz/1ieHK24mUBn6pAEF+Y/FP/j4R7BhFIQGgWSOK78i8i
 tAHCh6FdvH+t9J8JXEmGE0F6VnYOPPoUcjLARuhf1C3BNZ7Am3vxbe+g0tw7Y3mZE6rLMFlbu
 xEqmsIsPg0EYtdqb8aS/V30mjnyPCmwhirURxp5PXsIEocWfcDYSEk3pENfo6dBs5Tx0dtHnc
 yv8/PO1fl+L24yT3MEU5dAHGLd9WuwxyFWvqsO4GMKZWxtdu5SUhAo/jzSCGceWIp57SfKNPK
 6FIiO5ybnPFCQChtrTB3QfRs9z0Uy9PGOB9IvXA5/BVoX0YJrQYRb5jK93askja9WNv4Z47nb
 jclMBzeKwqIxhST+wEFx44Ef2U1jE9+NDAnUWG56pcDmYrqwlT1laCGrWZbea4C4qBNdHLHvk
 +Q1Oy2ZtVBXsl18s0RRhpq1sGOAOwT4E2h6Xbz5/D12aci86IyBoZai1zbJy6BWKKgDHS3t0P
 eHAbZrwNHowQjBRINwrAPlYCyadCq7mvoTUnJbM67E5r901IlxOHnbw15shluyvfYs0qSw32E
 vhoNQoj
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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

Le 08/08/2022 à 21:07, Jameson Nash a écrit :
> Exactly the same as f17f4989fa193fa8279474c5462289a3cfe69aea before was
> for readlink. I suppose this was simply missed at the time.
> 
> Signed-off-by: Jameson Nash <vtjnash@gmail.com>
> ---
>   linux-user/syscall.c | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index ef53feb5ab..6ef4e42b21 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -9894,11 +9894,22 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>               p2 = lock_user(VERIFY_WRITE, arg3, arg4, 0);
>               if (!p || !p2) {
>                   ret = -TARGET_EFAULT;
> +            } else if (!arg4) {
> +                /* Short circuit this for the magic exe check. */
> +                ret = -TARGET_EINVAL;
>               } else if (is_proc_myself((const char *)p, "exe")) {
>                   char real[PATH_MAX], *temp;
>                   temp = realpath(exec_path, real);
> -                ret = temp == NULL ? get_errno(-1) : strlen(real) ;
> -                snprintf((char *)p2, arg4, "%s", real);
> +                /* Return value is # of bytes that we wrote to the buffer. */
> +                if (temp == NULL) {
> +                    ret = get_errno(-1);
> +                } else {
> +                    /* Don't worry about sign mismatch as earlier mapping
> +                     * logic would have thrown a bad address error. */
> +                    ret = MIN(strlen(real), arg4);
> +                    /* We cannot NUL terminate the string. */
> +                    memcpy(p2, real, ret);
> +                }
>               } else {
>                   ret = get_errno(readlinkat(arg1, path(p), p2, arg4));
>               }

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

