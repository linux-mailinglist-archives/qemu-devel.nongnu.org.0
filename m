Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66634371FE8
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 20:49:30 +0200 (CEST)
Received: from localhost ([::1]:56346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldddJ-0003kv-EZ
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 14:49:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lddWC-000660-I5; Mon, 03 May 2021 14:42:08 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:42837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lddWA-0002wo-Ji; Mon, 03 May 2021 14:42:08 -0400
Received: from [192.168.100.1] ([82.142.20.222]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MpDVx-1lDA2w2UQB-00qiUq; Mon, 03 May 2021 20:42:01 +0200
Subject: Re: [PATCH 1/2] linux-user: Add copy_file_range to strace.list
To: LemonBoy <thatlemon@gmail.com>, qemu-devel@nongnu.org
References: <20210503174159.54302-1-thatlemon@gmail.com>
 <20210503174159.54302-2-thatlemon@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <6f745539-767d-f658-d878-8b6a69464db6@vivier.eu>
Date: Mon, 3 May 2021 20:42:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210503174159.54302-2-thatlemon@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jIDt3oei6Bc42gnqUuIgVZFJZcP5SEqfciCPAsx2bTvWLP3AR/R
 x0MhPx97BZqSJlAdjbl84M47YdqCJceP2He5rBba3wEKV4YjrzjgYExh143/qUt5fdP8SER
 q4ySii9w61qNZSwTxYrMfLnY5IBZ/Vb8YMfg/Xm7Oyc5cpk3xxo6MuTxf/80AiHVvpV3h4d
 N/YnZkJo+EMLHhNT1K0CQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AdI+CqgA9Xg=:LRQivT7P782mMwDwxgGNBN
 EadcF0wTzMTMTEVRwGRN0YesLyOzqPNWqH7/2GKm0mJBtFHiLepJdRK22nGLmZJPG6XAWKWdV
 ZY5RPDdH8a93rNScUlZg1t8WHOFMqo7m1Wr5uI8akFG370rdRt6bcRANotW7mVqnrkNOKdiYX
 TEAVE+4thCoaOc2GowyXn1d7vy+MZB4eH16rKGeP0VvAbhDeXi9Soict2SZ324mqCgehPknuo
 9FnKV6hEup1mx6IHvxQT5T85QQRLbxrca3SQlARr8ra8qjiQBONoI5T6Z0jJOiHZzDEBeQu5r
 Gx/ASVxTfAubuUylUISNxwYtsA+10XueR+fIS6vIcdc7Ji8YxdWG5DsqZsvZoc+EC1Oy7T0Zf
 wBxerUrpT6YCpTVivNEgLqTM6OKkLj2LAZS3TM1qIRk8gPoPLBnKgXiZ/3MuNOOAI6DcqW5ew
 tCjubOmdsmYKQy3RLh7UVWr/xRrCk82xoSyy+qicW2cP99+0NwwzIUWdAg6uNur5MAcyrJdeT
 vlotwMMwdM3MeA555Ujc+E=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
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
Cc: qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 03/05/2021 à 19:41, LemonBoy a écrit :
> From: Giuseppe Musacchio <thatlemon@gmail.com>
> 
> Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
> ---
>  linux-user/strace.list | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/linux-user/strace.list b/linux-user/strace.list
> index 084048ab96..b81f9964e3 100644
> --- a/linux-user/strace.list
> +++ b/linux-user/strace.list
> @@ -1665,3 +1665,6 @@
>  #ifdef TARGET_NR_statx
>  { TARGET_NR_statx, "statx", NULL, print_statx, NULL },
>  #endif
> +#ifdef TARGET_NR_copy_file_range
> +{ TARGET_NR_copy_file_range, "copy_file_range", "%s(%d,%p,%d,%p,"TARGET_ABI_FMT_lu",%u)", NULL, NULL },
> +#endif
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

