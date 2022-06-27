Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8531955B8AD
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 10:43:33 +0200 (CEST)
Received: from localhost ([::1]:54028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5kLE-0007fv-IZ
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 04:43:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o5kJc-0005gw-FY
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 04:41:52 -0400
Received: from smtpout140.security-mail.net ([85.31.212.149]:16638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o5kJZ-0003KY-KD
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 04:41:51 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx409.security-mail.net (Postfix) with ESMTP id 9C828323817
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 10:41:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1656319307;
 bh=lxGBnPS70shzdvD2ScGnY0pN9yGy2ct4vuMhYIKr0cQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=eO9ubZxf+Alon1EB0N19K0Yqarr5RbzhcbORvZ4/BHBs3Mbl7uOikyHP6IkRXE8em
 oV8k6eupkzIUgGE3fDKwxT7KkB0FgTaenhghJvjkOXwBInlElix8pefeeUCrtCPBRS
 UyS5gqrNoNUVku++GeyIsdO6UWNJm8hBj8jaz11w=
Received: from fx409 (localhost [127.0.0.1]) by fx409.security-mail.net
 (Postfix) with ESMTP id 441713237ED; Mon, 27 Jun 2022 10:41:47 +0200 (CEST)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx409.security-mail.net (Postfix) with ESMTPS id 748BC3237DF; Mon, 27 Jun
 2022 10:41:46 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 5661627E04D6; Mon, 27 Jun 2022
 10:41:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 4017C27E04F8; Mon, 27 Jun 2022 10:41:46 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 et6PAliN3sbl; Mon, 27 Jun 2022 10:41:46 +0200 (CEST)
Received: from localhost (unknown [192.168.36.68]) by zimbra2.kalray.eu
 (Postfix) with ESMTPSA id 2817627E04D6; Mon, 27 Jun 2022 10:41:46 +0200
 (CEST)
X-Virus-Scanned: E-securemail, by Secumail
Secumail-id: <15137.62b96d4a.72b4b.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 4017C27E04F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1656319306;
 bh=e1veSLpgpRiExtj9vRQW9xD2mrluv8pk/qveK+/nEss=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=DVpuwneYPMLbbyUY7GA0mldhYOJYF2g5qw8tUrKIiDewSfpkQgmnLSBldupqAHbQQ
 2VLNgei6qiJhXThkbGLh+SmcFqm4cPv8y0ftUqXmN77/74PPqb8QqyzjVYdyLsNTJY
 ACo4OLdBpajNzPmFm5oQaljpymXRisfD2HvDYJWs=
Date: Mon, 27 Jun 2022 10:41:45 +0200
From: Luc Michel <lmichel@kalray.eu>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 48/53] semihosting: Use console_in_gf for SYS_READC
Message-ID: <20220627084145.GD1789@ws2101.lin.mbt.kalray.eu>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-49-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220607204557.658541-49-richard.henderson@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ALTERMIMEV2_out: done
Received-SPF: pass client-ip=85.31.212.149; envelope-from=lmichel@kalray.eu;
 helo=smtpout140.security-mail.net
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
>  semihosting/arm-compat-semi.c | 27 ++++++++++++++++++---------
>  1 file changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
> index 20e99cdcc0..4c8932ad54 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -302,6 +302,22 @@ common_semi_flen_fstat_cb(CPUState *cs, uint64_t ret, int err)
>      common_semi_cb(cs, ret, err);
>  }
>  
> +static void
> +common_semi_readc_cb(CPUState *cs, uint64_t ret, int err)
> +{
> +    if (!err) {
> +        CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
> +        uint8_t ch;
> +
> +        if (get_user_u8(ch, common_semi_stack_bottom(cs) - 1)) {
> +            ret = -1, err = EFAULT;
> +        } else {
> +            ret = ch;
> +        }
> +    }
> +    common_semi_cb(cs, ret, err);
> +}
> +
>  #define SHFB_MAGIC_0 0x53
>  #define SHFB_MAGIC_1 0x48
>  #define SHFB_MAGIC_2 0x46
> @@ -427,15 +443,8 @@ void do_common_semihosting(CPUState *cs)
>          break;
>  
>      case TARGET_SYS_READC:
> -        {
> -            uint8_t ch;
> -            int ret = qemu_semihosting_console_read(cs, &ch, 1);
> -            if (ret == 1) {
> -                common_semi_cb(cs, ch, 0);
> -            } else {
> -                common_semi_cb(cs, -1, EIO);
> -            }
> -        }
> +        semihost_sys_read_gf(cs, common_semi_readc_cb, &console_in_gf,
> +                             common_semi_stack_bottom(cs) - 1, 1);
>          break;
>  
>      case TARGET_SYS_ISERROR:
> -- 
> 2.34.1
> 
> 
> 
> 
> To declare a filtering error, please use the following link : https://www.security-mail.net/reporter.php?mid=1799d.629fd6b1.98b43.0&r=lmichel%40kalrayinc.com&s=qemu-devel-bounces%2Blmichel%3Dkalrayinc.com%40nongnu.org&o=%5BPATCH+v4+48%2F53%5D+semihosting%3A+Use+console_in_gf+for+SYS_READC&verdict=C&c=b9cfba5cbbf5d995e5235734d7ab1a5181b14825
> 

-- 





