Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFAE381AD7
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 21:48:44 +0200 (CEST)
Received: from localhost ([::1]:34090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1li0HC-00026b-MW
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 15:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1li0Dj-00068J-Eg; Sat, 15 May 2021 15:45:08 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:53083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1li0Df-0002NC-Dx; Sat, 15 May 2021 15:45:07 -0400
Received: from [192.168.100.1] ([82.142.12.230]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MQNAv-1m4MaR16Lh-00MIru; Sat, 15 May 2021 21:44:58 +0200
Subject: Re: [PATCH v2 00/15] linux-user/s390x: some signal fixes
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210428193408.233706-1-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <d8991b4d-f662-8f37-6926-6c2edb4623fb@vivier.eu>
Date: Sat, 15 May 2021 21:44:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210428193408.233706-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:W3211n/bK9FQS2iPytfvVH33V256WkS41xbNm88bywZKPR07ENr
 Ql4Q6eEvtzi+zWtmRVHhmYpRcjzE6txriHHwz1xy3Xm2D+SLm5fIl3JhmHwwkAcOo0cmS/R
 tfOzqVwT2qV5GRmVdWdV7W0l00M462KjVbgbUQzXuxJcmR7YWVM0Bub49ptQDYRyzvnVeDX
 +XcJFt8isnMrgX5QWuwqw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Z8+akGMF3fY=:dnavDQzBIZVP9tGJtuNeWw
 GtAa3iWLpjDBn6YSDAi+Kt45a8pDvn0TnG9/U3yZ4mNutF1Qk/fbFOZQ2VA4cmBmZYOno3plR
 8U2eIUblLYzKs5JrhRcIwJIqZHGdeOTONUWQ7x3YnSyHMly0caFYOhFuqkcLPChZt5zSFb7c6
 ilCoGTYmm2LU/jcmg3d/TL5uXO4S62o2ohc/j6nHmdFpP4oIAE2nxYqxqWCzvis9q3uPfJLG+
 h4R6I80ua5CQyzRS9mEuI7SmFGsY6qxelO+92sUpJeIoSsNv8o2x8MHyXBi7elO+oncRhtKOp
 K7Pvsla1zaf2iI/Z9QrZMz9ge30BF2pcGF338Zc/FnhT70bTnd+JZi8DO444+Z1UrM2aB0rTp
 TulRvnFkVniW1G5BEVDpJvbMnEE+7WIT3qXGkA8UXEQpFJOXYYIccSU0y37Ut2M+GGo47XzZb
 ucIrngKZMggyowii72TPRj8wE8hrTJ78YJZD8jCUuhtPoK1FrD7n9WSfPfaN77DljZN1/kXLv
 TRuL5dWHiqU423JwqA/ZuU=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: thuth@redhat.com, cohuck@redhat.com, qemu-s390x@nongnu.org,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 28/04/2021 à 21:33, Richard Henderson a écrit :
> Version 2 splits lazy do-it-all patch.
> Patch 1 has an additional fix, so I dropped the r-b.
> 
> r~
> 
> Richard Henderson (15):
>   linux-user/s390x: Fix sigframe types
>   linux-user/s390x: Use uint16_t for signal retcode
>   linux-user/s390x: Remove PSW_ADDR_AMODE
>   linux-user/s390x: Remove restore_sigregs return value
>   linux-user/s390x: Fix trace in restore_regs
>   linux-user/s390x: Fix sigcontext sregs value
>   linux-user/s390x: Use tswap_sigset in setup_rt_frame
>   linux-user/s390x: Tidy save_sigregs
>   linux-user/s390x: Clean up single-use gotos in signal.c
>   linux-user/s390x: Set psw.mask properly for the signal handler
>   linux-user/s390x: Add stub sigframe argument for last_break
>   linux-user/s390x: Fix frame_addr corruption in setup_frame
>   linux-user/s390x: Add build asserts for sigset sizes
>   linux-user/s390x: Clean up signal.c
>   linux-user/s390x: Handle vector regs in signal stack
> 
>  linux-user/s390x/signal.c | 280 +++++++++++++++++++++++---------------
>  1 file changed, 170 insertions(+), 110 deletions(-)
> 

Applied to my linux-user-for-6.1 branch.

Thanks,
Laurent

