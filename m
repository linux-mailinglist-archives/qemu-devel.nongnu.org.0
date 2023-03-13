Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E066B830C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 21:48:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbp4Z-0000gq-5m; Mon, 13 Mar 2023 16:47:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbp4T-0000gY-Bi
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 16:47:05 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbp4O-0003Lq-KR
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 16:47:04 -0400
Received: by mail-wr1-x433.google.com with SMTP id r29so4495494wra.13
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 13:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678740418;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rADyyy+1SaVIsUkuEmzg9Bl+z/0Iu/FTwxEewtTOcSA=;
 b=Kikgf0wrCBGTMCWewEm1LaSKedD5Srg/UOPzOajucGi6StCEie7VDgnUof1/Zpf0U4
 gBcfY5YZINi6monIx14zBAXFZzkNwDDndF+kqZcaULw2g8iAJLFtZG37K9WdbeIIsf/J
 cHU+U8ZZtSAOl0LJ7GmQV4NVig5BwopMIVZ4p6Scz0ZCxoSLMJ+ZwJgJLhgAWjE0Se1I
 zS9utAUh3o5OYrbgEq6dddvNGsv7Z1srxOoBHjN6G+Blcs24KS71Mu0iaMulbjPDLV+L
 TLU4fn/8TKWX5WVQ3kCAH2tnuRS+JttzVFnuYiJ9zwTRBuavigbdb9s/g2gYSUc1GNYu
 erVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678740418;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rADyyy+1SaVIsUkuEmzg9Bl+z/0Iu/FTwxEewtTOcSA=;
 b=lifDmf2Z5OZYVVw9SDMIoKtWk8mZBUSw0TeGlXn9jrryhi0sd2XEBzaAkXUwDnH1vV
 kEEgdh94kbfKDHb0e5ZXbRvlNV4BbhNoaWhNh1D1G0f0aGjJOT/XRK7W358uzgJRP/3e
 RhkGtApQdrQ4op5CZnBogIXW/529NIfj+NZFceBxkzRhX1xJ1w8licfSe3z7sMUoeoW+
 cMokhiIyR2ZVK50FUU67QvyINFSAhx0PqEMPJ0SxKec58pmGUsNnld6IU1NKUkYHkuAv
 4+QbtMX5/ixN9I2RjoXau6+WM4nvdkj9+jXOD2Qy/SqqygOMoF56+82+zS+UWUMitmWt
 toAQ==
X-Gm-Message-State: AO0yUKXC7fYXfbMZknO1F4rNVZsbPnuITN14CVrpkskZEGuXFCt3uK2C
 OrAuV+NNyUp+MtJFA2XF9S4okQ==
X-Google-Smtp-Source: AK7set93OB/pasoK+boYXAMVhHpC8Yy3sDQ+pAofkGDDx3/VtgU5SBfSRX2oEESkeHJSlwXJ0wWGHw==
X-Received: by 2002:adf:f2d1:0:b0:2ce:a890:7371 with SMTP id
 d17-20020adff2d1000000b002cea8907371mr5457689wrp.12.1678740418620; 
 Mon, 13 Mar 2023 13:46:58 -0700 (PDT)
Received: from [192.168.1.115] (36.red-88-29-189.dynamicip.rima-tde.net.
 [88.29.189.36]) by smtp.gmail.com with ESMTPSA id
 c10-20020a056000104a00b002c59f18674asm385286wrx.22.2023.03.13.13.46.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 13:46:57 -0700 (PDT)
Message-ID: <f3201c0a-8ac9-0147-ccc5-fa8195607b6c@linaro.org>
Date: Mon, 13 Mar 2023 21:46:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] MAINTAINERS: Mark the Nios II CPU as orphan
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Marek Vasut <marek.vasut@gmail.com>, Wentong Wu <wentong.wu@intel.com>,
 Sandra Loosemore <sandra@codesourcery.com>,
 Joseph Myers <joseph@codesourcery.com>,
 Julian Brown <julian@codesourcery.com>,
 Andrew Jenner <andrew@codesourcery.com>
References: <20230313183352.274744-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230313183352.274744-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

+CodeSourcery folks

On 13/3/23 19:33, Thomas Huth wrote:
> Marek and Chris haven't been active for Nios II since years
> (the last time seems to have been in 2017), and we've got
> unhandled severe Nios II bug tickets in the bug tracker since
> a long time, so to avoid wrong expectations of people who are
> looking at the MAINTAINERS file, it's maybe best to mark the
> Nios II entry as orphan nowadays.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   Suggested by Richard here:
>   https://lore.kernel.org/qemu-devel/cb2e92b7-40bb-4975-290d-6321c5574365@linaro.org/
>   
>   And bugs like this sound like the linux-user target is in a bad shape, too:
>   https://gitlab.com/qemu-project/qemu/-/issues/261
> 
>   See also:
>   https://bugs.launchpad.net/qemu/+bug/1791796 (comment 3)
> 
>   ... nobody tried to fix nios2 linux-user in years, maybe we should
>   deprecate it?
> 
>   MAINTAINERS | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 95c957d587..9780430626 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -257,9 +257,9 @@ F: docs/system/cpu-models-mips.rst.inc
>   F: tests/tcg/mips/
>   
>   NiosII TCG CPUs
> -M: Chris Wulff <crwulff@gmail.com>
> -M: Marek Vasut <marex@denx.de>
> -S: Maintained
> +R: Chris Wulff <crwulff@gmail.com>
> +R: Marek Vasut <marex@denx.de>
> +S: Orphan
>   F: target/nios2/
>   F: hw/nios2/
>   F: disas/nios2.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


