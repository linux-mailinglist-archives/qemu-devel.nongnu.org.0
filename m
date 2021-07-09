Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 837663C2155
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 11:17:07 +0200 (CEST)
Received: from localhost ([::1]:52272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1md3-0004O7-J7
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 05:17:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m1mau-0002F4-8Z; Fri, 09 Jul 2021 05:14:48 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:46107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m1mas-0006Sk-Kc; Fri, 09 Jul 2021 05:14:48 -0400
Received: from [192.168.100.1] ([82.142.13.34]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MGgRW-1lxwqu1FKc-00DqHx; Fri, 09 Jul 2021 11:14:42 +0200
Subject: Re: [PATCH v1] migration: fix typo in mig_throttle_guest_down comment
To: Olaf Hering <olaf@aepfle.de>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
References: <20210708162159.18045-1-olaf@aepfle.de>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <996244ae-e6fb-4acc-5bad-b78b3f23c205@vivier.eu>
Date: Fri, 9 Jul 2021 11:14:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708162159.18045-1-olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:CnYnvQ4Jcx0TKzDQpycu7DYbJDjhEXKUOks4Fz0bnAYB/Ort4AD
 DpnSLCRryiPA/lyKZkFvB7waH874yxR7MpvoHACcCcLgpuGS4GQpvncq9DldwBnwrLooTkN
 KQZkzySzpkj2AHOwJNxUhn5rzz3go1TZAJ2j0UmGzsLo6z9GxHR5sVgXBqIuuQUKt4BStKn
 slnbLPVb67eBst2h9ikAg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rSmzET2ujMI=:POxHnxh7IW5BILlJDFjvhy
 +DiZr///mWc/TNojkPpyf8Dz6yXX/Tos/va32XW6fvnXg0Xt4qX8tZZYGAwTEGkL9dU6AN8/f
 pdex46Bge2JiltyNDEZa+rsHZajg6VGmC//yvq9b1OqRW/P9Aqtom9nTxEZ7Rp6AV8D7TEPFo
 E89u1RO8KbhCxYFzIIO5w6julsYw3UwWpqrHENwStDPW720pFMSwfyfra3E59E491FBP+X1Jf
 57nr5o+1E2zhwHYIEFMjLVc7PMprobD/uD9Nw2QJrClxeSDdby1oQl2yXYeqJaHnwpdFkqQmF
 hcvVyt8eDMLqacdpk967PUiB9Xt+9vx9J6eK92gFvpeJjFsHaWRnXCwA58NLBU1+VmM3fKLWq
 ifG4+E+oGT0+XC/iOkvQQjoI3v52JEHbC1M20wtY5GcqOJ/8eEuwX026p1H1egN9/Q/eJkgHf
 epaITXz+BsxHZ5rpLLDyhtTNunJLRQy4OpG1+eTiFabYEyHCxTGeS2vn9x+DoKytr16ZNw8MQ
 1u4cG6rWuh/7pVS5uBYo1J6Jult5M5YVCWY6nYFqpWGvKyjiB+/zvoaZRkxjDseSbiZG4HmKo
 Jcopyrgp1T8caaaPzpxvnbP5bfo5E02sgtCX6hXxjneCB/nHlkTqROnCbWcQ2Wt1OwY+0xkQ8
 2hTzWpmNHar+Hn89n5SSFPB6kthdjIxQxER/g5xM5gb9ZX9mHglkTcXsgDfPeLq+mx/J0LfWD
 EcQtxQ95AsIpTMVfJnSIUFDK7nZUFORNztYglc3Pmtdytxk8V0NlxTnrDAFHLSuuimW83wTuH
 9t/am/eBNcB4bULWDUB25OnZQmykTb2MKf/4JvrFhcigdXQkUPKhcwOHG7x0xc8jkqkjJKu
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 08/07/2021 à 18:21, Olaf Hering a écrit :
> Fixes commit 3d0684b2ad82a5dde68e3f08b0d7786dccaf619c ("ram: Update
> all functions comments")
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
>  migration/ram.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 723af67c2e..88ff34f574 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -600,7 +600,7 @@ static size_t save_page_header(RAMState *rs, QEMUFile *f,  RAMBlock *block,
>  }
>  
>  /**
> - * mig_throttle_guest_down: throotle down the guest
> + * mig_throttle_guest_down: throttle down the guest
>   *
>   * Reduce amount of guest cpu execution to hopefully slow down memory
>   * writes. If guest dirty memory rate is reduced below the rate at
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

