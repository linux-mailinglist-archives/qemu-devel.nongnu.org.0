Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6E955BFEA
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 11:50:05 +0200 (CEST)
Received: from localhost ([::1]:56124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o67rA-0004Sw-8B
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 05:50:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o67pT-0003bF-G8; Tue, 28 Jun 2022 05:48:19 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:56013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o67pR-0002Ie-QQ; Tue, 28 Jun 2022 05:48:19 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MvaO8-1norcr0uOM-00siEW; Tue, 28 Jun 2022 11:48:11 +0200
Message-ID: <d7416b7e-50bd-900a-9cc9-b8421b7a3f24@vivier.eu>
Date: Tue, 28 Jun 2022 11:48:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] common-user: Only compile the common user code if
 have_user is set
Content-Language: fr
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Riku Voipio <riku.voipio@iki.fi>
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220622140328.383961-1-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220622140328.383961-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:X9Bdq1Gbr713/7D4Gp3Yk57p+D+7DE4GrbzflyMgM4fOSge71WR
 1248Kbf3qSNqXFVHWLCeujCWJYRSBTXnYAW8ZZty1/pmUQa35RxP19s7EX4Z6IKkmgcaNDy
 B2qoKnGvQPdqMPHof6XfsrXy9u3EQHVgJLCy8KeJg8NlpEX38s+1+4/VIYasHShT4Sv5NZU
 jafMp1me0h4Vzb7e5Emug==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6WrskKG8piA=:6sQqjnvaiAYMYXM9CP6nWO
 fI1/mBpG7UOV7oUrDHFUnbk2uwAbVPX82gSGDKuoaRH5NTl3iffvkaaiGUVkLQtoJRJ4yMtcW
 XNL2nWfP/jwMO0vWtgFNVujGf0jE44I7nRKNbDooFtmKMve3poOcgas/UyRWzvqpL/NTlucgr
 oZqhPQtzgfxx6ymzg5ySUFnk5i3a5zeIh1ZrXdxIsmBFHwUogKeIOb2ILooY1j2by1chwKYQf
 SdXa6eXWwh9c6fXJLbV/Jdf8vQ6FREYKKYyxu47wrqW884xFu2Wz40WlRxOCvdKhEp0B/v6NR
 hrn6zfjNeCduN2Q2SzBbPrYVtQbg4f5UhjyeE6pJdixD0xZEJp6xcFGI6AsB2DbAq3Zod746A
 c9sR6ikb2oo/k8eUvFf8wEWQYs2vDVcMqrhMI+wNUlkQTrZ19BW+5iMCOyndoDmBH3JtpXoU2
 v24oDcZDR3e6xz5yjVwx5OtUCTYF3STFsxio/ItJ2l7OPn74Ydt4jAt8OZc5Pkc3GnY2tVDgU
 s0EYS1xsfR4eELNh5jXvemVJq0deGavm27b83Yz0T+USjH2h+AqF55IymRhs7tQtFpdnuuDwR
 UJcnK8NKGsiAhTpXr3rnBKuhnIytOHXhK93G7I/NEg+xKt37VwLjur1hYEIaSc7pwbIKlB4FQ
 gaexd5DqVxRTy8Li80F2J55rPeGNuf0a1H8LDIsxjUjsW2xeb/BJ4PjOZ/P6DISLRBsxHPsGU
 N+sV2va/jH1+8+Gmxh3+mpV40fqEwsGxeqEM8Q==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 22/06/2022 à 16:03, Thomas Huth a écrit :
> There is no need to waste cycles here if we only compile the system
> binaries or tools. Additionally, this change is even a hard requirement
> for building the tools on systems that do not have an entry in the
> common-user/host/ folder (since common-user/meson.build is trying
> to add such a path via the include_directories() command).
> 
> Reported-by: Michael Tokarev <mjt@tls.msk.ru>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   common-user/meson.build | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/common-user/meson.build b/common-user/meson.build
> index 26212dda5c..ac9de5b9e3 100644
> --- a/common-user/meson.build
> +++ b/common-user/meson.build
> @@ -1,3 +1,7 @@
> +if not have_user
> +   subdir_done()
> +endif
> +
>   common_user_inc += include_directories('host/' / host_arch)
>   
>   user_ss.add(files(

Applied to my trivial-patches branch.

Thanks,
Laurent


