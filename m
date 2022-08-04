Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 195D5589B3B
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 13:53:29 +0200 (CEST)
Received: from localhost ([::1]:60114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJZPs-0006TP-CH
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 07:53:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oJZMY-0002KR-CI; Thu, 04 Aug 2022 07:50:02 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:55709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oJZMW-0003LT-Ko; Thu, 04 Aug 2022 07:50:02 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N30VJ-1nIVe221GP-013KQY; Thu, 04 Aug 2022 13:49:55 +0200
Message-ID: <e574b270-4cb5-5f8c-f580-78fbfeca919c@vivier.eu>
Date: Thu, 4 Aug 2022 13:49:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] include/qemu/host-utils.h: Simplify the compiler check in
 mulu128()
Content-Language: fr
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
References: <20220721074809.1513357-1-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220721074809.1513357-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:cT+KiIggL0iOhxuo+4w4uqdbzlRLeTFOg09W/92E0CbAM20wbUZ
 jBGSyTJAx04q04RUcKo9FhdoENh1+iqxzKJxl+P0Lak6PUZfGLhNm2nd97mc4jE2Kuukxiu
 aJLldyFWrnMCeyajrT2DBKOzUXIHl2r3yy+OySYRSFoKMUZOE7w//QSUgVVRfl/+m35veop
 IqZBM7n+A518EOmO5cHUw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:inlpZnXkfzU=:K7J3h/pXiyKSONHPAkpJrm
 mvIxmuXsLYVEI3WElWdgaZbvGqZ9K9MUvNxq8y/RSOVr13wLDSWTZiFx4KZxv5bwjBexlCuoi
 wXEeciqsGlbj56JC0mT9ZDnWzhfdvzUOPrNa5XXhvchPlZ8MUDKZIT41pR81tzVWNTy9ioki3
 Zu41ASMdCdHh9A7/PLQviZ3dzfyRPk94gm6DYByyTPpgRi4E4I5kK7akOCJAlOOnG1JZB2WuJ
 7qQ9hO/Wdosy2PFWJ1jKCG5wq5elp7FFrbS5JqoiJFZDU3jzR8NlxQdQGqT1fCjLia/CtkLZj
 O4ZhK+fgZWYXJ6dWj8fwq+J9oYxl1jad5Jpy4BSdyTEFq/HtYKavgorZdK/Su+rzz6DTVZg5y
 RiRe4HVhCCsVQWNorVxAC/HQoL/Ps+t5bZLN5CqEGRT2Nj1P/bJpO3BMevTh0NxAMhgYZdAIu
 TKkeVxO1/Ksu6w64EGmXSrCj0lLONGSMskxsVCxgw4xZZT/TSW5RNEzmyyL9mFP8rkZ1uKLrB
 AKLWwj7yiYBOhf7hihIXhWk10aIdq3jWnYKAk6Moms/inXVqQkiSECJcb7fZASyTJaCPiFZJm
 n5kXbOrjm1rCj5tnYhX1HToIyRXI2CzpjEbChwdMjL9c1qLu/emrEaApETsBLN3KrcAGQQktL
 nweEKSUAzsvWW9nNFtoWBM/SSN4hWodQgjKzx3NsoWmWZF3B11ARGmEnp/4abzNJWjHVe424d
 APIo2G59GmdxFm0QSM4dqtASSsximgVZt3WZIw==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 21/07/2022 à 09:48, Thomas Huth a écrit :
> We currently require at least GCC 7.4 or Clang 6.0 for compiling QEMU.
> GCC has __builtin_mul_overflow since version 5 already, and Clang 6.0
> also provides this built-in function (see its documentation on this page:
> https://releases.llvm.org/6.0.0/tools/clang/docs/LanguageExtensions.html ).
> So we can simplify the #if statement here.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   include/qemu/host-utils.h | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
> index 29f3a99878..88d476161c 100644
> --- a/include/qemu/host-utils.h
> +++ b/include/qemu/host-utils.h
> @@ -533,8 +533,7 @@ static inline bool umul64_overflow(uint64_t x, uint64_t y, uint64_t *ret)
>    */
>   static inline bool mulu128(uint64_t *plow, uint64_t *phigh, uint64_t factor)
>   {
> -#if defined(CONFIG_INT128) && \
> -    (__has_builtin(__builtin_mul_overflow) || __GNUC__ >= 5)
> +#if defined(CONFIG_INT128)
>       bool res;
>       __uint128_t r;
>       __uint128_t f = ((__uint128_t)*phigh << 64) | *plow;

Applied to my trivial-patches branch.

Thanks,
Laurent


