Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6342D8EE3
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 17:53:07 +0100 (CET)
Received: from localhost ([::1]:44170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koUcH-00030K-NO
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 11:53:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koUbJ-0002Tf-L1; Sun, 13 Dec 2020 11:52:01 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:38241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koUbE-0001VF-Ft; Sun, 13 Dec 2020 11:52:01 -0500
Received: from [192.168.100.1] ([82.252.135.218]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N4hex-1k5DZ113rD-011gDG; Sun, 13 Dec 2020 17:51:44 +0100
Subject: Re: [PATCH] CODING_STYLE.rst: Be less strict about 80 character limit
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201106112940.31300-1-peter.maydell@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <cd68f42b-6693-9a39-b29f-4f624dda9c17@vivier.eu>
Date: Sun, 13 Dec 2020 17:51:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201106112940.31300-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:TUhXXGGI7BigwydDqDpk5QR/JUWMA8wDsBY00mSXb4h/t/dVfcM
 0DSGnHgBoz143KZWiSB1bNzh5YuqT8pC9z7kU/a0dvPm//9YTurGXakiuzevTTgXNP+wk5I
 HSB5gWXpVFrbXCj5aw6ZhR9xoAXH8jQVYerBzOBGQLQwNlxzij6dPFQCt5a1V1bQBmOg6IP
 PSpX5Kv//yOY1bH8p72xA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hYjCGjinfu8=:KDoGVCC71nTBMTcxDNSFCl
 NR58RkwMYvWe+0W6rtv76R8cLpJnY2/R3aGuN9uqdpZvIIQagybfYMBPg5TUTfwJc9D4jRgW/
 disKUp3MIPKsHeSE0RiK1gM68QHWDEdFQlRLhgJApbPHk4ckrk0V7adv2bXzYMcKROBfrU8ug
 kDJT2PT9R+gQj/3vZMN6j4PWfunvGZtODBe81jPh0fuYupqvoggEknKfKGmxxerx56Pq9cInf
 PhVroEsX8WOr6hyoDA0DgezcTPFaYoGi+y4oX6vQdfbGF3ocfXOlTCRvq+pgqSKQXHPEE2uMF
 7jHmTAgrYdQQ0T5ZJAKloyKjmglw9pYzpjDGe+E6DgYw3b7RwLvEvf7TCLY3qW6gMF65u5XMW
 07zsv0jJwEAZ3uQr1Jav8kZ55+Qdhupj63qN677DnFeAsSmzPYF44DZtV2iHB9gwyLSqeSMM6
 b8uSeGgeZw==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Gan Qixin <ganqixin@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Chenqun \(kuhn\)" <kuhn.chenqun@huawei.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 06/11/2020 à 12:29, Peter Maydell a écrit :
> Relax the wording about line lengths a little bit; this goes with the
> checkpatch changes to warn at 100 characters rather than 80.
> 
> (Compare the Linux kernel commit bdc48fa11e46f8; our coding style is
> not theirs, but the rationale is good and applies to us too.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  CODING_STYLE.rst | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/CODING_STYLE.rst b/CODING_STYLE.rst
> index 8b13ef0669e..7bf4e39d487 100644
> --- a/CODING_STYLE.rst
> +++ b/CODING_STYLE.rst
> @@ -85,8 +85,13 @@ Line width
>  Lines should be 80 characters; try not to make them longer.
>  
>  Sometimes it is hard to do, especially when dealing with QEMU subsystems
> -that use long function or symbol names.  Even in that case, do not make
> -lines much longer than 80 characters.
> +that use long function or symbol names. If wrapping the line at 80 columns
> +is obviously less readable and more awkward, prefer not to wrap it; better
> +to have an 85 character line than one which is awkwardly wrapped.
> +
> +Even in that case, try not to make lines much longer than 80 characters.
> +(The checkpatch script will warn at 100 characters, but this is intended
> +as a guard against obviously-overlength lines, not a target.)
>  
>  Rationale:
>  
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


