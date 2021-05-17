Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D01843829BD
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 12:23:23 +0200 (CEST)
Received: from localhost ([::1]:51070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liaPC-0001LS-Rm
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 06:23:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1liaNN-0006Mc-K4
 for qemu-devel@nongnu.org; Mon, 17 May 2021 06:21:29 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:59043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1liaNL-00033O-L8
 for qemu-devel@nongnu.org; Mon, 17 May 2021 06:21:29 -0400
Received: from [192.168.100.43] ([82.142.31.78]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.168]) with ESMTPSA (Nemesis) id
 1N336L-1lLsPx0i57-013Q1J; Mon, 17 May 2021 12:21:24 +0200
Subject: Re: [PATCH v2 07/25] linux-user/sparc: Merge sparc64 target_syscall.h
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210426025334.1168495-1-richard.henderson@linaro.org>
 <20210426025334.1168495-8-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <ee3cb591-d5e7-6a19-41f2-cf8bb0e59276@vivier.eu>
Date: Mon, 17 May 2021 12:21:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210426025334.1168495-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:w1XZFKD8roFIl6C0hoZ/dSiWs3Of6qIiVsjlX2ZGt9f0yKUhLHN
 ce8SdqCKzzF5ndzuEqCXRE3tAhlDXPMcnAeBEmLeNijd1x5oiM+PSrLlAD3j+nibvdOTe3a
 m2zI0KSp78+w2zOb9tBUs5K/v9Ncqe4or3lkggIS33983NYwcyC1KX3PB+ABBhMVGY9n8dY
 a2UmMWEuwo3s1AWUuIvkg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:u+qHmqQAy0s=:OxyjHol+mNtrIWad/sZ83q
 4aZaqxW+CiYHlTrDGPfXD3rKy4PWGJuJSlr35maJ/O1MYz9dtq9hLIPD396tYe0JOa16jxjJk
 TjorhhtChrJD1tYIwoAHhu8iTH7KLW10KSnS+mm3PvTM6i2eGmomUAWaLcucrJkrxtu+I8/wE
 c7W8MfQFesUn5APIG8rkNau3zfp2jKixKJl6/BcinYAKsOWcRLvBWwAUcPznS0jOF9xbV3QT3
 kDf8GUEjmMMEWo4WYOoD9xXlWL81DDNdEofOdvDCc4mjz/KiPGea6QK01ogw9/My700PvVkX5
 zxAb9/ZV/gKg06zadhAUAM3lIAVvpgC+6TFNByEOuDLGp/XzOeULFmFN2cR8WVDTU6e0vFL6t
 zAplZUuibvqSPm2GyhWEb1QAUAgItybpvmqXqurpqOZe4suW9MzktpT5fZCyP3QYP2Lyf3PvW
 HRwN4FDj+JxMQ8GqHPOKMtM2tkKJgBDBluKkiYRX0FBPk3gF2+xSRIycgMA7dv3y1iuCGM7OC
 n3MXN+lbj1pymX6lT7G3Vc=
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/04/2021 04:53, Richard Henderson wrote:
> There are only a few differences in sparc32 vs sparc64.
> This fixes target_shmlba for sparc32plus, which is v9.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/sparc/target_syscall.h   | 42 +++++++++++++++++++++--------
>  linux-user/sparc64/target_syscall.h | 36 +------------------------
>  2 files changed, 32 insertions(+), 46 deletions(-)
> 
> diff --git a/linux-user/sparc/target_syscall.h b/linux-user/sparc/target_syscall.h
> index d8ea04ea83..15d531f389 100644
> --- a/linux-user/sparc/target_syscall.h
> +++ b/linux-user/sparc/target_syscall.h
> @@ -3,18 +3,34 @@
...
> -#define UNAME_MACHINE "sparc"
> +#ifdef TARGET_SPARC64
> +# define UNAME_MACHINE "sparc64"
> +#else
> +# define UNAME_MACHINE "sparc"
> +#endif
>  #define UNAME_MINIMUM_RELEASE "2.6.32"

Is it intended to have now an uname defined to "sparc64" with sparc32plus?
(it was "sparc" before this change).

Thanks,
Laurent

