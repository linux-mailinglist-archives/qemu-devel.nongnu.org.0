Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E2B55B8C0
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 10:52:04 +0200 (CEST)
Received: from localhost ([::1]:40142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5kTU-0000U1-17
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 04:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o5kK2-0006fh-PT
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 04:42:18 -0400
Received: from smtpout30.security-mail.net ([85.31.212.38]:59268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o5kK1-0003QI-0D
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 04:42:18 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx308.security-mail.net (Postfix) with ESMTP id 850977BED4D
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 10:42:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1656319335;
 bh=RjzQWzN/jPUnq8g2ndDagDbPVTZB9+q19y7hDSjo3i0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=6IE0wJdSMVQlMCrfaYmAly6U4YyIfGrAKKokhDGhIFwtgcid88Gfa9gzSoWE9pOfP
 XB58pQjolb6Tp2y+bs7Z0QqtbmDqIW0MuMzzyKxd43Ghl5RnB4AmQ2SlEO0pU71GVt
 iV67Bgk2fijHKFjJLkKNiDATCbwKd7fiecrVTLGY=
Received: from fx308 (localhost [127.0.0.1]) by fx308.security-mail.net
 (Postfix) with ESMTP id 475DA7BED42; Mon, 27 Jun 2022 10:42:15 +0200 (CEST)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx308.security-mail.net (Postfix) with ESMTPS id CF2287BED31; Mon, 27 Jun
 2022 10:42:14 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id B5E8427E04FB; Mon, 27 Jun 2022
 10:42:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id A039327E04F8; Mon, 27 Jun 2022 10:42:11 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 uZ8fIpHkjaah; Mon, 27 Jun 2022 10:42:11 +0200 (CEST)
Received: from localhost (unknown [192.168.36.68]) by zimbra2.kalray.eu
 (Postfix) with ESMTPSA id 8437727E04D6; Mon, 27 Jun 2022 10:42:11 +0200
 (CEST)
X-Virus-Scanned: E-securemail, by Secumail
Secumail-id: <4013.62b96d66.ceaf5.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu A039327E04F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1656319331;
 bh=Lj/MSEbCT7Ql8KT8X3GsKPDlOTFV3e2LUHft75EzTLI=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=FSkEmHunJI3bWGkyotPmoUtUaJkxMJm45H0tawxaCRU9+agn1TygBUSIkgxi+KuBP
 PRDXQsqEP5obIy/zBmlfkZyxA1OxMrPcFNK+mc/7rpSo0B28xTviNEjCWNIMzUuJoM
 Yy+/BqvUFk3+kZ65sdSZK/b6WxvjRySoUNa/dIjY=
Date: Mon, 27 Jun 2022 10:42:11 +0200
From: Luc Michel <lmichel@kalray.eu>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 51/53] semihosting: Use console_out_gf for SYS_WRITE0
Message-ID: <20220627084211.GG1789@ws2101.lin.mbt.kalray.eu>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-52-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220607204557.658541-52-richard.henderson@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ALTERMIMEV2_out: done
Received-SPF: pass client-ip=85.31.212.38; envelope-from=lmichel@kalray.eu;
 helo=smtpout30.security-mail.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 13:45 Tue 07 Jun     , Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Luc Michel <lmichel@kalray.eu>

> ---
>  semihosting/arm-compat-semi.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
> index dea5b2de8d..21b6bc3a0f 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -436,8 +436,15 @@ void do_common_semihosting(CPUState *cs)
>          break;
>  
>      case TARGET_SYS_WRITE0:
> -        ret = qemu_semihosting_console_outs(env, args);
> -        common_semi_set_ret(cs, ret);
> +        {
> +            ssize_t len = target_strlen(args);
> +            if (len < 0) {
> +                common_semi_dead_cb(cs, -1, EFAULT);
> +            } else {
> +                semihost_sys_write_gf(cs, common_semi_dead_cb,
> +                                      &console_out_gf, args, len);
> +            }
> +        }
>          break;
>  
>      case TARGET_SYS_WRITE:
> -- 
> 2.34.1
> 
> 
> 
> 
> To declare a filtering error, please use the following link : https://www.security-mail.net/reporter.php?mid=c4ea.629fd73d.b3ca0.0&r=lmichel%40kalrayinc.com&s=qemu-devel-bounces%2Blmichel%3Dkalrayinc.com%40nongnu.org&o=%5BPATCH+v4+51%2F53%5D+semihosting%3A+Use+console_out_gf+for+SYS_WRITE0&verdict=C&c=a15d92901bee73eeb1fb2b2232be37c9cb5356be
> 

-- 





