Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8B555B8AF
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 10:43:43 +0200 (CEST)
Received: from localhost ([::1]:54702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5kLP-00086s-0E
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 04:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o5kJm-00061v-Uo
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 04:42:02 -0400
Received: from smtpout30.security-mail.net ([85.31.212.35]:23743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o5kJl-0003Na-15
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 04:42:02 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx305.security-mail.net (Postfix) with ESMTP id 5338F30FE46
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 10:41:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1656319319;
 bh=KNYz9oI5u8Tp2WKEyCltDBKQuVb1taWM4voPKTEEtxQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=Z/6uG8LmYbkK0KNdYOql75B4Pe+NE05q7I9qyjxywB/ffeirwt3Q7JR5zji6ENmDp
 B2ZBKOFN0ARedcLJiLE5UucF76F0iraMtxzPX4qfY5jU/JF36RRgOLvtcyI1k4YIA1
 8PxrXh2k+2evCGIAu2UxIBue2jAtw8kNkOy0bPiM=
Received: from fx305 (localhost [127.0.0.1]) by fx305.security-mail.net
 (Postfix) with ESMTP id 5CB4430FE27; Mon, 27 Jun 2022 10:41:54 +0200 (CEST)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx305.security-mail.net (Postfix) with ESMTPS id A03B530FD6B; Mon, 27 Jun
 2022 10:41:53 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 27DC727E04D6; Mon, 27 Jun 2022
 10:41:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 102E727E04F8; Mon, 27 Jun 2022 10:41:53 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 kMve-M_Fl6cg; Mon, 27 Jun 2022 10:41:53 +0200 (CEST)
Received: from localhost (unknown [192.168.36.68]) by zimbra2.kalray.eu
 (Postfix) with ESMTPSA id EB76C27E04D6; Mon, 27 Jun 2022 10:41:52 +0200
 (CEST)
X-Virus-Scanned: E-securemail, by Secumail
Secumail-id: <14983.62b96d51.452a8.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 102E727E04F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1656319313;
 bh=NktoX8Cc3kkOuGtFi2aDyjd5DGEkjxj836Q8RFCfhQ0=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=cqc1qaRsLarBEfSSvgAmzp0mg55xzyh5fY/HMi8qa9aCnvoJ6ad+84S0YgF+27Dee
 Woiw8b1ICidF3YR0GVtHBgGimmXXdgk16DLVLJO4fZ2w/9UMM/aAA5ZsOQGM7AVnLX
 +7pqqvU9ANCzjMV1mMFeXCz0XelgxHG8H6XutGHI=
Date: Mon, 27 Jun 2022 10:41:52 +0200
From: Luc Michel <lmichel@kalray.eu>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 49/53] semihosting: Use console_out_gf for SYS_WRITEC
Message-ID: <20220627084152.GE1789@ws2101.lin.mbt.kalray.eu>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-50-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220607204557.658541-50-richard.henderson@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ALTERMIMEV2_out: done
Received-SPF: pass client-ip=85.31.212.35; envelope-from=lmichel@kalray.eu;
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
>  semihosting/arm-compat-semi.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
> index 4c8932ad54..dea5b2de8d 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -228,6 +228,15 @@ static void common_semi_cb(CPUState *cs, uint64_t ret, int err)
>      common_semi_set_ret(cs, ret);
>  }
>  
> +/*
> + * Use 0xdeadbeef as the return value when there isn't a defined
> + * return value for the call.
> + */
> +static void common_semi_dead_cb(CPUState *cs, uint64_t ret, int err)
> +{
> +    common_semi_set_ret(cs, 0xdeadbeef);
> +}
> +
>  /*
>   * SYS_READ and SYS_WRITE always return the number of bytes not read/written.
>   * There is no error condition, other than returning the original length.
> @@ -341,8 +350,7 @@ static const uint8_t featurefile_data[] = {
>   * The specification always says that the "return register" either
>   * returns a specific value or is corrupted, so we don't need to
>   * report to our caller whether we are returning a value or trying to
> - * leave the register unchanged. We use 0xdeadbeef as the return value
> - * when there isn't a defined return value for the call.
> + * leave the register unchanged.
>   */
>  void do_common_semihosting(CPUState *cs)
>  {
> @@ -419,8 +427,12 @@ void do_common_semihosting(CPUState *cs)
>          break;
>  
>      case TARGET_SYS_WRITEC:
> -        qemu_semihosting_console_outc(env, args);
> -        common_semi_set_ret(cs, 0xdeadbeef);
> +        /*
> +         * FIXME: the byte to be written is in a target_ulong slot,
> +         * which means this is wrong for a big-endian guest.
> +         */
> +        semihost_sys_write_gf(cs, common_semi_dead_cb,
> +                              &console_out_gf, args, 1);
>          break;
>  
>      case TARGET_SYS_WRITE0:
> -- 
> 2.34.1
> 
> 
> 
> 
> To declare a filtering error, please use the following link : https://www.security-mail.net/reporter.php?mid=1578f.629fd28e.3eb4d.0&r=lmichel%40kalrayinc.com&s=qemu-devel-bounces%2Blmichel%3Dkalrayinc.com%40nongnu.org&o=%5BPATCH+v4+49%2F53%5D+semihosting%3A+Use+console_out_gf+for+SYS_WRITEC&verdict=C&c=9f59ee0c491343fa50053073959ee288e2920868
> 

-- 





