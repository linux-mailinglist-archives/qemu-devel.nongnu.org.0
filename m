Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B5C34D886
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 21:47:50 +0200 (CEST)
Received: from localhost ([::1]:38002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQxrY-0007Si-PD
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 15:47:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lQxpa-0006iR-8q; Mon, 29 Mar 2021 15:45:46 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:45429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lQxpY-0006uC-6T; Mon, 29 Mar 2021 15:45:46 -0400
Received: from [192.168.100.1] ([82.142.14.126]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MW9zm-1l6eip2jaU-00XaSE; Mon, 29 Mar 2021 21:45:37 +0200
Subject: Re: [PATCH] linux-user: NETLINK_LIST_MEMBERSHIPS: Allow bad ptr if
 its length is 0
To: =?UTF-8?B?RnLDqWTDqXJpYyBGb3J0aWVy?= <frf@ghgsat.com>,
 qemu-devel@nongnu.org
References: <20210328180135.88449-1-frf@ghgsat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <b56c4386-0ebc-2dfb-345e-5e98b293f253@vivier.eu>
Date: Mon, 29 Mar 2021 21:45:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210328180135.88449-1-frf@ghgsat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9/9GUHBwfftqVmiAfNUO8mhZFgxosu1KSz2rJpVqtxwtM/+Z/sO
 EYZpgnWFCvvXlAiR9fp6TKwJrDIvW6pZhpkjlyBLs5C9fqoku/q7uFdwyiv/5Tz8mSRLCFa
 /I3GUfoH0k6jHFyXNBLtFDE16vlZMGwNAMnRKN3ItgGA3HrvHSU7GKOUVaWPGXgv6/AVKKP
 /wD+XJJ7UpBtC6C+tSWjw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wQbiv7TgUjc=:64p4BmkZ1q23qpsH7Me0eU
 EDZ4wBnrZEh0z3zE6ItLSTbPxM4Si3S7/ccQH8EqCohfXpKP2TiByoF7nVpIbkw3AtO9w8kVX
 FjLYYkBU07YFODxH/HOy+kGpsW/B9NtAdwyk5L3O0D+X3im4hA4+EjFYuoZeUws5gthX5rQfu
 2H2gJ56T0ki/LNbcDfKwAj6+eFWLHbvEVlSV205nXPFYb3+hLBRbCUiPfbPWQCRF2lM/lC/vZ
 x9gkucJmaip8wobS6ef0t2QJfFRA87cAiWJz2wukmQc3vRBooyJdYK4EgR7e/1H0NETtBpEhp
 pRTzktXb92zZOabIQiSCT1dkyecPcXFpC0HKlUtxODyDIERmQAEnHj3A9vKrP72sBk3ZbuDAP
 uIqP7HpsgutFJlxK9A6KP4uQOUR9swwHUeCddvXbbDPTV4PV0KF9dnLWu4iFXQZwePYn2KvmD
 p8J9vPWXkHTYtqxa38s65tSCjSknK9KJKwWRcBsdvYHY0/djyIy9
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 28/03/2021 à 20:01, Frédéric Fortier via a écrit :
> getsockopt(fd, SOL_NETLINK, NETLINK_LIST_MEMBERSHIPS, *optval, *optlen)
> syscall allows optval to be NULL/invalid if optlen points to a size of
> zero. This allows userspace to query the length of the array they should
> use to get the full membership list before allocating memory for said
> list, then re-calling getsockopt with proper optval/optlen arguments.
> 
> Notable users of this pattern include systemd-networkd, which in the
> (albeit old) version 237 tested, cannot start without this fix.
> 
> Signed-off-by: Frédéric Fortier <frf@ghgsat.com>
> ---
>  linux-user/syscall.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 1e508576c7..9b7556a9a2 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -3025,7 +3025,7 @@ get_timeout:
>                  return -TARGET_EINVAL;
>              }
>              results = lock_user(VERIFY_WRITE, optval_addr, len, 1);
> -            if (!results) {
> +            if (!results && len > 0) {
>                  return -TARGET_EFAULT;
>              }
>              lv = len;
> 

Applied to my linux-user-for-6.0 branch

Thanks,
Laurent

