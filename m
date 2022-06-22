Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D41B55449D
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 10:24:05 +0200 (CEST)
Received: from localhost ([::1]:55588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3ved-0003Ip-7W
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 04:24:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o3vdC-0002bs-Rz
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 04:22:34 -0400
Received: from smtpout30.security-mail.net ([85.31.212.34]:32199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o3vd7-0006no-1q
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 04:22:33 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx304.security-mail.net (Postfix) with ESMTP id B39F762881
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 10:22:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1655886145;
 bh=u9cIHM9lOeL/35H7HwvYQ8rObSK71+7qsx1AeU5frHU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=Z5pVbQPaSYZ6rFLrBuxreFyfW19/Qi5teN4Uz7h1+u3zNSh+lz0gas3LYliO6RmKk
 SEtaoHsNPLf55iKwcdxlVjRfvbEAFr0uDwsYkOOXH7NY9Gzoahv0VQdyeolWoLVcIn
 TCtho+R9cnIjSiMm9d4PhmJrAKNItfQQeWVLv0AM=
Received: from fx304 (localhost [127.0.0.1]) by fx304.security-mail.net
 (Postfix) with ESMTP id 4A12E62879; Wed, 22 Jun 2022 10:22:25 +0200 (CEST)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx304.security-mail.net (Postfix) with ESMTPS id B56626281F; Wed, 22 Jun
 2022 10:22:24 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 9ACE727E04CD; Wed, 22 Jun 2022
 10:22:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 846A027E04DD; Wed, 22 Jun 2022 10:22:24 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 LZ2p6ixon1ip; Wed, 22 Jun 2022 10:22:24 +0200 (CEST)
Received: from localhost (unknown [192.168.36.68]) by zimbra2.kalray.eu
 (Postfix) with ESMTPSA id 6BB7627E04CD; Wed, 22 Jun 2022 10:22:24 +0200
 (CEST)
X-Virus-Scanned: E-securemail, by Secumail
Secumail-id: <224d.62b2d140.b4149.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 846A027E04DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1655886144;
 bh=Q32FZcoodC+c0B8IKyp95+zKNmh9DtdVkgTvHObZ7oM=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=nPbq4YpoLe6LAfGrJRS6aUxUvABBYn6s5LXpBvaMQYMz/+HGfWIXn2Rn384Q8nQPp
 feNf3bbTW6jFTonL/XouGZ/E27t2HNuOnQyszIdLDngLuXQRa9WeKUr5nca0qzlth6
 kIPja40fK5Gk3gbUQuNJjDWYyNlB8cfcokQVFiBM=
Date: Wed, 22 Jun 2022 10:22:23 +0200
From: Luc Michel <lmichel@kalray.eu>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 25/53] semihosting: Use env more often in
 do_common_semihosting
Message-ID: <20220622082223.GD28991@ws2101.lin.mbt.kalray.eu>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-26-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220607204557.658541-26-richard.henderson@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ALTERMIMEV2_out: done
Received-SPF: pass client-ip=85.31.212.34; envelope-from=lmichel@kalray.eu;
 helo=smtpout30.security-mail.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 13:45 Tue 07 Jun     , Richard Henderson wrote:
> We've already loaded cs->env_ptr into a local variable; use it.
> Since env is unconditionally used, we don't need a dummy use.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Luc Michel <lmichel@kalray.eu>

> ---
>  semihosting/arm-compat-semi.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
> index 5e442e549d..adb4e5b581 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -553,7 +553,6 @@ void do_common_semihosting(CPUState *cs)
>      GuestFD *gf;
>      int64_t elapsed;
>  
> -    (void) env; /* Used implicitly by arm lock_user macro */
>      nr = common_semi_arg(cs, 0) & 0xffffffffU;
>      args = common_semi_arg(cs, 1);
>  
> @@ -636,12 +635,12 @@ void do_common_semihosting(CPUState *cs)
>          break;
>  
>      case TARGET_SYS_WRITEC:
> -        qemu_semihosting_console_outc(cs->env_ptr, args);
> +        qemu_semihosting_console_outc(env, args);
>          common_semi_set_ret(cs, 0xdeadbeef);
>          break;
>  
>      case TARGET_SYS_WRITE0:
> -        ret = qemu_semihosting_console_outs(cs->env_ptr, args);
> +        ret = qemu_semihosting_console_outs(env, args);
>          common_semi_set_ret(cs, ret);
>          break;
>  
> @@ -672,7 +671,7 @@ void do_common_semihosting(CPUState *cs)
>          break;
>  
>      case TARGET_SYS_READC:
> -        ret = qemu_semihosting_console_inc(cs->env_ptr);
> +        ret = qemu_semihosting_console_inc(env);
>          common_semi_set_ret(cs, ret);
>          break;
>  
> -- 
> 2.34.1
> 





